package app.template.patches.clipstudio

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_CLIP_STUDIO
import org.w3c.dom.Element

val cspAndroid12ResourcePatch = resourcePatch(
    name = "Clip Studio Paint Android 12 Resources",
    description = "Fixes AndroidManifest.xml and XML drawables for Android 12 compatibility."
) {
    compatibleWith(COMPATIBILITY_CLIP_STUDIO)

    execute {
        // 1. AndroidManifest.xml: set minSdkVersion to 31
        document("AndroidManifest.xml").use { doc ->
            val usesSdkNodes = doc.getElementsByTagName("uses-sdk")
            if (usesSdkNodes.length > 0) {
                (usesSdkNodes.item(0) as? Element)?.setAttribute("android:minSdkVersion", "31")
            } else {
                val usesSdk = doc.createElement("uses-sdk").apply {
                    setAttribute("android:minSdkVersion", "31")
                }
                doc.documentElement.appendChild(usesSdk)
            }
        }

        // 2. res/layout/edge_keyboard.xml: remove touchkey_*_level src that crashes LevelListDrawable on Android 12
        runCatching {
            document("res/layout/edge_keyboard.xml").use { doc ->
                val elements = doc.getElementsByTagName("ImageView")
                for (i in 0 until elements.length) {
                    val img = elements.item(i) as? Element ?: continue
                    val src = img.getAttribute("android:src")
                    if (src.contains("touchkey_")) {
                        img.setAttribute("android:src", "@null")
                    }
                }
            }
        }

        // 3. res/drawable/touchkey_*_level.xml: replace @null with @android:color/transparent
        val touchkeyFiles = listOf(
            "res/drawable/touchkey_alt_level.xml",
            "res/drawable/touchkey_control_level.xml",
            "res/drawable/touchkey_shift_level.xml",
            "res/drawable/touchkey_space_level.xml"
        )
        for (file in touchkeyFiles) {
            runCatching {
                document(file).use { doc ->
                    val items = doc.getElementsByTagName("item")
                    for (i in 0 until items.length) {
                        val item = items.item(i) as? Element ?: continue
                        if (item.getAttribute("android:drawable") == "@null") {
                            item.setAttribute("android:drawable", "@android:color/transparent")
                        }
                    }
                }
            }
        }
    }
}
