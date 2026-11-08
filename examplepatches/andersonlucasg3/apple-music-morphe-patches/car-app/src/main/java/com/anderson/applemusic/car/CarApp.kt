package com.anderson.applemusic.car

import android.graphics.Bitmap
import android.graphics.Color as AndroidColor
import androidx.activity.compose.BackHandler
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.tween
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.slideInVertically
import androidx.compose.animation.slideOutVertically
import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.combinedClickable
import androidx.compose.foundation.gestures.awaitEachGesture
import androidx.compose.foundation.gestures.awaitFirstDown
import androidx.compose.foundation.gestures.drag
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.collectIsPressedAsState
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.BoxWithConstraints
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.heightIn
import androidx.compose.foundation.layout.offset
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.layout.widthIn
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.DisposableEffect
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.SolidColor
import androidx.compose.ui.graphics.asImageBitmap
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import androidx.lifecycle.viewmodel.compose.viewModel
import coil3.compose.AsyncImage
import coil3.request.ImageRequest
import com.anderson.applemusic.core.BrowseItem
import com.anderson.applemusic.core.CustomAction
import com.anderson.applemusic.core.PlaybackSnapshot
import com.anderson.applemusic.core.Section
import com.anderson.applemusic.core.update.UpdateChecker
import com.anderson.applemusic.core.update.UpdateController

/**
 * Touch-first client for the BYD DiLink head unit (1920x1080, API 29).
 *
 * Two navigation levels only: the tab root (shelves for Início/Rádio, a category list
 * for Biblioteca) and one detail list. The mini player is fixed at the bottom. The
 * visual language is Apple Music: black canvas, dark surfaces, Inter type and one red
 * accent; state is communicated with colour and a light scale, never with a shadow.
 */
@Composable
fun CarApp(viewModel: CarViewModel = viewModel()) {
    val state by viewModel.state.collectAsStateWithLifecycle()
    val playback by viewModel.playback.collectAsStateWithLifecycle()
    val context = LocalContext.current
    val updates = remember {
        UpdateController(
            context = context,
            artifact = UpdateChecker.ARTIFACT_CAR,
            currentVersionCode = BuildConfig.APP_VERSION_CODE.toLong(),
        )
    }
    val updateState by updates.state.collectAsStateWithLifecycle()
    // Throttled check (24 h) on open; the top-bar button forces a check.
    LaunchedEffect(updates) { updates.check(force = false) }
    DisposableEffect(updates) { onDispose { updates.close() } }

    BackHandler(enabled = state.stack.isNotEmpty() && !state.nowPlayingOpen && state.itemMenu == null) {
        viewModel.back()
    }
    BackHandler(enabled = state.searchOpen && !state.nowPlayingOpen) { viewModel.closeSearch() }
    BackHandler(enabled = state.itemMenu != null) { viewModel.closeItemMenu() }
    BackHandler(enabled = state.nowPlayingOpen) {
        if (state.actionsOpen) viewModel.closeActions() else viewModel.closeNowPlaying()
    }

    BoxWithConstraints(Modifier.fillMaxSize().background(Background)) {
        // Phone in landscape (~360 dp tall) gets smaller cards; the head unit is @1080p.
        val compact = maxHeight < 520.dp
        Column(Modifier.fillMaxSize()) {
            TopBar(
                tabs = state.tabs,
                selected = state.selectedTab,
                compact = compact,
                searchOpen = state.searchOpen,
                onSelect = viewModel::selectTab,
                onSearch = viewModel::openSearch,
                onAccount = viewModel::openAccount,
                onCheckUpdates = { updates.check(force = true) },
            )
            if (state.stack.isNotEmpty()) {
                val node = state.stack.last()
                Breadcrumb(
                    rootTitle = state.tabs.getOrNull(state.selectedTab)?.title.orEmpty(),
                    node = node,
                    count = state.levelItems[node.id]?.size,
                    onBack = viewModel::back,
                )
            }
            Box(Modifier.weight(1f).fillMaxWidth()) {
                if (state.searchOpen) {
                    CarSearchScreen(
                        query = state.searchQuery,
                        busy = state.searchBusy,
                        results = state.searchResults,
                        error = state.searchError,
                        onQueryChange = viewModel::setSearchQuery,
                        onResult = viewModel::playSearchResult,
                        onOpenEngineSearch = viewModel::openEngineSearch,
                        onRetry = viewModel::retrySearch,
                    )
                } else when (state.phase) {
                    ConnectionPhase.CONNECTING -> CenteredMessage("Conectando ao Apple Music…")
                    ConnectionPhase.FAILED -> ErrorPane(
                        message = state.error,
                        installed = state.appleMusicInstalled,
                        onRetry = viewModel::retry,
                        onAccount = viewModel::openAccount,
                    )

                    ConnectionPhase.CONNECTED -> when {
                        state.stack.isNotEmpty() -> {
                            val node = state.stack.last()
                            LevelScreen(
                                node = node,
                                items = state.levelItems[node.id],
                                failed = node.id in state.levelFailed,
                                onItem = viewModel::openItem,
                                onLongItem = viewModel::openItemMenu,
                            )
                        }

                        state.isLibraryRoot -> LibraryScreen(
                            categories = state.categories,
                            loading = state.rootLoading,
                            onCategory = viewModel::openCategory,
                            onLongCategory = viewModel::openItemMenu,
                        )

                        else -> ShelvesScreen(
                            sections = state.sections,
                            loading = state.rootLoading,
                            compact = compact,
                            onOpenSection = viewModel::openSection,
                            onItem = viewModel::openItem,
                            onLongItem = viewModel::openItemMenu,
                        )
                    }
                }
                state.message?.let { message ->
                    MessageChip(
                        text = message,
                        modifier = Modifier.align(Alignment.BottomCenter).padding(bottom = 16.dp),
                    )
                }
            }
            MiniPlayer(
                playback = playback,
                compact = compact,
                onOpen = viewModel::openNowPlaying,
                onPlayPause = viewModel::togglePlayPause,
            )
        }
        state.itemMenu?.let { item ->
            SessionActionsSheet(
                title = item.title,
                subtitle = item.subtitle.ifBlank {
                    when {
                        item.playable -> "Tocar e aplicar ação"
                        item.browsable -> "Abrir"
                        else -> ""
                    }
                },
                actions = playback.customActions,
                onAction = { action -> viewModel.runItemAction(item, action) },
                onClose = viewModel::closeItemMenu,
            )
        }
        // The full player slides over the browse tree in 180 ms; the mini player stays
        // composed underneath so the cover does not flash on the way back.
        AnimatedVisibility(
            visible = state.nowPlayingOpen,
            enter = fadeIn(tween(180)) + slideInVertically(tween(180)) { it / 10 },
            exit = fadeOut(tween(150)) + slideOutVertically(tween(150)) { it / 10 },
        ) {
            NowPlayingScreen(
                playback = playback,
                message = state.message,
                actionsOpen = state.actionsOpen,
                onClose = viewModel::closeNowPlaying,
                onOpenActions = viewModel::openActions,
                onCloseActions = viewModel::closeActions,
                onAction = viewModel::runAction,
                onPlayPause = viewModel::togglePlayPause,
                onPrevious = viewModel::previous,
                onNext = viewModel::next,
                onSeek = viewModel::seekToFraction,
                onCreateStation = viewModel::createStation,
            )
        }
        UpdateOverlay(
            state = updateState,
            currentVersionName = BuildConfig.APP_VERSION_NAME,
            onInstall = updates::downloadAndInstall,
            onCancel = updates::cancel,
            onDismiss = updates::dismiss,
        )
    }
}

