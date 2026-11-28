/*
 * Ported from ajstrick81's ESPN Android TV patch (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/patches/src/main/kotlin/ajstrick81/morphe/patches/espn
 * ALL CREDIT FOR THE ORIGINAL HOOK DESIGN GOES TO ajstrick81.
 */

package semicoloncolonel.mobilestream.patches.espn.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.espn.shared.Constants

// The ad-disabled flag of Disney's DMP SGAI InterstitialManager (see
// Fingerprints.kt). In 8.27.0 and 8.29.0 the class and field keep their names.
// From 8.30.0 the com.disney.dmp.sgai classes are renamed (InterstitialManager
// is c1, isAdDisabled is e), but the constructor still logs the flag through a
// lambda as " isAdDisabled:" followed by the flag's value, so the field is
// found from that string first.
private const val AD_DISABLED_LOG = " isAdDisabled:"
private const val INTERSTITIAL_MANAGER = "Lcom/disney/dmp/sgai/InterstitialManager;"

// Live ESPN breaks are passthrough SSAI: the ad is part of the broadcast
// stream, so isAdDisabled does not remove them. ajstrick81's TV project masks
// those breaks with a separate slate patch, which is not ported here.
@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Stops the scheduled ad breaks and on-demand mid-rolls in videos.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // The field that holds the flag: from the log lambda, or by name.
        var flag: FieldReference? = null
        classDefForEach { classDef ->
            if (flag != null || !classDef.type.startsWith("Lcom/disney/dmp/sgai/")) return@classDefForEach
            classDef.methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                val logged = instructions.indexOfFirst {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == AD_DISABLED_LOG
                }
                if (logged < 0) return@forEach
                // The flag is the boolean appended right after the label. R8 reads
                // all the fields first, so match the iget-boolean that fills the
                // register passed to that append.
                val append = instructions.drop(logged + 1).firstOrNull { insn ->
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.name == "append" && it.parameterTypes.map(Any::toString) == listOf("Z")
                    } == true
                } as? FiveRegisterInstruction ?: return@forEach
                val register = append.registerD
                flag = instructions.take(logged).lastOrNull { insn ->
                    insn.opcode == Opcode.IGET_BOOLEAN && (insn as TwoRegisterInstruction).registerA == register
                }?.let { (it as ReferenceInstruction).reference as FieldReference }
            }
        }
        val owner = flag?.definingClass ?: INTERSTITIAL_MANAGER
        fun isFlag(field: FieldReference) = flag?.let {
            field.definingClass == it.definingClass && field.name == it.name && field.type == "Z"
        } ?: (field.definingClass == INTERSTITIAL_MANAGER && field.name == AD_DISABLED_FIELD)

        // The constructor that takes the full argument list writes the flag once.
        // The synthetic default-args constructor only forwards to it.
        var patched = 0
        val ownerClass = classDefByOrNull(owner)?.let { mutableClassDefBy(owner) }
        ownerClass?.methods?.filter { it.name == "<init>" }?.forEach { constructor ->
            val instructions = constructor.implementation?.instructions?.toList() ?: return@forEach
            val iputIndex = instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.IPUT_BOOLEAN && isFlag((insn as ReferenceInstruction).reference as FieldReference)
            }
            if (iputIndex < 0) return@forEach
            // Overwrite the value the constructor is about to store with true.
            // const/16 takes an 8-bit register, so it also works when the source
            // is a high parameter register.
            val register = (instructions[iputIndex] as TwoRegisterInstruction).registerA
            constructor.addInstructions(iputIndex, "const/16 v$register, 0x1")
            patched++
        }
        if (patched != 1) throw PatchException("ESPN isAdDisabled write: expected 1, found $patched")
    }
}
