/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.actions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.pinterest.misc.extension.requireFreeAt
import app.morphe.patches.pinterest.misc.extension.requireParameterIntact
import app.morphe.patches.pinterest.misc.extension.writeStub
import app.morphe.patches.pinterest.ui.methodsWithString
import app.morphe.patches.pinterest.ui.mutable
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val LONG_PRESS_V2_FLAG = "android_longpress_menu_v2"
internal const val COMPOSE_ITEMS_HOOK = "$LONG_PRESS->composeItems(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;"
internal const val COMPOSE_CLICK_HOOK = "$LONG_PRESS->composeClick(Ljava/lang/Object;Ljava/lang/Object;)Z"
internal val COMPOSE_STUBS = listOf("composeOptionType", "composeIconAndLabel", "composeKind")
private const val PAIR = "Lkotlin/Pair;"
private const val ARRAY_LIST = "Ljava/util/ArrayList;"

internal class LongPressCompose(
    val face: ClassDef, val kinds: ClassDef, val dispatcher: Method,
    val listAt: Int, val items: Int, val event: Int,
    val effect: Method, val clickAt: Int, val option: Int, val holder: Int, val pinRead: FieldReference, val scratch: Int, val done: Int,
)

private fun Method.body() = implementation?.instructions?.toList().orEmpty()
private fun Instruction.ref() = (this as? ReferenceInstruction)?.reference
private fun <T> List<T>.one(what: String) = singleOrNull()
    ?: throw PatchException("Long-press download: $what: expected one exact target, found $size")

/** Every path to the hook must carry the same value the identified instruction wrote. */
private fun Method.requireHeld(write: Int, at: Int) {
    val flow = ControlFlow.of(this)
    val register = (flow.instructions[write] as OneRegisterInstruction).registerA
    val previous = Array(flow.instructions.size) { mutableListOf<Int>() }
    flow.instructions.indices.forEach { from ->
        (flow.normal[from] + flow.exceptional[from]).forEach { previous[it] += from }
    }
    val pending = ArrayDeque<Int>()
    val seen = mutableSetOf<Int>()
    pending.addAll(previous[at])
    while (pending.isNotEmpty()) {
        val index = pending.removeFirst()
        if (!seen.add(index) || index == write) continue
        val instruction = flow.instructions[index]
        val destination = (instruction as? OneRegisterInstruction)?.registerA
        if (index == 0 || instruction.opcode.setsRegister() &&
            (destination == register || instruction.opcode.setsWideRegister() && destination?.plus(1) == register)) {
            throw PatchException("Long-press download: v$register no longer holds the identified value at $at")
        }
        pending.addAll(previous[index])
    }
    if (write !in seen) throw PatchException("Long-press download: the identified value never reaches $at")
}