@Composable
private fun TopBar(
    tabs: List<CarTab>,
    selected: Int,
    compact: Boolean,
    searchOpen: Boolean,
    onSelect: (Int) -> Unit,
    onSearch: () -> Unit,
    onAccount: () -> Unit,
    onCheckUpdates: () -> Unit,
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .height(72.dp)
            .padding(horizontal = PagePadding),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(4.dp),
    ) {
        Text(
            text = "Apple Music",
            color = Accent,
            fontSize = if (compact) 18.sp else 21.sp,
            fontWeight = FontWeight.Bold,
            letterSpacing = (-0.5).sp,
            maxLines = 1,
        )
        Spacer(Modifier.width(if (compact) 12.dp else 24.dp))
        tabs.forEachIndexed { index, tab ->
            TabButton(
                title = tab.title,
                selected = index == selected,
                onClick = { onSelect(index) },
            )
        }
        Spacer(Modifier.weight(1f))
        SearchButton(selected = searchOpen, onClick = onSearch)
        UpdatesButton(onClick = onCheckUpdates, compact = compact)
        AccountButton(onClick = onAccount, compact = compact)
    }
}

/** Magnifier in the top bar: opens the catalogue search over the browse tree. */
@Composable
private fun SearchButton(selected: Boolean, onClick: () -> Unit) {
    val interaction = remember { MutableInteractionSource() }
    val pressed by interaction.collectIsPressedAsState()
    Box(
        modifier = Modifier
            .size(48.dp)
            .clip(CircleShape)
            .background(if (pressed || selected) CardColorPressed else Color.Transparent)
            .clickable(interactionSource = interaction, indication = null, onClick = onClick),
        contentAlignment = Alignment.Center,
    ) {
        Icon(
            painter = painterResource(R.drawable.ic_search),
            contentDescription = "Busca",
            modifier = Modifier.size(20.dp),
            tint = if (selected) Accent else TextSecondary,
        )
    }
}

@Composable
private fun TabButton(title: String, selected: Boolean, onClick: () -> Unit) {
    val interaction = remember { MutableInteractionSource() }
    val pressed by interaction.collectIsPressedAsState()
    Column(
        modifier = Modifier
            .height(56.dp)
            .clip(RoundedCornerShape(ControlRadius))
            .background(if (pressed) CardColor else Color.Transparent)
            .clickable(interactionSource = interaction, indication = null, onClick = onClick)
            .padding(horizontal = 16.dp),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally,
    ) {
        Text(
            text = title,
            color = if (selected) TextPrimary else TextSecondary,
            fontSize = 15.sp,
            fontWeight = if (selected) FontWeight.SemiBold else FontWeight.Normal,
            maxLines = 1,
        )
        Spacer(Modifier.height(5.dp))
        Box(
            modifier = Modifier
                .width(22.dp)
                .height(3.dp)
                .clip(RoundedCornerShape(2.dp))
                .background(if (selected) Accent else Color.Transparent),
        )
    }
}

