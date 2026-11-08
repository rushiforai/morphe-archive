package app.braintropy.patches.all.expo

import app.morphe.patcher.patch.resourcePatch
import java.util.logging.Logger

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

private fun org.w3c.dom.Node.attr(name: String) =
    attributes.getNamedItemNS(ANDROID_NS, name) ?: attributes.getNamedItem("android:$name")

@Suppress("unused")
val disableOtaUpdatesPatch = resourcePatch(
    name = "Disable Expo OTA updates",
    description = "Blocks over-the-air JavaScript updates in Expo apps.",
    default = false
) {
    category("Updates")

    execute {
        document("AndroidManifest.xml").use { document ->
            val metaData = document.getElementsByTagName("meta-data")
            var patched = 0
            for (i in 0 until metaData.length) {
                val node = metaData.item(i)
                when (node.attr("name")?.nodeValue) {
                    "expo.modules.updates.ENABLED",
                    "expo.modules.updates.ENABLE_BSDIFF_PATCH_SUPPORT" -> {
                        node.attr("value")?.nodeValue = "false"
                        patched++
                    }
                }
            }
            if (patched == 0) Logger.getLogger(this::class.java.name)
                .warning("expo.modules.updates meta-data not found in AndroidManifest.xml. No changes applied.")
        }
    }
}
