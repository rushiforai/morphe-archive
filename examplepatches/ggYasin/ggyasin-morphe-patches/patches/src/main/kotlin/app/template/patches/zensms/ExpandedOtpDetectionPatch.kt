package app.template.patches.zensms

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.ZEN_SMS_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val NO_PERSIAN_DISCOUNT_IN_MESSAGE =
    "\\A(?![\\s\\S]*تخفیف)[\\s\\S]*?"

private const val STOCK_CODE_BEFORE_CONTEXT =
    "(?i)\\b(\\d{4,8})\\s+is\\s+your\\s+(?:otp|code|pin|verification)\\b"
private const val EXPANDED_CODE_BEFORE_CONTEXT =
    "(?i)" + NO_PERSIAN_DISCOUNT_IN_MESSAGE +
        "(?<![A-Z0-9\\u0660-\\u0669\\u06F0-\\u06F9])" +
        "([A-Z0-9\\u0660-\\u0669\\u06F0-\\u06F9]{4,10})\\s+" +
        "(?:is\\s+)?(?:(?:your|the)\\s+)?" +
        "(?:otp|code|pin|verification|one[-\\s]time[-\\s]password|2fa)\\b"

private const val STOCK_PIN_CONTEXT =
    "(?i)\\bPIN\\s*(?:is|:)\\s*(\\d{4,6})\\b"
private const val EXPANDED_PIN_AND_PERSIAN_CONTEXT =
    "(?i)" + NO_PERSIAN_DISCOUNT_IN_MESSAGE +
        "(?<![A-Z0-9\\u0600-\\u06FF])(?:PIN|کد|رمز)(?:\\s+پویا)?\\s*" +
        "(?:is|:|：)?\\s*([A-Z0-9\\u0660-\\u0669\\u06F0-\\u06F9]{4,10})" +
        "(?![A-Z0-9\\u0660-\\u0669\\u06F0-\\u06F9])"

private const val STOCK_PASSWORD_CONTEXT =
    "(?i)\\b(?:passcode|password)\\s*(?:is|:)\\s*(\\d{4,8})\\b"
private const val EXPANDED_PASSWORD_CONTEXT =
    "(?i)" + NO_PERSIAN_DISCOUNT_IN_MESSAGE +
        "\\b(?:passcode|password|one[-\\s]time[-\\s]password)\\s*" +
        "(?:is|:|：)?\\s*([A-Z0-9\\u0660-\\u0669\\u06F0-\\u06F9]{4,10})" +
        "(?![A-Z0-9\\u0660-\\u0669\\u06F0-\\u06F9])"

private const val EXPANDED_MAX_CODE_LENGTH = 10

private val REGEX_REPLACEMENTS = mapOf(
    STOCK_CODE_BEFORE_CONTEXT to EXPANDED_CODE_BEFORE_CONTEXT,
    STOCK_PIN_CONTEXT to EXPANDED_PIN_AND_PERSIAN_CONTEXT,
    STOCK_PASSWORD_CONTEXT to EXPANDED_PASSWORD_CONTEXT,
)

@Suppress("unused")
val expandedOtpDetectionPatch = bytecodePatch(
    name = "Expanded OTP detection",
    description = "Extends ZenSMS's original OTP extractor with universal and Persian patterns.",
    default = true,
) {
    compatibleWith(ZEN_SMS_COMPATIBILITY)

    execute {
        expandStockRegexes()
        widenStockValidatorLength()
    }
}

context(_: BytecodePatchContext)
private fun expandStockRegexes() {
    val method = ZenSmsOtpExtractorFingerprint.method
    val found = mutableSetOf<String>()

    method.instructions.forEachIndexed { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? StringReference
            ?: return@forEachIndexed
        val replacement = REGEX_REPLACEMENTS[reference.string] ?: return@forEachIndexed
        val register = (instruction as OneRegisterInstruction).registerA
        method.replaceInstruction(index, "const-string v$register, \"${replacement.toSmaliString()}\"")
        found += reference.string
    }

    check(found == REGEX_REPLACEMENTS.keys) {
        "Expected ${REGEX_REPLACEMENTS.size} stock OTP regexes, found ${found.size}"
    }
}

context(_: BytecodePatchContext)
private fun widenStockValidatorLength() {
    val method = ZenSmsOtpCandidateValidatorFingerprint.method
    val maxLengthIndex = method.instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.CONST_16 &&
            (instruction as? OneRegisterInstruction)?.registerA == 8
    }
    check(maxLengthIndex >= 0) { "Could not find ZenSMS's maximum OTP length" }

    method.replaceInstruction(
        maxLengthIndex,
        "const/16 v8, 0x${EXPANDED_MAX_CODE_LENGTH.toString(16)}",
    )
}

private fun String.toSmaliString() = buildString(length) {
    this@toSmaliString.forEach { character ->
        when (character) {
            '\\' -> append("\\\\")
            '"' -> append("\\\"")
            '\n' -> append("\\n")
            '\r' -> append("\\r")
            '\t' -> append("\\t")
            else -> append(character)
        }
    }
}
