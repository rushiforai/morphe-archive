package app.morphe.patches.capcut

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.Constants
import app.morphe.patches.shared.replaceWithReturnBoolean

private object CutSamePurchaseViewModelU6Fingerprint : Fingerprint(
    definingClass = "Lcom/vega/libcutsame/viewmodel/CutSamePurchaseViewModel;",
    name = "A6",
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    custom = { method, _ ->
        val instructions = method.implementation?.instructions ?: emptyList()
        instructions.any { (it as? ReferenceInstruction)?.reference.toString().contains("IGeneralTemplatePaidExportFunction") } &&
            instructions.none { (it as? ReferenceInstruction)?.reference.toString().contains("IBusinessTemplateExportFunction") }
    },
)

private object CutSamePurchaseViewModelX6Fingerprint : Fingerprint(
    definingClass = "Lcom/vega/libcutsame/viewmodel/CutSamePurchaseViewModel;",
    name = "D6",
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            (it as? ReferenceInstruction)?.reference.toString().contains("IBusinessTemplateExportFunction")
        } == true
    },
)

private object CutSamePurchaseViewModelW6Fingerprint : Fingerprint(
    definingClass = "Lcom/vega/libcutsame/viewmodel/CutSamePurchaseViewModel;",
    name = "C6",
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            (it as? ReferenceInstruction)?.reference.toString().contains("BeautyConfig")
        } == true
    },
)

private object CutSamePurchaseViewModelZ6Fingerprint : Fingerprint(
    definingClass = "Lcom/vega/libcutsame/viewmodel/CutSamePurchaseViewModel;",
    name = "F6",
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            (it as? ReferenceInstruction)?.reference.toString().contains("isPaidExportTemplate")
        } == true
    },
)

private object CutSamePurchaseViewModelA6Fingerprint : Fingerprint(
    definingClass = "Lcom/vega/libcutsame/viewmodel/CutSamePurchaseViewModel;",
    name = "G6",
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            (it as? ReferenceInstruction)?.reference.toString().contains("CommerceRewardAdInfo")
        } == true
    },
)

@Suppress("unused")
val capcutUnlockPremiumTemplatesPatch = bytecodePatch(
    name = "Unlock Premium Templates",
    description = "Marks premium template styles as available so locked template features stay usable.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_CAPCUT)

    execute {
        var patched = 0

        CutSamePurchaseViewModelU6Fingerprint.method.replaceWithReturnBoolean(true)
        patched++
        CutSamePurchaseViewModelX6Fingerprint.method.replaceWithReturnBoolean(true)
        patched++
        CutSamePurchaseViewModelW6Fingerprint.method.replaceWithReturnBoolean(true)
        patched++
        CutSamePurchaseViewModelZ6Fingerprint.method.replaceWithReturnBoolean(false)
        patched++
        CutSamePurchaseViewModelA6Fingerprint.method.replaceWithReturnBoolean(false)
        patched++

        println("[Unlock Premium Templates] Applied $patched hooks -> premium template flags enabled.")
    }
}
