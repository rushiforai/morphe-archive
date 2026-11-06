package app.template.patches.reddit.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val ACCOUNT_CLASS_DESCRIPTOR = "Lcom/reddit/domain/model/Account;"

/**
 * Shared data-source surgery for Account boolean/Boolean flags.
 *
 * Every Account object the app sees is constructed inside
 * AccountJsonAdapter.fromJson. This walks all `invoke-direct … Account.<init>(…)`
 * sites in that method and, immediately before each invoke, overwrites the
 * registers feeding the requested constructor parameters:
 *
 *   - `Z` (primitive boolean)      → `const/4 vR, 0x1|0x0`
 *   - `Ljava/lang/Boolean;` (boxed) → `sget-object vR, Ljava/lang/Boolean;->TRUE|FALSE:…`
 *
 * Register math: reg = invoke /range start + 1 (for `this`) + Σ param widths
 * (J/D count as two). Parameter positions are re-derived at patch time from the
 * adapter constructor's Moshi JsonReader.Options key table, so reshuffled
 * property order across Reddit builds is handled automatically.
 * Anything neither Z nor boxed-Boolean is skipped and logged.
 *
 * Verified against Reddit 2026.42.0 (vc 2642020).
 */
internal fun forceAccountFlags(
    fromJsonMethod: MutableMethod,
    optionsConstructor: MutableMethod,
    flags: List<Pair<String, Boolean>>,
    logTag: String,
) {
    val jsonKeyOrder = optionsConstructor.parseJsonKeyOrder()
    val wanted = flags.mapNotNull { (key, desired) ->
        val index = jsonKeyOrder.indexOf(key)
        if (index < 0) null.also { println("$logTag: key '$key' NOT in options table (parsed)$jsonKeyOrder") }
        else Triple(index, desired, key)
    }
    if (wanted.isEmpty()) {
        throw PatchException(
            "$logTag: none of the requested keys found in the Moshi options table " +
                "(parsed=$jsonKeyOrder). Re-verify with a fresh apktool dump."
        )
    }

    val instructions = fromJsonMethod.implementation?.instructions?.toList()
        ?: throw PatchException("$logTag: fromJson has no body")

    val plannedInjections = mutableListOf<Pair<Int, String>>()
    val skippedParams = mutableListOf<String>()

    instructions.forEachIndexed { index, instruction ->
        if (instruction.opcode != Opcode.INVOKE_DIRECT_RANGE) return@forEachIndexed
        val reference = (instruction as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@forEachIndexed
        if (reference.definingClass != ACCOUNT_CLASS_DESCRIPTOR || reference.name != "<init>") {
            return@forEachIndexed
        }
        val range = instruction as? RegisterRangeInstruction
            ?: throw PatchException("$logTag: Account <init> invoke is not /range form")

        val parameterTypes = reference.parameterTypes.map { it.toString() }
        val injection = buildString {
            wanted.forEach { (paramIndex, desired, key) ->
                if (paramIndex >= parameterTypes.size) return@forEach
                var reg = range.startRegister + 1 // +1 = 'this'
                for (i in 0 until paramIndex) {
                    reg += if (parameterTypes[i] == "J" || parameterTypes[i] == "D") 2 else 1
                }
                when (val paramType = parameterTypes[paramIndex]) {
                    // const/4 (11n) accepts ONLY v0-v15 → const/16 (21s) beyond
                    // that; an out-of-range const/4 is silently discarded by the
                    // inline smali compiler ("Collection is empty" downstream —
                    // verified locally and on-device).
                    "Z" -> run {
                        val opcode = if (reg <= 15) "const/4" else "const/16"
                        append("$opcode v$reg, ${if (desired) "0x1" else "0x0"}\n")
                    }
                    "Ljava/lang/Boolean;" -> append(
                        "sget-object v$reg, Ljava/lang/Boolean;->${if (desired) "TRUE" else "FALSE"}:Ljava/lang/Boolean;\n"
                    )
                    else -> skippedParams.add("$key (#$paramIndex, $paramType)")
                }
            }
        }.trim()

        if (injection.isNotEmpty()) {
            plannedInjections.add(index to injection)
            println("$logTag: planned invoke @#$index:\n$injection")
        }
    }

    if (plannedInjections.isEmpty()) {
        throw PatchException(
            "$logTag: no Account <init> call site found inside fromJson. " +
                "Re-verify the adapter class in a fresh apktool dump."
        )
    }

    // Apply from the END so earlier instruction indices stay valid while the method grows.
    plannedInjections
        .sortedByDescending { it.first }
        .forEach { (index, smali) -> fromJsonMethod.addInstructions(index, smali) }

    println("$logTag: patched ${plannedInjections.size} Account construction site(s).")
    if (skippedParams.isNotEmpty()) {
        println("$logTag: skipped non-boolean/non-boxed params: ${skippedParams.distinct()}")
    }
}
