package app.morphe.extension.chmate

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.webkit.WebView
import androidx.activity.compose.BackHandler
import androidx.activity.compose.LocalOnBackPressedDispatcherOwner
import androidx.activity.compose.setContent
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.Add
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.ui.Modifier
import androidx.compose.ui.focus.FocusRequester
import androidx.compose.ui.focus.focusRequester
import androidx.compose.ui.platform.LocalSoftwareKeyboardController
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.viewinterop.AndroidView
import kotlinx.coroutines.*

class ResponseNotesActivity : HaiagaruComposeActivity() {
    override fun onCreate(state: Bundle?) {
        super.onCreate(state)
        val controller = ResponseNotesScreen(this, intent) { finish() }
        setContent { HaiagaruUi.Theme { controller.Notes() } }
    }
}

internal class ResponseNotesScreen(
    private val activity: android.app.Activity,
    private val intent: Intent,
    private val close: () -> Unit
) {
    private val store = ResponseNotesStore.get(activity.applicationContext)
    private fun blank() = ResponseNotesStore.Note("", "", "", "", "", 0, 0)
    private fun mediaHtml(source: String): String {
        val media = ThreadMediaUrls.collect(source, null).take(8).joinToString("") { raw ->
            val safe = android.text.Html.escapeHtml(raw).replace("'", "&#39;")
            if (DirectVideoUrls.supported(raw)) "<video controls playsinline preload='metadata' src='$safe'></video>"
            else "<img loading='lazy' src='$safe'>"
        }
        return "<!doctype html><html><head><meta name='viewport' content='width=device-width,initial-scale=1'><style>body{margin:0;background:transparent;display:flex;gap:8px;overflow-x:auto}img,video{max-width:100%;height:170px;object-fit:contain;flex:0 0 auto}</style></head><body>$media</body></html>"
    }
    private fun openSource(address: String) {
        if (address.isBlank()) return
        activity.startActivity(Intent(activity, OpenUrlActivity::class.java).setData(Uri.parse(address)))
    }
    @OptIn(ExperimentalMaterial3Api::class)
    @Composable fun Notes() {
        val scope = rememberCoroutineScope()
        val memoFocus = remember { FocusRequester() }
        val keyboard = LocalSoftwareKeyboardController.current
        var query by rememberSaveable { mutableStateOf("") }
        var editId by rememberSaveable { mutableStateOf<String?>(null) }
        var sourceUrl by rememberSaveable { mutableStateOf(intent.getStringExtra("sourceUrl").orEmpty()) }
        var title by rememberSaveable { mutableStateOf("") }
        var text by rememberSaveable { mutableStateOf("") }
        var originalTitle by rememberSaveable { mutableStateOf("") }
        var originalText by rememberSaveable { mutableStateOf("") }
        var source by rememberSaveable { mutableStateOf("") }
        var number by rememberSaveable { mutableIntStateOf(0) }
        var url by rememberSaveable { mutableStateOf("") }
        var loaded by rememberSaveable { mutableStateOf(false) }
        var rows by remember { mutableStateOf<List<ResponseNotesStore.Note>>(emptyList()) }
        var revision by remember { mutableIntStateOf(0) }
        var busy by remember { mutableStateOf(false) }
        var error by remember { mutableStateOf<String?>(null) }
        var discard by remember { mutableStateOf(false) }
        var deleting by remember { mutableStateOf(false) }
        var sourceExpanded by rememberSaveable { mutableStateOf(false) }
        var isNew by rememberSaveable { mutableStateOf(false) }
        val dirty = title != originalTitle || text != originalText
        fun select(note: ResponseNotesStore.Note) {
            isNew = note.id.isEmpty(); editId = note.id.ifEmpty { java.util.UUID.randomUUID().toString() }; title = note.title; text = note.text; originalTitle = note.title; originalText = note.text
            url = note.url; source = note.source; number = note.number; sourceExpanded = false
        }
        fun list() { editId = null; sourceUrl = ""; revision++ }
        fun back() { if (busy) return; if (editId != null) { if (dirty) discard = true else list() } else close() }
        fun save(close: Boolean = true) {
            if (busy || text.isBlank()) return
            busy = true
            val note = ResponseNotesStore.Note(editId.orEmpty(), url, title, text, source, number, 0)
            scope.launch {
                try { val id = withContext(Dispatchers.IO) { store.save(note) }; editId = id; isNew = false; originalText = text; originalTitle = title
                    if (close) list()
                } catch (e: Exception) { error = "保存できませんでした。空き容量を確認してください。" }
                finally { busy = false; discard = false }
            }
        }
        // ChMate's embedded tablet tabs use native Back; the standalone screen owns a dispatcher.
        if (LocalOnBackPressedDispatcherOwner.current != null) BackHandler { back() }
        LaunchedEffect(editId) { if (editId != null && isNew) { memoFocus.requestFocus(); keyboard?.show() } }
        LaunchedEffect(Unit) {
            if (!loaded) { loaded = true
                if (sourceUrl.isNotEmpty()) try {
                    val existing = withContext(Dispatchers.IO) { store.response(sourceUrl) }
                    select(existing ?: ResponseNotesStore.Note("", sourceUrl, intent.getStringExtra("sourceTitle").orEmpty().take(160), "",
                        intent.getStringExtra("sourceText").orEmpty().take(4000), intent.getIntExtra("sourceNumber", 0), 0))
                } catch (e: Exception) { error = "メモを読み込めませんでした。" }
            }
        }
        LaunchedEffect(query, revision, editId) {
            if (editId == null) { delay(150); try { rows = withContext(Dispatchers.IO) { store.search(query) } }
                catch (e: Exception) { error = "メモを読み込めませんでした。" } }
        }
        Scaffold(topBar = { TopAppBar(title = { Text(if (editId == null) "メモ" else if (isNew) "メモを作成" else "メモを編集") },
            navigationIcon = { IconButton(onClick = { back() }) { Icon(Icons.AutoMirrored.Filled.ArrowBack, "戻る") } },
            actions = { if (editId == null) TextButton(onClick = { select(blank()) }) { Text("作成") }
                else { TextButton(enabled = !busy, onClick = { if (dirty) discard = true else list() }) { Text("一覧・検索") }
                TextButton(enabled = !busy && text.isNotBlank(), onClick = { save() }) { Text(if (busy) "保存中…" else "保存") } } }) },
            ) { padding ->
            if (editId == null) Column(Modifier.fillMaxSize().padding(padding).padding(horizontal = 16.dp)) {
                OutlinedTextField(query, { query = it.take(160) }, modifier = Modifier.fillMaxWidth(), label = { Text("メモ・タイトル・元のレスを検索") }, singleLine = true,
                    trailingIcon = { if (query.isNotEmpty()) TextButton(onClick = { query = "" }) { Text("消去") } })
                Text("${rows.size}件${if (rows.size == 500) "（最新500件まで）" else ""}", style = MaterialTheme.typography.labelMedium, modifier = Modifier.padding(vertical = 8.dp))
                LazyColumn(contentPadding = PaddingValues(bottom = 96.dp), verticalArrangement = Arrangement.spacedBy(8.dp)) {
                    if (rows.isEmpty()) item { Text(if (query.isBlank()) "気になったレスを長押しして「メモ」。\nここから自由なメモも作れます。" else "一致するメモがありません。", modifier = Modifier.padding(vertical = 24.dp)) }
                    items(rows, key = { it.id }) { note -> Card(Modifier.fillMaxWidth().clickable { select(note) }) {
                        Column(Modifier.padding(16.dp)) {
                            Text(note.title.ifBlank { note.text.lineSequence().firstOrNull().orEmpty() }, style = MaterialTheme.typography.titleMedium, maxLines = 2, overflow = TextOverflow.Ellipsis)
                            Text(note.text, maxLines = 3, overflow = TextOverflow.Ellipsis, modifier = Modifier.padding(top = 6.dp))
                            Row(Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween) {
                                Text((if (note.number > 0) ">>${note.number} ・ " else "") + android.text.format.DateFormat.format("MM/dd HH:mm", note.updated), style = MaterialTheme.typography.labelSmall, modifier = Modifier.padding(top = 8.dp))
                                TextButton(onClick = { select(note) }) { Text("メモを編集") }
                            }
                            if (note.url.isNotBlank()) TextButton(onClick = { openSource(note.url) }) { Text("元スレを開いて編集・返信") }
                        }
                    } }
                }
            } else Column(Modifier.fillMaxSize().padding(padding).imePadding().padding(horizontal = 16.dp), verticalArrangement = Arrangement.spacedBy(8.dp)) {
                OutlinedTextField(title, { title = it.take(160) }, enabled = !busy, modifier = Modifier.fillMaxWidth(), label = { Text("タイトル（任意）") }, singleLine = true)
                if (url.isNotEmpty()) {
                    Row(Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween) {
                        TextButton(onClick = { sourceExpanded = !sourceExpanded }) { Text(if (sourceExpanded) "元のレスを閉じる" else "元のレス >>$number") }
                        TextButton(onClick = { openSource(url) }) { Text("元スレを開いて編集・返信") }
                    }
                    Text(url, color = MaterialTheme.colorScheme.primary, style = MaterialTheme.typography.bodySmall,
                        modifier = Modifier.fillMaxWidth().clickable { openSource(url) })
                    if (sourceExpanded) Text(source, maxLines = 6, overflow = TextOverflow.Ellipsis, style = MaterialTheme.typography.bodySmall)
                    val mediaUrls = remember(source) { ThreadMediaUrls.collect(source, null) }
                    if (mediaUrls.isNotEmpty()) AndroidView(
                        modifier = Modifier.fillMaxWidth().height(180.dp),
                        factory = { context -> WebView(context).apply {
                            settings.javaScriptEnabled = false
                            settings.domStorageEnabled = false
                            settings.mediaPlaybackRequiresUserGesture = true
                            setBackgroundColor(android.graphics.Color.TRANSPARENT)
                        } },
                        update = { view -> view.loadDataWithBaseURL(url, mediaHtml(source), "text/html", "UTF-8", null) }
                    )
                }
                OutlinedTextField(text, { text = it.take(30000) }, enabled = !busy, modifier = Modifier.fillMaxWidth().weight(1f).focusRequester(memoFocus), label = { Text("メモ") },
                    placeholder = { Text("気になったことを書き留める") })
                Row(Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween) {
                    Text("${text.length}/30000", style = MaterialTheme.typography.labelSmall)
                    if (!isNew) TextButton(enabled = !busy, onClick = { deleting = true }) { Text("削除", color = MaterialTheme.colorScheme.error) }
                }
            }
        }
        if (discard) AlertDialog(onDismissRequest = { discard = false }, title = { Text("変更を保存しますか？") }, text = { Text("保存してから一覧へ戻れます。") },
            confirmButton = { TextButton(enabled = text.isNotBlank() && !busy, onClick = { save() }) { Text("保存") } },
            dismissButton = { Row { TextButton(onClick = { discard = false }) { Text("編集を続ける") }; TextButton(onClick = { discard = false; list() }) { Text("破棄") } } })
        if (deleting) AlertDialog(onDismissRequest = { deleting = false }, title = { Text("このメモを削除しますか？") }, text = { Text("元のレスやスレは削除されません。") },
            confirmButton = { TextButton(onClick = { deleting = false; busy = true; val id = editId.orEmpty(); scope.launch { try { withContext(Dispatchers.IO) { store.remove(id) }; list() } catch (e: Exception) { error = "削除できませんでした。" } finally { busy = false } } }) { Text("削除") } },
            dismissButton = { TextButton(onClick = { deleting = false }) { Text("キャンセル") } })
        error?.let { message -> AlertDialog(onDismissRequest = { error = null }, title = { Text("メモ") }, text = { Text(message) }, confirmButton = { TextButton(onClick = { error = null }) { Text("閉じる") } }) }
    }
}
