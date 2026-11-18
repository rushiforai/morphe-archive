package io.github.electroheavenvn.patches.shared.loader

import java.nio.charset.StandardCharsets

internal data class LSPatchConfig(
    val injectDocumentsProvider: Boolean,
) {
    companion object {
        private const val API_CODE = 102
        private const val CORE_VERSION_CODE = 7306
        private const val CORE_VERSION_HASH = "e00c5c5038bbcc14e0b382ab893301d6993e6989"
        private const val CORE_VERSION_NAME = "canary-3106"
        private const val VERSION_CODE = 487
        private const val VERSION_NAME = "1.2"
    }

    fun toJsonBytes(): ByteArray = buildString {
        append('{')
        append("\"addedPermissions\":[],")
        append("\"debuggable\":false,")
        append("\"injectDex\":true,")
        append("\"injectDocumentsProvider\":").append(injectDocumentsProvider).append(',')
        append("\"lspConfig\":{")
        append("\"API_CODE\":").append(API_CODE).append(',')
        append("\"CORE_VERSION_CODE\":").append(CORE_VERSION_CODE).append(',')
        append("\"CORE_VERSION_HASH\":\"").append(CORE_VERSION_HASH).append("\",")
        append("\"CORE_VERSION_NAME\":\"").append(CORE_VERSION_NAME).append("\",")
        append("\"VERSION_CODE\":").append(VERSION_CODE).append(',')
        append("\"VERSION_NAME\":\"").append(VERSION_NAME).append("\"},")
        append("\"sigBypassLevel\":0,")
        append("\"useManager\":false")
        append('}')
    }.toByteArray(StandardCharsets.UTF_8)
}
