/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.util.ControlFlow
import app.morphe.util.names.addInstructions
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

internal const val CHAT_LIST_AVATAR = "$EXTENSION_PACKAGE/misc/ChatListAvatar;"
internal const val AVATAR_RESIZE = "$CHAT_LIST_AVATAR->resize(Landroid/graphics/RectF;Ljava/lang/Object;)V"
internal const val RECT_SET = "Landroid/graphics/RectF;->set(FFFF)V"
private const val RECT = "Landroid/graphics/RectF;"
private const val IMAGE_RECEIVER = "Lorg/telegram/messenger/ImageReceiver;"
private const val GET_ROUND_RADIUS = "$IMAGE_RECEIVER->getRoundRadius()[I"
private const val SET_ROUND_RADIUS = "$IMAGE_RECEIVER->setRoundRadius(I)V"
/** Only the chat row's layout loads this, for the label of a sponsored proxy's chat. */
private const val PSA_TYPE = "PsaType_"

/** One place the chat row's layout sets its avatar's square: the set at [index], the square in [rect], the row in [cell]. */
internal class AvatarSquare(val index: Int, val rect: Int, val cell: Int, val holder: String, val square: String)

/** The chat row's layout and the two places it sets the avatar's square, two-line rows and three-line rows. */
internal class ChatListAvatarPlan(val method: MutableMethod, val cellType: String, val avatar: String, val squares: List<AvatarSquare>) {
    /** Inserts the hook after each set, the later one first so the earlier index holds. */
    fun apply(target: MutableMethod = method) {
        for (square in squares.sortedByDescending { it.index }) {
            target.addInstructions(square.index + 1, "invoke-static {v${square.rect}, v${square.cell}}, $AVATAR_RESIZE")
        }
    }
}

/**
 * The chat row (DialogCell) works its avatar's square out once per layout, in storyParams'
 * originalAvatarRect, which everything that draws the avatar, its story ring, online dot and
 * unread mark reads. The layout is the only method loading "PsaType_", and sets that square in
 * two places: 52 dp for two-line rows and 56 dp for three-line rows. Each is a RectF.set on a
 * rect read from a field of the row's own story params, read from the row just before, with
 * nothing jumping in between. The extension's hook goes right after each set.
 */
internal fun BytecodePatchContext.resolveChatListAvatar(): ChatListAvatarPlan {
    requireStatusMethod("chatListAvatar")
    controlHook(CHAT_LIST_AVATAR, "resize", listOf(RECT, "Ljava/lang/Object;"), "V")
    controlHook(CHAT_LIST_AVATAR, "avatarOf", listOf("Ljava/lang/Object;"), "Ljava/lang/Object;")
    controlHook(CHAT_LIST_AVATAR, "radii", listOf("Ljava/lang/Object;"), "[I")
    controlHook(CHAT_LIST_AVATAR, "setRadius", listOf("Ljava/lang/Object;", "I"), "V")
    requireReachable(GET_ROUND_RADIUS, false)
    requireReachable(SET_ROUND_RADIUS, false)

    val found = mutableListOf<Pair<String, String>>()
    forEachClassMentioning(Mention.string(PSA_TYPE)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        cls.methods.filter { m ->
            !AccessFlags.STATIC.isSet(m.accessFlags) && m.parameterTypes.isEmpty() && m.returnType == "V" &&
                m.controlBody().any { it.controlString() == PSA_TYPE }
        }.forEach { found += cls.type to it.name }
    }
    val (type, name) = found.controlSingle("the chat row's layout")
    val cell = tgMutableClassDefBy(type)
    val method = cell.methods.single { it.name == name && it.parameterTypes.isEmpty() && it.returnType == "V" }
    val avatar = cell.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == IMAGE_RECEIVER }
        .controlSingle("the chat row's avatar")
    val avatarRef = "${cell.type}->${avatar.name}:${avatar.type}"
    requireReachable(avatarRef, false)

    val body = method.controlBody()
    val flow = ControlFlow.of(method)
    val into = Array(body.size) { mutableListOf<Int>() }
    for (from in body.indices) {
        flow.normal[from].forEach { into[it] += from }
        flow.exceptional[from].forEach { into[it] += from }
    }
    val squares = body.indices.filter { body[it].opcode == Opcode.INVOKE_VIRTUAL && body[it].controlRef() == RECT_SET }
        .mapNotNull { avatarSquare(body, into, it, cell.type) }
    controlShape(squares.size == 2 && squares.map { it.holder to it.square }.distinct().size == 1,
        "the avatar square's two layouts are missing or ambiguous")
    controlShape(squares.all { it.rect < 16 && it.cell < 16 }, "the avatar square sits in a register the hook can't name")
    return ChatListAvatarPlan(method, cell.type, avatarRef, squares)
}

/**
 * The square a RectF.set at [at] fills when it is `iget-object R, P, ->X:RectF` after
 * `iget-object P, C, Lcell;->params`, with nothing jumping into that stretch or past the set and
 * neither register written again before it.
 */
private fun avatarSquare(body: List<Instruction>, into: Array<MutableList<Int>>, at: Int, cellType: String): AvatarSquare? {
    val rect = (body[at] as FiveRegisterInstruction).registerC
    val square = (at - 1 downTo maxOf(0, at - 40)).firstOrNull { body[it].writes(rect) } ?: return null
    val squareField = body[square].controlField()
    if (body[square].opcode != Opcode.IGET_OBJECT || squareField?.type != RECT) return null
    val holder = (body[square] as TwoRegisterInstruction).registerB
    val read = (square - 1 downTo maxOf(0, square - 8)).firstOrNull { body[it].writes(holder) } ?: return null
    val holderField = body[read].controlField()
    if (body[read].opcode != Opcode.IGET_OBJECT || holderField?.definingClass != cellType) return null
    val cell = (body[read] as TwoRegisterInstruction).registerB
    if ((read + 1..at + 1).any { it >= body.size || into[it] != listOf(it - 1) }) return null
    if ((read + 1 until at).any { body[it].writes(cell) }) return null
    return AvatarSquare(at, rect, cell, "${holderField.definingClass}->${holderField.name}", "${squareField.definingClass}->${squareField.name}")
}

private fun Instruction.writes(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val written = (this as? OneRegisterInstruction)?.registerA ?: return false
    return written == register || (opcode.setsWideRegister() && written + 1 == register)
}

/** Gives the stubs the row's avatar field and ImageReceiver's round radius getter and setter. */
internal fun BytecodePatchContext.writeChatListAvatarStubs(plan: ChatListAvatarPlan) {
    writeStub(CHAT_LIST_AVATAR, "avatarOf", 2, """
        check-cast p0, ${plan.cellType}
        iget-object v0, p0, ${plan.avatar}
        return-object v0
    """)
    writeStub(CHAT_LIST_AVATAR, "radii", 2, """
        check-cast p0, $IMAGE_RECEIVER
        invoke-virtual {p0}, $GET_ROUND_RADIUS
        move-result-object v0
        return-object v0
    """)
    writeStub(CHAT_LIST_AVATAR, "setRadius", 2, """
        check-cast p0, $IMAGE_RECEIVER
        invoke-virtual {p0, p1}, $SET_ROUND_RADIUS
        return-void
    """)
}
