package app.template.patches.protonpass

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.PROTON_PASS_COMPATIBILITY
import app.template.patches.shared.Constants.PROTON_PASS_FDROID_COMPATIBILITY
import app.template.patches.shared.clearBody
import app.template.patches.shared.ensureRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private val AppLockStateMapperFingerprint = Fingerprint(
    definingClass = "Lproton/android/pass/App\$\$ExternalSyntheticLambda1;",
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
)

private val HasAuthenticatedMapperFingerprint = Fingerprint(
    definingClass = "Lproton/android/pass/preferences/UserPreferencesRepositoryImpl\$\$ExternalSyntheticLambda7;",
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
)

private val LastUnlockTimeFingerprint = Fingerprint(
    definingClass = "Lproton/android/pass/preferences/InternalSettings;",
    name = "getLastUnlockTime",
    returnType = "J",
    parameters = emptyList(),
)

@Suppress("unused")
val protonPassDisableAppLockPatch = bytecodePatch(
    name = "Disable app lock",
    description = "Forces Proton Pass app lock and biometric authentication into the disabled/authenticated state and prevents auto-lock timeouts.",
    default = false,
) {
    compatibleWith(PROTON_PASS_COMPATIBILITY, PROTON_PASS_FDROID_COMPATIBILITY)

    execute {
        val appLockMethod = AppLockStateMapperFingerprint.method
        var appLockPatched = false
        appLockMethod.implementation?.instructions?.forEachIndexed { index, instruction ->
            if (instruction.opcode != Opcode.SGET_OBJECT) return@forEachIndexed
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                ?: return@forEachIndexed
            if (field.definingClass == "Lproton/android/pass/preferences/AppLockState\$Enabled;") {
                appLockMethod.replaceInstruction(
                    index,
                    "sget-object p1, Lproton/android/pass/preferences/AppLockState\$Disabled;->INSTANCE:Lproton/android/pass/preferences/AppLockState\$Disabled;",
                )
                appLockPatched = true
            }
        }
        if (!appLockPatched) {
            throw PatchException("Could not find Proton Pass enabled app-lock state")
        }

        val authMethod = HasAuthenticatedMapperFingerprint.method
        var authPatched = false
        authMethod.implementation?.instructions?.forEachIndexed { index, instruction ->
            if (instruction.opcode != Opcode.SGET_OBJECT) return@forEachIndexed
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                ?: return@forEachIndexed
            if (field.definingClass == "Lproton/android/pass/preferences/HasAuthenticated\$NotAuthenticated;") {
                authMethod.replaceInstruction(
                    index,
                    "sget-object p1, Lproton/android/pass/preferences/HasAuthenticated\$Authenticated;->INSTANCE:Lproton/android/pass/preferences/HasAuthenticated\$Authenticated;",
                )
                authPatched = true
            }
        }
        if (!authPatched) {
            throw PatchException("Could not find Proton Pass unauthenticated state")
        }

        LastUnlockTimeFingerprint.method.apply {
            ensureRegisters(2)
            clearBody()
            addInstructions(0, "const-wide v0, 0x7fffffffffffffffL\nreturn-wide v0")
        }
    }
}
