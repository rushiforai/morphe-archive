package suchi.morphe.patches.teuida

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private val sharedPremiumFingerprint = Fingerprint(
    definingClass = "Lnet/teuida/teuida/util/UserShareds;",
    name = "l",
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("premium"),
)

private val profilePremiumFingerprint = Fingerprint(
    definingClass = "Lnet/teuida/teuida/modelKt/MeData;",
    name = "s",
    returnType = "Ljava/lang/Boolean;",
    parameters = emptyList(),
)

private val premiumStateFingerprint = Fingerprint(
    definingClass = "Lnet/teuida/teuida/modelKt/MeData;",
    name = "t",
    returnType = "Lnet/teuida/teuida/enums/PremiumState;",
    parameters = emptyList(),
)

@Suppress("unused")
val localPremiumPatch = bytecodePatch(
    name = "Enable local Premium controls",
    description = "Overrides TEUIDA's local Premium getters for research. " +
        "Does not alter server-side account entitlement.",
    default = false,
) {
    compatibleWith(teuidaCompatibility)

    execute {
        val sharedPremium = sharedPremiumFingerprint.method
        val profilePremium = profilePremiumFingerprint.method
        val premiumState = premiumStateFingerprint.method
        for ((method, fieldName) in listOf(profilePremium to "premium", premiumState to "premiumState")) {
            val fieldReferences = method.implementation!!.instructions.mapNotNull {
                ((it as? ReferenceInstruction)?.reference as? FieldReference)
            }
            if (fieldReferences.singleOrNull()?.name != fieldName) {
                throw PatchException("TEUIDA's $fieldName getter has changed.")
            }
        }

        sharedPremium.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        profilePremium.addInstructions(
            0,
            "sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;\nreturn-object v0",
        )
        premiumState.addInstructions(
            0,
            "sget-object v0, Lnet/teuida/teuida/enums/PremiumState;" +
                "->PREMIUM:Lnet/teuida/teuida/enums/PremiumState;\nreturn-object v0",
        )
    }
}
