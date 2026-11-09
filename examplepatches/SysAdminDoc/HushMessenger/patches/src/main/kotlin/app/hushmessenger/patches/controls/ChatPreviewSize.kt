package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * A bigger chat in the long-press preview. The preview stacks the chat over its menu in a LinearLayout that gets three
 * sizes: the most the whole stack may take, the chat's height, and the least the chat may shrink to when the menu is
 * long. The chat gets a bigger share, never shrinks, and the menu, already in a ScrollView, scrolls in what's left.
 * The layer over the chat that opens it on a tap also hands drags down to the chat, so it scrolls too.
 */
internal const val CHAT_PREVIEW_SIZE = "chat_preview_size"

internal const val CHAT_PREVIEW_SIZE_HOST = "Lapp/hushmessenger/extension/ChatPreviewSize;"

private const val PREVIEW_TAP_TAG = "InboxThreadPreviewDialogFragment.preview_tap"
private const val STACK_INIT = "Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V"
private const val MATH_MIN = "Ljava/lang/Math;->min(II)I"
private const val SET_TAG = "Landroid/view/View;->setTag(Ljava/lang/Object;)V"
private const val VIEW = "Landroid/view/View;"
private const val PREVIEW_VIEW_CALL = "onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;"

/**
 * Where the stack gets its sizes, the registers holding the most, the chat's height and the least, and where the tap
 * layer is stored, with the layer's register.
 */
internal class ChatPreviewSizeSite(val stack: Int, val most: Int, val height: Int, val least: Int, val tapLayer: Int, val layer: Int)

private fun Instruction.previewMethod() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.previewField() = (this as? ReferenceInstruction)?.reference as? FieldReference

private fun Instruction.previewString() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.overwrites(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val written = (this as? OneRegisterInstruction)?.registerA ?: return false
    return written == register || (opcode.setsWideRegister() && written + 1 == register)
}

private fun Instruction.invoked(): List<Int>? = (this as? FiveRegisterInstruction)?.let { call ->
    listOf(call.registerC, call.registerD, call.registerE, call.registerF, call.registerG).take(call.registerCount)
}

/**
 * The stack's `new-instance`, its LinearLayout constructor, two int fields (the most, then the chat's height), then
 * `Math.min` of the height and the least, written to a third int field.
 */
private fun List<Instruction>.previewStackAt(at: Int): Triple<Int, Int, Int>? {
    val made = this[at]
    if (made.opcode != Opcode.NEW_INSTANCE) return null
    val stack = (made as OneRegisterInstruction).registerA
    val type = ((made as ReferenceInstruction).reference as TypeReference).type
    val init = getOrNull(at + 1) ?: return null
    if (init.opcode != Opcode.INVOKE_DIRECT || init.previewMethod()?.toString() != STACK_INIT || init.invoked()?.first() != stack) return null
    fun sized(i: Int): Pair<Int, String>? {
        val write = getOrNull(i) ?: return null
        val field = write.previewField() ?: return null
        if (write.opcode != Opcode.IPUT || (write as TwoRegisterInstruction).registerB != stack || field.definingClass != type || field.type != "I") return null
        return (write as OneRegisterInstruction).registerA to field.name
    }
    val (most, mostField) = sized(at + 2) ?: return null
    val (height, heightField) = sized(at + 3) ?: return null
    val min = getOrNull(at + 4) ?: return null
    val operands = min.invoked() ?: return null
    if (min.opcode != Opcode.INVOKE_STATIC || min.previewMethod()?.toString() != MATH_MIN || operands.count { it == height } != 1) return null
    val least = operands.single { it != height }
    val result = getOrNull(at + 5) ?: return null
    if (result.opcode != Opcode.MOVE_RESULT) return null
    val (written, leastField) = sized(at + 6) ?: return null
    if (written != (result as OneRegisterInstruction).registerA || setOf(mostField, heightField, leastField).size != 3) return null
    if (setOf(most, height, least).size != 3 || listOf(most, height, least).any { it > 15 }) return null
    return Triple(most, height, least)
}

