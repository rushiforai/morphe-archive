package validation

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.MethodImplementation
import com.android.tools.smali.dexlib2.iface.MethodParameter
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload
import com.android.tools.smali.dexlib2.iface.instruction.formats.PackedSwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.formats.SparseSwitchPayload
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import java.io.ByteArrayInputStream
import java.io.File
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest
import java.util.zip.ZipInputStream

/**
 * Final-artifact DEX control-flow auditor.
 *
 * <p>N27 shipped a class that ART rejected with
 * `VerifyError: Verifier rejected class bfec: void bfec.&lt;init&gt;(bfed): [0x10] target dex pc 0xd is
 * not at instruction start`. The old N27 hook check assembled its own smali fragment and merged it
 * into a Java ArrayList, so it never saw the code units the patcher actually serialised. This
 * auditor reads a real container from disk (delivered APK / MPE / MPP / raw DEX), rebuilds every
 * method's 16-bit code-unit map and rejects any branch whose target is not an executable opcode
 * start inside that same method.</p>
 *
 * <p>Address unit is the DEX code unit (16 bit), not a byte and not an instruction index. The
 * accounting is cross-checked against the raw `code_item.insns_size` of the same file, so a
 * mis-sized payload or an unreadable entry can never be reported as PASS.</p>
 */
object DexBranchAudit {

    private val ROOT_DEX = Regex("""classes\d*\.dex""")

    /** One instruction stream that has to be scanned, already extracted from its container. */
    class DexUnit(val label: String, val bytes: ByteArray)

    /** Raw `code_item` facts read without dexlib2: the true code size and where `insns` starts. */
    class RawCode(val insnsSize: Int, val insnsOffset: Int)

    /** A single control-flow edge, valid or not, with every field the audit has to report. */
    data class Edge(
        val dex: String,
        val classType: String,
        val method: String,
        val kind: String,
        val sourcePc: Int,
        val signedOffset: Int,
        val targetPc: Int,
        val targetOpcode: String,
        val valid: Boolean,
        val reason: String,
    )

    data class UnitReport(
        val label: String,
        val sha256: String,
        val classes: Int,
        val methods: Int,
        val methodsWithCode: Int,
        val rawMethodsWithCode: Int,
        val branchEdges: Int,
        val switchCases: Int,
        val payloads: Int,
        val tryBlocks: Int,
        val codeUnitChecks: Int,
        val edges: List<Edge>,
        val failures: List<String>,
    ) {
        val violations: List<Edge> get() = edges.filter { !it.valid }
    }

    /** Instruction list plus its code-unit address map; every address below is a 16-bit unit. */
    class MethodCode(val instructions: List<Instruction>, val pcs: IntArray, val size: Int, val indexAtPc: Map<Int, Int>) {
        companion object {
            fun of(implementation: MethodImplementation): MethodCode {
                val instructions = implementation.instructions.toList()
                val pcs = IntArray(instructions.size)
                var pc = 0
                for (i in instructions.indices) {
                    pcs[i] = pc
                    pc += instructions[i].codeUnits
                }
                val indexAtPc = HashMap<Int, Int>(instructions.size * 2)
                for (i in instructions.indices) indexAtPc[pcs[i]] = i
                return MethodCode(instructions, pcs, pc, indexAtPc)
            }
        }

        fun isPayload(instruction: Instruction): Boolean =
            instruction is PackedSwitchPayload || instruction is SparseSwitchPayload || instruction is ArrayPayload

        fun containsPc(pc: Int): Instruction? {
            var candidate: Instruction? = null
            for (i in instructions.indices) {
                if (pcs[i] > pc) break
                candidate = instructions[i]
            }
            return candidate
        }
    }

    fun hex(value: Int): String = "0x" + Integer.toHexString(value)

