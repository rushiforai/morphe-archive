package app.aidan.patches.sezzle.navigation

import app.aidan.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.aidan.patches.sezzle.shared.HermesBundleEditor
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch

private val EXPECTED_MOBILE_PLAN_GATE_BYTES = byteArrayOf(0x34, 0x03, 0x00, 0x3b)
private val HIDDEN_MOBILE_PLAN_GATE_BYTES = byteArrayOf(0x96.toByte(), 0x01, 0x76.toByte(), 0x01)
private val EXPECTED_MOBILE_PLAN_SECTION_BYTES = byteArrayOf(0x34, 0x07, 0x00, 0x40)
private val HIDDEN_MOBILE_PLAN_SECTION_BYTES = byteArrayOf(0x93.toByte(), 0x01, 0x76, 0x01)

@Suppress("unused")
val hideSezzleMobilePatch = rawResourcePatch(
    name = "Hide Sezzle Mobile",
    description = "Hides Sezzle Mobile offers and account entry points.",
    default = false
) {
    category("Interface")
    compatibleWith(COMPATIBILITY_SEZZLE)

    execute {
        val bundleFile = get("assets/index.android.bundle")
        if (!bundleFile.exists()) {
            throw PatchException("assets/index.android.bundle not found")
        }

        val editor = HermesBundleEditor(bundleFile.readBytes())
        val mobilePlanGateOffset = editor.findFunctionOffsetByName("useIsSezzleMobilePlanEnabled")
            ?: throw PatchException("Failed to find function useIsSezzleMobilePlanEnabled in Hermes bundle")

        if (editor.matchesBytes(mobilePlanGateOffset, EXPECTED_MOBILE_PLAN_GATE_BYTES)) {
            editor.patchBytes(mobilePlanGateOffset, HIDDEN_MOBILE_PLAN_GATE_BYTES)
        } else if (!editor.matchesBytes(mobilePlanGateOffset, HIDDEN_MOBILE_PLAN_GATE_BYTES)) {
            throw PatchException("Unexpected bytecode at useIsSezzleMobilePlanEnabled")
        }

        val mobilePlanSectionOffsets = editor.findFunctionOffsetsByName("MobilePlanSection")
        val mobilePlanSectionOffset = mobilePlanSectionOffsets.singleOrNull()
            ?: throw PatchException(
                "Expected one Sezzle Mobile Wallet renderer, found ${mobilePlanSectionOffsets.size}"
            )
        if (editor.matchesBytes(mobilePlanSectionOffset, EXPECTED_MOBILE_PLAN_SECTION_BYTES)) {
            editor.patchBytes(mobilePlanSectionOffset, HIDDEN_MOBILE_PLAN_SECTION_BYTES)
        } else if (!editor.matchesBytes(mobilePlanSectionOffset, HIDDEN_MOBILE_PLAN_SECTION_BYTES)) {
            throw PatchException("Unexpected bytecode at MobilePlanSection")
        }

        editor.updateFooterHash()
        bundleFile.writeBytes(editor.toByteArray())
    }
}
