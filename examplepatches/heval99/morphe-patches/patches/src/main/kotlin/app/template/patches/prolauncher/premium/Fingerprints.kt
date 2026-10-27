package app.template.patches.prolauncher.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

internal const val SUBSCRIBER_INFO = "Lapp/prolauncher/data/SubscriberInfo;"
private const val IS_PRO_FIELD = "isPro"
internal const val IS_PRO_PREF = "IS_PRO"

// SubscriberInfo is Pro Launcher's kept (unobfuscated) data class for the subscription state that
// the Compose screens collect from a StateFlow. The anchor is the class name plus the reader shape:
// a no-arg Z method that loads the isPro:Z field. The kept getter name pins the match to isPro():
// the data-class component1() has the same shape, and a fingerprint must match a single method.
internal object SubscriberInfoIsProFingerprint : Fingerprint(
    definingClass = SUBSCRIBER_INFO,
    name = IS_PRO_FIELD,
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(fieldAccess("$SUBSCRIBER_INFO->$IS_PRO_FIELD:Z", Opcode.IGET_BOOLEAN)),
)

// The other, larger set of gates (Interrupt, the long-press and settings Pro items, the
// "Pro Member" labels, the RevenueCat getCustomerInfo callback that feeds the Interrupt switch)
// never touch SubscriberInfo. They call the obfuscated prefs getter
// `getBoolean("IS_PRO", false) || isTrialActive()`. Its class and name rotate with R8, so the
// anchor is the pref key plus the shape: the no-arg Z method that loads "IS_PRO", reads it with
// SharedPreferences.getBoolean and then calls the no-arg Z trial check (the IS_PRO setter takes
// a Z and the key migration returns V). v2.4.3 added a second no-arg Z reader of "IS_PRO", the
// "trial just ended" check (trial started, trial over, not Pro, within a day of the trial end),
// which follows the pref read with currentTimeMillis instead of a Z call, so the third filter
// keeps the match on the Pro getter.
internal object IsProPrefFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string(IS_PRO_PREF),
        methodCall(
            definingClass = "Landroid/content/SharedPreferences;",
            name = "getBoolean",
            parameters = listOf("Ljava/lang/String;", "Z"),
            returnType = "Z",
        ),
        methodCall(parameters = listOf(), returnType = "Z"),
    ),
)

// The same shape, applied to every method of the class: isPro() and the data-class component1().
internal fun Method.readsIsPro(): Boolean =
    returnType == "Z" && parameterTypes.isEmpty() && implementation != null &&
        implementation!!.instructions.any { instruction ->
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            instruction.opcode == Opcode.IGET_BOOLEAN && field != null &&
                field.definingClass == SUBSCRIBER_INFO && field.name == IS_PRO_FIELD && field.type == "Z"
        }
