package dev.brave.patches.ui

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.brave.patches.shared.COMPATIBILITY_BRAVE

private const val TAB_GROUP_HELPER = "Ldev/brave/extension/ui/TabGroupOrderHelper;"

internal object TabGroupNextTabFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/tabmodel/TabCollectionTabModelImpl;",
    name = "E",
    returnType = "Lorg/chromium/chrome/browser/tab/Tab;",
    parameters = listOf("Lorg/chromium/base/Token;", "Ljava/util/List;")
)

@Suppress("unused")
val closeTabInGroupOrderPatch = patch(
    name = "Close Tab In Group Order",
    description = "Selects the previous tab in the tab group when closing a tab instead of jumping forward."
) {
    compatibleWith(COMPATIBILITY_BRAVE)

    extendWith("extensions/brave.mpe")

    execute {
        TabGroupNextTabFingerprint.method.apply {
            val callIdx = instructions.indices.indexOfFirst { idx ->
                val inst = instructions[idx]
                if (inst.opcode != Opcode.INVOKE_STATIC) return@indexOfFirst false
                val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference ?: return@indexOfFirst false
                ref.definingClass == "Lrqc;" && ref.name == "a"
            }
            if (callIdx < 0) {
                throw PatchException("Could not locate Lrqc;->a call in TabCollectionTabModelImpl->E")
            }
            val inst = instructions[callIdx] as FiveRegisterInstruction
            val rC = inst.registerC
            val rD = inst.registerD
            val rE = inst.registerE
            replaceInstruction(
                callIdx,
                "invoke-static {v$rC, v$rD, v$rE}, $TAB_GROUP_HELPER->selectPreviousTabInGroup(Ljava/lang/Iterable;ILjava/util/List;)Lorg/chromium/chrome/browser/tab/Tab;"
            )
        }
    }
}
