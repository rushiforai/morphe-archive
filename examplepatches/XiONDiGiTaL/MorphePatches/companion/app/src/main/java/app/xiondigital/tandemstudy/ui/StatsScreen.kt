package app.xiondigital.tandemstudy.ui

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.HorizontalDivider
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import app.xiondigital.tandemstudy.data.Stats
import app.xiondigital.tandemstudy.data.StudyRepository

@Composable
fun StatsScreen(repo: StudyRepository, version: Long) {
    var stats by remember { mutableStateOf<Stats?>(null) }

    LaunchedEffect(version) { stats = repo.stats() }

    val current = stats ?: return
    if (current.messages == 0) {
        EmptyState("No statistics yet. Import your Tandem export to see message counts, activity and vocabulary.")
        return
    }

    Column(
        Modifier.fillMaxSize().verticalScroll(rememberScrollState()).padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(20.dp),
    ) {
        Row(horizontalArrangement = Arrangement.spacedBy(12.dp)) {
            Metric(formatInt(current.messages), "messages", Modifier.weight(1f))
            Metric(formatInt(current.conversations), "conversations", Modifier.weight(1f))
            Metric(formatInt(current.words), "distinct words", Modifier.weight(1f))
        }

        Column(verticalArrangement = Arrangement.spacedBy(4.dp)) {
            SectionTitle("Activity")
            Text(
                text = "${formatInt(current.wordHits)} words written" +
                    if (current.hasDirection) {
                        " \u00b7 ${(current.mineShare * 100).toInt()}% of messages are yours"
                    } else {
                        " \u00b7 direction not marked in the export, so reply times are unavailable"
                    },
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
            )
            ActivityChart(current.days)
        }

        Column(verticalArrangement = Arrangement.spacedBy(6.dp)) {
            SectionTitle("Most used words")
            current.topWords.forEach { word ->
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                ) {
                    Text(word.word, style = MaterialTheme.typography.bodyMedium)
                    Text(
                        text = word.hits.toString(),
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                    )
                }
            }
        }

        Column(verticalArrangement = Arrangement.spacedBy(6.dp)) {
            SectionTitle("Conversations")
            current.perConversation.forEach { conversation ->
                Column {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                    ) {
                        Text(conversation.partner, style = MaterialTheme.typography.bodyMedium)
                        Text(
                            text = "${formatInt(conversation.messages)} messages",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant,
                        )
                    }
                    if (conversation.medianReplyMs != null) {
                        Text(
                            text = "median reply ${formatGap(conversation.medianReplyMs)}",
                            style = MaterialTheme.typography.labelSmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant,
                        )
                    }
                    HorizontalDivider(color = MaterialTheme.colorScheme.surfaceVariant)
                }
            }
        }
    }
}

@Composable
private fun Metric(value: String, label: String, modifier: Modifier) {
    Column(modifier) {
        Text(value, style = MaterialTheme.typography.headlineSmall, fontWeight = FontWeight.Bold)
        Text(
            label,
            style = MaterialTheme.typography.labelSmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant,
        )
    }
}

@Composable
private fun SectionTitle(text: String) {
    Text(text, style = MaterialTheme.typography.titleSmall, fontWeight = FontWeight.SemiBold)
}

@Composable
private fun ActivityChart(days: List<Pair<Long, Int>>) {
    if (days.isEmpty()) {
        Text(
            "No dated messages in the export.",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant,
        )
        return
    }
    val peak = days.maxOfOrNull { it.second }?.coerceAtLeast(1) ?: 1
    Row(
        modifier = Modifier.fillMaxWidth().height(84.dp).padding(top = 8.dp),
        verticalAlignment = Alignment.Bottom,
    ) {
        days.forEach { (_, count) ->
            val ratio = count.toFloat() / peak
            Box(
                Modifier
                    .weight(1f)
                    .padding(horizontal = 1.dp)
                    .height((4f + 72f * ratio).dp)
                    .background(MaterialTheme.colorScheme.primary, RoundedCornerShape(2.dp)),
            )
        }
    }
    Text(
        text = "last ${days.size} active days \u00b7 peak $peak messages",
        style = MaterialTheme.typography.labelSmall,
        color = MaterialTheme.colorScheme.onSurfaceVariant,
    )
}

private fun formatInt(value: Int): String =
    if (value < 1000) value.toString() else String.format("%,d", value)
