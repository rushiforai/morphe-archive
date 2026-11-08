@file:OptIn(ExperimentalTvMaterial3Api::class, ExperimentalFoundationApi::class)

package com.anderson.applemusic.tv

import android.graphics.Bitmap
import androidx.activity.compose.BackHandler
import androidx.compose.animation.animateColorAsState
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.focusable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.layout.widthIn
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyListState
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.foundation.lazy.layout.LazyLayoutCacheWindow
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.runtime.Composable
import androidx.compose.runtime.DisposableEffect
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.setValue
import androidx.compose.runtime.withFrameNanos
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.scale
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.focus.FocusRequester
import androidx.compose.ui.focus.focusRequester
import androidx.compose.ui.focus.onFocusChanged
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.asImageBitmap
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.input.key.Key
import androidx.compose.ui.input.key.KeyEventType
import androidx.compose.ui.input.key.key
import androidx.compose.ui.input.key.onKeyEvent
import androidx.compose.ui.input.key.onPreviewKeyEvent
import androidx.compose.ui.input.key.type
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.tv.material3.ExperimentalTvMaterial3Api
import androidx.tv.material3.Icon
import androidx.tv.material3.Text
import coil3.compose.AsyncImage
import coil3.request.ImageRequest
import com.anderson.applemusic.core.BrowseItem
import com.anderson.applemusic.core.CustomAction
import com.anderson.applemusic.core.PlaybackSnapshot
import com.anderson.applemusic.core.Section
import com.anderson.applemusic.core.update.UpdateChecker
import com.anderson.applemusic.core.update.UpdateController
import com.anderson.applemusic.core.update.UpdatePhase
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import kotlin.math.abs

private const val CARDS_PER_ROW = 4
private const val SEEK_STEP_MS = 10_000L
private const val LONG_PRESS_MS = 500L

private val CardWidth = 220.dp
private val CardHeight = 124.dp

