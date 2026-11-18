/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.maintabs

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
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
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

internal const val BAR_GLASS = "$MAIN_TABS->barGlass(Ljava/lang/Object;)V"
internal const val BAR_OUTLINE_COLOR = "$MAIN_TABS->barOutlineColor(Ljava/lang/Object;I)I"
internal const val BAR_OUTLINE_WIDTH = "$MAIN_TABS->barOutlineWidth(Ljava/lang/Object;F)F"
private const val DRAWABLE = "Landroid/graphics/drawable/Drawable;"

/** The glass rim's constructor: top width and color, bottom width and color, outline width and color, then two more. */
private val RIM_PARAMETERS = listOf("F", "I", "F", "I", "F", "I", "F", "I")

/**
 * The bar's outline, or [missing], why this build can't have it. [factory] is the static call in
 * [build] that makes the bar glass's colors, and [color] and [width] are those colors' own outline
 * answers, Telegram's plain zero. [overrides] are the same two answers in the colors' subclasses,
 * each with the runtime method it hands its own answer to.
 */
internal class BarOutline(
    val build: MutableMethod?, val factory: String, val at: Int,
    val color: MutableMethod?, val width: MutableMethod?, val missing: String?,
    val overrides: List<Pair<MutableMethod, String>> = emptyList(),
) {
    /** The same edit on copies, so a smali problem refuses before the app is touched. */
    fun rehearse() {
        if (build != null) insert { MutableMethod(ImmutableMethod.of(it)) }
    }

    fun apply() {
        if (build != null) insert { it }
    }

    private fun insert(edit: (MutableMethod) -> MutableMethod) {
        // Found again here: the compact bar's sizes go into the same build first and move its indices.
        val target = edit(build!!)
        val body = target.controlBody()
        val made = body.indices.single { body[it].opcode == Opcode.INVOKE_STATIC && body[it].controlRef() == factory }
        val colors = body[made + 1].namedRegisters().single()
        target.addInstructionsAtControlFlowLabel(made + 2, "invoke-static/range {v$colors .. v$colors}, $BAR_GLASS")
        // Before each answer's return: the zero Telegram put there goes to the extension and comes back.
        edit(color!!).addInstructionsAtControlFlowLabel(1, "invoke-static {p0, v0}, $BAR_OUTLINE_COLOR\nmove-result v0")
        edit(width!!).addInstructionsAtControlFlowLabel(1, "invoke-static {p0, v0}, $BAR_OUTLINE_WIDTH\nmove-result v0")
        // A subclass's own answer goes the same way at each of its returns, so a hook in the colors'
        // class never runs without one in the code that replaces it.
        for ((answer, runtime) in overrides) {
            val method = edit(answer)
            val body = method.controlBody()
            for (at in body.indices.reversed().filter { body[it].opcode == Opcode.RETURN }) {
                val value = body[at].namedRegisters().single()
                method.addInstructionsAtControlFlowLabel(at, "invoke-static {p0, v$value}, $runtime\nmove-result v$value")
            }
        }
    }
}

/**
 * Telegram's glass draws an even outline when its colors give it a color and a width; the main
 * screen's bar gets colors that give neither. The main screen makes those colors with one static
 * call and hands them straight to the call that makes the bar's glass. The colors' type answers
 * both outline questions with a plain zero. The glass reads them into two fields, which its rim
 * then takes as the outline's width and color. Register the bar's colors right after they're made,
 * and let each answer ask the extension, which says no for every other glass.
 */
