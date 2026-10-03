/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.font

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.parameterRegister
import app.morphe.patches.facebook.misc.extension.requireFreeAt
import app.morphe.patches.facebook.misc.extension.requireLocals
import app.morphe.patches.facebook.misc.extension.requireParameterIntact
import app.morphe.patches.facebook.misc.extension.requireThisIntact
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.findMutableMethodOf
import app.morphe.util.superclassChain
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "Use the system font"
internal const val OWN_FONT = "$EXTENSION_PACKAGE/font/OwnFont;"
internal const val REPLACE = "$OWN_FONT->replace($TYPEFACE${ENUM}I)$TYPEFACE"
internal const val REMEMBER_VARIATION = "$OWN_FONT->rememberVariation(Ljava/lang/Object;$STRING)V"
internal const val REPLACE_BUILT = "$OWN_FONT->replaceBuilt(${TYPEFACE}Ljava/lang/Object;)$TYPEFACE"
internal const val REPLACE_REACT_NATIVE = "$OWN_FONT->replaceReactNative($TYPEFACE$STRING)$TYPEFACE"
internal const val REPLACE_PHONE_FONT = "$OWN_FONT->replacePhoneFont($TYPEFACE)$TYPEFACE"
internal const val OWN_DEFAULT_FROM_STYLE = "$OWN_FONT->defaultFromStyle(I)$TYPEFACE"
internal const val OWN_TEXT_VIEW = "$OWN_FONT->textView($TEXT_VIEW)V"
internal const val OWN_INFLATED = "$OWN_FONT->inflated($VIEW)V"

/**
 * Facebook draws its interface in Meta's Optimistic family, handed out by one typeface
 * repository. Every Typeface its resolver answers goes through the extension, which swaps Meta's
 * families for the chosen font, the phone's own or a picked file, at the same weight and slant
 * while the switch is on. Bloks text with variable-font settings builds its typeface itself,
 * through the builders Meta's factory makes, so those get the same treatment at their exit, with
 * the variation string each was given remembered for the weight. React Native screens ask React
 * Native's font manager for a family by name, so its resolver's answer goes through the extension
 * too, with the name it was asked for. Text that asks for none of Meta's fonts gets a Roboto from
 * Facebook's own builder, which is how posts, comments and menus get the phone's font on accounts
 * without Optimistic, and its answer goes through the extension so a picked file reaches them too.
 * So do Facebook's own reads of Android's default typefaces, where the names bolded in a post's
 * header or a notification get theirs, and each of Android's text views Facebook builds, which
 * take their typeface from a layout or never set one.
 */
@Suppress("unused")
val useSystemFontPatch = bytecodePatch(
    name = "Use the system font",
    description = "Draws Facebook's own text in your phone's font instead of Meta's Optimistic typeface, or in a " +
        "TrueType or OpenType file you pick in Hushfacebook's settings. Icons and emoji keep their fonts, and so " +
        "does the text you put on a story. Restart Facebook after changing the font.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        hookTypefaceRepository()
        hookVariableFontBuilders()
        hookReactNativeFonts()
        hookRobotoBuilder()
        hookDefaultTypefaces()
        hookTextViews()
        enableStatus("systemFont")
    }
}

/**
 * Facebook's own reads of Android's default typefaces: Typeface.DEFAULT, DEFAULT_BOLD and
 * SANS_SERIF, defaultFromStyle, and Typeface.create by family name, or from a typeface at a style
 * or a weight. That's where the spans that bold a name in a post's header or a notification get
 * the phone's bold, where "sans-serif-medium" names are drawn, and where plenty of other text gets
 * the phone's font without asking the text engine. Each read of a field becomes a call of the
 * extension's getter for it, with the answer moved into the read's register, and each call goes
 * to the extension's method of the same name, which makes the framework's call itself. They answer
 * a picked font file at the same weight and slant where the answer is the phone's sans-serif, and
 * the framework's typeface otherwise. A field read only compared with another typeface stays. The
 * call takes the read's place, so a jump to the read or a try block's edge on it stays where it
 * was, and the move after it goes in front of whatever followed the read, so a jump there still
 * skips it. The extension's own classes are left alone, since they read the defaults themselves.
 * Answers how many reads it sent.
 */
internal fun BytecodePatchContext.hookDefaultTypefaces(): Int {
    val owners = mutableSetOf<String>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_CLASSES)) return@classDefForEach
        if (classDef.methods.any { method -> method.implementation?.instructions?.any { defaultRead(it) != null } == true }) {
            owners += classDef.type
        }
    }
    val isEquality = equalityChecks()
    val sent = owners.sumOf { type -> mutableClassDefByOrNull(type)?.methods?.sumOf { it.sendDefaultReads(isEquality) } ?: 0 }
    if (sent == 0) throw PatchException("$PATCH: found no read of Android's default typefaces outside the extension")
    return sent
}

