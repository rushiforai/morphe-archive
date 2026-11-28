package app.onlynazril.patches.tiktok.featureflags

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.findMutableMethodOf
import app.onlynazril.patches.shared.Constants.COMPATIBILITY_TIKTOK
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val FEATURE_FLAGS =
    "Lapp/onlynazril/extension/tiktok/flags/FeatureFlags;"

/**
 * One typed getter of TikTok's AB class. The parameters and the key's position are what identify
 * it; the class name and the method names change every build.
 */
private data class Shape(val returnType: String, val params: List<String>, val keyIndex: Int)

private val BOOLEAN = Shape("Z", listOf("I", "Ljava/lang/String;", "Z", "Z"), 1)
private val INT = Shape("I", listOf("I", "I", "Ljava/lang/String;", "Z"), 2)
private val LONG = Shape("J", listOf("I", "J", "Ljava/lang/String;", "Z"), 2)
private val FLOAT = Shape("F", listOf("I", "Ljava/lang/String;", "Z", "F"), 1)
private val DOUBLE = Shape("D", listOf("D", "I", "Ljava/lang/String;", "Z"), 2)
private val STRING = Shape(
    "Ljava/lang/String;",
    listOf("I", "Ljava/lang/String;", "Ljava/lang/String;", "Z"),
    1,
)

/** All six typed getters together name the AB class; the raw getter is not needed for the hook. */
private val AB_SHAPES = setOf(BOOLEAN, INT, LONG, FLOAT, DOUBLE, STRING)

private const val OBJECT = "Ljava/lang/Object;"

private data class Hook(val method: String, val descriptor: String) {
    /** A long or a double comes back in a register pair and needs `move-result-wide`. */
    val wide: Boolean get() = descriptor.endsWith("J") || descriptor.endsWith("D")
    val objectResult: Boolean get() = descriptor.endsWith(";")
}

private val HOOKS = listOf(
    BOOLEAN to Hook("overrideBoolean", "(Ljava/lang/String;Z)Z"),
    INT to Hook("overrideInt", "(Ljava/lang/String;I)I"),
    LONG to Hook("overrideLong", "(Ljava/lang/String;J)J"),
    FLOAT to Hook("overrideFloat", "(Ljava/lang/String;F)F"),
    DOUBLE to Hook("overrideDouble", "(Ljava/lang/String;D)D"),
    STRING to Hook(
        "overrideString",
        "(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;",
    ),
)

private val OBJECT_HOOK = Hook(
    "overrideObject",
    "(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;",
)

/** The helper each return type goes through. */
private val HOOK_FOR = mapOf(
    "Z" to Hook("overrideBoolean", "(Ljava/lang/String;Z)Z"),
    "I" to Hook("overrideInt", "(Ljava/lang/String;I)I"),
    "J" to Hook("overrideLong", "(Ljava/lang/String;J)J"),
    "F" to Hook("overrideFloat", "(Ljava/lang/String;F)F"),
    "D" to Hook("overrideDouble", "(Ljava/lang/String;D)D"),
    "Ljava/lang/String;" to Hook(
        "overrideString",
        "(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;",
    ),
    "Ljava/lang/Object;" to OBJECT_HOOK,
)

/** The typed getters the AB class is recognised by; each one must be hooked. */
private val REQUIRED_SHAPES = AB_SHAPES

private const val CLASS = "Ljava/lang/Class;"

/**
 * Two getters the general rule cannot reach: a default value before the key, and a key followed by
 * a default string. Both are still flags; only the key's position needs writing down.
 */
private val EXTRA_SHAPES = listOf(
    Shape(OBJECT, listOf(CLASS, OBJECT, "Ljava/lang/String;", "Z"), 2),
    Shape("Ljava/lang/String;", listOf("I", "I", "Ljava/lang/String;",
        "Ljava/lang/String;", "Z"), 2),
)

/**
 * Whether a method is one more getter of the same class, and where its key is.
 *
 * The class also answers flags through shapes beside the six typed ones: a string key with no int,
 * an extra boolean, and values returned as a parsed `Object`. The rule is one `String` parameter
 * that is not preceded by a stored value, plus a return type one of the helpers handles. The two
 * string parameters of the typed string getter are skipped here and hooked by [HOOKS].
 *
 * A method that takes a value before the key is a setter returning the previous value; it is left
 * alone, because replacing that answer would confuse the store rather than override a flag.
 */
private fun extraShapeOf(method: Method): Shape? {
    if (AccessFlags.STATIC.isSet(method.accessFlags)) return null
    if (method.returnType == "V") return null
    if (method.returnType !in HOOK_FOR) return null
    val params = method.parameterTypes.map(CharSequence::toString)
    if (params.count { it == "Ljava/lang/String;" } != 1) return null
    val key = params.indexOf("Ljava/lang/String;")
    if (key < 0) return null
    if (params.take(key).any { it.startsWith("L") && it != "Ljava/lang/Class;" }) return null
    if (params.count { it == "Ljava/lang/Class;" } > 1) return null
    return Shape(method.returnType, params, key)
}

/**
 * Overrides TikTok's AB feature flags from the Tweaks screen and records every flag the app reads.
 *
 * The getters are hooked at their `return`, not at their entry: the app's own value is already in
 * a register there, so the override only replaces it and nothing has to be recomputed. A class is
 * the AB class when it carries one getter of every type; the names are never written down.
 *
 * Off by default. Without an override every getter returns the app's own answer.
 */
