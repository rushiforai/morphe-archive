package validation

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.nio.ByteBuffer

/**
 * N27r host-constructor audit.
 *
 * <p>Checks the semantics the AI caption controls-avoidance injection has to keep inside YouTube's
 * entity-model constructor: the null guard must branch to the real `return-void`, the non-null path
 * must reload the holder from the owner, read the int state field, convert it through the model's own
 * enum factory, hand the result to the AI callback and fall into that same return, and neither the AI
 * callback nor the official player-controls hook may be duplicated.</p>
 *
 * <p>The model is identified the way the delivery can actually be identified: the one host method
 * that references the AI observer through a real method reference, cross-checked against the same
 * reader shape the production fingerprint uses (public no-arg object reader over an int state field
 * and a static `(I)` factory returning the visibility enum). No obfuscated class name is hard-coded;
 * the real one is only reported for cross-checking.</p>
 */
object ControlsHookBindingAudit {

    const val AI_HOOK_CLASS = "Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHookV2;"
    const val AI_CALLBACK = "onPlayerControlsVisibility"
    const val OFFICIAL_HOOK_CLASS = "Lapp/morphe/extension/youtube/patches/PlayerControlsVisibilityHookPatch;"
    const val OFFICIAL_CALLBACK = "setPlayerControlsVisibility"
    private const val ENUM = "Ljava/lang/Enum;"

    private val hex = DexBranchAudit::hex

    class Reader(
        val classType: String,
        val method: Method,
        val stateField: FieldReference,
        val factory: MethodReference,
    )

    data class Site(val dex: String, val model: ClassDef, val constructor: Method)

    data class Binding(
        val dex: String,
        val model: String,
        val constructor: String,
        val reader: String,
        val stateField: String,
        val factory: String,
        val holderField: String,
        val ownerRegister: Int,
        val valueRegister: Int,
        val registerCount: Int,
        val guardPc: Int,
        val guardOpcode: String,
        val guardSignedOffset: Int,
        val guardTargetPc: Int,
        val guardTargetOpcode: String,
        val guardTargetIsMethodLast: Boolean,
        val path: List<String>,
        val pcTable: List<String>,
        val aiCallbackCount: Int,
        val officialCallbackCount: Int,
        val failures: List<String>,
    ) {
        val ok: Boolean get() = failures.isEmpty()
    }

    data class Result(val bindings: List<Binding>, val failures: List<String>) {
        val ok: Boolean get() = failures.isEmpty() && bindings.all { it.ok }
    }

