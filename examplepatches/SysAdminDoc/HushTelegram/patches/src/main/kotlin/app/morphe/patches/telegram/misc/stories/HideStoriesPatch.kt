/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.stories

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.handleTargets
import app.morphe.patches.telegram.misc.extension.requireLocals
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.returnEarlyWhen
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
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "Hide Stories"
internal const val STORIES = "$EXTENSION_PACKAGE/misc/Stories;"
internal const val GET_ALL_STORIES = "Lorg/telegram/tgnet/tl/TL_stories\$TL_stories_getAllStories;"
internal const val STORY_CAMERA_ICON = "Lorg/telegram/messenger/R\$drawable;->outline_fab_story_24:I"
internal const val CHAT_PREVIEW_ACTION = "Lorg/telegram/messenger/R\$id;->acc_action_chat_preview:I"
private const val CANVAS = "Landroid/graphics/Canvas;"
private const val IMAGE = "Lorg/telegram/messenger/ImageReceiver;"
private val TOUCH_PARAMETERS = listOf("Landroid/view/MotionEvent;", "Landroid/view/View;")
private val COMMUNITY_PARAMETERS = listOf("Lorg/telegram/tgnet/TLRPC\$Chat;", "Lorg/telegram/tgnet/TLRPC\$User;")
private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)
private val MOVES = setOf(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16)

@Suppress("unused")
val hideStoriesPatch = bytecodePatch(
    name = PATCH,
    description = "Hides the chat-list story bar, avatar story rings and Post Story button, and stops fetching " +
        "the story list. Profile stories and archives remain available.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("hideStories")
        StoryTarget.entries.forEach { requireStatusMethod(it.capability) }
        // Resolve operands, branch destinations and free registers for every site before editing any.
        val plan = resolveStoryHooks()
        shape(plan.hooks.isNotEmpty(), "no story list or chat-list presentation targets")
        if (plan.scope != null) writeStub(STORIES, "isDialogAvatar", 2, plan.scope)
        handleTargets(PATCH, "story targets", StoryTarget.entries) { target ->
            val hook = plan.hooks[target]
            if (hook == null) "no structurally matching ${target.capability} target"
            else {
                if (target == StoryTarget.REQUESTS) {
                    hook.method.returnEarlyWhen(PATCH, "$STORIES->skipStoryRequests()Z", "return-void")
                } else {
                    val labels = hook.jump?.let { arrayOf(ExternalLabel("hush_merge", hook.method.getInstruction(it))) }
                        ?: emptyArray()
                    hook.method.addInstructionsAtControlFlowLabel(hook.index, hook.code, *labels)
                }
                when (target) {
                    StoryTarget.REQUESTS -> enableCapability("storyRequests")
                    StoryTarget.BAR -> enableCapability("storyBar")
                    StoryTarget.CAMERA -> enableCapability("storyCamera")
                    StoryTarget.AVATARS -> enableCapability("storyAvatars")
                    StoryTarget.TOUCHES -> enableCapability("storyTouches")
                }
                null
            }
        }
        enableStatus("hideStories")
    }
}

internal enum class StoryTarget(val capability: String) {
    REQUESTS("storyRequests"), BAR("storyBar"), CAMERA("storyCamera"),
    AVATARS("storyAvatars"), TOUCHES("storyTouches"),
}

internal data class StoryHook(val method: MutableMethod, val index: Int, val code: String, val jump: Int? = null)
internal data class StoryPlan(val hooks: Map<StoryTarget, StoryHook>, val scope: String?)

