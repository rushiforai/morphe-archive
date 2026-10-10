/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.freeLocalsAt
import app.morphe.patches.pinterest.misc.extension.parameterRegister
import app.morphe.patches.pinterest.misc.extension.parameterRegisterNumber
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireParameterIntact
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Fold tabs visually without changing their indexes or the host's navigation models. */
@Suppress("unused")
val hideNavigationButtonsPatch = bytecodePatch(
    name = "Hide navigation buttons",
    description = "Lets you hide the Create, Notifications and Search buttons in the bottom bar, each with its own " +
        "switch. Home and Profile stay. Starts off. Turn them on in HushPinterest settings > Interface.",
) {
    category("Navigation")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("hideNavigationButtons")
        requireStatusMethod("navigationButtons")
        val modelDescription = methodsWithString("BottomNavTabModel(type=").filter { it.name == "toString" }
            .one("Bottom navigation tab model")
        val model = classDefBy(modelDescription.definingClass)
        val tab = model.fields.filter { field ->
            val enum = classDefByOrNull(field.type)
            enum?.superclass == "Ljava/lang/Enum;" &&
                enum.fields.map { it.name }.containsAll(listOf("HOME", "PROFILE", "CREATE", "NOTIFICATIONS", "SEARCH"))
        }.one("Bottom navigation tab identity")
        val navigationType = methodsWithString("BottomNavBar tab insertion out of range").map { it.definingClass }
            .distinct().one("Bottom navigation view")
        val navigation = mutableClassDefBy(navigationType)
        val bind = navigation.methods.filter { method ->
            method.returnType == "V" && method.parameterTypes.firstOrNull()?.toString() == model.type &&
                method.parameterTypes.getOrNull(1)?.toString() == "I" &&
                method.calls().any { it.name == "setId" && it.parameters() == listOf("I") }
        }.one("Bottom navigation tab binding")
        val at = bind.instructions().indices.filter { index ->
            val call = ((bind.instructions()[index] as? ReferenceInstruction)?.reference as? MethodReference)
            call?.name == "setId" && call.parameters() == listOf("I")
        }.one("Bottom navigation tab ID assignment")
        val viewRegister = (bind.instructions()[at] as? FiveRegisterInstruction)?.registerC
            ?: throw PatchException("Navigation setId is no longer a short-register invocation")
        val insertion = at + 1
        bind.requireParameterIntact("Navigation tab identity", 0, listOf(insertion))
        if (bind.parameterRegisterNumber(0) > 15 || viewRegister > 15) {
            throw PatchException("Navigation tab binding registers no longer fit its field access")
        }
        val scratch = bind.freeLocalsAt("Navigation tab binding", insertion, 1, reads = listOf(viewRegister)).single()
        // Pinterest also swaps a live tab for a freshly built view, as it does with Search when a pin
        // closeup returns. That view gets its ID here, never through the binding above.
        val replace = navigation.methods.filter { method ->
            method.returnType == "V" && method.parameterTypes.map { it.toString() }.let { it.size == 2 && it[1] == "I" } &&
                method.parameterTypes[0].toString() != model.type &&
                method.calls().any { it.name == "setId" && it.parameters() == listOf("I") } &&
                method.calls().any { it.name == "removeViewAt" && it.parameters() == listOf("I") }
        }.one("Bottom navigation tab replacement")
        val tabOwner = replace.parameterTypes[0].toString()
        val identity = replace.calls().filter { call ->
            call.definingClass == tabOwner && call.parameterTypes.isEmpty() && call.returnType == tab.type
        }.distinctBy { it.toString() }.one("Bottom navigation tab identity getter")
        val replaced = replace.instructions().indices.filter { index ->
            val call = ((replace.instructions()[index] as? ReferenceInstruction)?.reference as? MethodReference)
            call?.name == "setId" && call.parameters() == listOf("I")
        }.one("Bottom navigation replacement ID assignment")
        val replacedView = (replace.instructions()[replaced] as? FiveRegisterInstruction)?.registerC
            ?: throw PatchException("Navigation replacement setId is no longer a short-register invocation")
        val replacedAt = replaced + 1
        replace.requireParameterIntact("Navigation replacement tab", 0, listOf(replacedAt))
        if (replace.parameterRegisterNumber(0) > 15 || replacedView > 15) {
            throw PatchException("Navigation tab replacement registers no longer fit its interface call")
        }
        val replacedScratch = replace.freeLocalsAt("Navigation tab replacement", replacedAt, 1, reads = listOf(replacedView)).single()
        requireOverride(navigation, "onMeasure", listOf("I", "I"))
        val parameter = bind.parameterRegister(0)
        bind.addInstructions(insertion, """
            iget-object v$scratch, $parameter, $tab
            invoke-static { v$viewRegister, v$scratch }, $INTERFACE_CONTROLS->bindNavigation(Landroid/view/View;Ljava/lang/Object;)V
        """)
        replace.addInstructions(replacedAt, """
            invoke-interface { ${replace.parameterRegister(0)} }, $identity
            move-result-object v$replacedScratch
            invoke-static { v$replacedView, v$replacedScratch }, $INTERFACE_CONTROLS->bindNavigation(Landroid/view/View;Ljava/lang/Object;)V
        """)
        refreshOnMeasure(navigation, "refreshNavigation")
        enableCapability("navigationButtons")
        enableStatus("hideNavigationButtons")
    }
}
