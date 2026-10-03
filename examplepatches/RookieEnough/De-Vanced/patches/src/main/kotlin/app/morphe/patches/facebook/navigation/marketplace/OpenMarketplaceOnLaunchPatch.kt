/*
 * Copyright 2026 De-Vanced
 * Copyright 2026 Hushfacebook contributors
 * [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
 *
 * Startup route adapted from Hushfacebook (GPL-3.0).
 * [https://github.com/SysAdminDoc/HushFacebook](https://github.com/SysAdminDoc/HushFacebook)
 */

package app.morphe.patches.facebook.navigation.marketplace

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.shared.Constants
import app.morphe.patches.facebook.shared.FacebookTargets
import app.morphe.patches.shared.misc.extension.sharedExtensionPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

private val extensionPatch = sharedExtensionPatch("facebook", false)

private const val MARKETPLACE_ROUTE =
    "Lapp/morphe/extension/facebook/settings/DeVancedSettings;"
private const val MARKETPLACE_ON_CREATE =
    "$MARKETPLACE_ROUTE->onMarketplaceActivityCreateV2(Landroid/app/Activity;Landroid/os/Bundle;)V"
private const val MARKETPLACE_START_ON_ASKED_TAB =
    "$MARKETPLACE_ROUTE->startMarketplaceOnAskedTab(Z)Z"
private const val MARKETPLACE_KEEP_ASKED_START_TAB =
    "$MARKETPLACE_ROUTE->keepMarketplaceAskedStartTab(Z)Z"
private const val MARKETPLACE_SET_SANITIZED_INTENT =
    "$MARKETPLACE_ROUTE->setMarketplaceSanitizedIntent(Landroid/app/Activity;Landroid/content/Intent;)V"

@Suppress("unused")
val openMarketplaceOnLaunchPatch = bytecodePatch(
    name = PATCH,
    description = "Opens Marketplace when Facebook is started from its launcher icon.",
) {
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(extensionPatch)

    execute {
        if (packageMetadata.versionName != FacebookTargets.V580) return@execute

        val picker = StartTabPickerFingerprint.method
        val handOverMethod = SanitizedIntentHandOverFingerprint.method
        val gateMethod = StartPositionGateFingerprint.method
        val keepMethod = KeepAskedStartTabFingerprint.method

        val handOverIndex = handOverMethod.findSanitizedIntentHandOverIndex()
            ?: error("$PATCH: sanitized-intent hand-over pattern not found")
        val gateIndex = gateMethod.findStartPositionGateIndex()
            ?: error("$PATCH: tab-bar start gate pattern not found")

        println(
            "[OpenMarketplaceOnLaunch] handOver=${handOverMethod.definingClass}->${handOverMethod.name} " +
                "gate=${gateMethod.definingClass}->${gateMethod.name} " +
                "keep=${keepMethod.definingClass}->${keepMethod.name}"
        )
        handOverMethod.handSanitizedIntentToExtension(handOverIndex)
        gateMethod.askExtensionAfterGate(gateIndex)
        keepMethod.askExtensionAtReturns()
        declaredInHierarchy(MAIN_TAB_ACTIVITY, "onCreate", "Landroid/os/Bundle;")
            .addInstruction(0, "invoke-static/range {p0 .. p1}, $MARKETPLACE_ON_CREATE")
        println("[OpenMarketplaceOnLaunch] picker=${picker.definingClass}->${picker.name}")
    }
}

private fun BytecodePatchContext.declaredInHierarchy(
    type: String,
    name: String,
    vararg parameters: String,
): MutableMethod {
    var current: ClassDef? = classDefByOrNull(type)
    while (current != null) {
        val method = mutableClassDefByOrNull(current.type)?.methods?.singleOrNull {
            it.name == name && it.returnType == "V" && it.implementation != null &&
                it.parameterTypes.map { value -> value.toString() } == parameters.toList()
        }
        if (method != null) return method
        current = current.superclass?.let { classDefByOrNull(it) }
    }
    error("No class of $type's hierarchy declares $name(${parameters.joinToString("")})V")
}

private fun MutableMethod.handSanitizedIntentToExtension(index: Int) {
    val call = implementation!!.instructions[index]
    val replacement = if (call is RegisterRangeInstruction) {
        "invoke-static/range {v${call.startRegister} .. v${call.startRegister + 1}}, $MARKETPLACE_SET_SANITIZED_INTENT"
    } else {
        val (screen, copy) = call.callRegisters()
        "invoke-static {v$screen, v$copy}, $MARKETPLACE_SET_SANITIZED_INTENT"
    }
    replaceInstruction(index, replacement)
}

private fun MutableMethod.askExtensionAfterGate(index: Int) {
    val branch = implementation!!.instructions[index + 1] as BuilderInstruction
    if (branch.location.labels.isNotEmpty()) {
        throw PatchException("$PATCH: $definingClass->$name has a jump to its start gate.")
    }
    val register = (implementation!!.instructions[index] as OneRegisterInstruction).registerA
    addInstructions(
        index + 1,
        """
            invoke-static/range {v$register .. v$register}, $MARKETPLACE_START_ON_ASKED_TAB
            move-result v$register
        """.trimIndent(),
    )
}

private fun MutableMethod.askExtensionAtReturns() {
    val returns = implementation!!.instructions.withIndex()
        .filter { it.value.opcode == Opcode.RETURN }
        .map { it.index to (it.value as OneRegisterInstruction).registerA }
    check(returns.isNotEmpty()) { "$PATCH: $definingClass->$name returns no answer." }
    returns.asReversed().forEach { (index, register) ->
        replaceInstruction(index, "invoke-static/range {v$register .. v$register}, $MARKETPLACE_KEEP_ASKED_START_TAB")
        addInstruction(index + 1, "move-result v$register")
        addInstruction(index + 2, "return v$register")
    }
}