@Composable
private fun AccountButton(onClick: () -> Unit, compact: Boolean) {
    val interaction = remember { MutableInteractionSource() }
    val pressed by interaction.collectIsPressedAsState()
    Row(
        modifier = Modifier
            .height(48.dp)
            .clip(RoundedCornerShape(ControlRadius))
            .background(if (pressed) CardColor else Color.Transparent)
            .clickable(interactionSource = interaction, indication = null, onClick = onClick)
            .padding(horizontal = 12.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        Icon(
            painter = painterResource(R.drawable.ic_account),
            contentDescription = null,
            modifier = Modifier.size(18.dp),
            tint = if (pressed) TextPrimary else TextSecondary,
        )
        Spacer(Modifier.width(8.dp))
        Text(
            text = if (compact) "Conta" else "Entrar na conta",
            color = if (pressed) TextPrimary else TextSecondary,
            fontSize = 13.sp,
            fontWeight = FontWeight.Normal,
            maxLines = 1,
        )
    }
}

@Composable
private fun Breadcrumb(
    rootTitle: String,
    node: LevelNode,
    count: Int?,
    onBack: () -> Unit,
) {
    Row(
        modifier = Modifier.fillMaxWidth().height(56.dp).padding(horizontal = PagePadding),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        Box(
            modifier = Modifier
                .size(48.dp)
                .clip(CircleShape)
                .background(CardColor)
                .clickable { onBack() },
            contentAlignment = Alignment.Center,
        ) {
            Icon(
                painter = painterResource(R.drawable.ic_back),
                contentDescription = "Voltar",
                modifier = Modifier.size(24.dp),
                tint = TextPrimary,
            )
        }
        Spacer(Modifier.width(14.dp))
        if (rootTitle.isNotEmpty()) {
            Text(rootTitle, color = TextSecondary, fontSize = 14.sp, maxLines = 1)
            Text("  /  ", color = TextSecondary, fontSize = 14.sp)
        }
        Text(
            text = node.title,
            color = TextPrimary,
            fontSize = 16.sp,
            fontWeight = FontWeight.SemiBold,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis,
            modifier = Modifier.weight(1f),
        )
        if (count != null) {
            Text("$count itens", color = TextSecondary, fontSize = 12.sp)
        }
    }
}

@Composable
private fun ShelvesScreen(
    sections: List<Section>,
    loading: Boolean,
    compact: Boolean,
    onOpenSection: (Section) -> Unit,
    onItem: (BrowseItem) -> Unit,
    onLongItem: (BrowseItem) -> Unit,
) {
    if (loading) {
        CenteredMessage("Carregando…")
        return
    }
    val visible = sections.filter { it.loading || it.items.isNotEmpty() }
    if (visible.isEmpty()) {
        CenteredMessage("Nada por aqui")
        return
    }
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(horizontal = PagePadding, vertical = 4.dp),
        verticalArrangement = Arrangement.spacedBy(if (compact) 16.dp else SectionGap),
    ) {
        items(visible, key = { it.id }) { section ->
            Shelf(
                section = section,
                compact = compact,
                onOpenSection = { onOpenSection(section) },
                onItem = onItem,
                onLongItem = onLongItem,
            )
        }
    }
}

@Composable
private fun Shelf(
    section: Section,
    compact: Boolean,
    onOpenSection: () -> Unit,
    onItem: (BrowseItem) -> Unit,
    onLongItem: (BrowseItem) -> Unit,
) {
    Column(verticalArrangement = Arrangement.spacedBy(if (compact) 8.dp else 12.dp)) {
        Row(verticalAlignment = Alignment.CenterVertically) {
            Text(
                text = section.title,
                color = TextPrimary,
                fontSize = if (compact) 18.sp else 26.sp,
                fontWeight = FontWeight.SemiBold,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
                modifier = Modifier.weight(1f, fill = false),
            )
            if (!section.loading) {
                Spacer(Modifier.width(10.dp))
                Text("${section.items.size}", color = TextSecondary, fontSize = 12.sp)
            }
        }
        when {
            section.loading -> Text("Carregando…", color = TextSecondary, fontSize = 13.sp)
            section.items.isEmpty() -> Text("Vazio", color = TextSecondary, fontSize = 13.sp)
            else -> LazyRow(horizontalArrangement = Arrangement.spacedBy(if (compact) 12.dp else 16.dp)) {
                if (!section.direct) {
                    item(key = "all-${section.id}", contentType = "seeAll") {
                        SeeAllCard(
                            count = section.items.size,
                            compact = compact,
                            onClick = onOpenSection,
                        )
                    }
                }
                items(section.items, key = { it.id }) { item ->
                    MediaCard(
                        item = item,
                        compact = compact,
                        onClick = { onItem(item) },
                        onLongClick = { onLongItem(item) },
                    )
                }
            }
        }
    }
}

private fun cardSize(compact: Boolean): Dp = if (compact) 104.dp else 200.dp

@OptIn(ExperimentalFoundationApi::class)
@Composable
private fun MediaCard(
    item: BrowseItem,
    compact: Boolean,
    onClick: () -> Unit,
    onLongClick: () -> Unit,
) {
    val size = cardSize(compact)
    val shape = RoundedCornerShape(CardRadius)
    val interaction = remember { MutableInteractionSource() }
    val pressed by interaction.collectIsPressedAsState()
    // Colour and a short press scale only; the elevation shadow is static (no animation).
    val scale by animateFloatAsState(
        targetValue = if (pressed) 0.97f else 1f,
        animationSpec = tween(150),
        label = "mediaCardScale",
    )
    Box(
        modifier = Modifier
            .width(size)
            .height(size)
            .graphicsLayer {
                scaleX = scale
                scaleY = scale
            }
            .shadow(elevation = 12.dp, shape = shape, clip = false)
            .clip(shape)
            .combinedClickable(
                interactionSource = interaction,
                indication = null,
                onLongClick = onLongClick,
                onClick = onClick,
            ),
    ) {
        CardArtwork(item.artworkUri, size)
        // Scrim: the artwork keeps the top two thirds, the title/subtitle sit on a
        // near-opaque bottom band.
        Box(
            modifier = Modifier
                .matchParentSize()
                .background(
                    Brush.verticalGradient(
                        colorStops = arrayOf(
                            0f to Color.Transparent,
                            0.46f to Color.Transparent,
                            0.72f to Color.Black.copy(alpha = 0.5f),
                            1f to Color.Black.copy(alpha = 0.92f),
                        ),
                    ),
                ),
        )
        if (pressed) {
            Box(Modifier.matchParentSize().background(Color.White.copy(alpha = 0.06f)))
        }
        Column(
            modifier = Modifier.align(Alignment.BottomStart).padding(if (compact) 10.dp else 14.dp),
            verticalArrangement = Arrangement.spacedBy(3.dp),
        ) {
            Text(
                text = item.title,
                color = TextPrimary,
                fontSize = if (compact) 15.sp else 16.sp,
                fontWeight = FontWeight.SemiBold,
                maxLines = 2,
                overflow = TextOverflow.Ellipsis,
            )
            val subtitle = item.subtitle.ifEmpty {
                when {
                    item.playable -> "Tocar"
                    item.browsable -> "Abrir"
                    else -> ""
                }
            }
            if (subtitle.isNotEmpty()) {
                Text(
                    text = subtitle,
                    color = TextSecondary,
                    fontSize = if (compact) 12.sp else 13.sp,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                )
            }
        }
    }
}

