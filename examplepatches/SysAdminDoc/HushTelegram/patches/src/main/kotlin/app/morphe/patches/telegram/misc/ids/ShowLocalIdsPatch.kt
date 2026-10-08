/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.ids

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.*
import app.morphe.patches.telegram.misc.localcontrols.*
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val LOCAL_IDS = "$EXTENSION_PACKAGE/misc/LocalIds;"
internal const val PROFILE = "Lorg/telegram/ui/ProfileActivity;"
internal const val LOCAL_ID_ROW = 0x48544944

@Suppress("unused")
val showLocalIdsPatch = bytecodePatch(
    name = "Show user and chat IDs",
    description = "Adds a switch, off by default, that shows a copyable local user or chat ID in the inspected profile's menu, and a second one, off by default, that adds the data center holding the profile's photo. Neither exposes access hashes or asks Telegram's server for anything.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val plan = resolveLocalIds()
        resolveProfileDc()
        plan.insert(MutableMethod(ImmutableMethod.of(plan.method)))
        val runtime = mutableClassDefBy(LOCAL_IDS)
        // Compile both bridges before changing any host method, runtime body or build flag.
        val bridges = listOf(Triple("nativeAddRow", 4, plan.rowCode()), Triple("nativeDismiss", 1, plan.dismissCode())).map { (name, registers, code) ->
            val old = runtime.methods.single { it.name == name }
            val replacement = ImmutableMethod(old.definingClass, old.name, old.parameters, old.returnType,
                old.accessFlags, old.annotations, old.hiddenApiRestrictions, MutableMethodImplementation(registers))
                .toMutable().apply { addInstructionsWithLabels(0, code) }
            old to replacement
        }
        bridges.forEach { (old, replacement) -> runtime.methods.remove(old); runtime.methods.add(replacement) }
        // The data center row has its own switch but shares this hook and the row bridge.
        writeProfileDc()
        plan.insert(plan.method)
        enableCapability("profileLocalIds")
        enableStatus("showLocalIds")
    }
}

internal data class LocalIdsPlan(
    val method: MutableMethod, val index: Int, val first: Int, val menu: FieldReference,
    val user: FieldReference, val chat: FieldReference,
    val addRow: MethodReference, val dismiss: MethodReference,
) {
    fun insert(target: MutableMethod) = target.addInstructionsAtControlFlowLabel(index, """
        move-object/from16 v$first, p0
        iget-wide v${first + 1}, v$first, $user
        iget-wide v${first + 3}, v$first, $chat
        iget-object v$first, v$first, $menu
        invoke-static/range {v$first .. v${first + 4}}, $LOCAL_IDS->addToProfile(Landroid/view/View;JJ)V
    """)

    fun rowCode() = """
        check-cast p0, ${menu.type}
        const v0, 0x48544944
        sget v1, Lorg/telegram/messenger/R${'$'}drawable;->msg_copy:I
        invoke-virtual {p0, v0, v1, p1}, $addRow
        move-result-object v0
        return-object v0
    """
    fun dismissCode() = """
        check-cast p0, ${menu.type}
        invoke-virtual {p0}, $dismiss
        return-void
    """
}

