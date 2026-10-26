package app.sqzass.patches.all.heavy

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.sqzass.patches.shared.forceInvokeResult
import app.sqzass.patches.shared.methodReferenceOf
import app.sqzass.patches.shared.patchMatchingMethods
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.util.logging.Logger

private val logger = Logger.getLogger("DexGuardStringDecryptPatch")

// Heuristic: short static String decryptors taking (String)/(String,int) or
// (byte[]) and returning String, containing xor arithmetic in a loop.
private val CANDIDATE_PARAMS = setOf(
    "Ljava/lang/String;",
    "Ljava/lang/String;I",
    "Ljava/lang/String;II",
    "[B",
)

private val XOR_OPCODES = setOf(
    Opcode.XOR_INT,
    Opcode.XOR_INT_2ADDR,
    Opcode.XOR_INT_LIT8,
    Opcode.XOR_INT_LIT16,
    Opcode.AGET,
    Opcode.AGET_BYTE,
    Opcode.AGET_CHAR,
)

private fun signatureOf(method: Method): String =
    method.parameters.joinToString("") { it.type }

private fun isDecryptorCandidate(method: Method): Boolean {
    if (method.returnType != "Ljava/lang/String;") return false
    if (method.implementation == null) return false
    if (!AccessFlags.STATIC.isSet(method.accessFlags)) return false
    if (signatureOf(method) !in CANDIDATE_PARAMS) return false
    val instructions = method.implementation?.instructions?.toList() ?: return false
    if (instructions.size > 60) return false
    var xors = 0
    var loopsBack = false
    for (instruction in instructions) {
        if (instruction.opcode in XOR_OPCODES) xors++
        if (instruction.opcode == Opcode.GOTO || instruction.opcode.name.startsWith("IF_")) {
            val target = (instruction as? OffsetInstruction)?.codeOffset
            if (target != null && target < 0) loopsBack = true
        }
    }
    return xors >= 2 && loopsBack
}

private fun isDecryptorCall(instruction: Instruction, candidates: Set<String>): Boolean {
    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    val id = "${reference.definingClass}->${reference.name}"
    return id in candidates
}

// ponytail: this is a heuristic hook, not a real decryptor — matched methods
// are logged and their results forced to empty so callers do not crash on
// null. A true bounded interpreter over xor-loop bodies is the upgrade path;
// run this last and verify per-app.
@Suppress("unused")
val dexGuardStringDecryptPatch = bytecodePatch(
    name = "DexGuard string decrypt hook",
    description = "Experimental, apply last: detects likely string decryptor methods and forces their results to empty so obfuscated string flows stay non-null. Server-driven or native decryptors are not covered.",
    default = false,
) {
    category("Heavy")

    val logOnlyOption = booleanOption(
        key = "logOnly",
        default = true,
        title = "Log Only",
        description = "Log decryptor candidates without rewriting their results.",
    )
    val forceEmptyOption = booleanOption(
        key = "forceEmptyStrings",
        default = false,
        title = "Force Empty Strings",
        description = "Force decryptor call results to empty strings. Assumes callers tolerate empty values.",
    )

    execute {
        val forceEmpty = forceEmptyOption.value == true

        val candidates = mutableSetOf<String>()
        classDefForEach { classDef ->
            for (method in classDef.methods) {
                if (isDecryptorCandidate(method)) {
                    candidates += "${method.definingClass}->${method.name}"
                }
            }
        }
        if (candidates.isNotEmpty()) {
            logger.info("Decryptor candidates: $candidates")
        }
        if (!forceEmpty) {
            logger.info("Log-only mode; no results rewritten.")
            return@execute
        }

        if (candidates.isEmpty()) {
            logger.info("No decryptor candidates detected.")
            return@execute
        }

        val patched = patchMatchingMethods(
            isCandidate = { method ->
                method.implementation?.instructions?.any { isDecryptorCall(it, candidates) } == true
            },
        ) { instructions ->
            var count = 0
            for (index in instructions.indices.reversed()) {
                val instruction = instructions.getOrNull(index) ?: continue
                if (isDecryptorCall(instruction, candidates) &&
                    forceInvokeResult(instructions, index) { register -> "const-string v$register, \"\"" }
                ) {
                    count++
                }
            }
            count
        }

        logger.info("Applied $patched decryptor hook replacements.")
    }
}
