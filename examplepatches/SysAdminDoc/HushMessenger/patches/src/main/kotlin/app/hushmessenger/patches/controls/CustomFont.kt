package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val CUSTOM_FONT = "custom_font"
internal const val FONT_LAYOUT = "font_layout"
internal const val FONT_REPOSITORY = "font_repository"
internal const val FONT_ROBOTO = "font_roboto"
internal const val FONT_BY_NAME = "font_by_name"
internal const val FONT_INPUT = "font_input"
internal val CUSTOM_FONT_HOOKS = listOf(FONT_LAYOUT, FONT_REPOSITORY, FONT_ROBOTO, FONT_BY_NAME, FONT_INPUT)

/** Litho's text layout builder logs this when a phone's font breaks Paint.setTypeface. Only its setTypeface does. */
internal const val FONT_LAYOUT_ANCHOR = "Hit OEM font NPE in Paint.setTypeface, keeping previous typeface"
/** Messenger's typeface repository throws this for a family with no file, asset or system font behind it. */
internal const val FONT_REPOSITORY_ANCHOR = "The requested font, %s, does not have a backing source. " +
    "You need to provide either a systemFontName, assetFontName, or a fileDescriptor."
/** Messenger's Roboto builder logs this when it has no typeface for the weight it was asked for. */
internal const val FONT_ROBOTO_ANCHOR = "Unable to create roboto typeface: %s"

private const val TYPEFACE = "Landroid/graphics/Typeface;"
private const val CONTEXT = "Landroid/content/Context;"
private const val TEXT_VIEW = "Landroid/widget/TextView;"
private const val COLORS = "Landroid/content/res/ColorStateList;"
/** Long and double, the parameter types that take two registers. */
private val WIDE_TYPES = setOf("J", "D")
private const val ENUM_NAME = "Ljava/lang/Enum;->name()Ljava/lang/String;"
private const val CREATE_BY_NAME = "$TYPEFACE->create(Ljava/lang/String;I)$TYPEFACE"
private const val CREATE_STYLED = "$TYPEFACE->create(${TYPEFACE}I)$TYPEFACE"
internal const val INPUT_SET_TYPEFACE = "$TEXT_VIEW->setTypeface(${TYPEFACE}I)V"
internal const val FONT_LAYOUT_CALL = "$SETTINGS->customFontLayout($TYPEFACE)$TYPEFACE"
internal const val FONT_REPOSITORY_CALL = "$SETTINGS->customFontRepository(${TYPEFACE}Ljava/lang/Object;I)$TYPEFACE"
internal const val FONT_ROBOTO_CALL = "$SETTINGS->customFontRoboto($TYPEFACE)$TYPEFACE"
internal const val FONT_BY_NAME_CALL = "$SETTINGS->customFontByName(${TYPEFACE}Ljava/lang/String;)$TYPEFACE"
internal const val FONT_INPUT_CALL = "$SETTINGS->customFontInput($TEXT_VIEW${TYPEFACE}I)V"

private fun fontChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: Messenger's fonts moved ($detail)")

private fun Method.fontCode() = implementation?.instructions?.toList().orEmpty()
private fun Instruction.fontCall() = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Instruction.fontString() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
private fun Method.fontParameters() = parameterTypes.map { it.toString() }
private fun Method.holds(anchor: String) = fontCode().any { it.fontString() == anchor }

/** Whether anything in the method writes [register], so it no longer holds its parameter at the return. */
private fun Method.writes(register: Int) = fontCode().any { it.writesRegister(register) }

private fun Instruction.writesRegister(register: Int): Boolean {
    val written = (this as? OneRegisterInstruction)?.registerA
    return opcode.setsRegister() && written != null && (written == register || (opcode.setsWideRegister() && written + 1 == register))
}

private val FONT_GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)
private val FONT_EXITS = setOf(Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT, Opcode.RETURN_VOID, Opcode.THROW)

/** Where control goes from each instruction: on, and to a branch's target. Exception handlers are left out. */
private fun List<Instruction>.flow(): List<List<Int>> {
    val addresses = IntArray(size + 1)
    for (i in indices) addresses[i + 1] = addresses[i] + this[i].codeUnits
    val indexAt = indices.associateBy { addresses[it] }
    return indices.map { i ->
        val insn = this[i]
        val next = (i + 1).takeIf { it < size }
        val target = (insn as? OffsetInstruction)?.let { indexAt[addresses[i] + it.codeOffset] }
        when (insn.opcode) {
            // A switch could go anywhere, as far as this walk knows.
            Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH -> indices.toList()
            // Its offset points at the array's data, which never runs.
            Opcode.FILL_ARRAY_DATA -> listOfNotNull(next)
            in FONT_GOTOS -> listOfNotNull(target)
            in FONT_EXITS -> emptyList()
            else -> listOfNotNull(next, target)
        }
    }
}

