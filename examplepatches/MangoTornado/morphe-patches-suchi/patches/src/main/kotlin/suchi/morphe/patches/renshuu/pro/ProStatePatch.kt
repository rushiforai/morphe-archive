package suchi.morphe.patches.renshuu.pro

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import suchi.morphe.patches.renshuu.renshuuCompatibility

private val processUserDataFingerprint = Fingerprint(
    definingClass = "Lcom/renshuu/renshuu_org/MainActivityViewModel;",
    name = "processUserData",
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("proEnabled", "readingBuddy", "textAnaylzer"),
)

@Suppress("unused")
val proStatePatch = bytecodePatch(
    name = "Enable Pro menus",
    description = "Overrides local Pro, Reading Buddy and Text Analyzer menu flags for research. " +
        "Does not alter server-side account entitlement.",
    default = false,
) {
    compatibleWith(renshuuCompatibility)
    extendWith("extensions/renshuu.mpe")

    execute {
        val method = processUserDataFingerprint.method
        val mapCasts = method.implementation!!.instructions.withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.CHECK_CAST &&
                ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type ==
                "Ljava/util/Map;"
        }
        val mapCast = mapCasts.firstOrNull()
            ?: throw PatchException("Could not locate renshuu's parsed user data")
        val register = (mapCast.value as OneRegisterInstruction).registerA

        method.addInstruction(
            mapCast.index + 1,
            "invoke-static/range { v$register .. v$register }, " +
                "Lsuchi/morphe/extension/renshuu/ProState;" +
                "->overrideLocalState(Ljava/util/Map;)V",
        )
    }
}