@Composable
private fun SeeAllCard(count: Int, compact: Boolean, onClick: () -> Unit) {
    val size = cardSize(compact)
    val shape = RoundedCornerShape(CardRadius)
    val interaction = remember { MutableInteractionSource() }
    val pressed by interaction.collectIsPressedAsState()
    Box(
        modifier = Modifier
            .width(size)
            .height(size)
            .shadow(elevation = 12.dp, shape = shape, clip = false)
            .clip(shape)
            .background(
                if (pressed) {
                    SolidColor(CardColorPressed)
                } else {
                    Brush.linearGradient(listOf(CardColor, Color(0xFF121214)))
                },
            )
            .clickable(interactionSource = interaction, indication = null, onClick = onClick),
        contentAlignment = Alignment.Center,
    ) {
        Column(horizontalAlignment = Alignment.CenterHorizontally) {
            Box(
                modifier = Modifier
                    .size(if (compact) 40.dp else 48.dp)
                    .clip(CircleShape)
                    .background(Accent.copy(alpha = 0.18f)),
                contentAlignment = Alignment.Center,
            ) {
                Icon(
                    painter = painterResource(R.drawable.ic_chevron),
                    contentDescription = null,
                    modifier = Modifier.size(if (compact) 20.dp else 24.dp),
                    tint = Accent,
                )
            }
            Spacer(Modifier.height(if (compact) 8.dp else 12.dp))
            Text(
                text = "Ver tudo",
                color = TextPrimary,
                fontSize = if (compact) 15.sp else 16.sp,
                fontWeight = FontWeight.SemiBold,
            )
            Spacer(Modifier.height(2.dp))
            Text("$count itens", color = TextSecondary, fontSize = 13.sp)
        }
    }
}

@Composable
private fun LibraryScreen(
    categories: List<BrowseItem>,
    loading: Boolean,
    onCategory: (BrowseItem) -> Unit,
    onLongCategory: (BrowseItem) -> Unit,
) {
    if (loading) {
        CenteredMessage("Carregando…")
        return
    }
    if (categories.isEmpty()) {
        CenteredMessage("Nada por aqui")
        return
    }
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(horizontal = PagePadding, vertical = 12.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp),
    ) {
        items(categories, key = { it.id }) { item ->
            CategoryRow(
                item = item,
                onClick = { onCategory(item) },
                onLongClick = { onLongCategory(item) },
            )
        }
    }
}

@OptIn(ExperimentalFoundationApi::class)
@Composable
private fun CategoryRow(item: BrowseItem, onClick: () -> Unit, onLongClick: () -> Unit) {
    val interaction = remember { MutableInteractionSource() }
    val pressed by interaction.collectIsPressedAsState()
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .height(84.dp)
            .clip(RoundedCornerShape(CardRadius))
            .background(if (pressed) CardColorPressed else CardColor)
            .combinedClickable(
                interactionSource = interaction,
                indication = null,
                onLongClick = onLongClick,
                onClick = onClick,
            )
            .padding(horizontal = 18.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        Box(
            modifier = Modifier
                .size(48.dp)
                .clip(CircleShape)
                .background(Brush.linearGradient(listOf(Accent, Color(0xFF5A1018)))),
            contentAlignment = Alignment.Center,
        ) {
            Text(
                text = item.title.firstOrNull()?.uppercaseChar()?.toString() ?: "♪",
                color = Color.White,
                fontSize = 19.sp,
                fontWeight = FontWeight.Bold,
            )
        }
        Spacer(Modifier.width(16.dp))
        Column(Modifier.weight(1f)) {
            Text(
                text = item.title,
                color = TextPrimary,
                fontSize = 18.sp,
                fontWeight = FontWeight.SemiBold,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
            )
            Text(
                text = when {
                    item.browsable -> "Abrir"
                    item.playable -> "Tocar"
                    else -> ""
                },
                color = TextSecondary,
                fontSize = 13.sp,
            )
        }
        Icon(
            painter = painterResource(
                if (item.browsable) R.drawable.ic_chevron else R.drawable.ic_play,
            ),
            contentDescription = null,
            modifier = Modifier.size(24.dp),
            tint = if (item.browsable) TextSecondary else Accent,
        )
    }
}

@Composable
private fun LevelScreen(
    node: LevelNode,
    items: List<BrowseItem>?,
    failed: Boolean,
    onItem: (BrowseItem) -> Unit,
    onLongItem: (BrowseItem) -> Unit,
) {
    when {
        failed -> CenteredMessage("Não foi possível carregar “${node.title}”")
        items == null -> CenteredMessage("Carregando…")
        items.isEmpty() -> CenteredMessage("Nada por aqui")
        else -> LazyColumn(
            modifier = Modifier.fillMaxSize(),
            contentPadding = PaddingValues(horizontal = PagePadding, vertical = 8.dp),
            verticalArrangement = Arrangement.spacedBy(4.dp),
        ) {
            items(items, key = { it.id }) { item ->
                TrackRow(
                    item = item,
                    onClick = { onItem(item) },
                    onLongClick = { onLongItem(item) },
                )
            }
        }
    }
}

@OptIn(ExperimentalFoundationApi::class)
@Composable
private fun TrackRow(item: BrowseItem, onClick: () -> Unit, onLongClick: () -> Unit) {
    val interaction = remember { MutableInteractionSource() }
    val pressed by interaction.collectIsPressedAsState()
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .height(76.dp)
            .clip(RoundedCornerShape(ControlRadius))
            .background(if (pressed) CardColor else Color.Transparent)
            .combinedClickable(
                interactionSource = interaction,
                indication = null,
                onLongClick = onLongClick,
                onClick = onClick,
            )
            .padding(horizontal = 12.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        ItemArtwork(item.artworkUri, 56.dp)
        Spacer(Modifier.width(14.dp))
        Column(Modifier.weight(1f)) {
            Text(
                text = item.title,
                color = TextPrimary,
                fontSize = 16.sp,
                fontWeight = FontWeight.SemiBold,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
            )
            val subtitle = item.subtitle.ifEmpty { if (item.browsable) "Abrir" else "" }
            if (subtitle.isNotEmpty()) {
                Text(
                    text = subtitle,
                    color = TextSecondary,
                    fontSize = 13.sp,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                )
            }
        }
        Icon(
            painter = painterResource(
                if (item.playable) R.drawable.ic_play else R.drawable.ic_chevron,
            ),
            contentDescription = null,
            modifier = Modifier.size(24.dp),
            tint = if (item.playable) Accent else TextSecondary,
        )
    }
}

