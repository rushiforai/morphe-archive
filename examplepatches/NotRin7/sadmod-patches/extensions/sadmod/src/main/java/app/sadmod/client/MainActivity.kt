package app.sadmod.client

import android.content.res.AssetManager
import android.content.res.Configuration
import android.content.res.Resources
import android.net.Uri
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import app.sadmod.client.data.bridge.SadModBridge
import app.sadmod.client.ui.SadModResourceLoader
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.rounded.Apps
import androidx.compose.material.icons.rounded.Download
import androidx.compose.material.icons.rounded.Search
import androidx.compose.material.icons.rounded.SportsEsports
import androidx.compose.material3.Badge
import androidx.compose.material3.BadgedBox
import androidx.compose.material3.Icon
import androidx.compose.material3.NavigationBar
import androidx.compose.material3.NavigationBarItem
import androidx.compose.material3.Scaffold
import androidx.compose.material3.SnackbarHost
import androidx.compose.material3.SnackbarHostState
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.sp
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.NavGraph.Companion.findStartDestination
import androidx.navigation.NavType
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.currentBackStackEntryAsState
import androidx.navigation.compose.rememberNavController
import androidx.navigation.navArgument
import app.sadmod.client.data.model.DownloadStatus
import app.sadmod.client.ui.MainViewModel
import app.sadmod.client.ui.components.SettingsSheet
import app.sadmod.client.ui.i18n.DeStrings
import app.sadmod.client.ui.i18n.EnStrings
import app.sadmod.client.ui.i18n.LocalStrings
import app.sadmod.client.ui.screens.AppDetailScreen
import app.sadmod.client.ui.screens.DownloadsScreen
import app.sadmod.client.ui.screens.FeedScreen
import app.sadmod.client.ui.screens.SearchScreen
import app.sadmod.client.ui.theme.SadModTheme
import kotlinx.coroutines.launch

class MainActivity : ComponentActivity() {
    private var isolatedTheme: Resources.Theme? = null

    override fun getResources(): Resources {
        return SadModResourceLoader.getIsolatedResources(this) ?: super.getResources()
    }

    override fun getAssets(): AssetManager {
        return SadModResourceLoader.getIsolatedAssets(this) ?: super.getAssets()
    }

    override fun getTheme(): Resources.Theme {
        val isolatedRes = SadModResourceLoader.getIsolatedResources(this) ?: return super.getTheme()
        return isolatedTheme ?: isolatedRes.newTheme().also { theme ->
            theme.applyStyle(R.style.Theme_SadMod, true)
            isolatedTheme = theme
        }
    }

    override fun onConfigurationChanged(newConfig: Configuration) {
        super.onConfigurationChanged(newConfig)
        SadModResourceLoader.syncConfiguration(this, newConfig)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        SadModBridge.init(this)
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            SadModTheme {
                SadModRoot()
            }
        }
    }
}

private enum class TopTab(
    val route: String,
    val icon: ImageVector
) {
    APPS("apps", Icons.Rounded.Apps),
    GAMES("games", Icons.Rounded.SportsEsports),
    SEARCH("search", Icons.Rounded.Search),
    DOWNLOADS("downloads", Icons.Rounded.Download)
}

