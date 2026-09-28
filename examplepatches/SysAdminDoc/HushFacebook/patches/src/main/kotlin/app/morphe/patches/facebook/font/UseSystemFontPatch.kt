/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.font

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
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
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val PATCH = "Use the system font"
internal const val OWN_FONT = "$EXTENSION_PACKAGE/font/OwnFont;"
internal const val REPLACE = "$OWN_FONT->replace($TYPEFACE${ENUM}I)$TYPEFACE"
internal const val REMEMBER_VARIATION = "$OWN_FONT->rememberVariation(Ljava/lang/Object;$STRING)V"
internal const val REPLACE_BUILT = "$OWN_FONT->replaceBuilt(${TYPEFACE}Ljava/lang/Object;)$TYPEFACE"
internal const val REPLACE_REACT_NATIVE = "$OWN_FONT->replaceReactNative($TYPEFACE$STRING)$TYPEFACE"

/**
 * Facebook draws its interface in Meta's Optimistic family, handed out by one typeface
 * repository. Every Typeface its resolver answers goes through the extension, which swaps Meta's
 * families for the chosen font, the phone's own or a picked file, at the same weight and slant
 * while the switch is on. Bloks text with variable-font settings builds its typeface itself,
 * through the builders Meta's factory makes, so those get the same treatment at their exit, with
 * the variation string each was given remembered for the weight. React Native screens ask React
 * Native's font manager for a family by name, so its resolver's answer goes through the extension
 * too, with the name it was asked for.
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
        enableStatus("systemFont")
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
