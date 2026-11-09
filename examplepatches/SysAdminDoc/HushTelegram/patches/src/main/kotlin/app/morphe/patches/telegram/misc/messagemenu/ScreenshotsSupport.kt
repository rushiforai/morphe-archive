/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.call
import app.morphe.util.names.tgClassDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val SCREENSHOTS = "Lapp/hushtelegram/extension/telegram/misc/Screenshots;"
internal const val SCREENSHOTS_PROTECTED = "$SCREENSHOTS->protectedContent(I)Z"
internal const val SCREENSHOTS_STORY = "$SCREENSHOTS->storyAllowed(I)Z"

private const val SECURE = 8192
private const val WINDOW = "Landroid/view/Window;"
private const val ADD_FLAGS = "Landroid/view/Window;->addFlags(I)V"
private const val CLEAR_FLAGS = "Landroid/view/Window;->clearFlags(I)V"
private const val LAYOUT_FLAGS = "Landroid/view/WindowManager\$LayoutParams;->flags:I"
private const val ENCRYPTED_CHAT = "Lorg/telegram/tgnet/TLRPC\$EncryptedChat;"
private const val NO_FORWARDS = "Lorg/telegram/tgnet/TLRPC\$Message;->noforwards:Z"
private const val SURFACE_SECURE = "Landroid/view/SurfaceView;->setSecure(Z)V"
private const val SELECTABLE = "Landroid/widget/TextView;->setTextIsSelectable(Z)V"

/** One spot to ask the extension: the answer in [register] is handed over just before instruction [at]. */
internal class ScreenshotSpot(val at: Int, val register: Int, val hook: String)

/** The kinds of spot, each a finder that reads them off a method again at apply time. */
internal enum class ScreenshotSite(val find: (Method) -> List<ScreenshotSpot>?) {
    CONDITION(Method::conditionSpots),
    CELL(Method::cellSpots),
    VIEWER(Method::viewerSpots),
    STORY(Method::storySpots),
    TRANSLATE(Method::translateSpots),
}

/** Every spot that decides on blocking screen capture for protected content, or why this build has no such set. */
internal class ScreenshotsPlan(val missing: String?, internal val targets: List<Pair<MutableMethod, ScreenshotSite>>) {
    fun apply() {
        for ((method, site) in targets) {
            // Read again here: another hook may have landed in this method since the plan was made.
            val spots = site.find(method) ?: throw IllegalStateException("a screenshot check changed under the patch")
            // Later spots go in first so the earlier indexes still hold.
            for (spot in spots.sortedByDescending { it.at }) method.askAbout(spot)
        }
    }
}

private fun MutableMethod.askAbout(spot: ScreenshotSpot) = addInstructions(spot.at,
    "invoke-static/range {v${spot.register} .. v${spot.register}}, ${spot.hook}\nmove-result v${spot.register}")

/** Every index a branch, a switch case or an exception handler lands on. */
private fun Method.landings(): Set<Int> {
    val impl = implementation ?: return emptySet()
    val code = impl.instructions.toList()
    val addresses = IntArray(code.size)
    var address = 0
    for (at in code.indices) {
        addresses[at] = address
        address += code[at].codeUnits
    }
    fun indexAt(wanted: Int) = addresses.binarySearch(wanted).takeIf { it >= 0 }
    val found = mutableSetOf<Int>()
    for (at in code.indices) {
        val branch = code[at] as? OffsetInstruction ?: continue
        val target = indexAt(addresses[at] + branch.codeOffset) ?: continue
        val payload = code[target] as? SwitchPayload
        if (payload == null) {
            found += target
        } else {
            payload.switchElements.mapNotNullTo(found) { indexAt(addresses[at] + it.offset) }
        }
    }
    for (block in impl.tryBlocks) block.exceptionHandlers.mapNotNullTo(found) { indexAt(it.handlerCodeAddress) }
    return found
}

/** The index the branch at [index] lands on, or null when it is no branch. */
private fun List<Instruction>.landingOf(index: Int): Int? {
    val branch = this[index] as? OffsetInstruction ?: return null
    var address = 0
    var from = -1
    val addresses = IntArray(size)
    for (at in indices) {
        addresses[at] = address
        if (at == index) from = address
        address += this[at].codeUnits
    }
    return addresses.binarySearch(from + branch.codeOffset).takeIf { it >= 0 }
}

