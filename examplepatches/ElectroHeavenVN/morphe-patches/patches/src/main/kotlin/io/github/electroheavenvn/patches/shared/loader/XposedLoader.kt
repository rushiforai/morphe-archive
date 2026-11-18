package io.github.electroheavenvn.patches.shared.loader

enum class XposedLoader(val displayName: String) {
    NPATCH("NPatch"),
    LSPATCH("LSPatch");

    companion object {
        fun fromString(value: String?): XposedLoader = when (value?.trim()?.lowercase()) {
            "lspatch" -> LSPATCH
            else -> NPATCH
        }
    }
}
