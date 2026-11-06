package com.anderson.applemusic.tv

import android.app.Application
import android.util.Log
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.isActive
import kotlinx.coroutines.launch

enum class ConnectionPhase { CONNECTING, CONNECTED, FAILED }

/** A top level tab (Início / Rádio / Biblioteca). */
data class TvTab(val id: String, val title: String)

/** A horizontal shelf of the tab root, or a single "play" shortcut. */
data class Section(
    val id: String,
    val title: String,
    val items: List<BrowseItem> = emptyList(),
    val loading: Boolean = true,
    val direct: Boolean = false,
)

/** One entry of the drill-down stack. */
data class LevelNode(val id: String, val title: String)

/** Transient "seeked by N seconds" hint shown by the full player. */
data class SeekFeedback(val deltaMs: Long, val positionMs: Long)

data class TvUiState(
    val phase: ConnectionPhase = ConnectionPhase.CONNECTING,
    val error: String? = null,
    val tabs: List<TvTab> = emptyList(),
    val selectedTab: Int = 0,
    val sections: List<Section> = emptyList(),
    val stack: List<LevelNode> = emptyList(),
    val levelItems: Map<String, List<BrowseItem>> = emptyMap(),
    val levelFailed: Set<String> = emptySet(),
    val playback: PlaybackSnapshot = PlaybackSnapshot(),
    val nowPlayingOpen: Boolean = false,
    val seekFeedback: SeekFeedback? = null,
    val searchOpen: Boolean = false,
)

class TvViewModel(application: Application) : AndroidViewModel(application) {

    private val client = MediaBrowserClient(application)
    private val _state = MutableStateFlow(TvUiState())
    val state: StateFlow<TvUiState> = _state.asStateFlow()
    private var seekFeedbackJob: Job? = null

    private val listener = object : MediaBrowserClient.Listener {
        override fun onConnected() {
            _state.update { it.copy(phase = ConnectionPhase.CONNECTED, error = null) }
            client.subscribe(MediaBrowserClient.AUTO_ROOT)
        }

        override fun onDisconnected(message: String) {
            Log.w(TAG, "disconnected: $message")
            _state.update {
                it.copy(phase = ConnectionPhase.FAILED, error = message, nowPlayingOpen = false)
            }
        }

        override fun onChildren(parentId: String, items: List<BrowseItem>) {
            handleChildren(parentId, items)
        }

        override fun onChildrenFailed(parentId: String) {
            val current = _state.value
            when {
                current.stack.any { it.id == parentId } ->
                    _state.update { it.copy(levelFailed = it.levelFailed + parentId) }

                parentId == current.tabs.getOrNull(current.selectedTab)?.id ->
                    _state.update { it.copy(sections = emptyList()) }

                else -> _state.update { state ->
                    state.copy(
                        sections = state.sections.map { section ->
                            if (section.id == parentId) section.copy(loading = false) else section
                        },
                    )
                }
            }
        }

        override fun onPlayback(snapshot: PlaybackSnapshot) {
            _state.update { it.copy(playback = snapshot) }
        }
    }

    init {
        client.listener = listener
        connect()
        viewModelScope.launch {
            while (isActive) {
                client.refreshPlayback()
                delay(PROGRESS_REFRESH_MS)
            }
        }
    }

    fun connect() {
        _state.value = TvUiState()
        if (!MediaBrowserClient.isAppleMusicInstalled(getApplication())) {
            _state.update {
                it.copy(
                    phase = ConnectionPhase.FAILED,
                    error = "Apple Music não instalado neste dispositivo",
                )
            }
            return
        }
        client.connect()
    }

    fun retry() {
        client.disconnect()
        connect()
    }

    fun selectTab(index: Int) {
        val tab = _state.value.tabs.getOrNull(index) ?: return
        if (
            index == _state.value.selectedTab &&
            _state.value.sections.isNotEmpty() &&
            !_state.value.searchOpen
        ) {
            return
        }
        _state.update {
            it.copy(
                selectedTab = index,
                sections = emptyList(),
                stack = emptyList(),
                searchOpen = false,
            )
        }
        client.subscribe(tab.id)
    }

    fun openNowPlaying() {
        val playback = _state.value.playback
        if (!playback.hasSession || playback.title.isBlank()) return
        _state.update { it.copy(nowPlayingOpen = true) }
    }

