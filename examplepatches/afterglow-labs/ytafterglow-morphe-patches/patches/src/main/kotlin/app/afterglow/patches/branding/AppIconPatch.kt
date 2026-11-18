package app.afterglow.patches.branding

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/** Uses Afterglow's supplied artwork without importing upstream branding assets. */
internal val afterglowAppIconResourcesPatch = resourcePatch {
    execute {
        for (path in listOf(
            "drawable-nodpi/afterglow_launcher_artwork.png",
            "mipmap-anydpi/afterglow_launcher.xml",
            "mipmap-anydpi-v26/afterglow_launcher.xml",
        )) {
            val target = get("res/$path")
            target.parentFile.mkdirs()
            val input = requireNotNull(object {}.javaClass.getResourceAsStream("/afterglow/branding/$path")) {
                "Missing Afterglow icon resource: $path"
            }
            input.use { source -> target.outputStream().use(source::copyTo) }
        }

        document("AndroidManifest.xml").use { document ->
            fun Element.useAfterglowIcon() {
                setAttribute("android:icon", "@mipmap/afterglow_launcher")
                setAttribute("android:roundIcon", "@mipmap/afterglow_launcher")
            }

            (document.getElementsByTagName("application").item(0) as Element).useAfterglowIcon()
            // YouTube also declares explicit icons on its alternative launcher
            // aliases. Keep their enabled state and intents, but use the same
            // artwork even if a saved alias is active after an upgrade.
            for (tag in listOf("activity", "activity-alias")) {
                val components = document.getElementsByTagName(tag)
                for (index in 0 until components.length) {
                    val component = components.item(index) as Element
                    val categories = component.getElementsByTagName("category")
                    if ((0 until categories.length).any {
                        (categories.item(it) as Element).getAttribute("android:name") ==
                            "android.intent.category.LAUNCHER"
                    }) component.useAfterglowIcon()
                }
            }
        }
    }
}
