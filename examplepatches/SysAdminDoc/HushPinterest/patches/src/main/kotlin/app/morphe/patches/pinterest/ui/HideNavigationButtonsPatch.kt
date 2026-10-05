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
    description = "Adds separate switches for the Create and Updates navigation buttons. Home, Search and Profile remain available.",
    default = false,
) {
    category("Interface")
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
                enum.fields.map { it.name }.containsAll(listOf("HOME", "PROFILE", "CREATE", "NOTIFICATIONS"))
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
        val scratch = bind.freeLocalsAt("Navigation tab binding", insertion, 1).single()
        requireOverride(navigation, "onMeasure", listOf("I", "I"))
        val parameter = bind.parameterRegister(0)
        bind.addInstructions(insertion, """
            iget-object v$scratch, $parameter, $tab
            invoke-static { v$viewRegister, v$scratch }, $INTERFACE_CONTROLS->bindNavigation(Landroid/view/View;Ljava/lang/Object;)V
        """)
        refreshOnMeasure(navigation, "refreshNavigation")
        enableCapability("navigationButtons")
        enableStatus("hideNavigationButtons")
    }
}
