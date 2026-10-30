package app.pigfoot.patches.pitt

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.iface.instruction.*

internal const val PITT_EXPIRY_NOTICE_OWNER = "Lcom/ihad/ptt/model/handler/f0\$a;"
internal const val PITT_EXPIRED_MESSAGE = "贊助項目已過期、扣款失敗或是處於暫停狀態"
internal const val PITT_TOAST = "Lcom/ihad/ptt/model/handler/b1;->h(Landroid/content/Context;Ljava/lang/String;)V"

private fun Instruction.referenceText() = (this as? ReferenceInstruction)?.reference?.toString()

/** Suppress only the false no-purchased-subscription warning induced by the local override. */
internal fun suppressPittExpiryNotice(method: MutableMethod) {
    require(method.pittId() == "$PITT_EXPIRY_NOTICE_OWNER->run()V") { "Unsupported PiTT expiry notice method" }
    val implementation = requireNotNull(method.implementation)
    val code = implementation.instructions.toList()
    val matches = code.indices.filter { code[it].referenceText() == PITT_EXPIRED_MESSAGE }
    require(matches.size == 1) { "Missing or ambiguous PiTT expiry notice" }
    val message = matches.single()
    val call = code.getOrNull(message + 1) as? FiveRegisterInstruction
    require(code[message].opcode in setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO) &&
        code.getOrNull(message + 1)?.opcode == Opcode.INVOKE_STATIC &&
        code[message + 1].referenceText() == PITT_TOAST && call?.registerCount == 2 &&
        call.registerD == (code[message] as OneRegisterInstruction).registerA &&
        code.getOrNull(message + 2)?.opcode == Opcode.IGET_OBJECT &&
        code.getOrNull(message + 3)?.referenceText() == "Lcom/ihad/ptt/model/handler/c0\$e;->a()V") {
        "Unsupported PiTT expiry notice/reset flow"
    }
    // Keep the callback, receipt state and every other warning intact.
    implementation.replaceInstruction(message + 1, BuilderInstruction10x(Opcode.NOP))
}
