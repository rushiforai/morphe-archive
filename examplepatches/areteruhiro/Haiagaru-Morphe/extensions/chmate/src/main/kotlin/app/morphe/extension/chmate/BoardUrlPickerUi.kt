package app.morphe.extension.chmate

import android.app.Activity
import android.graphics.Color
import android.graphics.drawable.ColorDrawable
import android.view.ViewGroup
import android.view.WindowManager
import androidx.activity.ComponentDialog
import androidx.compose.ui.platform.ComposeView
import androidx.compose.foundation.combinedClickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.compose.ui.text.style.TextOverflow
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

/** Empty until explicitly added; shared Haiagaru Material colors and controls. */
object BoardUrlPickerUi {
    @JvmStatic fun show(activity: Activity) {
        val dialog = ComponentDialog(HaiagaruComposeActivity.dialogContext(activity))
        dialog.setCancelable(true)
        dialog.setCanceledOnTouchOutside(true)
        val content = ComposeView(dialog.context)
        content.setContent { HaiagaruUi.Theme { Picker(activity, dialog) } }
        dialog.setContentView(content)
        dialog.show()
        dialog.window?.apply {
            setBackgroundDrawable(ColorDrawable(Color.TRANSPARENT))
            setLayout(minOf((activity.resources.displayMetrics.widthPixels * .92f).toInt(), (480 * activity.resources.displayMetrics.density).toInt()), ViewGroup.LayoutParams.WRAP_CONTENT)
            setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN or WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE)
        }
    }
    @OptIn(androidx.compose.foundation.ExperimentalFoundationApi::class)
    @Composable private fun Picker(activity: Activity, dialog: ComponentDialog) {
        var revision by remember { mutableIntStateOf(0) }
        var query by remember { mutableStateOf("") }
        var choosingBoard by remember { mutableStateOf(false) }
        var boards by remember { mutableStateOf<List<BoardUrlPicker.Entry>>(emptyList()) }
        var loading by remember { mutableStateOf(false) }
        var loadError by remember { mutableStateOf(false) }
        var editing by remember { mutableStateOf(false) }
        var manualBoard by remember { mutableStateOf(false) }
        var old by remember { mutableStateOf<BoardUrlPicker.Entry?>(null) }
        var name by remember { mutableStateOf("") }
        var address by remember { mutableStateOf("") }
        var error by remember { mutableStateOf<String?>(null) }
        val saved = remember(revision) { BoardUrlPicker.custom(activity).toList() }
        var unreadCounts by remember { mutableStateOf<Map<String, Int>>(emptyMap()) }
        LaunchedEffect(revision) {
            unreadCounts = withContext(Dispatchers.IO) { BoardUrlPicker.unreadCounts(activity.applicationContext, saved) }
        }
        LaunchedEffect(choosingBoard) {
            if (choosingBoard && boards.isEmpty()) {
                loading = true; loadError = false
                try { boards = withContext(Dispatchers.IO) { BoardUrlPicker.boards(activity.applicationContext) } }
                catch (_: Exception) { loadError = true }
                finally { loading = false }
            }
        }
        val entries = if (choosingBoard) boards else saved
        val filtered = remember(entries, query) { entries.filter { (it.name + " " + it.url).contains(query.trim(), ignoreCase = true) } }
        fun edit(entry: BoardUrlPicker.Entry?, asBoard: Boolean = false) { manualBoard = entry?.board ?: asBoard; old = entry; name = entry?.name.orEmpty(); address = entry?.url.orEmpty(); error = null; editing = true }
        Surface(shape = MaterialTheme.shapes.extraLarge, color = MaterialTheme.colorScheme.surfaceContainerHigh,
            border = androidx.compose.foundation.BorderStroke(1.dp, MaterialTheme.colorScheme.outline)) {
            Column(Modifier.fillMaxWidth().heightIn(max = (activity.resources.configuration.screenHeightDp * .75f).dp).padding(20.dp), verticalArrangement = Arrangement.spacedBy(10.dp)) {
                Text(if (choosingBoard) "追加する板を選択" else "板・スレ", style = MaterialTheme.typography.titleLarge)
                OutlinedTextField(query, { query = it.take(160) }, modifier = Modifier.fillMaxWidth(), singleLine = true, label = { Text("名前・URLで検索") })
                if (!choosingBoard) Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                    OutlinedButton(onClick = { query = ""; choosingBoard = true }) { Text("板を追加") }
                    FilledTonalButton(onClick = { edit(null) }) { Text("板／スレ URLを追加") }
                }
                if (choosingBoard) OutlinedButton(onClick = {
                    edit(null, asBoard = true)
                    if (query.trim().startsWith("https://") || query.trim().startsWith("http://")) address = query.trim()
                }) { Text("板URLを手入力して追加") }
                if (loading) LinearProgressIndicator(Modifier.fillMaxWidth())
                Text(if (loadError) "板一覧を読み込めませんでした。" else "${filtered.size}件", style = MaterialTheme.typography.labelMedium)
                LazyColumn(Modifier.fillMaxWidth().weight(1f, fill = false), verticalArrangement = Arrangement.spacedBy(6.dp)) {
                    if (filtered.isEmpty() && !loading) item {
                        Text(if (query.isNotBlank()) "一致する項目がありません。" else if (choosingBoard) "追加できる板がありません。" else "まだ登録されていません。\n「板を追加」「板／スレ URLを追加」から登録できます。", modifier = Modifier.padding(vertical = 12.dp))
                    }
                    items(filtered, key = { it.url }) { entry ->
                        Surface(shape = MaterialTheme.shapes.medium, color = MaterialTheme.colorScheme.surfaceContainer,
                            modifier = Modifier.fillMaxWidth().combinedClickable(onClick = {
                                if (choosingBoard) {
                                    val rows = BoardUrlPicker.custom(activity); rows.removeAll { it.url == entry.url }; rows.add(BoardUrlPicker.Entry(entry.name, entry.url, true, true))
                                    try { BoardUrlPicker.store(activity, rows); revision++; query = ""; choosingBoard = false } catch (e: IllegalArgumentException) { error = e.message }
                                } else try { activity.startActivity(BoardUrlPicker.destination(activity, entry.url, !entry.board)); dialog.dismiss() } catch (_: Exception) { error = "リンクを開けませんでした。" }
                            }, onLongClick = { if (!choosingBoard) edit(entry) })) {
                            Row(Modifier.fillMaxWidth().padding(12.dp), horizontalArrangement = Arrangement.SpaceBetween, verticalAlignment = androidx.compose.ui.Alignment.CenterVertically) {
                                Column(Modifier.weight(1f)) { Text(entry.name, style = MaterialTheme.typography.titleSmall, maxLines = 2, overflow = TextOverflow.Ellipsis)
                                Text(entry.url, style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.onSurfaceVariant, maxLines = 2, overflow = TextOverflow.Ellipsis) }
                                val unread = unreadCounts[entry.url] ?: 0
                                if (!choosingBoard && unread > 0) Surface(shape = MaterialTheme.shapes.small, color = MaterialTheme.colorScheme.primaryContainer) {
                                    Text("新着 $unread", modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp),
                                        style = MaterialTheme.typography.labelMedium, color = MaterialTheme.colorScheme.onPrimaryContainer)
                                }
                            }
                        }
                    }
                }
                if (!editing && error != null) Text(error.orEmpty(), color = MaterialTheme.colorScheme.error)
                Row(Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.End) {
                    if (choosingBoard) TextButton(onClick = { choosingBoard = false; query = "" }) { Text("登録一覧へ戻る") }
                    TextButton(onClick = { dialog.dismiss() }) { Text("閉じる") }
                }
            }
        }
        if (editing) AlertDialog(onDismissRequest = { editing = false }, title = { Text(if (old == null && manualBoard) "板URLを手入力して追加" else if (old == null) "板／スレ URLを追加" else "登録を編集") }, text = {
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                OutlinedTextField(name, { name = it.take(160) }, singleLine = true, label = { Text("表示名（任意）") })
                OutlinedTextField(address, { address = it.take(4096) }, singleLine = true, label = { Text("URL") })
                Row(Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween) {
                    Text("板として登録", modifier = Modifier.weight(1f))
                    Switch(checked = manualBoard, onCheckedChange = { manualBoard = it; error = null })
                }
                if (manualBoard) Text("板一覧に見つからない板も登録できます。スレURLではなく板のトップURLを入力してください。", style = MaterialTheme.typography.bodySmall)
                if (error != null) Text(error.orEmpty(), color = MaterialTheme.colorScheme.error)
            }
        }, confirmButton = { TextButton(onClick = {
            try { val entry = BoardUrlPicker.manualEntry(name, address, manualBoard); val rows = BoardUrlPicker.custom(activity); rows.removeAll { it.url == old?.url || it.url == entry.url }; rows.add(entry); BoardUrlPicker.store(activity, rows); revision++; editing = false; choosingBoard = false; query = ""; error = null }
            catch (e: IllegalArgumentException) { error = e.message }
        }) { Text("保存") } }, dismissButton = { Row {
            if (old != null) TextButton(onClick = { val rows = BoardUrlPicker.custom(activity); rows.removeAll { it.url == old?.url }; BoardUrlPicker.store(activity, rows); revision++; editing = false; error = null }) { Text("削除") }
            TextButton(onClick = { editing = false; error = null }) { Text("キャンセル") }
        } })
    }
}
