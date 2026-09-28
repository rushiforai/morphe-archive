/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.notifications

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.parameterRegister
import app.morphe.patches.facebook.misc.extension.requireLocals
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.iface.Field

internal const val BLOCK = "$EXTENSION_PACKAGE/notifications/NotificationKinds;->block(Ljava/lang/String;)Z"

/**
 * Asks the extension about a push's type first thing in the method that posts it, and returns
 * before anything is posted when the extension says that kind is blocked. See
 * NotificationAnchors.kt for how Facebook types a push and where it posts one. Every kind without
 * a switch that's on posts as Facebook posts it.
 */
@Suppress("unused")
val blockPromotionalNotificationsPatch = bytecodePatch(
    name = "Block promotional notifications",
    description = "Keeps the kinds of notification you pick off your phone, such as trending videos, memories and " +
        "birthdays. Each kind has its own switch, and they all start off. Messages, friend requests, comments, " +
        "mentions and login alerts always come through.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        val manager = classDefByOrNull(TRAY_MANAGER)
            ?: throw PatchException("$PATCH: $TRAY_MANAGER isn't in this build")
        val posts = manager.methods.filter(::isPostMethod)
        val post = posts.singleOrNull() ?: throw PatchException(
            "$PATCH: expected one method of $TRAY_MANAGER loading \"$SHOW_START\" over (Intent, " +
                "NotificationLogObject, NotificationsLogger\$Component, a builder, int), found ${posts.size}",
        )
        val builderType = post.parameterTypes[BUILDER_PARAMETER].toString()
        val builder = classDefByOrNull(builderType)
            ?: throw PatchException("$PATCH: the post method's builder $builderType isn't in this build")
        val field = notificationField(builder) ?: throw PatchException(
            "$PATCH: the builder $builderType doesn't hold the push in one field of type $TRAY_NOTIFICATION",
        )
        val notification = classDefByOrNull(TRAY_NOTIFICATION)
        if (notification == null || !hasTypeField(notification)) {
            throw PatchException("$PATCH: $TRAY_NOTIFICATION has no String field $TYPE_FIELD")
        }
        mutableClassDefBy(TRAY_MANAGER).findMutableMethodOf(post).postNothingWhenBlocked(field)
        enableStatus("promoNotifications")
    }
}

/**
 * First thing in the post method: read the push's type out of the builder, ask the extension, and
 * return when it says the kind is blocked. A null builder or push skips the question, and so
 * Facebook's own first instruction runs whatever the answer. The one register borrowed is v0,
 * which holds nothing before the method's first instruction; the builder is copied into it with
 * the 16-bit move, since its parameter register is far past v15.
 */
internal fun MutableMethod.postNothingWhenBlocked(notification: Field) {
    requireLocals(PATCH, 1)
    val builder = parameterRegister(BUILDER_PARAMETER)
    addInstructionsWithLabels(
        0,
        """
            move-object/from16 v0, $builder
            if-eqz v0, :facebook
            iget-object v0, v0, ${notification.definingClass}->${notification.name}:${notification.type}
            if-eqz v0, :facebook
            iget-object v0, v0, $TRAY_NOTIFICATION->$TYPE_FIELD:Ljava/lang/String;
            invoke-static { v0 }, $BLOCK
            move-result v0
            if-eqz v0, :facebook
            return-void
        """,
        ExternalLabel("facebook", getInstruction(0)),
    )
}
