package dev.karmapatches

/**
 * "Release (debug)" iş akışı derlemeden önce [DEBUG_LOGS] değerini true yapar.
 * Depoda her zaman false kalmalı; CI bunu denetler.
 */
internal object BuildFlags {
    val DEBUG_LOGS: Boolean = false
}

/**
 * Debug derlemesinde kancanın içine logcat satırı ekleyecek smali üretir, normal derlemede boş döner.
 * [tagReg] ve [msgReg], hedef metotta güvenle üzerine yazılabilen iki register olmalı
 * (kanca hemen return eder; genelde parametre register'ları kullanılır).
 * [message] içine tırnak, ters bölü ya da gizli veri (token, URL) konmamalı.
 */
internal fun debugLogSmali(tagReg: String, msgReg: String, message: String): String {
    if (!BuildFlags.DEBUG_LOGS) return ""
    require('"' !in message && '\\' !in message) { "Unsafe log message" }
    return """
        const-string $tagReg, "KarmaPatches"
        const-string $msgReg, "$message"
        invoke-static { $tagReg, $msgReg }, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    """.trimIndent()
}
