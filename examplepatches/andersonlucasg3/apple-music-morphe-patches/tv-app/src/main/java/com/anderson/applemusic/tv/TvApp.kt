@file:OptIn(ExperimentalTvMaterial3Api::class)

package com.anderson.applemusic.tv

import android.graphics.Bitmap
import androidx.activity.compose.BackHandler
import androidx.compose.animation.animateColorAsState
import androidx.compose.animation.core.animateDpAsState
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.foundation.BorderStroke
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
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.runtime.Composable
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
import androidx.compose.ui.input.key.Key
import androidx.compose.ui.input.key.KeyEventType
import androidx.compose.ui.input.key.key
import androidx.compose.ui.input.key.onKeyEvent
import androidx.compose.ui.input.key.type
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.tv.material3.Card
import androidx.tv.material3.CardDefaults
import androidx.tv.material3.ExperimentalTvMaterial3Api
import androidx.tv.material3.Icon
import androidx.tv.material3.MaterialTheme
import androidx.tv.material3.Text
import coil3.compose.AsyncImage
import kotlinx.coroutines.launch
import kotlin.math.abs

private val Background = Color(0xFF0A0A0B)
private val CardColor = Color(0xFF1C1C1E)
private val CardColorFocused = Color(0xFF34343A)
private val TextPrimary = Color(0xFFFFFFFF)
private val TextSecondary = Color(0xFF9A9A9E)
private val Accent = Color(0xFFFA233B)

private const val CARDS_PER_ROW = 4
private const val SEEK_STEP_MS = 10_000L

