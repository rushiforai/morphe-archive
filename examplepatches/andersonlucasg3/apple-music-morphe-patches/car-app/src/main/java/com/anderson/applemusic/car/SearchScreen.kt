package com.anderson.applemusic.car

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.collectIsPressedAsState
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
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.BasicTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.SolidColor
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import coil3.compose.AsyncImage
import coil3.request.ImageRequest
import com.anderson.applemusic.core.SearchKind
import com.anderson.applemusic.core.SearchResult

/**
 * Catalogue search over the amp-api (`:core` `SearchClient`), touch first: tapping the
 * field raises the keyboard, tapping a row plays it.
 */
@Composable
internal fun CarSearchScreen(
    query: String,
    busy: Boolean,
    results: List<SearchResult>,
    error: String?,
    onQueryChange: (String) -> Unit,
    onResult: (SearchResult) -> Unit,
    onOpenEngineSearch: () -> Unit,
    onRetry: () -> Unit,
) {
    Column(Modifier.fillMaxSize().padding(horizontal = PagePadding)) {
        Row(
            modifier = Modifier.fillMaxWidth().padding(top = 4.dp, bottom = 10.dp),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.spacedBy(10.dp),
        ) {
            Box(
                modifier = Modifier
                    .weight(1f)
                    .height(56.dp)
                    .clip(RoundedCornerShape(ControlRadius))
                    .background(CardColor)
                    .padding(horizontal = 16.dp),
                contentAlignment = Alignment.CenterStart,
            ) {
                if (query.isEmpty()) {
                    Text(
                        text = "Buscar no Apple Music",
                        color = TextSecondary,
                        fontSize = 16.sp,
                    )
                }
                BasicTextField(
                    value = query,
                    onValueChange = onQueryChange,
                    singleLine = true,
                    textStyle = TextStyle(color = TextPrimary, fontSize = 16.sp),
                    cursorBrush = SolidColor(Accent),
                    modifier = Modifier.fillMaxWidth(),
                )
            }
            CarSearchPill(
                label = "Limpar",
                enabled = query.isNotEmpty() || results.isNotEmpty(),
                onClick = { onQueryChange("") },
            )
            CarSearchPill(label = "App original", onClick = onOpenEngineSearch)
        }

        when {
            busy -> CarSearchMessage("Buscando…")
            error != null -> Column {
                CarSearchMessage(error)
                Spacer(Modifier.height(12.dp))
                Row(horizontalArrangement = Arrangement.spacedBy(10.dp)) {
                    CarSearchPill(label = "Tentar de novo", onClick = onRetry)
                    CarSearchPill(label = "Abrir busca do app original", onClick = onOpenEngineSearch)
                }
            }

            query.trim().length >= 2 && results.isEmpty() -> CarSearchMessage("Nada encontrado")
            results.isEmpty() -> CarSearchMessage("Digite pelo menos 2 letras.")
            else -> LazyColumn(
                modifier = Modifier.fillMaxSize(),
                contentPadding = PaddingValues(bottom = 12.dp),
                verticalArrangement = Arrangement.spacedBy(2.dp),
            ) {
                for (kind in SearchKind.entries) {
                    val group = results.filter { it.kind == kind }
                    if (group.isEmpty()) continue
                    item(key = "header-${kind.name}") {
                        Text(
                            text = kind.label,
                            color = TextSecondary,
                            fontSize = 13.sp,
                            fontWeight = FontWeight.SemiBold,
                            modifier = Modifier.padding(start = 4.dp, top = 8.dp, bottom = 4.dp),
                        )
                    }
                    items(group, key = { "${it.kind}-${it.id}" }) { result ->
                        CarSearchRow(result = result, onClick = { onResult(result) })
                    }
                }
            }
        }
    }
}

@Composable
private fun CarSearchMessage(message: String) {
    Text(
        text = message,
        color = TextSecondary,
        fontSize = 15.sp,
        modifier = Modifier.padding(horizontal = 4.dp, vertical = 10.dp),
    )
}

@Composable
private fun CarSearchPill(label: String, enabled: Boolean = true, onClick: () -> Unit) {
    val interaction = remember { MutableInteractionSource() }
    val pressed by interaction.collectIsPressedAsState()
    Box(
        modifier = Modifier
            .height(56.dp)
            .clip(RoundedCornerShape(ControlRadius))
            .background(
                when {
                    !enabled -> CardColor.copy(alpha = 0.5f)
                    pressed -> CardColorPressed
                    else -> CardColor
                },
            )
            .clickable(
                interactionSource = interaction,
                indication = null,
                enabled = enabled,
                onClick = onClick,
            )
            .padding(horizontal = 18.dp),
        contentAlignment = Alignment.Center,
    ) {
        Text(
            text = label,
            color = if (enabled) TextPrimary else TextSecondary,
            fontSize = 15.sp,
            fontWeight = FontWeight.SemiBold,
            maxLines = 1,
        )
    }
}

@Composable
private fun CarSearchRow(result: SearchResult, onClick: () -> Unit) {
    val interaction = remember { MutableInteractionSource() }
    val pressed by interaction.collectIsPressedAsState()
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .height(68.dp)
            .clip(RoundedCornerShape(ControlRadius))
            .background(if (pressed) CardColor else Color.Transparent)
            .clickable(interactionSource = interaction, indication = null, onClick = onClick)
            .padding(horizontal = 12.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        CarSearchArtwork(result)
        Spacer(Modifier.width(14.dp))
        Column(Modifier.weight(1f)) {
            Text(
                text = result.title,
                color = TextPrimary,
                fontSize = 16.sp,
                fontWeight = FontWeight.SemiBold,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
            )
            if (result.artist.isNotBlank()) {
                Text(
                    text = result.artist,
                    color = TextSecondary,
                    fontSize = 13.sp,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                )
            }
        }
    }
}

@Composable
private fun CarSearchArtwork(result: SearchResult) {
    val shape = if (result.kind == SearchKind.ARTIST) CircleShape else RoundedCornerShape(8.dp)
    Box(
        modifier = Modifier.size(48.dp).clip(shape).background(CardColorPressed),
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