    private fun classesOf(unit: DexBranchAudit.DexUnit): List<ClassDef> =
        DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(unit.bytes)).classes.toList()

    private fun referencesAiCallback(method: Method): Boolean =
        method.implementation?.instructions?.any {
            val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == AI_HOOK_CLASS && reference.name == AI_CALLBACK
        } ?: false

    /** The production fingerprint's shape: public no-arg reader over an int field and an `(I)` factory. */
    private fun readerShape(classesByUnit: Map<String, List<ClassDef>>, enumOwners: Set<String>, cls: ClassDef): Reader? {
        for (method in cls.methods) {
            if (method.parameterTypes.isNotEmpty()) continue
            if (!AccessFlags.PUBLIC.isSet(method.accessFlags)) continue
            if (AccessFlags.STATIC.isSet(method.accessFlags)) continue
            val returnType = method.returnType.toString()
            if (returnType !in enumOwners) continue
            val implementation = method.implementation ?: continue
            val instructions = DexBranchAudit.MethodCode.of(implementation).instructions
            for (i in 0 until instructions.size - 1) {
                if (instructions[i].opcode != Opcode.IGET) continue
                val field = (instructions[i] as? ReferenceInstruction)?.reference as? FieldReference ?: continue
                if (field.type != "I") continue
                if (instructions[i + 1].opcode != Opcode.INVOKE_STATIC) continue
                val factory = (instructions[i + 1] as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                if (factory.parameterTypes.map { it.toString() } != listOf("I")) continue
                if (factory.returnType.toString() != returnType) continue
                return Reader(cls.type, method, field, factory)
            }
        }
        return null
    }

    fun audit(units: List<DexBranchAudit.DexUnit>, requireAi: Boolean): Result {
        val classesByUnit = LinkedHashMap<String, List<ClassDef>>()
        for (unit in units) classesByUnit[unit.label] = classesOf(unit)
        val byType = HashMap<String, ClassDef>()
        for (classes in classesByUnit.values) for (cls in classes) byType[cls.type] = cls

        // Every class that is a subclass of java.lang.Enum, found by walking the real hierarchy.
        val enumOwners = HashSet<String>()
        for (cls in byType.values) {
            var current: ClassDef? = cls
            val seen = HashSet<String>()
            while (current != null && seen.add(current.type)) {
                if (current.superclass == ENUM) {
                    enumOwners += cls.type
                    break
                }
                current = current.superclass?.let { byType[it.toString()] }
            }
        }

        // Both directions of the same anchor: the delivery is identified by the real method reference
        // our own bytecode writes, and the class it lands in must still match the reader fingerprint.
        val sites = ArrayList<Site>()
        for ((label, classes) in classesByUnit) {
            for (cls in classes) {
                if (cls.type == AI_HOOK_CLASS) continue
                for (method in cls.methods) {
                    if (referencesAiCallback(method)) sites += Site(label, cls, method)
                }
            }
        }
        if (sites.size > 1) {
            return Result(emptyList(), listOf("ai_callback_call_sites=${sites.size} expected<=1 " +
                sites.take(5).joinToString(",") { "${it.dex}:${it.model.type}->${DexBranchAudit.signature(it.constructor)}" }))
        }
        if (requireAi && sites.isEmpty()) return Result(emptyList(), listOf("ai_callback_missing"))
        if (!requireAi) {
            if (sites.isNotEmpty()) return Result(emptyList(), listOf("ai_callback_present_without_ai_composition"))
            // The N27 observer fragment always ends in the AI callback invoke, so "no host call site
            // anywhere" is the precise statement that nothing of ours was injected. Nothing else is
            // asserted here: the validator must not require an injection that the AI root never made.
            return Result(emptyList(), emptyList())
        }

        val site = sites.single()
        val model = site.model
        val constructor = site.constructor
        val reader = readerShape(classesByUnit, enumOwners, model)
        if (reader == null) {
            return Result(emptyList(), listOf("model_does_not_match_controls_reader_fingerprint model=${model.type}"))
        }
        val implementation = constructor.implementation
            ?: return Result(emptyList(), listOf("constructor_has_no_code model=${model.type}"))
        val code = DexBranchAudit.MethodCode.of(implementation)
        val constructorSignature = DexBranchAudit.signature(constructor)
        val problems = ArrayList<String>()

        fun full(instruction: Instruction): String {
            val reference = (instruction as? ReferenceInstruction)?.reference?.toString() ?: ""
            val registers = when (instruction) {
                is FiveRegisterInstruction -> (0 until instruction.registerCount)
                    .joinToString(",") { "v" + registerAt(instruction, it) }
                is OneRegisterInstruction -> "v" + instruction.registerA
                is RegisterRangeInstruction -> "range{v${instruction.startRegister}..v" +
                    "${instruction.startRegister + instruction.registerCount - 1}}"
                else -> ""
            }
            return listOf(instruction.opcode.name.lowercase().replace('_', '-'), registers, reference)
                .filter { it.isNotEmpty() }.joinToString(" ")
        }

        val pcTable = code.instructions.indices.map { i ->
            "PC dex=${site.dex} class=${model.type} method=$constructorSignature index=$i pc=${hex(code.pcs[i])} " +
                "width=${code.instructions[i].codeUnits} opcode=${code.instructions[i].opcode.name} ${full(code.instructions[i])}"
        }

        val stores = code.instructions.indices.filter { i ->
            code.instructions[i].opcode == Opcode.IPUT_OBJECT &&
                ((code.instructions[i] as? ReferenceInstruction)?.reference as? FieldReference)?.type ==
                reader.stateField.definingClass
        }
        if (stores.size != 1) problems += "holder_store_count=${stores.size} expected=1"
        if (code.instructions.isEmpty() || code.instructions.last().opcode != Opcode.RETURN_VOID) {
            problems += "constructor_does_not_end_in_return_void"
        }
        val storeIndex = stores.firstOrNull() ?: -1
        if (stores.size == 1 && storeIndex < code.instructions.size - 1 &&
            code.instructions.subList(storeIndex + 1, code.instructions.size - 1).any { it.opcode.name.startsWith("return") }
        ) {
            problems += "constructor_can_return_before_holder_store"
        }
        val store = code.instructions.getOrNull(storeIndex) as? TwoRegisterInstruction
        val holderField = (store as? ReferenceInstruction)?.reference as? FieldReference
        val valueRegister = store?.registerA ?: -1
        val ownerRegister = store?.registerB ?: -1

        val aiIndices = code.instructions.indices.filter { i ->
            val reference = (code.instructions[i] as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == AI_HOOK_CLASS && reference.name == AI_CALLBACK
        }
        val officialIndices = code.instructions.indices.filter { i ->
            val reference = (code.instructions[i] as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == OFFICIAL_HOOK_CLASS && reference.name == OFFICIAL_CALLBACK
        }
        if (aiIndices.size != 1) problems += "ai_callback_count=${aiIndices.size} expected=1"
        if (officialIndices.size > 1) problems += "official_hook_count=${officialIndices.size} expected<=1"

        var guardPc = -1
        var guardOpcode = "<absent>"
        var guardOffset = 0
        var guardTargetPc = -1
        var guardTargetOpcode = "<absent>"
        var guardTargetIsMethodLast = false
        val path = ArrayList<String>()

        if (aiIndices.size == 1) {
            val callback = aiIndices.single()
            val expected = intArrayOf(callback - 5, callback - 4, callback - 3, callback - 2, callback - 1, callback)
            val present = expected.all { it >= 0 && it < code.instructions.size }
            if (!present) problems += "ai_block_truncated callback_index=$callback instruction_count=${code.instructions.size}"
            if (present) {
                if (code.instructions[callback - 5].opcode != Opcode.IGET_OBJECT) {
                    problems += "path_missing_owner_reload at=${callback - 5}"
                } else {
                    val reload = code.instructions[callback - 5] as? ReferenceInstruction
                    if ((reload?.reference as? FieldReference) != holderField) {
                        problems += "reload_reads_wrong_field ref=${reload?.reference} expected=$holderField"
                    }
                }
                if (code.instructions[callback - 4].opcode != Opcode.IF_EQZ) {
                    problems += "path_missing_null_guard at=${callback - 4}"
                }
                if (code.instructions[callback - 3].opcode != Opcode.IGET) {
                    problems += "path_missing_state_read at=${callback - 3}"
                } else {
                    val stateRead = code.instructions[callback - 3] as? ReferenceInstruction
                    if ((stateRead?.reference as? FieldReference) != reader.stateField) {
                        problems += "state_read_wrong_field ref=${stateRead?.reference} expected=${reader.stateField}"
                    }
                }
                if (code.instructions[callback - 2].opcode != Opcode.INVOKE_STATIC) {
                    problems += "path_missing_factory at=${callback - 2}"
                } else {
                    val factory = code.instructions[callback - 2] as? ReferenceInstruction
                    if ((factory?.reference as? MethodReference) != reader.factory) {
                        problems += "factory_call_wrong_target ref=${factory?.reference} expected=${reader.factory}"
                    }
                }
                if (code.instructions[callback - 1].opcode != Opcode.MOVE_RESULT_OBJECT) {
                    problems += "move_result_not_adjacent_before_callback"
                }

                // The value produced by the factory must be exactly what the AI callback consumes, and
                // no register may change type or leave the declared register file between the two calls.
                val factoryCall = code.instructions[callback - 2] as? FiveRegisterInstruction
                val moveResult = code.instructions[callback - 1] as? OneRegisterInstruction
                val callbackCall = code.instructions[callback] as? FiveRegisterInstruction
                val stateRead = code.instructions[callback - 3] as? TwoRegisterInstruction
                val reload = code.instructions[callback - 5] as? TwoRegisterInstruction
                if (factoryCall != null && moveResult != null && callbackCall != null) {
                    val produced = factoryCall.registerC
                    if (factoryCall.registerCount != 1) problems += "factory_argument_words=${factoryCall.registerCount} expected=1"
                    if (moveResult.registerA != produced) problems += "move_result_register=v${moveResult.registerA} factory_result=v$produced"
                    if (callbackCall.registerCount != 1) problems += "callback_argument_words=${callbackCall.registerCount} expected=1"
                    if (callbackCall.registerC != moveResult.registerA) {
                        problems += "callback_register=v${callbackCall.registerC} move_result=v${moveResult.registerA}"
                    }
                    if (stateRead != null && stateRead.registerA != produced) {
                        problems += "state_read_destination=v${stateRead.registerA} factory_argument=v$produced"
                    }
                    if (reload != null && stateRead != null && reload.registerA != stateRead.registerB) {
                        problems += "reload_register=v${reload.registerA} state_holder_register=v${stateRead.registerB}"
                    }
                    val used = listOfNotNull(
                        reload?.registerA, reload?.registerB, stateRead?.registerA, stateRead?.registerB,
                        produced, moveResult.registerA, callbackCall.registerC,
                    )
                    val outOfRange = used.filter { it < 0 || it >= implementation.registerCount }
                    if (outOfRange.isNotEmpty()) {
                        problems += "register_out_of_range=$outOfRange register_count=${implementation.registerCount}"
                    }
                }

                val guard = code.instructions[callback - 4] as? OffsetInstruction
                if (guard != null) {
                    guardPc = code.pcs[callback - 4]
                    guardOpcode = code.instructions[callback - 4].opcode.name
                    guardOffset = guard.codeOffset
                    guardTargetPc = guardPc + guardOffset
                    val targetIndex = code.indexAtPc[guardTargetPc]
                    if (targetIndex == null) {
                        problems += "guard_target_not_instruction_start target_pc=${hex(guardTargetPc)}"
                        guardTargetOpcode = "<not-an-opcode>"
                    } else {
                        guardTargetOpcode = code.instructions[targetIndex].opcode.name
                        if (code.instructions[targetIndex].opcode != Opcode.RETURN_VOID) {
                            problems += "guard_target_not_return_void pc=${hex(guardTargetPc)} opcode=$guardTargetOpcode"
                        }
                        if (targetIndex != callback + 1) {
                            problems += "empty_path_does_not_fall_into_guarded_return target_index=$targetIndex expected=${callback + 1}"
                        }
                        guardTargetIsMethodLast = targetIndex == code.instructions.size - 1
                    }
                }
                for (index in expected) {
                    if (index < 0 || index >= code.instructions.size) continue
                    path += "PATH index=$index pc=${hex(code.pcs[index])} width=${code.instructions[index].codeUnits} " +
                        "opcode=${code.instructions[index].opcode.name} ${full(code.instructions[index])}"
                }
            }
        }

        return Result(
            listOf(
                Binding(
                    dex = site.dex,
                    model = model.type,
                    constructor = constructorSignature,
                    reader = DexBranchAudit.signature(reader.method),
                    stateField = "${reader.stateField.definingClass}->${reader.stateField.name}:${reader.stateField.type}",
                    factory = reader.factory.toString(),
                    holderField = holderField?.toString() ?: "<unresolved>",
                    ownerRegister = ownerRegister,
                    valueRegister = valueRegister,
                    registerCount = implementation.registerCount,
                    guardPc = guardPc,
                    guardOpcode = guardOpcode,
                    guardSignedOffset = guardOffset,
                    guardTargetPc = guardTargetPc,
                    guardTargetOpcode = guardTargetOpcode,
                    guardTargetIsMethodLast = guardTargetIsMethodLast,
                    path = path,
                    pcTable = pcTable,
                    aiCallbackCount = aiIndices.size,
                    officialCallbackCount = officialIndices.size,
                    failures = problems.distinct(),
                )
            ),
            emptyList(),
        )
    }

    private fun registerAt(instruction: FiveRegisterInstruction, index: Int): Int = when (index) {
        0 -> instruction.registerC
        1 -> instruction.registerD
        2 -> instruction.registerE
        3 -> instruction.registerF
        else -> instruction.registerG
    }
}
