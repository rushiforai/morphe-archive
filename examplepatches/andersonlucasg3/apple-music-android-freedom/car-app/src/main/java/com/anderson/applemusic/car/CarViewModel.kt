package com.anderson.applemusic.car

import android.app.Application
import android.content.ComponentName
import android.content.Intent
import android.os.SystemClock
import android.util.Log
import androidx.compose.runtime.Immutable
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.viewModelScope
import com.anderson.applemusic.core.BrowseItem
import com.anderson.applemusic.core.CustomAction
import com.anderson.applemusic.core.MediaBrowserClient
import com.anderson.applemusic.core.PlaybackSnapshot
import com.anderson.applemusic.core.SearchClient
import com.anderson.applemusic.core.SearchOutcome
import com.anderson.applemusic.core.SearchResult
import com.anderson.applemusic.core.Section
import com.anderson.applemusic.core.mediaIdCandidates
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.isActive
import kotlinx.coroutines.launch

enum class ConnectionPhase { CONNECTING, CONNECTED, FAILED }

/** A top-level tab exposed by the engine (Início / Rádio / Biblioteca). */
data class CarTab(val id: String, val title: String)

/** One entry of the single drill-down level (tab root -> one detail). */
data class LevelNode(val id: String, val title: String)

@Immutable
data class CarUiState(
    val phase: ConnectionPhase = ConnectionPhase.CONNECTING,
    val error: String? = null,
    val appleMusicInstalled: Boolean = false,
    val tabs: List<CarTab> = emptyList(),
    val selectedTab: Int = 0,
    val rootLoading: Boolean = false,
    /** Biblioteca exposes its 5 categories; Início/Rádio expose shelves. */
    val isLibraryRoot: Boolean = false,
    val categories: List<BrowseItem> = emptyList(),
    val sections: List<Section> = emptyList(),
    /** At most one node: the car UI deliberately stops at two levels. */
    val stack: List<LevelNode> = emptyList(),
    val levelItems: Map<String, List<BrowseItem>> = emptyMap(),
    val levelFailed: Set<String> = emptySet(),
    val message: String? = null,
    /** Full-screen "Tocando agora" overlay. */
    val nowPlayingOpen: Boolean = false,
    /** Long-press context menu for one card/row; null when closed. */
    val itemMenu: BrowseItem? = null,
    /** Session action list over the full player. */
    val actionsOpen: Boolean = false,
    /** Catalogue search overlay. */
    val searchOpen: Boolean = false,
    val searchQuery: String = "",
    val searchBusy: Boolean = false,
    val searchResults: List<SearchResult> = emptyList(),
    val searchError: String? = null,
)

class CarViewModel(application: Application) : AndroidViewModel(application) {

    private val client = MediaBrowserClient(application)
    private val searchClient = SearchClient(application)
    private val _state = MutableStateFlow(CarUiState())
    val state: StateFlow<CarUiState> = _state.asStateFlow()

    // Playback has its own flow: the progress tick must not invalidate the browse tree.
    private val _playback = MutableStateFlow(PlaybackSnapshot())
    val playback: StateFlow<PlaybackSnapshot> = _playback.asStateFlow()

    private var messageJob: Job? = null
    private var searchJob: Job? = null

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
                    rootLoading = false,
                    stack = emptyList(),
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
                    _state.update {
                        it.copy(levelFailed = it.levelFailed + parentId)
                    }