@Composable
fun TvApp(viewModel: TvViewModel = viewModel()) {
    val state by viewModel.state.collectAsStateWithLifecycle()
    val firstTabFocus = remember { FocusRequester() }
    val playerFocus = remember { FocusRequester() }
    var everOpenedPlayer by remember { mutableStateOf(false) }

    // TV apps start with nothing focused; put the D-pad on the tab bar and put it
    // back there whenever the drill-down stack returns to a tab root.
    LaunchedEffect(state.tabs.size, state.stack.size) {
        if (state.tabs.isNotEmpty() && state.stack.isEmpty() && !state.nowPlayingOpen && !state.searchOpen) {
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

    BackHandler(enabled = state.nowPlayingOpen) { viewModel.closeNowPlaying() }
    BackHandler(enabled = !state.nowPlayingOpen && state.stack.isNotEmpty()) { viewModel.back() }
    BackHandler(enabled = !state.nowPlayingOpen && state.searchOpen) { viewModel.closeSearch() }

    MaterialTheme {
        Box(Modifier.fillMaxSize().background(Background)) {
            if (state.nowPlayingOpen) {
                NowPlayingScreen(
                    playback = state.playback,
                    seekFeedback = state.seekFeedback,
                    onPlayPause = viewModel::togglePlayPause,
                    onPrevious = viewModel::previous,
                    onNext = viewModel::next,
                    onSeekBy = viewModel::seekBy,
                )
            } else {
                Column(Modifier.fillMaxSize()) {
                    Header(
                        tabs = state.tabs,
                        selected = state.selectedTab,
                        searchOpen = state.searchOpen,
                        playback = state.playback,
                        onSelect = viewModel::selectTab,
                        onSearch = viewModel::openSearch,
                        onOpenPlayer = viewModel::openNowPlaying,
                        firstTabFocus = firstTabFocus,
                        playerFocus = playerFocus,
                    )
                    Box(Modifier.weight(1f).fillMaxWidth()) {
                        if (state.searchOpen) {
                            SearchUnavailable()
                        } else {
                            when (state.phase) {
                                ConnectionPhase.CONNECTING -> CenteredMessage("Conectando ao Apple Music…")
                                ConnectionPhase.FAILED -> ErrorPane(state.error, viewModel::retry)
                                ConnectionPhase.CONNECTED -> {
                                    val top = state.stack.lastOrNull()
                                    if (top == null) {
                                        TabRoot(state, viewModel)
                                    } else {
                                        LevelGrid(
                                            title = state.stack.joinToString(" › ") { it.title },
                                            items = state.levelItems[top.id],
                                            failed = top.id in state.levelFailed,
                                            onItem = viewModel::enter,
                                        )
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun Header(
    tabs: List<TvTab>,
    selected: Int,
    searchOpen: Boolean,
    playback: PlaybackSnapshot,
    onSelect: (Int) -> Unit,
    onSearch: () -> Unit,
    onOpenPlayer: () -> Unit,
    firstTabFocus: FocusRequester,
    playerFocus: FocusRequester,
) {
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
    val scale by animateFloatAsState(if (focused) 1.06f else 1f, label = "tabScale")
    Box(
        modifier = modifier
            .scale(scale)
            .clip(RoundedCornerShape(50))
            .background(
                when {
                    selected -> Accent
                    focused -> CardColorFocused
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
    val scale by animateFloatAsState(if (focused) 1.06f else 1f, label = "headerIconScale")
    Box(
        modifier = Modifier
            .size(34.dp)
            .scale(scale)
            .clip(CircleShape)
            .background(if (focused) CardColorFocused else Color.Transparent)
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
    val scale by animateFloatAsState(if (focused) 1.06f else 1f, label = "chipScale")
    val elevation by animateDpAsState(if (focused) 14.dp else 0.dp, label = "chipElevation")
    Row(
        modifier = Modifier
            .focusRequester(focusRequester)
            .scale(scale)
            .shadow(elevation, RoundedCornerShape(12.dp))
            .clip(RoundedCornerShape(12.dp))
            .background(if (focused) CardColorFocused else CardColor)
            .border(
                BorderStroke(2.dp, if (focused) Color.White else Color.Transparent),
                RoundedCornerShape(12.dp),
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
            .padding(horizontal = 10.dp, vertical = 6.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        Artwork(playback, 40.dp)
        Spacer(Modifier.width(10.dp))
        Column(Modifier.widthIn(max = 220.dp)) {
            Text(
                text = if (hasTrack) playback.title else "Nada tocando",
                color = if (hasTrack) TextPrimary else TextSecondary,
                fontSize = 13.sp,
                fontWeight = FontWeight.Medium,
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
                fontSize = 10.sp,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
            )
        }
    }
}

@Composable
private fun TabRoot(state: TvUiState, viewModel: TvViewModel) {
    val visibleSections = state.sections.filter { it.loading || it.items.isNotEmpty() }
    LazyColumn(
        modifier = Modifier.fillMaxSize().padding(horizontal = 32.dp),
        verticalArrangement = Arrangement.spacedBy(18.dp),
        contentPadding = PaddingValues(top = 8.dp, bottom = 16.dp),
    ) {
        items(visibleSections, key = { it.id }) { section ->
            SectionRow(
                section = section,
                onOpenSection = { viewModel.openSection(section) },
                onItem = viewModel::enter,
            )
        }
    }
}

@Composable
private fun SectionRow(
    section: Section,
    onOpenSection: () -> Unit,
    onItem: (BrowseItem) -> Unit,
) {
    val rowState = rememberLazyListState()
    val scope = rememberCoroutineScope()
    Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
        Row(verticalAlignment = Alignment.CenterVertically) {
            Text(
                text = section.title,
                color = TextPrimary,
                fontSize = 18.sp,
                fontWeight = FontWeight.SemiBold,
                modifier = Modifier.padding(horizontal = 2.dp, vertical = 3.dp),
            )
            Spacer(Modifier.width(10.dp))
            if (!section.loading) {
                Text("${section.items.size}", color = TextSecondary, fontSize = 12.sp)
            }
        }
        when {
            section.loading -> Text("Carregando…", color = TextSecondary, fontSize = 13.sp)
            else -> LazyRow(
                state = rowState,
                horizontalArrangement = Arrangement.spacedBy(12.dp),
            ) {
                val offset = if (section.direct) 0 else 1
                if (!section.direct) {
                    item(key = "open-${section.id}") {
                        SeeAllCard(
                            count = section.items.size,
                            onClick = onOpenSection,
                        )
                    }
                }
                itemsIndexed(section.items, key = { _, item -> item.id }) { index, item ->
                    TvCard(
                        item = item,
                        onFocused = { scope.launch { rowState.animateScrollToItem(index + offset) } },
                        onClick = { onItem(item) },
                    )
                }
            }
        }
    }
}

/** Focusable "open this shelf as a grid" entry at the start of every row. */
@Composable
private fun SeeAllCard(count: Int, onClick: () -> Unit) {
    var focused by remember { mutableStateOf(false) }
    val elevation by animateDpAsState(if (focused) 18.dp else 0.dp, label = "seeAllElevation")
    Card(
        onClick = onClick,
        modifier = Modifier
            .width(132.dp)
            .height(112.dp)
            .onFocusChanged { focused = it.isFocused }
            .shadow(elevation, RoundedCornerShape(10.dp)),
        shape = CardDefaults.shape(RoundedCornerShape(10.dp)),
        colors = CardDefaults.colors(
            containerColor = CardColor,
            contentColor = TextPrimary,
            focusedContainerColor = CardColorFocused,
            focusedContentColor = TextPrimary,
        ),
        scale = CardDefaults.scale(1f, 1.06f, 1f),
    ) {
        Column(
            modifier = Modifier.fillMaxSize().padding(12.dp),
            verticalArrangement = Arrangement.Center,
        ) {
            Text("Ver tudo", color = TextPrimary, fontSize = 14.sp, fontWeight = FontWeight.Medium)
            Text("$count itens", color = TextSecondary, fontSize = 11.sp)
        }
    }
}

@Composable
private fun LevelGrid(
    title: String,
    items: List<BrowseItem>?,
    failed: Boolean,
    onItem: (BrowseItem) -> Unit,
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

    LaunchedEffect(items) {
        withFrameNanos { }
        runCatching { firstCard.requestFocus() }
    }

    Column(Modifier.fillMaxSize()) {
        Text(
            text = title,
            color = TextSecondary,
            fontSize = 13.sp,
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
            items(items.chunked(CARDS_PER_ROW)) { rowItems ->
                Row(horizontalArrangement = Arrangement.spacedBy(12.dp)) {
                    rowItems.forEach { item ->
                        val isFirst = item === items.first()
                        TvCard(
                            item = item,
                            modifier = if (isFirst) Modifier.focusRequester(firstCard) else Modifier,
                            onFocused = {
                                val rowIndex = items.indexOf(item) / CARDS_PER_ROW
                                if (rowIndex >= 0) {
                                    scope.launch { columnState.animateScrollToItem(rowIndex) }
                                }
                            },
                            onClick = { onItem(item) },
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun TvCard(
    item: BrowseItem,
    modifier: Modifier = Modifier,
    width: Dp = 200.dp,
    height: Dp = 112.dp,
    onFocused: () -> Unit = {},
    onClick: () -> Unit,
) {
    var focused by remember(item.id) { mutableStateOf(false) }
    val elevation by animateDpAsState(if (focused) 18.dp else 0.dp, label = "cardElevation")

    Card(
        onClick = onClick,
        modifier = modifier
            .width(width)
            .height(height)
            .onFocusChanged {
                focused = it.isFocused
                if (it.isFocused) onFocused()
            }
            .shadow(elevation, RoundedCornerShape(10.dp)),
        shape = CardDefaults.shape(RoundedCornerShape(10.dp)),
        colors = CardDefaults.colors(
            containerColor = CardColor,
            contentColor = TextPrimary,
            focusedContainerColor = CardColorFocused,
            focusedContentColor = TextPrimary,
        ),
        scale = CardDefaults.scale(1f, 1.06f, 1f),
    ) {
        Row(
            modifier = Modifier.fillMaxSize().padding(10.dp),
            verticalAlignment = Alignment.CenterVertically,
        ) {
            Box(Modifier.size(52.dp)) {
                ArtworkPlaceholder(52.dp)
                if (item.artworkUri != null) {
                    AsyncImage(
                        model = item.artworkUri,
                        contentDescription = null,
                        modifier = Modifier.size(52.dp).clip(RoundedCornerShape(8.dp)),
                        contentScale = ContentScale.Crop,
                    )
                }
            }
            Spacer(Modifier.width(10.dp))
            Column(Modifier.weight(1f)) {
                Text(
                    text = item.title,
                    color = TextPrimary,
                    fontSize = 14.sp,
                    fontWeight = FontWeight.Medium,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis,
                )
                if (item.subtitle.isNotEmpty()) {
                    Text(
                        text = item.subtitle,
                        color = TextSecondary,
                        fontSize = 11.sp,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis,
                    )
                } else if (item.playable) {
                    Text("Tocar", color = Accent, fontSize = 11.sp)
                }
            }
        }
    }
}

@Composable
private fun NowPlayingScreen(
    playback: PlaybackSnapshot,
    seekFeedback: SeekFeedback?,
    onPlayPause: () -> Unit,
    onPrevious: () -> Unit,
    onNext: () -> Unit,
    onSeekBy: (Long) -> Unit,
) {
    val playFocus = remember { FocusRequester() }
    LaunchedEffect(Unit) {
        withFrameNanos { }
        runCatching { playFocus.requestFocus() }
    }

    Box(
        Modifier
            .fillMaxSize()
            .background(
                Brush.verticalGradient(listOf(Color(0xFF2A1014), Background)),
            ),
    ) {
        Row(
            modifier = Modifier.fillMaxSize().padding(horizontal = 64.dp, vertical = 32.dp),
            verticalAlignment = Alignment.CenterVertically,
        ) {
            BigArtwork(playback.artwork, 360.dp)
            Spacer(Modifier.width(56.dp))
            Column(
                modifier = Modifier.weight(1f).fillMaxHeight(),
                verticalArrangement = Arrangement.Center,
            ) {
                Text(
                    text = "TOCANDO AGORA",
                    color = Accent,
                    fontSize = 12.sp,
                    fontWeight = FontWeight.Bold,
                )
                Spacer(Modifier.height(8.dp))
                Text(
                    text = playback.title.ifBlank { "Nada tocando" },
                    color = TextPrimary,
                    fontSize = 38.sp,
                    fontWeight = FontWeight.Bold,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis,
                )
                Spacer(Modifier.height(8.dp))
                Text(
                    text = playback.artist.ifBlank { "Apple Music" },
                    color = TextSecondary,
                    fontSize = 21.sp,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                )
                if (playback.album.isNotBlank()) {
                    Text(
                        text = playback.album,
                        color = TextSecondary.copy(alpha = 0.75f),
                        fontSize = 14.sp,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis,
                    )
                }
                Spacer(Modifier.height(44.dp))
                Row(
                    horizontalArrangement = Arrangement.spacedBy(22.dp),
                    verticalAlignment = Alignment.CenterVertically,
                ) {
                    PlayerButton(
                        iconRes = R.drawable.ic_prev,
                        description = "Anterior",
                        onClick = onPrevious,
                    )
                    PlayerButton(
                        iconRes = if (playback.playing) R.drawable.ic_pause else R.drawable.ic_play,
                        description = if (playback.playing) "Pausar" else "Tocar",
                        modifier = Modifier.focusRequester(playFocus),
                        size = 76.dp,
                        iconSize = 36.dp,
                        onClick = onPlayPause,
                    )
                    PlayerButton(
                        iconRes = R.drawable.ic_next,
                        description = "Próxima",
                        onClick = onNext,
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
    onClick: () -> Unit,
) {
    var focused by remember { mutableStateOf(false) }
    val scale by animateFloatAsState(if (focused) 1.06f else 1f, label = "playerButtonScale")
    val background by animateColorAsState(
        if (focused) Color.White else CardColorFocused,
        label = "playerButtonBackground",
    )
    val tint by animateColorAsState(if (focused) Color.Black else TextPrimary, label = "playerButtonTint")
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

/** Focusable progress bar: left/right seek by [SEEK_STEP_MS] and show a hint. */
@Composable
private fun SeekControl(
    positionMs: Long,
    durationMs: Long,
    feedback: SeekFeedback?,
    onSeekBy: (Long) -> Unit,
) {
    var focused by remember { mutableStateOf(false) }
    val scale by animateFloatAsState(if (focused) 1.06f else 1f, label = "seekScale")
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .scale(scale)
            .clip(RoundedCornerShape(12.dp))
            .background(if (focused) CardColorFocused else Color.Transparent)
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
        Row(Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween) {
            Text(formatTime(positionMs), color = TextSecondary, fontSize = 13.sp)
            Text(formatTime(durationMs), color = TextSecondary, fontSize = 13.sp)
        }
        Spacer(Modifier.height(8.dp))
        ProgressBar(
            positionMs = positionMs,
            durationMs = durationMs,
            modifier = Modifier.fillMaxWidth(),
        )
        Spacer(Modifier.height(6.dp))
        Text(
            text = if (feedback != null) {
                val arrow = if (feedback.deltaMs < 0L) "◀" else "▶"
                val sign = if (feedback.deltaMs < 0L) "-" else "+"
                "$arrow $sign${abs(feedback.deltaMs) / 1000}s • ${formatTime(feedback.positionMs)}"
            } else {
                "◀ ▶ buscam 10s"
            },
            color = if (feedback != null) Accent else TextSecondary,
            fontSize = 12.sp,
        )
    }
}

@Composable
private fun BigArtwork(bitmap: Bitmap?, size: Dp) {
    val shape = RoundedCornerShape(18.dp)
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
            modifier = Modifier.size(size).clip(RoundedCornerShape(8.dp)),
            contentScale = ContentScale.Crop,
        )
    } else {
        ArtworkPlaceholder(size)
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
            .height(4.dp)
            .clip(RoundedCornerShape(2.dp))
            .background(Color(0xFF3A3A3C)),
    ) {
        Box(
            Modifier
                .fillMaxHeight()
                .fillMaxWidth(fraction)
                .background(Accent),
        )
    }
}

@Composable
private fun SearchUnavailable() {
    Column(
        modifier = Modifier.fillMaxSize().padding(48.dp),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally,
    ) {
        Text(
            text = "Busca indisponível via engine",
            color = TextPrimary,
            fontSize = 24.sp,
            fontWeight = FontWeight.SemiBold,
        )
        Spacer(Modifier.height(10.dp))
        Text(
            text = "O catálogo Android Auto do Apple Music só expõe Início, Rádio e " +
                "Biblioteca pelo MediaBrowser. Busca exigiria a API da Apple/UID compartilhado.",
            color = TextSecondary,
            fontSize = 15.sp,
            textAlign = TextAlign.Center,
            modifier = Modifier.widthIn(max = 760.dp),
        )
    }
}

@Composable
private fun CenteredMessage(message: String) {
    Box(Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
        Text(message, color = TextSecondary, fontSize = 18.sp)
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
            fontSize = 20.sp,
            fontWeight = FontWeight.SemiBold,
        )
        Spacer(Modifier.height(8.dp))
        Text(
            text = "Verifique se o Apple Music está instalado e se a sessão de mídia está ativa.",
            color = TextSecondary,
            fontSize = 14.sp,
        )
        Spacer(Modifier.height(20.dp))
        var focused by remember { mutableStateOf(false) }
        Box(
            modifier = Modifier
                .clip(RoundedCornerShape(10.dp))
                .background(if (focused) Accent else CardColor)
                .border(
                    BorderStroke(2.dp, if (focused) Color.White else Color.Transparent),
                    RoundedCornerShape(10.dp),
                )
                .onFocusChanged { focused = it.isFocused }
                .clickable { onRetry() }
                .padding(horizontal = 24.dp, vertical = 12.dp),
        ) {
            Text("Tentar de novo", color = TextPrimary, fontSize = 16.sp)
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