/** Every instruction control can reach from [from], [from] included. */
private fun List<List<Int>>.reach(from: Int): Set<Int> {
    val seen = mutableSetOf(from)
    val todo = ArrayDeque(listOf(from))
    while (todo.isNotEmpty()) for (next in this[todo.removeFirst()]) if (seen.add(next)) todo.add(next)
    return seen
}

private const val MONOSPACE = "$TYPEFACE->MONOSPACE:$TYPEFACE"
private const val CREATE_WEIGHTED = "$TYPEFACE->create(${TYPEFACE}IZ)$TYPEFACE"

/**
 * 587's armv7 build moves the fallback's weighted monospace into a static (weight, italic) helper with its own return.
 * Their ids, set by [findCustomFont] before anything asks [fontRepositorySite].
 */
internal var monospaceMakers: Set<String> = emptySet()

/** A static (weight, italic) helper whose only typeface is the phone's monospace, at most given a weight or a style. */
internal fun Method.isMonospaceMaker(): Boolean {
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != TYPEFACE || fontParameters() != listOf("I", "Z")) return false
    val code = fontCode()
    val typefaces = code.filter { it.opcode == Opcode.SGET_OBJECT && (it as ReferenceInstruction).reference.toString().endsWith(":$TYPEFACE") }
    return typefaces.isNotEmpty() && typefaces.all { (it as ReferenceInstruction).reference.toString() == MONOSPACE } &&
        code.mapNotNull { it.fontCall() }.all { it.toString() == CREATE_WEIGHTED || it.toString() == CREATE_STYLED || it.returnType == "V" }
}

/**
 * 587's way out for a mono family whose file isn't there yet: the phone's monospace typeface, at most given the weight,
 * returned before the cache. What only that return follows reads Typeface.MONOSPACE or asks a [monospaceMakers] helper,
 * and calls nothing that makes another typeface, so the switch has nothing to swap there.
 */
private fun List<Instruction>.monospaceFallback(flow: List<List<Int>>, exit: Int, main: Int): Boolean {
    val own = indices.filter { i -> flow.reach(i).let { exit in it && main !in it } }
    val calls = own.mapNotNull { this[it].fontCall() }
    val monospace = calls.any { it.toString() in monospaceMakers } ||
        own.any { this[it].opcode == Opcode.SGET_OBJECT && (this[it] as ReferenceInstruction).reference.toString() == MONOSPACE }
    return monospace && calls.all { it.toString() == CREATE_WEIGHTED || it.toString() in monospaceMakers || it.returnType == "V" }
}

/** TextLayoutBuilder.setTypeface, where every Litho text component's typeface goes before it's laid out. */
internal fun Method.isFontLayout() = !AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" &&
    fontParameters() == listOf(TYPEFACE) && holds(FONT_LAYOUT_ANCHOR)

/**
 * The repository's resolver: a family constant, the repository and a weight, answered from its cache, a file or an asset.
 * The third parameter takes one register, so the family and weight sit where the site and the call expect them.
 */
internal fun Method.isFontRepository() = AccessFlags.STATIC.isSet(accessFlags) && returnType == TYPEFACE &&
    fontParameters().let { it.size == 4 && it[0].startsWith("L") && it[1] == definingClass && it[2] !in WIDE_TYPES && it[3] == "I" } &&
    fontCode().any { it.fontCall()?.toString() == ENUM_NAME } && holds(FONT_REPOSITORY_ANCHOR)

/** The Roboto builder: the phone's sans-serif at the weight a text style names. */
internal fun Method.isFontRoboto() = AccessFlags.STATIC.isSet(accessFlags) && returnType == TYPEFACE &&
    fontParameters() == listOf(CONTEXT, "Ljava/lang/Integer;") && holds(FONT_ROBOTO_ANCHOR)

/**
 * Family B's copies of the builder for one weight each (Regular, Bold): an instance (Context)Typeface method that still
 * logs under [builder]'s class, with one return.
 */
internal fun Method.isFontRobotoCopy(builder: String) = !AccessFlags.STATIC.isSet(accessFlags) && returnType == TYPEFACE &&
    fontParameters() == listOf(CONTEXT) && holds(FONT_ROBOTO_ANCHOR) && definingClass != builder &&
    fontCode().any { it.opcode == Opcode.CONST_CLASS && ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type == builder }

/** The builder, then any copies of it. Nothing when another method holds the string. */
private fun robotoBuilders(holders: Set<Method>): List<Method> {
    val builder = holders.singleOrNull { it.isFontRoboto() } ?: return emptyList()
    val copies = holders.filter { it !== builder }
    return if (copies.all { it.isFontRobotoCopy(builder.definingClass) }) listOf(builder) + copies else emptyList()
}