@Composable
fun TvApp(viewModel: TvViewModel = viewModel()) {
    val state by viewModel.state.collectAsStateWithLifecycle()
    val context = LocalContext.current
    val updates = remember {
        UpdateController(
            context = context,
            artifact = UpdateChecker.ARTIFACT_TV,
            currentVersionCode = BuildConfig.APP_VERSION_CODE.toLong(),
        )
    }
    val updateState by updates.state.collectAsStateWithLifecycle()
    // Throttled check (24 h) on open; the header chip forces a check.
    LaunchedEffect(updates) { updates.check(force = false) }
    DisposableEffect(updates) { onDispose { updates.close() } }
    val firstTabFocus = remember { FocusRequester() }
    val playerFocus = remember { FocusRequester() }
    val actionsButtonFocus = remember { FocusRequester() }
    var everOpenedPlayer by remember { mutableStateOf(false) }
    var openedActionsOnce by remember { mutableStateOf(false) }
    var openedMenuOnce by remember { mutableStateOf(false) }
    var menuOriginFocus by remember { mutableStateOf<FocusRequester?>(null) }

    // TV apps start with nothing focused; put the D-pad on the tab bar and put it
    // back there whenever the drill-down stack returns to a tab root. The update modal
    // owns the focus while it is open.
    LaunchedEffect(state.tabs.size, state.stack.size, updateState.phase) {
        if (
            state.tabs.isNotEmpty() && state.stack.isEmpty() && !state.nowPlayingOpen &&
            !state.searchOpen && state.itemMenu == null && !state.actionsOpen &&
            updateState.phase == UpdatePhase.IDLE
        ) {
            withFrameNanos { }
            runCatching { firstTabFocus.requestFocus() }
        }
    }

    // Closing the full player returns the D-pad to the top-right player chip.
    LaunchedEffect(state.nowPlayingOpen) {
        if (state.nowPlayingOpen) {
            everOpenedPlayer = true
        } else if (everOpenedPlayer) {
            withFrameNanos { }
            runCatching { playerFocus.requestFocus() }
        }
    }

    // Closing the action sheet returns the D-pad to its "Ações" button.
    LaunchedEffect(state.actionsOpen) {
        if (state.actionsOpen) {
            openedActionsOnce = true
        } else if (openedActionsOnce && state.nowPlayingOpen) {
            withFrameNanos { }
            runCatching { actionsButtonFocus.requestFocus() }
        }
    }

    // Closing the card menu returns the D-pad to the card that opened it.
    LaunchedEffect(state.itemMenu) {
        if (state.itemMenu != null) {
            openedMenuOnce = true
        } else if (openedMenuOnce) {
            withFrameNanos { }
            runCatching { menuOriginFocus?.requestFocus() }
        }
    }

    BackHandler(enabled = state.actionsOpen) { viewModel.closeActions() }
    BackHandler(enabled = state.itemMenu != null) { viewModel.closeItemMenu() }
    BackHandler(enabled = state.nowPlayingOpen && !state.actionsOpen) { viewModel.closeNowPlaying() }
    BackHandler(
        enabled = !state.nowPlayingOpen && state.itemMenu == null && state.stack.isNotEmpty(),
    ) { viewModel.back() }
    BackHandler(enabled = !state.nowPlayingOpen && state.searchOpen) { viewModel.closeSearch() }

    AppleMusicTvTheme {
        Box(Modifier.fillMaxSize().background(Background)) {
            if (state.nowPlayingOpen) {
                NowPlayingScreen(
                    playbackFlow = viewModel.playback,
                    seekFeedback = state.seekFeedback,
                    actionsButtonFocus = actionsButtonFocus,
                    onPlayPause = viewModel::togglePlayPause,
                    onPrevious = viewModel::previous,
                    onNext = viewModel::next,
                    onSeekBy = viewModel::seekBy,
                    onOpenActions = viewModel::openActions,
                    onAction = viewModel::runAction,
                )
            } else {
                Column(Modifier.fillMaxSize()) {
                    Header(
                        tabs = state.tabs,
                        selected = state.selectedTab,
                        searchOpen = state.searchOpen,
                        playbackFlow = viewModel.playback,
                        onSelect = viewModel::selectTab,
                        onSearch = viewModel::openSearch,
                        onOpenPlayer = viewModel::openNowPlaying,
                        onCheckUpdates = { updates.check(force = true) },
                        firstTabFocus = firstTabFocus,
                        playerFocus = playerFocus,
                    )
                    Box(Modifier.weight(1f).fillMaxWidth()) {
                        if (state.searchOpen) {
                            SearchScreen(
                                query = state.searchQuery,
                                busy = state.searchBusy,
                                results = state.searchResults,
                                error = state.searchError,
                                onQueryChange = viewModel::setSearchQuery,
                                onResult = viewModel::playSearchResult,
                                onOpenEngineSearch = viewModel::openEngineSearch,
                                onRetry = viewModel::retrySearch,
                            )
                        } else {
                            when (state.phase) {
                                ConnectionPhase.CONNECTING -> CenteredMessage("Conectando ao Apple Music…")
                                ConnectionPhase.FAILED -> ErrorPane(state.error, viewModel::retry)
                                ConnectionPhase.CONNECTED -> {
                                    val top = state.stack.lastOrNull()
                                    if (top == null) {
                                        TabRoot(
                                            state = state,
                                            viewModel = viewModel,
                                            onItemMenu = { item, requester ->
                                                menuOriginFocus = requester
                                                viewModel.openItemMenu(item)
                                            },
                                        )
                                    } else {
                                        LevelGrid(
                                            title = state.stack.joinToString(" › ") { it.title },
                                            items = state.levelItems[top.id],
                                            failed = top.id in state.levelFailed,
                                            onItem = viewModel::enter,
                                            onItemMenu = { item, requester ->
                                                menuOriginFocus = requester
                                                viewModel.openItemMenu(item)
                                            },
                                        )
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if (state.actionsOpen) {
                ActionsSheet(
                    playbackFlow = viewModel.playback,
                    onAction = viewModel::runAction,
                    onClose = viewModel::closeActions,
                )
            }
            state.itemMenu?.let { item ->
                CardMenuSheet(
                    item = item,
                    playbackFlow = viewModel.playback,
                    onAction = { actionId -> viewModel.runItemAction(item, actionId) },
                    onClose = viewModel::closeItemMenu,
                )
            }
            state.message?.let { MessageToast(it) }
            UpdateOverlay(
                state = updateState,
                currentVersionName = BuildConfig.APP_VERSION_NAME,
                onInstall = updates::downloadAndInstall,
                onCancel = updates::cancel,
                onDismiss = updates::dismiss,
            )
        }
    }
}

@Composable
private fun Header(
    tabs: List<TvTab>,
    selected: Int,
    searchOpen: Boolean,
    playbackFlow: StateFlow<PlaybackSnapshot>,
    onSelect: (Int) -> Unit,
    onSearch: () -> Unit,
    onOpenPlayer: () -> Unit,
    onCheckUpdates: () -> Unit,
    firstTabFocus: FocusRequester,
    playerFocus: FocusRequester,
) {
    // Collected here, not in TvApp: a playback update then only invalidates the header
    // row instead of the whole browse tree.
    val playback by playbackFlow.collectAsStateWithLifecycle()
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .height(64.dp)
            .padding(horizontal = 32.dp),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(10.dp),
    ) {
        Text("Apple Music", color = Accent, fontSize = 20.sp, fontWeight = FontWeight.Bold)
        Spacer(Modifier.width(18.dp))
        tabs.forEachIndexed { index, tab ->
            TabPill(
                title = tab.title,
                selected = !searchOpen && index == selected,
                modifier = if (index == 0) Modifier.focusRequester(firstTabFocus) else Modifier,
                onClick = { onSelect(index) },
            )
        }
        HeaderIconButton(
            iconRes = R.drawable.ic_search,
            description = "Busca",
            selected = searchOpen,
            onClick = onSearch,
        )
        Spacer(Modifier.weight(1f))
        UpdatesChip(onClick = onCheckUpdates)
        Spacer(Modifier.width(10.dp))
        PlayerChip(
            playback = playback,
            focusRequester = playerFocus,
            onOpen = onOpenPlayer,
        )
    }
}

@Composable
private fun TabPill(
    title: String,
    selected: Boolean,
    modifier: Modifier = Modifier,
    onClick: () -> Unit,
) {
    var focused by remember { mutableStateOf(false) }
    val scale by animateFloatAsState(
        if (focused) 1.04f else 1f,
        animationSpec = FocusScaleSpec,
        label = "tabScale",
    )
    Box(
        modifier = modifier
            .scale(scale)
            .clip(RoundedCornerShape(50))
            .background(
                when {
                    selected -> Accent
                    focused -> SurfaceFocused
                    else -> Color.Transparent
                },
            )
            .border(
                BorderStroke(2.dp, if (focused) Color.White else Color.Transparent),
                RoundedCornerShape(50),
            )
            .onFocusChanged { focused = it.isFocused }
            .clickable { onClick() }
            .padding(horizontal = 20.dp, vertical = 8.dp),
    ) {
        Text(
            text = title,
            color = TextPrimary,
            fontSize = 15.sp,
            lineHeight = 20.sp,
            fontWeight = if (selected) FontWeight.SemiBold else FontWeight.Normal,
        )
    }
}

@Composable
private fun HeaderIconButton(
    iconRes: Int,
    description: String,
    selected: Boolean,
    onClick: () -> Unit,
) {
    var focused by remember { mutableStateOf(false) }
    val scale by animateFloatAsState(
        if (focused) 1.04f else 1f,
        animationSpec = FocusScaleSpec,
        label = "headerIconScale",
    )
    Box(
        modifier = Modifier
            .size(34.dp)
            .scale(scale)
            .clip(CircleShape)
            .background(if (focused) SurfaceFocused else Color.Transparent)
            .border(
                BorderStroke(2.dp, if (focused) Color.White else if (selected) Accent else Color.Transparent),
                CircleShape,
            )
            .onFocusChanged { focused = it.isFocused }
            .clickable { onClick() },
        contentAlignment = Alignment.Center,
    ) {
        Icon(
            painter = painterResource(iconRes),
            contentDescription = description,
            modifier = Modifier.size(20.dp),
            tint = if (focused || selected) Color.White else TextSecondary,
        )
    }
}

/** Compact "now playing" chip on the navigation row; opens the full player. */
@Composable
private fun PlayerChip(
    playback: PlaybackSnapshot,
    focusRequester: FocusRequester,
    onOpen: () -> Unit,
) {
    val hasTrack = playback.hasSession && playback.title.isNotBlank()
    var focused by remember { mutableStateOf(false) }
    val scale by animateFloatAsState(
        if (focused) 1.04f else 1f,
        animationSpec = FocusScaleSpec,
        label = "chipScale",
    )
    Row(
        modifier = Modifier
            .focusRequester(focusRequester)
            .scale(scale)
            .clip(RoundedCornerShape(CardRadius))
            // Discrete chip: a soft surface gradient instead of a flat block.
            .background(
                when {
                    !hasTrack -> Brush.horizontalGradient(
                        listOf(Surface.copy(alpha = 0.45f), Color(0xFF101012)),
                    )

                    focused -> Brush.horizontalGradient(listOf(SurfaceFocused, SurfaceFocused))
                    else -> Brush.horizontalGradient(listOf(Color(0xFF232326), Color(0xFF151517)))
                },
            )
            .border(
                BorderStroke(2.dp, if (focused) Color.White else Color.Transparent),
                RoundedCornerShape(CardRadius),
            )
            .then(
                if (hasTrack) {
                    Modifier
                        .onFocusChanged { focused = it.isFocused }
                        .clickable { onOpen() }
                } else {
                    Modifier
                },
            )
            .padding(horizontal = 12.dp, vertical = 8.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        if (hasTrack) {
            Artwork(playback, 40.dp)
        } else {
            IdleArtwork(40.dp)
        }
        Spacer(Modifier.width(10.dp))
        Column(Modifier.widthIn(max = 210.dp)) {
            Text(
                text = if (hasTrack) playback.title else "Nada tocando",
                color = if (hasTrack) TextPrimary else TextSecondary,
                fontSize = 14.sp,
                lineHeight = 18.sp,
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
                fontSize = 12.sp,
                lineHeight = 15.sp,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
            )
        }
    }
}

@Composable
private fun TabRoot(
    state: TvUiState,
    viewModel: TvViewModel,
    onItemMenu: (BrowseItem, FocusRequester) -> Unit,
) {
    val visibleSections = state.sections.filter { it.loading || it.items.isNotEmpty() }
    // Keep a shelf composed while it is up to 360 dp outside the viewport: without a
    // cache window a row that scrolls out is disposed and the next DOWN (or UP) pays
    // its full ~7-card composition again. Compose 1.11 has no beyondBoundsItemCount.
    val columnState = rememberLazyListState(
        cacheWindow = LazyLayoutCacheWindow(ahead = 360.dp, behind = 360.dp),
    )
    LazyColumn(
        state = columnState,
        modifier = Modifier.fillMaxSize().padding(horizontal = PagePadding),
        verticalArrangement = Arrangement.spacedBy(SectionGap),
        contentPadding = PaddingValues(top = 8.dp, bottom = 16.dp),
    ) {
        items(visibleSections, key = { it.id }, contentType = { "section" }) { section ->
            SectionRow(
                section = section,
                onOpenSection = { viewModel.openSection(section) },
                onItem = viewModel::enter,
                onItemMenu = onItemMenu,
            )
        }
    }
}

@Composable
private fun SectionRow(
    section: Section,
    onOpenSection: () -> Unit,
    onItem: (BrowseItem) -> Unit,
    onItemMenu: (BrowseItem, FocusRequester) -> Unit,
) {
    val rowState = rememberLazyListState()
    val scope = rememberCoroutineScope()
    Column(verticalArrangement = Arrangement.spacedBy(10.dp)) {
        Row(verticalAlignment = Alignment.CenterVertically) {
            Text(
                text = section.title,
                color = TextPrimary,
                fontSize = 26.sp,
                lineHeight = 32.sp,
                letterSpacing = (-0.3).sp,
                fontWeight = FontWeight.Bold,
                modifier = Modifier.padding(horizontal = 2.dp, vertical = 2.dp),
            )
            Spacer(Modifier.width(10.dp))
            if (!section.loading) {
                Text(
                    text = "${section.items.size}",
                    color = TextSecondary,
                    fontSize = 12.sp,
                    lineHeight = 16.sp,
                )
            }
        }
        when {
            section.loading -> Text(
                text = "Carregando…",
                color = TextSecondary,
                fontSize = 13.sp,
                lineHeight = 18.sp,
            )
            else -> LazyRow(
                state = rowState,
                horizontalArrangement = Arrangement.spacedBy(12.dp),
            ) {
                val offset = if (section.direct) 0 else 1
                if (!section.direct) {
                    item(key = "open-${section.id}", contentType = "seeAll") {
                        SeeAllCard(
                            count = section.items.size,
                            onClick = onOpenSection,
                        )
                    }
                }
                itemsIndexed(
                    section.items,
                    key = { _, item -> item.id },
                    contentType = { _, _ -> "card" },
                ) { index, item ->
                    TvCard(
                        item = item,
                        onFocused = {
                            // Only scroll when the focused card is clipped; an
                            // already visible card costs no animation at all.
                            if (rowState.needsScrollTo(index + offset)) {
                                scope.launch { rowState.animateScrollToItem(index + offset) }
                            }
                        },
                        onItemMenu = onItemMenu,
                        onClick = { onItem(item) },
                    )
                }
            }
        }
    }
}

/**
 * True when [index] is not fully inside the viewport, so the focused item needs a
 * scroll. Items that are already fully visible cost nothing.
 */
private fun LazyListState.needsScrollTo(index: Int): Boolean {
    val info = layoutInfo
    val item = info.visibleItemsInfo.firstOrNull { it.index == index } ?: return true
    return item.offset < info.viewportStartOffset ||
        item.offset + item.size > info.viewportEndOffset
}

/** Focusable "open this shelf as a grid" entry at the start of every row. */
@Composable
private fun SeeAllCard(count: Int, onClick: () -> Unit) {
    FocusCard(onClick = onClick, width = 132.dp, height = CardHeight) {
        Column(
            modifier = Modifier.fillMaxSize().padding(14.dp),
            verticalArrangement = Arrangement.Center,
        ) {
            Text(
                text = "Ver tudo",
                color = TextPrimary,
                fontSize = 15.sp,
                lineHeight = 19.sp,
                fontWeight = FontWeight.SemiBold,
            )
            Text(
                text = "$count itens",
                color = TextSecondary,
                fontSize = 12.sp,
                lineHeight = 16.sp,
            )
        }
    }
}

@Composable
private fun LevelGrid(
    title: String,
    items: List<BrowseItem>?,
    failed: Boolean,
    onItem: (BrowseItem) -> Unit,
    onItemMenu: (BrowseItem, FocusRequester) -> Unit,
) {
    if (failed) {
        CenteredMessage("Não foi possível carregar “$title”")
        return
    }
    if (items == null) {
        CenteredMessage("Carregando…")
        return
    }
    if (items.isEmpty()) {
        CenteredMessage("Nada por aqui")
        return
    }
    val columnState = rememberLazyListState()
    val scope = rememberCoroutineScope()
    val firstCard = remember { FocusRequester() }
    val rows = remember(items) { items.chunked(CARDS_PER_ROW) }

    LaunchedEffect(items) {
        withFrameNanos { }
        runCatching { firstCard.requestFocus() }
    }

    Column(Modifier.fillMaxSize()) {
        Text(
            text = title,
            color = TextSecondary,
            fontSize = 13.sp,
            lineHeight = 18.sp,
            modifier = Modifier.padding(start = 32.dp, top = 6.dp, bottom = 6.dp),
            maxLines = 1,
            overflow = TextOverflow.Ellipsis,
        )
        LazyColumn(
            state = columnState,
            modifier = Modifier.fillMaxSize().padding(horizontal = 32.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp),
            contentPadding = PaddingValues(bottom = 16.dp),
        ) {
            itemsIndexed(
                rows,
                key = { _, rowItems -> rowItems.first().id },
                contentType = { _, _ -> "gridRow" },
            ) { rowIndex, rowItems ->
                Row(horizontalArrangement = Arrangement.spacedBy(12.dp)) {
                    rowItems.forEach { item ->
                        val isFirst = item === items.first()
                        TvCard(
                            item = item,
                            focusRequester = if (isFirst) firstCard else null,
                            onFocused = {
                                if (columnState.needsScrollTo(rowIndex)) {
                                    scope.launch { columnState.animateScrollToItem(rowIndex) }
                                }
                            },
                            onItemMenu = onItemMenu,
                            onClick = { onItem(item) },
                        )
                    }
                }
            }
        }
    }
}

/**
 * The focusable surface used by every card.
 *
 * tv-material's `Card` brings a clickable surface with ripple indication, a border node,
 * a glow node and its own D-pad key handler. Dropping it is a ~10 % win on the
 * composition of a fresh shelf (README, Performance), not the main lever, but it is
 * less machinery per card. Same look as before — focus scale + focused container
 * colour — with a [graphicsLayer] scale (draw phase, no recomposition) and a
 * [clickable] with no indication.
 */
@Composable
private fun FocusCard(
    onClick: () -> Unit,
    onLongClick: (() -> Unit)? = null,
    width: Dp = CardWidth,
    height: Dp = CardHeight,
    modifier: Modifier = Modifier,
    onFocused: () -> Unit = {},
    content: @Composable () -> Unit,
) {
    var focused by remember { mutableStateOf(false) }
    var longFired by remember { mutableStateOf(false) }
    var longPressJob by remember { mutableStateOf<Job?>(null) }
    val scope = rememberCoroutineScope()
    val scale by animateFloatAsState(
        if (focused) 1.05f else 1f,
        animationSpec = FocusScaleSpec,
        label = "cardScale",
    )
    Box(
        modifier = modifier
            .width(width)
            .height(height)
            .graphicsLayer {
                scaleX = scale
                scaleY = scale
            }
            .clip(RoundedCornerShape(CardRadius))
            .background(if (focused) SurfaceFocused else Surface)
            .onFocusChanged {
                focused = it.isFocused
                if (it.isFocused) {
                    onFocused()
                } else {
                    // The menu steals focus while ENTER is still held; drop the pending
                    // press so the next click works.
                    longPressJob?.cancel()
                    longPressJob = null
                    longFired = false
                }
            }
            // Long-press ENTER: `clickable` only reports a plain click, and holding the
            // D-pad centre is not a touch gesture, so the press is timed here. A remote
            // or `adb shell input keyevent --longpress` that reports the platform flag
            // takes the immediate path.
            .onPreviewKeyEvent { event ->
                if (onLongClick == null || event.key != Key.DirectionCenter) {
                    return@onPreviewKeyEvent false
                }
                when (event.type) {
                    KeyEventType.KeyDown -> {
                        if (longFired) return@onPreviewKeyEvent true
                        if (
                            event.nativeKeyEvent.flags and
                            android.view.KeyEvent.FLAG_LONG_PRESS != 0
                        ) {
                            longPressJob?.cancel()
                            longPressJob = null
                            longFired = true
                            onLongClick()
                            true
                        } else {
                            // Held keys repeat KeyDown; keep a single timer.
                            if (longPressJob == null) {
                                longPressJob = scope.launch {
                                    delay(LONG_PRESS_MS)
                                    if (!longFired) {
                                        longFired = true
                                        onLongClick()
                                    }
                                }
                            }
                            false
                        }
                    }

                    KeyEventType.KeyUp -> {
                        longPressJob?.cancel()
                        longPressJob = null
                        // Swallow the release so `clickable` does not also fire onClick().
                        if (longFired) {
                            longFired = false
                            true
                        } else {
                            false
                        }
                    }

                    else -> false
                }
            }
            .clickable(interactionSource = null, indication = null) { onClick() },
    ) {
        content()
        if (focused) {
            Box(Modifier.fillMaxSize().background(Color.White.copy(alpha = 0.10f)))
        }
    }
}

@Composable
private fun TvCard(
    item: BrowseItem,
    modifier: Modifier = Modifier,
    focusRequester: FocusRequester? = null,
    width: Dp = CardWidth,
    height: Dp = CardHeight,
    onFocused: () -> Unit = {},
    onItemMenu: ((BrowseItem, FocusRequester) -> Unit)? = null,
    onClick: () -> Unit,
) {
    val ownFocus = remember { FocusRequester() }
    val cardFocus = focusRequester ?: ownFocus
    val longPress = if (item.playable && onItemMenu != null) {
        { onItemMenu(item, cardFocus) }
    } else {
        null
    }
    FocusCard(
        onClick = onClick,
        onLongClick = longPress,
        width = width,
        height = height,
        modifier = modifier.focusRequester(cardFocus),
        onFocused = onFocused,
    ) {
        Box(Modifier.fillMaxSize()) {
            if (item.artworkUri != null) {
                val context = LocalContext.current
                val density = LocalDensity.current
                val artWidth = with(density) { width.roundToPx() }
                val artHeight = with(density) { height.roundToPx() }
                AsyncImage(
                    // Explicit target size: Coil decodes the card cover instead of
                    // whatever the CDN serves.
                    model = remember(item.artworkUri, artWidth, artHeight) {
                        ImageRequest.Builder(context)
                            .data(item.artworkUri)
                            .size(artWidth, artHeight)
                            .build()
                    },
                    contentDescription = null,
                    modifier = Modifier.fillMaxSize(),
                    contentScale = ContentScale.Crop,
                )
            } else {
                CardArtworkPlaceholder(Modifier.fillMaxSize())
            }
            // Artwork-first card: a soft bottom scrim keeps the two text lines legible.
            Box(
                Modifier.fillMaxSize().background(
                    Brush.verticalGradient(
                        0.45f to Color.Transparent,
                        1f to Color.Black.copy(alpha = 0.88f),
                    ),
                ),
            )
            Column(
                modifier = Modifier
                    .align(Alignment.BottomStart)
                    .fillMaxWidth()
                    .padding(horizontal = 12.dp, vertical = 10.dp),
            ) {
                Text(
                    text = item.title,
                    color = TextPrimary,
                    fontSize = 15.sp,
                    lineHeight = 19.sp,
                    fontWeight = FontWeight.SemiBold,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                )
                // One secondary line only: the subtitle, or the "Tocar" hint for a
                // playable-only item (they never show together).
                val secondary = item.subtitle.ifEmpty { if (item.playable) "Tocar" else "" }
                if (secondary.isNotEmpty()) {
                    Text(
                        text = secondary,
                        color = if (item.subtitle.isEmpty()) Accent else TextSecondary,
                        fontSize = 12.sp,
                        lineHeight = 16.sp,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis,
                    )
                }
            }
        }
    }
}

@Composable
private fun CardArtworkPlaceholder(modifier: Modifier = Modifier) {
    Box(
        modifier = modifier.background(
            Brush.linearGradient(listOf(Accent.copy(alpha = 0.85f), Color(0xFF5A1018))),
        ),
        contentAlignment = Alignment.Center,
    ) {
        Text("♪", color = Color.White, fontSize = 38.sp)
    }
}

@Composable
private fun NowPlayingScreen(
    playbackFlow: StateFlow<PlaybackSnapshot>,
    seekFeedback: SeekFeedback?,
    actionsButtonFocus: FocusRequester,
    onPlayPause: () -> Unit,
    onPrevious: () -> Unit,
    onNext: () -> Unit,
    onSeekBy: (Long) -> Unit,
    onOpenActions: () -> Unit,
    onAction: (CustomAction) -> Unit,
) {
    val playback by playbackFlow.collectAsStateWithLifecycle()
    val playFocus = remember { FocusRequester() }
    LaunchedEffect(Unit) {
        withFrameNanos { }
        runCatching { playFocus.requestFocus() }
    }
    // Dark gradient derived from the cover, so each track tints the whole screen.
    val backgroundColors = remember(playback.artwork) { artworkBackground(playback.artwork) }
    val stationAction = playback.customActions.firstOrNull {
        it.action == TvViewModel.ACTION_CREATE_STATION
    }

    Box(
        Modifier
            .fillMaxSize()
            .background(Brush.verticalGradient(backgroundColors)),
    ) {
        Row(
            modifier = Modifier.fillMaxSize().padding(horizontal = 48.dp, vertical = 32.dp),
            verticalAlignment = Alignment.CenterVertically,
        ) {
            BigArtwork(playback.artwork, 360.dp)
            Spacer(Modifier.width(48.dp))
            Column(
                modifier = Modifier.weight(1f).fillMaxHeight(),
                verticalArrangement = Arrangement.Center,
            ) {
                Text(
                    text = "TOCANDO AGORA",
                    color = Accent,
                    fontSize = 12.sp,
                    lineHeight = 16.sp,
                    letterSpacing = 1.2.sp,
                    fontWeight = FontWeight.Bold,
                )
                Spacer(Modifier.height(10.dp))
                Text(
                    text = playback.title.ifBlank { "Nada tocando" },
                    color = TextPrimary,
                    fontSize = 36.sp,
                    lineHeight = 42.sp,
                    letterSpacing = (-0.5).sp,
                    fontWeight = FontWeight.Bold,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis,
                )
                Spacer(Modifier.height(10.dp))
                Text(
                    text = playback.artist.ifBlank { "Apple Music" },
                    color = TextSecondary,
                    fontSize = 20.sp,
                    lineHeight = 26.sp,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                )
                if (playback.album.isNotBlank()) {
                    Text(
                        text = playback.album,
                        color = TextSecondary.copy(alpha = 0.7f),
                        fontSize = 13.sp,
                        lineHeight = 18.sp,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis,
                    )
                }
                Spacer(Modifier.height(40.dp))
                Row(
                    horizontalArrangement = Arrangement.spacedBy(22.dp),
                    verticalAlignment = Alignment.CenterVertically,
                ) {
                    PlayerButton(
                        iconRes = R.drawable.ic_prev,
                        description = "Anterior",
                        size = 60.dp,
                        onClick = onPrevious,
                    )
                    PlayerButton(
                        iconRes = if (playback.playing) R.drawable.ic_pause else R.drawable.ic_play,
                        description = if (playback.playing) "Pausar" else "Tocar",
                        modifier = Modifier.focusRequester(playFocus),
                        size = 80.dp,
                        iconSize = 36.dp,
                        accent = true,
                        onClick = onPlayPause,
                    )
                    PlayerButton(
                        iconRes = R.drawable.ic_next,
                        description = "Próxima",
                        size = 60.dp,
                        onClick = onNext,
                    )
                }
                Spacer(Modifier.height(20.dp))
                Row(
                    horizontalArrangement = Arrangement.spacedBy(12.dp),
                    verticalAlignment = Alignment.CenterVertically,
                ) {
                    if (stationAction != null) {
                        PlayerPill(
                            label = stationAction.title.ifBlank { "Criar estação" },
                            accent = true,
                            onClick = { onAction(stationAction) },
                        )
                    }
                    PlayerPill(
                        label = "Ações",
                        leading = "•••",
                        modifier = Modifier.focusRequester(actionsButtonFocus),
                        onClick = onOpenActions,
                    )
                }
                Spacer(Modifier.height(30.dp))
                SeekControl(
                    positionMs = playback.positionMs,
                    durationMs = playback.durationMs,
                    feedback = seekFeedback,
                    onSeekBy = onSeekBy,
                )
            }
        }
        Text(
            text = "Pressione voltar para fechar",
            color = TextSecondary,
            fontSize = 12.sp,
            lineHeight = 16.sp,
            modifier = Modifier.align(Alignment.BottomEnd).padding(24.dp),
        )
    }
}

@Composable
private fun PlayerButton(
    iconRes: Int,
    description: String,
    modifier: Modifier = Modifier,
    size: Dp = 56.dp,
    iconSize: Dp = 26.dp,
    accent: Boolean = false,
    onClick: () -> Unit,
) {
    var focused by remember { mutableStateOf(false) }
    val scale by animateFloatAsState(
        if (focused) 1.06f else 1f,
        animationSpec = FocusScaleSpec,
        label = "playerButtonScale",
    )
    val background by animateColorAsState(
        when {
            accent -> Accent
            focused -> Color.White
            else -> SurfaceFocused
        },
        animationSpec = FocusColorSpec,
        label = "playerButtonBackground",
    )
    val tint by animateColorAsState(
        if (!accent && focused) Color.Black else TextPrimary,
        animationSpec = FocusColorSpec,
        label = "playerButtonTint",
    )
    Box(
        modifier = modifier
            .size(size)
            .scale(scale)
            .clip(CircleShape)
            .background(background)
            .border(BorderStroke(2.dp, if (focused) Color.White else Color.Transparent), CircleShape)
            .onFocusChanged { focused = it.isFocused }
            .clickable { onClick() },
        contentAlignment = Alignment.Center,
    ) {
        Icon(
            painter = painterResource(iconRes),
            contentDescription = description,
            modifier = Modifier.size(iconSize),
            tint = tint,
        )
    }
}

/**
 * Pill action of the full player ("Criar estação", "Ações"). The accent variant keeps
 * the Apple Music red while unfocused and turns white with a black label on focus.
 */
@Composable
private fun PlayerPill(
    label: String,
    modifier: Modifier = Modifier,
    leading: String = "",
    accent: Boolean = false,
    onClick: () -> Unit,
) {
    var focused by remember { mutableStateOf(false) }
    val scale by animateFloatAsState(
        if (focused) 1.04f else 1f,
        animationSpec = FocusScaleSpec,
        label = "playerPillScale",
    )
    val background by animateColorAsState(
        when {
            focused -> Color.White
            accent -> Accent.copy(alpha = 0.18f)
            else -> SurfaceFocused
        },
        animationSpec = FocusColorSpec,
        label = "playerPillBackground",
    )
    val contentColor by animateColorAsState(
        if (focused) Color.Black else TextPrimary,
        animationSpec = FocusColorSpec,
        label = "playerPillContent",
    )
    Row(
        modifier = modifier
            .scale(scale)
            .height(44.dp)
            .clip(RoundedCornerShape(50))
            .background(background)
            .border(
                BorderStroke(
                    2.dp,
                    when {
                        focused -> Color.White
                        accent -> Accent.copy(alpha = 0.5f)
                        else -> Color.Transparent
                    },
                ),
                RoundedCornerShape(50),
            )
            .onFocusChanged { focused = it.isFocused }
            .clickable { onClick() }
            .padding(horizontal = 18.dp),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.Center,
    ) {
        if (leading.isNotEmpty()) {
            Text(
                text = leading,
                color = contentColor,
                fontSize = 14.sp,
                lineHeight = 18.sp,
                fontWeight = FontWeight.Bold,
            )
            Spacer(Modifier.width(8.dp))
        }
        Text(
            text = label,
            color = contentColor,
            fontSize = 15.sp,
            lineHeight = 19.sp,
            fontWeight = FontWeight.SemiBold,
        )
    }
}

/** Focusable progress bar: left/right seek by [SEEK_STEP_MS] and show a hint. */
@Composable
private fun SeekControl(
    positionMs: Long,
    durationMs: Long,
    feedback: SeekFeedback?,
    onSeekBy: (Long) -> Unit,
) {
    var focused by remember { mutableStateOf(false) }
    val scale by animateFloatAsState(
        if (focused) 1.02f else 1f,
        animationSpec = FocusScaleSpec,
        label = "seekScale",
    )
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .scale(scale)
            .clip(RoundedCornerShape(12.dp))
            .background(if (focused) SurfaceFocused.copy(alpha = 0.6f) else Color.Transparent)
            .border(
                BorderStroke(2.dp, if (focused) Color.White else Color.Transparent),
                RoundedCornerShape(12.dp),
            )
            .onFocusChanged { focused = it.isFocused }
            .onKeyEvent { event ->
                if (event.type != KeyEventType.KeyDown) return@onKeyEvent false
                when (event.key) {
                    Key.DirectionLeft -> {
                        onSeekBy(-SEEK_STEP_MS)
                        true
                    }

                    Key.DirectionRight -> {
                        onSeekBy(SEEK_STEP_MS)
                        true
                    }

                    else -> false
                }
            }
            .focusable()
            .padding(horizontal = 16.dp, vertical = 12.dp),
    ) {
        ProgressBar(
            positionMs = positionMs,
            durationMs = durationMs,
            modifier = Modifier.fillMaxWidth(),
        )
        Spacer(Modifier.height(6.dp))
        Row(Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween) {
            Text(
                text = formatTime(positionMs),
                color = TextSecondary,
                fontSize = 13.sp,
                lineHeight = 18.sp,
            )
            Text(
                text = formatTime(durationMs),
                color = TextSecondary,
                fontSize = 13.sp,
                lineHeight = 18.sp,
            )
        }
        Spacer(Modifier.height(4.dp))
        Text(
            text = if (feedback != null) {
                val arrow = if (feedback.deltaMs < 0L) "◀" else "▶"
                val sign = if (feedback.deltaMs < 0L) "-" else "+"
                "$arrow $sign${abs(feedback.deltaMs) / 1000}s • ${formatTime(feedback.positionMs)}"
            } else {
                "◀ ▶ ±10 s"
            },
            color = if (feedback != null) Accent else TextSecondary,
            fontSize = 12.sp,
            lineHeight = 16.sp,
        )
    }
}

@Composable
private fun BigArtwork(bitmap: Bitmap?, size: Dp) {
    val shape = RoundedCornerShape(OverlayRadius)
    if (bitmap != null) {
        Image(
            bitmap = bitmap.asImageBitmap(),
            contentDescription = null,
            modifier = Modifier.size(size).shadow(24.dp, shape).clip(shape),
            contentScale = ContentScale.Crop,
        )
    } else {
        Box(
            modifier = Modifier
                .size(size)
                .clip(shape)
                .background(
                    Brush.linearGradient(listOf(Accent.copy(alpha = 0.85f), Color(0xFF5A1018))),
                ),
            contentAlignment = Alignment.Center,
        ) {
            Text("♪", color = Color.White, fontSize = 120.sp)
        }
    }
}

@Composable
private fun Artwork(playback: PlaybackSnapshot, size: Dp = 56.dp) {
    val bitmap = playback.artwork
    if (bitmap != null) {
        Image(
            bitmap = bitmap.asImageBitmap(),
            contentDescription = null,
            modifier = Modifier.size(size).clip(RoundedCornerShape(10.dp)),
            contentScale = ContentScale.Crop,
        )
    } else {
        ArtworkPlaceholder(size)
    }
}

/** Muted cover slot of the chip while the session has no track. */
@Composable
private fun IdleArtwork(size: Dp) {
    Box(
        modifier = Modifier
            .size(size)
            .clip(RoundedCornerShape(10.dp))
            .background(SurfaceFocused),
        contentAlignment = Alignment.Center,
    ) {
        Text("♪", color = TextSecondary, fontSize = (size.value * 0.4f).sp)
    }
}

@Composable
private fun ArtworkPlaceholder(size: Dp) {
    Box(
        modifier = Modifier
            .size(size)
            .clip(RoundedCornerShape(8.dp))
            .background(
                Brush.linearGradient(
                    listOf(Accent.copy(alpha = 0.85f), Color(0xFF5A1018)),
                ),
            ),
        contentAlignment = Alignment.Center,
    ) {
        Text("♪", color = Color.White, fontSize = (size.value * 0.4f).sp)
    }
}

@Composable
private fun ProgressBar(positionMs: Long, durationMs: Long, modifier: Modifier = Modifier) {
    val fraction = if (durationMs > 0L) {
        (positionMs.toFloat() / durationMs.toFloat()).coerceIn(0f, 1f)
    } else {
        0f
    }
    Box(
        modifier = modifier
            .height(5.dp)
            .clip(RoundedCornerShape(3.dp))
            .background(SeekTrack),
    ) {
        Box(
            Modifier
                .fillMaxHeight()
                .fillMaxWidth(fraction)
                .background(Accent),
        )
    }
}

/**
 * Dark gradient derived from the cover (a coarse 8x8 sample, once per artwork). The
 * sampled colour is capped at ~42 % brightness so white type keeps its contrast; black
 * stays the bottom stop. No artwork keeps the red-tinted fallback.
 */
private fun artworkBackground(artwork: Bitmap?): List<Color> {
    val fallback = listOf(Color(0xFF2A1014), Color(0xFF120709), Background)
    if (artwork == null || artwork.isRecycled || artwork.width <= 0 || artwork.height <= 0) {
        return fallback
    }
    val stepX = (artwork.width / 8).coerceAtLeast(1)
    val stepY = (artwork.height / 8).coerceAtLeast(1)
    var red = 0.0
    var green = 0.0
    var blue = 0.0
    var samples = 0
    var x = 0
    while (x < artwork.width) {
        var y = 0
        while (y < artwork.height) {
            val pixel = artwork.getPixel(x, y)
            if (android.graphics.Color.alpha(pixel) > 32) {
                red += android.graphics.Color.red(pixel)
                green += android.graphics.Color.green(pixel)
                blue += android.graphics.Color.blue(pixel)
                samples++
            }
            y += stepY
        }
        x += stepX
    }
    if (samples == 0) return fallback
    val r = (red / samples / 255.0).toFloat()
    val g = (green / samples / 255.0).toFloat()
    val b = (blue / samples / 255.0).toFloat()
    fun tone(multiplier: Float) = Color(
        (r * multiplier).coerceIn(0.015f, 0.42f),
        (g * multiplier).coerceIn(0.015f, 0.42f),
        (b * multiplier).coerceIn(0.015f, 0.42f),
    )
    return listOf(tone(0.62f), tone(0.26f), Background)
}

@Composable
private fun CenteredMessage(message: String) {
    Box(Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
        Text(message, color = TextSecondary, fontSize = 16.sp, lineHeight = 22.sp)
    }
}

@Composable
private fun ErrorPane(message: String?, onRetry: () -> Unit) {
    Column(
        modifier = Modifier.fillMaxSize().padding(32.dp),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally,
    ) {
        Text(
            text = message ?: "Falha ao conectar ao Apple Music",
            color = TextPrimary,
            fontSize = 24.sp,
            lineHeight = 30.sp,
            fontWeight = FontWeight.Bold,
        )
        Spacer(Modifier.height(10.dp))
        Text(
            text = "Verifique se o Apple Music está instalado e se a sessão de mídia está ativa.",
            color = TextSecondary,
            fontSize = 15.sp,
            lineHeight = 21.sp,
        )
        Spacer(Modifier.height(20.dp))
        var focused by remember { mutableStateOf(false) }
        Box(
            modifier = Modifier
                .clip(RoundedCornerShape(10.dp))
                .background(if (focused) Accent else Surface)
                .border(
                    BorderStroke(2.dp, if (focused) Color.White else Color.Transparent),
                    RoundedCornerShape(10.dp),
                )
                .onFocusChanged { focused = it.isFocused }
                .clickable { onRetry() }
                .padding(horizontal = 24.dp, vertical = 12.dp),
        ) {
            Text("Tentar de novo", color = TextPrimary, fontSize = 15.sp, lineHeight = 20.sp)
        }
    }
}

private fun formatTime(millis: Long): String {
    if (millis <= 0L) return "0:00"
    val totalSeconds = millis / 1000L
    val minutes = totalSeconds / 60L
    val seconds = totalSeconds % 60L
    return "%d:%02d".format(minutes, seconds)
}
