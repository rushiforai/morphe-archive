package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Appear offline (#50, #135, #171): stay hidden while the active dots next to everyone else keep working.
 *
 * Messenger ties the two together because one preference answers both questions. Active Status feeds the subscription
 * that brings other people's presence in, and it feeds the two places that report ours out, so turning it off in
 * Messenger takes the dots away too. The preference is left alone here and only the outbound half is answered:
 *
 * 1. [APPEAR_OFFLINE], the msys self-report. The presence manager's (boolean)V picks "available" or "unavailable" and
 *    hands it to the mailbox, and it runs when the app comes to the foreground and when it stops.
 * 2. [AVAILABILITY_SETTING], the legacy MQTT client setting. Both preference listeners that publish
 *    /set_client_settings put the same answer in their JSON as make_user_available_when_in_foreground, which is the
 *    only copy of that flag in Java: the connect-time one is built in native code from the same preference.
 *
 * What brings other people's presence in isn't touched, so the chat list, the People tab and the active dots stay as
 * they are. The report only leaves on a foreground or background change, so the switch lands the next time Messenger
 * goes to the background or comes back, and a restart makes it land right away.
 */
internal const val APPEAR_OFFLINE = "appear_offline"
internal const val AVAILABILITY_SETTING = "availability_setting"

internal const val PRESENCE_MANAGER = "Lcom/facebook/presence/DefaultPresenceManager;"
internal const val FB_SHARED_PREFERENCES = "Lcom/facebook/prefs/shared/FbSharedPreferences;"
/** The trace the self-report writes around its mailbox call, which no other method in the app writes. */
internal const val REPORT_USER_STATUS = "UnifiedPresenceMailboxImpl.reportUserStatus"
internal const val FOREGROUND_AVAILABILITY = "make_user_available_when_in_foreground"
internal const val CLIENT_SETTINGS_TOPIC = "/set_client_settings"
private const val JSON_PUT_BOOLEAN = "Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;"

/** Both hooks hand over the status Messenger was about to report and take back the one the switch allows. */
internal const val AVAILABLE_CALL = "$SETTINGS->availableToOthers(Z)Z"

private fun availabilityChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: Messenger's own availability report changed ($detail)")

private fun Instruction.availabilityRef() = (this as? ReferenceInstruction)?.reference
private fun Method.availabilityCode() = implementation?.instructions?.toList().orEmpty()
private fun Method.availabilityStrings() =
    availabilityCode().mapNotNull { (it.availabilityRef() as? StringReference)?.string }.toSet()

/**
 * The msys self-report: the presence manager's one instance (boolean)V that traces the mailbox call it makes. The
 * boolean is the status, so the hook rewrites it before the method reads it.
 */
internal fun Method.isSelfStatusReport(): Boolean =
    definingClass == PRESENCE_MANAGER && returnType == "V" && implementation != null &&
        !AccessFlags.STATIC.isSet(accessFlags) && parameterTypes.map { it.toString() } == listOf("Z") &&
        REPORT_USER_STATUS in availabilityStrings()

/**
 * A client-settings publisher: a preference listener that puts the foreground availability flag in the JSON it
 * publishes on /set_client_settings. Both of Messenger's MQTT clients have one, and they take the same hook.
 */
internal fun Method.isAvailabilitySetting(): Boolean =
    returnType == "V" && implementation != null && !AccessFlags.STATIC.isSet(accessFlags) &&
        parameterTypes.size == 2 && parameterTypes[0].toString() == FB_SHARED_PREFERENCES &&
        availabilityStrings().containsAll(setOf(FOREGROUND_AVAILABILITY, CLIENT_SETTINGS_TOPIC))

/**
 * Where the availability flag goes into the published JSON: the one boolean put the flag's own string is loaded for.
 * The register it reads is the one the hook rewrites, so the JSON and the analytics event that follows agree.
 */
internal class AvailabilityPut(val index: Int, val register: Int)

internal fun Method.availabilityPut(): AvailabilityPut {
    val code = availabilityCode()
    val flags = code.indices.filter { (code[it].availabilityRef() as? StringReference)?.string == FOREGROUND_AVAILABILITY }
    if (flags.size != 1) availabilityChanged("${flags.size} copies of the flag in ${hookId()}")
    val put = flags.single() + 1
    val call = code.getOrNull(put)
    if (call?.opcode != Opcode.INVOKE_VIRTUAL || call.availabilityRef()?.toString() != JSON_PUT_BOOLEAN) {
        availabilityChanged("the flag isn't put straight into the JSON in ${hookId()}")
    }
    // A put through invoke-virtual holds its three registers in four bits each, which is what the hook's call takes.
    val args = call as? FiveRegisterInstruction
    if (args == null || args.registerCount != 3) availabilityChanged("an unexpected put in ${hookId()}")
    val register = args!!.registerE
    // Nothing may land between the flag's string and the put the hook goes in front of.
    if (put in jumpTargets()) availabilityChanged("a jump onto the put in ${hookId()}")
    // The flag has to be the preference read itself: one definition, the result of a no-argument boolean getter.
    val flow = ReadFlow(this)
    val definitions = flow.definitionsAt(put, register)
    val definition = definitions.singleOrNull()
    if (definition == null || definition < 0 || code[definition].opcode != Opcode.MOVE_RESULT) {
        availabilityChanged("the flag isn't read once in ${hookId()}")
    }
    val read = code.getOrNull(definition!! - 1)?.availabilityRef() as? MethodReference
    if (read == null || read.returnType != "Z" || read.parameterTypes.isNotEmpty()) {
        availabilityChanged("the flag doesn't come from Messenger's own setting in ${hookId()}")
    }
    return AvailabilityPut(put, register)
}

internal fun MutableMethod.validateAppearOffline() {
    when {
        isSelfStatusReport() -> {
            if (parameterRegister(1) > 15) availabilityChanged("the status sits in v${parameterRegister(1)} in ${hookId()}")
            if (0 in jumpTargets()) availabilityChanged("a jump back to the start of ${hookId()}")
            if (ReadFlow(this).protected(0)) availabilityChanged("${hookId()} starts inside a try")
        }
        isAvailabilitySetting() -> availabilityPut()
        else -> availabilityChanged("unexpected method ${hookId()}")
    }
}

/**
 * The self-report reads its answer from the extension before it picks a status, and each publisher reads it again for
 * the flag it puts in the JSON. Neither changes what Messenger reads about other people, and with the switch off both
 * hand back exactly what Messenger was going to report.
 */
internal fun MutableMethod.injectAppearOffline() {
    validateAppearOffline()
    if (isSelfStatusReport()) {
        val status = parameterRegister(1)
        addInstructions(0, "invoke-static {v$status}, $AVAILABLE_CALL\nmove-result v$status")
        return
    }
    val put = availabilityPut()
    addInstructions(put.index, "invoke-static {v${put.register}}, $AVAILABLE_CALL\nmove-result v${put.register}")
}
