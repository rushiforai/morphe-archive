package app.sadmod.client.ui

import android.app.Application
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.viewModelScope
import app.sadmod.client.SadModApp
import app.sadmod.client.data.model.AppDetailBundle
import app.sadmod.client.data.model.AppSummary
import app.sadmod.client.data.model.DownloadTask
import app.sadmod.client.data.model.IndexCategoryBlock
import app.sadmod.client.data.prefs.AppLanguage
import app.sadmod.client.data.prefs.ProxyMode
import app.sadmod.client.data.prefs.UserSettings
import kotlinx.coroutines.Job
import kotlinx.coroutines.async
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch

data class FeedUiState(
    val isLoading: Boolean = true,
    val isRefreshing: Boolean = false,
    val isLoadingMore: Boolean = false,
    val currentPage: Int = 1,
    val canLoadMore: Boolean = true,
    val featured: List<AppSummary> = emptyList(),
    val sections: List<IndexCategoryBlock> = emptyList(),
    val error: String? = null
)

data class SearchUiState(
    val query: String = "",
    val isSearching: Boolean = false,
    val isLoadingMore: Boolean = false,
    val currentPage: Int = 1,
    val hasNextPage: Boolean = false,
    val results: List<AppSummary> = emptyList(),
    val error: String? = null
)

data class DetailUiState(
    val isLoading: Boolean = true,
    val bundle: AppDetailBundle? = null,
    val error: String? = null
)

sealed interface ConnectionTestState {
    data object Idle : ConnectionTestState
    data object Testing : ConnectionTestState
    data class Success(val latencyMs: Long) : ConnectionTestState
    data class Error(val message: String) : ConnectionTestState
}

class MainViewModel(application: Application) : AndroidViewModel(application) {
    private val app = application as SadModApp
    private val api = app.api
    val preferences = app.preferences
    val downloadManager = app.downloadManager

    val settings: StateFlow<UserSettings> = preferences.settings
    val downloads: StateFlow<List<DownloadTask>> = downloadManager.tasks

    private val _appsFeed = MutableStateFlow(FeedUiState())
    val appsFeed: StateFlow<FeedUiState> = _appsFeed.asStateFlow()

    private val _gamesFeed = MutableStateFlow(FeedUiState())
    val gamesFeed: StateFlow<FeedUiState> = _gamesFeed.asStateFlow()

    private val _searchState = MutableStateFlow(SearchUiState())
    val searchState: StateFlow<SearchUiState> = _searchState.asStateFlow()

    private val _detailState = MutableStateFlow(DetailUiState())
    val detailState: StateFlow<DetailUiState> = _detailState.asStateFlow()

    private val _connectionTestState = MutableStateFlow<ConnectionTestState>(ConnectionTestState.Idle)
    val connectionTestState: StateFlow<ConnectionTestState> = _connectionTestState.asStateFlow()

    private var searchJob: Job? = null

    init {
        loadAppsFeed()
        loadGamesFeed()
    }

    fun setLanguage(language: AppLanguage) {
        val prevApiLang = preferences.settings.value.language.apiLangCode()
        preferences.setLanguage(language)
        if (prevApiLang != language.apiLangCode()) {
            loadAppsFeed(refresh = true)
            loadGamesFeed(refresh = true)
        }
    }

    fun setDohEnabled(enabled: Boolean) {
        preferences.setDohEnabled(enabled)
        _connectionTestState.value = ConnectionTestState.Idle
    }

    fun setProxy(mode: ProxyMode, host: String, port: Int) {
        preferences.setProxy(mode, host, port)
        _connectionTestState.value = ConnectionTestState.Idle
    }

    fun setSaveSearchHistory(enabled: Boolean) = preferences.setSaveSearchHistory(enabled)

    fun setCustomApiBase(baseUrl: String) {
        preferences.setCustomApiBase(baseUrl)
        loadAppsFeed(refresh = true)
        loadGamesFeed(refresh = true)
    }

    fun rotateAnonymousId() = preferences.rotateAnonymousId()

    fun testConnection() {
        _connectionTestState.value = ConnectionTestState.Testing
        viewModelScope.launch {
            api.testConnection()
                .onSuccess { ms -> _connectionTestState.value = ConnectionTestState.Success(ms) }
                .onFailure { err ->
                    _connectionTestState.value = ConnectionTestState.Error(err.message ?: "Failed")
                }
        }
    }

    fun loadAppsFeed(refresh: Boolean = false) {
        viewModelScope.launch {
            _appsFeed.update {
                if (refresh) it.copy(isRefreshing = true, error = null)
                else it.copy(isLoading = it.sections.isEmpty(), error = null)
            }
            try {
                val featDef = async { runCatching { api.fetchFeaturedApps(1) }.getOrDefault(emptyList()) }
                val blocksDef = async { api.fetchAppFeed(1) }
                val featured = featDef.await()
                val blocks = blocksDef.await()
                _appsFeed.update {
                    FeedUiState(
                        isLoading = false,
                        isRefreshing = false,
                        currentPage = 1,
                        canLoadMore = blocks.isNotEmpty(),
                        featured = featured,
                        sections = blocks
                    )
                }
            } catch (t: Throwable) {
                _appsFeed.update {
                    it.copy(
                        isLoading = false,
                        isRefreshing = false,
                        error = t.message ?: "Failed to load apps"
                    )
                }
            }
        }
    }

