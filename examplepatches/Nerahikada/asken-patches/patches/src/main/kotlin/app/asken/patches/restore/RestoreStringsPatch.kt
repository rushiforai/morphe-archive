package app.asken.patches.restore

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.asken.patches.shared.Constants.ASKEN_COMPATIBILITY
import java.util.Base64

private fun smaliEscape(s: String): String = s.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r").replace("\t", "\\t")

@Suppress("unused")
val restoreStringsPatch = bytecodePatch(
    name = "Restore encrypted strings",
    description = "Repopulates the obfuscated static String holders that PairIP's startup VM decrypts at runtime (1466 values dumped from the original-signed app via am dumpheap), so removing PairIP no longer leaves them null."
) {
    compatibleWith(ASKEN_COMPATIBILITY)
    execute {
        val stream = object {}.javaClass.getResourceAsStream("/restore.txt") ?: error("restore.txt resource missing")
        val sb = StringBuilder()
        stream.bufferedReader().forEachLine { line ->
            if (line.isBlank()) return@forEachLine
            val tab1 = line.indexOf('\t'); val tab2 = line.indexOf('\t', tab1 + 1)
            val cls = line.substring(0, tab1); val field = line.substring(tab1 + 1, tab2); val value = String(Base64.getDecoder().decode(line.substring(tab2 + 1)), Charsets.UTF_8)
            sb.append("const-string v0, \"").append(smaliEscape(value)).append("\"\n")
            sb.append("sput-object v0, ").append(cls).append("->").append(field).append(":Ljava/lang/String;\n")
        }
        AppClinitFingerprint.method.addInstructions(0, sb.toString())
    }
}
