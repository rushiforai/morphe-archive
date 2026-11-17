package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Quiet mode's own hook, and the control key the settings switch goes under. The calls half shares Quiet incoming
 * calls' two hooks, which already ask the extension whether this call may come in quietly.
 */
internal const val QUIET_MODE = "quiet_mode"

private const val NOTIFICATION = "Landroid/app/Notification;"
private const val MESSAGING_NOTIFICATION = "Lcom/facebook/messaging/notify/type/MessagingNotification;"
private const val STRING = "Ljava/lang/String;"

/** The poster's arguments: the built notification, the account, the notification it was built from, a tag and an id. */
private val POSTER_PARAMETERS = listOf(NOTIFICATION, FB_USER_SESSION, MESSAGING_NOTIFICATION, STRING, "I")

/** NotificationManagerCompat's notify, which takes the tag, the id and the notification. */
private val COMPAT_NOTIFY = listOf(STRING, "I", NOTIFICATION)

internal const val QUIET_MODE_CALL = "Lapp/hushmessenger/extension/QuietMode;->message($NOTIFICATION)$NOTIFICATION"

private fun Instruction.target() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun MethodReference.types() = parameterTypes.map { it.toString() }

/** A call to the compat notify, whichever form it takes. Reaching it is what makes this method the poster. */
private fun Method.postsNotification() = code().any { instruction ->
    instruction.target()?.let { it.returnType == "V" && it.types() == COMPAT_NOTIFY } == true
}

/**
 * Messenger's messaging notification poster: it takes the notification already built, the account, the
 * MessagingNotification behind it, a tag and an id, answers whether it posted, and reaches the compat notify that
 * hands Android the notification. Only Messenger's messaging notifications go through here, so a break leaves the
 * calls, the warnings and everything else Messenger posts to their own paths.
 */
internal fun Method.isMessagingNotificationPoster(): Boolean =
    returnType == "Z" && parameterTypes.map { it.toString() } == POSTER_PARAMETERS && postsNotification()

internal fun findQuietModeNotify(classes: Iterable<ClassDef>): List<Method> =
    classes.flatMap { it.methods }.filter { it.isMessagingNotificationPoster() }.singleOrNull()?.let(::listOf).orEmpty()

/** The notification's own register: the first parameter, past `this` when the poster is an instance method. */
private fun Method.notificationRegister() = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1

/** The extension call already in the poster, so a second pass over the same method leaves it as it is. */
internal fun Method.quietModeHooked() = code().any { it.target()?.toString() == QUIET_MODE_CALL }

internal fun MutableMethod.validateQuietModeNotify() {
    if (quietModeHooked()) return
    if (!isMessagingNotificationPoster())
        throw PatchException("Messenger controls: ${hookId()} isn't the messaging notification poster")
    if (0 in jumpTargets()) throw PatchException("Messenger controls: ${hookId()} branches back to its start")
}

/**
 * The poster hands its notification to the extension first. On a break, or inside the nightly window, the notification
 * comes back on a channel of HushMessenger's own at Android's low importance, so it waits in the shade without a sound
 * or a vibration. A message from someone on the Special contacts list, and every message with quiet mode off, comes
 * back as it was.
 */
internal fun MutableMethod.injectQuietModeNotify() {
    if (quietModeHooked()) return
    validateQuietModeNotify()
    val register = notificationRegister()
    addInstructions(0, """
        invoke-static/range {p$register .. p$register}, $QUIET_MODE_CALL
        move-result-object p$register
    """.trimIndent())
}
