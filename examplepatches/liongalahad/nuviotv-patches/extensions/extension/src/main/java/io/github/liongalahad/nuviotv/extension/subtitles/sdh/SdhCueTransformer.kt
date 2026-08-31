package io.github.liongalahad.nuviotv.extension.subtitles.sdh

import androidx.media3.common.text.Cue
import android.annotation.SuppressLint
import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime
import java.lang.ref.WeakReference
import java.util.WeakHashMap

/** Transforms an extracted cue list without touching R8-minified CueGroup fields. */
object SdhCueTransformer {
    private const val TOTAL_OCCURRENCES_REQUIRED = 3
    private const val CONSECUTIVE_OCCURRENCES_REQUIRED = 2
    private val defaultSession = Any()
    private val currentSession = ThreadLocal<WeakReference<Any>>()
    private val sessions = WeakHashMap<Any, RecognitionState>()

    private class RecognitionState {
        val totals = HashMap<String, Int>()
        val recognized = HashSet<String>()
        var previousToken: String? = null
        var consecutiveCount = 0
        var previousSnapshot: List<String>? = null
        var mode: SdhCleanupMode? = null

        fun reset(newMode: SdhCleanupMode) {
            totals.clear()
            recognized.clear()
            previousToken = null
            consecutiveCount = 0
            previousSnapshot = null
            mode = newMode
        }
    }

    /** Binds learning to the current player's subtitle callback without retaining that player. */
    @JvmStatic
    fun beginSession(owner: Any) {
        currentSession.set(WeakReference(owner))
    }

    /** Lets Nuvio own Media3 filtering only while Morphe subtitle processing is disabled. */
    @JvmStatic
    fun shouldApplyNativeFilter(): Boolean =
        SdhCleanupMode.fromOrdinal(MorpheSettingsRuntime.sdhCleanupModeOrdinal()) ==
            SdhCleanupMode.OFF

    /** Preserves native filter input while satisfying 0.8.11's concrete ArrayList return type. */
    @JvmStatic
    fun bypassNativeFilter(cues: List<Cue>): ArrayList<Cue> =
        if (cues is ArrayList<Cue>) cues else ArrayList(cues)

    @JvmStatic
    fun clean(cues: List<Cue>): List<Cue> {
        val mode = SdhCleanupMode.fromOrdinal(MorpheSettingsRuntime.sdhCleanupModeOrdinal())
        val state = recognitionState()
        synchronized(state) {
            if (state.mode != mode) state.reset(mode)
            if (mode == SdhCleanupMode.OFF) return cues
            val inferredTokens = observeEvidence(cues, state)
            return cleanCues(cues, mode, inferredTokens)
        }
    }

    @SuppressLint("UnsafeOptInUsageError")
    internal fun cleanCues(
        cues: List<Cue>,
        mode: SdhCleanupMode,
        inferredTokens: Set<String> = emptySet()
    ): List<Cue> {
        var changed = false
        val output = ArrayList<Cue>(cues.size)
        cues.forEach { cue ->
            val source = cue.text
            if (source == null) {
                output += cue
            } else {
                val cleaned = SdhSubtitleCleaner.cleanWithInferredTokens(
                    source,
                    mode,
                    inferredTokens
                )
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

    private fun recognitionState(): RecognitionState {
        val owner = currentSession.get()?.get() ?: defaultSession
        return synchronized(sessions) {
            sessions.getOrPut(owner, ::RecognitionState)
        }
    }

    private fun observeEvidence(cues: List<Cue>, state: RecognitionState): Set<String> {
        val snapshot = cues.mapNotNull { cue -> cue.text?.toString() }
        if (snapshot == state.previousSnapshot) return state.recognized.toSet()
        val retained = state.previousSnapshot.orEmpty().groupingBy { text -> text }
            .eachCount()
            .toMutableMap()
        val introduced = snapshot.filter { text ->
            val remaining = retained[text] ?: 0
            if (remaining <= 0) {
                true
            } else {
                retained[text] = remaining - 1
                false
            }
        }
        state.previousSnapshot = snapshot

        introduced.forEach { text ->
            val tokens = SdhSubtitleCleaner.boundaryWrapperTokens(text)
            if (tokens.isEmpty()) {
                if (text.isNotBlank()) breakConsecutiveRun(state)
            } else {
                tokens.forEach { token -> observeToken(token, state) }
            }
        }
        return state.recognized.toSet()
    }

    private fun observeToken(token: String, state: RecognitionState) {
        if (SdhSubtitleCleaner.isSelfEvidentBoundaryToken(token)) {
            breakConsecutiveRun(state)
            return
        }
        val total = (state.totals[token] ?: 0) + 1
        state.totals[token] = total
        if (state.previousToken == token) {
            state.consecutiveCount++
        } else {
            state.previousToken = token
            state.consecutiveCount = 1
        }
        if (total >= TOTAL_OCCURRENCES_REQUIRED ||
            state.consecutiveCount >= CONSECUTIVE_OCCURRENCES_REQUIRED
        ) {
            state.recognized += token
        }
    }

    private fun breakConsecutiveRun(state: RecognitionState) {
        state.previousToken = null
        state.consecutiveCount = 0
    }
}
