package app.xiondigital.tandemstudy.ui

import android.Manifest
import android.content.pm.PackageManager
import android.os.Build
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.NavigationBar
import androidx.compose.material3.NavigationBarItem
import androidx.compose.material3.Scaffold
import androidx.compose.material3.SnackbarDuration
import androidx.compose.material3.SnackbarHost
import androidx.compose.material3.SnackbarHostState
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.core.content.ContextCompat
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import app.xiondigital.tandemstudy.data.ServiceLocator
import kotlinx.coroutines.launch

private data class Tab(val label: String, val glyph: String)

private val TABS = listOf(
    Tab("Words", "Aa"),
    Tab("Stats", "%"),
    Tab("Search", "?"),
    Tab("Review", ">"),
)

private val IMPORT_TYPES = arrayOf(
    "application/zip",
    "application/json",
    "application/octet-stream",
    "text/plain",
    "*/*",
)

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun App(openReview: Boolean = false) {
    val context = LocalContext.current
    val repo = remember { ServiceLocator.repo() }
    val version by repo.dataVersion.collectAsStateWithLifecycle()
    val scope = rememberCoroutineScope()
    val snackbar = remember { SnackbarHostState() }

    var tab by rememberSaveable { mutableIntStateOf(if (openReview) 3 else 0) }
    var busy by remember { mutableStateOf(false) }

    val notificationPermission = rememberLauncherForActivityResult(
        ActivityResultContracts.RequestPermission(),
    ) { }

    LaunchedEffect(Unit) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            val granted = ContextCompat.checkSelfPermission(
                context, Manifest.permission.POST_NOTIFICATIONS,
            ) == PackageManager.PERMISSION_GRANTED
            if (!granted) notificationPermission.launch(Manifest.permission.POST_NOTIFICATIONS)
        }
    }

    val picker = rememberLauncherForActivityResult(ActivityResultContracts.OpenDocument()) { uri ->
        if (uri == null) return@rememberLauncherForActivityResult
        scope.launch {
            busy = true
            val result = runCatching { repo.import(uri) }
            busy = false
            val message = result.fold(
                onSuccess = { it.summary() },
                onFailure = { "Import failed: ${it.message ?: "unknown error"}" },
            )
            snackbar.showSnackbar(message, duration = SnackbarDuration.Long, withDismissAction = true)
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Tandem Study") },
                actions = {
                    TextButton(
                        onClick = { picker.launch(IMPORT_TYPES) },
                        enabled = !busy,
                    ) {
                        Text(if (busy) "Reading..." else "Import")
                    }
                },
            )
        },
        bottomBar = {
            NavigationBar {
                TABS.forEachIndexed { index, item ->
                    NavigationBarItem(
                        selected = tab == index,
                        onClick = { tab = index },
                        icon = { Text(item.glyph) },
                        label = { Text(item.label) },
                    )
                }
            }
        },
        snackbarHost = { SnackbarHost(snackbar) },
    ) { padding ->
        Box(Modifier.fillMaxSize().padding(padding)) {
            when (tab) {
                0 -> VocabularyScreen(repo, version)
                1 -> StatsScreen(repo, version)
                2 -> SearchScreen(repo)
                else -> ReviewScreen(repo, version)
            }
        }
    }
}
