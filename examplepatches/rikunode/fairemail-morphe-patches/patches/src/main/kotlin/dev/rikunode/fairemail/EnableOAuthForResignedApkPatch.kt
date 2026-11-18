package dev.rikunode.fairemail

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * FairEmail 1.2338 (including the 1.2338a GitHub APK):
 * permit its setup menu's two OAuth launch paths on a re-signed APK.
 *
 * Only the results of the two local signature checks inside the setup menu
 * are overridden. Helper.hasValidFingerprint, PackageManager, billing,
 * signing certificates, OAuth client IDs and server authorization are untouched.
 *
 * Verified source target: FragmentSetup.java, the quick-Gmail and generic
 * provider menu checks. Verified APK DEX: classes.dex,
 * FragmentSetup$7$1.onMenuItemClick(MenuItem), two invocations.
 */
@Suppress("unused")
val enableOAuthForResignedApkPatch = bytecodePatch(
    name = "Enable OAuth setup in re-signed FairEmail (experimental)",
    description = "Enable both Gmail and provider OAuth setup menu paths without modifying global signature checks. Google authorization is not guaranteed.",
    default = false,
) {
    compatibleWith(
        Compatibility(
            name = "FairEmail",
            packageName = "eu.faircode.email",
            apkFileType = ApkFileType.APK,
            appIconColor = 0x157B9B,
            targets = listOf(AppTarget(version = "1.2338", versionCode = 2338)),
        )
    )

    execute {
        val owner = "Leu/faircode/email/FragmentSetup\$7\$1;"
        val source = classDefBy(owner)
        val matches = source.methods.filter {
            it.name == "onMenuItemClick" &&
                it.parameterTypes.map(CharSequence::toString) ==
                    listOf("Landroid/view/MenuItem;") &&
                it.returnType == "Z"
        }.toList()
        require(matches.size == 1) {
            "Unsupported FairEmail: setup OAuth menu callback changed"
        }
        val original = matches.single()
        val implementation = requireNotNull(original.implementation) {
            "Unsupported FairEmail: setup menu callback has no code"
        }
        val instructions = implementation.instructions.toList()

        val checkIndices = instructions.indices.filter { index ->
            val reference = (instructions[index] as? ReferenceInstruction)
                ?.reference as? MethodReference
            instructions[index].opcode == Opcode.INVOKE_STATIC &&
                reference?.definingClass == "Leu/faircode/email/Helper;" &&
                reference.name == "hasValidFingerprint" &&
                reference.parameterTypes.map(CharSequence::toString) ==
                    listOf("Landroid/content/Context;") &&
                reference.returnType == "Z"
        }
        require(checkIndices.size == 2) {
            "Unsupported FairEmail: expected exactly two setup-menu fingerprint checks, found ${checkIndices.size}"
        }
        val resultRegisters = checkIndices.map { index ->
            require(index + 1 < instructions.size) {
                "Unsupported FairEmail: missing fingerprint result instruction"
            }
            val result = instructions[index + 1]
            require(result.opcode == Opcode.MOVE_RESULT) {
                "Unsupported FairEmail: fingerprint invoke not followed by move-result"
            }
            val register = (result as? OneRegisterInstruction)?.registerA
                ?: error("Unsupported FairEmail: fingerprint result register missing")
            require(register in 0..15) {
                "Unsupported FairEmail: fingerprint result register does not fit const/4"
            }
            register
        }

        val mutable = mutableClassDefBy(owner)
        val method = mutable.methods.single {
            it.name == "onMenuItemClick" &&
                it.parameterTypes.map(CharSequence::toString) ==
                    listOf("Landroid/view/MenuItem;") &&
                it.returnType == "Z"
        }
        // A one-code-unit replacement preserves instruction offsets and all
        // existing branch targets. Android's actual signing identity is unchanged.
        // Descending order avoids index drift even if the patcher implementation
        // later changes mutation bookkeeping.
        checkIndices.zip(resultRegisters).asReversed().forEach { (index, register) ->
            method.replaceInstruction(index + 1, "const/4 v${register}, 0x1")
        }
    }
}