/**
 * Whether a static call on two objects answering a boolean only compares them
 * ([isEqualityCheck]), from the called method's own code, looked up once a call. Java's
 * Objects.equals is one, and a method this build doesn't hold isn't.
 */
internal fun BytecodePatchContext.equalityChecks(): (MethodReference) -> Boolean {
    val known = HashMap<String, Boolean>()
    return { call ->
        known.getOrPut(call.toString()) {
            call.toString() == OBJECTS_EQUALS || classDefByOrNull(call.definingClass)?.methods?.singleOrNull { method ->
                method.name == call.name && method.returnType == call.returnType &&
                    method.parameterTypes.map(CharSequence::toString) == call.parameterTypes.map(CharSequence::toString)
            }?.let(::isEqualityCheck) == true
        }
    }
}

/**
 * Sends each read of Android's default typefaces in this method to the extension, last first.
 * Answers how many. A field read whose value is only ever compared with another typeface stays
 * Android's ([onlyCompared], with [isEquality] for the static calls), so the comparison still asks
 * whether that typeface is the phone's default, which is what Facebook means by it.
 */
internal fun MutableMethod.sendDefaultReads(isEquality: (MethodReference) -> Boolean): Int {
    val sites = (implementation ?: return 0).instructions.withIndex()
        .mapNotNull { (index, instruction) -> defaultRead(instruction)?.let { Triple(index, instruction, it) } }
        .filterNot { (index, _, read) -> read in DEFAULT_TYPEFACES && onlyCompared(index, isEquality) }
    sites.asReversed().forEach { (index, instruction, read) ->
        if (read in DEFAULT_CALLS) {
            val arguments = when (instruction) {
                is RegisterRangeInstruction ->
                    "invoke-static/range { v${instruction.startRegister} .. v${instruction.startRegister + instruction.registerCount - 1} }"
                is FiveRegisterInstruction -> "invoke-static { " + listOf(
                    instruction.registerC, instruction.registerD, instruction.registerE, instruction.registerF, instruction.registerG,
                ).take(instruction.registerCount).joinToString { "v$it" } + " }"
                else -> throw PatchException("$PATCH: $definingClass->$name calls $read in an unexpected form")
            }
            replaceInstruction(index, "$arguments, ${ownCall(read)}")
        } else {
            val register = (instruction as OneRegisterInstruction).registerA
            replaceInstruction(index, "invoke-static { }, $OWN_FONT->${DEFAULT_TYPEFACES.getValue(read)}()$TYPEFACE")
            addInstruction(index + 1, "move-result-object v$register")
        }
    }
    return sites.size
}

/**
 * Each of Android's text views Facebook builds, with `new` or as the super call of a view of its
 * own, and each view its layout inflaters make from a layout's tag, goes to the extension right
 * after it's built. Android's constructor reads the typeface from the layout, a style or bold
 * there included, or leaves none, and draws a view with none in the phone's default, all in
 * Android's own code. The extension gives a view with none or with the phone's sans-serif the
 * picked file at that weight and slant, and leaves the rest. A view of Facebook's own sets its
 * typeface after its super call, so that still wins. The call goes in after the constructor's, or
 * after the move of the inflater's answer, so a jump to what followed still skips it, and it names
 * one register by range, so any register fits. Answers how many it hooked.
 */
internal fun BytecodePatchContext.hookTextViews(): Int {
    val owners = mutableSetOf<String>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_CLASSES)) return@classDefForEach
        if (classDef.methods.any { method ->
                method.implementation?.instructions?.any { builtTextView(it) != null || makesView(it) } == true
            }
        ) {
            owners += classDef.type
        }
    }
    val hooked = owners.sumOf { type -> mutableClassDefByOrNull(type)?.methods?.sumOf { it.sendTextViews() } ?: 0 }
    if (hooked == 0) throw PatchException("$PATCH: found no text view Facebook builds")
    return hooked
}

/**
 * Hands each text view this method builds, and each view an inflater's [CREATE_VIEW] answers, to
 * the extension, last first. An answer nothing moves out of has no view to hand over. Answers how
 * many.
 */
internal fun MutableMethod.sendTextViews(): Int {
    val instructions = (implementation ?: return 0).instructions.toList()
    val sites = instructions.withIndex().mapNotNull { (index, instruction) ->
        builtTextView(instruction)?.let { register -> index to handOver(register, OWN_TEXT_VIEW) }
            ?: instructions.getOrNull(index + 1)
                ?.takeIf { makesView(instruction) && it.opcode == Opcode.MOVE_RESULT_OBJECT }
                ?.let { move ->
                    val register = (move as OneRegisterInstruction).registerA
                    index + 1 to handOver(register, OWN_INFLATED)
                }
    }
    sites.asReversed().forEach { (after, call) -> addInstruction(after + 1, call) }
    return sites.size
}

