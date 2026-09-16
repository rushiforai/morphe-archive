package app.braintropy.patches.tracearr

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.braintropy.patches.shared.Constants.COMPATIBILITY_TRACEARR

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

private fun org.w3c.dom.Node.attr(name: String) =
    attributes.getNamedItemNS(ANDROID_NS, name) ?: attributes.getNamedItem("android:$name")

@Suppress("unused")
val disableOtaUpdatesPatch = resourcePatch(
    name = "Disable OTA updates",
    description = "Disables expo-updates: the app no longer contacts the Expo update server " +
        "(u.expo.dev) on launch and can never download or run over-the-air JavaScript updates " +
        "published by the developer.",
    default = true
) {
    category("Updates")
    compatibleWith(COMPATIBILITY_TRACEARR)

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
            if (patched == 0) throw PatchException("expo.modules.updates meta-data not found in AndroidManifest.xml")
        }
    }
}