private fun Instruction.register() = (this as? OneRegisterInstruction)?.registerA
private fun Method.code() = implementation?.instructions?.toList()
private fun Method.takesOneBoolean() = parameterTypes.map { it.toString() } == listOf("Z") && returnType == "V" &&
    !AccessFlags.STATIC.isSet(accessFlags)

/**
 * The chat's and the profile's FlagSecureReason conditions read
 * `currentEncryptedChat != null || <the chat or user doesn't allow saving>()`. Only the second
 * answer is handed over, right before the branch that tests it, so a secret chat stays secure on
 * the first read whatever the switch says.
 */
internal fun Method.conditionSpots(): List<ScreenshotSpot>? {
    if (name != "run" || parameterTypes.isNotEmpty() || returnType != "Z") return null
    val code = code() ?: return null
    val spot = code.indices.mapNotNull { code.conditionSpotAt(it) }.singleOrNull() ?: return null
    return if (spot.at in landings()) null else listOf(spot)
}

private fun List<Instruction>.conditionSpotAt(at: Int): ScreenshotSpot? {
    val read = this[at]
    if (read.opcode != Opcode.IGET_OBJECT) return null
    val field = (read as ReferenceInstruction).reference as? FieldReference ?: return null
    if (field.type != ENCRYPTED_CHAT) return null
    val holder = (read as TwoRegisterInstruction).registerB
    val test = getOrNull(at + 1) ?: return null
    if (test.opcode != Opcode.IF_NEZ || test.register() != read.registerA) return null
    val ask = getOrNull(at + 2) as? FiveRegisterInstruction ?: return null
    val asked = ask.call() ?: return null
    if (ask.opcode != Opcode.INVOKE_VIRTUAL || ask.registerCount != 1 || ask.registerC != holder ||
        asked.definingClass != field.definingClass || asked.parameterTypes.isNotEmpty() || asked.returnType != "Z") return null
    val answer = getOrNull(at + 3)?.takeIf { it.opcode == Opcode.MOVE_RESULT }?.register() ?: return null
    val branch = getOrNull(at + 4) ?: return null
    if (branch.opcode != Opcode.IF_EQZ || branch.register() != answer) return null
    return ScreenshotSpot(at + 4, answer, SCREENSHOTS_PROTECTED)
}

/**
 * Each chat message cell builds a FlagSecureReason of its own, true while it shows a message that
 * doesn't allow saving (`messageOwner.noforwards`, unless the message is local or ephemeral), paid
 * media not yet unlocked or view-once voice and video. Only the noforwards read is handed over,
 * right before the branch that tests it, so paid and view-once media stay secure whatever the switch
 * says. Without this a single protected message keeps the whole chat window secure.
 */
internal fun Method.cellSpots(): List<ScreenshotSpot>? {
    if (name != "run" || parameterTypes.isNotEmpty() || returnType != "Z") return null
    val code = code() ?: return null
    val read = code.indices.singleOrNull { code[it].opcode == Opcode.IGET_BOOLEAN && code[it].controlRef() == NO_FORWARDS } ?: return null
    val answer = code[read].register() ?: return null
    val test = code.getOrNull(read + 1) ?: return null
    if (test.opcode != Opcode.IF_EQZ || test.register() != answer || (read + 1) in landings()) return null
    return listOf(ScreenshotSpot(read + 1, answer, SCREENSHOTS_PROTECTED))
}

/** `layoutParams.flags |= FLAG_SECURE` starting at [at]. */
private fun List<Instruction>.securesLayoutAt(at: Int): Boolean {
    val params = getOrNull(at) as? TwoRegisterInstruction ?: return false
    val read = getOrNull(at + 1) as? TwoRegisterInstruction ?: return false
    val or = getOrNull(at + 2) ?: return false
    val write = getOrNull(at + 3) as? TwoRegisterInstruction ?: return false
    return params.opcode == Opcode.IGET_OBJECT &&
        read.opcode == Opcode.IGET && read.controlRef() == LAYOUT_FLAGS && read.registerB == params.registerA &&
        or.opcode == Opcode.OR_INT_LIT16 && (or as NarrowLiteralInstruction).narrowLiteral == SECURE &&
        (or as TwoRegisterInstruction).registerA == read.registerA && or.registerB == read.registerA &&
        write.opcode == Opcode.IPUT && write.controlRef() == LAYOUT_FLAGS && write.registerA == read.registerA &&
        write.registerB == params.registerA
}

