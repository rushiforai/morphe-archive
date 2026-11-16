package app.morphe.patches.xiaomi.earbuds

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.Constants
import app.morphe.patches.shared.replaceWithReturnBoolean
import app.morphe.patches.shared.replaceWithReturnVoid
import org.w3c.dom.Element

private val xiaomiEarbudsBackgroundResourcePatch = resourcePatch(
    name = "Stop Background Activity (Setup)",
    description = "Turns off background services in the manifest.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY_XIAOMI_EARBUDS)

    execute {
        val manifestFile = get("AndroidManifest.xml")
        if (!manifestFile.exists()) {
            println("[Stop Background Activity (Setup)] AndroidManifest.xml not found - skipping manifest purge.")
            return@execute
        }

        val blockedPermissions = setOf(
            "android.permission.REQUEST_COMPANION_START_FOREGROUND_SERVICES_FROM_BACKGROUND",
            "android.permission.REQUEST_COMPANION_RUN_IN_BACKGROUND",
            "android.permission.REQUEST_OBSERVE_COMPANION_DEVICE_PRESENCE",
        )

        val blockedComponents = setOf(
            "com.mi.earphone.keepalive.KeepAliveForegroundService",
            "com.mi.earphone.keepalive.google.ConnectivityCompanionDeviceService",
            "com.mi.earphone.keepalive.miui.MiuiNearByService",
            "com.mi.earphone.keepalive.google.CdmAssociationActivity",
        )

        var removedPermissions = 0
        val tagCounts = mutableMapOf("service" to 0, "activity" to 0)

        document(manifestFile.absolutePath).use { doc ->
            val usesPermissions = doc.getElementsByTagName("uses-permission")
            val permsToRemove = mutableListOf<Element>()
            for (i in 0 until usesPermissions.length) {
                val elem = usesPermissions.item(i) as? Element ?: continue
                val name = elem.getAttribute("android:name")
                if (name in blockedPermissions) {
                    permsToRemove.add(elem)
                }
            }
            permsToRemove.forEach {
                it.parentNode?.removeChild(it)
                removedPermissions++
            }

            val tags = listOf("service", "activity")
            for (tag in tags) {
                val elements = doc.getElementsByTagName(tag)
                for (i in 0 until elements.length) {
                    val elem = elements.item(i) as? Element ?: continue
                    val name = elem.getAttribute("android:name")
                    if (name in blockedComponents) {
                        elem.setAttribute("android:enabled", "false")
                        elem.setAttribute("android:exported", "false")
                        tagCounts[tag] = (tagCounts[tag] ?: 0) + 1
                    }
                }
            }
        }

        val disabledComponents = tagCounts.values.sum()
        val categoryBreakdown = tagCounts.entries
            .filter { it.value > 0 }
            .joinToString(", ") { "${it.key}=${it.value}" }
        val componentDetails = if (categoryBreakdown.isNotEmpty()) " ($categoryBreakdown)" else ""

        println("[Stop Background Activity (Setup)] Stripped $removedPermissions permissions, disabled $disabledComponents keepalive components in manifest$componentDetails.")
    }
}

