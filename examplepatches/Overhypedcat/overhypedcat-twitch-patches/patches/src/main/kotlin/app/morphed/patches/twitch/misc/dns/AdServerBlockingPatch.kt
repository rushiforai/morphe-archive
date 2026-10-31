package app.morphed.patches.twitch.misc.dns

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphed.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val DNS_CLASS = "Lapp/morphed/extension/twitch/patches/TwitchDns;"
private const val GET_ALL_BY_NAME = "getAllByName(Ljava/lang/String;)[Ljava/net/InetAddress;"

@Suppress("unused")
val adServerBlockingPatch = bytecodePatch(
    name = "Block ad servers",
    description = "Blocks Twitch's banner, display and feed ads (edge.ads.twitch.tv) and its tracking servers " +
        "inside the app.",
    default = true
) {
    compatibleWith(COMPATIBILITY_TWITCH)

    extendWith("extensions/twitch.mpe")

    execute {
        OkHttpRouteLookupFingerprint.method.apply {
            val lookups = implementation!!.instructions.withIndex().filter { (_, instruction) ->
                val reference = instruction.getReference<MethodReference>()
                (instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_STATIC_RANGE) &&
                    reference?.definingClass == "Ljava/net/InetAddress;" &&
                    reference.name == "getAllByName"
            }.map { it.index }

            check(lookups.isNotEmpty()) { "No InetAddress.getAllByName call in OkHttp route selection" }

            lookups.forEach { index ->
                val register = when (val call = getInstruction(index)) {
                    is FiveRegisterInstruction -> call.registerC
                    is RegisterRangeInstruction -> call.startRegister
                    else -> error("Unexpected call format at $index")
                }
                replaceInstruction(index, "invoke-static/range { v$register .. v$register }, $DNS_CLASS->$GET_ALL_BY_NAME")
            }
        }
    }
}