@Composable
private fun MiniPlayer(
    playback: PlaybackSnapshot,
    compact: Boolean,
    onOpen: () -> Unit,
    onPlayPause: () -> Unit,
) {
    val hasTrack = playback.hasSession && playback.title.isNotBlank()
    Column(Modifier.fillMaxWidth().background(PlayerColor)) {
        Box(Modifier.fillMaxWidth().height(1.dp).background(Color.White.copy(alpha = 0.08f)))
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .height(if (compact) 64.dp else 76.dp)
                // Any point of the bar except the play button opens the full player.
                .clickable(onClick = onOpen)
                .padding(horizontal = PagePadding),
            verticalAlignment = Alignment.CenterVertically,
        ) {
            PlayerArtwork(playback.artwork, 40.dp, corner = 8.dp)
            Spacer(Modifier.width(14.dp))
            Column(Modifier.weight(1f)) {
                Text(
                    text = if (hasTrack) playback.title else "Nada tocando",
                    color = if (hasTrack) TextPrimary else TextSecondary,
                    fontSize = 16.sp,
                    fontWeight = FontWeight.SemiBold,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                )
                Text(
                    text = if (hasTrack) {
                        playback.artist.ifBlank { playback.album }.ifBlank { "Apple Music" }
                    } else {
                        "Apple Music"
                    },
                    color = TextSecondary,
                    fontSize = 13.sp,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                )
            }
            Spacer(Modifier.width(12.dp))
            CircleButton(
                iconRes = if (playback.playing) R.drawable.ic_pause else R.drawable.ic_play,
                description = if (playback.playing) "Pausar" else "Tocar",
                size = 52.dp,
                iconSize = 24.dp,
                filled = true,
                onClick = onPlayPause,
            )
        }
    }
}

@Composable
private fun NowPlayingScreen(
    playback: PlaybackSnapshot,
    message: String?,
    actionsOpen: Boolean,
    onClose: () -> Unit,
    onOpenActions: () -> Unit,
    onCloseActions: () -> Unit,
    onAction: (CustomAction) -> Unit,
    onPlayPause: () -> Unit,
    onPrevious: () -> Unit,
    onNext: () -> Unit,
    onSeek: (Float) -> Unit,
    onCreateStation: () -> Unit,
) {
    BoxWithConstraints(Modifier.fillMaxSize().background(Background)) {
        val compact = maxHeight < 420.dp
        val artSize = if (compact) 180.dp else 320.dp
        val stationAvailable = playback.customActions.any {
            it.action == CarViewModel.ACTION_CREATE_STATION
        }
        // Dark gradient sampled from the current cover; the accent-tinted fallback is
        // used while the engine has no artwork.
        val backdrop = remember(playback.artwork) { nowPlayingBackdrop(playback.artwork) }
        Box(Modifier.fillMaxSize().background(Brush.verticalGradient(backdrop)))
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(
                    horizontal = if (compact) 24.dp else 40.dp,
                    vertical = if (compact) 12.dp else 24.dp,
                ),
        ) {
            Row(
                modifier = Modifier.fillMaxWidth().height(48.dp),
                verticalAlignment = Alignment.CenterVertically,
            ) {
                CircleButton(
                    iconRes = R.drawable.ic_down,
                    description = "Fechar",
                    size = 48.dp,
                    iconSize = 24.dp,
                    onClick = onClose,
                )
                Spacer(Modifier.width(14.dp))
                Text(
                    text = "TOCANDO AGORA",
                    color = Accent,
                    fontSize = 12.sp,
                    fontWeight = FontWeight.Bold,
                    letterSpacing = 1.sp,
                )
                Spacer(Modifier.weight(1f))
                ActionsPill(onClick = onOpenActions)
            }
            Spacer(Modifier.height(if (compact) 8.dp else 20.dp))
            Row(
                modifier = Modifier.fillMaxWidth().weight(1f),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(if (compact) 24.dp else 40.dp),
            ) {
                PlayerArtwork(
                    playback.artwork,
                    artSize,
                    corner = 16.dp,
                    elevation = if (compact) 0.dp else 24.dp,
                )
                Column(Modifier.weight(1f), verticalArrangement = Arrangement.Center) {
                    Text(
                        text = playback.title.ifBlank { "Nada tocando" },
                        color = TextPrimary,
                        fontSize = if (compact) 26.sp else 36.sp,
                        fontWeight = FontWeight.Bold,
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis,
                    )
                    Spacer(Modifier.height(4.dp))
                    Text(
                        text = playback.artist.ifBlank { "Apple Music" },
                        color = TextSecondary,
                        fontSize = if (compact) 15.sp else 19.sp,
                        fontWeight = FontWeight.Normal,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis,
                    )
                    if (playback.album.isNotBlank()) {
                        Text(
                            text = playback.album,
                            color = TextSecondary.copy(alpha = 0.75f),
                            fontSize = if (compact) 12.sp else 14.sp,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis,
                        )
                    }
                    Spacer(Modifier.height(if (compact) 12.dp else 28.dp))
                    SeekBar(
                        positionMs = playback.positionMs,
                        durationMs = playback.durationMs,
                        onSeek = onSeek,
                    )
                    Spacer(Modifier.height(if (compact) 4.dp else 12.dp))
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.spacedBy(if (compact) 12.dp else 16.dp),
                        verticalAlignment = Alignment.CenterVertically,
                    ) {
                        CircleButton(
                            iconRes = R.drawable.ic_prev,
                            description = "Anterior",
                            size = if (compact) 48.dp else 56.dp,
                            iconSize = 22.dp,
                            onClick = onPrevious,
                        )
                        CircleButton(
                            iconRes = if (playback.playing) R.drawable.ic_pause else R.drawable.ic_play,
                            description = if (playback.playing) "Pausar" else "Tocar",
                            size = if (compact) 64.dp else 76.dp,
                            iconSize = if (compact) 26.dp else 30.dp,
                            filled = true,
                            onClick = onPlayPause,
                        )
                        CircleButton(
                            iconRes = R.drawable.ic_next,
                            description = "Próxima",
                            size = if (compact) 48.dp else 56.dp,
                            iconSize = 22.dp,
                            onClick = onNext,
                        )
                        if (stationAvailable) {
                            Spacer(Modifier.weight(1f))
                            StationButton(available = true, onClick = onCreateStation)
                        }
                    }
                }
            }
        }
        message?.let {
            MessageChip(
                text = it,
                modifier = Modifier
                    .align(Alignment.BottomEnd)
                    .padding(horizontal = 24.dp, vertical = 24.dp),
            )
        }
        if (actionsOpen) {
            SessionActionsSheet(
                title = "Ações",
                subtitle = playback.title.ifBlank { "Nada tocando" },
                actions = playback.customActions,
                onAction = onAction,
                onClose = onCloseActions,
            )
        }
    }
}

