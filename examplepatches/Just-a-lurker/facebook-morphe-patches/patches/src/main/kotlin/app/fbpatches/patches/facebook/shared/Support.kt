/*
 * Patch-time helpers shared by the Facebook patches.
 *
 * Parts adapted from Hushfacebook (https://github.com/SysAdminDoc/Hushfacebook, GPL-3.0),
 * ExtensionSupport.kt, PartialTargets.kt and Neuter.kt, which in turn fork Andrew Liang's
 * morphe-patches (GPL-3.0). Modified for facebook-morphe-patches, 2026: settings switches removed.
 */
package app.fbpatches.patches.facebook.shared

import app.fbpatches.util.ControlFlow
import app.fbpatches.util.RegisterLiveness
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.util.MethodUtil
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.logging.Logger

/** The extension's package as a smali descriptor prefix. */
internal const val EXTENSION_PACKAGE = "Lapp/fbpatches/extension/facebook"

/** Where patches write at patch time. Morphe Desktop and Manager show `app.morphe` loggers. */
internal val patchLog: Logger = Logger.getLogger("app.morphe.patches.fbpatches")

private fun CharSequence.width(): Int = if (toString() == "J" || toString() == "D") 2 else 1

/** The `p` register holding declared parameter [index], counting `this` and wide parameters. */
internal fun Method.parameterRegister(index: Int): String {
    require(index in parameterTypes.indices) { "$definingClass->$name has no parameter $index" }
    val self = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    return "p" + (self + parameterTypes.take(index).sumOf { it.width() })
}

/** How many of the method's registers are locals rather than parameters. */
internal fun Method.localRegisterCount(): Int {
    val implementation = implementation ?: throw PatchException("$definingClass->$name has no body")
    val self = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    return implementation.registerCount - self - parameterTypes.sumOf { it.width() }
}

/** Throws unless the method has at least [count] locals, free to borrow at index 0. */
internal fun Method.requireLocals(what: String, count: Int) {
    val locals = localRegisterCount()
    if (locals < count) {
        throw PatchException("$what: $definingClass->$name has $locals local register(s), needs $count")
    }
}

/** The `v` number of the register holding declared parameter [index]. */
internal fun Method.parameterRegisterNumber(index: Int): Int =
    localRegisterCount() + parameterRegister(index).removePrefix("p").toInt()

/**
 * The registers code put in front of instruction [index] must leave alone: whatever a path from
 * [index] (or from each of [targets]) reads before writing it, and what the handlers of the
 * instruction before [index] read.
 */
internal fun Method.liveAcrossInjection(index: Int, targets: Collection<Int> = emptyList()): Set<Int> {
    val liveness = RegisterLiveness.of(this)
    val live = liveness.liveInto(index).toMutableSet()
    targets.forEach { live += liveness.liveInto(it) }
    if (index > 0) ControlFlow.of(this).exceptional[index - 1].forEach { live += liveness.liveInto(it) }
    return live
}

/**
 * The lowest [count] locals, v[highest] or below, that code put in front of instruction [index]
 * may write without changing what the method goes on to read. Throws naming [what] otherwise.
 */
internal fun Method.freeLocalsAt(
    what: String,
    index: Int,
    count: Int,
    targets: Collection<Int> = emptyList(),
    highest: Int = 15,
): List<Int> {
    val live = liveAcrossInjection(index, targets)
    val locals = localRegisterCount()
    val free = (0 until minOf(locals, highest + 1)).filter { it !in live }
    if (free.size < count) {
        throw PatchException(
            "$what: $definingClass->$name has ${free.size} free local register(s) up to v$highest after instruction $index, needs $count",
        )
    }
    return free.take(count)
}

/** Whether [method] loads exactly [string]. */
internal fun holdsString(method: Method, string: String): Boolean =
    method.implementation?.instructions?.any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == string
    } == true

/** The prefix every extension class has, so patches can skip the extension's own classes. */
internal const val EXTENSION_CLASSES = "Lapp/fbpatches/extension/"

/** The mutable copy of [method], looked up by name and signature. */
internal fun BytecodePatchContext.mutableMethodOf(method: Method): MutableMethod =
    mutableClassDefBy(method.definingClass).methods.singleOrNull {
        it.name == method.name && it.returnType == method.returnType &&
            it.parameterTypes.map(Any::toString) == method.parameterTypes.map(Any::toString)
    } ?: throw PatchException("${method.definingClass}->${method.name} not found as a mutable method")

/** A class descriptor as Java writes the name. */
internal fun javaName(descriptor: String): String =
    descriptor.removePrefix("L").removeSuffix(";").replace('/', '.')

