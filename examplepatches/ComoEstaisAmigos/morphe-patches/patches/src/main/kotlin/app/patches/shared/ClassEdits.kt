package app.adebisi.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal val PUBLIC = AccessFlags.PUBLIC.value
internal val STATIC = AccessFlags.STATIC.value
internal val CONSTRUCTOR = AccessFlags.CONSTRUCTOR.value

/**
 * Empties every class under [prefixes] except [keep]. Each pair is the type prefix and how
 * many classes the stock APK must still have after [keep] is taken out; a mismatch refuses
 * the APK rather than emptying a partial tree.
 */
internal fun emptySdkPrefixes(
    prefixes: List<Pair<String, Int>>,
    keep: Set<String> = emptySet(),
) {
    val toEmpty = ArrayList<String>()
    for ((prefix, expected) in prefixes) {
        val found = buildList {
            classDefForEach {
                if (it.type.startsWith(prefix) && it.type !in keep) add(it.type)
            }
        }
        if (found.size != expected) {
            throw PatchException("Expected $expected classes under $prefix, found ${found.size}")
        }
        toEmpty.addAll(found)
    }
    emptyClasses(toEmpty.map { mutableClassDefBy(it) })
}

/**
 * Emptied SDK URL constants stay in the original DEX string pool if that file is
 * reused. Making every class mutable drops it so DexPool writes the strings.
 */
internal fun rewriteOriginalDexThroughDexPool() {
    val types = buildList { classDefForEach { add(it.type) } }
    for (type in types) mutableClassDefBy(type)
}

internal fun MutableClass.addStub(
    name: String,
    parameters: List<String> = emptyList(),
    returnType: String = "V",
    access: Int = PUBLIC,
    registerCount: Int,
    smali: String,
) {
    val method = ImmutableMethod(
        type,
        name,
        parameters.map { ImmutableMethodParameter(it, null, null) },
        returnType,
        access,
        null,
        null,
        MutableMethodImplementation(registerCount),
    ).toMutable()
    method.addInstructions(0, smali.trimIndent())
    methods.add(method)
    val static = access and STATIC != 0
    val ctor = name == "<init>" || name == "<clinit>"
    if (static || ctor) directMethods.add(method) else virtualMethods.add(method)
}