@Composable
private fun ActionsPill(onClick: () -> Unit) {
    val interaction = remember { MutableInteractionSource() }
    val pressed by interaction.collectIsPressedAsState()
    Box(
        modifier = Modifier
            .height(48.dp)
            .clip(RoundedCornerShape(50))
            .background(if (pressed) CardColorPressed else CardColor)
            .clickable(interactionSource = interaction, indication = null, onClick = onClick)
            .padding(horizontal = 20.dp),
        contentAlignment = Alignment.Center,
    ) {
        Text(
            text = "Ações",
            color = TextPrimary,
            fontSize = 15.sp,
            fontWeight = FontWeight.SemiBold,
        )
    }
}

/**
 * Touch action sheet: the session's own custom actions (Favorito, Aleatório, Repetir,
 * Adicionar à Biblioteca, Criar Estação, …). Also used as the long-press card menu.
 */
@Composable
private fun SessionActionsSheet(
    title: String,
    subtitle: String,
    actions: List<CustomAction>,
    onAction: (CustomAction) -> Unit,
    onClose: () -> Unit,
) {
    val scrimInteraction = remember { MutableInteractionSource() }
    val panelInteraction = remember { MutableInteractionSource() }
    val panelShape = RoundedCornerShape(topStart = 24.dp, topEnd = 24.dp)
    BoxWithConstraints(
        modifier = Modifier
            .fillMaxSize()
            .background(Color.Black.copy(alpha = 0.68f))
            .clickable(interactionSource = scrimInteraction, indication = null, onClick = onClose),
        contentAlignment = Alignment.BottomCenter,
    ) {
        val actionsMaxHeight = (maxHeight * 0.94f - 160.dp).coerceAtLeast(120.dp)
        Column(
            modifier = Modifier
                // widthIn before fillMaxWidth: the sheet stays a 760 dp centred panel
                // on the 1920 px head unit instead of stretching edge to edge.
                .widthIn(max = 760.dp)
                .fillMaxWidth()
                // Static lift over the scrim; nothing here animates the shadow.
                .shadow(elevation = 28.dp, shape = panelShape, clip = false)
                .clip(panelShape)
                .background(CardColor)
                .clickable(interactionSource = panelInteraction, indication = null) {}
                .padding(top = 10.dp),
        ) {
            Box(
                Modifier
                    .align(Alignment.CenterHorizontally)
                    .width(40.dp)
                    .height(4.dp)
                    .clip(RoundedCornerShape(2.dp))
                    .background(TextSecondary.copy(alpha = 0.4f)),
            )
            Column(Modifier.padding(horizontal = 24.dp, vertical = 10.dp)) {
                Text(
                    text = title,
                    color = TextPrimary,
                    fontSize = 22.sp,
                    fontWeight = FontWeight.Bold,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis,
                )
                if (subtitle.isNotBlank()) {
                    Text(
                        text = subtitle,
                        color = TextSecondary,
                        fontSize = 13.sp,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis,
                    )
                }
            }
            if (actions.isEmpty()) {
                Box(Modifier.fillMaxWidth().padding(horizontal = 24.dp, vertical = 28.dp)) {
                    Text(
                        "Nenhuma ação anunciada para esta faixa",
                        color = TextSecondary,
                        fontSize = 15.sp,
                        textAlign = TextAlign.Center,
                    )
                }
            } else {
                Column(
                    modifier = Modifier
                        .heightIn(max = actionsMaxHeight)
                        .verticalScroll(rememberScrollState())
                        .padding(horizontal = 12.dp),
                    verticalArrangement = Arrangement.spacedBy(4.dp),
                ) {
                    actions.forEach { action ->
                        ActionRow(action = action, onClick = { onAction(action) })
                    }
                }
            }
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(56.dp)
                    .clickable(onClick = onClose),
                contentAlignment = Alignment.Center,
            ) {
                Text("Fechar", color = TextSecondary, fontSize = 15.sp, fontWeight = FontWeight.Normal)
            }
        }
    }
}

@Composable
private fun ActionRow(action: CustomAction, onClick: () -> Unit) {
    val interaction = remember { MutableInteractionSource() }
    val pressed by interaction.collectIsPressedAsState()
    val highlighted = action.action == CarViewModel.ACTION_CREATE_STATION
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .height(56.dp)
            .clip(RoundedCornerShape(12.dp))
            .background(if (pressed) CardColorPressed else Color.Transparent)
            .clickable(interactionSource = interaction, indication = null, onClick = onClick)
            .padding(horizontal = 16.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        Box(
            Modifier
                .size(8.dp)
                .clip(CircleShape)
                .background(if (highlighted) Accent else TextSecondary),
        )
        Spacer(Modifier.width(14.dp))
        Text(
            text = action.title.ifBlank { action.action },
            color = if (highlighted) Accent else TextPrimary,
            fontSize = 16.sp,
            fontWeight = FontWeight.Normal,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis,
        )
    }
}

