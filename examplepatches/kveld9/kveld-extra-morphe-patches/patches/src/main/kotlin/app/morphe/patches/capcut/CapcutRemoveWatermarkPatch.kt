package app.morphe.patches.capcut

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.Constants
import app.morphe.patches.shared.replaceWithReturnBoolean
import com.android.tools.smali.dexlib2.AccessFlags

private object WatermarkBusinessFunctionB4Fingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscription/biz/function/WatermarkBusinessFunction;",
    name = "B4",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Lcom/vega/subscriptionapi/biz/function/WatermarkSceneParams;"),
)

private object WatermarkBusinessFunctionQ0Fingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscription/biz/function/WatermarkBusinessFunction;",
    name = "Q0",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Lcom/vega/subscriptionapi/biz/function/WatermarkSceneParams;"),
)

private object WatermarkBusinessFunctionD4Fingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscription/biz/function/WatermarkBusinessFunction;",
    name = "C4",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Lcom/lemon/lv/clipmonetize/wrapper/BenefitResource;"),
)

private object WatermarkBusinessFunctionF4Fingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscription/biz/function/WatermarkBusinessFunction;",
    name = "E4",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Lcom/vega/subscriptionapi/biz/function/WatermarkBusinessParam;", "Lcom/lemon/lv/clipmonetize/wrapper/BenefitResource;"),
)

private object WatermarkBusinessFunctionV4Fingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscription/biz/function/WatermarkBusinessFunction;",
    name = "v4",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Lcom/lemon/lv/clipmonetize/wrapper/BenefitResource;"),
)

private object WatermarkBusinessFunctionY2Fingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscription/biz/function/WatermarkBusinessFunction;",
    name = "y2",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)

private object EditConfigKFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/lv/editor/EditConfig;",
    name = "k",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)

@Suppress("unused")
val capcutRemoveWatermarkPatch = bytecodePatch(
    name = "Remove Watermark",
    description = "Forces CapCut watermark-removal gates and default ending gate to allow export without watermark or outro.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_CAPCUT)

    execute {
        var patched = 0

        WatermarkBusinessFunctionB4Fingerprint.method.replaceWithReturnBoolean(true)
        patched++
        WatermarkBusinessFunctionQ0Fingerprint.method.replaceWithReturnBoolean(true)
        patched++
        WatermarkBusinessFunctionD4Fingerprint.method.replaceWithReturnBoolean(true)
        patched++
        WatermarkBusinessFunctionF4Fingerprint.method.replaceWithReturnBoolean(true)
        patched++
        WatermarkBusinessFunctionV4Fingerprint.method.replaceWithReturnBoolean(true)
        patched++
        WatermarkBusinessFunctionY2Fingerprint.method.replaceWithReturnBoolean(false)
        patched++
        EditConfigKFingerprint.method.replaceWithReturnBoolean(false)
        patched++

        println("[Remove Watermark] Applied $patched hooks -> watermark and default ending gates forced to allow removal.")
    }
}
