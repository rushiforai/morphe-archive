package app.xiondigital.tandemstudy.ui

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.HorizontalDivider
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import app.xiondigital.tandemstudy.data.StudyRepository
import app.xiondigital.tandemstudy.data.WordItem
import app.xiondigital.tandemstudy.data.WordSort

@Composable
fun VocabularyScreen(repo: StudyRepository, version: Long) {
    var sortIndex by rememberSaveable { mutableIntStateOf(0) }
    var filter by rememberSaveable { mutableStateOf("") }
    var words by remember { mutableStateOf<List<WordItem>>(emptyList()) }

    LaunchedEffect(version, sortIndex) {
        words = repo.words(WordSort.entries[sortIndex], 800)
    }

    val shown = remember(words, filter) {
        val needle = filter.trim()
        if (needle.isEmpty()) words else words.filter { it.word.contains(needle, ignoreCase = true) }
    }

    Column(Modifier.fillMaxSize()) {
        Row(
            modifier = Modifier.fillMaxWidth().padding(horizontal = 8.dp),
            horizontalArrangement = Arrangement.spacedBy(2.dp),
        ) {
            WordSort.entries.forEachIndexed { index, sort ->
                TextButton(onClick = { sortIndex = index }) {
                    Text(
                        text = sort.label,
                        fontWeight = if (index == sortIndex) FontWeight.Bold else FontWeight.Normal,
                        color = if (index == sortIndex) {
                            MaterialTheme.colorScheme.primary
                        } else {
                            MaterialTheme.colorScheme.onSurfaceVariant
                        },
                    )
                }
            }
        }

        OutlinedTextField(
            value = filter,
            onValueChange = { filter = it },
            label = { Text("Filter words") },
            singleLine = true,
            modifier = Modifier.fillMaxWidth().padding(horizontal = 16.dp),
        )

        when {
            words.isEmpty() -> EmptyState(
                "No words yet.\n\nImport your Tandem export with the button in the top bar.\n\n" +
                    "In Tandem: Profile \u2192 Settings \u2192 Download my data, then pick the downloaded " +
                    "archive here.",
            )

            shown.isEmpty() -> EmptyState("No word matches \"${filter.trim()}\".")
            else -> LazyColumn(Modifier.weight(1f)) {
                items(shown, key = { "${it.lang}:${it.word}" }) { word ->
                    WordRow(word)
                    HorizontalDivider(color = MaterialTheme.colorScheme.surfaceVariant)
                }
            }
        }
    }
}

@Composable
private fun WordRow(word: WordItem) {
    Row(
        modifier = Modifier.fillMaxWidth().padding(horizontal = 16.dp, vertical = 10.dp),
        horizontalArrangement = Arrangement.SpaceBetween,
    ) {
        Column(Modifier.weight(1f)) {
            Text(word.word, style = MaterialTheme.typography.bodyLarge)
            Text(
                text = buildString {
                    append(word.hits)
                    append(if (word.hits == 1) " use" else " uses")
                    append(" \u00b7 ")
                    append(word.lang.uppercase())
                    if (word.known) append(" \u00b7 learnt")
                },
                style = MaterialTheme.typography.labelSmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
            )
        }
        Text(
            text = "due ${formatDay(word.dueAt)}",
            style = MaterialTheme.typography.labelSmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant,
        )
    }
}
