package com.anderson.applemusic.tv

import android.app.Application
import android.os.SystemClock
import android.util.Log
import androidx.compose.runtime.Immutable
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.viewModelScope
import com.anderson.applemusic.core.BrowseItem
import com.anderson.applemusic.core.CustomAction
import com.anderson.applemusic.core.MediaBrowserClient
import com.anderson.applemusic.core.PlaybackSnapshot
import com.anderson.applemusic.core.Section
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

/** One entry of the drill-down stack. */
data class LevelNode(val id: String, val title: String)

/** Transient "seeked by N seconds" hint shown by the full player. */
data class SeekFeedback(val deltaMs: Long, val positionMs: Long)

// @Immutable: same reason as Section — all collections are replaced through copy().
@Immutable
data class TvUiState(
    val phase: ConnectionPhase = ConnectionPhase.CONNECTING,
    val error: String? = null,
    val tabs: List<TvTab> = emptyList(),
    val selectedTab: Int = 0,
    val sections: List<Section> = emptyList(),
    val stack: List<LevelNode> = emptyList(),
    val levelItems: Map<String, List<BrowseItem>> = emptyMap(),
    val levelFailed: Set<String> = emptySet(),
    val nowPlayingOpen: Boolean = false,
    val seekFeedback: SeekFeedback? = null,
    val searchOpen: Boolean = false,
    /** The session action list is open on top of the full player. */
    val actionsOpen: Boolean = false,
    /** The long-press context menu is open over the browse tree. */
    val itemMenu: BrowseItem? = null,
    /** Transient "Favorito aplicado" style hint. */
    val message: String? = null,
)

class TvViewModel(application: Application) : AndroidViewModel(application) {

    private val client = MediaBrowserClient(application)
    private val _state = MutableStateFlow(TvUiState())
    val state: StateFlow<TvUiState> = _state.asStateFlow()

    // Playback lives in its own flow: the progress tick must not invalidate the
    // browse tree (shelves, grid) on every update.
    private val _playback = MutableStateFlow(PlaybackSnapshot())
    val playback: StateFlow<PlaybackSnapshot> = _playback.asStateFlow()

    private var seekFeedbackJob: Job? = null
    private var messageJob: Job? = null

