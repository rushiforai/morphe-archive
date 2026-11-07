package com.anderson.applemusic.tv

import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.drawable.Drawable
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.runtime.withFrameNanos
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.scale
import androidx.compose.ui.focus.FocusRequester
import androidx.compose.ui.focus.focusRequester
import androidx.compose.ui.focus.onFocusChanged
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.ColorFilter
import androidx.compose.ui.graphics.asImageBitmap
import androidx.compose.ui.input.key.Key
import androidx.compose.ui.input.key.KeyEventType
import androidx.compose.ui.input.key.key
import androidx.compose.ui.input.key.onPreviewKeyEvent
import androidx.compose.ui.input.key.type
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import androidx.tv.material3.Text
import com.anderson.applemusic.core.BrowseItem
import com.anderson.applemusic.core.CustomAction
import com.anderson.applemusic.core.MediaBrowserClient
import com.anderson.applemusic.core.PlaybackSnapshot
import kotlinx.coroutines.flow.StateFlow

/** The session action list of the full player, generic over `customActions`. */
@Composable
internal fun ActionsSheet(
    playbackFlow: StateFlow<PlaybackSnapshot>,
    onAction: (CustomAction) -> Unit,
    onClose: () -> Unit,
) {
    val playback by playbackFlow.collectAsStateWithLifecycle()
    val actions = playback.customActions
    val entries = buildList {
        actions.forEach { action ->
            add(
                SheetEntry(
                    title = action.title.ifBlank { action.action },
                    action = action,
                    onClick = { onAction(action) },
                ),
            )
        }
        add(SheetEntry(title = "Fechar", onClick = onClose))
    }
    SheetPanel(
        title = "Ações",
        subtitle = playback.title.ifBlank { "Nada tocando" },
        emptyHint = if (actions.isEmpty()) "Nenhuma ação anunciada para esta faixa" else null,
        entries = entries,
    )
}

/** Long-press ENTER on a card: the actions that make sense for that one item. */
@Composable
internal fun CardMenuSheet(
    item: BrowseItem,
    playbackFlow: StateFlow<PlaybackSnapshot>,
    onAction: (String) -> Unit,
    onClose: () -> Unit,
) {
    val playback by playbackFlow.collectAsStateWithLifecycle()
    val libraryAction = playback.customActions.firstOrNull {
        it.action == TvViewModel.ACTION_ADD_TO_LIBRARY
    }
    val entries = buildList {
        if (item.playable) {
            add(
                SheetEntry(
                    title = "Criar estação",
                    hint = "Toca o item e inicia uma rádio",
                    action = playback.customActions.firstOrNull {
                        it.action == TvViewModel.ACTION_CREATE_STATION
                    },
                    onClick = { onAction(TvViewModel.ACTION_CREATE_STATION) },
                ),
            )
            if (libraryAction != null) {
                add(
                    SheetEntry(
                        title = "Adicionar à Biblioteca",
                        action = libraryAction,
                        onClick = { onAction(TvViewModel.ACTION_ADD_TO_LIBRARY) },
                    ),
                )
            }
        }
        add(SheetEntry(title = "Fechar", onClick = onClose))
    }
    SheetPanel(
        title = item.title,
        subtitle = item.subtitle.ifBlank { if (item.playable) "Item da sessão" else "" },
        emptyHint = null,
        entries = entries,
    )
}

@Composable
internal fun MessageToast(text: String) {
    Box(Modifier.fillMaxSize(), contentAlignment = Alignment.BottomCenter) {
        Box(
            Modifier
                .padding(bottom = 44.dp)
                .clip(RoundedCornerShape(50))
                .background(SurfaceFocused)
                .padding(horizontal = 22.dp, vertical = 10.dp),
        ) {
            Text(text, color = TextPrimary, fontSize = 14.sp, fontWeight = FontWeight.SemiBold)
        }
    }
}

private class SheetEntry(
    val title: String,
    val hint: String? = null,
    val action: CustomAction? = null,
    val onClick: () -> Unit,
)

