package patches.shared

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/** Add the control API only when navigation sharing is selected; keep native services private. */
internal fun navigationStartupResources(namespace: String, warningRecovery: Boolean = false) = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val root = manifest.documentElement
            val permissions = manifest.getElementsByTagName("uses-permission").let { nodes ->
                (0 until nodes.length).map { (nodes.item(it) as Element).getAttribute("android:name") }.toSet()
            }
            for (permission in listOf("android.permission.FOREGROUND_SERVICE", "android.permission.FOREGROUND_SERVICE_LOCATION")) {
                if (permission !in permissions) root.appendChild(manifest.createElement("uses-permission").apply { setAttribute("android:name", permission) })
            }
            val app = manifest.getElementsByTagName("application").item(0) as Element
            val lifecycle = "nl.johninnl.navigation.startup.ProviderLifecycle"
            check((0 until app.getElementsByTagName("provider").length).none {
                (app.getElementsByTagName("provider").item(it) as Element).getAttribute("android:name") == lifecycle
            }) { "Navigation lifecycle provider already declared" }
            app.appendChild(manifest.createElement("provider").apply {
                setAttribute("android:name", lifecycle)
                setAttribute("android:authorities", root.getAttribute("package") + ".morphe.navigation.lifecycle")
                setAttribute("android:exported", "false")
            })
            if(warningRecovery){
                check((0 until app.getElementsByTagName("activity").length).none{(app.getElementsByTagName("activity").item(it) as Element).getAttribute("android:name")=="$namespace.WarningRecoveryActivity"})
                app.appendChild(manifest.createElement("activity").apply{setAttribute("android:name","$namespace.WarningRecoveryActivity");setAttribute("android:exported","false")})
            }
            for ((name, exported) in listOf("NavigationControlService" to true, "NavigationEngineService" to false)) {
                check((0 until app.getElementsByTagName("service").length).none {
                    (app.getElementsByTagName("service").item(it) as Element).getAttribute("android:name") == "$namespace.$name"
                }) { "Navigation startup service already declared" }
                app.appendChild(manifest.createElement("service").apply {
                    setAttribute("android:name", "$namespace.$name")
                    setAttribute("android:exported", exported.toString())
                    if (!exported) setAttribute("android:foregroundServiceType", "location")
                })
            }
        }
    }
}