@Composable
private fun SeekBar(positionMs: Long, durationMs: Long, onSeek: (Float) -> Unit) {
    val fraction = if (durationMs > 0L) {
        (positionMs.toFloat() / durationMs.toFloat()).coerceIn(0f, 1f)
    } else {
        0f
    }
    Row(
        modifier = Modifier
            .fillMaxWidth()
            // 48 dp tall: the whole strip is a touch target, not just the 4 dp track.
            .height(48.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        Text(
            text = formatTime(positionMs),
            color = TextSecondary,
            fontSize = 12.sp,
            modifier = Modifier.width(46.dp),
        )
        BoxWithConstraints(
            modifier = Modifier
                .weight(1f)
                .height(48.dp)
                // Tap and drag share one detector: the strip is 48 dp tall, so the whole
                // area scrubs and the 5 dp track never has to be hit exactly.
                .pointerInput(durationMs) {
                    if (durationMs <= 0L) return@pointerInput
                    awaitEachGesture {
                        fun seekAt(x: Float) {
                            onSeek((x / size.width.coerceIn(1, Int.MAX_VALUE)).coerceIn(0f, 1f))
                        }
                        val down = awaitFirstDown()
                        seekAt(down.position.x)
                        down.consume()
                        drag(down.id) { change ->
                            seekAt(change.position.x)
                            change.consume()
                        }
                    }
                },
            contentAlignment = Alignment.CenterStart,
        ) {
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(5.dp)
                    .clip(RoundedCornerShape(3.dp))
                    .background(TrackColor),
            ) {
                Box(
                    Modifier
                        .fillMaxWidth(fraction)
                        .height(5.dp)
                        .background(Accent),
                )
            }
            if (durationMs > 0L) {
                val thumbX = (maxWidth * fraction - 6.dp)
                    .coerceIn(0.dp, (maxWidth - 12.dp).coerceAtLeast(0.dp))
                Box(
                    modifier = Modifier
                        .offset(x = thumbX)
                        .size(12.dp)
                        .clip(CircleShape)
                        .background(Accent),
                )
            }
        }
        Text(
            text = formatTime(durationMs),
            color = TextSecondary,
            fontSize = 12.sp,
            modifier = Modifier.width(46.dp),
            textAlign = TextAlign.End,
        )
    }
}

@Composable
private fun CircleButton(
    iconRes: Int,
    description: String,
    size: Dp,
    iconSize: Dp,
    filled: Boolean = false,
    onClick: () -> Unit,
) {
    val interaction = remember { MutableInteractionSource() }
    val pressed by interaction.collectIsPressedAsState()
    Box(
        modifier = Modifier
            .size(size)
            .clip(CircleShape)
            .background(
                when {
                    !filled -> if (pressed) CardColorPressed else CardColor
                    pressed -> Accent.copy(alpha = 0.82f)
                    else -> Accent
                },
            )
            .clickable(interactionSource = interaction, indication = null, onClick = onClick),
        contentAlignment = Alignment.Center,
    ) {
        Icon(
            painter = painterResource(iconRes),
            contentDescription = description,
            modifier = Modifier.size(iconSize),
            tint = if (filled) Color.White else TextPrimary,
        )
    }
}

