package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * The chat list's "messenger" wordmark (#129). One Litho component draws it: it picks the light or dark wordmark by the
 * color scheme, loads it once through a memo, and shows it as an image the full height of the title, start-aligned
 * (end-aligned right to left). Its width follows the drawable's own shape, so a drawable of another shape gets the room
 * it needs.
 */
internal const val HOME_HEADER = "home_header"
internal const val HOME_HEADER_CALL = "Lapp/hushmessenger/extension/HomeHeader;->dress(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;"

private const val DRAWABLE = "Landroid/graphics/drawable/Drawable;"
private const val SCALE_TYPE = "Landroid/widget/ImageView\$ScaleType;"
private const val FIT_START = "$SCALE_TYPE->FIT_START:$SCALE_TYPE"
private const val FIT_END = "$SCALE_TYPE->FIT_END:$SCALE_TYPE"
private const val MIG_COLORS = "Lcom/facebook/mig/scheme/interfaces/MigColorScheme;"
private val MEMO_TAIL = listOf("Lkotlin/jvm/functions/Function0;", "[Ljava/lang/Object;")

private fun homeHeaderChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the chat list's wordmark changed ($detail)")

private fun Instruction.headerRef() = (this as? ReferenceInstruction)?.reference?.toString()

private fun Instruction.headerCall() = (this as? ReferenceInstruction)?.reference as? MethodReference

/** Whether [at] casts the memo's answer to a Drawable: invoke-static (scope, Function0, Object[]) Object, its move-result, then the cast. */
private fun List<Instruction>.isMemoedDrawable(at: Int): Boolean {
    val cast = this[at]
    if (cast.opcode != Opcode.CHECK_CAST || cast.headerRef() != DRAWABLE) return false
    val moved = getOrNull(at - 1) ?: return false
    val memo = getOrNull(at - 2) ?: return false
    val call = memo.headerCall() ?: return false
    return moved.opcode == Opcode.MOVE_RESULT_OBJECT && (moved as OneRegisterInstruction).registerA == (cast as OneRegisterInstruction).registerA &&
        memo.opcode == Opcode.INVOKE_STATIC && call.returnType == "Ljava/lang/Object;" && call.parameterTypes.size == 3 &&
        call.parameterTypes.drop(1).map { it.toString() } == MEMO_TAIL
}

/** Where the wordmark is ready: the cast's index and the register holding the drawable. */
internal class HeaderSite(val index: Int, val drawable: Int)

/**
 * The wordmark's site in the component's render: one memoed Drawable cast, both FIT_START and FIT_END, a color scheme
 * call and a static image call that takes (Drawable, ScaleType, modifier, boolean). Null when this isn't that method.
 */
internal fun Method.homeHeaderSite(fitStart: MemberMatch = MemberMatch(FIT_START), fitEnd: MemberMatch = MemberMatch(FIT_END)): HeaderSite? {
    if (AccessFlags.STATIC.isSet(accessFlags) || parameterTypes.size != 1) return null
    val code = implementation?.instructions?.toList() ?: return null
    val refs = code.mapNotNull { (it as? ReferenceInstruction)?.reference }
    if (refs.none { fitStart.matches(it) } || refs.none { fitEnd.matches(it) }) return null
    if (code.none { it.opcode == Opcode.INVOKE_INTERFACE && it.headerRef()?.startsWith("$MIG_COLORS->") == true }) return null
    if (code.none { instruction ->
            val call = instruction.headerCall()
            instruction.opcode == Opcode.INVOKE_STATIC && call != null && call.parameterTypes.map { it.toString() }.let {
                it.size == 4 && it[0] == DRAWABLE && it[1] == SCALE_TYPE && it[3] == "Z"
            }
        }) return null
    val cast = code.indices.filter { code.isMemoedDrawable(it) }.singleOrNull() ?: return null
    return HeaderSite(cast, (code[cast] as OneRegisterInstruction).registerA)
}

/** The one method in the app with the wordmark's shape, or nothing when there are none or two. */
internal fun findHomeHeader(classes: Iterable<ClassDef>): List<Method> {
    val fitStart = MemberMatch(FIT_START)
    val fitEnd = MemberMatch(FIT_END)
    return listOfNotNull(classes.flatMap { it.methods }.filter { it.homeHeaderSite(fitStart, fitEnd) != null }.singleOrNull())
}

internal fun MutableMethod.validateHomeHeader(): HeaderSite {
    val site = homeHeaderSite() ?: homeHeaderChanged("no wordmark in ${hookId()}")
    // A branch onto the instruction after the cast would skip the call.
    if (site.index + 1 in jumpTargets()) homeHeaderChanged("a jump lands after the cast in ${hookId()}")
    return site
}

/**
 * Right after the cast, the extension swaps the wordmark for your words or picture, or hands it back as it was. Off,
 * Pause, safe mode and blank text keep Messenger's wordmark.
 */
internal fun MutableMethod.injectHomeHeader() {
    val site = validateHomeHeader()
    addInstructions(site.index + 1, """
        invoke-static/range {v${site.drawable} .. v${site.drawable}}, $HOME_HEADER_CALL
        move-result-object v${site.drawable}
    """.trimIndent())
}
