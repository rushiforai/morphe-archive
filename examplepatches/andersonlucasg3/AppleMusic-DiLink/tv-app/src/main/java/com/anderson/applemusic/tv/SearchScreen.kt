package com.anderson.applemusic.tv

import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.layout.widthIn
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.BasicTextField
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
import androidx.compose.ui.focus.FocusRequester
import androidx.compose.ui.focus.focusRequester
import androidx.compose.ui.focus.onFocusChanged
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.SolidColor
import androidx.compose.ui.input.key.Key
import androidx.compose.ui.input.key.KeyEventType
import androidx.compose.ui.input.key.key
import androidx.compose.ui.input.key.onPreviewKeyEvent
import androidx.compose.ui.input.key.type
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.platform.LocalSoftwareKeyboardController
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.tv.material3.Text
import coil3.compose.AsyncImage
import coil3.request.ImageRequest
import com.anderson.applemusic.core.SearchKind
import com.anderson.applemusic.core.SearchResult

private const val MIN_QUERY_LENGTH = 2

/**
 * Catalogue search over the amp-api (`:core` `SearchClient`).
 *
 * D-pad: the field keeps LEFT/RIGHT for the caret and swallows DOWN/ENTER, so ENTER
 * raises the system IME and DOWN hands the D-pad to the button row and then to the
 * results (ENTER on a row plays it, BACK closes the search).
 */
@Composable
internal fun SearchScreen(
    query: String,
    busy: Boolean,
    results: List<SearchResult>,
    error: String?,
    onQueryChange: (String) -> Unit,
    onResult: (SearchResult) -> Unit,
    onOpenEngineSearch: () -> Unit,
    onRetry: () -> Unit,
) {
    val fieldFocus = remember { FocusRequester() }
    val buttonsFocus = remember { FocusRequester() }
    val keyboard = LocalSoftwareKeyboardController.current
    var fieldFocused by remember { mutableStateOf(false) }

    LaunchedEffect(Unit) {
        withFrameNanos { }
        runCatching { fieldFocus.requestFocus() }
    }

    Column(Modifier.fillMaxSize().padding(horizontal = PagePadding)) {
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .widthIn(max = 900.dp)
                .padding(top = 8.dp, bottom = 10.dp)
                .clip(RoundedCornerShape(CardRadius))
                .background(if (fieldFocused) SurfaceFocused else Surface)
                .border(
                    BorderStroke(2.dp, if (fieldFocused) Color.White else Color.Transparent),
                    RoundedCornerShape(CardRadius),
                )
                .padding(horizontal = 18.dp, vertical = 14.dp),
        ) {
            if (query.isEmpty()) {
                Text(
                    text = "Buscar músicas, álbuns, artistas e playlists",
                    color = TextSecondary,
                    fontSize = 18.sp,
                    lineHeight = 24.sp,
                )
            }
            BasicTextField(
                value = query,
                onValueChange = onQueryChange,
                singleLine = true,
                textStyle = TextStyle(color = TextPrimary, fontSize = 18.sp),
                cursorBrush = SolidColor(Accent),
                modifier = Modifier
                    .fillMaxWidth()
                    .focusRequester(fieldFocus)
                    .onFocusChanged {
                        fieldFocused = it.isFocused
                        if (it.isFocused) keyboard?.show()
                    }
                    // The TV keyboard raises on focus; ENTER raises it again and DOWN
                    // leaves the field, which otherwise consumes the whole D-pad.
                    .onPreviewKeyEvent { event ->
                        if (event.type != KeyEventType.KeyDown) return@onPreviewKeyEvent false
                        when (event.key) {
                            Key.DirectionDown -> {
                                runCatching { buttonsFocus.requestFocus() }
                                true
                            }

                            Key.DirectionCenter, Key.Enter, Key.NumPadEnter -> {
                                keyboard?.show()
                                true
                            }

                            else -> false
                        }
                    },
            )
        }

        Row(
            horizontalArrangement = Arrangement.spacedBy(12.dp),
            verticalAlignment = Alignment.CenterVertically,
        ) {
            SearchPill(
                label = "Teclado",
                modifier = Modifier.focusRequester(buttonsFocus),
                onClick = { keyboard?.show() },
            )
            SearchPill(
                label = "Limpar",
                enabled = query.isNotEmpty() || results.isNotEmpty(),
                onClick = { onQueryChange("") },
            )
            SearchPill(label = "Abrir busca do app original", onClick = onOpenEngineSearch)
            if (error != null) {
                SearchPill(label = "Tentar de novo", onClick = onRetry)
            }
        }

        when {
            busy -> SearchMessage("Buscando…")
            error != null -> SearchMessage(error)
            query.trim().length >= MIN_QUERY_LENGTH && results.isEmpty() ->
                SearchMessage("Nada encontrado")

            results.isEmpty() -> SearchMessage(
                "Digite pelo menos 2 letras. A busca usa o catálogo do Apple Music.",
            )

            else -> LazyColumn(
                modifier = Modifier.fillMaxSize().padding(top = 8.dp),
                contentPadding = PaddingValues(bottom = 16.dp),
                verticalArrangement = Arrangement.spacedBy(4.dp),
            ) {
                for (kind in SearchKind.entries) {
                    val group = results.filter { it.kind == kind }
                    if (group.isEmpty()) continue
                    item(key = "header-${kind.name}", contentType = "header") {
                        Text(
                            text = kind.label,
                            color = TextSecondary,
                            fontSize = 13.sp,
                            lineHeight = 18.sp,
                            fontWeight = FontWeight.SemiBold,
                            modifier = Modifier.padding(start = 4.dp, top = 8.dp, bottom = 4.dp),
                        )
                    }
                    items(group, key = { "${it.kind}-${it.id}" }, contentType = { "row" }) { result ->
                        SearchRow(result = result, onClick = { onResult(result) })
                    }
                }
            }
        }
    }
}