    fun closeNowPlaying() {
        seekFeedbackJob?.cancel()
        seekFeedbackJob = null
        _state.update { it.copy(nowPlayingOpen = false, seekFeedback = null) }
    }

    fun openSearch() {
        _state.update { it.copy(searchOpen = true) }
    }

    fun closeSearch() {
        _state.update { it.copy(searchOpen = false) }
    }

    /** D-pad left/right on the full player's seek bar: +/- [deltaMs]. */
    fun seekBy(deltaMs: Long) {
        val playback = _state.value.playback
        if (playback.durationMs <= 0L) return
        val target = (playback.positionMs + deltaMs).coerceIn(0L, playback.durationMs)
        client.seekTo(target)
        _state.update {
            it.copy(
                playback = it.playback.copy(positionMs = target),
                seekFeedback = SeekFeedback(deltaMs, target),
            )
        }
        seekFeedbackJob?.cancel()
        seekFeedbackJob = viewModelScope.launch {
            delay(SEEK_FEEDBACK_MS)
            _state.update { it.copy(seekFeedback = null) }
        }
    }

    /** D-pad center on a card: descend if browsable, play if playable. */
    fun enter(item: BrowseItem) {
        when {
            item.browsable -> pushLevel(item.id, item.title)
            item.playable -> client.play(item.id)
        }
    }

    /** D-pad center on a shelf/category header: open it as a grid. */
    fun openSection(section: Section) {
        pushLevel(section.id, section.title)
    }

    /** D-pad back: pop one level. Returns false when already at a tab root. */
    fun back(): Boolean {
        val current = _state.value
        if (current.stack.isEmpty()) return false
        _state.update { it.copy(stack = it.stack.dropLast(1)) }
        return true
    }

    fun togglePlayPause() = client.togglePlayPause()

    fun next() = client.skipNext()

    fun previous() = client.skipPrevious()

    private fun pushLevel(id: String, title: String) {
        if (_state.value.stack.any { it.id == id }) return
        _state.update { it.copy(stack = it.stack + LevelNode(id, title)) }
        client.subscribe(id)
    }

    private fun handleChildren(parentId: String, items: List<BrowseItem>) {
        val current = _state.value
        when {
            parentId == MediaBrowserClient.AUTO_ROOT -> {
                val tabs = items.filter { it.browsable }.map { TvTab(it.id, it.title) }
                if (tabs.isEmpty()) {
                    _state.update {
                        it.copy(
                            phase = ConnectionPhase.FAILED,
                            error = "Apple Music não expôs o catálogo de mídia",
                        )
                    }
                    return
                }
                _state.update {
                    it.copy(
                        tabs = tabs,
                        selectedTab = 0,
                        sections = emptyList(),
                        stack = emptyList(),
                        levelItems = emptyMap(),
                        levelFailed = emptySet(),
                    )
                }
                client.subscribe(tabs[0].id)
            }

            current.stack.any { it.id == parentId } -> _state.update {
                it.copy(
                    levelItems = it.levelItems + (parentId to items),
                    levelFailed = it.levelFailed - parentId,
                )
            }

            parentId == current.tabs.getOrNull(current.selectedTab)?.id -> buildSections(parentId, items)

            else -> _state.update { state ->
                state.copy(
                    sections = state.sections.map { section ->
                        if (section.id == parentId) {
                            section.copy(items = items, loading = false)
                        } else {
                            section
                        }
                    },
                )
            }
        }
    }

    private fun buildSections(tabId: String, children: List<BrowseItem>) {
        val browses = children.filter { it.browsable }
        // Playable-only entries (radio stations, "Biblioteca (Aleatória)") share a
        // single quick-play shelf instead of one section per item.
        val playables = children.filter { !it.browsable && it.playable }
        val sections = buildList {
            browses.forEach { add(Section(id = it.id, title = it.title, loading = true)) }
            if (playables.isNotEmpty()) {
                add(
                    Section(
                        id = "$tabId#play",
                        title = "Tocar agora",
                        items = playables,
                        loading = false,
                        direct = true,
                    ),
                )
            }
        }
        _state.update { it.copy(sections = sections) }
        sections.filter { it.loading }.forEach { client.subscribe(it.id) }
    }

    override fun onCleared() {
        seekFeedbackJob?.cancel()
        client.disconnect()
        super.onCleared()
    }

    companion object {
        private const val TAG = "AppleMusicTv"
        private const val PROGRESS_REFRESH_MS = 500L
        private const val SEEK_FEEDBACK_MS = 1500L
    }
}
