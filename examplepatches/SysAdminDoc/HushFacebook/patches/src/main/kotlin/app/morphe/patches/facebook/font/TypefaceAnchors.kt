/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.font

import app.morphe.patches.facebook.feed.holdsString
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * The refusal the typeface repository's resolver throws for a family with no source. It is the
 * one literal that method keeps, and the repository class keeps nothing else a patch can carry.
 */
internal const val NO_BACKING_SOURCE = "The requested font, %s, does not have a backing source. " +
    "You need to provide either a systemFontName, assetFontName, or a fileDescriptor."

internal const val TYPEFACE = "Landroid/graphics/Typeface;"
internal const val CONTEXT = "Landroid/content/Context;"
internal const val ENUM = "Ljava/lang/Enum;"
internal const val STRING = "Ljava/lang/String;"
internal const val LIST = "Ljava/util/List;"
private const val OBJECT = "Ljava/lang/Object;"

/** Meta's typeface builder factory, a class Redex keeps by name, and the kept method that makes builders. */
internal const val TYPEFACE_BUILDERS = "Lcom/meta/foa/typefacebuilder/ApiUtils;"
internal const val BUILDER_FACTORY = "createTypefaceBuilderFor26Api"

/**
 * What React Native's typeface utilities log for a font variation string Android won't parse,
 * under the tag "ReactNative". Redex merges those utilities into one class of static methods, and
 * the two that parse and apply the string keep this literal in both builds, beside the resolver
 * every piece of React Native text asks for its typeface.
 */
internal const val INVALID_FONT_VARIATION = "Invalid fontVariationSettings: "
internal const val ASSET_MANAGER = "Landroid/content/res/AssetManager;"
/** How React Native's font manager loads a family it finds among the app's font assets. */
private const val CREATE_FROM_ASSET = "createFromAsset"

/**
 * The parameter of React Native's resolver that names the family: after the asset manager and
 * the base typeface, and before the style and the weight.
 */
internal const val REACT_FAMILY = 2

/**
 * The family constants the extension swaps: Meta's interface families, by the names the enum
 * keeps. OwnFont.isInterfaceFamily is the same rule on the phone.
 */
internal fun isInterfaceFamily(name: String): Boolean =
    name.startsWith("OPTIMISTIC") || name == "FACEBOOK_SANS_VARIABLE"

/** An enum constant's name as Redex leaves it: capitals, digits and underscores. */
private val CONSTANT_NAME = Regex("[A-Z][A-Z0-9_]{2,}")

private fun Method.strings(): List<String> = implementation?.instructions
    ?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }.orEmpty()

private fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)

private fun Method.parameterTypeNames() = parameterTypes.map { it.toString() }

/**
 * The static resolvers of [owner]: a Typeface answered for a family (the first parameter) at a
 * weight (the last), ending in the no-source refusal. The patch wants exactly one.
 */
internal fun typefaceResolvers(owner: ClassDef): List<Method> = owner.methods.filter { method ->
    method.isStatic() && method.returnType == TYPEFACE && holdsString(method, NO_BACKING_SOURCE) &&
        method.parameterTypes.size >= 2 && method.parameterTypeNames().last() == "I" &&
        method.parameterTypeNames().first().startsWith("L")
}

/** The font family type [resolver] takes: its first parameter. */
internal fun familyType(resolver: Method): String = resolver.parameterTypeNames().first()

/** The constant names [family] declares: the upper-case literals its constructors and static initializer load. */
internal fun familyNames(family: ClassDef): List<String> =
    family.methods.filter { it.name == "<clinit>" || it.name == "<init>" }
        .flatMap { it.strings() }.filter { CONSTANT_NAME.matches(it) }.distinct()

/**
 * The constants of [family] built with a list of variable axes: each constructor call in the
 * static initializer that takes a List, named by the last constant literal loaded before it,
 * or, for a constructor that carries its own name, by the literal in its body.
 */
