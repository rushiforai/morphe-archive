package dev.rikunode.fairemail

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Personal backup-only experiment. Opens the *existing* export flow directly,
 * without changing the global Pro entitlement, billing code or import behavior.
 *
 * This DOES NOT patch an installed official APK in place: Morphe re-signs its
 * output and Android refuses to replace the official install with that APK.
 */
@Suppress("unused")
val enableSettingsExportPatch = bytecodePatch(
    name = "Enable local settings export (experimental)",
    description = "Permit the built-in encrypted account/settings export dialog. Does not grant other Pro features. Re-signed APK cannot access an existing official installation's data.",
    default = false,
) {
    compatibleWith(
        Compatibility(
            name = "FairEmail",
            packageName = "eu.faircode.email",
            apkFileType = ApkFileType.APK,
            appIconColor = 0x157B9B,
            targets = listOf(
                AppTarget(version = "1.2337", versionCode = 2337),
                AppTarget(version = "1.2338", versionCode = 2338),
            ),
        )
    )

    execute {
        val className = "Leu/faircode/email/FragmentOptionsBackup;"
        val source = classDefBy(className)
        val matches = source.methods.filter {
            it.name == "onExportDialog" &&
                it.parameterTypes.isEmpty() &&
                it.returnType == "V"
        }.toList()
        require(matches.size == 1) { "Unsupported FairEmail: export entrypoint changed" }
        val target = matches.single()
        val implementation = requireNotNull(target.implementation) {
            "Export entrypoint has no code"
        }
        // Fail closed if upstream changes either the paywall or export dialog.
        val calls = implementation.instructions
            .filterIsInstance<ReferenceInstruction>()
            .mapNotNull { it.reference as? MethodReference }
        require(calls.any {
            it.definingClass == "Leu/faircode/email/ActivityBilling;" &&
                it.name == "isPro" && it.parameterTypes.size == 1 && it.returnType == "Z"
        }) { "Expected export-only Pro guard missing" }
        require(calls.any {
            it.definingClass == className &&
                it.name == "askPassword" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Z") &&
                it.returnType == "V"
        }) { "Expected encrypted export dialog missing" }
        require(implementation.registerCount >= 2) {
            "Not enough registers for safe export-only replacement"
        }

        val mutable = mutableClassDefBy(className)
        val method = mutable.methods.single {
            it.name == "onExportDialog" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        // Early return bypasses only this button's billing branch. The existing
        // askPassword(true) -> ACTION_CREATE_DOCUMENT -> handleExport path is untouched.
        method.addInstructions(
            0,
            """
            const/4 v0, 0x1
            invoke-direct {p0, v0}, Leu/faircode/email/FragmentOptionsBackup;->askPassword(Z)V
            return-void
            """.trimIndent()
        )
    }
}
