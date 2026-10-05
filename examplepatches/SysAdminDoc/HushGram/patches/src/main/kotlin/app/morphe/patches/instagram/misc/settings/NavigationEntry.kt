/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.settings

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.instagram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val TAB_FACTORY = "InstagramMainActivity.createTabButton("
internal const val NAVIGATION = "$EXTENSION_PACKAGE/settings/NavigationSettings;"
internal const val NAV_REMEMBER = "$NAVIGATION->remember(Landroid/view/View;Ljava/lang/Object;Landroid/view/View\$OnLongClickListener;)Landroid/view/View\$OnLongClickListener;"
internal const val NAV_BIND = "$NAVIGATION->bind(Landroid/view/View;Ljava/lang/Object;)V"
private const val VIEW = "Landroid/view/View;"
private const val LONG_LISTENER = "Landroid/view/View\$OnLongClickListener;"
private const val SET_LISTENER = "$VIEW->setOnLongClickListener($LONG_LISTENER)V"

/** All owners, registers and branch targets are checked before any patch writes an instruction. */
internal data class NavigationEntryTargets(
    val factory: Method,
    val returnIndex: Int,
    val viewRegister: Int,
    val tabRegister: Int,
    val enumField: String,
    val setters: List<Method>,
)

internal fun BytecodePatchContext.navigationEntryTargets(): NavigationEntryTargets {
    fun refuse(why: String): Nothing = throw PatchException("Navigation settings: $why")
    fun Method.code() = implementation?.instructions?.toList().orEmpty()
    fun Method.strings() = code().mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
    val classes = mutableListOf<ClassDef>()
    classDefForEach { classes += it }
    val tab = classes.filter { it.superclass == "Ljava/lang/Enum;" && it.methods.any { method ->
        method.name == "<clinit>" && method.strings().containsAll(listOf("FEED", "CLIPS", "clips_viewer_clips_tab"))
    } }.singleOrNull() ?: refuse("expected one native tab enum")
    val factory = classes.flatMap { it.methods }.filter { TAB_FACTORY in it.strings() }.singleOrNull()
        ?: refuse("expected one createTabButton factory")
    val params = factory.parameterTypes.map { it.toString() }
    if (factory.definingClass != MAIN_ACTIVITY || !AccessFlags.STATIC.isSet(factory.accessFlags) ||
        factory.returnType != VIEW || params.size != 8 ||
        params.take(3) != listOf("Landroid/view/ViewGroup;", MAIN_ACTIVITY, tab.type) ||
        params.takeLast(3) != listOf("I", "Z", "Z")) refuse("unexpected tab factory signature")
    val code = factory.code()
    val returns = code.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
    val end = returns.singleOrNull() ?: refuse("factory must return one view")
    val view = (end.value as OneRegisterInstruction).registerA
    val tabParameter = factory.implementation!!.registerCount - params.size + 2
    val first = code.firstOrNull() as? TwoRegisterInstruction ?: refuse("factory must retain its tab first")
    if (code.first().opcode !in listOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16) ||
        first.registerB != tabParameter) refuse("factory must retain the tab parameter first")
    val tabRegister = first.registerA
    if (tabRegister == tabParameter || view == tabRegister || view > 15 || tabRegister > 15) {
        refuse("factory view/tab registers are not separate low registers")
    }
    if (code.drop(1).any { it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == tabRegister }) {
        refuse("factory overwrites its retained tab")
    }
    val getters = code.withIndex().mapNotNull { (index, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapNotNull null
        val result = code.getOrNull(index + 1) as? OneRegisterInstruction
        if (instruction.opcode == Opcode.INVOKE_VIRTUAL && ref.parameterTypes.isEmpty() && ref.returnType == VIEW &&
            code.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT && result?.registerA == view) index to ref else null
    }
    val getter = getters.singleOrNull() ?: refuse("expected one returned-view proxy getter")
    if (getter.first >= end.index || code.subList(getter.first + 2, end.index).any {
            it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == view
        }) refuse("factory changes its returned view")
    val flow = try { ControlFlow.of(factory) } catch (failure: IllegalArgumentException) {
        refuse("factory has unreadable control flow")
    }
    val seen = mutableSetOf<Int>()
    val pending = ArrayDeque<Int>().apply { add(0) }
    while (pending.isNotEmpty()) {
        val index = pending.removeFirst()
        if (index == getter.first || !seen.add(index)) continue
        if (index == end.index) refuse("a return path bypasses the native view getter")
        pending.addAll(flow.normal[index] + flow.exceptional[index])
    }
    val proxy = classDefBy(getter.second.definingClass)
    val enumField = proxy.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == tab.type }
        .singleOrNull() ?: refuse("proxy must own one native tab field")
    if (!AccessFlags.FINAL.isSet(enumField.accessFlags)) refuse("proxy tab is mutable")
    val constructors = proxy.methods.filter { it.name == "<init>" &&
        it.parameterTypes.count { parameter -> parameter.toString() == tab.type } == 1 }
    val constructor = constructors.singleOrNull() ?: refuse("proxy must receive its native tab once")
    val constructorParams = constructor.parameterTypes.map { it.toString() }
    val self = constructor.implementation!!.registerCount - constructorParams.size - 1
    val passedTab = self + 1 + constructorParams.indexOf(tab.type)
    val tabWrites = classes.flatMap { it.methods }.flatMap { method -> method.code().mapNotNull { instruction ->
        if (instruction.opcode != Opcode.IPUT_OBJECT ||
            (instruction as? ReferenceInstruction)?.reference.toString() != enumField.toString()) null else method to instruction
    } }
    if (tabWrites.size != 1 || tabWrites.single().first != constructor ||
        (tabWrites.single().second as TwoRegisterInstruction).registerA != passedTab ||
        (tabWrites.single().second as TwoRegisterInstruction).registerB != self) refuse("proxy tab is not the constructor's native tab")
    val variants = classes.filter { it.superclass == proxy.type }
    if (variants.size != 2 || variants.any { AccessFlags.ABSTRACT.isSet(it.accessFlags) }) {
        refuse("expected the two concrete tab proxy variants")
    }
    val setters = variants.map { variant ->
        val methods = variant.methods.filter { it.parameterTypes.map { p -> p.toString() } == listOf(LONG_LISTENER) && it.returnType == "V" }
        val setter = methods.singleOrNull() ?: refuse("tab variant has no unique long-click setter")
        val body = setter.code()
        if (setter.implementation?.registerCount != 3 || AccessFlags.STATIC.isSet(setter.accessFlags) ||
            body.map { it.opcode } != listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID) ||
            setter.implementation!!.tryBlocks.isNotEmpty()) refuse("long-click setter is not a straight native binding")
        val read = body[0] as TwoRegisterInstruction
        val field = (body[0] as ReferenceInstruction).reference as? FieldReference
            ?: refuse("setter does not read its view")
        val call = body[1] as FiveRegisterInstruction
        if (read.registerA != 0 || read.registerB != 1 || call.registerCount != 2 || call.registerC != 0 || call.registerD != 2 ||
            (body[1] as ReferenceInstruction).reference.toString() != SET_LISTENER || field.definingClass != variant.type) {
            refuse("setter does not bind its parameter to its own view")
        }
        val viewGetter = variant.methods.singleOrNull { it.name == getter.second.name && it.parameterTypes.isEmpty() && it.returnType == VIEW }
            ?: refuse("variant does not return the factory's view")
        val getterBody = viewGetter.code()
        if (viewGetter.implementation?.registerCount != 2 || getterBody.map { it.opcode } != listOf(Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT) ||
            (getterBody[0] as ReferenceInstruction).reference.toString() != field.toString() ||
            (getterBody[0] as TwoRegisterInstruction).registerA != 0 ||
            (getterBody[0] as TwoRegisterInstruction).registerB != 1 ||
            (getterBody[1] as OneRegisterInstruction).registerA != 0) refuse("setter and getter use different views")
        if (variant.methods.filter { it.name == "<init>" }.any { method -> method.code().any {
                (it as? ReferenceInstruction)?.reference.toString() == SET_LISTENER
            } }) refuse("constructor installs an unowned long-click handler")
        setter
    }
    val setterNames = setters.map { it.name }.distinct()
    if (setterNames.size != 1) refuse("variants disagree on their common setter")
    val nativeBindings = code.filter {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == proxy.type && ref.name == setterNames.single() &&
                ref.parameterTypes.map { p -> p.toString() } == listOf(LONG_LISTENER)
        }
    if (nativeBindings.size != 6 || nativeBindings.any {
            it.opcode != Opcode.INVOKE_VIRTUAL || (it as FiveRegisterInstruction).registerC !=
                (code[getter.first] as FiveRegisterInstruction).registerC
        }) refuse("factory must bind its six native handlers to the returned proxy")
    return NavigationEntryTargets(factory, end.index, view, tabRegister, enumField.toString(), setters)
}

internal fun BytecodePatchContext.addNavigationEntry(found: NavigationEntryTargets = navigationEntryTargets()) {
    for (setter in found.setters) {
        mutableClassDefBy(setter.definingClass).methods.single { it.name == setter.name && it.parameterTypes == setter.parameterTypes }
            .addInstructions(1, """
                iget-object p0, p0, ${found.enumField}
                invoke-static { v0, p0, p1 }, $NAV_REMEMBER
                move-result-object p1
            """)
    }
    val factory = mutableClassDefBy(found.factory.definingClass).methods.single {
        it.name == found.factory.name && it.parameterTypes == found.factory.parameterTypes
    }
    // The systrace cleanup's branch jumps to this return. Replacing it keeps that branch on the hook.
    factory.replaceInstruction(found.returnIndex, "invoke-static { v${found.viewRegister}, v${found.tabRegister} }, $NAV_BIND")
    factory.addInstruction(found.returnIndex + 1, "return-object v${found.viewRegister}")
}
