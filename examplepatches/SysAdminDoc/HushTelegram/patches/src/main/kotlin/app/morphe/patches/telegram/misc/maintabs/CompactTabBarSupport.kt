/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.maintabs

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.call
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefBy

internal const val BAR_PADDING = "$MAIN_TABS->barPadding(F)F"
internal const val BAR_CORNER = "$MAIN_TABS->barCorner(F)F"
internal const val BAR_HEIGHT = "$MAIN_TABS->barHeight(I)I"
internal const val BAR_MIN_WIDTH = "$MAIN_TABS->barMinWidth(F)F"
private const val DP = "Lorg/telegram/messenger/AndroidUtilities;->dp(F)I"
private const val MIN = "Ljava/lang/Math;->min(II)I"
private const val VIEW_TYPE = "Landroid/view/View;"
private const val DRAWABLE = "Landroid/graphics/drawable/Drawable;"
private const val LAYOUT_PARAMS = "Landroid/view/ViewGroup\$LayoutParams;"
private const val FRAME_PARAMS = "Landroid/widget/FrameLayout\$LayoutParams;"

/** Telegram's 12 dp around the bar's tabs, as float bits. */
internal const val STOCK_PADDING = 0x41400000
/** Telegram's 28 dp corner on the bar's glass background, as float bits. */
internal const val STOCK_CORNER = 0x41e00000
/** Telegram's 72 dp bar height. */
internal const val STOCK_HEIGHT = 72
/** Telegram's 320 dp the bar's tabs stretch to at least, as float bits. */
internal const val STOCK_MIN_WIDTH = 0x43a00000

/**
 * How far inside the bar its glass background starts, 7.666 dp as float bits. The compact bar's
 * 8 dp padding keeps the tabs within that glass only while it stays under 8 dp.
 */
private const val STOCK_INSET = 0x40f54fdf

/** Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL, where the bar sits in its wrapper. */
private const val BOTTOM_CENTER = 0x51

private val MOVE_RESULTS = setOf(Opcode.MOVE_RESULT, Opcode.MOVE_RESULT_OBJECT)

/**
 * One of the bar's sizes: the constant right before [at] in [method] puts Telegram's value in
 * [register], and [hook] goes in at [at] to answer the value the rest of the code reads.
 */
internal class BarSize(val method: MutableMethod, val at: Int, val register: Int, val hook: String)

/**
 * The bar's four sizes in the order the patch found them, or [missing], why this build's bar
 * can't take them, with no sizes.
 */
internal class CompactBar(val sizes: List<BarSize>, val missing: String?) {
    /** The same edit on copies, so a smali problem refuses before the app is touched. */
    fun rehearse() = insert { MutableMethod(ImmutableMethod.of(it)) }

    fun apply() = insert { it }

    private fun insert(edit: (MutableMethod) -> MutableMethod) {
        sizes.groupBy { it.method }.forEach { (method, own) ->
            val target = edit(method)
            // Last first, so every earlier index still names its own instruction.
            own.sortedByDescending { it.at }.forEach { size ->
                target.addInstructionsAtControlFlowLabel(size.at,
                    "invoke-static {v${size.register}}, ${size.hook}\nmove-result v${size.register}")
            }
        }
    }
}

/**
 * The bar's sizes, each a plain constant the hook can take over right after Telegram writes it.
 * The main screen pads its bar by dp(12) on every side, rounds the bar's glass background by
 * dp(28) and lays the bar out 72 dp tall at the bottom; the bar stretches its tabs to at least
 * dp(320) each time it measures, and fits them into its height less that padding, 48 dp.
 */