    fun loadMoreApps() {
        val cur = _appsFeed.value
        if (cur.isLoading || cur.isLoadingMore || !cur.canLoadMore) return
        val nextPage = cur.currentPage + 1
        viewModelScope.launch {
            _appsFeed.update { it.copy(isLoadingMore = true) }
            runCatching { api.fetchAppFeed(nextPage) }
                .onSuccess { newBlocks ->
                    _appsFeed.update {
                        it.copy(
                            isLoadingMore = false,
                            currentPage = nextPage,
                            canLoadMore = newBlocks.isNotEmpty(),
                            sections = it.sections + newBlocks
                        )
                    }
                }
                .onFailure {
                    _appsFeed.update { it.copy(isLoadingMore = false, canLoadMore = false) }
                }
        }
    }

    fun loadGamesFeed(refresh: Boolean = false) {
        viewModelScope.launch {
            _gamesFeed.update {
                if (refresh) it.copy(isRefreshing = true, error = null)
                else it.copy(isLoading = it.sections.isEmpty(), error = null)
            }
            try {
                val featDef = async { runCatching { api.fetchFeaturedGames(1) }.getOrDefault(emptyList()) }
                val blocksDef = async { api.fetchGameFeed(1) }
                val featured = featDef.await()
                val blocks = blocksDef.await()
                _gamesFeed.update {
                    FeedUiState(
                        isLoading = false,
                        isRefreshing = false,
                        currentPage = 1,
                        canLoadMore = blocks.isNotEmpty(),
                        featured = featured,
                        sections = blocks
                    )
                }
            } catch (t: Throwable) {
                _gamesFeed.update {
                    it.copy(
                        isLoading = false,
                        isRefreshing = false,
                        error = t.message ?: "Failed to load games"
                    )
                }
            }
        }
    }

    fun loadMoreGames() {
        val cur = _gamesFeed.value
        if (cur.isLoading || cur.isLoadingMore || !cur.canLoadMore) return
        val nextPage = cur.currentPage + 1
        viewModelScope.launch {
            _gamesFeed.update { it.copy(isLoadingMore = true) }
            runCatching { api.fetchGameFeed(nextPage) }
                .onSuccess { newBlocks ->
                    _gamesFeed.update {
                        it.copy(
                            isLoadingMore = false,
                            currentPage = nextPage,
                            canLoadMore = newBlocks.isNotEmpty(),
                            sections = it.sections + newBlocks
                        )
                    }
                }
                .onFailure {
                    _gamesFeed.update { it.copy(isLoadingMore = false, canLoadMore = false) }
                }
        }
    }

    fun onSearchQueryChanged(query: String, immediate: Boolean = false) {
        _searchState.update { it.copy(query = query, error = null) }
        searchJob?.cancel()
        val trimmed = query.trim()
        if (trimmed.isEmpty()) {
            _searchState.update {
                it.copy(isSearching = false, results = emptyList(), hasNextPage = false, currentPage = 1)
            }
            return
        }
        searchJob = viewModelScope.launch {
            if (!immediate) delay(350L)
            executeSearch(trimmed, page = 1)
        }
    }

    fun submitSearch(query: String) {
        val trimmed = query.trim()
        if (trimmed.isEmpty()) return
        onSearchQueryChanged(trimmed, immediate = true)
    }

    fun loadMoreSearch() {
        val cur = _searchState.value
        if (cur.isSearching || cur.isLoadingMore || !cur.hasNextPage || cur.query.isBlank()) return
        val nextPage = cur.currentPage + 1
        viewModelScope.launch {
            _searchState.update { it.copy(isLoadingMore = true) }
            runCatching { api.searchApps(cur.query.trim(), nextPage) }
                .onSuccess { res ->
                    _searchState.update {
                        it.copy(
                            isLoadingMore = false,
                            currentPage = nextPage,
                            hasNextPage = res.hasNextPage == 1,
                            results = it.results + res.list
                        )
                    }
                }
                .onFailure {
                    _searchState.update { it.copy(isLoadingMore = false) }
                }
        }
    }

    private suspend fun executeSearch(query: String, page: Int) {
        _searchState.update { it.copy(isSearching = true, error = null) }
        runCatching { api.searchApps(query, page) }
            .onSuccess { res ->
                preferences.recordSearch(query)
                _searchState.update { state ->
                    state.copy(
                        isSearching = false,
                        currentPage = page,
                        hasNextPage = res.hasNextPage == 1,
                        results = res.list,
                        error = null
                    )
                }
            }
            .onFailure { t ->
                _searchState.update {
                    it.copy(isSearching = false, error = t.message ?: "Search failed")
                }
            }
    }

    fun loadAppDetail(urlId: String) {
        if (_detailState.value.bundle?.urlId == urlId && _detailState.value.error == null) return
        _detailState.value = DetailUiState(isLoading = true)
        viewModelScope.launch {
            runCatching { api.fetchAppDetail(urlId) }
                .onSuccess { bundle ->
                    _detailState.value = DetailUiState(isLoading = false, bundle = bundle)
                }
                .onFailure { t ->
                    _detailState.value = DetailUiState(
                        isLoading = false,
                        error = t.message ?: "Details failed to load"
                    )
                }
        }
    }

    fun reloadAppDetail(urlId: String) {
        _detailState.value = DetailUiState(isLoading = true)
        viewModelScope.launch {
            runCatching { api.fetchAppDetail(urlId) }
                .onSuccess { bundle ->
                    _detailState.value = DetailUiState(isLoading = false, bundle = bundle)
                }
                .onFailure { t ->
                    _detailState.value = DetailUiState(
                        isLoading = false,
                        error = t.message ?: "Details failed to load"
                    )
                }
        }
    }

    fun startDownload(
        urlId: String,
        title: String,
        refer: String,
        version: String,
        iconUrl: String,
        isMod: Boolean
    ) {
        downloadManager.enqueueDownload(
            urlId = urlId,
            title = title,
            refer = refer,
            version = version,
            iconUrl = iconUrl,
            isMod = isMod
        )
    }
}