/** The tap layer's tag, its `setTag`, and the first time the fragment stores that same view, within a few instructions. */
private fun List<Instruction>.tapLayerAt(at: Int): Pair<Int, Int>? {
    val tag = this[at]
    if ((tag.opcode != Opcode.CONST_STRING && tag.opcode != Opcode.CONST_STRING_JUMBO) || tag.previewString() != PREVIEW_TAP_TAG) return null
    val tagged = getOrNull(at + 1) ?: return null
    val operands = tagged.invoked() ?: return null
    if (tagged.opcode != Opcode.INVOKE_VIRTUAL || tagged.previewMethod()?.toString() != SET_TAG || operands.size != 2 ||
        operands[1] != (tag as OneRegisterInstruction).registerA) return null
    val layer = operands[0]
    for (i in at + 2..minOf(at + 16, size - 1)) {
        val step = this[i]
        val field = step.previewField()
        if (step.opcode == Opcode.IPUT_OBJECT && (step as OneRegisterInstruction).registerA == layer &&
            field?.definingClass == CHAT_PREVIEW_FRAGMENT && field.type == VIEW) return i to layer
        if (step.overwrites(layer)) return null
    }
    return null
}

/**
 * Both sites, when the preview's view has exactly one of each, nothing jumps onto the stack's `new-instance` or just
 * past the layer's store, and the stack is built before the layer is stored.
 */
internal fun Method.chatPreviewSizeSite(): ChatPreviewSizeSite? {
    if (definingClass != CHAT_PREVIEW_FRAGMENT || "$name${parameterTypes.joinToString("", "(", ")")}$returnType" != PREVIEW_VIEW_CALL) return null
    val code = implementation?.instructions?.toList() ?: return null
    val stacks = code.indices.mapNotNull { at -> code.previewStackAt(at)?.let { at to it } }
    val layers = code.indices.mapNotNull { at -> code.tapLayerAt(at) }
    val (stack, sizes) = stacks.singleOrNull() ?: return null
    val (tapLayer, layer) = layers.singleOrNull() ?: return null
    val targets = jumpTargets()
    if (tapLayer <= stack || tapLayer + 1 >= code.size || stack in targets || tapLayer + 1 in targets) return null
    return ChatPreviewSizeSite(stack, sizes.first, sizes.second, sizes.third, tapLayer, layer)
}

/** The preview fragment's view builder, taken only when both sites have the tested shape. */
internal fun findChatPreviewSize(classes: Iterable<ClassDef>): List<Method> =
    classes.firstOrNull { it.type == CHAT_PREVIEW_FRAGMENT }?.methods?.filter { it.chatPreviewSizeSite() != null }.orEmpty()

private fun chatPreviewSizeChanged(method: Method): Nothing =
    throw PatchException("Messenger controls: the chat preview's layout in ${method.hookId()} no longer matches the tested build")

internal fun MutableMethod.validateChatPreviewSize() {
    chatPreviewSizeSite() ?: chatPreviewSizeChanged(this)
}

/**
 * The extension hands the tap layer a drag handler once it's stored, then picks the chat's height and the least it may
 * shrink to just before the stack takes them. The later site goes in first so the earlier index still holds.
 */
internal fun MutableMethod.injectChatPreviewSize() {
    val site = chatPreviewSizeSite() ?: chatPreviewSizeChanged(this)
    addInstructions(site.tapLayer + 1, "invoke-static/range {v${site.layer} .. v${site.layer}}, $CHAT_PREVIEW_SIZE_HOST->tapLayer(Landroid/view/View;)V")
    addInstructions(site.stack, """
        invoke-static {v${site.height}, v${site.most}}, $CHAT_PREVIEW_SIZE_HOST->height(II)I
        move-result v${site.height}
        invoke-static {v${site.least}, v${site.height}}, $CHAT_PREVIEW_SIZE_HOST->least(II)I
        move-result v${site.least}
    """.trimIndent())
}