@Composable
private fun StationButton(available: Boolean, onClick: () -> Unit) {
    val interaction = remember { MutableInteractionSource() }
    val pressed by interaction.collectIsPressedAsState()
    Row(
        modifier = Modifier
            .height(48.dp)
            .clip(RoundedCornerShape(50))
            .background(if (pressed) TrackColor else CardColorPressed)
            .clickable(interactionSource = interaction, indication = null, onClick = onClick)
            .padding(horizontal = 20.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        Icon(
            painter = painterResource(R.drawable.ic_plus),
            contentDescription = null,
            modifier = Modifier.size(18.dp),
            tint = if (available) Accent else TextSecondary,
        )
        Spacer(Modifier.width(8.dp))
        Text(
            text = "Criar estação",
            color = if (available) TextPrimary else TextSecondary,
            fontSize = 15.sp,
            fontWeight = FontWeight.SemiBold,
            maxLines = 1,
        )
    }
}

@Composable
private fun CardArtwork(uri: String?, size: Dp) {
    Box(Modifier.size(size).clip(RoundedCornerShape(CardRadius))) {
        PlaceholderArt(size, CardRadius)
        if (uri != null) {
            val context = LocalContext.current
            val artPx = with(LocalDensity.current) { size.roundToPx() }
            AsyncImage(
                // Explicit target size: decode a thumbnail instead of the full CDN image.
                model = remember(uri, artPx) {
                    ImageRequest.Builder(context).data(uri).size(artPx, artPx).build()
                },
                contentDescription = null,
                modifier = Modifier.fillMaxSize(),
                contentScale = ContentScale.Crop,
            )
        }
    }
}

@Composable
private fun ItemArtwork(uri: String?, size: Dp) {
    Box(Modifier.size(size).clip(RoundedCornerShape(10.dp))) {
        PlaceholderArt(size, 10.dp)
        if (uri != null) {
            val context = LocalContext.current
            val artPx = with(LocalDensity.current) { size.roundToPx() }
            AsyncImage(
                model = remember(uri, artPx) {
                    ImageRequest.Builder(context).data(uri).size(artPx, artPx).build()
                },
                contentDescription = null,
                modifier = Modifier.fillMaxSize(),
                contentScale = ContentScale.Crop,
            )
        }
    }
}

@Composable
private fun PlayerArtwork(bitmap: Bitmap?, size: Dp, corner: Dp = 12.dp, elevation: Dp = 0.dp) {
    val shape = RoundedCornerShape(corner)
    val modifier = Modifier.size(size).shadow(elevation, shape).clip(shape)
    if (bitmap != null) {
        Image(
            bitmap = bitmap.asImageBitmap(),
            contentDescription = null,
            modifier = modifier,
            contentScale = ContentScale.Crop,
        )
    } else {
        Box(modifier) { PlaceholderArt(size, corner) }
    }
}

@Composable
private fun PlaceholderArt(size: Dp, corner: Dp) {
    Box(
        modifier = Modifier
            .size(size)
            .clip(RoundedCornerShape(corner))
            .background(Brush.linearGradient(listOf(Accent.copy(alpha = 0.85f), Color(0xFF5A1018)))),
        contentAlignment = Alignment.Center,
    ) {
        Text(
            text = "♪",
            color = Color.White.copy(alpha = 0.45f),
            fontSize = (size.value * 0.32f).sp,
        )
    }
}

@Composable
private fun MessageChip(text: String, modifier: Modifier = Modifier) {
    Box(
        modifier = modifier
            .clip(RoundedCornerShape(50))
            .background(CardColorPressed)
            .padding(horizontal = 20.dp, vertical = 10.dp),
    ) {
        Text(text, color = TextPrimary, fontSize = 14.sp)
    }
}

@Composable
private fun CenteredMessage(message: String) {
    Box(Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
        Text(message, color = TextSecondary, fontSize = 18.sp)
    }
}

@Composable
private fun ErrorPane(
    message: String?,
    installed: Boolean,
    onRetry: () -> Unit,
    onAccount: () -> Unit,
) {
    Box(Modifier.fillMaxSize().padding(PagePadding), contentAlignment = Alignment.Center) {
        Column(
            modifier = Modifier.widthIn(max = 620.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
        ) {
            Box(
                modifier = Modifier
                    .size(76.dp)
                    .clip(CircleShape)
                    .background(Accent.copy(alpha = 0.14f)),
                contentAlignment = Alignment.Center,
            ) {
                Icon(
                    painter = painterResource(R.drawable.ic_error),
                    contentDescription = null,
                    modifier = Modifier.size(36.dp),
                    tint = Accent,
                )
            }
            Spacer(Modifier.height(20.dp))
            Text(
                text = message ?: "Serviço indisponível",
                color = TextPrimary,
                fontSize = 24.sp,
                fontWeight = FontWeight.Bold,
                textAlign = TextAlign.Center,
            )
            Spacer(Modifier.height(8.dp))
            Text(
                text = if (installed) {
                    "Verifique se o Apple Music está logado e se a sessão de mídia está ativa."
                } else {
                    "Instale o Apple Music patcheado (certificado Morphe) neste dispositivo."
                },
                color = TextSecondary,
                fontSize = 15.sp,
                lineHeight = 21.sp,
                textAlign = TextAlign.Center,
            )
            Spacer(Modifier.height(24.dp))
            Row(horizontalArrangement = Arrangement.spacedBy(12.dp)) {
                PaneButton(text = "Tentar de novo", primary = true, onClick = onRetry)
                if (installed) {
                    PaneButton(text = "Entrar na conta", primary = false, onClick = onAccount)
                }
            }
        }
    }
}

@Composable
private fun PaneButton(text: String, primary: Boolean, onClick: () -> Unit) {
    val interaction = remember { MutableInteractionSource() }
    val pressed by interaction.collectIsPressedAsState()
    Box(
        modifier = Modifier
            .height(48.dp)
            .clip(RoundedCornerShape(ControlRadius))
            .background(
                when {
                    primary && pressed -> Accent.copy(alpha = 0.85f)
                    primary -> Accent
                    pressed -> CardColorPressed
                    else -> CardColor
                },
            )
            .clickable(interactionSource = interaction, indication = null, onClick = onClick)
            .padding(horizontal = 20.dp),
        contentAlignment = Alignment.Center,
    ) {
        Text(
            text = text,
            color = if (primary) Color.White else TextPrimary,
            fontSize = 15.sp,
            fontWeight = FontWeight.SemiBold,
        )
    }
}

private fun formatTime(millis: Long): String {
    if (millis <= 0L) return "0:00"
    val totalSeconds = millis / 1000L
    val minutes = totalSeconds / 60L
    val seconds = totalSeconds % 60L
    return "%d:%02d".format(minutes, seconds)
}

/**
 * Full-player backdrop: the cover's average hue sunk to a dark tint, so each track gets
 * a different (but still black-ish) background. Falls back to the accent-red gradient
 * while the session has no artwork or the bitmap cannot be read (hardware bitmap).
 */
private fun nowPlayingBackdrop(bitmap: Bitmap?): List<Color> {
    val fallback = listOf(Color(0xFF2A1014), Color(0xFF140A0C), Background)
    if (bitmap == null || bitmap.isRecycled) return fallback
    return runCatching {
        val stepX = (bitmap.width / 8).coerceAtLeast(1)
        val stepY = (bitmap.height / 8).coerceAtLeast(1)
        var red = 0L
        var green = 0L
        var blue = 0L
        var samples = 0
        var y = stepY / 2
        while (y < bitmap.height) {
            var x = stepX / 2
            while (x < bitmap.width) {
                val pixel = bitmap.getPixel(x, y)
                if (((pixel ushr 24) and 0xFF) >= 0x80) {
                    red += (pixel shr 16) and 0xFF
                    green += (pixel shr 8) and 0xFF
                    blue += pixel and 0xFF
                    samples++
                }
                x += stepX
            }
            y += stepY
        }
        if (samples == 0) return@runCatching fallback
        val hsv = FloatArray(3)
        AndroidColor.RGBToHSV(
            (red / samples).toInt(),
            (green / samples).toInt(),
            (blue / samples).toInt(),
            hsv,
        )
        hsv[1] = hsv[1].coerceIn(0.22f, 0.62f)
        hsv[2] = 0.34f
        val top = Color(AndroidColor.HSVToColor(hsv))
        hsv[2] = 0.16f
        val middle = Color(AndroidColor.HSVToColor(hsv))
        listOf(top, middle, Background)
    }.getOrDefault(fallback)
}
