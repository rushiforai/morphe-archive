package app.ffn.patches.network

import app.ffn.patches.shared.Constants.COMPATIBILITY_FANFICTION
import app.ffn.patches.shared.RequestConstructorFingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.longOption
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val networkTimeoutPatch = patch(
    name = "Network timeout",
    description = "Changes the default API request timeout from 30 seconds. The server answers one request " +
        "at a time, so a longer timeout also makes screens wait longer behind a slow request.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_FANFICTION)

    val timeoutSeconds by longOption(
        key = "timeoutSeconds",
        default = 120L,
        values = mapOf("60 seconds" to 60L, "120 seconds" to 120L, "300 seconds" to 300L),
        title = "Timeout",
        description = "Seconds to wait for a server response. The app's default is 30.",
        required = true,
    ) { it!! > 0 }

    execute {
        RequestConstructorFingerprint.let {
            val literal = it.instructionMatches.first()
            val register = literal.getInstruction<OneRegisterInstruction>().registerA
            it.method.replaceInstruction(literal.index, "const-wide v$register, ${timeoutSeconds!!}L")
        }
    }
}
