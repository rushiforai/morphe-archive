package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags

// Zalo's notification poster: every app notification is posted through it with its final id
// (Objects.hash(type, subType)) and the built Notification, before NotificationManager.notify.
private object NotificationPostFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("I", "Landroid/app/Notification;", "L"),
    filters = listOf(
        string("notify_skipped"),
        string("uid_changed"),
        string("com.zing.zalo.intent.action.DELETE_NOTIFICATION"),
        string("com.zing.zalo.intent.action.OPEN_NOTIFICATION"),
        string("EXTRA_DATA_WRAP_NOTIFICATION_AUTO_CANCEL"),
    ),
)

// ZaloReceiver's notification action handler (runs on NonBlockingBroadcastReceiver's HandlerThread
// after app init). The static b(Context, Intent) is excluded by the access flags.
private object ZaloReceiverHandleFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/receiver/ZaloReceiver;",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/content/Context;", "Landroid/content/Intent;"),
    filters = listOf(
        string("android.intent.action.ACTION_QUICK_MARK_AS_READ"),
        string("EXTRA_UID", location = MatchAfterWithin(5)),
    ),
)

@Suppress("unused")
val notificationMarkAsReadPatch = bytecodePatch(
    name = "Mark as read from notifications",
    description = "Adds Mark as read to chat, reaction, message error and missed Zalo call notifications, " +
        "and Mark all as read when two or more conversations have notifications. " +
        "Read receipts follow the Hide read receipts setting.",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "Zalo",
        packageName = "com.zing.zalo",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0068FF,
        targets = listOf(AppTarget(version = "26.11.01")),
    ))

    dependsOn(nativeSignaturePatch, hideReadReceiptsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        registerApplied(PatchId.MARK_AS_READ_FROM_NOTIFICATIONS)
        check(NotificationPostFingerprint.matchAll(1..1).size == 1)
        val post = NotificationPostFingerprint.method
        check(post.parameters.map { it.type }.take(2) == listOf("I", "Landroid/app/Notification;"))
        // p1 (id) and p2 (Notification) are consecutive registers; /range handles any register count.
        post.addInstruction(0,
            "invoke-static/range {p1 .. p2}, $NOTIFICATION_MARK_AS_READ->decorate(ILandroid/app/Notification;)V")

        check(ZaloReceiverHandleFingerprint.matchAll(1..1).size == 1)
        val handler = ZaloReceiverHandleFingerprint.method
        val handlerImpl = handler.implementation!!
        // p0..p2 are the top three registers; v0 is free at entry (first instruction overwrites it).
        check(handlerImpl.registerCount >= 4)
        val originalStart = handlerImpl.instructions.first()
        handler.addInstructionsWithLabels(0, """
            invoke-static {p1, p2}, $NOTIFICATION_MARK_AS_READ->handle(Landroid/content/Context;Landroid/content/Intent;)Z
            move-result v0
            if-eqz v0, :nezumi_original_receiver
            return-void
        """.trimIndent(), ExternalLabel("nezumi_original_receiver", originalStart))
        registerHooks(PatchId.MARK_AS_READ_FROM_NOTIFICATIONS, post, handler)
    }
}
