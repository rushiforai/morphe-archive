package io.github.sabopura.morphe.patches.twitch.notifications

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import io.github.sabopura.morphe.patches.twitch.Constants.TWITCH_SUPPORTED
import io.github.sabopura.morphe.patches.twitch.support.*
import java.util.logging.Logger

private const val HEADERS = "Lio/github/sabopura/morphe/extension/twitch/notifications/FirebaseHeaders;"
private val CONNECTIONS = setOf("Ljava/net/URLConnection;", "Ljava/net/HttpURLConnection;", "Ljavax/net/ssl/HttpsURLConnection;")

/** The extension decides by header name and URL at run time, so every header write goes through it. */
private fun headerWrite(instruction: Instruction): String? {
    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    if (reference.definingClass !in CONNECTIONS || reference.name !in setOf("addRequestProperty", "setRequestProperty")) return null
    val target = "$HEADERS->${if (reference.name == "setRequestProperty") "set" else "add"}" +
        "(Ljava/net/URLConnection;Ljava/lang/String;Ljava/lang/String;)V"
    val registers = instruction.callRegisters()
    return if (instruction is RegisterRangeInstruction) "invoke-static/range {v${registers.first()} .. v${registers.last()}}, $target"
    else "invoke-static {${registers.joinToString { "v$it" }}}, $target"
}

@Suppress("unused")
val fixNotificationsPatch = bytecodePatch(
    name = "Fix notifications",
    description = "Repair push registration after re-signing. Adjusts the certificate and package name headers only for HTTPS Firebase Installations requests.",
    default = true,
) {
    compatibleWith(TWITCH_SUPPORTED)
    extendWith("extensions/twitch.mpe")
    execute {
        val owner = classesWithStrings("X-Android-Cert", "x-goog-api-key").uniqueContract("Firebase connection builder class")
        val method = mutableClassDefBy(owner).methods.filter { candidate ->
            candidate.returnType == "Ljava/net/HttpURLConnection;" &&
                candidate.parameterTypes.map { it.toString() } == listOf("Ljava/net/URL;", "Ljava/lang/String;") &&
                candidate.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "X-Android-Cert"
                } == true
        }.uniqueContract("Firebase connection builder")
        val writes = method.instructions.withIndex().mapNotNull { (index, instruction) -> headerWrite(instruction)?.let { index to it } }
        if (writes.isEmpty()) throw PatchException("Twitch notifications: no header writes in the Firebase connection builder")
        writes.forEach { (index, call) -> method.replaceInstruction(index, call) }
        Logger.getLogger("Sabopura.Notifications").info("Firebase headers: ${writes.size} scoped call(s) in $method")
    }
}