@Composable
private fun SearchMessage(message: String) {
    Text(
        text = message,
        color = TextSecondary,
        fontSize = 16.sp,
        lineHeight = 22.sp,
        modifier = Modifier.padding(start = 4.dp, top = 12.dp),
    )
}

@Composable
private fun SearchPill(
    label: String,
    modifier: Modifier = Modifier,
    enabled: Boolean = true,
    onClick: () -> Unit,
) {
    var focused by remember { mutableStateOf(false) }
    Box(
        modifier = modifier
            .clip(RoundedCornerShape(50))
            .background(
                when {
                    !enabled -> Surface.copy(alpha = 0.5f)
                    focused -> Color.White
                    else -> Surface
                },
            )
            .border(
                BorderStroke(2.dp, if (focused) Color.White else Color.Transparent),
                RoundedCornerShape(50),
            )
            .onFocusChanged { focused = it.isFocused }
            .clickable(enabled = enabled) { onClick() }
            .padding(horizontal = 18.dp, vertical = 12.dp),
    ) {
        Text(
            text = label,
            color = if (focused) Color.Black else if (enabled) TextPrimary else TextSecondary,
            fontSize = 15.sp,
            lineHeight = 19.sp,
            fontWeight = FontWeight.SemiBold,
            maxLines = 1,
        )
    }
}

@Composable
private fun SearchRow(result: SearchResult, onClick: () -> Unit) {
    var focused by remember { mutableStateOf(false) }
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .height(64.dp)
            .clip(RoundedCornerShape(12.dp))
            .background(if (focused) SurfaceFocused else Color.Transparent)
            .onFocusChanged { focused = it.isFocused }
            .clickable { onClick() }
            .padding(horizontal = 12.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        SearchArtwork(result)
        Spacer(Modifier.width(14.dp))
        Column(Modifier.weight(1f)) {
            Text(
                text = result.title,
                color = TextPrimary,
                fontSize = 16.sp,
                lineHeight = 21.sp,
                fontWeight = FontWeight.SemiBold,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
            )
            if (result.artist.isNotBlank()) {
                Text(
                    text = result.artist,
                    color = TextSecondary,
                    fontSize = 13.sp,
                    lineHeight = 18.sp,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                )
            }
        }
    }
}

@Composable
private fun SearchArtwork(result: SearchResult) {
    val shape = if (result.kind == SearchKind.ARTIST) {
        RoundedCornerShape(50)
    } else {
        RoundedCornerShape(8.dp)
    }
    Box(
        modifier = Modifier.size(48.dp).clip(shape).background(SurfaceFocused),
        contentAlignment = Alignment.Center,
    ) {
        val uri = result.artworkUrl
        if (uri != null) {
            val context = LocalContext.current
            val sizePx = with(LocalDensity.current) { 48.dp.roundToPx() }
            AsyncImage(
                model = remember(uri, sizePx) {
                    ImageRequest.Builder(context).data(uri).size(sizePx, sizePx).build()
                },
                contentDescription = null,
                modifier = Modifier.fillMaxSize(),
                contentScale = ContentScale.Crop,
            )
        } else {
            Text("♪", color = TextSecondary, fontSize = 18.sp)
        }
    }
}