internal fun BytecodePatchContext.resolveBarOutline(plan: MainTabsPlan): BarOutline {
    controlHook(MAIN_TABS, "barGlass", listOf("Ljava/lang/Object;"), "V")
    controlHook(MAIN_TABS, "barOutlineColor", listOf("Ljava/lang/Object;", "I"), "I")
    controlHook(MAIN_TABS, "barOutlineWidth", listOf("Ljava/lang/Object;", "F"), "F")
    fun missing(why: String) = BarOutline(null, "", 0, null, null, why)

    val build = tgMutableClassDefBy(plan.screen).methods.single(::isBuild)
    val body = build.controlBody()
    val flow = ControlFlow.of(build)

    // The bar's glass: a field of the main screen, set once from the call that makes it.
    val backs = body.indices.filter { at ->
        body[at].calls("setBackground", listOf(DRAWABLE)) && defined(flow, at, body[at].namedRegisters()[0])?.let { read ->
            body[read].opcode == Opcode.IGET_OBJECT && body[read].controlRef() == plan.bar
        } == true
    }
    if (backs.size != 1) return missing("the main screen no longer gives its bar one background (${backs.size})")
    val back = backs.single()
    val glassRead = defined(flow, back, body[back].namedRegisters()[1])
        ?.takeIf { body[it].opcode == Opcode.IGET_OBJECT && body[it].controlField()?.origDefiningClass == plan.screen }
        ?: return missing("the bar's background no longer comes from the main screen")
    val glassField = body[glassRead].controlRef()
    val stores = body.indices.filter { body[it].opcode == Opcode.IPUT_OBJECT && body[it].controlRef() == glassField }
    if (stores.size != 1) return missing("the main screen no longer makes its bar's glass in one place (${stores.size})")
    val store = stores.single()
    val maker = defined(flow, store, body[store].namedRegisters()[0])
        ?.takeIf { it > 0 && body[it].opcode == Opcode.MOVE_RESULT_OBJECT }?.minus(1)
        ?.takeIf { body[it].call() != null }
        ?: return missing("the bar's glass no longer comes straight from one call")

    // The glass's colors: the one thing handed to that call that a static call made right before.
    val made = body[maker].namedRegisters().mapNotNull { register ->
        defined(flow, maker, register)?.takeIf { it > 0 && body[it].opcode == Opcode.MOVE_RESULT_OBJECT }?.minus(1)
            ?.takeIf { body[it].opcode == Opcode.INVOKE_STATIC && body[it].call()?.returnType?.startsWith("L") == true }
    }.distinct()
    if (made.size != 1) return missing("the bar's glass no longer takes colors made just for it (${made.size})")
    val factory = made.single()
    val factoryRef = body[factory].controlRef()!!
    if (body.indices.count { body[it].opcode == Opcode.INVOKE_STATIC && body[it].controlRef() == factoryRef } != 1) {
        return missing("the main screen makes the bar's colors more than once")
    }
    val colorsType = body[factory].call()!!.returnType

    // The glass reads each outline answer into a field of its own, and its rim takes those two.
    val glassType = (body[glassRead].controlField() ?: return missing("the bar's glass field can't be read")).type
    val glass = tgClassDefByOrNull(glassType) ?: return missing("the bar's glass class is missing")
    val answers = HashMap<String, Pair<String, String>>()
    for (m in glass.methods) {
        if (AccessFlags.STATIC.isSet(m.accessFlags)) continue
        val instructions = m.controlBody()
        for (at in 0 until instructions.size - 2) {
            val asked = instructions[at].call() ?: continue
            if (instructions[at].opcode != Opcode.INVOKE_INTERFACE || asked.parameterTypes.isNotEmpty()) continue
            val kind = asked.returnType.toString()
            if (kind != "I" && kind != "F") continue
            val result = instructions[at + 1]
            val kept = instructions[at + 2]
            if (result.opcode != Opcode.MOVE_RESULT || kept.opcode != Opcode.IPUT || kept.namedRegisters()[0] != result.namedRegisters()[0]) continue
            val field = kept.controlRef() ?: continue
            answers[field] = asked.name to kind
        }
    }
    val rims = glass.methods.flatMap { m ->
        val instructions = m.controlBody()
        val rimFlow by lazy { ControlFlow.of(m) }
        instructions.indices.filter { at ->
            instructions[at].opcode in setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE) && instructions[at].call()?.let { c ->
                c.origName == "<init>" && c.parameterTypes.map(CharSequence::toString) == RIM_PARAMETERS
            } == true
        }.map { at ->
            val arguments = instructions[at].namedRegisters().drop(1)
            listOf(4, 5).map { index ->
                defined(rimFlow, at, arguments[index])?.takeIf { instructions[it].opcode == Opcode.IGET }?.let { instructions[it].controlRef() }
            }
        }
    }.distinct()
    if (rims.size != 1 || rims.single().any { it == null }) {
        return missing("the bar's glass no longer draws its outline from two fields (${rims.size})")
    }
    val (widthField, colorField) = rims.single()
    val widthAnswer = answers[widthField]?.takeIf { it.second == "F" }
    val colorAnswer = answers[colorField]?.takeIf { it.second == "I" }
    if (widthAnswer == null || colorAnswer == null) return missing("the bar's glass no longer asks its colors for an outline")

    // The colors' own answers, each Telegram's plain zero.
    if (tgClassDefByOrNull(colorsType) == null) return missing("the bar's colors class is missing")
    val colors = tgMutableClassDefBy(colorsType)
    fun answer(name: String, returns: String) = colors.methods.singleOrNull { m ->
        m.name == name && m.parameterTypes.isEmpty() && m.returnType == returns && !AccessFlags.STATIC.isSet(m.accessFlags)
    }?.takeIf(::isZero)
    val color = answer(colorAnswer.first, "I") ?: return missing("the bar's colors no longer leave the outline color at zero")
    val width = answer(widthAnswer.first, "F") ?: return missing("the bar's colors no longer leave the outline width at zero")

    // Subclasses of the colors, such as a theme's, answer the same two questions with code of their own.
    val overrides = ArrayList<Pair<MutableMethod, String>>()
    val seen = hashSetOf(colorsType)
    var parents = setOf(colorsType)
    while (parents.isNotEmpty()) {
        // A subclass's constructor calls its parent's, so it names the parent.
        val children = parents.flatMap { parent ->
            classDefsMentioning(Mention.type(parent)).filter { it.superclass == parent && seen.add(it.type) }.map { it.type }
        }.toSet()
        for (child in children) {
            for (m in tgMutableClassDefBy(child).methods) {
                if (m.parameterTypes.isNotEmpty() || AccessFlags.STATIC.isSet(m.accessFlags) || AccessFlags.PRIVATE.isSet(m.accessFlags)) continue
                val runtime = when {
                    m.name == color.name && m.returnType == "I" -> BAR_OUTLINE_COLOR
                    m.name == width.name && m.returnType == "F" -> BAR_OUTLINE_WIDTH
                    else -> continue
                }
                if (m.implementation == null) continue
                if (!answersInPlace(m)) return missing("a subclass of the bar's colors answers the outline in a way the hook can't follow")
                overrides += m to runtime
            }
        }
        parents = children
    }
    return BarOutline(build, factoryRef, factory + 2, color, width, null, overrides)
}

