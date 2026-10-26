package app.soundconnect.patches.speaktochat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

internal const val GUARD_CLASS = "Lapp/soundconnect/extension/speaktochat/SpeakToChatGuard;"

// Sony's protocol classes keep their names; only the app's own classes are obfuscated.
private const val V1_PARAMETER_TYPE =
    "Lcom/sony/songpal/tandemfamily/message/mdr/v1/table1/param/smarttalkingmode/SmartTalkingModeParameterType;"
private const val V1_SETTING_VALUE =
    "Lcom/sony/songpal/tandemfamily/message/mdr/v1/table1/param/smarttalkingmode/SmartTalkingModeSettingValue;"
private const val MODE_VALUE =
    "Lcom/sony/songpal/mdr/j2objc/tandem/features/smarttalkingmode/SmartTalkingModeValue;"

/** Wire value to app value: `SmartTalkingModeValue.fromTableSet1(SmartTalkingModeSettingValue)`, then its result. */
private fun modeValueConversion() = listOf(
    methodCall(definingClass = MODE_VALUE, name = "fromTableSet1", parameters = listOf(V1_SETTING_VALUE)),
    opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
)

/**
 * The command sender's "set Speak-to-Chat on/off" method.
 * The v2 sender logs the same prefix but uses other protocol classes, so the v1 field tells them apart.
 */
internal object SetSpeakToChatFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z", "Z", "Ljava/lang/String;"),
    filters = listOf(
        string("sendSmartTalkingModeValue : onOff = "),
        fieldAccess(definingClass = V1_PARAMETER_TYPE, name = "MODE_ON_OFF"),
    ),
)

/** Constructor of the command sender: the call to its super constructor. */
internal object SenderConstructorFingerprint : Fingerprint(
    classFingerprint = SetSpeakToChatFingerprint,
    name = "<init>",
    filters = listOf(
        methodCall(definingClass = "Ljava/lang/Object;", name = "<init>"),
    ),
)

/** The state holder's handler for headset notifications, in its MODE_ON_OFF branch. */
internal object SpeakToChatNotificationFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        string("invalid type !! must be SmartTalkingModeSetNtfyParam"),
        fieldAccess(definingClass = V1_PARAMETER_TYPE, name = "MODE_ON_OFF"),
    ) + modeValueConversion(),
)

/** The same class reads the full Speak-to-Chat state once the headset is connected. */
internal object SpeakToChatInitialStateFingerprint : Fingerprint(
    classFingerprint = SpeakToChatNotificationFingerprint,
    returnType = "V",
    parameters = listOf(),
    filters = modeValueConversion(),
)

/** Extension method whose body receives the sender's obfuscated method name. */
internal object SetterNameFingerprint : Fingerprint(
    definingClass = GUARD_CLASS,
    name = "setterName",
)
