package app.tvpatches.patches.youtubetv.layout.branding

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.listDecodableFiles
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.returnEarly
import app.tvpatches.patches.youtubetv.misc.gms.CobaltActivityOnCreateFingerprint
import app.tvpatches.patches.youtubetv.misc.gms.youtubeTvExtensionPatch
import app.tvpatches.patches.youtubetv.shared.Constants.COMPATIBILITY_YOUTUBE_TV

private const val DEFAULT_APP_NAME = "FaroTV"

/** Images bundled in resources/youtubetv/branding, at the same paths as in the app's res folder. */
private val IMAGES = listOf(
    "mipmap-mdpi/ic_launcher.png", "mipmap-hdpi/ic_launcher.png", "mipmap-xhdpi/ic_launcher.png",
    "mipmap-xxhdpi/ic_launcher.png", "mipmap-xxxhdpi/ic_launcher.png",
    "mipmap-mdpi/ic_app.png", "mipmap-hdpi/ic_app.png", "mipmap-xhdpi/ic_app.png",
    "drawable/app_banner.png", "drawable/tv_channel_logo.png",
)

internal object BrandingNameFingerprint : Fingerprint(
    definingClass = "Lapp/tvpatches/extension/youtubetv/TvScripts;",
    name = "getBrandingName",
)

private const val SPLASH_CLASS = "Lapp/tvpatches/extension/youtubetv/SplashOverlay;"

internal object HideSplashScreenFingerprint : Fingerprint(
    definingClass = "Ldev/cobalt/coat/StarboardBridge;",
    name = "hideSplashScreen",
    returnType = "V",
    parameters = listOf(),
)

private fun appName(): String =
    (customBrandingPatch.options["appName"].value as String?)?.trim()?.ifEmpty { null } ?: DEFAULT_APP_NAME

private val brandingResourcePatch = resourcePatch {
    execute {
        val name = appName()

        // The launcher picks the app name in the device language, so the translations of
        // app_name are removed and only the default one is kept.
        listDecodableFiles("res/values*/strings.xml").forEach { path ->
            resourceXml(path).use { strings ->
                val entry = strings.root.elementByAttributeOrNull("name", "app_name") ?: return@use
                if (path == "res/values/strings.xml") entry.text = name else entry.remove()
            }
        }
        resourceXml("res/values/strings.xml").use { strings ->
            strings.root.elementByAttributeOrNull("name", "standalone_player_activity_name")?.text = "$name Player"
        }

        // Turn off Cobalt's built-in splash (YouTube logo); SplashOverlay shows FaroTV's instead.
        resourceXml("AndroidManifest.xml").use { manifest ->
            manifest.root.elements("meta-data")
                .filter { it.attribute("android:name") == "cobalt.ENABLE_SPLASH_SCREEN" }
                .forEach { it.setAttribute("android:value", "false") }
        }

        IMAGES.forEach { image ->
            val bundled = object {}.javaClass.classLoader.getResourceAsStream("youtubetv/branding/$image")
                ?: throw IllegalStateException("Bundled image $image missing")
            val target = resourceFile("res/$image", false)
            target.parentFile.mkdirs()
            bundled.use { input -> target.outputStream().use { input.copyTo(it) } }
        }
    }
}

/**
 * Replaces the launcher name, the launcher icons, the Android TV banner, the recommendations
 * channel logo and the wordmark inside the app (branding.js) with FaroTV's.
 *
 * Artwork: branding/ (SVG sources and render.py).
 */
@Suppress("unused")
val customBrandingPatch = bytecodePatch(
    name = "Custom branding",
    description = "Changes the app name, icon, TV banner and the logo inside the app to FaroTV's (or another name).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_TV)
    dependsOn(youtubeTvExtensionPatch, brandingResourcePatch)

    stringOption(
        key = "appName",
        default = DEFAULT_APP_NAME,
        values = mapOf("FaroTV" to DEFAULT_APP_NAME),
        title = "App name",
        description = "The name shown in the TV launcher and at the top of the app.",
        required = true,
    )

    execute {
        BrandingNameFingerprint.method.returnEarly(appName())

        // Show the FaroTV splash as soon as the activity is created (its own window, so it does
        // not depend on Cobalt's views).
        CobaltActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $SPLASH_CLASS->show(Landroid/app/Activity;)V",
        )
        // Hide it when the web app says it is ready.
        HideSplashScreenFingerprint.method.addInstruction(0, "invoke-static { }, $SPLASH_CLASS->hide()V")
    }
}
