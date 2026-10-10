/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.commerce

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.handleTargets
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "Hide Premium, gifts and Stars"
internal const val COMMERCE = "$EXTENSION_PACKAGE/misc/Commerce;"
internal const val PROFILE_GIFTS = "Lorg/telegram/messenger/R\$string;->ProfileGifts:I"
internal const val GIFT_TAB = "Lorg/telegram/tgnet/TLRPC\$TL_profileTabGifts;"
internal const val PROFILE_TAB = "Lorg/telegram/tgnet/TLRPC\$ProfileTab;"
internal const val GIFT_BUTTON = "Lorg/telegram/messenger/R\$string;->ProfileActionsGift:I"
internal const val GIFT_ICON = "Lorg/telegram/messenger/R\$drawable;->input_gift_s:I"
internal val SETTINGS_SALES = listOf("TelegramPremium", "TelegramStars", "MyTON", "TelegramBusiness", "SendAGift")
    .map { "Lorg/telegram/messenger/R\$string;->$it:I" }
private const val TABS = "Lorg/telegram/ui/Components/ScrollSlidingTextTabStrip;"
private const val ARRAY_LIST = "Ljava/util/ArrayList;"
private const val APPEND = "$ARRAY_LIST->add(Ljava/lang/Object;)Z"
private const val PAIR = "Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V"
private const val STRING = "Lorg/telegram/messenger/LocaleController;->getString(I)Ljava/lang/String;"
private const val BOX_INT = "Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;"
private val SALES_FACTORY = List(4) { "I" } + List(3) { "Ljava/lang/CharSequence;" }
private val FOOTER_LABELS = listOf("ProfileActionsGift", "ChannelOpenDirect", "Search", "BroadcastGroupInfo")
    .map { "Lorg/telegram/messenger/R\$string;->$it:I" }
private val MOVES = setOf(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16)
private val CONSTANTS = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16)

@Suppress("unused")
val hideCommercePatch = bytecodePatch(
    name = PATCH,
    description = "Removes Premium, Stars, My Grams, Business and Send a Gift from Settings, Gifts tabs on profiles, " +
        "and the Gift button in channels, for a less cluttered app. On by default. Turn it off in " +
        "HushTelegram settings > Chats.",
    default = true,
) {
    category("Ads")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("hideCommerce")
        CommerceTarget.entries.forEach { requireStatusMethod(it.capability) }
        // Every operand, identity and cached path is proved before the first instruction changes.
        val plan = resolveCommerceHooks()
        shape(plan.hooks.isNotEmpty(), "no sales presentation target")
        if (plan.giftTabId != null) writeStub(COMMERCE, "giftTabId", 1,
            "const/16 v0, ${plan.giftTabId}\nreturn v0")
        if (plan.giftButtonIndex != null) writeStub(COMMERCE, "giftButtonIndex", 1,
            "const/16 v0, ${plan.giftButtonIndex}\nreturn v0")
        handleTargets(PATCH, "sales presentation targets", CommerceTarget.entries) { target ->
            val edits = plan.hooks[target]
            if (edits == null) "no structurally matching ${target.capability} target"
            else {
                edits.sortedByDescending { it.index }.forEach { edit ->
                    if (edit.replace) edit.method.replaceInstruction(edit.index, edit.code)
                    else edit.method.addInstructionsAtControlFlowLabel(edit.index, edit.code)
                }
                when (target) {
                    CommerceTarget.SETTINGS -> enableCapability("commerceSettingsRows")
                    CommerceTarget.PROFILE_GIFTS -> enableCapability("commerceProfileGifts")
                    CommerceTarget.CHANNEL_GIFT -> enableCapability("commerceChannelGift")
                }
                null
            }
        }
        enableStatus("hideCommerce")
    }
}

internal enum class CommerceTarget(val capability: String) {
    SETTINGS("commerceSettingsRows"), PROFILE_GIFTS("commerceProfileGifts"), CHANNEL_GIFT("commerceChannelGift"),
}