    fun sha256(bytes: ByteArray): String =
        MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }

    fun signature(method: Method): String =
        method.name + "(" + method.parameterTypes.joinToString("") { it.toString() } + ")" + method.returnType

    /** Walks a container from disk and returns every DEX instruction stream it really holds. */
    fun units(file: File): List<DexUnit> {
        val out = ArrayList<DexUnit>()
        // A delivered MPE is a raw DEX that does not necessarily end in `.dex`, so the magic decides.
        val head = ByteArray(8)
        val read = file.inputStream().use { it.read(head) }
        if (read == head.size && String(head, 0, 4, Charsets.US_ASCII) == "dex\n") {
            out += DexUnit(file.name, file.readBytes())
            return out
        }
        file.inputStream().use { stream ->
            collect(file.name, ZipInputStream(stream), out)
        }
        return out
    }

    private fun collect(prefix: String, zip: ZipInputStream, out: MutableList<DexUnit>) {
        var entry = zip.nextEntry
        while (entry != null) {
            if (!entry.isDirectory) {
                val name = entry.name
                val bytes = zip.readBytes()
                if (ROOT_DEX.matches(name)) {
                    out += DexUnit("$prefix!$name", bytes)
                } else if (name.endsWith(".mpe") || name.endsWith(".mpp")) {
                    if (bytes.size >= 8 && String(bytes, 0, 4, Charsets.US_ASCII) == "dex\n") {
                        out += DexUnit("$prefix!$name", bytes)
                    } else {
                        collect("$prefix!$name", ZipInputStream(ByteArrayInputStream(bytes)), out)
                    }
                }
            }
            entry = zip.nextEntry
        }
    }

    fun audit(unit: DexUnit): UnitReport {
        val sha = sha256(unit.bytes)
        val failures = ArrayList<String>()
        val edges = ArrayList<Edge>()
        var classes = 0
        var methods = 0
        var methodsWithCode = 0
        var branchEdges = 0
        var switchCases = 0
        var payloads = 0
        var tryBlocks = 0
        var codeUnitChecks = 0

        val raw = try {
            RawDexIndex.parse(unit.bytes)
        } catch (error: Throwable) {
            failures += "raw_parse_failed dex=${unit.label} error=${error.javaClass.simpleName}:${error.message}"
            emptyMap()
        }
        val dex = try {
            DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(unit.bytes))
        } catch (error: Throwable) {
            failures += "dexlib2_load_failed dex=${unit.label} error=${error.javaClass.simpleName}:${error.message}"
            return UnitReport(unit.label, sha, 0, 0, 0, raw.size, 0, 0, 0, 0, 0, edges, failures)
        }
        val seenRaw = HashSet<String>()
        var rawWithCode = 0

        for (classDef in dex.classes) {
            classes++
            for (method in classDef.methods) {
                methods++
                val implementation = method.implementation ?: continue
                methodsWithCode++
                val methodName = signature(method)
                val key = "${classDef.type}->$methodName"
                seenRaw += key
                val code = MethodCode.of(implementation)
                if (code.instructions.isEmpty()) {
                    failures += "empty_code dex=${unit.label} class=${classDef.type} method=$methodName"
                    continue
                }
                val declared = raw[key]?.insnsSize
                if (declared == null) {
                    failures += "code_item_missing_in_raw_dex dex=${unit.label} class=${classDef.type} method=$methodName"
                } else {
                    codeUnitChecks++
                    if (declared != code.size) {
                        failures += "code_unit_mismatch dex=${unit.label} class=${classDef.type} method=$methodName " +
                            "dexlib2=${code.size} raw_insns_size=$declared"
                    }
                }

                val payloadAt = HashMap<Int, Instruction>()
                for (i in code.instructions.indices) {
                    val instruction = code.instructions[i]
                    if (code.isPayload(instruction)) {
                        payloadAt[code.pcs[i]] = instruction
                        payloads++
                        if (code.pcs[i] % 2 != 0) {
                            failures += "payload_misaligned dex=${unit.label} class=${classDef.type} method=$methodName " +
                                "pc=${hex(code.pcs[i])}"
                        }
                    }
                }

                fun record(
                    kind: String,
                    sourcePc: Int,
                    offset: Int,
                    targetPc: Int,
                    valid: Boolean,
                    reason: String,
                ) {
                    val opcode = if (valid) code.indexAtPc[targetPc]?.let { code.instructions[it].opcode.name } ?: "?" else "<none>"
                    edges += Edge(unit.label, classDef.type, methodName, kind, sourcePc, offset, targetPc, opcode, valid, reason)
                }

                fun describeInvalid(targetPc: Int): String {
                    if (targetPc < 0 || targetPc >= code.size) {
                        return "target_outside_method code_size=${hex(code.size)}"
                    }
                    if (code.indexAtPc.containsKey(targetPc)) {
                        val at = code.indexAtPc.getValue(targetPc)
                        if (code.isPayload(code.instructions[at])) {
                            return "target_is_payload opcode=${code.instructions[at].opcode.name}"
                        }
                        return "unexpected"
                    }
                    val holder = code.containsPc(targetPc)
                    return if (holder == null) "target_before_first_instruction" else {
                        val holderPc = code.pcs[code.instructions.indexOfFirst { it === holder }]
                        "target_inside_instruction containing_pc=${hex(holderPc)} containing_width=${holder.codeUnits} " +
                            "containing_opcode=${holder.opcode.name}"
                    }
                }

                for (i in code.instructions.indices) {
                    val instruction = code.instructions[i]
                    val sourcePc = code.pcs[i]
                    when (instruction.opcode) {
                        Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH -> {
                            val offset = (instruction as? OffsetInstruction)?.codeOffset ?: continue
                            val targetPc = sourcePc + offset
                            branchEdges++
                            val payload = payloadAt[targetPc]
                            val wantedPacked = instruction.opcode == Opcode.PACKED_SWITCH
                            when {
                                payload == null -> record("switch-payload", sourcePc, offset, targetPc, false, describeInvalid(targetPc))
                                targetPc % 2 != 0 -> record("switch-payload", sourcePc, offset, targetPc, false, "payload_not_4byte_aligned")
                                wantedPacked && payload !is PackedSwitchPayload ->
                                    record("switch-payload", sourcePc, offset, targetPc, false, "payload_kind_mismatch expected=packed")
                                !wantedPacked && payload !is SparseSwitchPayload ->
                                    record("switch-payload", sourcePc, offset, targetPc, false, "payload_kind_mismatch expected=sparse")
                                else -> record("switch-payload", sourcePc, offset, targetPc, true, "payload_ok")
                            }
                            if (payload is SwitchPayload) {
                                for (element in payload.switchElements) {
                                    switchCases++
                                    // Case offsets are relative to the switch instruction, never to the payload.
                                    val caseTarget = sourcePc + element.offset
                                    val valid = code.indexAtPc.containsKey(caseTarget) &&
                                        !code.isPayload(code.instructions[code.indexAtPc.getValue(caseTarget)])
                                    record(
                                        "switch-case",
                                        sourcePc,
                                        element.offset,
                                        caseTarget,
                                        valid,
                                        if (valid) "case_target_ok" else describeInvalid(caseTarget),
                                    )
                                }
                            }
                        }
                        Opcode.FILL_ARRAY_DATA -> {
                            val offset = (instruction as? OffsetInstruction)?.codeOffset ?: continue
                            val targetPc = sourcePc + offset
                            branchEdges++
                            val payload = payloadAt[targetPc]
                            when {
                                payload == null -> record("fill-array-data", sourcePc, offset, targetPc, false, describeInvalid(targetPc))
                                targetPc % 2 != 0 -> record("fill-array-data", sourcePc, offset, targetPc, false, "payload_not_4byte_aligned")
                                payload !is ArrayPayload ->
                                    record("fill-array-data", sourcePc, offset, targetPc, false, "payload_kind_mismatch expected=array")
                                else -> record("fill-array-data", sourcePc, offset, targetPc, true, "payload_ok")
                            }
                        }
                        else -> {
                            if (instruction !is OffsetInstruction) continue
                            val offset = instruction.codeOffset
                            val targetPc = sourcePc + offset
                            branchEdges++
                            val kind = if (instruction.opcode.name.startsWith("goto")) "goto" else "if"
                            val valid = code.indexAtPc.containsKey(targetPc) &&
                                !code.isPayload(code.instructions[code.indexAtPc.getValue(targetPc)])
                            record(kind, sourcePc, offset, targetPc, valid, if (valid) "instruction_start" else describeInvalid(targetPc))
                        }
                    }
                }

                // Try/catch ranges keep their legal shape: a handler is an opcode boundary, a range
                // end may be the legal end of the method but may never leave the code range.
                for (tryBlock in implementation.tryBlocks) {
                    tryBlocks++
                    val start = tryBlock.startCodeAddress
                    val end = start + tryBlock.codeUnitCount
                    if (!code.indexAtPc.containsKey(start)) {
                        failures += "try_start_not_instruction_start dex=${unit.label} class=${classDef.type} " +
                            "method=$methodName start_pc=${hex(start)}"
                    }
                    if (end > code.size) {
                        failures += "try_end_outside_method dex=${unit.label} class=${classDef.type} " +
                            "method=$methodName end_pc=${hex(end)} code_size=${hex(code.size)}"
                    } else if (end != code.size && !code.indexAtPc.containsKey(end)) {
                        failures += "try_end_not_instruction_start dex=${unit.label} class=${classDef.type} " +
                            "method=$methodName end_pc=${hex(end)}"
                    }
                    for (handler in tryBlock.exceptionHandlers) {
                        val handlerPc = handler.handlerCodeAddress
                        if (!code.indexAtPc.containsKey(handlerPc)) {
                            failures += "handler_not_instruction_start dex=${unit.label} class=${classDef.type} " +
                                "method=$methodName handler_pc=${hex(handlerPc)}"
                        }
                    }
                }
            }
        }

        rawWithCode = raw.size
        for ((key, codeItem) in raw) {
            if (key !in seenRaw) {
                failures += "raw_method_not_read dex=${unit.label} method=$key raw_insns_size=${codeItem.insnsSize}"
            }
        }
        if (methodsWithCode != rawWithCode) {
            failures += "method_code_count_mismatch dex=${unit.label} dexlib2=$methodsWithCode raw=$rawWithCode"
        }
        failures += violations(edges, unit.label)

        return UnitReport(
            label = unit.label,
            sha256 = sha,
            classes = classes,
            methods = methods,
            methodsWithCode = methodsWithCode,
            rawMethodsWithCode = rawWithCode,
            branchEdges = branchEdges,
            switchCases = switchCases,
            payloads = payloads,
            tryBlocks = tryBlocks,
            codeUnitChecks = codeUnitChecks,
            edges = edges,
            failures = failures,
        )
    }

    private fun violations(edges: List<Edge>, dex: String): List<String> =
        edges.filter { !it.valid }.map {
            "invalid_branch dex=$dex class=${it.classType} method=${it.method} kind=${it.kind} " +
                "source_pc=${hex(it.sourcePc)} signed_offset=${it.signedOffset} target_pc=${hex(it.targetPc)} " +
                "target_opcode=${it.targetOpcode} reason=${it.reason}"
        }

    /**
     * Independent code-unit ground truth: parses the DEX container directly (no dexlib2) and returns
     * `class->name(params)return` to the raw `code_item` of every method that has code.
     */
    private object RawDexIndex {
        fun parse(bytes: ByteArray): Map<String, RawCode> {
            require(bytes.size >= 112) { "DEX shorter than its header" }
            require(String(bytes, 0, 4, Charsets.US_ASCII) == "dex\n") { "not a DEX file" }
            val buffer = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)
            fun u4(offset: Int): Int = buffer.getInt(offset)

            val stringIdsSize = u4(0x38)
            val stringIdsOff = u4(0x3C)
            val typeIdsSize = u4(0x40)
            val typeIdsOff = u4(0x44)
            val protoIdsSize = u4(0x48)
            val protoIdsOff = u4(0x4C)
            val methodIdsSize = u4(0x58)
            val methodIdsOff = u4(0x5C)
            val classDefsSize = u4(0x60)
            val classDefsOff = u4(0x64)
            val fileSize = u4(0x20)
            require(fileSize == bytes.size) { "declared file_size=$fileSize actual=${bytes.size}" }

            val strings = arrayOfNulls<String>(stringIdsSize)
            fun string(index: Int): String {
                strings[index]?.let { return it }
                var cursor = u4(stringIdsOff + index * 4)
                while ((bytes[cursor].toInt() and 0x80) != 0) cursor++
                cursor++
                val start = cursor
                while (bytes[cursor].toInt() != 0) cursor++
                val value = String(bytes, start, cursor - start, Charsets.UTF_8)
                strings[index] = value
                return value
            }

            val types = arrayOfNulls<String>(typeIdsSize)
            fun type(index: Int): String {
                types[index]?.let { return it }
                val value = string(u4(typeIdsOff + index * 4))
                types[index] = value
                return value
            }

            fun parameters(offset: Int): String {
                if (offset == 0) return ""
                val count = u4(offset)
                val builder = StringBuilder()
                for (i in 0 until count) builder.append(type(buffer.getShort(offset + 4 + i * 2).toInt() and 0xFFFF))
                return builder.toString()
            }

            val protos = arrayOfNulls<String>(protoIdsSize)
            fun proto(index: Int): String {
                protos[index]?.let { return it }
                val base = protoIdsOff + index * 12
                val value = "(" + parameters(u4(base + 8)) + ")" + type(u4(base + 4))
                protos[index] = value
                return value
            }

            fun methodKey(index: Int): String {
                val base = methodIdsOff + index * 8
                val owner = type(buffer.getShort(base).toInt() and 0xFFFF)
                val name = string(u4(base + 4))
                return "$owner->$name${proto(buffer.getShort(base + 2).toInt() and 0xFFFF)}"
            }

            var cursor = classDefsOff
            val out = HashMap<String, RawCode>(classDefsSize * 8)
            for (i in 0 until classDefsSize) {
                val classDataOff = u4(cursor + 24)
                cursor += 32
                if (classDataOff == 0) continue
                var p = classDataOff
                fun uleb(): Int {
                    var result = 0
                    var shift = 0
                    while (true) {
                        val byte = bytes[p++].toInt() and 0xFF
                        result = result or ((byte and 0x7F) shl shift)
                        if (byte and 0x80 == 0) return result
                        shift += 7
                    }
                }
                val staticFields = uleb()
                val instanceFields = uleb()
                val directMethods = uleb()
                val virtualMethods = uleb()
                repeat(staticFields + instanceFields) {
                    uleb(); uleb()
                }
                // method_idx_diff restarts at zero for the virtual list, so the two lists are walked
                // separately instead of one running index across both.
                var methodIndex = 0
                repeat(directMethods) {
                    methodIndex += uleb()
                    uleb()
                    val codeOff = uleb()
                    if (codeOff != 0) out[methodKey(methodIndex)] = RawCode(u4(codeOff + 12), codeOff + 16)
                }
                methodIndex = 0
                repeat(virtualMethods) {
                    methodIndex += uleb()
                    uleb()
                    val codeOff = uleb()
                    if (codeOff != 0) out[methodKey(methodIndex)] = RawCode(u4(codeOff + 12), codeOff + 16)
                }
            }
            return out
        }
    }

    /** Raw code_item of one method, used by the built-in mutation self-test. */
    fun rawCode(bytes: ByteArray, methodKey: String): RawCode? = RawDexIndex.parse(bytes)[methodKey]

    class SelfTest(val ok: Boolean, val lines: List<String>)

    /**
     * Proves the auditor is not a no-op: a synthetic DEX with one real serialised branch is accepted,
     * and the same bytes with the branch operand retargeted into the middle of an instruction (or out
     * of the method) are rejected. Runs on serialised bytes, so it exercises exactly the path a
     * delivered APK takes.
     */
    fun selfTest(): SelfTest {
        val results = ArrayList<String>()
        val synthetic = SyntheticDex.build()
        val codeItem = rawCode(synthetic, SyntheticDex.METHOD_KEY)
            ?: return SelfTest(false, listOf("selftest_baseline_code_item_missing key=${SyntheticDex.METHOD_KEY}"))
        val baseline = audit(DexUnit("selftest-baseline.dex", synthetic))
        if (baseline.failures.isNotEmpty() || baseline.violations.isNotEmpty()) {
            return SelfTest(
                false,
                listOf("selftest_baseline_rejected failures=${baseline.failures} violations=${baseline.violations.size}"),
            )
        }
        results += "SELFTEST_BASELINE valid=true code_size=${hex(baseline.codeUnitChecks)} branches=${baseline.branchEdges}"

        // The 21t operand is the second code unit of the `if-eqz`, i.e. two bytes after its start.
        val operand = codeItem.insnsOffset + (SyntheticDex.BRANCH_PC + 1) * 2
        fun mutate(value: Int): ByteArray {
            val copy = synthetic.copyOf()
            copy[operand] = (value and 0xFF).toByte()
            copy[operand + 1] = ((value shr 8) and 0xFF).toByte()
            return copy
        }

        val inside = audit(DexUnit("selftest-inside-operand.dex", mutate(1)))
        val insideReason = inside.violations.firstOrNull()?.reason ?: "<none>"
        val insideOk = inside.violations.size == 1 && insideReason.startsWith("target_inside_instruction")
        results += "SELFTEST_MUTATION name=target_inside_operand target_pc=${hex(SyntheticDex.BRANCH_PC + 1)} " +
            "reason=$insideReason rejected=$insideOk"

        val outside = audit(DexUnit("selftest-out-of-method.dex", mutate(1000)))
        val outsideReason = outside.violations.firstOrNull()?.reason ?: "<none>"
        val outsideOk = outside.violations.size == 1 && outsideReason.startsWith("target_outside_method")
        results += "SELFTEST_MUTATION name=target_out_of_method target_pc=${hex(SyntheticDex.BRANCH_PC + 1000)} " +
            "reason=$outsideReason rejected=$outsideOk"

        return SelfTest(insideOk && outsideOk, results)
    }
}

