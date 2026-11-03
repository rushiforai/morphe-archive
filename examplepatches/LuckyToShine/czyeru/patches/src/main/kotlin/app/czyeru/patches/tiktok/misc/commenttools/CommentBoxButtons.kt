/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.czyeru.patches.tiktok.misc.commenttools

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.czyeru.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val BASE_INPUT_ASSEM = "Lcom/ss/android/ugc/aweme/comment/keyboard/keyboardv2/refactor/BaseInputAssem;"
internal const val BASE_FAKE_INPUT = "Lcom/ss/android/ugc/aweme/comment/keyboard/keyboardv2/refactor/BaseFakeInput;"
internal const val KEYBOARD_ICON_GROUP_ASSEM = "Lcom/ss/android/ugc/aweme/comment/keyboard/keyboardv2/refactor/KeyboardIconGroupAssem;"
internal const val TUX_ICON_VIEW = "Lcom/bytedance/tux/icon/TuxIconView;"
internal const val GIFT_VIEW_MODEL = "Lcom/ss/android/ugc/aweme/comment/gift/model/GiftViewModel;"
internal const val COMMENT_BOX_BUTTONS_CLASS_DESCRIPTOR = "Lapp/czyeru/extension/tiktok/comment/CommentBoxButtons;"
internal const val PLUS_PANEL_CONFIG = "Lcom/ss/android/ugc/aweme/comment/plus/PlusPanelConfig;"
internal const val COMMENT_PLUS_PANEL_ASSEM = "Lcom/ss/android/ugc/aweme/comment/plus/assem/CommentPlusPanelAssem;"

/**
 * The comment box's view setup. The "Add comment..." bar extends BaseInputAssem, and this is where
 * it finds its icon buttons and keeps each in a field. The field names move from build to build.
 */
internal object CommentInputViewCreatedFingerprint : Fingerprint(
    definingClass = BASE_INPUT_ASSEM,
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
)

/** The "Add comment..." bar's setup, which gives each icon field its click listener. */
internal object FakeInputViewCreatedFingerprint : Fingerprint(
    definingClass = BASE_FAKE_INPUT,
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
)

/**
 * The icon row over the keyboard. On 47.4.3 it's its own assem rather than a BaseInputAssem, with
 * its own icon fields, and its setup both finds them by id and gives each its click listener, so
 * the photo and @ buttons still showed there with the switch on (Login2, 2026-10-20).
 */
internal object KeyboardIconGroupViewCreatedFingerprint : Fingerprint(
    definingClass = KEYBOARD_ICON_GROUP_ASSEM,
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
)

/**
 * The tiles of the comment "+" panel. Each id in TikTok's plus panel config is looked up in the
 * button enum's byRaw map, and the buttons that apply here go to the panel's grid. On 47.4.3 the
 * only tile on the test account was the gift one (Login2, 2026-10-20).
 */
internal object CommentPlusPanelRefreshFingerprint : Fingerprint(
    definingClass = COMMENT_PLUS_PANEL_ASSEM,
    returnType = "V",
    parameters = listOf(),
    strings = listOf("refreshButtons config="),
)

/** The row's "+" check: it shows "+" only while an id in the same config maps to a button that applies. */
internal object KeyboardIconGroupPlusFingerprint : Fingerprint(
    definingClass = KEYBOARD_ICON_GROUP_ASSEM,
    returnType = "V",
    parameters = listOf(),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction.getReference<FieldReference>()?.let {
                it.definingClass == PLUS_PANEL_CONFIG && it.name == "plusPanelButtons"
            } == true
        } == true
    },
)

/** Each byRaw lookup in [method], as the index of its move-result-object and the register it fills. */
internal fun plusPanelLookups(method: Method): List<Pair<Int, Int>> {
    val instructions = method.implementation?.instructions?.toList() ?: return emptyList()
    return instructions.indices.mapNotNull { index ->
        val map = instructions[index].takeIf { it.opcode == Opcode.SGET_OBJECT }
            ?.getReference<FieldReference>()?.takeIf { it.name == "byRaw" && it.type == "Ljava/util/Map;" }
            ?: return@mapNotNull null
        val get = instructions.getOrNull(index + 1)?.getReference<MethodReference>()
        val result = instructions.getOrNull(index + 2)
        if (get?.name != "get" || get.definingClass != "Ljava/util/Map;" || result?.opcode != Opcode.MOVE_RESULT_OBJECT) {
            throw PatchException("Comment tools: ${map.definingClass}->byRaw is read without the lookup after it")
        }
        index + 2 to (result as OneRegisterInstruction).registerA
    }
}

