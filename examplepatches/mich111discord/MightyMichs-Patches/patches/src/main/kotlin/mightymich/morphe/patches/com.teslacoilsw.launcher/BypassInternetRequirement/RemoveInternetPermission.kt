package mightymich.morphe.patches.com.teslacoilsw.launcher

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private val NETWORK_COMPONENTS = setOf(
    "com.google.firebase.messaging.FirebaseMessagingService",
    "com.google.firebase.iid.FirebaseInstanceIdReceiver",
    "com.google.android.gms.measurement.AppMeasurementService",
    "com.google.android.gms.measurement.AppMeasurementReceiver",
    "com.google.android.gms.measurement.AppMeasurementJobService",
)

@Suppress("unused")
val removeInternetPermissionPatch = resourcePatch(
    name = "Remove Internet permission (Nova)",
    description = "Removes INTERNET permission from Nova Launcher and disables network-only entry points so Nova does not crash.",
    default = true
) {
    compatibleWith(NovaLauncherCompatibility.NOVA_LAUNCHER)

    execute {
        document("AndroidManifest.xml").use { dom ->
            val root = dom.documentElement

            val toRemove = mutableListOf<Element>()
            for (tag in listOf("uses-permission", "uses-permission-sdk-23")) {
                val nodes = root.getElementsByTagName(tag)
                for (i in 0 until nodes.length) {
                    val e = nodes.item(i) as Element
                    if (e.getAttribute("android:name") == "android.permission.INTERNET") {
                        toRemove += e
                    }
                }
            }
            toRemove.forEach { it.parentNode.removeChild(it) }

            for (tag in listOf("service", "receiver")) {
                val nodes = root.getElementsByTagName(tag)
                for (i in 0 until nodes.length) {
                    val e = nodes.item(i) as Element
                    if (e.getAttribute("android:name") in NETWORK_COMPONENTS) {
                        e.setAttribute("android:enabled", "false")
                    }
                }
            }
        }
    }
}
