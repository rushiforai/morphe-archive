package app.template.patches.flashscore.misc.font

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val CONFIGURATION = "Landroid/content/res/Configuration;"

/** True when [this] reads or writes Configuration.fontWeightAdjustment with an opcode in [opcodes]. */
internal fun Method.touchesFontWeightAdjustment(opcodes: Set<Opcode>) =
    implementation?.instructions?.any {
        it.opcode in opcodes && ((it as? ReferenceInstruction)?.reference as? FieldReference)?.let { field ->
            field.definingClass == CONFIGURATION && field.name == "fontWeightAdjustment"
        } == true
    } == true

// The app's "cap Bold text" helper (R8-renamed, re.a in 26.11.6): static (Activity)V that reads
// Configuration.fontWeightAdjustment and, when it is above 1, writes 1 back into the live
// Configuration. It is the only method in the app that writes that field.
internal object FontWeightOverrideFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.size == 1 &&
            method.touchesFontWeightAdjustment(setOf(Opcode.IGET)) &&
            method.touchesFontWeightAdjustment(setOf(Opcode.IPUT))
    },
)
