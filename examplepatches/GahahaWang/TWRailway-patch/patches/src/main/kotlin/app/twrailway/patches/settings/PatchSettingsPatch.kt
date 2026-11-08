package app.twrailway.patches.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.twrailway.patches.shared.Constants.COMPATIBILITY_TRAIN_SCHEDULE
import java.util.logging.Logger

internal const val EXTENSION_PACKAGE = "Lapp/twrailway/extension"
internal const val PATCH_SETTINGS_CLASS = "$EXTENSION_PACKAGE/PatchSettings;"
private const val PATCH_SETTINGS_ENTRY_CLASS = "$EXTENSION_PACKAGE/PatchSettingsEntry;"

/**
 * Renames the "廣告設定" (ad settings) item in the 設定 section of the drawer to "修補設定".
 * Opening its page opens the patch settings instead, see `PatchSettingsEntry` in the extension.
 *
 * The drawer is Dart code AOT compiled to `libapp.so`, so a new item cannot be added to it.
 * Its translations are strings in the snapshot, serialized as a length byte
 * (`0x80 | length << 1 | isTwoByte`) followed by the characters (Latin-1 or UTF-16LE), and are
 * replaced in place by strings of the same length.
 */
private val drawerEntryLabelPatch = rawResourcePatch {
    execute {
        val libraries = listApkEntries("lib/").filter { it.endsWith("/libapp.so") }
        libraries.forEach { path ->
            val file = get(path)
            val bytes = file.readBytes()
            var replaced = 0
            DRAWER_LABELS.forEach { (original, replacement) ->
                replaced += bytes.replaceSnapshotString(original, replacement)
            }
            if (replaced == 0) {
                logger.warning("Could not find the ad settings label in $path, the drawer item is not renamed")
                return@forEach
            }
            file.writeBytes(bytes)
        }
    }
}

@Suppress("unused")
val patchSettingsPatch = bytecodePatch(
    name = "Patch settings",
    description = "Adds a \"修補設定\" page to turn the other patches on or off and adjust them while the app runs. " +
        "It replaces the \"廣告設定\" item in the drawer's 設定 section, and is also a shortcut on the app icon.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRAIN_SCHEDULE)

    dependsOn(drawerEntryLabelPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // Load the settings and set up the drawer entry and the app shortcut before Flutter starts.
        FlutterLoaderEnsureInitializationCompleteFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $PATCH_SETTINGS_CLASS->init(Landroid/content/Context;)V
            """,
        )

        // Open the patch settings when the app navigates to the ad settings page.
        DartMessengerHandleMessageFromDartFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p2 }, $PATCH_SETTINGS_ENTRY_CLASS->onMessageFromDart(Ljava/lang/String;Ljava/nio/ByteBuffer;)V
            """,
        )
    }
}

/**
 * Lists the patch [key] as applied, so the patch settings page shows its settings.
 * The keys are the constants of `PatchSettings` in the extension.
 */
internal fun BytecodePatchContext.markPatchApplied(key: String) {
    val method = mutableClassDefBy(PATCH_SETTINGS_CLASS).methods.singleOrNull { method ->
        method.name == "registerAppliedPatches"
    } ?: throw PatchException("Could not find $PATCH_SETTINGS_CLASS->registerAppliedPatches")
    if ((method.implementation?.registerCount ?: 0) < 1) {
        throw PatchException("$PATCH_SETTINGS_CLASS->registerAppliedPatches has no free register")
    }

    method.addInstructions(
        0,
        """
            const-string v0, "$key"
            invoke-static { v0 }, $PATCH_SETTINGS_CLASS->markApplied(Ljava/lang/String;)V
        """,
    )
}

private val logger = Logger.getLogger("PatchSettingsPatch")

/** Drawer labels of the ad settings item and their replacements, which must be as long. */
private val DRAWER_LABELS = listOf(
    "廣告設定" to "修補設定",
    "Ad settings" to "Patch prefs",
)

/**
 * Replaces every serialized snapshot string [original] with [replacement] and returns how many
 * were replaced.
 */
private fun ByteArray.replaceSnapshotString(original: String, replacement: String): Int {
    require(original.length == replacement.length && original.length < 64)
    val twoByte = original.any { it.code > 0xff } || replacement.any { it.code > 0xff }
    val charset = if (twoByte) Charsets.UTF_16LE else Charsets.ISO_8859_1
    val header = (0x80 or (original.length shl 1) or (if (twoByte) 1 else 0)).toByte()
    val pattern = byteArrayOf(header) + original.toByteArray(charset)
    val replacementBytes = byteArrayOf(header) + replacement.toByteArray(charset)

    var count = 0
    var i = 0
    while (i <= size - pattern.size) {
        if (matchesAt(i, pattern)) {
            replacementBytes.copyInto(this, i)
            count++
            i += pattern.size
        } else {
            i++
        }
    }
    return count
}

private fun ByteArray.matchesAt(offset: Int, pattern: ByteArray): Boolean {
    for (j in pattern.indices) {
        if (this[offset + j] != pattern[j]) return false
    }
    return true
}
