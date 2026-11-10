package app.mightymorphing.patches.joey

import app.mightymorphing.patches.shared.Constants.JOEY
import app.mightymorphing.patches.shared.insertAt
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.ResourcePatch
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

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

        // Android 12 draws the launcher icon before any code runs. A blank icon keeps that frame empty.
        val blank = resDir.resolve("drawable/morphe_splash_blank.xml")
        blank.parentFile?.mkdirs()
        blank.writeText(
            """
            <?xml version="1.0" encoding="utf-8"?>
            <vector xmlns:android="http://schemas.android.com/apk/res/android"
                android:width="108dp"
                android:height="108dp"
                android:viewportWidth="108"
                android:viewportHeight="108">
                <path android:pathData="M0,0h108v108h-108z" android:fillColor="#00000000" />
            </vector>
            """.trimIndent(),
        )
        document("res/values/styles.xml").use { styles ->
            val nodes = styles.getElementsByTagName("style")
            var found = false
            for (index in 0 until nodes.length) {
                val style = nodes.item(index) as Element
                if (style.getAttribute("name") != "baseThemeLight.Splash") continue
                found = true
                listOf(
                    "android:windowSplashScreenBackground" to "@color/splash",
                    "android:windowSplashScreenAnimatedIcon" to "@drawable/morphe_splash_blank",
                    "android:windowSplashScreenIconBackgroundColor" to "@android:color/transparent",
                    "android:windowSplashScreenAnimationDuration" to "0",
                ).forEach { (name, value) ->
                    val item = styles.createElement("item")
                    item.setAttribute("name", name)
                    item.textContent = value
                    style.appendChild(item)
                }
            }
            if (!found) error("Joey splash theme was not found")
        }
    }
}

@Suppress("unused")
val splashScreenPatch: BytecodePatch = bytecodePatch(
    name = "Splash Screen",
    description = "[v1.3.5: Animation can be turned off] Logo inspired by u/otheast. Animation and colours are fully customisable in Joey Settings - Morphe Settings.",
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