/** Finds kept protocol/resource anchors, then follows the fixture's own field and method references. */
internal fun BytecodePatchContext.resolveStoryHooks(): StoryPlan {
    val classes = mutableMapOf<String, ClassDef>()
    classDefForEach { if (!it.type.startsWith("Lapp/hushtelegram/extension/")) classes[it.type] = it }
    fun mutable(method: Method) = mutableClassDefBy(method.definingClass).methods.single { it.sameSignature(method) }
    fun body(call: MethodReference): Method = classes[call.definingClass]?.methods?.singleOrNull { it.sameSignature(call) }
        ?: throw PatchException("$PATCH: no body for discovered $call")
    val hooks = mutableMapOf<StoryTarget, StoryHook>()
    val request = classes.values.flatMap { it.methods.toList() }.filter {
        it.hasShape(listOf("Z"), "V") && it.instructions().any { instruction ->
            instruction.opcode == Opcode.NEW_INSTANCE && instruction.reference() == GET_ALL_STORIES
        }
    }.unique("story list request")
    if (request != null) {
        shape(request.instructions().any { it.field()?.let { field ->
            field.definingClass == GET_ALL_STORIES && field.name == "include_hidden" && field.type == "Z"
        } == true }, "story list request lacks include_hidden")
        val method = mutable(request)
        method.requireLocals(PATCH, 1)
        hooks[StoryTarget.REQUESTS] = StoryHook(method, 0, "")
    }

    val dialogs = classes.values.filter { classDef -> classDef.methods.any {
        it.name == "createView" && it.hasShape(listOf("Landroid/content/Context;"), "Landroid/view/View;") &&
            it.instructions().any { instruction -> instruction.reference() == STORY_CAMERA_ICON }
    } }.unique("chat list with the Post Story camera")
    if (dialogs != null) {
        val create = dialogs.methods.single { it.name == "createView" && it.instructions().any { i -> i.reference() == STORY_CAMERA_ICON } }
        val creation = create.instructions()
        val icon = creation.indexOfFirst { it.reference() == STORY_CAMERA_ICON }
        val cameraRead = creation.getOrNull(icon - 1)
        val camera = cameraRead?.field()
        shape(cameraRead?.opcode == Opcode.IGET_OBJECT && camera?.definingClass == dialogs.type &&
            creation.getOrNull(icon + 1)?.call()?.name == "setImageResource" &&
            creation[icon + 1].namedRegisters() == listOf(cameraRead.namedRegisters()[0], creation[icon].namedRegisters()[0]),
            "Post Story icon has no distinct camera field")
        hooks[StoryTarget.CAMERA] = cameraHook(mutable(dialogs.methods.filter { method ->
            method.hasShape(listOf("Z"), "V") && method.instructions().any { it.opcode == Opcode.IGET_OBJECT && it.field() == camera }
        }.unique("camera visibility update") ?: throw PatchException("$PATCH: no camera visibility update")), camera!!)
        val bar = dialogs.methods.filter { method ->
            method.hasShape(listOf("Z"), "V") && method.instructions().any { it.call()?.name == "getLastStoryViewer" } &&
                method.instructions().any { it.call()?.let { call -> call.definingClass == "Landroid/animation/ValueAnimator;" && call.name == "ofFloat" } == true }
        }.unique("cached story bar update")
        if (bar != null) hooks[StoryTarget.BAR] = barHook(mutable(bar))
    }

    val cell = classes.values.filter { classDef ->
        classDef.methods.any { it.name == "getDialogId" && it.hasShape(emptyList(), "J") } &&
            classDef.methods.any { it.name == "getCurrentDialogFolderId" && it.hasShape(emptyList(), "I") } &&
            classDef.methods.any { it.instructions().any { i -> i.reference() == CHAT_PREVIEW_ACTION } }
    }.unique("dialog avatar cell") ?: return StoryPlan(hooks, null)
    val intercept = cell.methods.single { it.name == "onInterceptTouchEvent" && it.hasShape(listOf("Landroid/view/MotionEvent;"), "Z") }
    val intercepted = intercept.instructions()
    val touchAt = intercepted.indices.filter { intercepted[it].call()?.hasShape(TOUCH_PARAMETERS, "Z") == true }
        .unique("dialog avatar touch call") ?: throw PatchException("$PATCH: no dialog avatar touch call")
    val touchCall = intercepted[touchAt].call()!!
    val paramsRead = intercepted.getOrNull(touchAt - 1)
    val paramsField = paramsRead?.field()
    val shareRead = intercepted.getOrNull(touchAt - 3)
    val share = shareRead?.field()
    val interceptFlow = ControlFlow.of(intercept)
    shape(paramsRead?.opcode == Opcode.IGET_OBJECT && paramsField?.definingClass == cell.type &&
        paramsRead.namedRegisters()[0] == intercepted[touchAt].namedRegisters()[0] &&
        shareRead?.opcode == Opcode.IGET_BOOLEAN && share?.definingClass == cell.type &&
        intercepted[touchAt - 2].opcode == Opcode.IF_NEZ &&
        intercepted[touchAt - 2].namedRegisters()[0] == shareRead.namedRegisters()[0] &&
        interceptFlow.normal[touchAt - 2].any { it > touchAt }, "dialog avatar has no Share to Story exclusion")
    val params = classes[paramsField!!.type] ?: throw PatchException("$PATCH: no dialog avatar params class")
    shape(params.superclass == touchCall.definingClass, "dialog avatar touch does not use its params base")
    val owner = params.fields.filter { it.type == cell.type }.unique("dialog params owner")
        ?: throw PatchException("$PATCH: no dialog params owner")
    val shareMember = cell.fields.single { it.name == share!!.name && it.type == share.type }
    shape(listOf(params.accessFlags, cell.accessFlags, owner.accessFlags, shareMember.accessFlags)
        .all { AccessFlags.PUBLIC.isSet(it) }, "avatar scope cannot access the discovered classes or fields")
    val scope = """
        instance-of v0, p0, ${params.type}
        if-eqz v0, :hush_other
        check-cast p0, ${params.type}
        iget-object v0, p0, $owner
        iget-boolean v0, v0, $share
        if-nez v0, :hush_other
        const/4 v0, 0x1
        return v0
        :hush_other
        const/4 v0, 0x0
        return v0
    """
    shape(mutableClassDefBy(STORIES).methods.count { it.name == "isDialogAvatar" &&
        AccessFlags.STATIC.isSet(it.accessFlags) && it.hasShape(listOf("Ljava/lang/Object;"), "Z") } == 1,
        "extension has no Object avatar scope stub")

    val draw = cell.methods.single { it.name == "onDraw" && it.hasShape(listOf(CANVAS), "V") }
    val drawing = draw.instructions()
    val wrapperAt = drawing.indices.filter { drawing[it].call()?.hasShape(listOf("J", CANVAS, IMAGE, params.superclass!!), "V") == true }
        .unique("dialog story renderer") ?: throw PatchException("$PATCH: no dialog story renderer")
    val paramsRegister = drawing[wrapperAt].namedRegisters().last()
    val savedAt = (0 until wrapperAt).lastOrNull { drawing[it].opcode == Opcode.IGET &&
        drawing[it].field()?.definingClass == params.superclass && drawing[it].namedRegisters()[1] == paramsRegister }
        ?: throw PatchException("$PATCH: dialog renderer does not save force state")
    val force = drawing[savedAt].field()!!
    shape(drawing.drop(wrapperAt + 1).any { it.opcode == Opcode.IPUT && it.field() == force &&
        it.namedRegisters() == drawing[savedAt].namedRegisters() } &&
        drawing.take(savedAt).any { it.opcode == Opcode.IGET_BOOLEAN && it.field() == share } &&
        drawing.subList(savedAt + 1, wrapperAt).any { it.opcode == Opcode.IPUT && it.field() == force },
        "dialog renderer lacks saved/restored Share to Story force state")
    val wrapper = body(drawing[wrapperAt].call()!!)
    val renderCall = wrapper.instructions().mapNotNull { it.call() }.filter {
        it.hasShape(listOf("J", CANVAS, IMAGE, "Z", params.superclass!!), "V")
    }.unique("avatar state renderer") ?: throw PatchException("$PATCH: no avatar state renderer")
    shape(wrapper.instructions().any { it.call()?.name == "getStoriesController" }, "avatar wrapper is not the story renderer")
    hooks[StoryTarget.AVATARS] = avatarHook(mutable(body(renderCall)), force)
    val community = params.methods.filter { it.hasShape(COMMUNITY_PARAMETERS, "Z") &&
        it.instructions().mapNotNull { i -> i.field() }.count { field -> field.name == "linked_community_id" } == 2
    }.unique("dialog community avatar predicate") ?: throw PatchException("$PATCH: no community avatar predicate")
    hooks[StoryTarget.TOUCHES] = touchHook(mutable(body(touchCall)), community.name, params.superclass!!)
    return StoryPlan(hooks, scope)
}

