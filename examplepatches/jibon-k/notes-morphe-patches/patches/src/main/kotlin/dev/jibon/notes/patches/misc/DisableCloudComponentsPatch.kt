package dev.jibon.notes.patches.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import dev.jibon.notes.patches.compat.elements
import dev.jibon.notes.patches.shared.Constants.COMPATIBILITY_NOTES

// Samsung account / cloud sync / push / co-editing parts. Providers, ImportService and activities stay enabled
// (the app uses them). Samsung Cloud sync no longer works with these off.
private val DISABLED_COMPONENTS = setOf(
    "com.samsung.android.support.senl.nt.app.sync.receivers.SamsungAccountReceiver",
    "com.samsung.android.support.senl.nt.app.sync.receivers.SyncTimeReceiver",
    "com.samsung.android.app.notes.receiver.EdpPushReceiver",
    "com.samsung.android.app.notes.receiver.MdePushReceiver",
    "com.samsung.android.app.notes.receiver.CoeditPushReceiver",
    "com.samsung.android.app.notes.sync.push.receiver.SmpFcmPushReceiver",
    "com.samsung.android.app.notes.sync.push.receiver.SmpPackageReceiver",
    "com.samsung.android.app.notes.sync.push.receiver.SmpSppPushReceiver",
    "com.samsung.android.app.notes.sync.edp.EdpPushReceiver",
    "com.samsung.android.support.senl.nt.coedit.service.CoeditService",
    "com.samsung.android.app.notes.sync.synchronization.services.SyncOldService",
    "com.samsung.android.app.notes.sync.synchronization.services.ForegroundSyncService",
    "com.samsung.android.app.notes.sync.push.service.SmpFcmPushService",
    "com.samsung.android.app.notes.sync.coedit.service.CoeditShareOldService",
)

@Suppress("unused")
val disableCloudComponentsPatch = resourcePatch(
    name = "Turn off Samsung cloud components",
    description = "Turns off the Samsung account, cloud sync, push and co-editing services. " +
        "Samsung Cloud sync stops working.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_NOTES)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            var disabled = 0
            (manifest.elements("service") + manifest.elements("receiver")).forEach {
                if (it.getAttribute("android:name") in DISABLED_COMPONENTS) {
                    it.setAttribute("android:enabled", "false")
                    disabled++
                }
            }
            if (disabled == 0) throw PatchException("No Samsung cloud components found in the manifest")
        }
    }
}