@Composable
private fun SadModRoot(
    viewModel: MainViewModel = viewModel()
) {
    val settings by viewModel.settings.collectAsState()
    val strings = if (settings.language.resolveIsGerman()) DeStrings else EnStrings

    CompositionLocalProvider(LocalStrings provides strings) {
        val navController = rememberNavController()
        val backStack by navController.currentBackStackEntryAsState()
        val currentRoute = backStack?.destination?.route
        val snackbarHostState = remember { SnackbarHostState() }
        val scope = rememberCoroutineScope()
        var showSettingsSheet by remember { mutableStateOf(false) }

        val appsFeed by viewModel.appsFeed.collectAsState()
        val gamesFeed by viewModel.gamesFeed.collectAsState()
        val searchState by viewModel.searchState.collectAsState()
        val detailState by viewModel.detailState.collectAsState()
        val downloads by viewModel.downloads.collectAsState()
        val connectionTestState by viewModel.connectionTestState.collectAsState()

        val activeDownloadCount = downloads.count {
            it.status == DownloadStatus.RESOLVING ||
                it.status == DownloadStatus.DOWNLOADING ||
                it.status == DownloadStatus.VERIFYING ||
                it.status == DownloadStatus.PATCHING
        }

        val isTopLevel = TopTab.entries.any { it.route == currentRoute }

        val navigateToTab: (TopTab) -> Unit = { tab ->
            navController.navigate(tab.route) {
                popUpTo(navController.graph.findStartDestination().id) {
                    saveState = true
                }
                launchSingleTop = true
                restoreState = true
            }
        }

        val openDetail: (String) -> Unit = { urlId ->
            navController.navigate("detail/${Uri.encode(urlId)}")
        }

        Scaffold(
            snackbarHost = { SnackbarHost(snackbarHostState) },
            bottomBar = {
                if (isTopLevel) {
                    NavigationBar {
                        TopTab.entries.forEach { tab ->
                            val label = when (tab) {
                                TopTab.APPS -> strings.tabApps
                                TopTab.GAMES -> strings.tabGames
                                TopTab.SEARCH -> strings.tabSearch
                                TopTab.DOWNLOADS -> strings.tabDownloads
                            }
                            NavigationBarItem(
                                selected = currentRoute == tab.route,
                                onClick = { navigateToTab(tab) },
                                icon = {
                                    if (tab == TopTab.DOWNLOADS && activeDownloadCount > 0) {
                                        BadgedBox(
                                            badge = { Badge { Text(activeDownloadCount.toString()) } }
                                        ) {
                                            Icon(tab.icon, contentDescription = label)
                                        }
                                    } else {
                                        Icon(tab.icon, contentDescription = label)
                                    }
                                },
                                label = {
                                    Text(
                                        text = label,
                                        fontSize = 11.sp,
                                        maxLines = 1,
                                        softWrap = false,
                                        overflow = TextOverflow.Ellipsis
                                    )
                                }
                            )
                        }
                    }
                }
            }
        ) { innerPadding ->
            Box(modifier = Modifier.padding(bottom = innerPadding.calculateBottomPadding())) {
                NavHost(
                    navController = navController,
                    startDestination = TopTab.APPS.route
                ) {
                    composable(TopTab.APPS.route) {
                        FeedScreen(
                            title = strings.tabApps,
                            searchPlaceholder = strings.searchAppsHint,
                            state = appsFeed,
                            onSearchClick = { navigateToTab(TopTab.SEARCH) },
                            onOpenSettings = { showSettingsSheet = true },
                            onRefresh = { viewModel.loadAppsFeed(refresh = true) },
                            onLoadMore = { viewModel.loadMoreApps() },
                            onAppClick = openDetail,
                            modifier = Modifier.padding(top = innerPadding.calculateTopPadding())
                        )
                    }

                    composable(TopTab.GAMES.route) {
                        FeedScreen(
                            title = strings.tabGames,
                            searchPlaceholder = strings.searchGamesHint,
                            state = gamesFeed,
                            onSearchClick = { navigateToTab(TopTab.SEARCH) },
                            onOpenSettings = { showSettingsSheet = true },
                            onRefresh = { viewModel.loadGamesFeed(refresh = true) },
                            onLoadMore = { viewModel.loadMoreGames() },
                            onAppClick = openDetail,
                            modifier = Modifier.padding(top = innerPadding.calculateTopPadding())
                        )
                    }

                    composable(TopTab.SEARCH.route) {
                        SearchScreen(
                            state = searchState,
                            recentQueries = settings.recentSearches,
                            onQueryChange = { viewModel.onSearchQueryChanged(it) },
                            onSubmit = { viewModel.submitSearch(it) },
                            onLoadMore = { viewModel.loadMoreSearch() },
                            onAppClick = openDetail,
                            modifier = Modifier.padding(top = innerPadding.calculateTopPadding())
                        )
                    }

                    composable(TopTab.DOWNLOADS.route) {
                        DownloadsScreen(
                            tasks = downloads,
                            onCancel = { viewModel.downloadManager.cancelDownload(it) },
                            onRetry = { viewModel.downloadManager.retryDownload(it) },
                            onRemove = { viewModel.downloadManager.removeTask(it) },
                            onPatchPermissions = { taskId, toRemove ->
                                scope.launch {
                                    viewModel.downloadManager.patchTaskPermissions(taskId, toRemove)
                                        .onSuccess { count ->
                                            snackbarHostState.showSnackbar(strings.apkPatchedSuccess(count))
                                        }
                                        .onFailure { err ->
                                            snackbarHostState.showSnackbar(err.message ?: "Patch failed")
                                        }
                                }
                            },
                            onRestoreOriginal = { taskId ->
                                scope.launch {
                                    viewModel.downloadManager.restoreOriginalApk(taskId)
                                        .onSuccess {
                                            snackbarHostState.showSnackbar(strings.originalRestored)
                                        }
                                        .onFailure { err ->
                                            snackbarHostState.showSnackbar(err.message ?: "Restore failed")
                                        }
                                }
                            },
                            onOpenSettings = { showSettingsSheet = true },
                            onMessage = { msg ->
                                scope.launch { snackbarHostState.showSnackbar(msg) }
                            },
                            modifier = Modifier.padding(top = innerPadding.calculateTopPadding())
                        )
                    }

                    composable(
                        route = "detail/{urlId}",
                        arguments = listOf(navArgument("urlId") { type = NavType.StringType })
                    ) { entry ->
                        val encoded = entry.arguments?.getString("urlId").orEmpty()
                        val urlId = Uri.decode(encoded)
                        LaunchedEffect(urlId) {
                            viewModel.loadAppDetail(urlId)
                        }
                        AppDetailScreen(
                            state = detailState,
                            downloads = downloads,
                            onBack = { navController.popBackStack() },
                            onRetry = { viewModel.reloadAppDetail(urlId) },
                            onSearchAuthor = { author ->
                                viewModel.submitSearch(author)
                                navigateToTab(TopTab.SEARCH)
                            },
                            onDownloadMod = { mod, icon ->
                                viewModel.startDownload(
                                    urlId = mod.urlId,
                                    title = mod.title.ifBlank { detailState.bundle?.header?.title ?: urlId },
                                    refer = "${mod.title}|1",
                                    version = mod.version,
                                    iconUrl = icon,
                                    isMod = true
                                )
                                scope.launch {
                                    snackbarHostState.showSnackbar(strings.downloadStarted(mod.title))
                                }
                            },
                            onDownloadOriginal = { origId, title, version, icon ->
                                viewModel.startDownload(
                                    urlId = origId,
                                    title = title,
                                    refer = "$title|0",
                                    version = version,
                                    iconUrl = icon,
                                    isMod = false
                                )
                                scope.launch {
                                    snackbarHostState.showSnackbar(strings.downloadingOriginal)
                                }
                            },
                            onInstallError = { msg ->
                                scope.launch { snackbarHostState.showSnackbar(msg) }
                            }
                        )
                    }
                }
            }
        }

        if (showSettingsSheet) {
            val (count, totalBytes) = remember(downloads, showSettingsSheet) {
                viewModel.downloadManager.getStorageStats()
            }
            SettingsSheet(
                settings = settings,
                connectionTestState = connectionTestState,
                storageCount = count,
                storageBytes = totalBytes,
                onLanguageChange = { viewModel.setLanguage(it) },
                onDohChange = { viewModel.setDohEnabled(it) },
                onProxyChange = { mode, host, port -> viewModel.setProxy(mode, host, port) },
                onTestConnection = { viewModel.testConnection() },
                onRotateId = { viewModel.rotateAnonymousId() },
                onSaveHistoryChange = { viewModel.setSaveSearchHistory(it) },
                onCustomApiChange = { viewModel.setCustomApiBase(it) },
                onClearDownloads = {
                    val deleted = viewModel.downloadManager.clearAllDownloads()
                    scope.launch {
                        snackbarHostState.showSnackbar(strings.clearedDownloadsMsg(deleted))
                    }
                },
                onDismiss = { showSettingsSheet = false }
            )
        }
    }
}
