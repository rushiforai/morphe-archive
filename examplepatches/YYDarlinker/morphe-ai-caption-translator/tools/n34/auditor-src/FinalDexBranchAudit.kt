package validation

import java.io.File
import kotlin.system.exitProcess

/**
 * N27r final-artifact audit entry point.
 *
 * usage:
 *   FinalDexBranchAuditKt --input &lt;apk|mpe|mpp|dex&gt; [--report report.txt] [--require-ai true|false]
 *                         [--label name]
 *
 * Exit code is non-zero as soon as anything is wrong: an invalid branch target, a code-unit
 * accounting mismatch between dexlib2 and the raw `code_item`, an unreadable DEX entry, a source
 * DEX method that was silently skipped, or a host-constructor binding that does not land on the real
 * `return-void`. This runs on the bytes that were written to disk, never on an in-memory instruction
 * list, so an assembled snippet cannot mask a broken serialised branch.
 */
object FinalDexBranchAudit {

    private val hex = DexBranchAudit::hex

    /** Runs the whole audit, prints it, optionally writes it to [report], and returns success. */
    fun audit(input: File, requireAi: Boolean, report: File?, label: String): Boolean {
        val lines = ArrayList<String>()
        fun emit(line: String) {
            println(line)
            lines += line
        }

        var ok = false
        try {
            val selfTest = DexBranchAudit.selfTest()
            for (line in selfTest.lines) emit(line)
            if (!selfTest.ok) {
                emit("FAIL branch_audit_selftest mutation_not_rejected")
                ok = false
                report?.let { destination ->
                    destination.parentFile?.mkdirs()
                    destination.writeText(lines.joinToString("\n") + "\n")
                }
                return false
            }
            val units = DexBranchAudit.units(input)
            val fileSha = DexBranchAudit.sha256(input.readBytes())
            emit(
                "FINAL_DEX_BRANCH_AUDIT input=${input.absolutePath} label=$label bytes=${input.length()} " +
                    "sha256=$fileSha dex_units=${units.size} require_ai=$requireAi " +
                    "scan=dexlib2-code-unit-map+raw-code_item-crosscheck"
            )
            if (units.isEmpty()) {
                emit("FAIL no_dex_entry_found input=${input.absolutePath}")
                ok = false
            } else {
                var failures = 0
                val reports = units.map { DexBranchAudit.audit(it) }
                for (unit in reports) {
                    emit(
                        "DEX dex=${unit.label} sha256=${unit.sha256} classes=${unit.classes} methods=${unit.methods} " +
                            "methods_with_code=${unit.methodsWithCode} raw_methods_with_code=${unit.rawMethodsWithCode} " +
                            "code_unit_checks=${unit.codeUnitChecks} branch_edges=${unit.branchEdges} " +
                            "switch_cases=${unit.switchCases} payloads=${unit.payloads} try_blocks=${unit.tryBlocks} " +
                            "invalid=${unit.violations.size} problems=${unit.failures.size}"
                    )
                    for (edge in unit.violations.take(MAX_PRINTED_VIOLATIONS)) {
                        emit(
                            "FAIL_BRANCH dex=${edge.dex} class=${edge.classType} method=${edge.method} kind=${edge.kind} " +
                                "source_pc=${hex(edge.sourcePc)} signed_offset=${edge.signedOffset} " +
                                "target_pc=${hex(edge.targetPc)} target_opcode=${edge.targetOpcode} " +
                                "target_valid=false reason=${edge.reason}"
                        )
                    }
                    if (unit.violations.size > MAX_PRINTED_VIOLATIONS) {
                        emit("FAIL_BRANCH_TRUNCATED dex=${unit.label} printed=$MAX_PRINTED_VIOLATIONS of ${unit.violations.size}")
                    }
                    for (problem in unit.failures.filterNot { it.startsWith("invalid_branch ") }.take(MAX_PRINTED_PROBLEMS)) {
                        emit("FAIL_DEX dex=${unit.label} problem=$problem")
                    }
                    failures += unit.failures.size
                }
                val totalMethods = reports.sumOf { it.methods }
                val totalEdges = reports.sumOf { it.branchEdges }
                val totalCases = reports.sumOf { it.switchCases }
                val totalTry = reports.sumOf { it.tryBlocks }
                val totalInvalid = reports.sumOf { it.violations.size }

                val binding = ControlsHookBindingAudit.audit(units, requireAi)
                for (item in binding.bindings) {
                    emit(
                        "CONTROLS_BINDING dex=${item.dex} model=${item.model} constructor=${item.constructor} " +
                            "reader=${item.reader} state_field=${item.stateField} factory=${item.factory} " +
                            "holder_field=${item.holderField} owner_register=v${item.ownerRegister} " +
                            "value_register=v${item.valueRegister} register_count=${item.registerCount} " +
                            "ai_callback_count=${item.aiCallbackCount} official_hook_count=${item.officialCallbackCount}"
                    )
                    for (line in item.pcTable) emit(line)
                    for (line in item.path) emit(line)
                    emit(
                        "GUARD dex=${item.dex} source_pc=${hex(item.guardPc)} opcode=${item.guardOpcode} " +
                            "signed_offset=${item.guardSignedOffset} target_pc=${hex(item.guardTargetPc)} " +
                            "target_opcode=${item.guardTargetOpcode} target_is_method_last=${item.guardTargetIsMethodLast} " +
                            "same_method=true"
                    )
                    for (problem in item.failures) emit("FAIL_BINDING dex=${item.dex} model=${item.model} problem=$problem")
                }
                for (problem in binding.failures) emit("FAIL_BINDING problem=$problem")

                emit(
                    "SUMMARY label=$label dex_units=${reports.size} classes=${reports.sumOf { it.classes }} " +
                        "methods=$totalMethods branch_edges=$totalEdges switch_cases=$totalCases try_blocks=$totalTry " +
                        "invalid_branches=$totalInvalid dex_problems=${failures - totalInvalid} " +
                        "binding_failures=${binding.failures.size + binding.bindings.sumOf { it.failures.size }}"
                )
                ok = failures == 0 && totalInvalid == 0 && binding.ok
                if (ok) {
                    emit("DEX_BRANCH_AUDIT_PASS label=$label dex_units=${reports.size} invalid_branches=0")
                } else {
                    emit("DEX_BRANCH_AUDIT_FAIL label=$label invalid_branches=$totalInvalid dex_problems=${failures - totalInvalid} binding=${binding.ok}")
                }
            }
        } catch (error: Throwable) {
            emit("FAIL audit_exception ${error.javaClass.name}: ${error.message}")
            ok = false
        }
        report?.let { destination ->
            destination.parentFile?.mkdirs()
            destination.writeText(lines.joinToString("\n") + "\n")
        }
        return ok
    }

    private const val MAX_PRINTED_VIOLATIONS = 200
    private const val MAX_PRINTED_PROBLEMS = 200
}

fun main(args: Array<String>) {
    val values = args.toList().chunked(2).associate { it[0].removePrefix("--") to it[1] }
    val input = File(values.getValue("input")).canonicalFile
    check(input.isFile) { "Input not found: ${input.absolutePath}" }
    val requireAi = values["require-ai"]?.toBooleanStrictOrNull() ?: true
    val report = values["report"]?.let { File(it).canonicalFile }
    val label = values["label"] ?: input.name
    if (!FinalDexBranchAudit.audit(input, requireAi, report, label)) exitProcess(1)
}