/** Passes each button the plus panel config names through the extension, which drops the hidden ones. */
internal fun MutableMethod.resolvePlusPanelTiles(): CommentToolsWrite {
    val lookups = plusPanelLookups(this)
    if (lookups.size != 1) {
        throw PatchException("Comment tools: expected one plus panel lookup in $definingClass->$name, found ${lookups.size}")
    }
    return {
        lookups.sortedByDescending { it.first }.forEach { (index, register) ->
            addInstructions(
                index + 1,
                """
                    invoke-static/range {v$register .. v$register}, $COMMENT_BOX_BUTTONS_CLASS_DESCRIPTOR->plusTile(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$register
                """,
            )
        }
    }
}

/** The comment box buttons Hide comment box buttons takes away, each with its extension entry. */
internal enum class CommentBoxButton(val entry: String) {
    PHOTO("photo"),
    MENTION("mention"),
    GIFT("gift"),
}

/**
 * Which button each icon field is, told by what its click listener does: the photo button logs
 * click_comment_photo, and the @ and gift buttons open the input's MENTION and GIFT panels (the
 * panel enum keeps its constant names). Over the keyboard the @ button logs click_comment_at and
 * the gift button names the gift view model instead. The emoji button opens EMOJI and stays.
 * [owner] is the class whose icon fields the listeners are wired to.
 */
internal fun commentBoxButtonFields(
    viewCreated: Method,
    owner: String = BASE_INPUT_ASSEM,
    classDefOf: (String) -> ClassDef?,
): Map<CommentBoxButton, FieldReference> {
    val instructions = viewCreated.implementation?.instructions?.toList()
        ?: throw PatchException("Comment tools: the comment box setup has no body")
    val found = HashMap<CommentBoxButton, MutableList<FieldReference>>()
    instructions.forEachIndexed { index, instruction ->
        if (instruction.opcode != Opcode.IGET_OBJECT) return@forEachIndexed
        val field = instruction.getReference<FieldReference>() ?: return@forEachIndexed
        if (field.definingClass != owner || field.type != TUX_ICON_VIEW) return@forEachIndexed
        val listener = instructions.subList(index + 1, minOf(index + 4, instructions.size))
            .firstOrNull { it.opcode == Opcode.NEW_INSTANCE }
            ?.getReference<TypeReference>()?.type ?: return@forEachIndexed
        val button = classDefOf(listener)?.let(::commentBoxButtonOf) ?: return@forEachIndexed
        found.getOrPut(button) { mutableListOf() }.add(field)
    }
    return CommentBoxButton.entries.associateWith { button ->
        val fields = found[button].orEmpty().distinctBy { it.name }
        fields.singleOrNull() ?: throw PatchException(
            "Comment tools: expected one comment box ${button.entry} button field, found ${fields.map { it.name }}",
        )
    }
}

internal fun commentBoxButtonOf(listener: ClassDef): CommentBoxButton? {
    val instructions = listener.methods.flatMap { it.implementation?.instructions ?: emptyList() }
    val strings = instructions.mapNotNull { it.getReference<StringReference>()?.string }
    if ("click_comment_photo" in strings) {
        return CommentBoxButton.PHOTO
    }
    val panels = instructions.filter { it.opcode == Opcode.SGET_OBJECT }
        .mapNotNull { it.getReference<FieldReference>() }
        .filter { it.type == it.definingClass }
        .map { it.name }
    val namesGift = instructions.any { instruction ->
        instruction.getReference<FieldReference>()?.definingClass == GIFT_VIEW_MODEL ||
            instruction.getReference<MethodReference>()?.returnType == GIFT_VIEW_MODEL
    }
    return when {
        "MENTION" in panels || "click_comment_at" in strings -> CommentBoxButton.MENTION
        "GIFT" in panels || ("EMOJI" !in panels && namesGift) -> CommentBoxButton.GIFT
        else -> null
    }
}

/** Where the setup stores [field]: the one iput-object of it, by index. */
internal fun commentBoxButtonStore(viewCreated: Method, field: FieldReference): Int {
    val stores = viewCreated.implementation!!.instructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.IPUT_OBJECT &&
            instruction.getReference<FieldReference>()?.let {
                it.definingClass == field.definingClass && it.name == field.name && it.type == TUX_ICON_VIEW
            } == true
    }
    return stores.singleOrNull()?.index ?: throw PatchException(
        "Comment tools: the comment box setup stores ${field.name} ${stores.size} times, not once",
    )
}

/** Hands each button to the extension the moment the setup stores it. */
internal fun MutableMethod.resolveCommentBoxButtons(fields: Map<CommentBoxButton, FieldReference>): CommentToolsWrite {
    val stores = fields.map { (button, field) ->
        val index = commentBoxButtonStore(this, field)
        val view = (implementation!!.instructions.elementAt(index) as TwoRegisterInstruction).registerA
        Triple(index, view, button)
    }
    return {
        stores.sortedByDescending { it.first }.forEach { (index, view, button) ->
            addInstruction(
                index + 1,
                "invoke-static/range {v$view .. v$view}, $COMMENT_BOX_BUTTONS_CLASS_DESCRIPTOR->${button.entry}(Landroid/view/View;)V",
            )
        }
    }
}
