package app.xiondigital.tandemstudy.ui

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.Button
import androidx.compose.material3.HorizontalDivider
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.Switch
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import app.xiondigital.tandemstudy.data.StudyRepository
import app.xiondigital.tandemstudy.data.WordItem
import app.xiondigital.tandemstudy.work.Reminders
import kotlinx.coroutines.launch

@Composable
fun ReviewScreen(repo: StudyRepository, version: Long) {
    val context = LocalContext.current
    val scope = rememberCoroutineScope()

    var cards by remember { mutableStateOf<List<WordItem>>(emptyList()) }
    var index by rememberSaveable { mutableIntStateOf(0) }
    var due by remember { mutableStateOf(0) }
    var revealed by rememberSaveable { mutableStateOf(false) }

    var remindersOn by remember { mutableStateOf(Reminders.enabled(context)) }
    var hour by remember { mutableIntStateOf(Reminders.hour(context)) }

    LaunchedEffect(version) {
        cards = repo.dueCards(40)
        due = repo.dueCount()
        index = 0
        revealed = false
    }

    fun grade(good: Boolean) {
        val card = cards.getOrNull(index) ?: return
        scope.launch {
            repo.grade(card.word, card.lang, good)
            index += 1
            revealed = false
            due = repo.dueCount()
        }
    }

    Column(
        Modifier.fillMaxSize().verticalScroll(rememberScrollState()).padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp),
    ) {
        Column(verticalArrangement = Arrangement.spacedBy(4.dp)) {
            Text(
                text = if (due == 1) "1 word due" else "$due words due",
                style = MaterialTheme.typography.headlineSmall,
                fontWeight = FontWeight.Bold,
            )
            Text(
                text = "Words repeat on a doubling schedule: 1 day, then 2, 4, 8 and so on. " +
                    "A word is marked learnt after roughly two weeks of correct recalls.",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
            )
        }

        when {
            cards.isEmpty() -> EmptyState(
                "Nothing to review yet.\n\nImport an export, then words become due the day they are first seen.",
            )

            index >= cards.size -> EmptyState("Done for now — nothing else is due from this session.")
            else -> {
                val card = cards[index]
                Column(verticalArrangement = Arrangement.spacedBy(10.dp)) {
                    Text(
                        text = card.word,
                        style = MaterialTheme.typography.headlineMedium,
                        fontWeight = FontWeight.Bold,
                    )
                    Text(
                        text = "${card.hits} uses \u00b7 ${card.lang.uppercase()} \u00b7 " +
                            "next due ${formatDay(card.dueAt)}",
                        style = MaterialTheme.typography.labelMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                    )
                    Text(
                        text = "Recall what it means, then answer honestly.",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                    )
                    if (!revealed) {
                        Button(onClick = { revealed = true }) { Text("Show my answer") }
                    } else {
                        Row(horizontalArrangement = Arrangement.spacedBy(10.dp)) {
                            OutlinedButton(onClick = { grade(false) }, modifier = Modifier.weight(1f)) {
                                Text("Again")
                            }
                            Button(onClick = { grade(true) }, modifier = Modifier.weight(1f)) {
                                Text("Got it")
                            }
                        }
                    }
                }
            }
        }

        HorizontalDivider(color = MaterialTheme.colorScheme.surfaceVariant)

        Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
            Text("Daily reminder", style = MaterialTheme.typography.titleSmall, fontWeight = FontWeight.SemiBold)

            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceBetween,
            ) {
                Text("Notify me when words are due", style = MaterialTheme.typography.bodyMedium)
                Switch(
                    checked = remindersOn,
                    onCheckedChange = { on ->
                        remindersOn = on
                        if (on) Reminders.schedule(context, hour) else Reminders.cancel(context)
                    },
                )
            }

            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp),
            ) {
                Text("Time", style = MaterialTheme.typography.bodyMedium)
                TextButton(onClick = {
                    hour = (hour + 23) % 24
                    Reminders.storeHour(context, hour)
                    if (remindersOn) Reminders.schedule(context, hour)
                }) { Text("<") }
                Text(
                    text = "%02d:00".format(hour),
                    style = MaterialTheme.typography.bodyLarge,
                    fontWeight = FontWeight.SemiBold,
                )
                TextButton(onClick = {
                    hour = (hour + 1) % 24
                    Reminders.storeHour(context, hour)
                    if (remindersOn) Reminders.schedule(context, hour)
                }) { Text(">") }
            }

            TextButton(onClick = {
                scope.launch {
                    val current = repo.dueCount()
                    Reminders.showNotification(context, if (current == 0) 1 else current)
                }
            }) { Text("Send a test notification now") }

            Text(
                text = "Notifications are posted locally by WorkManager. The app has no internet " +
                    "permission, so nothing here is uploaded.",
                style = MaterialTheme.typography.labelSmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
            )
        }
    }
}