internal fun BytecodePatchContext.longPressCompose(menu: LongPressMenu): LongPressCompose {
    val faces = mutableListOf<ClassDef>()
    classDefForEach { owner ->
        if (AccessFlags.PUBLIC.isSet(owner.accessFlags) && AccessFlags.INTERFACE.isSet(owner.accessFlags) &&
            owner.methods.count() == 2 && owner.methods.all { it.parameterTypes.isEmpty() && AccessFlags.ABSTRACT.isSet(it.accessFlags) } &&
            owner.methods.any { it.name == "iconAndLabel" && it.returnType == PAIR } &&
            owner.methods.any { it.name == "getAnalyticsName" && it.returnType == "Ljava/lang/String;" }) faces += owner
    }
    val face = faces.one("the newer menu option interface")
    val enums = mutableListOf<ClassDef>()
    classDefForEach { owner ->
        if (face.type in owner.interfaces && AccessFlags.PUBLIC.isSet(owner.accessFlags) && AccessFlags.ENUM.isSet(owner.accessFlags) &&
            listOf("REPIN", "SEND", "VISUAL_SEARCH").all { name -> owner.fields.any {
                it.name == name && it.type == owner.type && AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags)
            } }) enums += owner
    }
    val kinds = enums.one("the newer pin menu options")
    val icons = kinds.methods.single { it.name == "iconAndLabel" }.body().mapNotNull { it.ref() as? FieldReference }
    if (icons.none { it.definingClass == menu.icon } || icons.none { it.definingClass == menu.strings && it.name == MENU_LABEL }) {
        throw PatchException("Long-press download: newer menu icons and strings disagree with the native menu")
    }
    val dispatcher = methodsWithString(LONG_PRESS_V2_FLAG).filter { method ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" && method.parameterTypes.size == 1 &&
            classDefByOrNull(method.parameterTypes.single().toString())?.superclass == menu.event &&
            method.body().any { instruction -> (instruction.ref() as? MethodReference)?.let { call ->
                call.definingClass == menu.event && call.returnType == menu.model.type && call.parameterTypes.isEmpty()
            } == true } &&
            // The board long-press event shares the superclass and has a dispatcher of its own.
            method.body().any { it.opcode == Opcode.CHECK_CAST && it.ref().toString() == menu.pin } &&
            method.body().any { it.ref().toString().startsWith("Landroidx/compose/ui/platform/ComposeView;") }
    }.one("the newer pin menu dispatcher")
    val body = dispatcher.body()
    val alias = body.first() as? TwoRegisterInstruction
    if (body.first().opcode != Opcode.MOVE_OBJECT_FROM16 || alias?.registerB != dispatcher.implementation!!.registerCount - 1) {
        throw PatchException("Long-press download: the newer dispatcher no longer keeps its event at entry")
    }
    dispatcher.requireParameterIntact("Long-press download", 0, listOf(0))
    val builders = body.mapNotNull { it.ref() as? MethodReference }.distinctBy { it.toString() }.filter { call ->
        call.returnType == ARRAY_LIST && call.parameterTypes.size == 1 && classDefByOrNull(call.definingClass)?.methods?.any { method ->
            method.name == call.name && method.parameterTypes == call.parameterTypes && method.returnType == call.returnType &&
                method.body().any { it.opcode == Opcode.CHECK_CAST && it.ref().toString() == kinds.type }
        } == true
    }
    val builder = builders.one("the pin menu option builder")
    val listAt = body.indices.filter { body[it].ref().toString() == builder.toString() }.one("the newer menu's option list") + 2
    if (body[listAt - 1].opcode != Opcode.MOVE_RESULT_OBJECT) {
        throw PatchException("Long-press download: the newer menu's option list isn't kept")
    }
    val items = (body[listAt - 1] as OneRegisterInstruction).registerA
    if (items !in 0..15 || alias.registerA !in 0..15 || items == alias.registerA) {
        throw PatchException("Long-press download: newer menu inputs do not fit a direct call")
    }
    dispatcher.requireHeld(0, listAt)
    if ((mutable(dispatcher).implementation!!.instructions[listAt] as BuilderInstruction).location.labels.isNotEmpty()) {
        throw PatchException("Long-press download: newer menu insertion is also a branch target")
    }

    val effects = mutableListOf<Method>()
    classDefForEach { owner -> owner.methods.filterTo(effects) { method ->
        method.name == "invokeSuspend" && method.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;") &&
            method.returnType == "Ljava/lang/Object;" && method.body().any { it.ref().toString() == "${kinds.type}->REPIN:${kinds.type}" } &&
            method.body().any { (it.ref() as? FieldReference)?.type == menu.pin }
    } }
    val effect = effects.one("the newer pin action effect")
    val code = effect.body()
    val clickAt = code.indices.filter { code[it].ref().toString() == "${kinds.type}->REPIN:${kinds.type}" }.one("the first pin action")
    val optionAt = (0 until clickAt).filter { code[it].opcode == Opcode.IGET_OBJECT && (code[it].ref() as? FieldReference)?.type == face.type }
        .one("the selected native option")
    // The tap carries a small holder of the pin and where it was pressed, and the effect reads the pin out of it.
    val pinRead = code.mapNotNull { it.ref() as? FieldReference }.filter { it.type == menu.pin }.distinctBy { it.toString() }
        .one("the selected native pin")
    val holderAt = (0 until clickAt).filter { code[it].opcode == Opcode.IGET_OBJECT && (code[it].ref() as? FieldReference)?.type == pinRead.definingClass }
        .one("the selected native pin's holder")
    val lastAction = code.indices.filter { code[it].ref().toString() == "${kinds.type}->VISUAL_SEARCH:${kinds.type}" }.one("the last pin action")
    val done = (lastAction + 1 until code.size).firstOrNull { code[it].opcode == Opcode.SGET_OBJECT &&
        (code[it].ref() as? FieldReference)?.definingClass == "Lkotlin/Unit;" }
        ?: throw PatchException("Long-press download: missing native pin action completion")
    val scratch = (code[clickAt] as OneRegisterInstruction).registerA
    val option = (code[optionAt] as OneRegisterInstruction).registerA
    val holder = (code[holderAt] as OneRegisterInstruction).registerA
    if (listOf(scratch, option, holder).any { it !in 0..15 } || scratch == option || scratch == holder) {
        throw PatchException("Long-press download: native click inputs do not fit the hook")
    }
    effect.requireHeld(optionAt, clickAt)
    effect.requireHeld(holderAt, clickAt)
    effect.requireFreeAt("Long-press download", clickAt, listOf(scratch), targets = listOf(done))
    if ((mutable(effect).implementation!!.instructions[clickAt] as BuilderInstruction).location.labels.isNotEmpty()) {
        throw PatchException("Long-press download: pin action insertion is also a branch target")
    }
    return LongPressCompose(face, kinds, dispatcher, listAt, items, alias.registerA, effect, clickAt, option, holder, pinRead, scratch, done)
}

