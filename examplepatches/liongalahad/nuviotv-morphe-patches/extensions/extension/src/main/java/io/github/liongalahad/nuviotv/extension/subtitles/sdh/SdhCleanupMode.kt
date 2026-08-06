package io.github.liongalahad.nuviotv.extension.subtitles.sdh

enum class SdhCleanupMode {
    OFF,
    KEEP_LYRICS,
    REMOVE_LYRICS;

    val removesMusicLyrics: Boolean
        get() = this == REMOVE_LYRICS

    companion object {
        @JvmStatic
        fun fromOrdinal(ordinal: Int): SdhCleanupMode = entries.getOrElse(ordinal) { OFF }
    }
}