    private val listener = object : MediaBrowserClient.Listener {
        override fun onConnected() {
            _state.update { it.copy(phase = ConnectionPhase.CONNECTED, error = null) }
            client.subscribe(MediaBrowserClient.AUTO_ROOT)
        }

        override fun onDisconnected(message: String) {
            Log.w(TAG, "disconnected: $message")
            _state.update {
                it.copy(
                    phase = ConnectionPhase.FAILED,
                    error = message,
                    nowPlayingOpen = false,
                    actionsOpen = false,
                    itemMenu = null,
                )
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
            _playback.value = snapshot
        }
    }

    init {
        client.listener = listener
        connect()
        viewModelScope.launch {
            while (isActive) {
                delay(PROGRESS_REFRESH_MS)
                // The position only matters on the full player; everywhere else the
                // MediaController callbacks already deliver track changes.
                if (_state.value.nowPlayingOpen) client.refreshPlayback()
            }
        }
    }

    fun connect() {
        _state.value = TvUiState()
        _playback.value = PlaybackSnapshot()
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
        val playback = _playback.value
        if (!playback.hasSession || playback.title.isBlank()) return
        _state.update { it.copy(nowPlayingOpen = true) }
    }

    fun closeNowPlaying() {
        seekFeedbackJob?.cancel()
        seekFeedbackJob = null
        _state.update {
            it.copy(nowPlayingOpen = false, seekFeedback = null, actionsOpen = false)
        }
    }

    fun openSearch() {
        _state.update { it.copy(searchOpen = true) }
    }

    fun closeSearch() {
        _state.update { it.copy(searchOpen = false) }
    }

    /** Opens the session action sheet over the full player. */
    fun openActions() {
        _state.update { it.copy(actionsOpen = true) }
    }

    fun closeActions() {
        _state.update { it.copy(actionsOpen = false) }
    }

    /** ENTER on an action row: hand the engine's action id back to the session. */
    fun runAction(action: CustomAction) {
        client.sendCustomAction(action.action)
        _state.update { it.copy(actionsOpen = false) }
        showMessage(feedbackFor(action))
    }

    /** Long-press ENTER on a card: only playable items have a context menu. */
    fun openItemMenu(item: BrowseItem) {
        if (!item.playable) return
        _state.update { it.copy(itemMenu = item) }
    }

    fun closeItemMenu() {
        _state.update { it.copy(itemMenu = null) }
    }

    /**
     * Card context action ("Criar estação" / "Adicionar à Biblioteca"): the session
     * custom actions describe the *current* track, so play the item first and wait for
     * the engine to load it (or [ITEM_ACTION_TIMEOUT_MS]) before sending the id.
     */
    fun runItemAction(item: BrowseItem, actionId: String) {
        closeItemMenu()
        showMessage(
            if (actionId == ACTION_CREATE_STATION) "Criando estação…" else "Adicionando à Biblioteca…",
        )
        client.play(item.id)
        viewModelScope.launch {
            if (awaitAction(actionId)) {
                client.sendCustomAction(actionId)
                if (actionId == ACTION_ADD_TO_LIBRARY) showMessage("Adicionado à Biblioteca")
            } else {
                showMessage("Indisponível para este item")
            }
        }
    }

    private suspend fun awaitAction(actionId: String): Boolean {
        // The session actions describe the loaded track, so wait for the item to
        // replace the previous one (or for the 1.5 s deadline) before deciding.
        val previousTitle = _playback.value.title
        val deadline = SystemClock.elapsedRealtime() + ITEM_ACTION_TIMEOUT_MS
        while (SystemClock.elapsedRealtime() < deadline) {
            val playback = _playback.value
            if (
                playback.playing &&
                playback.title != previousTitle &&
                playback.customActions.any { it.action == actionId }
            ) {
                return true
            }
            delay(100L)
        }
        return _playback.value.customActions.any { it.action == actionId }
    }

    private fun feedbackFor(action: CustomAction): String = when {
        action.action == ACTION_FAVORITE -> "Favorito aplicado"
        action.action == ACTION_CREATE_STATION -> "Criando estação…"
        action.title.isNotBlank() -> "${action.title} aplicado"
        else -> "Ação enviada"
    }

    private fun showMessage(text: String) {
        messageJob?.cancel()
        _state.update { it.copy(message = text) }
        messageJob = viewModelScope.launch {
            delay(MESSAGE_MS)
            _state.update { if (it.message == text) it.copy(message = null) else it }
        }
    }

    /** D-pad left/right on the full player's seek bar: +/- [deltaMs]. */
    fun seekBy(deltaMs: Long) {
        val playback = _playback.value
        if (playback.durationMs <= 0L) return
        val target = (playback.positionMs + deltaMs).coerceIn(0L, playback.durationMs)
        client.seekTo(target)
        _playback.update { it.copy(positionMs = target) }
        _state.update { it.copy(seekFeedback = SeekFeedback(deltaMs, target)) }
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
        messageJob?.cancel()
        client.disconnect()
        super.onCleared()
    }

    companion object {
        private const val TAG = "AppleMusicTv"
        private const val PROGRESS_REFRESH_MS = 500L
        private const val SEEK_FEEDBACK_MS = 1500L
        private const val ITEM_ACTION_TIMEOUT_MS = 1500L
        private const val MESSAGE_MS = 2000L

        // Session action ids published by the engine. The sheet is generic (it renders
        // whatever `PlaybackSnapshot.customActions` carries); these two also have a
        // card-level entry point.
        const val ACTION_FAVORITE = "com.apple.android.music.playback.action.FAVORITE"
        const val ACTION_ADD_TO_LIBRARY = "com.apple.android.music.playback.action.ADD_TO_LIBRARY"
        const val ACTION_CREATE_STATION = "com.apple.android.music.playback.action.CREATE_STATION"
    }
}
