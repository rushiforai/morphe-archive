package app.apppatches.patches.universalcopy

import app.apppatches.patches.shared.Constants.UNIVERSAL_COPY_COMPATIBILITY
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.matchSingle
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val ANDROID_MANIFEST = "AndroidManifest.xml"
private const val INTERNET_PERMISSION = "android.permission.INTERNET"

private val removeInternetPermissionPatch = resourcePatch {
    execute {
        document(ANDROID_MANIFEST).use { document ->
            val permissions = document.getElementsByTagName("uses-permission")

            for (index in permissions.length - 1 downTo 0) {
                val permission = permissions.item(index)
                if (permission.attributes?.getNamedItem("android:name")?.nodeValue == INTERNET_PERMISSION) {
                    permission.parentNode.removeChild(permission)
                }
            }
        }
    }
}

@Suppress("unused")
val unlockPlusPatch = bytecodePatch(
    name = "Unlock Plus",
    description = "Unlocks Universal Copy Plus: removes ads, upgrade prompts and the Internet permission, " +
        "and bypasses the PairIP license check so the patched app starts.",
    default = true
) {
    compatibleWith(UNIVERSAL_COPY_COMPATIBILITY)
    dependsOn(removeInternetPermissionPatch)

    execute {
        // ── PairIP: repacked APKs are not recognized as Play installs ─────────
        // The manifest Application and LicenseContentProvider both start the
        // check, so both entry points must be disabled.
        PairIpCheckLicenseFingerprint.matchSingle().method.addInstructions(0, "return-void")
        PairIpInitializeLicenseCheckFingerprint.matchSingle().method.addInstructions(0, "return-void")

        // ── Unlock Plus ───────────────────────────────────────────────────────
        // The entitlement check lives in the shared activity. It scans the Play
        // Billing purchases and updates the premium flag.
        val purchaseCheck = PlusStatusCheckFingerprint.matchSingle()
        val baseActivity = purchaseCheck.classDef

        // Find the premium flag updated at the end of the entitlement check.
        val statusIndex = purchaseCheck.method.indexOfFirstInstructionOrThrow {
            opcode == Opcode.IPUT_BOOLEAN && getReference<FieldReference>()?.type == "Z"
        }
        val premiumField = purchaseCheck.method.getInstruction(statusIndex)
            .getReference<FieldReference>()
            ?: throw PatchException("Premium status field not found")

        // Force the flag to true right before the activity UI is updated,
        // covering both fresh purchases and the cached premium path.
        val updateIndex = purchaseCheck.method.indexOfFirstInstructionOrThrow {
            opcode == Opcode.INVOKE_VIRTUAL &&
                getReference<MethodReference>()?.let {
                    it.name == "f" && it.parameterTypes.singleOrNull()?.toString() == "Z"
                } == true
        }
        val update = purchaseCheck.method.getInstruction<FiveRegisterInstruction>(updateIndex)
        purchaseCheck.method.addInstructions(
            updateIndex,
            """
                const/4 v${update.registerD}, 0x1
                iput-boolean v${update.registerD}, v${update.registerC}, ${baseActivity.type}->${premiumField.name}:Z
            """
        )

        // onCreate restores the cached status before the billing response
        // arrives, so set the flag there as well to unlock the UI early.
        val onCreate = baseActivity.methods.single {
            it.name == "onCreate" &&
                it.parameterTypes.singleOrNull()?.toString() == "Landroid/os/Bundle;"
        }
        val onCreateIndex = onCreate.indexOfFirstInstructionOrThrow {
            opcode == Opcode.IPUT_BOOLEAN && getReference<FieldReference>()?.name == premiumField.name
        }
        val onCreateRegister = onCreate.getInstruction<OneRegisterInstruction>(onCreateIndex).registerA
        onCreate.addInstruction(onCreateIndex, "const/4 v$onCreateRegister, 0x1")
    }
}