internal data class CommerceEdit(val method: MutableMethod, val index: Int, val code: String, val replace: Boolean = false)
internal data class CommercePlan(
    val hooks: Map<CommerceTarget, List<CommerceEdit>>,
    val giftTabId: Int?,
    val giftButtonIndex: Int?,
)

/** Kept resources and TL types identify the surfaces; all renamed classes and members come from their bodies. */
internal fun BytecodePatchContext.resolveCommerceHooks(): CommercePlan {
    val classes = mutableMapOf<String, ClassDef>()
    classDefForEach { if (!it.type.startsWith("Lapp/hushtelegram/extension/")) classes[it.type] = it }
    val methods = classes.values.flatMap { it.methods.toList() }
    fun mutable(method: Method) = mutableClassDefBy(method.definingClass).methods.single { it.sameSignature(method) }
    for (stub in listOf("giftTabId", "giftButtonIndex")) {
        shape(mutableClassDefBy(COMMERCE).methods.count { it.name == stub && it.hasShape(emptyList(), "I") &&
            AccessFlags.STATIC.isSet(it.accessFlags) } == 1, "extension has no single integer $stub stub")
    }
    val hooks = mutableMapOf<CommerceTarget, List<CommerceEdit>>()

    val settings = methods.filter { method ->
        method.returnType == "V" && AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.parameterTypes.map { it.toString() } == listOf(method.definingClass, ARRAY_LIST) &&
            SETTINGS_SALES.any { resource -> method.instructions().any { it.reference() == resource } }
    }.unique("Settings sales row builder")
    if (settings != null) {
        shape(SETTINGS_SALES.all { resource -> settings.instructions().any { it.reference() == resource } },
            "partially changed Settings sales labels")
        hooks[CommerceTarget.SETTINGS] = settingsEdits(mutable(settings))
    }

    var giftTabId: Int? = null
    val profile = methods.filter { method -> method.hasShape(listOf("Z"), "V") &&
        method.instructions().any { it.reference() == PROFILE_GIFTS } }.unique("profile Gifts tab builder")
    if (profile != null) {
        val mapper = classes.getValue(profile.definingClass).methods.filter { method ->
            AccessFlags.STATIC.isSet(method.accessFlags) && method.hasShape(listOf(PROFILE_TAB), "I") &&
                method.instructions().any { it.opcode == Opcode.INSTANCE_OF && it.reference() == GIFT_TAB }
        }.unique("Gifts tab identity mapper") ?: throw PatchException("$PATCH: no Gifts tab identity mapper (before editing)")
        val body = mapper.instructions()
        val type = body.indices.single { body[it].opcode == Opcode.INSTANCE_OF && body[it].reference() == GIFT_TAB }
        val literal = body.getOrNull(type + 2) as? NarrowLiteralInstruction
        shape(body.getOrNull(type + 1)?.opcode == Opcode.IF_EQZ && literal != null &&
            body[type + 2].opcode in CONSTANTS &&
            body[type].namedRegisters()[1] == mapper.parameterRegisterNumber(0) &&
            body[type].namedRegisters().first() == body[type + 1].namedRegisters().single() &&
            body.getOrNull(type + 3)?.opcode == Opcode.RETURN &&
            body[type + 2].namedRegisters() == body[type + 3].namedRegisters() &&
            ControlFlow.of(mapper).normal[type + 1].contains(type + 4), "Gifts tab mapper has changed branches")
        giftTabId = literal!!.narrowLiteral
        shape(giftTabId in 0..32767, "Gifts tab ID does not fit the extension fact")
        val tabStrip = classes[TABS] ?: throw PatchException("$PATCH: no kept profile tab strip (before editing)")
        val hasTab = tabStrip.methods.filter { method -> method.hasShape(listOf("I"), "Z") &&
            method.instructions().any { it.reference() == "Landroid/util/SparseIntArray;->get(II)I" }
        }.unique("profile cached tab lookup") ?: throw PatchException("$PATCH: no profile cached tab lookup (before editing)")
        val clear = tabStrip.methods.filter { method -> method.hasShape(emptyList(), "Landroid/util/SparseArray;") &&
            method.instructions().any { it.reference() == "Landroid/view/ViewGroup;->removeAllViews()V" }
        }.unique("profile tab strip rebuild") ?: throw PatchException("$PATCH: no profile tab strip rebuild (before editing)")
        shape(clear.instructions().any { it.reference() == "Landroid/util/SparseIntArray;->clear()V" },
            "profile rebuild no longer clears cached tab identities")
        hooks[CommerceTarget.PROFILE_GIFTS] = profileEdits(mutable(profile), giftTabId, hasTab.toString(), clear.toString())
    }

    var giftButtonIndex: Int? = null
    val footer = methods.filter { method -> method.hasShape(listOf("I", "Z", "Z"), "V") &&
        FOOTER_LABELS.any { resource -> method.instructions().any { it.reference() == resource } }
    }.unique("channel footer button visibility")
    if (footer != null) {
        shape(FOOTER_LABELS.all { resource -> footer.instructions().any { it.reference() == resource } },
            "partially changed channel footer labels")
        val method = mutable(footer)
        giftButtonIndex = footerGiftIndex(classes.getValue(footer.definingClass), method)
        val index = method.parameterRegisterNumber(0)
        val visible = method.parameterRegisterNumber(1)
        shape(visible == index + 1 && visible <= 255, "footer visibility operands cannot be passed intact")
        hooks[CommerceTarget.CHANNEL_GIFT] = listOf(CommerceEdit(method, 0,
            "invoke-static/range {v$index .. v$visible}, $COMMERCE->showChannelGiftButton(IZ)Z\nmove-result v$visible"))
    }
    return CommercePlan(hooks, giftTabId, giftButtonIndex)
}

