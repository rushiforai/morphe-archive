package dev.jibon.notes.patches.misc

import app.morphe.patcher.patch.resourcePatch
import dev.jibon.notes.patches.compat.elements
import dev.jibon.notes.patches.shared.Constants.COMPATIBILITY_NOTES

// Samsung account / cloud sync / push / co-editing parts: they need a Samsung-signed app and only run in the
// background. Providers, ImportService and activities stay enabled (the app uses them).
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
    description = "Turns off the Samsung account, cloud sync, push and co-editing services and receivers. " +
        "They can't work in a patched app and would only run in the background.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NOTES)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            (manifest.elements("service") + manifest.elements("receiver")).forEach { component ->
                if (component.getAttribute("android:name") in DISABLED_COMPONENTS) {
                    component.setAttribute("android:enabled", "false")
                }
            }
        }
    }
}