internal fun BytecodePatchContext.resolveLocalIds(): LocalIdsPlan {
    listOf("showLocalIds", "profileLocalIds").forEach(::requireStatusMethod)
    controlHook(LOCAL_IDS, "addToProfile", listOf("Landroid/view/View;", "J", "J"), "V")
    controlHook(LOCAL_IDS, "nativeAddRow", listOf("Ljava/lang/Object;", "Ljava/lang/String;"), "Landroid/view/View;")
    controlHook(LOCAL_IDS, "nativeDismiss", listOf("Ljava/lang/Object;"), "V")
    val profile = mutableClassDefBy(PROFILE)
    controlShape(AccessFlags.PUBLIC.isSet(profile.accessFlags), "profile owner is inaccessible")
    val initialize = profile.methods.filter { it.name == "onFragmentCreate" }.controlSingle("profile initialization")
    controlShape(initialize.controlCallable(false) && initialize.controlShape(emptyList(), "Z"), "profile initialization shape changed")
    val initial = initialize.controlBody()
    val self = initialize.localRegisterCount()
    fun idField(key: String): FieldReference {
        val at = initial.indices.filter { initial[it].controlString() == key }.controlSingle("$key argument")
        val callAt = at + if (key == "user_id") 2 else 1
        val call = initial.getOrNull(callAt)?.controlCall()
        val field = initial.getOrNull(callAt + 2)?.controlField()
        val args = initial.getOrNull(callAt)?.namedRegisters().orEmpty()
        controlShape(call?.toString() == "Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J" &&
            initial[at].opcode == Opcode.CONST_STRING && initial[callAt + 1].opcode == Opcode.MOVE_RESULT_WIDE &&
            initial[callAt + 2].opcode == Opcode.IPUT_WIDE && field?.definingClass == PROFILE && field.type == "J" &&
            initial[callAt + 2].namedRegisters() == listOf(initial[callAt + 1].namedRegisters().single(), self) &&
            args.getOrNull(1) == initial[at].namedRegisters().single() &&
            initial[at - 1].opcode == Opcode.IGET_OBJECT && initial[at - 1].controlField()?.name == "arguments" &&
            initial[at - 1].controlField()?.type == "Landroid/os/Bundle;" &&
            initial[at - 1].namedRegisters() == listOf(args.firstOrNull(), self), "$key local ID binding changed")
        val declared = profile.fields.filter { it.toString() == field.toString() }.controlSingle("$key field")
        controlShape(!AccessFlags.STATIC.isSet(declared.accessFlags), "$key isn't an instance field")
        initialize.requireThisIntact("Local IDs", listOf(at - 1, callAt + 2))
        return field!!
    }
    val user = idField("user_id")
    val chat = idField("chat_id")
    controlShape(user != chat, "profile IDs share a field")
    val create = profile.methods.filter { it.name == "createView" }.controlSingle("profile view")
    controlShape(create.controlCallable(false) && create.controlShape(listOf("Landroid/content/Context;"), "Landroid/view/View;"), "profile view changed")
    val view = create.controlBody()
    val more = view.indices.filter { view[it].controlRef() == "Lorg/telegram/messenger/R\$drawable;->ic_ab_other:I" }.controlSingle("profile overflow icon")
    val maker = view.getOrNull(more + 3)?.controlCall()
    val menu = view.getOrNull(more + 5)?.controlField()
    controlShape(view[more].opcode == Opcode.SGET && view[more + 2].opcode == Opcode.CONST_16 &&
        (view[more + 2] as? NarrowLiteralInstruction)?.narrowLiteral == 10 && maker != null &&
        maker.parameterTypes.take(2).map { it.toString() } == listOf("I", "I") &&
        view[more + 4].opcode == Opcode.MOVE_RESULT_OBJECT && view[more + 5].opcode == Opcode.IPUT_OBJECT &&
        menu?.definingClass == PROFILE && menu.type == maker.returnType &&
        view[more + 5].namedRegisters().firstOrNull() == view[more + 4].namedRegisters().singleOrNull(), "profile overflow binding changed")
    create.controlReceiverAlias(view[more + 5].namedRegisters()[1], more + 5)
    val menuDeclaration = profile.fields.filter { it.toString() == menu.toString() }.controlSingle("profile menu field")
    controlShape(!AccessFlags.STATIC.isSet(menuDeclaration.accessFlags), "profile menu isn't an instance field")
    val menuClass = mutableClassDefBy(menu!!.type)
    controlShape(AccessFlags.PUBLIC.isSet(menuClass.accessFlags) && menuClass.superclass == "Landroid/widget/FrameLayout;", "native overflow owner changed")
    val builder = profile.methods.filter { method -> method.controlShape(listOf("Z"), "V") && method.controlBody().any {
        it.controlRef() == "Lorg/telegram/messenger/R\$string;->LogOut:I"
    } && method.controlBody().any { it.controlRef() == menu.toString() } }.controlSingle("profile menu builder")
    val body = builder.controlBody()
    controlShape(builder.controlCallable(false) && body.none { (it as? NarrowLiteralInstruction)?.narrowLiteral == LOCAL_ID_ROW }, "profile menu identity collides")
    val adds = body.mapNotNull { it.controlCall() }.filter { it.definingClass == menu.type &&
        it.parameterTypes.map { p -> p.toString() } == listOf("I", "I", "Ljava/lang/String;") }.distinctBy { it.toString() }
    val add = adds.controlSingle("native profile submenu factory")
    val factory = menuClass.methods.filter { it.toString() == add.toString() }.controlSingle("native submenu method")
    val factoryBody = factory.controlBody()
    controlShape(factory.controlCallable(false) && factory.localRegisterCount() == 8 && factoryBody.map { it.opcode } == listOf(
        Opcode.CONST_4, Opcode.IGET_OBJECT, Opcode.CONST_4, Opcode.CONST_4, Opcode.MOVE_OBJECT, Opcode.MOVE, Opcode.MOVE,
        Opcode.MOVE_OBJECT, Opcode.INVOKE_VIRTUAL_RANGE, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT), "native submenu factory changed")
    val core = factoryBody[8].controlCall()
    controlShape(factoryBody.map { it.namedRegisters() } == listOf(listOf(6), listOf(7, 8), listOf(3), listOf(5), listOf(0, 8),
        listOf(1, 9), listOf(2, 10), listOf(4, 11), (0..7).toList(), listOf(9), listOf(9)) &&
        (factoryBody[0] as NarrowLiteralInstruction).narrowLiteral == 0 && (factoryBody[2] as NarrowLiteralInstruction).narrowLiteral == 0 &&
        (factoryBody[3] as NarrowLiteralInstruction).narrowLiteral == 1 && core?.definingClass == menu.type && core.returnType == add.returnType &&
        core.parameterTypes.map { it.toString() } == listOf("I", "I", "Landroid/graphics/drawable/Drawable;", "Ljava/lang/CharSequence;", "Z", "Z", factoryBody[1].controlField()?.type),
        "native submenu operands changed")
    val coreFactory = menuClass.methods.filter { it.toString() == core.toString() }.controlSingle("native submenu row builder")
    controlShape(coreFactory.controlCallable(false) && coreFactory.controlBody().none { it.controlRef()?.startsWith("Lorg/telegram/tgnet/") == true ||
        it.controlCall()?.name in listOf("sendRequest", "sendMessage") }, "native row builder is no longer local")
    val item = mutableClassDefBy(add.returnType)
    controlShape(AccessFlags.PUBLIC.isSet(item.accessFlags) && item.superclass == "Landroid/widget/FrameLayout;", "native submenu row isn't a view")
    val dismiss = menuClass.methods.filter { it.controlCallable(false) && it.controlShape(emptyList(), "V") &&
        it.controlBody().any { ins -> ins.controlCall()?.toString() == "Landroid/widget/PopupWindow;->isShowing()Z" } &&
        it.controlBody().count { ins -> ins.controlCall()?.name == "dismiss" } == 1 }.controlSingle("native menu dismissal")
    val dismissal = dismiss.controlBody()
    controlShape(dismiss.localRegisterCount() == 1 && dismissal.map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.IF_EQZ, Opcode.INVOKE_VIRTUAL,
        Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID) &&
        dismissal.map { it.namedRegisters() } == listOf(listOf(0, 1), listOf(0), listOf(0), listOf(0), listOf(0), listOf(0, 1), listOf(0), emptyList()) &&
        dismissal[0].controlField() == dismissal[5].controlField() && ControlFlow.of(dismiss).normal[1].toSet() == setOf(2, 7) &&
        ControlFlow.of(dismiss).normal[4].toSet() == setOf(5, 7), "native menu dismissal changed")
    val copy = mutableClassDefBy("Lorg/telegram/messenger/R\$drawable;").fields.filter { it.name == "msg_copy" }.controlSingle("copy icon")
    controlShape(copy.type == "I" && AccessFlags.PUBLIC.isSet(copy.accessFlags) && AccessFlags.STATIC.isSet(copy.accessFlags), "copy icon is inaccessible")
    // The stock final visibility refresh follows this insertion. Its sole normal exit remains intact.
    val index = body.size - 3
    controlShape(body[index].opcode == Opcode.CONST_4 && (body[index] as? NarrowLiteralInstruction)?.narrowLiteral == 0 &&
        body[index + 1].opcode == Opcode.INVOKE_VIRTUAL && body[index + 1].controlCall()?.let {
            it.definingClass == PROFILE && it.controlShape(listOf("Z"), "V")
        } == true && body.last().opcode == Opcode.RETURN_VOID, "profile final visibility refresh changed")
    val flow = ControlFlow.of(builder)
    controlShape(flow.normal[index] == listOf(index + 1) && flow.normal[index + 1] == listOf(index + 2) &&
        flow.exceptional[index].isEmpty() && flow.exceptional[index + 1].isEmpty(), "profile visibility lifetime changed")
    builder.requireThisIntact("Local IDs", listOf(index))
    val free = builder.freeLocalsAt("Local IDs", index, 5)
    controlShape(free == (free.first()..free.first() + 4).toList(), "profile ID operands have no free contiguous registers")
    return LocalIdsPlan(builder, index, free.first(), menu, user, chat, add, dismiss)
}