private fun settingsEdits(method: MutableMethod): List<CommerceEdit> {
    val body = method.instructions()
    val flow = ControlFlow.of(method)
    val factories = mutableSetOf<String>()
    val destinations = mutableSetOf<Int>()
    val edits = SETTINGS_SALES.map { resource ->
        val at = body.indices.filter { body[it].reference() == resource }.unique("$resource Settings label")
            ?: throw PatchException("$PATCH: missing $resource Settings label (before editing)")
        shape(body.getOrNull(at + 1)?.reference() == STRING && body.getOrNull(at + 2)?.opcode == Opcode.MOVE_RESULT_OBJECT,
            "$resource does not produce a row title")
        val title = body[at + 2].namedRegisters().single()
        val factory = (at + 3 until minOf(body.size, at + 64)).firstOrNull { index ->
            body[index].call()?.parameterTypes?.map { it.toString() } == SALES_FACTORY &&
                body[index].opcode in setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)
        } ?: throw PatchException("$PATCH: no $resource Settings row factory (before editing)")
        shape(body[factory].namedRegisters().getOrNull(4) == title &&
            (at + 3 until factory).none { body[it].writes(title) }, "$resource Settings title is not intact")
        factories += body[factory].reference()!!
        val row = body.getOrNull(factory + 1)
        val append = factory + 2
        shape(row != null && row.opcode == Opcode.MOVE_RESULT_OBJECT && body.getOrNull(append)?.reference() == APPEND &&
            body[append].namedRegisters().size == 2 && body[append].namedRegisters()[1] == row.namedRegisters().single() &&
            body.indices.filter { append in flow.normal[it] } == listOf(append - 1), "$resource has no distinct row append")
        destinations += body[append].namedRegisters()[0]
        appendEdit(method, append, "addSettingsRow")
    }
    shape(factories.size == 1 && destinations.size == 1 && edits.map { it.index }.distinct().size == SETTINGS_SALES.size,
        "Settings sales rows do not share one factory and destination")
    val rows = destinations.single()
    val alias = body.indices.filter { body[it].opcode in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16) &&
        body[it].namedRegisters() == listOf(rows, method.parameterRegisterNumber(1)) }.unique("Settings destination parameter alias")
    shape(alias != null && body.indices.none { it != alias && body[it].writes(rows) }, "Settings destination is overwritten")
    return edits
}