@Suppress("unused")
val tiktokFeatureFlagsPatch = bytecodePatch(
    name = "Feature flags",
    description = "Override TikTok's AB flags from the Tweaks screen and list every flag the app " +
        "reads. Off by default; a flag without an override keeps the app's own value.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TIKTOK)

    extendWith("extensions/tiktok.mpe")

    execute {
        var classes = 0
        var hooked = 0
        classDefForEach { classDef ->
            val shapes = classDef.methods.mapNotNull { method ->
                if (AccessFlags.STATIC.isSet(method.accessFlags)) {
                    null
                } else {
                    AB_SHAPES.firstOrNull { shape -> method.matches(shape) }
                }
            }.toSet()
            if (!AB_SHAPES.all { it in shapes }) return@classDefForEach

            val mutableClass = mutableClassDefBy(classDef.type)
            HOOKS.forEach { (shape, hook) ->
                val method = classDef.methods.singleOrNull { it.matches(shape) }
                    ?: throw PatchException(
                        "Feature flags: expected one ${shape.returnType} getter on " +
                            "${classDef.type}.",
                    )
                hookReturns(mutableClass.findMutableMethodOf(method), method, shape, hook)
                hooked++
            }
            // Every remaining getter of the class, whatever its shape, as long as a helper can
            // answer its type.
            classDef.methods.forEach { method ->
                if (REQUIRED_SHAPES.any { method.matches(it) }) return@forEach
                val shape = extraShapeOf(method) ?: return@forEach
                val hook = HOOK_FOR[method.returnType] ?: return@forEach
                hookReturns(mutableClass.findMutableMethodOf(method), method, shape, hook)
                hooked++
            }
            EXTRA_SHAPES.forEach { shape ->
                val hook = HOOK_FOR[shape.returnType] ?: return@forEach
                classDef.methods
                    .filter { it.matches(shape) }
                    .forEach { method ->
                        hookReturns(mutableClass.findMutableMethodOf(method), method, shape, hook)
                        hooked++
                    }
            }
            classes++
        }
        if (classes == 0) {
            throw PatchException("Feature flags: TikTok's AB class was not found.")
        }
    }
}

private fun Method.matches(shape: Shape): Boolean =
    !AccessFlags.STATIC.isSet(accessFlags) &&
        returnType == shape.returnType &&
        parameterTypes.map(CharSequence::toString) == shape.params

private fun hookReturns(mutable: MutableMethod, method: Method, shape: Shape, hook: Hook) {
    val implementation = method.implementation
        ?: throw PatchException("Feature flags: ${method.name} has no body.")
    val key = keyRegister(method, shape)
    val returns = implementation.instructions
        .withIndex()
        .filter { (_, instruction) -> instruction.opcode in RETURNS }
        .toList()
    if (returns.isEmpty()) {
        throw PatchException("Feature flags: ${method.name} has no return.")
    }
    // From the end, so an earlier index stays valid.
    returns.asReversed().forEach { (index, instruction) ->
        val value = (instruction as OneRegisterInstruction).registerA
        mutable.addInstructions(
            index,
            replaceValue(key, value, hook, implementation.registerCount),
        )
    }
}

private val RETURNS = setOf(Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT)

/**
 * The instructions that hand one return value through the override.
 *
 * The plain form passes the key and the value straight to the helper, which is what every build so
 * far allows: the key sits in a low register and the value is the return register. When either is
 * above v15, a four-bit invoke cannot name it, so the two are copied into low scratch registers
 * first; the return instruction is terminal, so those registers are free.
 */
private fun replaceValue(key: Int, value: Int, hook: Hook, registers: Int): String {
    val call = "invoke-static {REGS}, $FEATURE_FLAGS->${hook.method}${hook.descriptor}"
    val read = when {
        hook.wide -> "move-result-wide"
        hook.objectResult -> "move-result-object"
        else -> "move-result"
    }
    if (hook.wide) {
        if (key <= 15 && value + 1 <= 15) {
            return "${call.replace("REGS", "v$key, v$value, v${value + 1}")}\n" +
                "$read v$value"
        }
        // A wide value is copied as an even-aligned pair that does not overlap it.
        val pair = (listOf(0, 2, 4, 6) + 0).firstOrNull {
            it + 1 < registers && it != value && it != value + 1 &&
                it + 1 != value && it + 1 != value + 1
        } ?: throw PatchException("Feature flags: no free pair for ${hook.method}.")
        val keyScratch = (1..7).firstOrNull {
            it != value && it != value + 1 && it != pair && it != pair + 1 && it < registers
        } ?: throw PatchException("Feature flags: no low register for ${hook.method}.")
        return """
            move/from16 v$keyScratch, v$key
            move-wide/from16 v$pair, v$value
            ${call.replace("REGS", "v$keyScratch, v$pair, v${pair + 1}")}
            $read v$pair
            move-wide/from16 v$value, v$pair
        """
    }
    if (key <= 15 && value <= 15) {
        return "${call.replace("REGS", "v$key, v$value")}\n$read v$value"
    }
    // The value is saved before the key is copied, so a key that lands on the value's register
    // cannot be read after being overwritten.
    val scratch = (1..3).firstOrNull { it != key && it < registers }
        ?: throw PatchException("Feature flags: no low register for ${hook.method}.")
    // A reference is moved with the opcode that tells the runtime it is one.
    val move = if (hook.objectResult) "move-object/from16" else "move/from16"
    return """
        $move v$scratch, v$value
        $move v0, v$key
        ${call.replace("REGS", "v0, v$scratch")}
        $read v$scratch
        $move v$value, v$scratch
    """
}

/** The key's register: the first parameter sits at registerCount - parameter registers. */
private fun keyRegister(method: Method, shape: Shape): Int {
    fun width(type: String) = if (type == "J" || type == "D") 2 else 1
    val paramRegisters = shape.params.sumOf(::width)
    val firstParam = method.implementation!!.registerCount - paramRegisters
    val offset = shape.params.take(shape.keyIndex).sumOf(::width)
    return firstParam + offset
}
