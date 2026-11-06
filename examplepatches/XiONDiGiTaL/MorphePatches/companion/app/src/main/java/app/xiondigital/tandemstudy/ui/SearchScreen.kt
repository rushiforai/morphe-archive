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
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import app.xiondigital.tandemstudy.data.SearchHit
import app.xiondigital.tandemstudy.data.StudyRepository
import kotlinx.coroutines.delay

@Composable
fun SearchScreen(repo: StudyRepository) {
    var query by rememberSaveable { mutableStateOf("") }
    var hits by remember { mutableStateOf<List<SearchHit>>(emptyList()) }
    var searching by remember { mutableStateOf(false) }

    LaunchedEffect(query) {
        val needle = query.trim()
        if (needle.length < 2) {
            hits = emptyList()
            searching = false
            return@LaunchedEffect
        }
        searching = true
        delay(250)
        hits = repo.search(needle)
        searching = false
    }

    Column(Modifier.fillMaxSize()) {
        OutlinedTextField(
            value = query,
            onValueChange = { query = it },
            label = { Text("Search imported messages") },
            singleLine = true,
            modifier = Modifier.fillMaxWidth().padding(16.dp),
        )

        when {
            query.trim().length < 2 -> EmptyState(
                "Type at least two characters.\n\nSearch covers the messages in your imported export, " +
                    "not Tandem's live history.",
            )

            searching -> EmptyState("Searching...")
            hits.isEmpty() -> EmptyState("Nothing matches \"${query.trim()}\" in the imported messages.")
            else -> LazyColumn(Modifier.weight(1f)) {
                items(hits, key = { it.id }) { hit ->
                    HitRow(hit)
                    HorizontalDivider(color = MaterialTheme.colorScheme.surfaceVariant)
                }
            }
        }
    }
}

@Composable
private fun HitRow(hit: SearchHit) {
    Column(Modifier.fillMaxWidth().padding(horizontal = 16.dp, vertical = 10.dp)) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
        ) {
            Text(
                text = if (hit.isMine) "You" else hit.partner,
                style = MaterialTheme.typography.labelMedium,
                color = MaterialTheme.colorScheme.secondary,
            )
            Text(
                text = formatTimestamp(hit.at),
                style = MaterialTheme.typography.labelSmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
            )
        }
        Text(hit.body, style = MaterialTheme.typography.bodyMedium)
    }
}
