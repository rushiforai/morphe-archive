package patches.videolandatv

import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload
import java.security.MessageDigest
import patches.atv.exact

internal const val TARGET = "Lcom/bedrockstreaming/component/layout/domain/core/model/Target;"
internal const val SUBSCRIPTION = "Lcom/bedrockstreaming/component/layout/domain/core/model/Target\$Lock\$RequireSubscriptionLock;"
internal const val NAVIGATION = "Lcom/bedrockstreaming/component/navigation/domain/NavigationMapper;"
internal const val HANDLE_ACTION = "Lcom/bedrockstreaming/feature/player/domain/mediaplayer/usecase/HandleActionUseCase;"
internal const val NAVIGATION_SIGNATURE = "a($NAVIGATION$TARGET" + "Ljava/lang/String;Ljava/util/List;Lcom/bedrockstreaming/component/layout/domain/core/model/Item;I)Lcom/bedrockstreaming/component/navigation/domain/usecase/a;"
internal const val HANDLE_ACTION_SIGNATURE = "a(LZe/c;Lmf/d;LR7/g;Lcom/bedrockstreaming/component/layout/domain/core/model/MediaItem;Lcom/bedrockstreaming/component/layout/domain/core/model/Action;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lbv/c;)Ljava/lang/Object;"

/** Pin operand values, references, payloads and exception edges, not just opcodes/counts.
 * Debug line information is deliberately excluded. FULL bytecode mode is required.
 */
internal fun subscriptionMethodDigest(method: Method): String {
    val body = method.implementation!!
    val text = buildString {
        append(method.accessFlags).append('/').append(body.registerCount).append('\n')
        body.instructions.forEach { instruction ->
            append(instruction.opcode.name)
            if (instruction is RegisterRangeInstruction) append(" r${instruction.startRegister}/${instruction.registerCount}")
            if (instruction is FiveRegisterInstruction) append(" f${instruction.registerCount}/${instruction.registerC}/${instruction.registerD}/${instruction.registerE}/${instruction.registerF}/${instruction.registerG}")
            if (instruction is OneRegisterInstruction) append(" a${instruction.registerA}")
            if (instruction is TwoRegisterInstruction) append(" b${instruction.registerB}")
            if (instruction is ThreeRegisterInstruction) append(" c${instruction.registerC}")
            if (instruction is ReferenceInstruction) append(" ref:${instruction.reference}")
            if (instruction is WideLiteralInstruction) append(" lit:${instruction.wideLiteral}")
            if (instruction is OffsetInstruction) append(" off:${instruction.codeOffset}")
            if (instruction is SwitchPayload) instruction.switchElements.forEach { append(" sw:${it.key}/${it.offset}") }
            if (instruction is ArrayPayload) append(" array:${instruction.elementWidth}/${instruction.arrayElements}")
            append('\n')
        }
        body.tryBlocks.forEach { block ->
            append("try:${block.startCodeAddress}/${block.codeUnitCount}")
            block.exceptionHandlers.forEach { append("/${it.exceptionType}@${it.handlerCodeAddress}") }
            append('\n')
        }
    }
    return MessageDigest.getInstance("SHA-256").digest(text.toByteArray(Charsets.UTF_8))
        .joinToString("") { "%02x".format(it.toInt() and 0xff) }
}

internal fun requireSubscriptionMethod(method: Method, flags: Int, digest: String) {
    check(method.accessFlags == flags && subscriptionMethodDigest(method) == digest) {
        "Changed Videoland subscription contract: ${method.definingClass}->${method.name}"
    }
}

context(context: BytecodePatchContext)
internal fun subscriptionTargets() = run {
    // Resolve and check ALL contracts before the caller performs its first mutation.
    val navigation = exact(NAVIGATION, NAVIGATION_SIGNATURE, 17, 377)
    val action = exact(HANDLE_ACTION, HANDLE_ACTION_SIGNATURE, 48, 656)
    val accessor = exact(SUBSCRIPTION, "b()$TARGET", 2, 2)
    requireSubscriptionMethod(navigation, 9, "15c7c906c38a83f62f3cd49fef7155603429db7465773587863b48cf73817fa7")
    requireSubscriptionMethod(action, 17, "5f1257af67ca08054ddd83d3150441d76e61173575380936a9c20eb20f84379b")
    requireSubscriptionMethod(accessor, 17, "5ab6d34b79ad5460a6102b144adf7ebe65b445dfee8974f2b51df62fde1970de")
    navigation to action
}