@Composable
private fun SheetPanel(
    title: String,
    subtitle: String,
    emptyHint: String?,
    entries: List<SheetEntry>,
) {
    val requesters = remember(entries.size) { List(entries.size) { FocusRequester() } }
    var index by remember(entries.size) { mutableStateOf(0) }
    LaunchedEffect(entries.size) {
        withFrameNanos { }
        runCatching { requesters.firstOrNull()?.requestFocus() }
    }
    Box(
        Modifier.fillMaxSize().background(Color.Black.copy(alpha = 0.72f)),
        contentAlignment = Alignment.Center,
    ) {
        Column(
            modifier = Modifier
                .width(640.dp)
                .clip(RoundedCornerShape(OverlayRadius))
                .background(Surface)
                .padding(24.dp)
                // Keep D-pad focus inside the sheet while it is open.
                .onPreviewKeyEvent { event ->
                    if (event.type != KeyEventType.KeyDown) return@onPreviewKeyEvent false
                    when (event.key) {
                        Key.DirectionDown -> {
                            index = (index + 1).coerceAtMost(entries.lastIndex)
                            runCatching { requesters[index].requestFocus() }
                            true
                        }

                        Key.DirectionUp -> {
                            index = (index - 1).coerceAtLeast(0)
                            runCatching { requesters[index].requestFocus() }
                            true
                        }

                        else -> false
                    }
                },
            verticalArrangement = Arrangement.spacedBy(4.dp),
        ) {
            Text(title, color = TextPrimary, fontSize = 22.sp, fontWeight = FontWeight.Bold)
            if (subtitle.isNotBlank()) {
                Text(
                    text = subtitle,
                    color = TextSecondary,
                    fontSize = 13.sp,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                )
            }
            Spacer(Modifier.height(16.dp))
            if (emptyHint != null) {
                Text(
                    text = emptyHint,
                    color = TextSecondary,
                    fontSize = 14.sp,
                    modifier = Modifier.padding(horizontal = 14.dp, vertical = 8.dp),
                )
            }
            entries.forEachIndexed { entryIndex, entry ->
                SheetRow(
                    entry = entry,
                    focusRequester = requesters[entryIndex],
                    onFocused = { index = entryIndex },
                )
            }
        }
    }
}

@Composable
private fun SheetRow(
    entry: SheetEntry,
    focusRequester: FocusRequester,
    onFocused: () -> Unit,
) {
    var focused by remember { mutableStateOf(false) }
    val scale by animateFloatAsState(if (focused) 1.02f else 1f, label = "sheetRowScale")
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .focusRequester(focusRequester)
            .scale(scale)
            .clip(RoundedCornerShape(12.dp))
            .background(if (focused) SurfaceFocused else Color.Transparent)
            .onFocusChanged {
                focused = it.isFocused
                if (it.isFocused) onFocused()
            }
            .clickable { entry.onClick() }
            .padding(horizontal = 14.dp, vertical = 12.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        val action = entry.action
        if (action != null) {
            ActionIcon(action, Modifier.size(22.dp))
            Spacer(Modifier.width(14.dp))
        }
        Column(Modifier.weight(1f)) {
            Text(
                text = entry.title,
                color = if (focused) TextPrimary else TextPrimary.copy(alpha = 0.92f),
                fontSize = 16.sp,
                fontWeight = FontWeight.SemiBold,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
            )
            if (entry.hint != null) {
                Text(entry.hint, color = TextSecondary, fontSize = 12.sp, maxLines = 1)
            }
        }
        Text("ENTER", color = TextSecondary, fontSize = 11.sp)
    }
}

/**
 * The engine publishes its action glyphs as drawable resource ids of its own package,
 * so they are resolved through [android.content.pm.PackageManager] (the app shares the
 * engine's UID) instead of `painterResource`.
 */
@Composable
private fun ActionIcon(action: CustomAction, modifier: Modifier = Modifier) {
    val context = LocalContext.current
    val bitmap = remember(action.iconResId) {
        if (action.iconResId == 0) {
            null
        } else {
            runCatching {
                context.packageManager
                    .getResourcesForApplication(MediaBrowserClient.PACKAGE)
                    .getDrawable(action.iconResId, null)
                    ?.toBitmap()
            }.getOrNull()
        }
    }
    if (bitmap != null) {
        Image(
            bitmap = bitmap.asImageBitmap(),
            contentDescription = null,
            modifier = modifier,
            colorFilter = ColorFilter.tint(TextPrimary),
        )
    } else {
        Box(modifier, contentAlignment = Alignment.Center) {
            Text("•", color = TextSecondary, fontSize = 18.sp)
        }
    }
}

private fun Drawable.toBitmap(): Bitmap {
    val width = intrinsicWidth.takeIf { it > 0 } ?: 48
    val height = intrinsicHeight.takeIf { it > 0 } ?: 48
    val bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888)
    val canvas = Canvas(bitmap)
    setBounds(0, 0, width, height)
    draw(canvas)
    return bitmap
}
