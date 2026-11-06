package app.badfella.patches.wanderlog

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

// Adapted from arandomhooman/hoomans-morphe-patches (GPLv3); see NOTICE.
// HBC98 inlines the original tier resolver into six functions in the reviewed builds.
@Suppress("unused")
val wanderlogProPatch = resourcePatch(
    name = "Wanderlog Pro features",
    description = "Enables local Pro feature checks, removes subscription prompts and auto-opening paywalls, hides the home Pro star, labels the profile button Pro Activated and brands the billing screen. Makes the app theme follow the device dark-mode setting, because the app's own dark mode entry is Pro-only and the preference is set by Wanderlog's servers on subscription. Keeps the patched bundle in place by disabling Expo OTA updates. Does not grant server-run AI, downloads, flight tracking, Google Maps export or a subscription.",
) {
    compatibleWith(Compatibility(
        name = "Wanderlog", packageName = "com.wanderlog.android", apkFileType = ApkFileType.APKM,
        appIconColor = 0xF75940,
    ))
    execute {
        val bundle = get("assets/index.android.bundle")
        bundle.writeBytes(patchWanderlogBundle(bundle.readBytes()))
        document("AndroidManifest.xml").use { doc ->
            val nodes = doc.getElementsByTagName("meta-data")
            val metadata = (0 until nodes.length).mapNotNull { nodes.item(it) as? Element }
            val enabled = metadata.single { it.getAttribute("android:name") == "expo.modules.updates.ENABLED" }
            check(enabled.getAttribute("android:value") == "true") { "Wanderlog Expo configuration changed" }
            enabled.setAttribute("android:value", "false")
            metadata.single { it.getAttribute("android:name") == "expo.modules.updates.EXPO_UPDATE_URL" }
                .setAttribute("android:value", "")
        }
    }
}
