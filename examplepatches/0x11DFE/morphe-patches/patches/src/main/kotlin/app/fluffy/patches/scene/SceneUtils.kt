package app.fluffy.patches.scene

import kotlin.random.Random

// Random string helper (pattern from HMA-OSS icu.nullptr.hidemyapplist.common.Utils).
fun generateRandomString(length: Int, allowedChars: List<Char>): String =
    (0 until length)
        .map { allowedChars.random() }
        .joinToString("")

// Builds smali that constructs [value] at runtime from random-sized fragments,
// so the patched dex never carries it as a single scannable literal.
fun fragmentedStringSmali(value: String, resultRegister: String, tmpRegister: String): String {
    val cuts = generateSequence { (1 until value.length - 1).random() }
        .distinct()
        .take(2)
        .toList()
        .sorted()
    val fragments = buildList {
        var last = 0
        for (c in cuts) { add(value.substring(last, c)); last = c }
        add(value.substring(last))
    }
    return buildString {
        append("new-instance $resultRegister, Ljava/lang/StringBuilder;\n")
        append("invoke-direct {$resultRegister}, Ljava/lang/StringBuilder;-><init>()V\n")
        for (f in fragments) {
            append("const-string $tmpRegister, \"$f\"\n")
            append("invoke-virtual {$resultRegister, $tmpRegister}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;\n")
            append("move-result-object $resultRegister\n")
        }
        append("invoke-virtual {$resultRegister}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;\n")
        append("move-result-object $resultRegister")
    }
}
