package app.xiondigital.tandemstudy.ui

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import app.xiondigital.tandemstudy.data.ImportSummary
import java.time.Instant
import java.time.ZoneId
import java.time.format.DateTimeFormatter

@Composable
internal fun EmptyState(text: String) {
    Box(
        modifier = Modifier.fillMaxSize().padding(28.dp),
        contentAlignment = Alignment.Center,
    ) {
        Text(
            text = text,
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant,
            textAlign = TextAlign.Center,
        )
    }
}

internal fun ImportSummary.summary(): String {
    note?.let { return it }
    val wordPart = if (newWords == 0) "" else ", $newWords new words"
    return "Imported $messages messages from $conversations conversations$wordPart."
}

private val DAY_FORMAT = DateTimeFormatter.ofPattern("d MMM yyyy")
private val TIME_FORMAT = DateTimeFormatter.ofPattern("d MMM, HH:mm")

internal fun formatDay(epochMs: Long): String = DAY_FORMAT.format(at(epochMs))

internal fun formatTimestamp(epochMs: Long): String =
    if (epochMs <= 0) "no date" else TIME_FORMAT.format(at(epochMs))

internal fun formatGap(ms: Long?): String {
    if (ms == null || ms <= 0) return "no data"
    val minutes = ms / 60_000
    return when {
        minutes < 1 -> "under a minute"
        minutes < 60 -> "$minutes min"
        minutes < 1440 -> "${minutes / 60} h ${minutes % 60} min".replace(" 0 min", "")
        else -> "${minutes / 1440} d"
    }
}

private fun at(epochMs: Long) = Instant.ofEpochMilli(epochMs).atZone(ZoneId.systemDefault())
