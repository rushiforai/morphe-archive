package patches.vela

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload
import java.security.MessageDigest

internal val vela = Compatibility(
    name = "Vela Maps", packageName = "app.vela", apkFileType = ApkFileType.APK,
    signatures = setOf("29938b4858063e42e677ff95c901cd48248a7f032a3ae85f9b9e5617568b0d36"),
    targets = listOf(AppTarget(version = "0.5.2621", versionCode = 46210, minSdk = 26)),
)
internal val originalInput = patches.shared.originalInput(vela)
internal const val VELA_MAP_ID = "r8-map-id-3c2f951b77f91240ac1e98a473480b1bc6ba86d55e241ec71502beb0667a5e3e"

/** Hash every instruction operand, payload and catch range; no source line is a mutation anchor. */
internal fun velaFingerprint(method: Method): String {
    val body = method.implementation ?: error("Missing Vela method body: $method")
    val text = buildString {
        append(body.registerCount)
        body.instructions.forEach { i ->
            append('|').append(i.opcode).append(':').append((i as? ReferenceInstruction)?.reference?.toString().orEmpty())
            if (i is RegisterRangeInstruction) append('r').append(i.startRegister).append(',').append(i.registerCount)
            if (i is OneRegisterInstruction) append('a').append(i.registerA)
            if (i is TwoRegisterInstruction) append('b').append(i.registerB)
            if (i is ThreeRegisterInstruction) append('c').append(i.registerC)
            if (i is FiveRegisterInstruction) append('f').append(i.registerCount).append(',').append(i.registerC)
                .append(',').append(i.registerD).append(',').append(i.registerE).append(',').append(i.registerF).append(',').append(i.registerG)
            if (i is WideLiteralInstruction) append('l').append(i.wideLiteral)
            if (i is OffsetInstruction) append('o').append(i.codeOffset)
            if (i is SwitchPayload) i.switchElements.forEach { append('s').append(it.key).append(',').append(it.offset) }
            if (i is ArrayPayload) {
                append('w').append(i.elementWidth)
                i.arrayElements.forEach { append('v').append(it.toLong()) }
            }
        }
        body.tryBlocks.forEach { block ->
            append("|try:").append(block.startCodeAddress).append(',').append(block.codeUnitCount)
            block.exceptionHandlers.forEach { append('|').append(it.exceptionType).append('@').append(it.handlerCodeAddress) }
        }
    }
    return MessageDigest.getInstance("SHA-256").digest(text.toByteArray(Charsets.UTF_8))
        .joinToString("") { "%02x".format(it.toInt() and 255) }
}