/**
 * PhotoViewer.openPhoto adds FLAG_SECURE behind a chain of checks that each jump straight to it:
 * a secret chat, the avatar's chat not allowing saving, the message's chat not allowing saving,
 * the message itself not allowing saving, revealed paid media and the place's own forceSecure.
 * The two "chat doesn't allow saving" calls and the message's noforwards are handed over, each
 * right before its jump. The secret chat, paid media and forceSecure checks are left alone.
 */
internal fun Method.viewerSpots(): List<ScreenshotSpot>? {
    val code = code() ?: return null
    val block = code.indices.singleOrNull { code.securesLayoutAt(it) } ?: return null
    val landings = landings()
    var calls = 0
    var fields = 0
    val spots = mutableListOf<ScreenshotSpot>()
    for (at in 1 until block) {
        val jump = code[at + 1]
        if (jump.opcode != Opcode.IF_NEZ || code.landingOf(at + 1) != block) continue
        val answer = jump.register() ?: continue
        val read = code[at]
        val counted = when {
            read.opcode == Opcode.IGET_BOOLEAN && read.controlRef() == NO_FORWARDS &&
                (read as TwoRegisterInstruction).registerA == answer -> { fields++; true }
            read.opcode == Opcode.MOVE_RESULT && read.register() == answer && code[at - 1].opcode == Opcode.INVOKE_VIRTUAL &&
                code[at - 1].call()?.let { it.parameterTypes.map(CharSequence::toString) == listOf("J") && it.returnType == "Z" } == true -> { calls++; true }
            else -> false
        }
        if (counted) spots += ScreenshotSpot(at + 1, answer, SCREENSHOTS_PROTECTED)
    }
    if (calls != 2 || fields != 1 || spots.any { it.at in landings }) return null
    return spots
}

/**
 * StoryViewer.allowScreenshots(allow) sets the story surface's secure flag and the window's
 * FLAG_SECURE from `allow`, which is false on a story whose owner turned saving off. The answer
 * is handed over before anything reads it.
 */
internal fun Method.storySpots(): List<ScreenshotSpot>? {
    if (!takesOneBoolean()) return null
    val code = code() ?: return null
    if (code.none { it.controlRef() == SURFACE_SECURE } || code.none { it.controlRef() == ADD_FLAGS } ||
        code.none { it.controlRef() == LAYOUT_FLAGS } || 0 in landings()) return null
    return listOf(ScreenshotSpot(0, implementation!!.registerCount - 1, SCREENSHOTS_STORY))
}

/**
 * TranslateAlert2.setNoforwards(noforwards) makes the text unselectable and then adds or clears
 * FLAG_SECURE from the same answer. Only the second read is handed over, so selecting text stays
 * as Telegram has it.
 */
internal fun Method.translateSpots(): List<ScreenshotSpot>? {
    if (!takesOneBoolean()) return null
    val code = code() ?: return null
    val selectable = code.indexOfFirst { it.controlRef() == SELECTABLE }.takeIf { it >= 0 } ?: return null
    val flag = implementation!!.registerCount - 1
    val at = code.indices.filter { code[it].opcode == Opcode.IF_EQZ && code[it].register() == flag }.singleOrNull() ?: return null
    if (at < selectable || at in landings()) return null
    // Nothing before the branch may have written the parameter.
    if ((0 until at).any { code[it].opcode.setsRegister() && code[it].register() == flag }) return null
    val add = code.indexOfFirst { it.controlRef() == ADD_FLAGS }
    val clear = code.indexOfFirst { it.controlRef() == CLEAR_FLAGS }
    val landing = code.landingOf(at) ?: return null
    if (add !in (at + 1) until landing || clear < landing) return null
    if (code.none { it is NarrowLiteralInstruction && it.opcode == Opcode.CONST_16 && it.narrowLiteral == SECURE }) return null
    return listOf(ScreenshotSpot(at, flag, SCREENSHOTS_PROTECTED))
}