/**
 * Whether [m], an instance method with no parameters, can hand each answer to the runtime where it
 * returns it: it returns at least once, never writes `this`, and both registers fit a plain call.
 */
private fun answersInPlace(m: Method): Boolean {
    val body = m.controlBody()
    val self = (m.implementation ?: return false).registerCount - 1
    val returns = body.filter { it.opcode == Opcode.RETURN }
    if (self > 15 || returns.isEmpty() || returns.any { it.namedRegisters().single() > 15 }) return false
    return body.none { instruction ->
        val destination = instruction.namedRegisters().firstOrNull()
        instruction.opcode.setsRegister() && (destination == self || instruction.opcode.setsWideRegister() && destination?.plus(1) == self)
    }
}

/** A method whose whole body is `const/4 v0, 0x0` then `return v0`, two registers, `this` the second. */
private fun isZero(m: Method): Boolean {
    val instructions = m.controlBody()
    val implementation = m.implementation ?: return false
    return implementation.registerCount == 2 && instructions.size == 2 &&
        instructions[0].opcode == Opcode.CONST_4 && (instructions[0] as NarrowLiteralInstruction).narrowLiteral == 0 &&
        instructions[0].namedRegisters() == listOf(0) &&
        instructions[1].opcode == Opcode.RETURN && instructions[1].namedRegisters() == listOf(0)
}
