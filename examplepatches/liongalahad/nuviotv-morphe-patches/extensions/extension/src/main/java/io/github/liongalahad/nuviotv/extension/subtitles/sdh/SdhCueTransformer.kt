package io.github.liongalahad.nuviotv.extension.subtitles.sdh

import androidx.media3.common.text.Cue
import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime

/** Transforms an extracted cue list without touching R8-minified CueGroup fields. */
object SdhCueTransformer {
    @JvmStatic
    fun clean(cues: List<Cue>): List<Cue> {
        val mode = SdhCleanupMode.fromOrdinal(MorpheSettingsRuntime.sdhCleanupModeOrdinal())
        if (mode == SdhCleanupMode.OFF) return cues
        return cleanCues(cues, mode)
    }

    internal fun cleanCues(cues: List<Cue>, mode: SdhCleanupMode): List<Cue> {
        var changed = false
        val output = ArrayList<Cue>(cues.size)
        cues.forEach { cue ->
            val source = cue.text
            if (source == null) {
                output += cue
            } else {
                val cleaned = SdhSubtitleCleaner.clean(source, mode)
                when {
                    cleaned == null -> changed = true
                    cleaned === source -> output += cue
                    else -> {
                        changed = true
                        output += cue.buildUpon().setText(cleaned).build()
                    }
                }
            }
        }
        return if (changed) output else cues
    }
}