                parentId == current.tabs.getOrNull(current.selectedTab)?.id -> {
                    _state.update { it.copy(rootLoading = false) }
                    showMessage("Não foi possível carregar esta aba")
                }

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
        // The mini player is always on screen, so refresh the position while playing.
        // Metadata is only read from the controller callbacks (see core).
        viewModelScope.launch {
            while (isActive) {
                delay(PROGRESS_REFRESH_MS)
                if (_playback.value.playing) client.refreshPlayback()
            }
        }
    }

    fun connect() {
        val installed = MediaBrowserClient.isAppleMusicInstalled(getApplication())
        _state.value = CarUiState(appleMusicInstalled = installed)
        _playback.value = PlaybackSnapshot()
        if (!installed) {
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

    /** Opens the engine's own activity so the user can sign in (intent explicita). */
    fun openAccount() {
        val app = getApplication<Application>()
        if (!MediaBrowserClient.isAppleMusicInstalled(app)) {
            showMessage("Apple Music não instalado neste dispositivo")
            return
        }
        val intent = Intent().apply {
            component = ComponentName(MediaBrowserClient.PACKAGE, ENGINE_ACCOUNT_ACTIVITY)
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        }
        try {
            app.startActivity(intent)
        } catch (t: Throwable) {
            Log.e(TAG, "account activity not available", t)
            showMessage("Não foi possível abrir o Apple Music")
        }
    }

    fun selectTab(index: Int) {
        val current = _state.value
        val tab = current.tabs.getOrNull(index) ?: return
        if (index == current.selectedTab && !current.rootLoading && current.stack.isEmpty()) return
        _state.update {
            it.copy(
                selectedTab = index,
                rootLoading = true,
                isLibraryRoot = isLibraryTab(tab),
                categories = emptyList(),
                sections = emptyList(),
                stack = emptyList(),
                levelItems = emptyMap(),
                levelFailed = emptySet(),
            )
        }
        client.subscribe(tab.id)
    }

    /** "Ver tudo" on a shelf: the only drill-down the car UI allows. */
    fun openSection(section: Section) {
        pushLevel(section.id, section.title)
    }

    /** A Biblioteca category row (Playlists, Artistas, Álbuns, …). */
    fun openCategory(item: BrowseItem) {
        if (item.browsable) {
            pushLevel(item.id, item.title)
        } else if (item.playable) {
            client.play(item.id)
        }
    }

    /**
     * Tap on a card/track. Playable items start playback immediately (car UX: tap to
     * play); browsable-only items open the single detail level.
     */
    fun openItem(item: BrowseItem) {
        when {
            item.playable -> client.play(item.id)
            item.browsable -> pushLevel(item.id, item.title)
            else -> showMessage("Item não reproduzível")
        }
    }

    /** Breadcrumb/back. Returns false when already at the tab root. */
    fun back(): Boolean {
        if (_state.value.stack.isEmpty()) return false
        _state.update { it.copy(stack = emptyList(), levelItems = emptyMap(), levelFailed = emptySet()) }
        return true
    }

    fun togglePlayPause() = client.togglePlayPause()

    fun next() = client.skipNext()

    fun previous() = client.skipPrevious()

    fun openNowPlaying() {
        _state.update { it.copy(nowPlayingOpen = true) }
    }

    /** Closing the overlay also drops any action sheet opened on top of it. */
    fun closeNowPlaying() {
        _state.update { it.copy(nowPlayingOpen = false, actionsOpen = false) }
    }

    fun openActions() {
        _state.update { it.copy(actionsOpen = true) }
    }

    fun closeActions() {
        _state.update { it.copy(actionsOpen = false) }
    }

    /** Long press on a card/row: context menu with the session actions. */
    fun openItemMenu(item: BrowseItem) {
        _state.update { it.copy(itemMenu = item) }
    }

    fun closeItemMenu() {
        _state.update { it.copy(itemMenu = null) }
    }

    fun openSearch() {
        _state.update { it.copy(searchOpen = true) }
    }

    fun closeSearch() {
        searchJob?.cancel()
        _state.update { it.copy(searchOpen = false, searchBusy = false) }
    }

    /** Catalogue search, debounced: every keystroke would otherwise cost a round trip. */
    fun setSearchQuery(text: String) {
        _state.update {
            it.copy(searchQuery = text, searchError = null)
        }
        searchJob?.cancel()
        val term = text.trim()
        if (term.length < MIN_QUERY_LENGTH) {
            _state.update { it.copy(searchResults = emptyList(), searchBusy = false) }
            return
        }
        searchJob = viewModelScope.launch {
            delay(SEARCH_DEBOUNCE_MS)
            _state.update { it.copy(searchBusy = true) }
            when (val outcome = searchClient.search(term)) {
                is SearchOutcome.Results -> _state.update {
                    it.copy(searchBusy = false, searchResults = outcome.results, searchError = null)
                }

                SearchOutcome.TokenUnavailable -> _state.update {
                    it.copy(
                        searchBusy = false,
                        searchResults = emptyList(),
                        searchError = "Não foi possível ler o token do Apple Music",
                    )
                }

                is SearchOutcome.Failure -> _state.update {
                    it.copy(
                        searchBusy = false,
                        searchResults = emptyList(),
                        searchError = outcome.message,
                    )
                }
            }
        }
    }

    fun retrySearch() {
        setSearchQuery(_state.value.searchQuery)
    }

    /** Opens the engine's own search screen (token unreadable / result not playable). */
    fun openEngineSearch() {
        SearchClient.openEngineSearch(getApplication())
    }

    /**
     * Tap on a result: the catalogue id goes to `playFromMediaId`; if the engine does
     * not load the item, its own search plays the top hit for "title artist".
     */
    fun playSearchResult(result: SearchResult) {
        val before = _playback.value
        showMessage("Tocando ${result.title}…")
        viewModelScope.launch {
            for (candidate in result.mediaIdCandidates()) {
                client.play(candidate)
                if (awaitNewTrack(before)) return@launch
            }
            SearchClient.playInEngine(getApplication(), "${result.title} ${result.artist}".trim())
            showMessage("Buscando no app do Apple Music…")
        }
    }

    /**
     * The engine loaded something: a different track, or the same one restarted (the
     * position jumps back), or playback resumed from a paused session. A result that
     * merely keeps the current queue untouched looks like "no change" and falls through
     * to the engine search.
     */
    private suspend fun awaitNewTrack(before: PlaybackSnapshot): Boolean {
        val deadline = SystemClock.elapsedRealtime() + PLAY_WAIT_MS
        while (SystemClock.elapsedRealtime() < deadline) {
            val now = _playback.value
            if (now.title.isNotBlank() && now.title != before.title) return true
            if (now.playing && !before.playing) return true
            if (now.title.isNotBlank() && now.positionMs + 1000L < before.positionMs) return true
            delay(100L)
        }
        return false
    }

    /** Full-player action: the action already belongs to the current track. */
    fun runAction(action: CustomAction) {
        client.sendCustomAction(action.action)
        _state.update { it.copy(actionsOpen = false) }
        showMessage(feedbackFor(action))
    }

    /**
     * Card context action. The engine publishes custom actions for the *current* track,
     * so a playable item is started first and we wait for it to load before sending
     * ("Criar estação" only exists once that item is the current one). Browsable-only
     * items fall back to the current session actions.
     */
    fun runItemAction(item: BrowseItem, action: CustomAction) {
        closeItemMenu()
        if (!item.playable) {
            if (_playback.value.customActions.any { it.action == action.action }) {
                client.sendCustomAction(action.action)
                showMessage(feedbackFor(action))
            } else {
                showMessage("Indisponível para este item")
            }
            return
        }
        showMessage(if (action.action == ACTION_CREATE_STATION) "Criando estação…" else "${action.title}…")
        client.play(item.id)
        viewModelScope.launch {
            if (awaitAction(action.action)) {
                client.sendCustomAction(action.action)
                showMessage(feedbackFor(action))
            } else {
                showMessage("Indisponível para este item")
            }
        }
    }

    private suspend fun awaitAction(actionId: String): Boolean {
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
        action.action == ACTION_CREATE_STATION -> "Criando estação…"
        action.action == ACTION_FAVORITE -> "Favorito aplicado"
        action.action == ACTION_ADD_TO_LIBRARY -> "Adicionado à Biblioteca"
        action.title.isNotBlank() -> "${action.title} aplicado"
        else -> "Ação enviada"
    }

    /** Touch on the seek bar: [fraction] of the current track duration. */
    fun seekToFraction(fraction: Float) {
        val playback = _playback.value
        if (playback.durationMs <= 0L) return
        val target = (playback.durationMs * fraction.coerceIn(0f, 1f)).toLong()
        client.seekTo(target)
        _playback.update { it.copy(positionMs = target) }
    }

    /** Fires the engine's CREATE_STATION session action when the track publishes it. */
    fun createStation() {
        val station = _playback.value.customActions.firstOrNull {
            it.action.endsWith("CREATE_STATION")
        }
        if (station == null) {
            showMessage("Criar estação indisponível nesta faixa")
            return
        }
        client.sendCustomAction(station.action)
        showMessage("Criando estação…")
    }

    fun canCreateStation(snapshot: PlaybackSnapshot): Boolean =
        snapshot.customActions.any { it.action.endsWith("CREATE_STATION") }

    private fun pushLevel(id: String, title: String) {
        val current = _state.value
        // Two levels max: tabs + one detail. Deeper taps stay at this level.
        if (current.stack.isNotEmpty()) {
            if (current.stack.none { it.id == id }) showMessage("Use o app do Apple Music para abrir mais níveis")
            return
        }
        _state.update {
            it.copy(
                stack = listOf(LevelNode(id, title)),
                levelItems = emptyMap(),
                levelFailed = emptySet(),
            )
        }
        client.subscribe(id)
    }

    private fun handleChildren(parentId: String, items: List<BrowseItem>) {
        val current = _state.value
        val selected = current.tabs.getOrNull(current.selectedTab)
        when {
            parentId == MediaBrowserClient.AUTO_ROOT -> {
                val tabs = items.filter { it.browsable }.map { CarTab(it.id, it.title) }
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
                        rootLoading = true,
                        isLibraryRoot = isLibraryTab(tabs[0]),
                        sections = emptyList(),
                        categories = emptyList(),
                        stack = emptyList(),
                        levelItems = emptyMap(),
                        levelFailed = emptySet(),
                    )
                }
                client.subscribe(tabs[0].id)
            }

            selected != null && parentId == selected.id -> buildRoot(selected, items)

            current.stack.any { it.id == parentId } -> _state.update {
                it.copy(
                    levelItems = it.levelItems + (parentId to items),
                    levelFailed = it.levelFailed - parentId,
                )
            }

            else -> _state.update { state ->
                state.copy(
                    sections = state.sections.map { section ->
                        if (section.id == parentId) section.copy(items = items, loading = false) else section
                    },
                )
            }
        }
    }

    private fun buildRoot(tab: CarTab, children: List<BrowseItem>) {
        if (isLibraryTab(tab)) {
            _state.update {
                it.copy(
                    isLibraryRoot = true,
                    categories = children,
                    sections = emptyList(),
                    rootLoading = false,
                )
            }
            return
        }
        val shelves = children.filter { it.browsable }
        // Playable-only entries (stations, "Biblioteca (Aleatória)") share one
        // quick-play shelf instead of one section per item.
        val playables = children.filter { !it.browsable && it.playable }
        val sections = buildList {
            shelves.forEach { add(Section(id = it.id, title = it.title, loading = true)) }
            if (playables.isNotEmpty()) {
                add(
                    Section(
                        id = "${tab.id}#play",
                        title = "Tocar agora",
                        items = playables,
                        loading = false,
                        direct = true,
                    ),
                )
            }
        }
        _state.update {
            it.copy(
                isLibraryRoot = false,
                sections = sections,
                categories = emptyList(),
                rootLoading = false,
            )
        }
        sections.filter { it.loading }.forEach { client.subscribe(it.id) }
    }

    private fun isLibraryTab(tab: CarTab): Boolean =
        tab.id.endsWith("/library") || tab.title.equals("Biblioteca", ignoreCase = true)

    private fun showMessage(text: String) {
        messageJob?.cancel()
        _state.update { it.copy(message = text) }
        messageJob = viewModelScope.launch {
            delay(MESSAGE_MS)
            _state.update { it.copy(message = null) }
        }
    }

    override fun onCleared() {
        messageJob?.cancel()
        searchJob?.cancel()
        client.disconnect()
        super.onCleared()
    }

    companion object {
        private const val TAG = "AppleMusicCar"
        private const val ENGINE_ACCOUNT_ACTIVITY = "com.apple.android.music.common.MainActivity"
        private const val PROGRESS_REFRESH_MS = 500L
        private const val MESSAGE_MS = 2500L
        private const val ITEM_ACTION_TIMEOUT_MS = 1500L
        private const val SEARCH_DEBOUNCE_MS = 400L
        private const val MIN_QUERY_LENGTH = 2
        private const val PLAY_WAIT_MS = 1500L

        const val ACTION_FAVORITE = "com.apple.android.music.playback.action.FAVORITE"
        const val ACTION_ADD_TO_LIBRARY = "com.apple.android.music.playback.action.ADD_TO_LIBRARY"
        const val ACTION_CREATE_STATION = "com.apple.android.music.playback.action.CREATE_STATION"
    }
}