private fun cameraHook(method: MutableMethod, camera: FieldReference): StoryHook {
    val instructions = method.instructions()
    val read = instructions.indices.filter { instructions[it].opcode == Opcode.IGET_OBJECT && instructions[it].field() == camera }
        .unique("camera visibility field read") ?: throw PatchException("$PATCH: no camera field read")
    val at = read + 2
    val call = instructions.getOrNull(at)?.call()
    val registers = instructions.getOrNull(at)?.namedRegisters().orEmpty()
    shape(instructions.getOrNull(read + 1)?.opcode == Opcode.IF_EQZ && call?.hasShape(listOf("Z", "Z"), "V") == true &&
        registers.size == 3 && registers[0] == instructions[read].namedRegisters()[0] && registers.distinct().size == 3 &&
        ControlFlow.of(method).normal[read + 1].contains(at + 1) &&
        instructions.take(at).count { it.call() == call } == 1 && instructions.getOrNull(at + 1)?.opcode == Opcode.RETURN_VOID,
        "camera does not share the compose visibility call and finish the update")
    val visible = registers[1]
    shape(visible <= 255, "camera visibility register is too high")
    return StoryHook(method, at, "invoke-static/range {v$visible .. v$visible}, $STORIES->showStoryCamera(Z)Z\nmove-result v$visible")
}