/** FlagSecureReason's condition interface: the class is built from a window and one, and asks its run() before adding FLAG_SECURE. */
private fun ClassDef.secureReasonCondition(): String? {
    val condition = methods.filter { it.name == "<init>" && it.parameterTypes.size == 2 && it.parameterTypes[0].toString() == WINDOW }
        .singleOrNull()?.parameterTypes?.get(1)?.toString() ?: return null
    val code = methods.mapNotNull { it.code() }
    val asks = code.any { body -> body.any { it.opcode == Opcode.INVOKE_INTERFACE && it.call()?.let { c ->
        c.definingClass == condition && c.name == "run" && c.parameterTypes.isEmpty() && c.returnType == "Z" } == true } }
    val secures = code.any { body -> body.any { it.controlRef() == ADD_FLAGS } && body.any { it.controlRef() == CLEAR_FLAGS } }
    return if (asks && secures) condition else null
}

/** The condition classes this method builds FlagSecureReasons with: the `new-instance` right before each one. */
private fun Method.conditionsBuilt(reason: String, condition: String): List<String> {
    val code = code() ?: return emptyList()
    return code.indices.mapNotNull { at ->
        val built = code[at].call()
        if (code[at].opcode != Opcode.INVOKE_DIRECT && code[at].opcode != Opcode.INVOKE_DIRECT_RANGE) return@mapNotNull null
        if (built == null || built.definingClass != reason || built.name != "<init>" ||
            built.parameterTypes.map(CharSequence::toString) != listOf(WINDOW, condition)) return@mapNotNull null
        val register = when (val call = code[at]) {
            is FiveRegisterInstruction -> call.registerE
            is RegisterRangeInstruction -> call.startRegister + 2
            else -> return@mapNotNull null
        }
        (at - 1 downTo maxOf(0, at - 6)).map { code[it] }
            .firstOrNull { it.opcode == Opcode.NEW_INSTANCE && it.register() == register }
            ?.let { ((it as ReferenceInstruction).reference).toString() }
    }
}

internal fun BytecodePatchContext.resolveScreenshots(): ScreenshotsPlan {
    fun missing(why: String) = ScreenshotsPlan(why, emptyList())
    val found = mutableListOf<Pair<Method, ScreenshotSite>>()

    val reasons = classDefsMentioning(Mention.reference(ADD_FLAGS) and Mention.reference(CLEAR_FLAGS) and Mention.literal(SECURE))
        .mapNotNull { c -> c.secureReasonCondition()?.let { c.type to it } }
    val (reason, condition) = reasons.singleOrNull() ?: return missing("the secure window check isn't one class any more (found ${reasons.size})")
    val conditions = classDefsMentioning(Mention.type(reason)).flatMap { c -> c.methods.flatMap { it.conditionsBuilt(reason, condition) } }
        .distinct().mapNotNull { tgClassDefByOrNull(it) }.filter { condition in it.interfaces }
    val chats = conditions.flatMap { c -> c.methods.filter { it.conditionSpots() != null } }
    if (chats.size != 2) return missing("the chat and profile screenshot checks aren't both there (found ${chats.size})")
    chats.mapTo(found) { it to ScreenshotSite.CONDITION }
    val cells = conditions.flatMap { c -> c.methods.filter { it.cellSpots() != null } }
    found += (cells.singleOrNull() ?: return missing("the message cell's screenshot check moved (found ${cells.size})")) to ScreenshotSite.CELL

    val viewers = classDefsMentioning(Mention.reference(NO_FORWARDS) and Mention.reference(LAYOUT_FLAGS) and Mention.literal(SECURE))
        .flatMap { c -> c.methods.filter { it.viewerSpots() != null } }
    found += (viewers.singleOrNull() ?: return missing("the photo viewer's screenshot check moved (found ${viewers.size})")) to ScreenshotSite.VIEWER

    val stories = classDefsMentioning(Mention.reference(SURFACE_SECURE) and Mention.reference(ADD_FLAGS) and Mention.literal(SECURE))
        .flatMap { c -> c.methods.filter { it.storySpots() != null } }
    found += (stories.singleOrNull() ?: return missing("the story viewer's screenshot check moved (found ${stories.size})")) to ScreenshotSite.STORY

    val translates = classDefsMentioning(Mention.reference(SELECTABLE) and Mention.reference(ADD_FLAGS) and Mention.literal(SECURE))
        .flatMap { c -> c.methods.filter { it.translateSpots() != null } }
    found += (translates.singleOrNull() ?: return missing("the translate window's screenshot check moved (found ${translates.size})")) to ScreenshotSite.TRANSLATE

    return ScreenshotsPlan(null, found.map { (method, site) ->
        mutableClassDefBy(method.definingClass).methods.single { it.toString() == method.toString() } to site
    })
}
