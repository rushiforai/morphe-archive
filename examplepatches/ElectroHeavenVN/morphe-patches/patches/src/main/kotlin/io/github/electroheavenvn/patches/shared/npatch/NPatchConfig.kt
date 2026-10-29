package io.github.electroheavenvn.patches.shared.npatch

import java.nio.charset.StandardCharsets
import java.util.Base64

internal data class NPatchConfig(
    val packageName: String,
    val appComponentFactory: String,
    val injectProvider: Boolean,
    val useMicroG: Boolean,
    val usesCleartextTraffic: Boolean,
) {
    companion object {
        private const val CORE_VERSION_CODE = 3111
        private const val CORE_VERSION_NAME = "v2.2-core"
        private const val VERSION_CODE = 833
        private const val VERSION_NAME = "1.0.9"
    }

    fun toJsonBytes(): ByteArray = buildString {
        append('{')
        append("\"debuggable\":false,")
        append("\"hideLibs\":false,")
        append("\"injectProvider\":").append(injectProvider).append(',')
        append("\"lspConfig\":{")
        append("\"API_CODE\":102,")
        append("\"CORE_VERSION_CODE\":").append(CORE_VERSION_CODE).append(',')
        append("\"CORE_VERSION_NAME\":\"").append(CORE_VERSION_NAME.jsonEscape()).append("\",")
        append("\"VERSION_CODE\":").append(VERSION_CODE).append(',')
        append("\"VERSION_NAME\":\"").append(VERSION_NAME.jsonEscape()).append("\",")
        append("\"sigBypassLevel\":0},")
        append("\"managerPackageName\":\"top.nkbe.npatch\",")
        append("\"newPackage\":\"").append(packageName.jsonEscape()).append("\",")
        append("\"outputLog\":true,")
        append("\"overrideTargetSdk\":false,")
        append("\"overrideTargetSdkValue\":28,")
        append("\"overrideVersionCode\":false,")
        append("\"overrideVersionCodeValue\":1,")
        append("\"sigBypassLevel\":0,")
        append("\"useManager\":false,")
        append("\"useMicroG\":").append(useMicroG).append(',')
        append("\"usesCleartextTraffic\":").append(usesCleartextTraffic)
        append('}')
    }.toByteArray(StandardCharsets.UTF_8)

    fun toManifestBase64(jsonBytes: ByteArray): String = Base64.getEncoder().encodeToString(jsonBytes)
}

private fun String.jsonEscape(): String = buildString(length) {
    this@jsonEscape.forEach { character ->
        when (character) {
            '\\' -> append("\\\\")
            '"' -> append("\\\"")
            '\b' -> append("\\b")
            '\u000C' -> append("\\f")
            '\n' -> append("\\n")
            '\r' -> append("\\r")
            '\t' -> append("\\t")
            else -> if (character.code < 0x20) append("\\u%04x".format(character.code)) else append(character)
        }
    }
}