/** Both cached peer stories and the self-story branch feed Telegram's existing layout update. */
private fun barHook(method: MutableMethod): StoryHook {
    val instructions = method.instructions()
    val stores = instructions.indices.filter { instructions[it].opcode == Opcode.IPUT_BOOLEAN && instructions[it].field()?.definingClass == method.definingClass }
    shape(stores.size == 4 && stores.map { instructions[it].field() }.distinct().size == 4 &&
        stores.map { instructions[it].namedRegisters()[1] }.distinct().size == 1, "cached story bar has changed state fields")
    val self = instructions[stores[0]].namedRegisters()[0]
    val visible = instructions[stores[2]].namedRegisters()[0]
    shape(self != visible && instructions[stores[3]].namedRegisters()[0] == visible &&
        instructions.subList(stores[0] + 1, stores[1]).any { it.opcode == Opcode.IGET_BOOLEAN && it.field() == instructions[stores[1]].field() },
        "cached story bar has changed visibility merge")
    val flow = ControlFlow.of(method)
    val first = stores[0]
    // The first value is deliberately reused for the stock self-or-peer merge. Check that
    // whole merge, rather than assuming its later writes are harmless.
    val merge = instructions.subList(first + 1, stores[1])
    shape(merge.size == 7 && stores[1] == first + 8 &&
        merge[0].opcode == Opcode.IGET_BOOLEAN && merge[0].field() == instructions[stores[1]].field() &&
        merge[0].namedRegisters()[0] !in listOf(self, visible) &&
        merge[1].opcode == Opcode.IF_NEZ && merge[1].namedRegisters() == listOf(self) &&
        flow.normal[first + 2].toSet() == setOf(first + 3, first + 7) &&
        merge[2].opcode == Opcode.IF_EQZ && merge[2].namedRegisters() == listOf(visible) &&
        flow.normal[first + 3].toSet() == setOf(first + 4, first + 5) &&
        merge[3].opcode in GOTOS && flow.normal[first + 4] == listOf(first + 7) &&
        merge[4].opcode == Opcode.CONST_4 && merge[4].namedRegisters() == listOf(self) &&
        (merge[4] as NarrowLiteralInstruction).narrowLiteral == 0 &&
        merge[5].opcode in GOTOS && flow.normal[first + 6] == listOf(stores[1]) &&
        merge[6].opcode == Opcode.CONST_4 && merge[6].namedRegisters() == listOf(self) &&
        (merge[6] as NarrowLiteralInstruction).narrowLiteral == 1 &&
        instructions[stores[1]].namedRegisters()[0] == self,
        "cached story bar no longer derives its combined visibility from the guarded values")

    val unguarded = mutableSetOf<Int>()
    val pending = ArrayDeque<Int>()
    pending += 0
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (at == first || !unguarded.add(at)) continue
        pending.addAll(flow.normal[at] + flow.exceptional[at])
    }
    shape(stores.drop(1).none { it in unguarded }, "cached story state stores can bypass their guard")

    val predecessors = Array(instructions.size) { mutableListOf<Int>() }
    instructions.indices.forEach { at ->
        (flow.normal[at] + flow.exceptional[at]).forEach { predecessors[it] += at }
    }
    val reachesPeerStore = mutableSetOf<Int>()
    pending.addAll(stores.drop(2))
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (reachesPeerStore.add(at)) pending.addAll(predecessors[at])
    }
    val afterGuard = mutableSetOf<Int>()
    pending += first
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (!afterGuard.add(at)) continue
        val instruction = instructions[at]
        val destination = instruction.namedRegisters().firstOrNull()
        shape(at !in reachesPeerStore || !instruction.opcode.setsRegister() || destination == null ||
            (destination != visible && (!instruction.opcode.setsWideRegister() || destination + 1 != visible)),
            "cached story bar overwrites guarded peer visibility before its state stores")
        pending.addAll(flow.normal[at] + flow.exceptional[at])
    }
    shape(self <= 255 && visible <= 255, "story bar state registers are too high")
    val answer = method.freeLocalsAt(PATCH, stores[0], 1, highest = 255).single()
    return StoryHook(method, stores[0], """
        invoke-static {}, $STORIES->hideStoryBar()Z
        move-result v$answer
        if-eqz v$answer, :hush_keep
        const/16 v$self, 0x0
        const/16 v$visible, 0x0
        :hush_keep
        nop
    """)
}

