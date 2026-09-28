/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.notifications

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Where Facebook posts a push notification, and what tells one kind of notification from another,
 * on the 577 and 580 builds.
 *
 * A push, from FCM or from Facebook's own MQTT service, is parsed into the kept
 * `com.facebook.notifications.push.model.SystemTrayNotification`. Its Jackson deserializer maps the
 * payload's `type` to the kept field `mType`. Facebook reads the kind by cutting `mType` at the
 * first colon and matching the rest, ignoring case, against the constant names of the kept enum
 * `com.facebook.notifications.constants.push.NotificationType` (473 of them on each build:
 * `MSG`, `FRIEND`, `BIRTHDAY_REMINDER`, `ONTHISDAY`, `TOP_TRENDING_VIDEO` and the rest), falling
 * back to `DEFAULT_PUSH_OF_JEWEL_NOTIF`. So the type is a structural name, never a line of text.
 *
 * Every kind's processor builds its notification in a builder that holds the
 * `SystemTrayNotification` in its one field of that type, then hands the builder to the one method
 * of a renamed interface. The kept `com.facebook.notifications.tray.SystemTrayNotificationManager`
 * is the only class implementing it (besides a wrapper that delegates to it), and its method, an
 * instance void over `(Intent, NotificationLogObject, NotificationsLogger$Component, the builder,
 * int)`, is the only method on either build loading `show_notif_start`. It goes on to the private
 * method that calls `NotificationManager.notify`. Returning from it first posts nothing.
 *
 * Facebook's own Android channels come from its server (a MobileConfig list the
 * `NotificationChannelsManager` turns into channels under a group named after the account), and a
 * push names its channel in its `nc` param. Facebook drops a push whose channel is turned off in
 * Android's settings. Which channels an account gets can't be read from the APK.
 *
 * The method and the builder's field are Redex names (`F0O` and a field of `do6` on 580, `Ex5` and
 * one of `gOK` on 577), so the method is found by the literal it loads and its kept parameter
 * types, and the field by its kept type.
 */
internal const val PATCH = "Block promotional notifications"

/** The class that posts Facebook's push notifications. */
internal const val TRAY_MANAGER = "Lcom/facebook/notifications/tray/SystemTrayNotificationManager;"

/** The parsed push, whose `mType` is the payload's type. */
internal const val TRAY_NOTIFICATION = "Lcom/facebook/notifications/push/model/SystemTrayNotification;"

/** The kept field holding the push's type. */
internal const val TYPE_FIELD = "mType"

/** The trace step the post method logs first, loaded by no other method on either build. */
internal const val SHOW_START = "show_notif_start"

private const val INTENT = "Landroid/content/Intent;"
private const val LOG_OBJECT = "Lcom/facebook/notifications/logging/NotificationLogObject;"
private const val COMPONENT = "Lcom/facebook/notifications/logging/NotificationsLogger\$Component;"
private const val STRING = "Ljava/lang/String;"

/** The index of the builder among the post method's parameters. */
internal const val BUILDER_PARAMETER = 3

private fun Method.parameters(): List<String> = parameterTypes.map { it.toString() }

private fun Method.loads(literal: String): Boolean =
    implementation?.instructions?.any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == literal
    } == true

/**
 * The post method: an instance void with a body over the intent, the log object, the logger's
 * component, a renamed builder and an int, that loads [SHOW_START].
 */
internal fun isPostMethod(method: Method): Boolean {
    val parameters = method.parameters()
    return method.implementation != null && !AccessFlags.STATIC.isSet(method.accessFlags) &&
        method.returnType == "V" && parameters.size == 5 &&
        parameters[0] == INTENT && parameters[1] == LOG_OBJECT && parameters[2] == COMPONENT &&
        parameters[BUILDER_PARAMETER].startsWith("L") && parameters[4] == "I" && method.loads(SHOW_START)
}

/** The builder's one instance field holding the parsed push, or null when it has none or several. */
internal fun notificationField(builder: ClassDef): Field? =
    builder.instanceFields.filter { it.type == TRAY_NOTIFICATION }.singleOrNull()

/** True when [notification] has the instance field `mType`, a String. */
internal fun hasTypeField(notification: ClassDef): Boolean =
    notification.instanceFields.count { it.name == TYPE_FIELD && it.type == STRING } == 1