internal fun BytecodePatchContext.resolveCompactBar(plan: MainTabsPlan): CompactBar {
    controlHook(MAIN_TABS, "barPadding", listOf("F"), "F")
    controlHook(MAIN_TABS, "barCorner", listOf("F"), "F")
    controlHook(MAIN_TABS, "barHeight", listOf("I"), "I")
    controlHook(MAIN_TABS, "barMinWidth", listOf("F"), "F")
    fun missing(why: String) = CompactBar(emptyList(), why)

    val build = tgMutableClassDefBy(plan.screen).methods.single(::isBuild)
    val body = build.controlBody()
    val flow = ControlFlow.of(build)
    fun fromBar(use: Int, register: Int) = defined(flow, use, register)?.let { read ->
        body[read].opcode == Opcode.IGET_OBJECT && body[read].controlRef() == plan.bar
    } == true

    // The padding: every side of the bar is dp() of one constant.
    val pads = body.indices.filter { at -> body[at].calls("setPadding", listOf("I", "I", "I", "I")) && fromBar(at, body[at].namedRegisters()[0]) }
    if (pads.size != 1) return missing("the main screen no longer pads its bar in one place (${pads.size})")
    val pad = pads.single()
    val sides = body[pad].namedRegisters().drop(1).map { dpOf(body, flow, pad, it) }
    val padding = sides.map { it?.first }.distinct().singleOrNull()
        ?: return missing("the bar's four sides are no longer padded by one size")
    sizeProblem(body, flow, padding, sides.map { it!!.second }, STOCK_PADDING)?.let { return missing("the bar's padding $it") }

    // The glass background: set on the bar from a field of the main screen, rounded by dp() of one
    // constant and inset by dp() of another.
    val backs = body.indices.filter { at -> body[at].calls("setBackground", listOf(DRAWABLE)) && fromBar(at, body[at].namedRegisters()[0]) }
    if (backs.size != 1) return missing("the main screen no longer gives its bar one background (${backs.size})")
    val back = backs.single()
    val glass = defined(flow, back, body[back].namedRegisters()[1])?.let { read ->
        body[read].controlField()?.takeIf { body[read].opcode == Opcode.IGET_OBJECT && it.origDefiningClass == plan.screen }?.type
    } ?: return missing("the bar's background no longer comes from the main screen")
    fun glassCalls(parameter: String) = body.indices.filter { at ->
        body[at].opcode == Opcode.INVOKE_VIRTUAL && body[at].call()?.let { c ->
            c.origDefiningClass == glass && c.parameterTypes.map(CharSequence::toString) == listOf(parameter) && c.origReturnType == "V"
        } == true
    }
    val corners = glassCalls("F").mapNotNull { at ->
        val float = defined(flow, at, body[at].namedRegisters()[1])?.takeIf { body[it].opcode == Opcode.INT_TO_FLOAT } ?: return@mapNotNull null
        dpOf(body, flow, float, body[float].namedRegisters()[1])
    }
    if (corners.size != 1) return missing("the bar's background no longer rounds its corners by one size (${corners.size})")
    val (corner, rounded) = corners.single()
    sizeProblem(body, flow, corner, listOf(rounded), STOCK_CORNER)?.let { return missing("the bar's corner $it") }
    val insets = glassCalls("I").mapNotNull { at -> dpOf(body, flow, at, body[at].namedRegisters()[1]) }
    if (insets.size != 1 || literal(body, insets.single().first) != STOCK_INSET) {
        return missing("the bar's background no longer starts 7.67 dp inside the bar")
    }

    // The height: the bar goes into its wrapper with a frame of a width, this height and a gravity.
    val adds = body.indices.filter { at -> body[at].calls("addView", listOf(VIEW_TYPE, LAYOUT_PARAMS)) && fromBar(at, body[at].namedRegisters()[1]) }
    if (adds.size != 1) return missing("the main screen no longer lays its bar out in one place (${adds.size})")
    val add = adds.single()
    val frame = defined(flow, add, body[add].namedRegisters()[2])
        ?.takeIf { it > 0 && body[it].opcode == Opcode.MOVE_RESULT_OBJECT }?.minus(1)
        ?.takeIf { at ->
            body[at].opcode == Opcode.INVOKE_STATIC && body[at].call()?.let { c ->
                c.parameterTypes.map(CharSequence::toString) == listOf("I", "I", "I") && c.origReturnType == FRAME_PARAMS
            } == true
        } ?: return missing("the bar's layout no longer comes from a width, a height and a gravity")
    val (_, high, gravity) = body[frame].namedRegisters()
    if (constant(body, flow, frame, gravity) != BOTTOM_CENTER) return missing("the bar no longer sits at the bottom in the middle")
    val height = defined(flow, frame, high) ?: return missing("the bar's height no longer comes from one place")
    sizeProblem(body, flow, height, listOf(frame), STOCK_HEIGHT)?.let { return missing("the bar's height $it") }

    // The width: each time the bar measures, its tabs stretch to the lesser of dp() of one constant
    // and the room there is. The tabs get the bar's height less its padding.
    val measures = tgMutableClassDefBy(plan.bar.substringAfter(":")).methods.filter(::isMeasure)
    if (measures.size != 1) return missing("the bar no longer measures itself (${measures.size})")
    val measure = measures.single()
    val measured = measure.controlBody()
    val measuredFlow = ControlFlow.of(measure)
    if (listOf("getPaddingTop", "getPaddingBottom").any { side -> measured.none { it.call()?.origName == side } }) {
        return missing("the bar no longer fits its tabs inside its padding")
    }
    val widths = measured.indices.filter { measured[it].opcode == Opcode.INVOKE_STATIC && measured[it].controlRef() == MIN }
        .mapNotNull { at -> dpOf(measured, measuredFlow, at, measured[at].namedRegisters()[0]) }
    if (widths.size != 1) return missing("the bar no longer stretches its tabs to one width (${widths.size})")
    val (width, stretched) = widths.single()
    sizeProblem(measured, measuredFlow, width, listOf(stretched), STOCK_MIN_WIDTH)?.let { return missing("the bar's tab width $it") }

    return CompactBar(listOf(
        BarSize(build, padding + 1, body[padding].namedRegisters()[0], BAR_PADDING),
        BarSize(build, corner + 1, body[corner].namedRegisters()[0], BAR_CORNER),
        BarSize(build, height + 1, body[height].namedRegisters()[0], BAR_HEIGHT),
        BarSize(measure, width + 1, measured[width].namedRegisters()[0], BAR_MIN_WIDTH),
    ), null)
}

