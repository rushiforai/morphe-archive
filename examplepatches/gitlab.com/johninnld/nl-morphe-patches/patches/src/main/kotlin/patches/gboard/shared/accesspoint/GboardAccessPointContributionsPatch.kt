package patches.gboard.shared.accesspoint

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import patches.gboard.shared.findMutableMethodOrThrow
import patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import patches.gboard.shared.isMethodReference
import patches.gboard.shared.isOpcode
import patches.gboard.shared.returnInstructionIndices
import patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import patches.gboard.shared.runtimeabi.RuntimeCallId
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardAccessPointContributions1803Patch = bytecodePatch(
    description = "Inject the 18.5.4 synthetic Access Point catalog and controller delegate in one place.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        findMutableMethodOrThrow(GboardAccessPointContributionsTargets.orderFactory)
            .applyAccessPointOrderCatalogDelegate1803()
        findMutableMethodOrThrow(GboardAccessPointContributionsTargets.controllerConstructor)
            .applyAccessPointControllerDelegate1803()
    }
}

internal fun MutableMethod.applyAccessPointOrderCatalogDelegate1803() {
    val call = RuntimeCallId.ACCESS_POINT_CONTRIBUTIONS_INCLUDE_ORDER_CATALOG
    val abi = RuntimeAbiCatalog.abi(call)
    val instructions = implementation?.instructions
        ?: error("No instructions in $definingClass->$name")
    val existing = instructions.count { it.isMethodReference(abi.reference) }
    if (existing > 0) {
        check(existing == 1) {
            "Malformed 18.5.4 Access Point order catalog delegate"
        }
        return
    }
    // The catalog delegate hands back the order set it was given, so the cast has to name the
    // method's own parameter type. Hardcoding the 18.6.3 name broke 18.8: that build kept a class
    // called `wim`, but the parameter was renamed to `auco`, and ART rejected the whole method
    // (`register v3 has type Reference: wim but expected Reference: auco`), which took every
    // access point (toolbar row, mic) down with it.
    val orderType = parameterTypes[3]
    require(orderType.startsWith("L") && orderType.endsWith(";")) {
        "Expected the order-set parameter at p3, found $orderType"
    }
    addInstructions(
        0,
        """
            move-object/from16 v0, p0

            move-object/from16 v1, p3

            ${RuntimeCallEmitter.invoke(call, "v0, v1")}

            move-result-object v0

            move-object/from16 p3, v0

            check-cast p3, $orderType
        """.trimIndent(),
    )
}

internal fun MutableMethod.applyAccessPointControllerDelegate1803() {
    val call = RuntimeCallId.ACCESS_POINT_CONTRIBUTIONS_AFTER_CONTROLLER_CREATED
    val abi = RuntimeAbiCatalog.abi(call)
    val instructions = implementation?.instructions
        ?: error("No instructions in $definingClass->$name")
    val returns = returnInstructionIndices().filter { instructions[it].isOpcode("RETURN_VOID") }
    check(returns.size == 1) { "Expected one mwv constructor return, found ${returns.size}" }
    val existing = instructions.count { it.isMethodReference(abi.reference) }
    if (existing > 0) {
        check(existing == 1) { "Duplicate 18.5.4 Access Point controller delegate" }
        return
    }
    addInstructions(
        returns.single(),
        RuntimeCallEmitter.invoke(call, "p0, p1"),
    )
}