/** After forceState, force the stock empty path and finish any cached ring transition. */
private fun avatarHook(method: MutableMethod, force: FieldReference): StoryHook {
    val instructions = method.instructions()
    val flow = ControlFlow.of(method)
    val read = instructions.indices.filter { instructions[it].opcode == Opcode.IGET && instructions[it].field() == force }
        .unique("avatar force-state read") ?: throw PatchException("$PATCH: no avatar force-state read")
    val forced = instructions[read].namedRegisters()[0]
    val params = instructions[read].namedRegisters()[1]
    val branch = read + 1
    shape(instructions.getOrNull(branch)?.opcode == Opcode.IF_EQZ && instructions[branch].namedRegisters() == listOf(forced) &&
        instructions.getOrNull(branch + 1)?.opcode in MOVES && instructions.getOrNull(branch + 2)?.opcode in MOVES,
        "avatar force-state override has changed")
    val at = flow.normal[branch].single { it != branch + 1 }
    val state = instructions[branch + 1].namedRegisters()[0]
    val unread = instructions[branch + 2].namedRegisters()[0]
    shape(at == branch + 3 && instructions[branch + 1].namedRegisters()[1] == forced &&
        instructions[branch + 2].namedRegisters()[1] == state && instructions[at].opcode == Opcode.IGET &&
        instructions[at].field()?.definingClass == force.definingClass && instructions[at].namedRegisters()[1] == params,
        "avatar state comparison is not after the force-state override")
    val current = instructions[at].field()
    val immediate = instructions.indices.mapNotNull { index ->
        if (instructions[index].opcode != Opcode.IF_EQZ) return@mapNotNull null
        val target = flow.normal[index].singleOrNull { it != index + 1 } ?: return@mapNotNull null
        if (instructions[target].opcode == Opcode.IPUT && instructions[target].field() == current &&
            instructions[target].namedRegisters() == listOf(state, params) && instructions.getOrNull(target + 1)?.opcode == Opcode.IPUT &&
            instructions[target + 1].field()?.type == "F" && instructions[target + 1].namedRegisters()[1] == params) index to target else null
    }.unique("avatar nonanimated state update") ?: throw PatchException("$PATCH: no avatar nonanimated state update")
    val animated = instructions[immediate.first].namedRegisters()[0]
    val progress = instructions[immediate.second + 1].field()!!
    shape(listOf(state, unread, animated).distinct().size == 3 && listOf(state, unread, animated).all { it <= 255 } && params <= 15,
        "avatar state registers overlap or exceed the instruction operands")
    val answer = method.freeLocalsAt(PATCH, at, 1, highest = 15).single()
    return StoryHook(method, at, """
        invoke-static/range {v$params .. v$params}, $STORIES->hideAvatarStories(Ljava/lang/Object;)Z
        move-result v$answer
        if-eqz v$answer, :hush_keep
        const/16 v$state, 0x0
        const/16 v$unread, 0x0
        const/16 v$animated, 0x0
        const/4 v$answer, 0x0
        iput v$answer, v$params, $current
        const/high16 v$answer, 0x3f800000
        iput v$answer, v$params, $progress
        :hush_keep
        nop
    """)
}