/** A copy validates against the profile's own builder, the one static (Context, Integer) entry. */
private fun Method.copiesProfiledRoboto() = activeProfile.hooks.getValue(FONT_ROBOTO)
    .filter { it.endsWith("(${CONTEXT}Ljava/lang/Integer;)$TYPEFACE") }.any { isFontRobotoCopy(it.substringBefore("->")) }

/** MIG's typeface by name: a repository family by its constant's name, else Android's family of that name. */
internal fun Method.isFontByName() = AccessFlags.STATIC.isSet(accessFlags) && returnType == TYPEFACE &&
    fontParameters() == listOf(CONTEXT, "Ljava/lang/String;", "I") && fontCode().mapNotNull { it.fontCall()?.toString() }
        .let { CREATE_BY_NAME in it && CREATE_STYLED in it }

/** Whether the method asks [repository]'s class for a family's typeface, which ties a by-name lookup to the resolver. */
private fun Method.asksRepository(repository: Method) = fontCode().any { insn ->
    insn.fontCall()?.let { it.definingClass == repository.definingClass && it.returnType == TYPEFACE &&
        it.parameterTypes.map { type -> type.toString() } == listOf(repository.parameterTypes.first().toString()) } == true
}

/** A Litho text input's setter, which hands its EditText the component's typeface and style. */
internal fun Method.isFontInput() = AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" &&
    fontParameters().let { it.take(3) == listOf(COLORS, COLORS, TYPEFACE) && "Landroid/widget/EditText;" in it } &&
    fontCode().any { it.fontCall()?.toString() == INPUT_SET_TYPEFACE }

/**
 * Each font hook by its kind. The layout, the repository and the Roboto builder count only as the one holder of their
 * string, and the by-name lookup only while it asks that repository.
 */
internal fun findCustomFont(classes: Iterable<ClassDef>): Map<String, List<Method>> {
    val holders = listOf(FONT_LAYOUT_ANCHOR, FONT_REPOSITORY_ANCHOR, FONT_ROBOTO_ANCHOR).associateWith { linkedSetOf<Method>() }
    val byName = mutableListOf<Method>()
    val inputs = mutableListOf<Method>()
    val makers = mutableSetOf<String>()
    for (method in classes.flatMap { it.methods }) {
        val code = method.implementation?.instructions ?: continue
        for (insn in code) insn.fontString()?.let { holders[it]?.add(method) }
        if (method.isFontByName()) byName.add(method)
        if (method.isFontInput()) inputs.add(method)
        if (method.isMonospaceMaker()) makers.add(method.hookId())
    }
    monospaceMakers = makers
    fun only(anchor: String, shape: Method.() -> Boolean) = holders.getValue(anchor).singleOrNull()?.takeIf { it.shape() }
    val repository = only(FONT_REPOSITORY_ANCHOR) { isFontRepository() }
    return mapOf(
        FONT_LAYOUT to listOfNotNull(only(FONT_LAYOUT_ANCHOR) { isFontLayout() }),
        FONT_REPOSITORY to listOfNotNull(repository),
        FONT_ROBOTO to robotoBuilders(holders.getValue(FONT_ROBOTO_ANCHOR)),
        FONT_BY_NAME to repository?.let { found -> byName.filter { it.asksRepository(found) } }.orEmpty(),
        FONT_INPUT to inputs,
    )
}

/** Index of the getter's one return, which becomes the extension's call. */
private fun Method.fontReturn(what: String): Int {
    val code = fontCode()
    val returns = code.indices.filter { code[it].opcode == Opcode.RETURN_OBJECT }
    return returns.singleOrNull() ?: fontChanged("${returns.size} returns in the $what")
}

/**
 * The layout's first instruction, where its typeface parameter is swapped before anything reads it:
 *
 *     invoke-static {p1}, Settings->customFontLayout(Typeface)Typeface   <- added
 *     move-result-object p1                                               <- added
 *     iget-object v1, p0, <builder>->layout                               <- returned
 */
internal fun Method.fontLayoutSite(): Int {
    if (!isFontLayout()) fontChanged("text layout typeface")
    if (implementation!!.registerCount - 1 > 15) fontChanged("text layout register out of range")
    if (0 in jumpTargets()) fontChanged("a branch lands on the text layout's start")
    return 0
}

/**
 * The resolver's return, which hands its typeface, the family constant and the weight asked for to the extension:
 *
 *     check-cast vResult, Landroid/graphics/Typeface;
 *     return-object vResult                <- returned
 *
 * From 587 the resolver can also return the phone's monospace typeface early. That return stays as it is, since the
 * switch passes monospace through anyway.
 */