/**
 * A tiny real DEX with exactly one serialised branch, used by [DexBranchAudit.selfTest]. It is written
 * by dexlib2's own writer, so the auditor reads the same kind of bytes a delivered APK contains.
 */
private object SyntheticDex {
    const val CLASS_TYPE = "Lvalidation/SyntheticBranch;"
    const val METHOD_KEY = "Lvalidation/SyntheticBranch;->probe()V"

    /** `const/4` occupies unit 0, so the `if-eqz` starts at unit 1 and its operand is unit 2. */
    const val BRANCH_PC = 1

    fun build(): ByteArray {
        val method = ImmutableMethod(
            CLASS_TYPE,
            "probe",
            emptyList<MethodParameter>(),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(1),
        ).toMutable()
        method.addInstructions(0, "const/4 v0, 0x1\nreturn-void")
        val target = method.implementation!!.instructions.last()
        method.addInstructionsWithLabels(
            1,
            "if-eqz v0, :yydarlinker_selftest_target",
            ExternalLabel("yydarlinker_selftest_target", target),
        )
        val classDef = ImmutableClassDef(
            CLASS_TYPE,
            AccessFlags.PUBLIC.value,
            "Ljava/lang/Object;",
            emptyList<String>(),
            null,
            emptyList(),
            emptyList(),
            emptyList(),
            listOf(method),
            emptyList(),
        )
        val dexFile = ImmutableDexFile(Opcodes.getDefault(), listOf(classDef))
        val temp = File.createTempFile("n27r-branch-selftest", ".dex")
        try {
            DexPool.writeTo(temp.absolutePath, dexFile)
            return temp.readBytes()
        } finally {
            temp.delete()
        }
    }
}