@Suppress("unused")
val xiaomiEarbudsBackgroundOptimizerPatch = bytecodePatch(
    name = "Stop Background Activity",
    description = "Stops persistent notifications and background battery drain.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_XIAOMI_EARBUDS)
    dependsOn(xiaomiEarbudsBackgroundResourcePatch)

    execute {
        val hookedMethods = mutableListOf<String>()

        // 1. KeepAliveForegroundService$Companion.start(Context)V - Blocks foreground service launching
        Fingerprint(
            definingClass = "Lcom/mi/earphone/keepalive/KeepAliveForegroundService\$Companion;",
            name = "start",
            parameters = listOf("Landroid/content/Context;"),
            returnType = "V",
        ).method.apply {
            replaceWithReturnVoid()
            hookedMethods.add("KeepAliveForegroundService\$Companion.start")
        }

        // 2. KeepAliveForegroundService.startForegroundServiceInternal()V - Neutralizes notification building and startForeground
        Fingerprint(
            definingClass = "Lcom/mi/earphone/keepalive/KeepAliveForegroundService;",
            name = "startForegroundServiceInternal",
            parameters = listOf(),
            returnType = "V",
        ).method.apply {
            replaceWithReturnVoid()
            hookedMethods.add("KeepAliveForegroundService.startForegroundServiceInternal")
        }

        // 3. KeepAliveForegroundService.isStarted()Z - Enforces service state as false
        Fingerprint(
            definingClass = "Lcom/mi/earphone/keepalive/KeepAliveForegroundService;",
            name = "isStarted",
            parameters = listOf(),
            returnType = "Z",
        ).method.apply {
            replaceWithReturnBoolean(false)
            hookedMethods.add("KeepAliveForegroundService.isStarted")
        }

        // 4. KeepAliveImpl.setActiveDevice(String, boolean)V - Prevents keepalive activation on device connection
        Fingerprint(
            definingClass = "Lcom/mi/earphone/keepalive/KeepAliveImpl;",
            name = "setActiveDevice",
            parameters = listOf("Ljava/lang/String;", "Z"),
            returnType = "V",
        ).method.apply {
            replaceWithReturnVoid()
            hookedMethods.add("KeepAliveImpl.setActiveDevice")
        }

        // 5. KeepAliveImpl.isAssociated(String)Z - Returns true to satisfy auth checks and bypass association prompts
        Fingerprint(
            definingClass = "Lcom/mi/earphone/keepalive/KeepAliveImpl;",
            name = "isAssociated",
            parameters = listOf("Ljava/lang/String;"),
            returnType = "Z",
        ).method.apply {
            replaceWithReturnBoolean(true)
            hookedMethods.add("KeepAliveImpl.isAssociated")
        }

        // 6. GoogleCompanionDeviceManager.ensureObserve(String, boolean)V - Blocks background BLE presence scanning via CDM
        Fingerprint(
            definingClass = "Lcom/mi/earphone/keepalive/google/GoogleCompanionDeviceManager;",
            name = "ensureObserve",
            parameters = listOf("Ljava/lang/String;", "Z"),
            returnType = "V",
        ).method.apply {
            replaceWithReturnVoid()
            hookedMethods.add("GoogleCompanionDeviceManager.ensureObserve")
        }

        // 7. MiuiKeepAliveManager.setConnectionListenerConfig(String)V - Blocks MIUI Nearby listener registration
        Fingerprint(
            definingClass = "Lcom/mi/earphone/keepalive/miui/MiuiKeepAliveManager;",
            name = "setConnectionListenerConfig",
            parameters = listOf("Ljava/lang/String;"),
            returnType = "V",
        ).method.apply {
            replaceWithReturnVoid()
            hookedMethods.add("MiuiKeepAliveManager.setConnectionListenerConfig")
        }

        // 8. MiuiKeepAliveManager.initSdk()V - Prevents initialization of MIUI Nearby discovery client
        Fingerprint(
            definingClass = "Lcom/mi/earphone/keepalive/miui/MiuiKeepAliveManager;",
            name = "initSdk",
            parameters = listOf(),
            returnType = "V",
        ).method.apply {
            replaceWithReturnVoid()
            hookedMethods.add("MiuiKeepAliveManager.initSdk")
        }

        // 9. MiuiNearByService.startForegroundCompat()V - Neutralizes MIUI Nearby foreground notification and startForeground
        Fingerprint(
            definingClass = "Lcom/mi/earphone/keepalive/miui/MiuiNearByService;",
            name = "startForegroundCompat",
            parameters = listOf(),
            returnType = "V",
        ).method.apply {
            replaceWithReturnVoid()
            hookedMethods.add("MiuiNearByService.startForegroundCompat")
        }

        // 10. ConnectivityCompanionDeviceService.onDeviceAppeared(String)V - Neutralizes device appeared keepalive trigger
        Fingerprint(
            definingClass = "Lcom/mi/earphone/keepalive/google/ConnectivityCompanionDeviceService;",
            name = "onDeviceAppeared",
            parameters = listOf("Ljava/lang/String;"),
            returnType = "V",
        ).method.apply {
            replaceWithReturnVoid()
            hookedMethods.add("ConnectivityCompanionDeviceService.onDeviceAppeared(String)")
        }

        // 11. ConnectivityCompanionDeviceService.onDeviceAppeared(AssociationInfo)V - Neutralizes device appeared keepalive trigger
        Fingerprint(
            definingClass = "Lcom/mi/earphone/keepalive/google/ConnectivityCompanionDeviceService;",
            name = "onDeviceAppeared",
            parameters = listOf("Landroid/companion/AssociationInfo;"),
            returnType = "V",
        ).method.apply {
            replaceWithReturnVoid()
            hookedMethods.add("ConnectivityCompanionDeviceService.onDeviceAppeared(AssociationInfo)")
        }

        println("[Stop Background Activity] Neutralized ${hookedMethods.size} background keep-alive, foreground service, and BLE discovery hooks.")
    }
}