internal fun Method.fontRepositorySite(): Int {
    if (!isFontRepository()) fontChanged("typeface repository")
    val code = fontCode()
    val returns = code.indices.filter { code[it].opcode == Opcode.RETURN_OBJECT }
    // 587 adds the monospace fallback's return before the cache's, which still hands back the typeface it cast.
    val at = returns.singleOrNull() ?: returns.singleOrNull { r ->
        val cast = code.getOrNull(r - 1)
        cast?.opcode == Opcode.CHECK_CAST && (cast as OneRegisterInstruction).registerA == (code[r] as OneRegisterInstruction).registerA &&
            ((cast as ReferenceInstruction).reference as? TypeReference)?.type == TYPEFACE
    } ?: fontChanged("${returns.size} returns in the typeface repository")
    val flow = code.flow()
    if ((returns - at).any { !code.monospaceFallback(flow, it, at) }) fontChanged("a typeface repository return that isn't the monospace fallback")
    val result = (code[at] as OneRegisterInstruction).registerA
    val family = implementation!!.registerCount - 4
    val weight = implementation!!.registerCount - 1
    // Only a write on the way to the hooked return matters. 587's fallback sets the weight on its own way out.
    if (code.indices.any { i -> (code[i].writesRegister(family) || code[i].writesRegister(weight)) && at in flow.reach(i) }) {
        fontChanged("repository parameter reused")
    }
    if (result > 15 || weight > 15) fontChanged("repository registers out of range")
    return at
}

/** The Roboto builder's one return, a branch target, so the return itself becomes the call. A copy's return too. */
internal fun Method.fontRobotoSite(): Int {
    if (!isFontRoboto() && !copiesProfiledRoboto()) fontChanged("Roboto builder")
    return fontReturn("Roboto builder")
}

/** The by-name lookup's one return, which hands its typeface and the family name asked for to the extension. */
internal fun Method.fontByNameSite(): Int {
    if (!isFontByName()) fontChanged("typeface by name")
    val at = fontReturn("typeface by name")
    val result = (fontCode()[at] as OneRegisterInstruction).registerA
    val name = implementation!!.registerCount - 2
    if (writes(name)) fontChanged("family name register reused")
    if (result > 15 || name > 15) fontChanged("typeface by name registers out of range")
    return at
}

/**
 * The input's one typeface call, which goes to the extension with the same registers:
 *
 *     invoke-virtual {vInput, vTypeface, vStyle}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
 */
internal fun Method.fontInputSite(): Int {
    if (!isFontInput()) fontChanged("text input typeface")
    val code = fontCode()
    val calls = code.indices.filter { code[it].fontCall()?.toString() == INPUT_SET_TYPEFACE }
    val at = calls.singleOrNull() ?: fontChanged("${calls.size} text input typefaces")
    if (code[at].opcode != Opcode.INVOKE_VIRTUAL || (code[at] as FiveRegisterInstruction).registerCount != 3) fontChanged("text input typeface call")
    return at
}

internal fun Method.validateCustomFont(hook: String): Int = when (hook) {
    FONT_LAYOUT -> fontLayoutSite()
    FONT_REPOSITORY -> fontRepositorySite()
    FONT_ROBOTO -> fontRobotoSite()
    FONT_BY_NAME -> fontByNameSite()
    FONT_INPUT -> fontInputSite()
    else -> throw PatchException("Messenger controls: unexpected font hook $hook in ${hookId()}")
}

/**
 * Hands each typeface Messenger draws its own text in to the extension. With the switch on it swaps Messenger's
 * Optimistic fonts for the phone's font or a picked file, and the phone's sans-serif for a picked file. Emoji, the
 * monospace family and any other font pass through. A return can be a branch target, so the return itself becomes the
 * call, and the input's call keeps its place.
 */
internal fun MutableMethod.injectCustomFont(hook: String) {
    val at = validateCustomFont(hook)
    when (hook) {
        FONT_LAYOUT -> addInstructions(0, "invoke-static {p1}, $FONT_LAYOUT_CALL\nmove-result-object p1")
        FONT_INPUT -> {
            val call = getInstruction(at) as FiveRegisterInstruction
            replaceInstruction(at, "invoke-static {v${call.registerC}, v${call.registerD}, v${call.registerE}}, $FONT_INPUT_CALL")
        }
        else -> {
            val result = (getInstruction(at) as OneRegisterInstruction).registerA
            replaceInstruction(at, when (hook) {
                FONT_REPOSITORY -> "invoke-static {v$result, p0, p3}, $FONT_REPOSITORY_CALL"
                FONT_BY_NAME -> "invoke-static {v$result, p1}, $FONT_BY_NAME_CALL"
                else -> "invoke-static/range {v$result .. v$result}, $FONT_ROBOTO_CALL"
            })
            addInstructions(at + 1, "move-result-object v$result\nreturn-object v$result")
        }
    }
}