/** An instance `onMeasure(int, int)` with code. */
private fun isMeasure(m: Method) = m.origName == "onMeasure" && !AccessFlags.STATIC.isSet(m.accessFlags) && m.origReturnType == "V" &&
    m.parameterTypes.map(CharSequence::toString) == listOf("I", "I") && m.controlBody().isNotEmpty()

/** A virtual call of a void [name] taking [parameters]. */
private fun Instruction.calls(name: String, parameters: List<String>) = opcode == Opcode.INVOKE_VIRTUAL && call()?.let { c ->
    c.origName == name && c.parameterTypes.map(CharSequence::toString) == parameters && c.origReturnType == "V"
} == true

/**
 * Where [register] at [use] comes from when it's dp() of a constant: that constant's index and the
 * dp() call's, or null.
 */
private fun dpOf(body: List<Instruction>, flow: ControlFlow, use: Int, register: Int): Pair<Int, Int>? {
    val result = defined(flow, use, register) ?: return null
    if (result == 0 || body[result].opcode != Opcode.MOVE_RESULT) return null
    val call = result - 1
    if (body[call].opcode != Opcode.INVOKE_STATIC || body[call].controlRef() != DP) return null
    val size = defined(flow, call, body[call].namedRegisters().single()) ?: return null
    return if (body[size].opcode in CONSTANTS) size to call else null
}

private fun literal(body: List<Instruction>, at: Int) =
    if (body[at].opcode in CONSTANTS) (body[at] as NarrowLiteralInstruction).narrowLiteral else null

/**
 * Why the constant at [at] can't take a hook right behind it, or null when it can. It has to hold
 * [stock] in a register a call can name, run straight to [uses] with nothing jumping in on the
 * way, and lose its register to the last use's own result, so the hook's answer reaches those uses
 * and nothing else.
 */
private fun sizeProblem(body: List<Instruction>, flow: ControlFlow, at: Int, uses: List<Int>, stock: Int): String? {
    if (literal(body, at) != stock) return "is no longer Telegram's own size"
    val register = body[at].namedRegisters()[0]
    if (register > 15) return "sits in a register a call can't name"
    val last = uses.maxOrNull()
    if (last == null || uses.any { it <= at } || last + 1 >= body.size) return "is no longer used right after it's set"
    if ((at..last).any { flow.normal[it] != listOf(it + 1) }) return "no longer runs straight to where it's used"
    val entered = (at + 1..last + 1).any { into ->
        body.indices.any { from -> from != into - 1 && (into in flow.normal[from] || into in flow.exceptional[from]) }
    }
    if (entered) return "is jumped into before it's used"
    if ((at + 1..last).any { it !in uses && register in body[it].namedRegisters() }) return "is read by something else too"
    val taken = body[last + 1]
    if (taken.opcode !in MOVE_RESULTS || taken.namedRegisters() != listOf(register)) return "stays in its register after it's used"
    return null
}