internal fun familiesWithAxes(family: ClassDef): List<String> {
    val initializer = family.methods.firstOrNull { it.name == "<clinit>" } ?: return emptyList()
    val found = mutableListOf<String>()
    var lastName: String? = null
    for (instruction in initializer.implementation?.instructions?.toList().orEmpty()) {
        val reference = (instruction as? ReferenceInstruction)?.reference
        (reference as? StringReference)?.string?.let { if (CONSTANT_NAME.matches(it)) lastName = it }
        val call = reference as? MethodReference ?: continue
        if (instruction.opcode != Opcode.INVOKE_DIRECT && instruction.opcode != Opcode.INVOKE_DIRECT_RANGE) continue
        if (call.definingClass != family.type || call.name != "<init>") continue
        val parameters = call.parameterTypes.map { it.toString() }
        if (LIST !in parameters) continue
        if (STRING in parameters) {
            lastName?.let { found += it }
        } else {
            family.methods.filter { it.name == "<init>" && it.parameterTypeNames() == parameters }
                .flatMap { it.strings() }.filter { CONSTANT_NAME.matches(it) }.forEach { found += it }
        }
    }
    return found.distinct()
}

/** The classes the builder factory's methods instantiate: the asset builder and the font file builder. */
internal fun builderClasses(apiUtils: ClassDef): List<String> =
    apiUtils.methods.filter { it.name == BUILDER_FACTORY }.flatMap { method ->
        method.implementation?.instructions?.toList().orEmpty().mapNotNull { instruction ->
            if (instruction.opcode != Opcode.NEW_INSTANCE) null
            else ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type
        }
    }.distinct()

/** A builder's build: its instance method answering a Typeface for a Context. */
internal fun buildMethods(classDef: ClassDef): List<Method> = classDef.methods.filter {
    !it.isStatic() && it.returnType == TYPEFACE && it.parameterTypeNames() == listOf(CONTEXT)
}

/** A builder's variation setter: its instance method taking one String and answering nothing. */
internal fun variationSetters(classDef: ClassDef): List<Method> = classDef.methods.filter {
    !it.isStatic() && it.returnType == "V" && it.parameterTypeNames() == listOf(STRING)
}

/**
 * Whether [method] takes the family enum or reads one of its members, which is how every maker
 * of a builder gets the family it builds for: 580's repository takes it, 577's asset helper looks
 * it up by name and reads its asset name and axes.
 */
internal fun touchesFamily(method: Method, familyType: String): Boolean =
    method.parameterTypeNames().any { it == familyType } ||
        method.implementation?.instructions?.any { instruction ->
            when (val reference = (instruction as? ReferenceInstruction)?.reference) {
                is FieldReference -> reference.definingClass == familyType
                is MethodReference -> reference.definingClass == familyType
                else -> false
            }
        } == true

/**
 * React Native's typeface resolvers among [owner]'s methods: static, answering a Typeface for an
 * asset manager, a base typeface, a family name, a style and a weight, and loading a family it
 * finds among the app's font assets itself. That's React Native's applyStyles with its font
 * manager's lookup inlined. The patch wants exactly one.
 */
internal fun reactNativeResolvers(owner: ClassDef): List<Method> = owner.methods.filter { method ->
    method.isStatic() && method.returnType == TYPEFACE &&
        method.parameterTypeNames() == listOf(ASSET_MANAGER, TYPEFACE, STRING, "I", "I") &&
        method.implementation?.instructions?.any { instruction ->
            val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            call?.definingClass == TYPEFACE && call.name == CREATE_FROM_ASSET
        } == true
}

/** Whether [type] is the root every chain ends at. */
internal fun isObject(type: String) = type == OBJECT

/** How many of [method]'s registers are locals: the frame less `this` and the parameters. */
internal fun localRegisters(method: Method): Int {
    val implementation = method.implementation ?: return 0
    val self = if (method.isStatic()) 0 else 1
    val parameters = method.parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
    return implementation.registerCount - self - parameters
}

/** The indices of [method]'s object returns, in order. */
internal fun objectReturns(method: Method): List<Int> = method.implementation?.instructions
    ?.withIndex()?.filter { it.value.opcode == Opcode.RETURN_OBJECT }?.map { it.index }.orEmpty()
