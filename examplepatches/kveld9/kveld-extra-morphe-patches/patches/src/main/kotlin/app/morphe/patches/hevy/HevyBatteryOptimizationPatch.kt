package app.morphe.patches.hevy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.Constants
import app.morphe.patches.shared.removeComponentDiscoveryRegistrarsWhere
import app.morphe.patches.shared.replaceWithReturnVoid
import app.morphe.patches.shared.setAndroidAttribute
import org.w3c.dom.Element

private val hevyBatteryResourcePatch = resourcePatch(
    name = "Stop Background Sync (Setup)",
    description = "Turns off billing components and background services.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY_HEVY)

    execute {
        val manifestFile = get("AndroidManifest.xml")
        if (!manifestFile.exists()) {
            error("[Stop Background Sync] AndroidManifest.xml not found.")
        }

        val disabledComponents = setOf(
            // 1. Firebase & DataTransport Background Wakeups
            "com.google.android.datatransport.runtime.backends.TransportBackendDiscovery",
            "com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService",
            "com.google.android.datatransport.runtime.scheduling.jobscheduling.AlarmManagerSchedulerBroadcastReceiver",
            "androidx.profileinstaller.ProfileInstallReceiver",

            // 2. Google Play & Amazon Billing Activities
            "com.android.billingclient.api.ProxyBillingActivity",
            "com.android.billingclient.api.ProxyBillingActivityV2",
            "com.revenuecat.purchases.amazon.purchasing.ProxyAmazonBillingActivity",
            "com.amazon.device.iap.ResponseReceiver",
            "com.revenuecat.purchases.SimulatedStoreErrorDialogActivity",
        )

        var neutralizedCount = 0
        var removedBillingQueries = 0
        var removedBillingPermissions = 0
        var removedLargeHeap = false
        var removedDataTransportRegistrars = 0

        document(manifestFile.absolutePath).use { doc ->
            // 1. Disable background services, receivers, providers, and billing activities
            val tags = listOf("service", "receiver", "provider", "activity")
            for (tag in tags) {
                val elements = doc.getElementsByTagName(tag)
                for (i in 0 until elements.length) {
                    val elem = elements.item(i) as? Element ?: continue
                    val name = elem.getAttribute("android:name")
                    if (name in disabledComponents) {
                        elem.setAndroidAttribute("enabled", "false")
                        neutralizedCount++
                    }
                }
            }

            // 2. Strip com.android.vending.BILLING permission
            val usesPerms = doc.getElementsByTagName("uses-permission")
            val permsToRemove = mutableListOf<Element>()
            for (i in 0 until usesPerms.length) {
                val elem = usesPerms.item(i) as? Element ?: continue
                if (elem.getAttribute("android:name") == "com.android.vending.BILLING") {
                    permsToRemove.add(elem)
                }
            }
            permsToRemove.forEach {
                it.parentNode?.removeChild(it)
                removedBillingPermissions++
            }

            // 3. Strip billing queries intent actions from <queries>
            val queriesElements = doc.getElementsByTagName("queries")
            for (i in 0 until queriesElements.length) {
                val qElem = queriesElements.item(i) as? Element ?: continue
                val intents = qElem.getElementsByTagName("intent")
                val intentsToRemove = mutableListOf<Element>()
                for (j in 0 until intents.length) {
                    val intentElem = intents.item(j) as? Element ?: continue
                    val actions = intentElem.getElementsByTagName("action")
                    if (actions.length == 0) continue
                    var allBilling = true
                    for (k in 0 until actions.length) {
                        val actionElem = actions.item(k) as? Element ?: continue
                        val actionName = actionElem.getAttribute("android:name")
                        if (!(actionName.contains("billing", ignoreCase = true) ||
                                actionName.contains("InAppBillingService", ignoreCase = true))
                        ) {
                            allBilling = false
                            break
                        }
                    }
                    if (allBilling) {
                        intentsToRemove.add(intentElem)
                    }
                }
                intentsToRemove.forEach {
                    it.parentNode?.removeChild(it)
                    removedBillingQueries++
                }
            }

            // 4. Remove android:largeHeap="true" to enforce regular ART Garbage Collection
            val appElements = doc.getElementsByTagName("application")
            for (i in 0 until appElements.length) {
                val appElem = appElements.item(i) as? Element ?: continue
                if (appElem.hasAttribute("android:largeHeap")) {
                    appElem.removeAttribute("android:largeHeap")
                    removedLargeHeap = true
                }
                removedDataTransportRegistrars += appElem.removeComponentDiscoveryRegistrarsWhere {
                    it == "com.google.firebase.components:com.google.firebase.datatransport.TransportRegistrar"
                }
            }
        }

        val largeHeapMsg = if (removedLargeHeap) ", removed android:largeHeap" else ""
        println("[Stop Background Sync] Neutralized $neutralizedCount components, stripped $removedBillingPermissions billing perms, pruned $removedBillingQueries billing queries, removed $removedDataTransportRegistrars DataTransport registrar(s)$largeHeapMsg in AndroidManifest.xml")
    }
}

@Suppress("unused")
val hevyBatteryOptimizationPatch = bytecodePatch(
    name = "Stop Background Sync",
    description = "Stops background sync tasks and alarms that drain the battery.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_HEVY)
    dependsOn(hevyBatteryResourcePatch)

    execute {
        // Stub BillingClientImpl.startConnection to eliminate Play Store IPC / bound service
        val billingFp = Fingerprint(
            strings = listOf("Starting in-app billing setup."),
            returnType = "V",
        )
        billingFp.method.replaceWithReturnVoid()
        println("[Stop Background Sync] Stubbed BillingClientImpl.startConnection to eliminate Play Store background IPC.")
    }
}