/** Makes a void method return at once. */
internal fun MutableMethod.returnEarlyVoid() {
    if (returnType != "V") throw PatchException("$definingClass->$name returns $returnType, not void")
    addInstructions(0, "return-void")
}

/** Makes a boolean method return [value] at once. Needs one local. */
internal fun MutableMethod.returnEarlyBoolean(value: Boolean) {
    if (returnType != "Z") throw PatchException("$definingClass->$name returns $returnType, not boolean")
    requireLocals("returnEarly", 1)
    addInstructions(
        0,
        """
            const/4 v0, ${if (value) "0x1" else "0x0"}
            return v0
        """,
    )
}

/** Makes a long method return [value] at once. Needs two locals. */
internal fun MutableMethod.returnEarlyLong(value: Long) {
    if (returnType != "J") throw PatchException("$definingClass->$name returns $returnType, not long")
    requireLocals("returnEarly", 2)
    addInstructions(
        0,
        """
            const-wide v0, ${value}L
            return-wide v0
        """,
    )
}

/** The one element, or a PatchException naming [contract]. */
internal fun <T> Iterable<T>.singleOrPatchException(contract: String): T {
    val matches = if (this is Collection<T>) this else toList()
    return matches.singleOrNull()
        ?: throw PatchException("$contract: expected exactly one match, found ${matches.size}.")
}

/** [type] and its superclasses, as far as the APK carries them. */
internal fun BytecodePatchContext.superclassChain(type: String, maxDepth: Int = 20): Sequence<String> = sequence {
    val seen = mutableSetOf<String>()
    var at: String? = type
    var depth = 0
    while (at != null && depth++ < maxDepth && seen.add(at)) {
        yield(at)
        at = classDefByOrNull(at)?.superclass
    }
}

/** The method of this class whose signature matches [method]. */
internal fun MutableClass.findMutableMethodOf(method: MethodReference): MutableMethod =
    methods.first { MethodUtil.methodSignaturesMatch(it, method) }

/**
 * Two locals an injection at index 0 may borrow (nothing holds a value yet), both no higher than
 * v15 so four-bit invoke operands can name them.
 */
internal fun Method.twoLocalsAtStart(what: String): Pair<Int, Int> {
    requireLocals(what, 2)
    return 0 to 1
}

/** The static field Redex leaves behind holding a class's name from before obfuscation. */
internal fun redexOriginalName(classDef: ClassDef): String? =
    classDef.staticFields
        .firstOrNull { it.name == "__redex_internal_original_name" }
        ?.let { (it.initialValue as? StringEncodedValue)?.value }

/**
 * Works down a list of separate targets. [handle] answers null when a target was dealt with, or why
 * it wasn't. Missing targets are logged; a build with none of them stops the patch.
 */
internal fun <T> handleTargets(patch: String, what: String, targets: List<T>, handle: (T) -> String?): Int {
    require(targets.isNotEmpty()) { "$patch has no $what to look for" }
    val missing = targets.mapNotNull { target -> handle(target)?.let { target to it } }
    if (missing.size == targets.size) {
        throw PatchException(
            "$patch: this Facebook build has none of the ${targets.size} $what. " +
                missing.joinToString("; ", postfix = ".") { it.second },
        )
    }
    val handled = targets.size - missing.size
    missing.forEach { (_, reason) ->
        patchLog.warning("$patch: $reason. Going on with the $handled of ${targets.size} $what found.")
    }
    return handled
}

/**
 * Makes every void method on [classDescriptor] (constructors excepted) return at once. Facebook's ad
 * schedulers and trackers keep their real class names while method names don't, so methods are
 * picked by shape. Returns how many changed, 0 when the class is absent.
 */
internal fun BytecodePatchContext.neuterVoidMethods(classDescriptor: String): Int {
    val classDef = mutableClassDefByOrNull(classDescriptor) ?: return 0
    return classDef.methods.count { method ->
        val neuterable = method.returnType == "V" &&
            method.name != "<init>" && method.name != "<clinit>" &&
            method.implementation != null
        if (neuterable) method.returnEarlyVoid()
        neuterable
    }
}

/** [neuterVoidMethods] for [handleTargets]: null on success, or why nothing changed. */
internal fun BytecodePatchContext.neuterOrReason(classDescriptor: String): String? {
    if (neuterVoidMethods(classDescriptor) > 0) return null
    val name = javaName(classDescriptor)
    return if (classDefByOrNull(classDescriptor) == null) {
        "$name isn't in this Facebook build"
    } else {
        "$name has no void method left to stop"
    }
}
