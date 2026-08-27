package io.github.liongalahad.nuviotv.extension.subtitles.sdh

enum class SdhCleanupMode {
    OFF,
    KEEP_LYRICS,
    REMOVE_LYRICS,
    NORMALIZE_MUSIC_SYMBOLS;

    val removesMusicLyrics: Boolean
        get() = this == REMOVE_LYRICS

    val removesAnnotations: Boolean
        get() = this == KEEP_LYRICS || this == REMOVE_LYRICS

    val normalizesMusicSymbols: Boolean
        get() = this != OFF

    companion object {
        @JvmStatic
        fun fromOrdinal(ordinal: Int): SdhCleanupMode = entries.getOrElse(ordinal) { OFF }
    }
}
