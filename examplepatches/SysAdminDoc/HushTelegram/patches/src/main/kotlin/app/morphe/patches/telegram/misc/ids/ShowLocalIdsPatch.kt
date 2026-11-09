/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.ids

import app.morphe.patches.telegram.misc.localcontrols.controlMembers
import app.morphe.util.names.loadsInt
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.*
import app.morphe.patches.telegram.misc.localcontrols.*
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.call
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origSuperclass
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

internal const val LOCAL_IDS = "$EXTENSION_PACKAGE/misc/LocalIds;"
internal const val PROFILE = "Lorg/telegram/ui/ProfileActivity;"
internal const val LOCAL_ID_ROW = 0x48544944

@Suppress("unused")
val showLocalIdsPatch = bytecodePatch(
    name = "Show user and chat IDs",
    description = "Adds a copyable ID number for a user or chat to the profile menu. A second switch also shows where " +
        "the profile photo is stored. A third, Special contacts, adds Track this user to a person's profile menu and keeps " +
        "a history of their status and profile changes on this phone. All three start off. Turn them on in HushTelegram " +
        "settings > Look and feel.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val plan = resolveLocalIds()
        resolveProfileDc()
        // Special contacts is optional: found before anything changes, put in after the rest.
        val (special, specialMissing) = resolveSpecialContacts()
        plan.insert(MutableMethod(ImmutableMethod.of(plan.method)))
        val runtime = tgMutableClassDefBy(LOCAL_IDS)
        // Compile both bridges before changing any host method, runtime body or build flag.
        val bridges = listOf(Triple("nativeAddRow", 4, plan.rowCode()), Triple("nativeDismiss", 1, plan.dismissCode())).map { (name, registers, code) ->
            val old = runtime.methods.single { it.origName == name }
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
        if (special != null) {
            special.applyTo()
            enableCapability("specialContacts")
        } else {
            patchLog.warning("Show user and chat IDs: $specialMissing. The patch goes on without Special contacts.")
        }
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
    val profile = tgMutableClassDefBy(PROFILE)
    controlShape(AccessFlags.PUBLIC.isSet(profile.accessFlags), "profile owner is inaccessible")
    val initialize = profile.methods.filter { it.origName == "onFragmentCreate" }.controlSingle("profile initialization")
    controlShape(initialize.controlCallable(false) && initialize.controlShape(emptyList(), "Z"), "profile initialization shape changed")
    val initial = initialize.controlBody()
    val self = initialize.localRegisterCount()
    fun idField(key: String): FieldReference {
        val at = initial.indices.filter { initial[it].controlString() == key }.controlSingle("$key argument")
        val callAt = at + if (key == "user_id") 2 else 1
        val call = initial.getOrNull(callAt)?.call()
        val field = initial.getOrNull(callAt + 2)?.controlField()
        val args = initial.getOrNull(callAt)?.namedRegisters().orEmpty()
        controlShape(call?.toString() == "Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J" &&
            initial[at].opcode == Opcode.CONST_STRING && initial[callAt + 1].opcode == Opcode.MOVE_RESULT_WIDE &&
            initial[callAt + 2].opcode == Opcode.IPUT_WIDE && field?.origDefiningClass == PROFILE && field.origType == "J" &&
            initial[callAt + 2].namedRegisters() == listOf(initial[callAt + 1].namedRegisters().single(), self) &&
            args.getOrNull(1) == initial[at].namedRegisters().single() &&
            initial[at - 1].opcode == Opcode.IGET_OBJECT && initial[at - 1].controlField()?.origName == "arguments" &&
            initial[at - 1].controlField()?.origType == "Landroid/os/Bundle;" &&
            initial[at - 1].namedRegisters() == listOf(args.firstOrNull(), self), "$key local ID binding changed")
        val declared = profile.fields.filter { it.toString() == field.toString() }.controlSingle("$key field")
        controlShape(!AccessFlags.STATIC.isSet(declared.accessFlags), "$key isn't an instance field")
        initialize.requireThisIntact("Local IDs", listOf(at - 1, callAt + 2))
        return field!!
    }
    val user = idField("user_id")
    val chat = idField("chat_id")
    controlShape(user != chat, "profile IDs share a field")
    val create = profile.methods.filter { it.origName == "createView" }.controlSingle("profile view")
    controlShape(create.controlCallable(false) && create.controlShape(listOf("Landroid/content/Context;"), "Landroid/view/View;"), "profile view changed")
    val view = create.controlBody()
    val icons = view.indices.filter { view[it].controlRef() == OVERFLOW_ICON }
    // 13.1 adds the overflow item in place: the icon, const/16 10, the (I, I) maker, its result and
    // the store. 13.2's R8 moved the icon and the 10 into a no-argument helper on the menu bar whose
    // whole body is that call, so the store follows the helper's call and result.
    val made = if (icons.isNotEmpty()) icons.controlSingle("profile overflow icon").let { more ->
        controlShape(view[more].loadsInt() && view[more + 2].opcode == Opcode.CONST_16 &&
            (view[more + 2] as? NarrowLiteralInstruction)?.narrowLiteral == 10, "profile overflow binding changed")
        more + 3
    } else view.indices.filter { at ->
        view[at].opcode == Opcode.INVOKE_VIRTUAL && view[at].call()?.parameterTypes?.isEmpty() == true &&
            view.getOrNull(at + 2)?.opcode == Opcode.IPUT_OBJECT && overflowHelper(view[at].call()!!) != null
    }.controlSingle("profile overflow icon")
    val maker = view[made].call()?.let { if (icons.isNotEmpty()) it else overflowHelper(it) }
    val store = made + 2
    val menu = view.getOrNull(store)?.controlField()
    controlShape(maker != null && maker.parameterTypes.take(2).map { it.toString() } == listOf("I", "I") &&
        view[made + 1].opcode == Opcode.MOVE_RESULT_OBJECT && view[store].opcode == Opcode.IPUT_OBJECT &&
        menu?.origDefiningClass == PROFILE && menu.origType == maker.origReturnType && menu.origType == view[made].call()?.origReturnType &&
        view[store].namedRegisters().firstOrNull() == view[made + 1].namedRegisters().singleOrNull(), "profile overflow binding changed")
    create.controlReceiverAlias(view[store].namedRegisters()[1], store)
    val menuDeclaration = profile.fields.filter { it.toString() == menu.toString() }.controlSingle("profile menu field")
    controlShape(!AccessFlags.STATIC.isSet(menuDeclaration.accessFlags), "profile menu isn't an instance field")
    val menuClass = tgMutableClassDefBy(menu!!.type)
    // 13.2 splits the item into a searchable item over a plain base; the base is the FrameLayout.
    val menuLine = generateSequence(menuClass as ClassDef) { owner -> owner.superclass?.let { classDefByOrNull(it) } }
        .takeWhile { it.origType.startsWith("Lorg/telegram/") }.take(3).toList()
    val menuTypes = menuLine.map { it.origType }
    controlShape(menuLine.all { AccessFlags.PUBLIC.isSet(it.accessFlags) } && menuLine.last().origSuperclass == "Landroid/widget/FrameLayout;",
        "native overflow owner changed")
    val builder = profile.methods.filter { method -> method.controlShape(listOf("Z"), "V") && method.controlBody().any {
        it.controlRef() == "Lorg/telegram/messenger/R\$string;->LogOut:I"
    } && method.controlBody().any { it.controlRef() == menu.toString() } }.controlSingle("profile menu builder")
    val body = builder.controlBody()
    controlShape(builder.controlCallable(false) && body.none { (it as? NarrowLiteralInstruction)?.narrowLiteral == LOCAL_ID_ROW }, "profile menu identity collides")
    // 13.2's R8 folded the String overload into the CharSequence one on the base.
    val adds = body.mapNotNull { it.call() }.filter { it.origDefiningClass in menuTypes &&
        it.parameterTypes.map { p -> p.toString() }.let { p -> p == listOf("I", "I", "Ljava/lang/String;") || p == listOf("I", "I", "Ljava/lang/CharSequence;") } }
        .distinctBy { it.toString() }
    val add = adds.controlSingle("native profile submenu factory")
    val factory = menuLine.flatMap { it.methods }.filter { it.toString() == add.toString() }.controlSingle("native submenu method")
    val factoryBody = factory.controlBody()
    controlShape(factory.controlCallable(false) && factory.localRegisterCount() == 8 && factoryBody.map { it.opcode } == listOf(
        Opcode.CONST_4, Opcode.IGET_OBJECT, Opcode.CONST_4, Opcode.CONST_4, Opcode.MOVE_OBJECT, Opcode.MOVE, Opcode.MOVE,
        Opcode.MOVE_OBJECT, Opcode.INVOKE_VIRTUAL_RANGE, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT), "native submenu factory changed")
    val core = factoryBody[8].call()
    controlShape(factoryBody.map { it.namedRegisters() } == listOf(listOf(6), listOf(7, 8), listOf(3), listOf(5), listOf(0, 8),
        listOf(1, 9), listOf(2, 10), listOf(4, 11), (0..7).toList(), listOf(9), listOf(9)) &&
        (factoryBody[0] as NarrowLiteralInstruction).narrowLiteral == 0 && (factoryBody[2] as NarrowLiteralInstruction).narrowLiteral == 0 &&
        (factoryBody[3] as NarrowLiteralInstruction).narrowLiteral == 1 && core?.origDefiningClass in menuTypes && core!!.origReturnType == add.origReturnType &&
        core.parameterTypes.map { it.toString() } == listOf("I", "I", "Landroid/graphics/drawable/Drawable;", "Ljava/lang/CharSequence;", "Z", "Z", factoryBody[1].controlField()?.type),
        "native submenu operands changed")
    val coreFactory = menuLine.flatMap { it.methods }.filter { it.toString() == core.toString() }.controlSingle("native submenu row builder")
    controlShape(coreFactory.controlCallable(false) && coreFactory.controlBody().none { it.controlRef()?.startsWith("Lorg/telegram/tgnet/") == true ||
        it.call()?.origName in listOf("sendRequest", "sendMessage") }, "native row builder is no longer local")
    val item = tgMutableClassDefBy(add.returnType)
    controlShape(AccessFlags.PUBLIC.isSet(item.accessFlags) && item.origSuperclass == "Landroid/widget/FrameLayout;", "native submenu row isn't a view")
    val dismiss = menuLine.flatMap { it.methods }.filter { it.controlCallable(false) && it.controlShape(emptyList(), "V") &&
        it.controlBody().any { ins -> ins.call()?.toString() == "Landroid/widget/PopupWindow;->isShowing()Z" } &&
        it.controlBody().count { ins -> ins.call()?.origName == "dismiss" } == 1 }.controlSingle("native menu dismissal")
    val dismissal = dismiss.controlBody()
    val menuSelf = dismiss.localRegisterCount()
    val dismissFlow = ControlFlow.of(dismiss)
    // 13.2 first closes a shown submenu overlay, animated, and returns; the popup's dismissal follows unchanged.
    val overlay = if (dismissal.size == 14) 6 else 0
    controlShape(overlay == 0 || (menuSelf == 2 && dismissal.take(6).map { it.opcode } == listOf(Opcode.INVOKE_DIRECT, Opcode.MOVE_RESULT_OBJECT,
        Opcode.IF_EQZ, Opcode.CONST_4, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID) &&
        dismissal.take(6).map { it.namedRegisters() } == listOf(listOf(2), listOf(0), listOf(0), listOf(1), listOf(0, 1), emptyList()) &&
        dismissal[0].call()?.origDefiningClass in menuTypes && dismissFlow.normal[2].toSet() == setOf(3, 6)), "native menu dismissal changed")
    val tail = dismissal.drop(overlay)
    controlShape((overlay != 0 || menuSelf == 1) && tail.map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.IF_EQZ, Opcode.INVOKE_VIRTUAL,
        Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID) &&
        tail.map { it.namedRegisters() } == listOf(listOf(0, menuSelf), listOf(0), listOf(0), listOf(0), listOf(0), listOf(0, menuSelf), listOf(0), emptyList()) &&
        tail[0].controlField() == tail[5].controlField() && dismissFlow.normal[overlay + 1].toSet() == setOf(overlay + 2, overlay + 7) &&
        dismissFlow.normal[overlay + 4].toSet() == setOf(overlay + 5, overlay + 7), "native menu dismissal changed")
    controlMembers("Lorg/telegram/messenger/R\$drawable;", "static msg_copy:I")
    // The stock final visibility refresh follows this insertion. Its sole normal exit remains intact.
    // 13.1 ends with the zero and refresh(false). 13.2 sets the zero up before an item refresh with
    // the builder's own flag, so the insertion goes in front of both refreshes.
    fun refresh(at: Int) = body.getOrNull(at)?.let { it.opcode == Opcode.INVOKE_VIRTUAL || it.opcode == Opcode.INVOKE_VIRTUAL_RANGE } == true &&
        body[at].call()?.let { it.origDefiningClass == PROFILE && it.controlShape(listOf("Z"), "V") } == true
    val paired = body.size >= 4 && refresh(body.size - 3) && refresh(body.size - 2) && body[body.size - 4].opcode == Opcode.CONST_4
    val index = body.size - 3
    val zero = if (paired) index - 1 else index
    val last = body.size - 2
    controlShape(body[zero].opcode == Opcode.CONST_4 && (body[zero] as? NarrowLiteralInstruction)?.narrowLiteral == 0 &&
        refresh(last) && body[last].namedRegisters().last() == body[zero].namedRegisters().single() &&
        body.last().opcode == Opcode.RETURN_VOID, "profile final visibility refresh changed")
    val flow = ControlFlow.of(builder)
    controlShape((index..last).all { flow.normal[it] == listOf(it + 1) && flow.exceptional[it].isEmpty() }, "profile visibility lifetime changed")
    builder.requireThisIntact("Local IDs", listOf(index))
    builder.freeLocalsAt("Local IDs", index, 5)
    // 13.2's builder keeps values live in scattered low registers, so look for five free in a row. The
    // iget-wide operands are four-bit, so the run has to end at v15.
    val live = builder.liveAcrossInjection(index)
    val first = (0..11).firstOrNull { start -> start + 4 < builder.localRegisterCount() && (start..start + 4).none { it in live } }
    controlShape(first != null, "profile ID operands have no free contiguous registers")
    return LocalIdsPlan(builder, index, first!!, menu, user, chat, add, dismiss)
}

private const val OVERFLOW_ICON = "Lorg/telegram/messenger/R\$drawable;->ic_ab_other:I"

/** The (I, I) maker a 13.2 overflow helper calls with const/16 10 and the overflow icon, or null. */
private fun BytecodePatchContext.overflowHelper(call: MethodReference): MethodReference? {
    val helper = classDefByOrNull(call.definingClass)?.methods?.singleOrNull {
        it.name == call.name && it.parameterTypes.isEmpty() && it.returnType == call.returnType
    } ?: return null
    val body = helper.controlBody()
    if (body.map { it.opcode } != listOf(Opcode.CONST_16, Opcode.CONST, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT)) return null
    val maker = body[2].call() ?: return null
    val (count, icon) = body[0].namedRegisters().single() to body[1].namedRegisters().single()
    val self = helper.localRegisterCount()
    return maker.takeIf {
        (body[0] as NarrowLiteralInstruction).narrowLiteral == 10 && body[1].controlRef() == OVERFLOW_ICON &&
            body[2].namedRegisters() == listOf(self, count, icon) && maker.definingClass == call.definingClass &&
            maker.returnType == call.returnType && body[3].namedRegisters() == body[4].namedRegisters()
    }
}