private fun profileEdits(method: MutableMethod, gifts: Int, hasTab: String, clear: String): List<CommerceEdit> {
    val body = method.instructions()
    val flow = ControlFlow.of(method)
    val resources = body.indices.filter { body[it].reference() == PROFILE_GIFTS }
    shape(resources.size == 2 && body.count { it.reference() == clear } == 1 &&
        body.count { it.reference() in listOf("Lorg/telegram/tgnet/TLRPC\$UserFull;->stargifts_count:I",
            "Lorg/telegram/tgnet/TLRPC\$ChatFull;->stargifts_count:I") } == 2,
        "profile Gifts lacks fresh, cached edit and stock rebuild paths")
    val allocation = resources.first() - 3
    shape(body.getOrNull(allocation)?.opcode == Opcode.NEW_INSTANCE &&
        body[allocation].reference() == "Landroid/util/Pair;", "fresh Gifts candidate lacks its Pair allocation")
    val receiver = body[allocation].namedRegisters().single()
    val nextAllocation = (allocation + 1 until body.size).firstOrNull { body[it].writes(receiver) } ?: body.size
    val freshPair = (resources.first() + 1 until nextAllocation).filter { index ->
        body[index].reference() == PAIR && body[index].namedRegisters().first() == receiver
    }.unique("fresh Gifts candidate constructor")
        ?: throw PatchException("$PATCH: no fresh Gifts candidate constructor (before editing)")
    val label = resources.last()
    shape(body.getOrNull(label + 1)?.reference() == STRING &&
        body.getOrNull(label + 2)?.opcode == Opcode.MOVE_RESULT_OBJECT &&
        body.getOrNull(label + 3)?.opcode in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16) &&
        body.getOrNull(label + 4)?.opcode in setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32),
        "cached Gifts label no longer jumps to its shared Pair constructor")
    val cachedPair = flow.normal[label + 4].single()
    shape(body[cachedPair].reference() == PAIR &&
        body[label + 2].namedRegisters().single() == body[label + 3].namedRegisters()[1] &&
        body[label + 3].namedRegisters()[0] == body[cachedPair].namedRegisters()[2],
        "cached Gifts label no longer supplies the Pair title")
    val appends = listOf(freshPair, cachedPair).map { pair ->
        val append = pair + 1
        shape(body.getOrNull(append)?.reference() == APPEND && body[append].namedRegisters().size == 2 &&
            body[append].namedRegisters()[1] == body[pair].namedRegisters().first(), "Gifts pair has no distinct candidate append")
        append
    }
    shape(appends.map { body[it].namedRegisters().first() }.distinct().size == 1, "Gifts candidates use different tab lists")
    val freshBox = resources.first() - 2
    shape(body.getOrNull(freshBox)?.reference() == BOX_INT &&
        constantBefore(body, freshBox, body[freshBox].namedRegisters().single()) == gifts &&
        body.getOrNull(freshBox + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT &&
        body[freshBox + 1].namedRegisters().single() == body[appends.first() - 1].namedRegisters()[1],
        "fresh Gifts candidate does not use the discovered tab ID")
    val cachedLabelBranch = (0 until resources.last()).filter { index ->
        body[index].opcode == Opcode.IF_EQ && resources.last() in flow.normal[index]
    }.unique("cached Gifts label branch") ?: throw PatchException("$PATCH: no cached Gifts label branch (before editing)")
    val labelOperands = body[cachedLabelBranch].namedRegisters()
    val identityOperand = labelOperands.filter { constantBefore(body, cachedLabelBranch, it) == gifts }
        .unique("cached Gifts label identity") ?: throw PatchException("$PATCH: no cached Gifts label identity (before editing)")
    val tabIndex = labelOperands.single { it != identityOperand }
    val identitySource = (0 until cachedLabelBranch).last { body[it].writes(identityOperand) }
    val first = body[appends.last() - 1].namedRegisters()[1]
    val cachedBox = (0 until cachedLabelBranch).lastOrNull { body[it].reference() == BOX_INT &&
        body[it].namedRegisters() == listOf(tabIndex) && body.getOrNull(it + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT &&
        body[it + 1].namedRegisters() == listOf(first) }
    val cachedReceiver = body[appends.last() - 1].namedRegisters().first()
    shape(cachedBox != null && first != tabIndex && cachedReceiver !in listOf(first, tabIndex) &&
        body.getOrNull(cachedBox!! - 1)?.opcode == Opcode.NEW_INSTANCE &&
        body[cachedBox - 1].reference() == "Landroid/util/Pair;" &&
        body[cachedBox - 1].namedRegisters() == listOf(cachedReceiver) &&
        flow.preservesValue(identitySource, cachedLabelBranch, identityOperand) &&
        flow.preservesValue(cachedBox, cachedLabelBranch, tabIndex) &&
        flow.preservesValue(cachedBox + 1, cachedPair, first) &&
        flow.preservesValue(cachedBox - 1, cachedPair, cachedReceiver),
        "cached Gifts label and Pair identity do not share the tab index")
    val cached = body.indices.filter { index -> body[index].reference() == hasTab &&
        body[index].namedRegisters().size == 2 && constantBefore(body, index, body[index].namedRegisters()[1]) == gifts
    }.unique("cached Gifts presence comparison") ?: throw PatchException("$PATCH: no cached Gifts presence comparison (before editing)")
    shape(body.getOrNull(cached + 1)?.opcode == Opcode.MOVE_RESULT && body.getOrNull(cached + 2)?.opcode == Opcode.IF_EQ,
        "cached Gifts presence no longer compares its stock visibility")
    val exists = body[cached + 1].namedRegisters().single()
    val operands = body[cached + 2].namedRegisters()
    shape(operands.size == 2 && operands.count { it == exists } == 1, "cached Gifts comparison aliases its operands")
    val visible = operands.single { it != exists }
    val fresh = resources.first() - 4
    shape(body.getOrNull(fresh)?.opcode == Opcode.IF_EQZ && ControlFlow.of(method).normal[fresh].any { it > appends.first() },
        "fresh Gifts candidate has no stock way past it")
    val freshVisible = body[fresh].namedRegisters().single()
    val copy = (cached + 3 until fresh).lastOrNull { body[it].opcode in MOVES &&
        body[it].namedRegisters() == listOf(freshVisible, visible) }
    shape(copy != null && (copy!! + 1 until fresh).none { body[it].writes(freshVisible) } && visible <= 255,
        "cached and fresh Gifts presence do not share one decision")
    return appends.map { appendEdit(method, it, "addProfileTab") } + CommerceEdit(method, cached + 2,
        "invoke-static/range {v$visible .. v$visible}, $COMMERCE->showGiftsTab(Z)Z\nmove-result v$visible")
}

private fun footerGiftIndex(classDef: ClassDef, method: Method): Int {
    val body = method.instructions()
    val label = body.indices.single { body[it].reference() == GIFT_BUTTON }
    val compare = body.getOrNull(label - 1)
    val operands = compare?.namedRegisters().orEmpty()
    val button = method.parameterRegisterNumber(0)
    shape(compare?.opcode == Opcode.IF_NE && operands.count { it == button } == 1, "footer Gift label has no distinct button branch")
    val gift = constantBefore(body, label - 1, operands.single { it != button })
        ?: throw PatchException("$PATCH: no footer Gift index (before editing)")
    shape(gift in 0..32767, "footer Gift index does not fit the extension fact")
    val init = classDef.methods.singleOrNull { it.name == "<clinit>" }
        ?: throw PatchException("$PATCH: no footer icon table (before editing)")
    val icons = init.instructions()
    val icon = icons.indices.singleOrNull { icons[it].reference() == GIFT_ICON }
        ?: throw PatchException("$PATCH: no distinct footer Gift icon (before editing)")
    val array = (icon + 1 until icons.size).firstOrNull { icons[it].opcode == Opcode.FILLED_NEW_ARRAY }
        ?: throw PatchException("$PATCH: no footer icon array (before editing)")
    val iconRegister = icons[icon].namedRegisters().single()
    shape(icons[array].reference() == "[I" && icons[array].namedRegisters().getOrNull(gift) == iconRegister &&
        (icon + 1 until array).none { icons[it].writes(iconRegister) } &&
        icons.getOrNull(array + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT && icons.getOrNull(array + 2)?.opcode == Opcode.SPUT_OBJECT,
        "footer Gift index does not match its icon array slot")
    val table = icons[array + 2].reference()
    shape(body.indices.any { index -> body[index].reference() == table && body[index].opcode == Opcode.SGET_OBJECT &&
        body.getOrNull(index + 1)?.opcode == Opcode.AGET && body[index + 1].namedRegisters().getOrNull(2) == button },
        "footer Gift branch does not read its discovered icon table")
    return gift
}

private fun appendEdit(method: MutableMethod, index: Int, hook: String): CommerceEdit {
    val registers = method.instructions()[index].namedRegisters()
    shape(registers.size == 2 && registers.all { it <= 15 }, "$hook append operands cannot be passed intact")
    return CommerceEdit(method, index,
        "invoke-static {v${registers[0]}, v${registers[1]}}, $COMMERCE->$hook(Ljava/util/ArrayList;Ljava/lang/Object;)Z", true)
}

private fun constantBefore(body: List<Instruction>, before: Int, register: Int): Int? {
    val write = (0 until before).lastOrNull { body[it].writes(register) } ?: return null
    return if (body[write].opcode in CONSTANTS) (body[write] as? NarrowLiteralInstruction)?.narrowLiteral else null
}

/** Bound provenance by its source definition, including handlers and paths that jump backward. */
private fun ControlFlow.preservesValue(source: Int, use: Int, register: Int): Boolean {
    val pending = ArrayDeque<Int>()
    val bypass = mutableSetOf<Int>()
    pending += 0
    pending.addAll(exceptional[source])
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (at == source || !bypass.add(at)) continue
        if (at == use) return false
        pending.addAll(normal[at] + exceptional[at])
    }

    val predecessors = Array(instructions.size) { mutableListOf<Int>() }
    instructions.indices.forEach { at ->
        (normal[at] + exceptional[at]).forEach { predecessors[it] += at }
    }
    val reachesUse = mutableSetOf<Int>()
    pending += use
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (at == source || !reachesUse.add(at)) continue
        pending.addAll(predecessors[at])
    }
    val afterSource = mutableSetOf<Int>()
    pending.addAll(normal[source])
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (at == source || !afterSource.add(at)) continue
        if (at in reachesUse && instructions[at].writes(register)) return false
        pending.addAll(normal[at] + exceptional[at])
    }
    return use in afterSource
}

private fun Instruction.writes(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val destination = namedRegisters().firstOrNull() ?: return false
    return destination == register || opcode.setsWideRegister() && destination + 1 == register
}
private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()
private fun Instruction.call() = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun MethodReference.hasShape(parameters: List<String>, result: String) =
    parameterTypes.map { it.toString() } == parameters && returnType == result
private fun MethodReference.sameSignature(other: MethodReference) = name == other.name &&
    returnType == other.returnType && parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }
private fun <T> List<T>.unique(what: String): T? {
    shape(size <= 1, "ambiguous $what ($size candidates)")
    return singleOrNull()
}
private fun shape(ok: Boolean, what: String) {
    if (!ok) throw PatchException("$PATCH: $what (before editing)")
}