internal fun BytecodePatchContext.applyLongPressCompose(menu: LongPressMenu, found: LongPressCompose) {
    writeStub(LONG_PRESS, "composeOptionType", 1, """
        const-class v0, ${found.face.type}
        return-object v0
    """)
    writeStub(LONG_PRESS, "composeIconAndLabel", 3, """
        new-instance v0, $PAIR
        sget-object v1, ${menu.icon}->DOWNLOAD:${menu.icon}
        sget v2, ${menu.strings}->$DOWNLOAD_LABEL:I
        invoke-static { v2 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
        move-result-object v2
        invoke-direct { v0, v1, v2 }, $PAIR-><init>(Ljava/lang/Object;Ljava/lang/Object;)V
        return-object v0
    """)
    writeStub(LONG_PRESS, "composeKind", 3, """
        instance-of v0, p0, ${found.kinds.type}
        if-eqz v0, :other
        sget-object v0, ${found.kinds.type}->REPIN:${found.kinds.type}
        if-eq p0, v0, :save
        sget-object v0, ${found.kinds.type}->SEND:${found.kinds.type}
        if-eq p0, v0, :send
        sget-object v0, ${found.kinds.type}->VISUAL_SEARCH:${found.kinds.type}
        if-eq p0, v0, :search
        :other
        const/4 v0, 0x0
        return v0
        :save
        const/4 v0, 0x1
        return v0
        :send
        const/4 v0, 0x2
        return v0
        :search
        const/4 v0, 0x3
        return v0
    """)
    mutable(found.dispatcher).addInstructions(found.listAt, """
        invoke-static { v${found.items}, v${found.event} }, $COMPOSE_ITEMS_HOOK
        move-result-object v${found.items}
    """)
    val effect = mutable(found.effect)
    val done = effect.implementation!!.instructions[found.done] as BuilderInstruction
    effect.addInstructionsWithLabels(found.clickAt, """
        iget-object v${found.scratch}, v${found.holder}, ${found.pinRead}
        invoke-static { v${found.option}, v${found.scratch} }, $COMPOSE_CLICK_HOOK
        move-result v${found.scratch}
        if-nez v${found.scratch}, :hush_native_done
    """, ExternalLabel("hush_native_done", done))
}
