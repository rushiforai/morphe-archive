package app.patches.diffuse

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * This here is the original program logic: return !sbn.isClearable() && sbn.isOngoing();
 *
 * Which is bogus because it should accept other notifications that are not ongoing as well...
 */
internal object IsPersistentNotificationFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Landroid/service/notification/StatusBarNotification;"),
    filters = listOf(
        methodCall(smali = "Landroid/service/notification/StatusBarNotification;->isClearable()Z"),
        methodCall(smali = "Landroid/service/notification/StatusBarNotification;->isOngoing()Z"),
    ),
)