/**
 * The call handing [register] to [extension], by range so any register fits. The register is
 * written into the code as plain digits: a format's would be the phone's own, which aren't always
 * ASCII, and the assembler takes only those.
 */
private fun handOver(register: Int, extension: String) = "invoke-static/range { v$register .. v$register }, $extension"

/**
 * Facebook's Roboto builder, which its text engine asks for text that names none of Meta's fonts
 * and for Optimistic text the repository couldn't build. Each answer goes through the extension,
 * which swaps in a picked font file at the same weight and slant. A range call names the answer's
 * register whatever its number, and what comes back goes in the same register, a Typeface either
 * way, so a handler over the return sees what it did before.
 */
internal fun BytecodePatchContext.hookRobotoBuilder() {
    val builders = classDefByStrings(NO_ROBOTO, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        .flatMap(::robotoBuilders)
    val builder = builders.singleOrNull() ?: throw PatchException(
        "$PATCH: expected one Roboto builder logging \"$NO_ROBOTO\", found ${builders.size}",
    )
    val mutable = mutableClassDefBy(builder.definingClass).findMutableMethodOf(builder)
    if (objectReturns(mutable).isEmpty()) {
        throw PatchException("$PATCH: the Roboto builder ${builder.definingClass}->${builder.name} never returns a Typeface")
    }
    mutable.forEachObjectReturn { register ->
        listOf(
            "invoke-static/range { v$register .. v$register }, $REPLACE_PHONE_FONT",
            "move-result-object v$register",
        )
    }
}

/** Every Typeface the repository answers goes through the extension, with the family and the weight asked for. */
private fun BytecodePatchContext.hookTypefaceRepository() {
    val resolvers = classDefByStrings(NO_BACKING_SOURCE, StringComparisonType.EQUALS).flatMap(::typefaceResolvers)
    val resolver = resolvers.singleOrNull() ?: throw PatchException(
        "$PATCH: expected one typeface resolver holding the no-source refusal, found ${resolvers.size}",
    )
    val family = classDefBy(familyType(resolver))
    if (family.superclass != ENUM) {
        throw PatchException("$PATCH: the resolver's family ${family.type} is not an enum")
    }
    if (familyNames(family).none(::isInterfaceFamily)) {
        throw PatchException("$PATCH: the font family enum ${family.type} names none of Meta's interface families")
    }
    val creativeWithAxes = familiesWithAxes(family).filterNot(::isInterfaceFamily)
    if (creativeWithAxes.isNotEmpty()) {
        throw PatchException(
            "$PATCH: a family the switch leaves alone has variable axes, so its text would reach the " +
                "builders and be swapped: $creativeWithAxes",
        )
    }

    val mutable = mutableClassDefBy(resolver.definingClass).findMutableMethodOf(resolver)
    // The answer, the family and the weight are copied into v0 to v2, which a return leaves free,
    // so the call reads the same whatever the frame keeps where. The copies read through the
    // 16-bit forms: a parameter above v15 would otherwise be dropped by the assembler unheard.
    mutable.requireLocals(PATCH, 3)
    mutable.requireResolverHookFits()
    val familyRegister = mutable.parameterRegister(0)
    val weightRegister = mutable.parameterRegister(resolver.parameterTypes.size - 1)
    mutable.forEachObjectReturn { register ->
        listOfNotNull(
            if (register != 0) "move-object/from16 v0, v$register" else null,
            "move-object/from16 v1, $familyRegister",
            "move/from16 v2, $weightRegister",
            "invoke-static/range { v0 .. v2 }, $REPLACE",
            "move-result-object v$register",
        )
    }
}

/**
 * The builders Meta's factory makes, with the superclasses their build and setters can sit on:
 * each variation setter tells the extension what the builder was given, and each build's answer
 * goes through it.
 */
private fun BytecodePatchContext.hookVariableFontBuilders() {
    val apiUtils = classDefByOrNull(TYPEFACE_BUILDERS)
        ?: throw PatchException("$PATCH: this build has no $TYPEFACE_BUILDERS")
    val builders = builderClasses(apiUtils)
    if (builders.isEmpty()) throw PatchException("$PATCH: $BUILDER_FACTORY instantiates no builder")

    val chains = builders.associateWith { builder -> superclassChain(builder).takeWhile { !isObject(it) }.toList() }
    for ((builder, chain) in chains) {
        if (chain.none { buildMethods(classDefBy(it)).isNotEmpty() }) {
            throw PatchException("$PATCH: builder $builder has no method building a Typeface for a Context")
        }
        if (chain.none { variationSetters(classDefBy(it)).isNotEmpty() }) {
            throw PatchException("$PATCH: builder $builder has no method taking a font variation string")
        }
    }
    for (type in chains.values.flatten().distinct()) {
        val classDef = classDefBy(type)
        val mutableClass = mutableClassDefBy(type)
        for (build in buildMethods(classDef)) {
            val mutable = mutableClass.findMutableMethodOf(build)
            mutable.requireLocals(PATCH, 2)
            mutable.requireBuilderHookFits()
            mutable.forEachObjectReturn { register ->
                listOfNotNull(
                    if (register != 0) "move-object/from16 v0, v$register" else null,
                    "move-object/from16 v1, p0",
                    "invoke-static { v0, v1 }, $REPLACE_BUILT",
                    "move-result-object v$register",
                )
            }
        }
        for (setter in variationSetters(classDef)) {
            mutableClass.findMutableMethodOf(setter)
                .addInstruction(0, "invoke-static/range { p0 .. p1 }, $REMEMBER_VARIATION")
        }
    }
}

/**
 * React Native's typeface resolver, which every piece of React Native text is drawn in: its text
 * spans, its text layout and its text inputs all ask it. The family name the screen asked for goes
 * to the extension with the answer, and the extension swaps the names that are Meta's interface
 * fonts. Found in the class Redex merged React Native's typeface utilities into, by the refusal two
 * of them log.
 */
internal fun BytecodePatchContext.hookReactNativeFonts() {
    val owners = classDefByStrings(INVALID_FONT_VARIATION, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
    val resolvers = owners.flatMap(::reactNativeResolvers).distinct()
    val resolver = resolvers.singleOrNull() ?: throw PatchException(
        "$PATCH: expected one React Native typeface resolver beside the \"$INVALID_FONT_VARIATION\" " +
            "refusal, found ${resolvers.size}",
    )
    val mutable = mutableClassDefBy(resolver.definingClass).findMutableMethodOf(resolver)
    // The answer and the family name are copied into v0 and v1, free at each return, and the
    // family is read through the 16-bit form for the same reason as the repository's.
    mutable.requireLocals(PATCH, 2)
    mutable.requireReactNativeHookFits()
    val familyRegister = mutable.parameterRegister(REACT_FAMILY)
    mutable.forEachObjectReturn { register ->
        listOfNotNull(
            if (register != 0) "move-object/from16 v0, v$register" else null,
            "move-object/from16 v1, $familyRegister",
            "invoke-static { v0, v1 }, $REPLACE_REACT_NATIVE",
            "move-result-object v$register",
        )
    }
}

/**
 * Proves the resolver's hook can go in at each object return. It reads the family, the first
 * parameter, and the weight, the last, from their own registers there, so neither may have been
 * written over on the way; and it copies into v0 to v2, so nothing the method reads afterwards may
 * sit in them, the answer the return hands back aside, which the hook replaces on purpose.
 */
internal fun Method.requireResolverHookFits() {
    val returns = objectReturns(this)
    requireParameterIntact(PATCH, 0, returns)
    requireParameterIntact(PATCH, parameterTypes.size - 1, returns)
    requireReturnCopiesFree(returns, listOf(0, 1, 2))
}

/** The same for a builder's build: `this` still in its register at each object return, and v0 and v1 free there. */
internal fun Method.requireBuilderHookFits() {
    val returns = objectReturns(this)
    requireThisIntact(PATCH, returns)
    requireReturnCopiesFree(returns, listOf(0, 1))
}

/**
 * The same for React Native's resolver: the family name still in its own register at each object
 * return, and v0 and v1 free there. The style and the weight it resolves in place don't matter to
 * the hook, which reads them off the answer.
 */
internal fun Method.requireReactNativeHookFits() {
    val returns = objectReturns(this)
    requireParameterIntact(PATCH, REACT_FAMILY, returns)
    requireReturnCopiesFree(returns, listOf(0, 1))
}

private fun Method.requireReturnCopiesFree(returns: List<Int>, copies: List<Int>) {
    val instructions = implementation!!.instructions.toList()
    for (index in returns) {
        val answer = (instructions[index] as OneRegisterInstruction).registerA
        requireFreeAt(PATCH, index, copies - answer)
    }
}

/** Puts [instructions] in front of each `return-object`, last first, given the register it returns. */
private fun MutableMethod.forEachObjectReturn(instructions: (register: Int) -> List<String>) {
    objectReturns(this).asReversed().forEach { index ->
        val register = getInstruction<OneRegisterInstruction>(index).registerA
        addInstructionsAtControlFlowLabel(index, instructions(register).joinToString("\n"))
    }
}
