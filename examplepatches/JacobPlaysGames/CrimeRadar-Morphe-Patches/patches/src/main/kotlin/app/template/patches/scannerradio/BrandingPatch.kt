package app.template.patches.scannerradio

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SCANNERRADIO
import java.io.File

/**
 * Changes the app name to "Scanner Radio+" and tints the launcher icon background
 * to a distinctive blue, making the patched version easy to identify
 * when installed alongside the original.
 *
 * Scanner Radio uses PNG mipmaps for its adaptive icon (ic_background.png,
 * ic_foreground.png) referenced by res/mipmap/ic_launcher_mipmap.xml, NOT
 * XML vector drawables like CrimeRadar. So we replace the PNG background
 * reference with a new XML vector drawable we write to res/drawable/.
 */
@Suppress("unused")
val brandingPatch = resourcePatch(
    name = "Branding",
    description = "Changes app name to 'Scanner Radio+' and tints the icon for easy identification.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SCANNERRADIO)

    finalize {
        // Change app name: "Scanner Radio" -> "Scanner Radio+"
        document("res/values/strings.xml").use { doc ->
            val stringNodes = doc.getElementsByTagName("string")
            for (i in 0 until stringNodes.length) {
                val elem = stringNodes.item(i) as? org.w3c.dom.Element ?: continue
                if (elem.getAttribute("name") == "app_name") {
                    elem.textContent = "Scanner Radio+"
                    break
                }
            }
        }

        // Scanner Radio uses PNG mipmaps (not XML vectors) for the adaptive icon.
        // Strategy: create a solid blue XML vector drawable and rewrite
        // ic_launcher_mipmap.xml to reference it instead of the PNG background.
        val drawableDir = File("res/drawable")
        if (!drawableDir.exists()) drawableDir.mkdirs()

        // Blue background vector matching Scanner Radio's brand blue (#1565C0)
        File(drawableDir, "ic_launcher_background_tinted.xml").writeText(
            """
            |<?xml version="1.0" encoding="utf-8"?>
            |<vector xmlns:android="http://schemas.android.com/apk/res/android"
            |    android:height="108dp"
            |    android:width="108dp"
            |    android:viewportWidth="108"
            |    android:viewportHeight="108">
            |    <path
            |        android:fillColor="#FF1565C0"
            |        android:pathData="M0,0h108v108H0z"/>
            |</vector>
            """.trimMargin()
        )

        // Rewrite the adaptive icon to reference our tinted vector instead of PNG mipmap
        document("res/mipmap/ic_launcher_mipmap.xml").use { doc ->
            val backgroundNode = doc.getElementsByTagName("background").item(0)
                as? org.w3c.dom.Element ?: return@use
            backgroundNode.setAttribute(
                "android:drawable",
                "@drawable/ic_launcher_background_tinted"
            )
        }
    }
}
