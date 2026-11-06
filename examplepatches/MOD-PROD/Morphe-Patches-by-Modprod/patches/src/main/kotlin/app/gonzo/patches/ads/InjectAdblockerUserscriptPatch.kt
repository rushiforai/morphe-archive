package app.gonzo.patches.ads

import app.gonzo.patches.shared.Constants.COMPATIBILITY_TIZENTUBE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import java.io.File
import java.util.logging.Logger

private const val EXTENSION_CLASS = "Lapp/gonzo/extension/adblock/CobaltUserscriptInjector;"

/** Bundled userscript inside the .mpp (patches/src/main/resources/tizentube/userscript/). */
private const val BUNDLED_USERSCRIPT = "/tizentube/userscript/adblock.user.js"

/** Where the script is written inside the APK. Must match CobaltUserscriptInjector.USERSCRIPT_ASSET. */
private const val USERSCRIPT_ASSET_PATH = "assets/tizentube-mod/adblock.user.js"

/** Pre-filled path of a custom userscript on the patching device (phone running Morphe Manager). */
private const val DEFAULT_USERSCRIPT_FILE = "/storage/emulated/0/Download/adblock.user.js"

private object UserscriptResources

/**
 * Injects a JavaScript userscript into the YouTube TV web app (youtube.com/tv) that Cobalt runs.
 *
 * TizenTube Cobalt has no native ad code to patch: ads are delivered and scheduled by the web app.
 * So the patch adds back the missing Java caller of Cobalt's JS injection path
 * (see CobaltUserscriptInjector):
 *
 *  1. Resource step: the userscript is written to assets/tizentube-mod/adblock.user.js.
 *     The bundled script blocks ads and sponsored tiles and keeps the playback speed; the
 *     "userscriptFile" option can point to your own .js (used only if the file exists).
 *  2. Bytecode step: CobaltActivity.onCreate() calls CobaltUserscriptInjector.schedule(this),
 *     which waits for the page and calls the registered evaluateJavaScript native.
 *
 * TizenTube's own userscript keeps running; this script only adds an extra ad-stripping layer.
 */
@Suppress("unused")
val injectAdblockerUserscriptPatch = bytecodePatch(
    name = "Inject Adblocker Userscript",
    description = "Injects a JavaScript userscript into the YouTube TV web app running in Cobalt. " +
        "The script removes ad placements from InnerTube responses before the app reads them.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIZENTUBE)

    val userscriptFile by stringOption(
        key = "userscriptFile",
        default = DEFAULT_USERSCRIPT_FILE,
        values = mapOf(
            DEFAULT_USERSCRIPT_FILE to DEFAULT_USERSCRIPT_FILE,
            "Bundled script" to "",
        ),
        title = "Custom userscript file",
        description = "Absolute path to a .js file on the patching device. If the file does not exist, " +
            "the bundled script (ad blocker, sponsored tiles, playback speed keeper) is used.",
        required = false,
    )

    // 1. Ship the userscript as an asset.
    dependsOn(
        resourcePatch {
            execute {
                val logger = Logger.getLogger("InjectAdblockerUserscriptPatch")
                val customFile = userscriptFile?.trim()?.takeIf { it.isNotEmpty() }?.let(::File)

                // Custom file if present, otherwise the bundled script (no failure on a missing file,
                // so the pre-filled path is safe to keep).
                val script: ByteArray = if (customFile != null && customFile.isFile) {
                    logger.info("Using custom userscript: ${customFile.path}")
                    customFile.readBytes()
                } else {
                    if (customFile != null) logger.info("${customFile.path} not found, using the bundled script")
                    UserscriptResources::class.java.getResourceAsStream(BUNDLED_USERSCRIPT)?.use { it.readBytes() }
                        ?: throw PatchException("Bundled userscript missing: $BUNDLED_USERSCRIPT")
                }

                // copy = false: this is a new file, nothing to decode from the input APK.
                get(USERSCRIPT_ASSET_PATH, copy = false).apply {
                    parentFile.mkdirs()
                    writeBytes(script)
                }
            }
        },
    )

    // 2. Add the injector.
    extendWith("extensions/extension.mpe")

    execute {
        // Fail loudly if the seam is gone instead of producing a silently dead build.
        GetActiveWebContentsFingerprint.method

        // invoke-static/range works with any register number (p0 can be above v15 in big methods).
        // schedule() only posts a delayed Runnable, so running before super.onCreate() is safe.
        CobaltActivityOnCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->schedule(Landroid/app/Activity;)V
            """,
        )
    }
}
