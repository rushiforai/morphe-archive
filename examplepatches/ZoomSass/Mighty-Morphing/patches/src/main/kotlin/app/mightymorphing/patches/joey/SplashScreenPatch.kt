package app.mightymorphing.patches.joey

import app.mightymorphing.patches.shared.Constants.JOEY
import app.mightymorphing.patches.shared.insertAt
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.ResourcePatch
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

/**
 * Internal resource patch that injects the fan-made Teal Koala (by u/otheast) into Joey's
 * internal splash icon resource (res/pK.png, ID 0x7f080397).
 * Kept nameless so Morphe Manager only displays the single user-facing patch.
 */
private val splashResourcePatch: ResourcePatch = resourcePatch {
    compatibleWith(JOEY)

    execute {
        val resDir = get("res")

        // 1. Overwrite Joey's obfuscated splash icon (res/pK.png) with the Teal Koala
        val pKStream = this::class.java.classLoader.getResourceAsStream("splash/drawable-xxxhdpi/splash_icon.png")
        if (pKStream != null) {
            val target = resDir.resolve("pK.png")
            target.parentFile?.mkdirs()
            pKStream.use { input -> target.outputStream().use { output -> input.copyTo(output) } }
        }

        // 2. Also populate standard drawable density paths for robust fallback
        val densities = listOf("xxxhdpi", "xxhdpi", "xhdpi", "hdpi", "mdpi")
        for (d in densities) {
            val stream = this::class.java.classLoader.getResourceAsStream("splash/drawable-$d/splash_icon.png")
            if (stream != null) {
                val target = resDir.resolve("drawable-$d/splash_icon.png")
                target.parentFile?.mkdirs()
                stream.use { input -> target.outputStream().use { output -> input.copyTo(output) } }
            }
        }

        val defStream = this::class.java.classLoader.getResourceAsStream("splash/drawable-xxxhdpi/splash_icon.png")
        if (defStream != null) {
            val targetDef = resDir.resolve("drawable/splash_icon.png")
            targetDef.parentFile?.mkdirs()
            defStream.use { input -> targetDef.outputStream().use { output -> input.copyTo(output) } }
        }
    }
}

@Suppress("unused")
val splashScreenPatch: BytecodePatch = bytecodePatch(
    name = "Splash Screen",
    description = "Logo inspired by u/otheast. Animation and colours are fully customisable in Joey Settings - Morphe Settings.",
    default = true,
) {
    compatibleWith(JOEY)

    dependsOn(splashResourcePatch)
    extendWith("extensions/extension.mpe")

    execute {
        HomeActivityOnCreateFingerprint.method.insertAt(
            0,
            """
            const-string v0, "linear"
            invoke-static {p0, v0}, Lapp/mightymorphing/extension/joey/MorpheSplash;->init(Landroid/app/Activity;Ljava/lang/String;)V
            """,
        )
    }
}
