package morningentree.morphe.patches.droplert.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import morningentree.morphe.patches.all.detection.pairip.disablePairipPatch
import morningentree.morphe.patches.droplert.shared.Constants
import morningentree.morphe.util.getReference
import morningentree.morphe.util.returnEarly
import java.util.logging.Logger

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks Droplert Premium",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(disablePairipPatch)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        val refresh = RevenueCatStateRefreshFingerprint.method
        val insns = refresh.instructionsOrNull?.toList()
            ?: throw PatchException("Droplert: state-refresh method has no instructions.")

        val isActiveIndex = insns.indexOfFirst { insn ->
            val ref = insn.getReference<MethodReference>()
            ref?.definingClass == "Lcom/revenuecat/purchases/EntitlementInfo;" &&
                ref.name == "isActive"
        }
        if (isActiveIndex < 0) {
            throw PatchException("Droplert: EntitlementInfo.isActive call not found in state refresh.")
        }

        val guardIndex = (isActiveIndex + 1 until insns.size).firstOrNull {
            insns[it].opcode == Opcode.IF_NEZ
        } ?: throw PatchException("Droplert: premium guard branch not found in state refresh.")

        val guardRegister = (insns[guardIndex] as OneRegisterInstruction).registerA
        refresh.addInstruction(guardIndex, "const/16 v$guardRegister, 0x1")
        logger.info("Droplert: forced RevenueCat state refresh to publish PREMIUM (lifetime).")

        IsPremiumForCustomerInfoFingerprint.method.returnEarly(true)
    }
}
