package semicoloncolonel.mobilestream.patches.apnews.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import semicoloncolonel.mobilestream.patches.apnews.shared.Constants

// AP News 6.31.2.
//
// - Top Stories: the Donate link shows when the remote "android_donation"
//   feature flag is on. The app's flag check now reports that one flag as
//   off, so Top Stories takes its own hidden path and leaves no space. Every
//   other flag is unchanged.
// - Account screen: a card with "Donate now" shows to accounts that are not
//   recurring donors. That screen alone now reads the donor flag as set, so
//   the card is not drawn. The account itself is not changed.

private const val FLAG = "Lcom/apnews/app/core/common/model/firebase/featureflag/FirebaseFeatureFlag;"

internal object FeatureFlagEnabledFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf(FLAG),
    custom = { _, classDef ->
        classDef.methods.any {
            it.returnType == "Lcom/apnews/app/core/common/model/firebase/featureflag/FeatureFlagOverrideState;"
        }
    },
)

// ZephrProfile.toString(): its class is the signed-in account profile.
internal object ZephrProfileToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    strings = listOf("ZephrProfile(firstName=", ", isRecurringDonor="),
)

@Suppress("unused")
val hideDonateButtonPatch = bytecodePatch(
    name = "Hide donate button",
    description = "Removes the Donate link from Top Stories and the Donate card from the account screen.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        FeatureFlagEnabledFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    sget-object v0, $FLAG->AndroidDonation:$FLAG
                    if-ne p0, v0, :check
                    const/4 v0, 0x0
                    return v0
                """,
                ExternalLabel("check", getInstruction(0)),
            )
        }

        // The account screen composable: a static method whose second
        // parameter is the profile, which reads the profile's only boolean.
        val profile = ZephrProfileToStringFingerprint.classDef.type
        val donorField = ZephrProfileToStringFingerprint.classDef.fields.singleOrNull { it.type == "Z" }
            ?: throw PatchException("isRecurringDonor field not found in $profile")
        var patched = 0
        classDefForEach { classDef ->
            val targets = classDef.methods.filter { method ->
                AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
                    method.parameterTypes.getOrNull(1)?.toString() == profile &&
                    method.implementation?.instructions?.any {
                        it.opcode == Opcode.IGET_BOOLEAN &&
                            ((it as ReferenceInstruction).reference as FieldReference).let { ref ->
                                ref.definingClass == profile && ref.name == donorField.name
                            }
                    } == true
            }
            if (targets.isEmpty()) return@classDefForEach
            val mutable = mutableClassDefBy(classDef.type)
            targets.forEach { target ->
                val method = mutable.methods.first { it.name == target.name && it.parameterTypes == target.parameterTypes }
                val instructions = method.implementation!!.instructions.toList()
                instructions.indices.reversed().forEach { index ->
                    val insn = instructions[index]
                    if (insn.opcode != Opcode.IGET_BOOLEAN) return@forEach
                    val ref = (insn as ReferenceInstruction).reference as FieldReference
                    if (ref.definingClass != profile || ref.name != donorField.name) return@forEach
                    method.replaceInstruction(index, "const/4 v${(insn as TwoRegisterInstruction).registerA}, 0x1")
                    patched++
                }
            }
        }
        if (patched == 0) throw PatchException("Account screen donor check not found")
    }
}