/** The community-link branch stays intact; only its story fallback can become unclickable. */
private fun touchHook(method: MutableMethod, communityName: String, paramsType: String): StoryHook {
    val instructions = method.instructions()
    val flow = ControlFlow.of(method)
    val call = instructions.indices.filter { instructions[it].call()?.let { it.definingClass == paramsType &&
        it.name == communityName && it.hasShape(COMMUNITY_PARAMETERS, "Z") } == true }
        .unique("community-first avatar touch branch") ?: throw PatchException("$PATCH: no community avatar touch branch")
    val result = call + 1
    val branch = result + 1
    shape(instructions.getOrNull(result)?.opcode == Opcode.MOVE_RESULT && instructions.getOrNull(branch)?.opcode == Opcode.IF_EQZ &&
        instructions[result].namedRegisters() == instructions[branch].namedRegisters() &&
        (instructions.getOrNull(branch + 1) as? NarrowLiteralInstruction)?.narrowLiteral == 1 &&
        instructions.getOrNull(branch + 2)?.opcode in GOTOS, "community touch has no true branch before stories")
    val at = flow.normal[branch].single { it != branch + 1 }
    val merge = flow.normal[branch + 2].single()
    val clickable = instructions[branch + 1].namedRegisters()[0]
    val params = instructions[call].namedRegisters()[0]
    shape(at == branch + 3 && merge > at && instructions[at].opcode == Opcode.IGET_BOOLEAN &&
        instructions[at].field()?.definingClass == paramsType && instructions[merge].opcode == Opcode.IGET_WIDE &&
        instructions[merge].field()?.definingClass == paramsType && clickable <= 255,
        "community and story touch paths have changed their merge")
    val answer = method.freeLocalsAt(PATCH, at, 1, targets = listOf(merge), highest = 255).single()
    return StoryHook(method, at, """
        invoke-static/range {v$params .. v$params}, $STORIES->hideAvatarStoryTouches(Ljava/lang/Object;)Z
        move-result v$answer
        if-eqz v$answer, :hush_keep
        const/16 v$clickable, 0x0
        goto/32 :hush_merge
        :hush_keep
        nop
    """, merge)
}

private fun shape(valid: Boolean, reason: String) {
    if (!valid) throw PatchException("$PATCH: $reason; refuses changed story geometry before editing")
}
private fun <T> List<T>.unique(what: String): T? {
    shape(size <= 1, "ambiguous $what ($size matches)")
    return singleOrNull()
}
private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Instruction.reference(): String? = (this as? ReferenceInstruction)?.reference?.toString()
private fun Instruction.field(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun MethodReference.hasShape(parameters: List<String>, returns: String) = returnType == returns && parameterTypes.map { it.toString() } == parameters
private fun MethodReference.sameSignature(other: MethodReference) = name == other.name && returnType == other.returnType &&
    parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }
