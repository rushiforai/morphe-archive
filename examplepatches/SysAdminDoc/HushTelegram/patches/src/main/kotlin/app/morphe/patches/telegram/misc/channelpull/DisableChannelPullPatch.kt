/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.channelpull

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
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
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val PATCH = "Disable pull to next channel"
internal const val CHANNEL_PULL = "$EXTENSION_PACKAGE/misc/ChannelPull;"
private const val CHAT = "Lorg/telegram/tgnet/TLRPC\$Chat;"
private const val USER = "Lorg/telegram/tgnet/TLRPC\$User;"
private const val CHAT_OBJECT = "Lorg/telegram/messenger/ChatObject;"
private const val MOTION_EVENT = "Landroid/view/MotionEvent;"
private const val CANVAS = "Landroid/graphics/Canvas;"
private const val VIEW = "Landroid/view/View;"

@Suppress("unused")
val disableChannelPullPatch = bytecodePatch(
    name = PATCH,
    description = "Adds a switch, on by default, that stops pulling past the bottom of a channel from opening the next channel. Scrolling, opening channels directly and pulling between forum topics still work.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        requireStatusMethod("disableChannelPull")
        val sites = resolveChannelPullSites()
        // Verify both insertions on copies before either host or the build fact changes.
        sites.insert(MutableMethod(ImmutableMethod.of(sites.scroll)), MutableMethod(ImmutableMethod.of(sites.touch)))
        sites.insert(sites.scroll, sites.touch)
        enableStatus("disableChannelPull")
    }
}

/** Renamed state is bound across the layout manager, drawing, touch release and next-chat opener. */
internal class ChannelPullSites(
    val scroll: MutableMethod,
    val scrollGate: Int,
    val channelCall: Int,
    val topicEntry: Int,
    val commonEntry: Int,
    val scrollExit: Int,
    val offsetWrite: Int,
    val scrollActivity: Int,
    val touch: MutableMethod,
    val releaseGate: Int,
    val retract: Int,
    val transitionCall: Int,
    val activity: Int,
    val topic: FieldReference,
    val offset: FieldReference,
    val drawable: FieldReference,
    val list: FieldReference,
    val transition: MethodReference,
) {
    fun insert(scrollMethod: MutableMethod, touchMethod: MutableMethod) {
        guard(scrollMethod, scrollGate, scrollExit, scrollActivity, "stopBottomPull")
        guard(touchMethod, releaseGate, retract, activity, "keepChannelStill")
    }

    private fun guard(method: MutableMethod, at: Int, exit: Int, holder: Int, hook: String) {
        val answer = method.freeLocalsAt(PATCH, at, 1, targets = listOf(exit), highest = 15).single()
        method.addInstructionsAtControlFlowLabel(at, """
            iget-boolean v$answer, v$holder, $topic
            if-nez v$answer, :hush_topic
            invoke-static {}, $CHANNEL_PULL->$hook()Z
            move-result v$answer
            if-nez v$answer, :hush_retract
            :hush_topic
            nop
        """.trimIndent(), ExternalLabel("hush_retract", method.getInstruction(exit)))
    }
}

internal fun Method.isChannelPullScroll(): Boolean = returnType == "I" && parameterTypes.size == 3 &&
    parameterTypes[0].toString() == "I" && instructions().any { it.isChannelCall() } &&
    instructions().any { it.isBotForumCall() } && instructions().count { it.opcode == Opcode.INVOKE_SUPER } == 2

internal fun BytecodePatchContext.resolveChannelPullSites(): ChannelPullSites {
    requireRuntimeHooks()
    val candidates = mutableListOf<Method>()
    classDefForEach { owner ->
        if (!owner.type.startsWith("Lapp/hushtelegram/extension/")) owner.methods.filterTo(candidates) { it.isChannelPullScroll() }
    }
    val found = candidates.one("bottom-pull layout manager")
    val layout = mutableClassDefBy(found.definingClass)
    val scroll = layout.methods.single { it.name == found.name && it.parameterTypes == found.parameterTypes && it.returnType == found.returnType }
    shape(!AccessFlags.STATIC.isSet(scroll.accessFlags), "scroll callback became static")
    val body = scroll.instructions()
    val flow = ControlFlow.of(scroll)
    val channelCall = body.indices.filter { body[it].isChannelCall() }.one("channel predicate")
    shape(channelCall >= 3 && channelCall + 12 < body.size, "channel predicate moved outside the pull branch")
    val currentChat = body[channelCall - 1].field()
    shape(body[channelCall - 1].opcode == Opcode.IGET_OBJECT && currentChat?.type == CHAT &&
        body[channelCall].namedRegisters() == listOf(body[channelCall - 1].namedRegisters()[0]), "channel predicate lost its current chat")
    val owner = mutableClassDefBy(currentChat!!.definingClass)
    val holder = body[channelCall - 1].namedRegisters()[1]
    val value = body[channelCall - 1].namedRegisters()[0]
    shape(body[channelCall + 1].opcode == Opcode.MOVE_RESULT && body[channelCall + 1].namedRegisters() == listOf(value) &&
        body[channelCall + 2].opcode == Opcode.IF_EQZ && body[channelCall + 2].namedRegisters() == listOf(value) &&
        body[channelCall + 3].opcode == Opcode.IGET_OBJECT && body[channelCall + 3].field() == currentChat &&
        body[channelCall + 3].namedRegisters() == listOf(value, holder) &&
        body[channelCall + 4].opcode == Opcode.IGET_BOOLEAN && body[channelCall + 4].field()?.toString() == "$CHAT->megagroup:Z" &&
        body[channelCall + 4].namedRegisters() == listOf(value, value), "channel and megagroup tests no longer share the current chat")
    val groupBranch = channelCall + 5
    shape(body[groupBranch].opcode == Opcode.IF_EQZ && body[groupBranch].namedRegisters() == listOf(value), "megagroup result no longer selects topic fallback")
    val topicEntry = branch(flow, channelCall + 2)
    val commonEntry = branch(flow, groupBranch)
    shape(topicEntry == groupBranch + 1 && commonEntry == topicEntry + 6, "channel and topic branches no longer join in one place")
    val topic = body[topicEntry].field()
    shape(body[topicEntry].opcode == Opcode.IGET_BOOLEAN && topic?.definingClass == owner.type && topic.type == "Z" &&
        body[topicEntry].namedRegisters() == listOf(value, holder) &&
        body[topicEntry + 1].opcode == Opcode.IF_EQZ && body[topicEntry + 1].namedRegisters() == listOf(value) &&
        body[topicEntry + 2].opcode == Opcode.IGET_OBJECT && body[topicEntry + 2].field()?.let { it.definingClass == owner.type && it.type == USER } == true &&
        body[topicEntry + 2].namedRegisters() == listOf(value, holder) && body[topicEntry + 3].isBotForumCall() &&
        body[topicEntry + 3].namedRegisters() == listOf(value) && body[topicEntry + 4].opcode == Opcode.MOVE_RESULT &&
        body[topicEntry + 4].namedRegisters() == listOf(value) && body[topicEntry + 5].opcode == Opcode.IF_NEZ &&
        body[topicEntry + 5].namedRegisters() == listOf(value), "topic fallback no longer preserves the non-bot topic check")
    val scrollExit = branch(flow, topicEntry + 1)
    shape(branch(flow, topicEntry + 5) == scrollExit && body[scrollExit].opcode == Opcode.IGET && body[scrollExit].field()?.type == "F",
        "topic refusal no longer goes to overscroll cleanup")
    val offset = body[scrollExit].field()!!
    instanceField(owner, topic!!, public = true)
    instanceField(owner, currentChat)
    instanceField(owner, offset)

    // Both ordinary scrolling calls precede the positive-dy, zero-scrolled pull test.
    val ordinary = body.indices.filter { body[it].opcode == Opcode.INVOKE_SUPER }
    val superOwner = ordinary.mapNotNull { body[it].call()?.definingClass }.distinct().one("ordinary scroll implementation")
    val ancestors = mutableSetOf<String>()
    var ancestor = layout.superclass
    while (ancestor != null && ancestor != "Ljava/lang/Object;" && ancestor !in ancestors) {
        ancestors += ancestor
        if (ancestor == superOwner) break
        ancestor = classDefByOrNull(ancestor)?.superclass ?: refuse("missing layout manager ancestor $ancestor")
    }
    shape(superOwner in ancestors && classDefByOrNull(superOwner)?.methods?.any { it.name == scroll.name &&
        it.parameterTypes == scroll.parameterTypes && it.returnType == "I" && !AccessFlags.STATIC.isSet(it.accessFlags) &&
        it.implementation != null } == true, "ordinary scroll isn't a concrete inherited implementation")
    for (at in ordinary) {
        val call = body[at].call() ?: refuse("ordinary scroll lost its target")
        shape(at < channelCall - 3, "bottom pull no longer follows ordinary scrolling")
        shape(call.name == scroll.name && call.returnType == "I" &&
            call.parameterTypes.map(CharSequence::toString) == scroll.parameterTypes.map(CharSequence::toString) &&
            call.definingClass == superOwner, "ordinary scroll target changed from the inherited callback")
        shape(body[at + 1].opcode == Opcode.MOVE_RESULT, "ordinary scroll result is no longer retained")
    }
    val scrolled = body[ordinary.last() + 1].namedRegisters().single()
    shape(body[ordinary.first() + 1].namedRegisters() == listOf(scrolled) && body.last().opcode == Opcode.RETURN &&
        body.last().namedRegisters() == listOf(scrolled) && body[channelCall - 3].opcode == Opcode.IF_LEZ &&
        branch(flow, channelCall - 3) == scrollExit && body[channelCall - 2].opcode == Opcode.IF_NEZ &&
        body[channelCall - 2].namedRegisters() == listOf(scrolled) && branch(flow, channelCall - 2) == scrollExit,
        "pull no longer requires positive drag after a zero stock scroll")

    val offsetWrite = (commonEntry until scrollExit).filter { body[it].opcode == Opcode.IPUT && body[it].field() == offset }.one("bottom offset accumulation")
    shape(body[offsetWrite - 1].opcode == Opcode.ADD_FLOAT_2ADDR && body[offsetWrite - 2].opcode == Opcode.IGET &&
        body[offsetWrite - 2].field() == offset && body[offsetWrite].namedRegisters()[1] == holder,
        "bottom pull no longer accumulates its offset")
    shape(commonEntry !in reachable(flow, 0, channelCall) && offsetWrite !in reachable(flow, 0, commonEntry),
        "bottom pull can bypass the eligibility checks")
    val scrollGate = (commonEntry until offsetWrite).firstOrNull { body[it].opcode == Opcode.IGET && body[it].field() == offset }
        ?: refuse("bottom pull lost its initial offset read")
    shape(holder <= 15 && body[scrollGate].namedRegisters()[1] == holder && offsetWrite !in reachable(flow, 0, scrollGate),
        "bottom pull can accumulate around its initial offset read")
    // This whole region changes pull state. Its only entry is after every stock eligibility check.
    for (from in body.indices) for (to in flow.normal[from] + flow.exceptional[from]) {
        shape(to !in scrollGate until scrollExit || from in scrollGate until scrollExit || from == scrollGate - 1 && to == scrollGate,
            "bottom pull state can be entered around its eligibility checks")
    }
    val list = body.mapNotNull { it.field() }.filter { it.definingClass == owner.type &&
        classDefByOrNull(it.type)?.methods?.any { method -> method.name == "onTouchEvent" && method.parameterTypes == listOf(MOTION_EVENT) } == true }
        .distinct().one("channel list field")
    instanceField(owner, list)
    val listOwner = mutableClassDefBy(list.type)
    val draw = listOwner.methods.filter { it.name == "onDraw" && it.parameterTypes == listOf(CANVAS) && it.returnType == "V" }.one("channel list drawing")
    val drawBody = draw.instructions()
    val drawable = body.mapNotNull { it.field() }.filter { field -> field.definingClass == owner.type && field.type != list.type &&
        drawBody.any { it.opcode == Opcode.IPUT_OBJECT && it.field() == field } &&
        classDefByOrNull(field.type)?.methods?.any { method -> method.name == "<init>" && method.parameterTypes.map(CharSequence::toString).let { params ->
            params.size == 7 && params.take(6) == listOf("I", VIEW, "J", "I", "I", "J") && params[6].startsWith("L") } } == true }
        .distinct().one("pull drawable field")
    // The constructor has seven declared parameters, with wide dialog/topic identifiers.
    val drawableOwner = mutableClassDefBy(drawable.type)
    shape(drawableOwner.interfaces.contains("Lorg/telegram/messenger/NotificationCenter\$NotificationCenterDelegate;") &&
        drawBody.any { it.field() == offset } && drawBody.any { it.call()?.let { call -> call.definingClass == drawable.type &&
            call.parameterTypes == listOf(CANVAS, list.type, "F", "F") && call.returnType == "V" } == true },
        "the accumulated offset isn't the drawn channel pull")
    instanceField(owner, drawable)
    val touch = listOwner.methods.filter { it.name == "onTouchEvent" && it.parameterTypes == listOf(MOTION_EVENT) && it.returnType == "Z" }.one("channel list touch")
    val touchBody = touch.instructions()
    val touchFlow = ControlFlow.of(touch)
    val progress = touchBody.indices.filter { touchBody[it].call()?.toString() == "Ljava/lang/Math;->min(FF)F" }.one("release progress")
    shape(progress >= 7 && progress + 12 < touchBody.size &&
        touchBody[progress - 7].opcode == Opcode.IGET && touchBody[progress - 7].field() == offset &&
        touchBody[progress - 6].let { it is NarrowLiteralInstruction && it.narrowLiteral == 110f.toBits() } &&
        touchBody[progress - 5].call()?.toString() == "Lorg/telegram/messenger/AndroidUtilities;->dp(F)I" &&
        touchBody[progress - 2].opcode == Opcode.DIV_FLOAT_2ADDR &&
        touchBody[progress - 1].let { it is NarrowLiteralInstruction && it.narrowLiteral == 1f.toBits() } &&
        touchBody[progress + 1].opcode == Opcode.MOVE_RESULT && touchBody[progress + 2].call()?.toString() == "$MOTION_EVENT->getAction()I" &&
        touchBody[progress + 3].opcode == Opcode.MOVE_RESULT && touchBody[progress + 5].opcode == Opcode.IF_NE,
        "release progress no longer checks ACTION_UP")
    val actionBranch = progress + 5
    val progressCheck = progress + 6
    val releaseGate = progress + 12
    val retract = branch(touchFlow, actionBranch)
    val action = touchBody[progress + 3].namedRegisters().single()
    val one = touchBody[actionBranch].namedRegisters().single { it != action }
    shape(touchBody.take(progress).lastOrNull { it.opcode.setsRegister() && it.namedRegisters().firstOrNull() == one }
        ?.let { it is NarrowLiteralInstruction && it.narrowLiteral == 1 } == true &&
        touchBody[progressCheck].opcode == Opcode.CMPL_FLOAT &&
        touchBody[progressCheck + 1].opcode == Opcode.IF_NEZ && branch(touchFlow, progressCheck + 1) == retract &&
        touchBody[progressCheck + 2].opcode == Opcode.IGET_OBJECT && touchBody[progressCheck + 2].field() == drawable &&
        touchBody[progressCheck + 3].opcode == Opcode.IF_EQZ && branch(touchFlow, progressCheck + 3) == retract &&
        touchBody[progressCheck + 4].opcode == Opcode.IGET_BOOLEAN &&
        touchBody[progressCheck + 4].field()?.let { it.definingClass == drawable.type && it.type == "Z" } == true &&
        touchBody[progressCheck + 5].opcode == Opcode.IF_NEZ && branch(touchFlow, progressCheck + 5) == retract &&
        touchBody[retract].opcode == Opcode.IGET_OBJECT && touchBody[retract].field() == drawable,
        "release no longer shares Telegram's retraction branch")
    val activity = touchBody[progressCheck + 2].namedRegisters()[1]
    shape(activity <= 15 && touchBody.take(progress).any { it.opcode == Opcode.IGET && it.field() == offset && it.namedRegisters()[1] == activity } &&
        touchBody.drop(retract).any { it.opcode == Opcode.INVOKE_SUPER || it.opcode == Opcode.INVOKE_SUPER_RANGE },
        "release lost its activity offset or ordinary touch handler")
    for (from in touchBody.indices) for (to in touchFlow.normal[from] + touchFlow.exceptional[from]) {
        shape(to !in releaseGate until retract || from in releaseGate until retract || from == releaseGate - 1 && to == releaseGate,
            "channel release can be entered around its eligibility checks")
    }
    val transitionCall = (releaseGate until retract).filter { touchBody[it].call()?.let { call ->
        call.definingClass == owner.type && call.parameterTypes == listOf(owner.type) && call.returnType == "V" } == true }.one("next-chat release")
    val transition = touchBody[transitionCall].call()!!
    shape(touchBody[transitionCall].opcode == Opcode.INVOKE_STATIC && touchBody[transitionCall].namedRegisters() == listOf(activity),
        "release no longer opens through its own activity")
    val opener = owner.methods.filter { it.name == transition.name && it.parameterTypes == transition.parameterTypes && it.returnType == transition.returnType }
        .one("next-chat opener").instructions()
    shape(opener.any { it.field() == topic } && opener.any { it.field() == drawable } && opener.any { it.reference() == "pulled" } &&
        opener.any { it.reference() == "chat_id" } && opener.any { it.call()?.name == "presentFragment" },
        "release opener no longer binds this drawable and topic state")
    return ChannelPullSites(scroll, scrollGate, channelCall, topicEntry, commonEntry, scrollExit, offsetWrite, holder,
        touch, releaseGate, retract, transitionCall, activity, topic, offset, drawable, list, transition)
}

private fun BytecodePatchContext.requireRuntimeHooks() {
    val owner = classDefByOrNull(CHANNEL_PULL)
    shape(owner != null && AccessFlags.PUBLIC.isSet(owner.accessFlags), "no public channel pull runtime")
    for (name in listOf("stopBottomPull", "keepChannelStill")) {
        val params = emptyList<String>()
        shape(owner!!.methods.count { it.name == name && it.parameterTypes == params && it.returnType == "Z" &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) &&
            !AccessFlags.NATIVE.isSet(it.accessFlags) && !AccessFlags.ABSTRACT.isSet(it.accessFlags) &&
            (it.implementation?.registerCount ?: -1) >= maxOf(1, params.size) &&
            it.instructions().any { instruction -> !instruction.opcode.format.isPayloadFormat } } == 1,
            "no callable public static runtime $name")
    }
}

private fun instanceField(owner: ClassDef, reference: FieldReference, public: Boolean = false) {
    val field = owner.fields.filter { it.name == reference.name && it.type == reference.type }.one("bound ${reference.name} field")
    shape(!AccessFlags.STATIC.isSet(field.accessFlags) && (!public || AccessFlags.PUBLIC.isSet(field.accessFlags)),
        "bound ${reference.name} field is not an accessible instance field")
}
private fun branch(flow: ControlFlow, at: Int): Int = flow.normal[at].filter { it != at + 1 }.one("branch at $at")
private fun reachable(flow: ControlFlow, from: Int, blocked: Int): Set<Int> {
    val reached = mutableSetOf<Int>()
    val pending = ArrayDeque(listOf(from))
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (at != blocked && reached.add(at)) pending.addAll(flow.normal[at] + flow.exceptional[at])
    }
    return reached
}
private fun refuse(reason: String): Nothing = throw PatchException("$PATCH: $reason; refuses changed channel pull geometry before editing")
private fun shape(valid: Boolean, reason: String) { if (!valid) refuse(reason) }
private fun <T> List<T>.one(what: String): T { shape(size == 1, "$what has $size matches"); return single() }
private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()
private fun Instruction.field(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Instruction.isChannelCall() = call()?.toString() == "$CHAT_OBJECT->isChannel($CHAT)Z"
private fun Instruction.isBotForumCall() = call()?.toString() == "Lorg/telegram/messenger/UserObject;->isBotForum($USER)Z"
