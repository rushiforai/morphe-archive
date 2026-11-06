/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
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
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val GREETING_ROW = "home_feed_greeting_header_icon_container"
internal const val GREETING_NEWSHUB = "home_feed_greeting_header_newshub_icon"
internal const val GREETING_CREATE = "home_feed_greeting_header_create_icon"
internal const val GREETING_HEADER_HOOK = "$INTERFACE_CONTROLS->greetingHeader(Landroid/view/View;)V"

internal class GreetingHeader(val builder: MutableMethod, val row: Int, val hookAt: Int)

/**
 * Home's greeting header, where 14.43.0 puts Create and Notifications (or Inbox) on accounts whose
 * bottom bar has neither. One method finds the button row by [GREETING_ROW], adds an optional tuner
 * and Create to it, then a frame it gave the id [GREETING_NEWSHUB] that holds the bell or inbox
 * button and its badge. Create gets [GREETING_CREATE] from its button state as it's built, so the
 * extension tells the two apart by name. The hook goes right after the call that adds the frame,
 * the last one on the row, so both buttons are in. The branch that skips the row when there is none
 * lands on the instruction after the hook: an inserted instruction takes no label, so it never runs
 * then.
 */
internal fun BytecodePatchContext.greetingHeader(): GreetingHeader {
    fun Method.reads(name: String) = implementation?.instructions?.any { instruction ->
        instruction.opcode == Opcode.SGET && ((instruction as ReferenceInstruction).reference as FieldReference).name == name
    } == true
    val found = mutableListOf<Method>()
    classDefForEach { owner ->
        owner.methods.filterTo(found) { it.returnType == "V" && it.reads(GREETING_ROW) && it.reads(GREETING_NEWSHUB) }
    }
    val builder = mutable(found.one("Greeting header builder"))
    val instructions = builder.instructions()
    fun call(at: Int) = (instructions.getOrNull(at) as? ReferenceInstruction)?.reference as? MethodReference
    fun loads(at: Int, name: String) = instructions[at].opcode == Opcode.SGET &&
        ((instructions[at] as ReferenceInstruction).reference as FieldReference).name == name
    val lookup = instructions.indices.filter { at ->
        at + 3 < instructions.size && loads(at, GREETING_ROW) && call(at + 1)?.name == "findViewById"
    }.one("Greeting header row lookup")
    val cast = instructions[lookup + 3]
    if (instructions[lookup + 2].opcode != Opcode.MOVE_RESULT_OBJECT || cast.opcode != Opcode.CHECK_CAST ||
        (cast as OneRegisterInstruction).registerA != (instructions[lookup + 2] as OneRegisterInstruction).registerA
    ) {
        throw PatchException("Greeting header: the row lookup's result isn't cast straight away")
    }
    val row = cast.registerA
    val newshub = (instructions[instructions.indices.filter { loads(it, GREETING_NEWSHUB) }.one("Greeting header bell id")]
        as ReferenceInstruction).reference as FieldReference
    if (classDefBy(newshub.definingClass).fields.none { it.name == GREETING_CREATE }) {
        throw PatchException("Greeting header: ${newshub.definingClass} has no $GREETING_CREATE id for Create")
    }
    val named = instructions.indices.filter { at ->
        call(at)?.let { it.name == "setId" && it.parameters() == listOf("I") } == true && at > 0 && loads(at - 1, GREETING_NEWSHUB) &&
            (instructions[at] as FiveRegisterInstruction).registerD == (instructions[at - 1] as OneRegisterInstruction).registerA
    }.one("Greeting header bell frame id")
    val frame = (instructions[named] as FiveRegisterInstruction).registerC
    val added = instructions.indices.filter { at ->
        call(at)?.let { it.definingClass == "Landroid/view/ViewGroup;" && it.name == "addView" &&
            it.parameters() == listOf("Landroid/view/View;") } == true &&
            (instructions[at] as FiveRegisterInstruction).registerC == row
    }
    val last = added.lastOrNull() ?: throw PatchException("Greeting header: nothing is added to the button row")
    if ((instructions[last] as FiveRegisterInstruction).registerD != frame || last + 1 >= instructions.size) {
        throw PatchException("Greeting header: the bell frame is no longer the last button added to the row")
    }
    return GreetingHeader(builder, row, last + 1)
}

/** Fold tabs visually without changing their indexes or the host's navigation models. */
@Suppress("unused")
val hideNavigationButtonsPatch = bytecodePatch(
    name = "Hide navigation buttons",
    description = "Lets you hide the Create, Notifications and Search buttons in the bottom bar, each with its own " +
        "switch. The Create and Notifications switches also cover those buttons at the top of Home. Home and " +
        "Profile stay. Starts off. Turn them on in HushPinterest settings > Interface.",
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
        val greeting = greetingHeader()
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
        greeting.builder.addInstructions(greeting.hookAt,
            "invoke-static/range { v${greeting.row} .. v${greeting.row} }, $GREETING_HEADER_HOOK")
        enableCapability("navigationButtons")
        enableStatus("hideNavigationButtons")
    }
}
