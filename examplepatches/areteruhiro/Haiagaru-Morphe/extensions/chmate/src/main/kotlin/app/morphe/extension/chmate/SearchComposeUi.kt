package app.morphe.extension.chmate

import android.content.SharedPreferences
import android.view.View
import android.view.ViewGroup
import android.widget.Button as NativeButton
import android.widget.TextView as NativeText
import androidx.activity.compose.setContent
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.selection.toggleable
import androidx.compose.foundation.text.selection.SelectionContainer
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.Settings
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalSoftwareKeyboardController
import androidx.compose.ui.platform.LocalFocusManager
import androidx.compose.ui.semantics.Role
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp

@Composable private fun RelativeSearchDays(a: HissiWacchoiSearchController, enabled: Boolean, changed: () -> Unit) {
    var days by rememberSaveable { mutableStateOf("0") }
    val parsed = days.toIntOrNull()
    Row(Modifier.fillMaxWidth().padding(8.dp), verticalAlignment = Alignment.CenterVertically) {
        OutlinedTextField(days, { days = it }, label = { Text("何日前から探す") },
            modifier = Modifier.weight(1f), singleLine = true, enabled = enabled,
            isError = parsed == null || parsed !in 0..36524,
            keyboardOptions = androidx.compose.foundation.text.KeyboardOptions(keyboardType = androidx.compose.ui.text.input.KeyboardType.Number))
        TextButton(onClick = { if(parsed != null && parsed in 0..36524) { a.useDaysAgo(parsed); changed() } },
            enabled = enabled && parsed != null && parsed in 0..36524) { Text("適用") }
    }
    ChoiceChips(listOf("今日", "1日前", "3日前", "7日前", "30日前"), listOf(0,1,3,7,30).indexOf(parsed), enabled) {
        val value = listOf(0,1,3,7,30)[it]; days = value.toString(); a.useDaysAgo(value); changed()
    }
}

@Composable private fun HissiTemplateSettings(prefs: SharedPreferences, a: HissiWacchoiSearchController) {
    Column(Modifier.fillMaxWidth().padding(12.dp), verticalArrangement = Arrangement.spacedBy(8.dp)) {
        Text("Hissi走査テンプレート", style = MaterialTheme.typography.titleMedium)
        var enabled by remember { mutableStateOf(prefs.getBoolean(HissiScanTemplate.ENABLED,true)) }
        Row(Modifier.fillMaxWidth(),verticalAlignment=Alignment.CenterVertically) {
            Text("長押し検索にテンプレートを適用して自動走査",Modifier.weight(1f))
            Switch(enabled,{enabled=it;prefs.edit().putBoolean(HissiScanTemplate.ENABLED,it).apply()})
        }
        Text("オフなら検索条件を表示して、開始を押すまで走査しません。",style=MaterialTheme.typography.bodySmall)
        var provider by remember { mutableIntStateOf(prefs.getInt(HissiScanTemplate.PROVIDER,0)) }
        Text("ワッチョイで検索の必死チェッカー")
        ChoiceChips(listOf("自動","hissi.org","Kyodemo","両方"),provider,true) {
            provider=it;prefs.edit().putInt(HissiScanTemplate.PROVIDER,it).apply()
        }
        Text("自動は5ch・外部板でhissi.org、エッヂでKyodemoを使います。両方は前回の検索先を保持し、画面上で切り替えます。",style=MaterialTheme.typography.bodySmall)
        var boards by remember { mutableStateOf(prefs.getString(HissiScanTemplate.BOARDS,"") ?: "") }
        var picker by remember { mutableStateOf(false) }
        OutlinedButton(onClick={picker=true;a.loadBoardsOnDemand()},modifier=Modifier.fillMaxWidth()) {
            Text("検索する板（${boards.split(',').count { it.isNotBlank() }}件選択）")
        }
        Text("未選択なら長押し元の板を使います。",style=MaterialTheme.typography.bodySmall)
        if(picker) TemplateBoardPicker(a,boards,{boards=it;prefs.edit().putString(HissiScanTemplate.BOARDS,it).apply()}) { picker=false }
        listOf(Triple(HissiScanTemplate.DAYS,"何日前から探す",0), Triple(HissiScanTemplate.PAGES,"一覧ページ上限",100),
            Triple(HissiScanTemplate.REQUESTS,"通信回数上限（0は無制限）",0)).forEach { (key,label,fallback) ->
            var value by remember(key) { mutableStateOf(prefs.getInt(key,fallback).toString()) }
            val number=value.toIntOrNull()
            val max=if(key==HissiScanTemplate.DAYS)36524 else if(key==HissiScanTemplate.PAGES)10000 else Int.MAX_VALUE
            val min=if(key==HissiScanTemplate.PAGES)1 else 0
            OutlinedTextField(value,{value=it;it.toIntOrNull()?.takeIf{n->n in min..max}?.let{n->prefs.edit().putInt(key,n).apply()}},
                label={Text(label)},singleLine=true,isError=number==null||number !in min..max,
                keyboardOptions=androidx.compose.foundation.text.KeyboardOptions(keyboardType=androidx.compose.ui.text.input.KeyboardType.Number),modifier=Modifier.fillMaxWidth())
        }
    }
}

@Composable private fun TemplateBoardPicker(a:HissiWacchoiSearchController, saved:String, save:(String)->Unit, close:()->Unit) {
    var filter by rememberSaveable { mutableStateOf("") }
    var selected by remember { mutableStateOf(saved.split(',').filter { it.isNotBlank() }.toSet()) }
    var refresh by remember { mutableIntStateOf(0) }
    LaunchedEffect(a) { while(true){kotlinx.coroutines.delay(500);refresh++} }
    @Suppress("UNUSED_VARIABLE") val revision=refresh
    val rows=a.templateBoardEntries().filter { it[0].contains(filter,true)||it[1].contains(filter,true) }
    androidx.compose.ui.window.Dialog(onDismissRequest=close,properties=androidx.compose.ui.window.DialogProperties(usePlatformDefaultWidth=false)) {
        Surface(Modifier.fillMaxSize(),color=MaterialTheme.colorScheme.surface) {
            Column(Modifier.fillMaxSize().imePadding().padding(16.dp),verticalArrangement=Arrangement.spacedBy(8.dp)) {
                Text("テンプレートで検索する板",style=MaterialTheme.typography.titleLarge)
                OutlinedTextField(filter,{filter=it},label={Text("板名・カテゴリ・板コードで検索")},singleLine=true,modifier=Modifier.fillMaxWidth())
                Row {
                    OutlinedButton(onClick={a.reloadTemplateBoards()}){Text("板一覧を取得・更新")}
                    TextButton(onClick={selected=emptySet()}){Text("全解除")}
                }
                Text("${selected.size}件選択 / ${a.boardStatus.text}",style=MaterialTheme.typography.bodySmall)
                LazyColumn(Modifier.weight(1f)) {
                    items(rows,key={it[0]}) { row ->
                        Row(Modifier.fillMaxWidth().toggleable(selected.contains(row[0]),role=Role.Checkbox,onValueChange={on->selected=if(on)selected+row[0] else selected-row[0]}).padding(8.dp),verticalAlignment=Alignment.CenterVertically) {
                            Checkbox(selected.contains(row[0]),null)
                            Text("${row[1]} (${row[0]})",Modifier.padding(start=8.dp))
                        }
                    }
                }
                Row { TextButton(onClick=close){Text("キャンセル")}; Button(onClick={save(selected.sorted().joinToString(","));close()},modifier=Modifier.weight(1f)){Text("選択を保存")} }
            }
        }
    }
}

/** Compose-only presentation; the existing controller owns search, budgets, history and resume. */
object SearchComposeUi {
    @JvmStatic fun embed(activity: android.app.Activity, controller: HissiWacchoiSearchController): View =
        embed(activity, controller, true, false)
    @JvmStatic fun embed(activity: android.app.Activity, controller: HissiWacchoiSearchController,
                         showTopBar: Boolean, embedded: Boolean): View =
        SettingsTabUi.composeView(activity) { SearchScreen(controller, showTopBar, embedded) }
}

private val searchToggleDefaults = mapOf(
    "wacchoiSearchEnabled" to true,
    "wacchoiBackgroundSearch" to false,
    "wacchoiSearchHistory" to true,
    "showEdgeSearch" to true,
    "showZzzSearch" to true
)

private fun searchToggleValues(prefs: SharedPreferences) =
    searchToggleDefaults.mapValues { (key, default) -> prefs.getBoolean(key, default) }

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun SearchScreen(a: HissiWacchoiSearchController, showTopBar: Boolean, embedded: Boolean) {
    var revision by remember { mutableIntStateOf(0) }
    val prefs = remember { a.getSharedPreferences(WacchoiSearchOptions.PREFS, 0) }
    var toggleValues by remember(prefs) { mutableStateOf(searchToggleValues(prefs)) }
    val changed: () -> Unit = { revision++ }
    DisposableEffect(a, prefs) {
        val listener = SharedPreferences.OnSharedPreferenceChangeListener { _, _ ->
            toggleValues = searchToggleValues(prefs)
            revision++
        }
        prefs.registerOnSharedPreferenceChangeListener(listener)
        toggleValues = searchToggleValues(prefs)
        a.setComposeChanged { revision++ }
        onDispose { prefs.unregisterOnSharedPreferenceChangeListener(listener); a.setComposeChanged(null) }
    }
    @Suppress("UNUSED_VARIABLE") val refresh = revision
    val enabled = toggleValues.getValue("wacchoiSearchEnabled")
    val edge = toggleValues.getValue("showEdgeSearch")
    val zzz = toggleValues.getValue("showZzzSearch")
    val source = a.searchSource
    val fullWacchoi = a.isFullWacchoiSearch()
    val running = a.stopButton.isEnabled
    val editing = enabled && !running
    val boardLabel = a.boardToggle.text.toString().replace("▲", "").replace("▼", "")
    val fromDate = a.fromInput.text.toString()
    val toDate = a.toInput.text.toString()
    val results = (0 until a.resultsLayout.childCount).map { a.resultsLayout.getChildAt(it) }
    val errors = buildList {
        a.fourInput.error?.let { add(it.toString()) }
        if (source == 0) {
            a.boardStatus.error?.let { add(it.toString()) }
            a.fromInput.error?.let { add(it.toString()) }
            a.toInput.error?.let { add(it.toString()) }
        } else if (source == 1 && a.edgeMode.selectedItemPosition == 0) {
            a.fromInput.error?.let { add(it.toString()) }
            a.toInput.error?.let { add(it.toString()) }
        }
        if (source != 2) {
            a.pageLimitInput.error?.let { add(it.toString()) }
            a.requestLimitInput.error?.let { add(it.toString()) }
            a.startOffsetInput.error?.let { add(it.toString()) }
        }
    }.distinct()
    var options by rememberSaveable { mutableStateOf(false) }
    var boardPicker by rememberSaveable { mutableStateOf(false) }
    var advanced by rememberSaveable { mutableStateOf(false) }
    var dateField by rememberSaveable { mutableStateOf("") }
    val list = rememberLazyListState(a.tabScrollIndex, a.tabScrollOffset)
    LaunchedEffect(a, list) {
        snapshotFlow { list.firstVisibleItemIndex to list.firstVisibleItemScrollOffset }.collect { (index, offset) ->
            a.tabScrollIndex = index; a.tabScrollOffset = offset
        }
    }
    val keyboard = LocalSoftwareKeyboardController.current
    val focus = LocalFocusManager.current
    LaunchedEffect(errors) {
        if (errors.isNotEmpty()) {
            if (a.pageLimitInput.error != null || a.requestLimitInput.error != null) advanced = true
            list.animateScrollToItem(0)
        }
    }
    LaunchedEffect(edge, zzz, source, running) {
        if (!running && ((source == 1 && !edge && a.allowsSource(0)) || (source == 2 && !zzz))) a.selectSource(if(a.allowsSource(0))0 else 1)
    }
    Scaffold(contentWindowInsets = if (embedded) WindowInsets(0.dp) else ScaffoldDefaults.contentWindowInsets,
        topBar = { if (showTopBar) {
        TopAppBar(title = { Text(if (fullWacchoi) "ワッチョイ全文検索" else "投稿を探す", maxLines = 1, overflow = TextOverflow.Ellipsis) }, navigationIcon = {
            IconButton(onClick = { a.finish() }) { Icon(Icons.AutoMirrored.Filled.ArrowBack, "戻る") }
        }, actions = {
            TextButton(onClick = { a.showScanJobs() }) { Text("走査一覧") }
            TextButton(onClick = { a.historyFromCompose() }) { Text("履歴") }
            IconButton(onClick = { options = true }) { Icon(Icons.Filled.Settings, "検索の設定") }
        })
    } }, bottomBar = {
        Surface(tonalElevation = 3.dp) {
            Column(Modifier.fillMaxWidth().navigationBarsPadding().imePadding().padding(horizontal = 16.dp, vertical = 10.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)) {
                if (running) Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(12.dp)) {
                    CircularProgressIndicator(Modifier.size(20.dp), strokeWidth = 2.dp)
                    Text(a.statusView.text.toString().ifBlank { "検索しています…" }, Modifier.weight(1f),
                        maxLines = 3, overflow = TextOverflow.Ellipsis, style = MaterialTheme.typography.bodySmall)
                    FilledTonalButton(onClick = { a.stopFromCompose() }) { Text("停止") }
                } else {
                    if (a.resumeButton.isEnabled) OutlinedButton(onClick = { a.resumeFromCompose() }, enabled = enabled,
                        modifier = Modifier.fillMaxWidth()) { Text("前回の続きから検索") }
                    Button(onClick = { keyboard?.hide(); focus.clearFocus(); a.searchFromCompose() }, enabled = enabled && a.startButton.isEnabled,
                        modifier = Modifier.fillMaxWidth().heightIn(min = 56.dp)) {
                        Text(when {
                            fullWacchoi -> "Hissiで全文を検索"
                            source == 1 && a.edgeMode.selectedItemPosition == 0 -> "このIDと日付範囲でKyodemoを検索"
                            source == 1 -> "エッヂを検索"
                            source == 2 -> "ZZZSearchで検索"
                            else -> "選んだ板を検索"
                        })
                    }
                }
            }
        }
    }) { insets ->
        LazyColumn(state = list, modifier = Modifier.fillMaxSize().padding(insets),
            contentPadding = PaddingValues(16.dp), verticalArrangement = Arrangement.spacedBy(16.dp)) {
            item { OutlinedButton(onClick = { options=true },modifier=Modifier.fillMaxWidth()) { Text("検索設定・Hissi走査テンプレート") } }
            if(a.postsOnly() && fullWacchoi && a.fullProviderSwitchAllowed()) item {
                HaiagaruUi.Group("検索先") {
                    ChoiceChips(listOf("Kyodemo","hissi.org"),1,editing) {
                        if(it==0)a.openFullWacchoiKyodemo()
                    }
                }
            }
            if (!a.postsOnly()) item { OutlinedButton(onClick = { a.prepareAnotherScan(); changed() }, enabled = enabled,
                modifier = Modifier.fillMaxWidth()) { Text("別の走査を準備（バックグラウンド・同時3件まで）") } }
            if (errors.isNotEmpty()) item {
                Surface(shape = MaterialTheme.shapes.extraLarge, color = MaterialTheme.colorScheme.errorContainer) {
                    Column(Modifier.fillMaxWidth().padding(16.dp), verticalArrangement = Arrangement.spacedBy(6.dp)) {
                        Text("入力内容を確認してください", style = MaterialTheme.typography.titleSmall)
                        errors.forEach { Text(it, style = MaterialTheme.typography.bodyMedium) }
                    }
                }
            }
            if(a.idSearch() && source != 1) item { OutlinedButton(onClick={a.openFullWacchoiKyodemo()},enabled=editing,modifier=Modifier.fillMaxWidth()){Text("このIDと日付範囲でKyodemoを検索")} }
            if (!a.postsOnly()) item {
                if (fullWacchoi) {
                    HaiagaruUi.Group("検索先") {
                        if(a.fullProviderSwitchAllowed())ChoiceChips(listOf("Kyodemo", "Hissi"), 1, editing) {
                            if (it == 0) a.openFullWacchoiKyodemo()
                        }
                        Text("Hissiの日別投稿者一覧から、上側・下側を合わせた全文を照合します。板と日付を確認して検索してください。Kyodemoへ切り替えても入力条件は保持します。",
                            Modifier.padding(12.dp), style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant)
                    }
                } else {
                Text("どこを探しますか", style = MaterialTheme.typography.titleMedium, modifier = Modifier.padding(start = 8.dp))
                val sources = (if(a.allowsSource(0)) listOf(0 to "Hissi") else emptyList()) + (if (a.allowsSource(1) && (edge || (source == 1 && running))) listOf(1 to "エッヂ") else emptyList()) +
                    (if (zzz || (source == 2 && running)) listOf(2 to "ZZZSearch") else emptyList())
                ChoiceChips(sources.map { it.second }, sources.indexOfFirst { it.first == source }, !running) {
                    a.selectSource(sources[it].first)
                }
                Text(when (source) {
                    1 -> "Kyodemoに収録された現行・過去スレから、ID・ワッチョイ・スレ名・レス本文を探します。"
                    2 -> "入力した条件でZZZSearchを開きます。Hissi・エッヂの走査上限は使用しません。"
                    else -> "Hissiの日別の投稿者一覧を調べます。まず板と対象日を選んでください。"
                }, style = MaterialTheme.typography.bodyMedium, color = MaterialTheme.colorScheme.onSurfaceVariant,
                    modifier = Modifier.padding(horizontal = 8.dp))
                }
            }
            if (source == 0 && !a.postsOnly()) item {
                HaiagaruUi.Group("検索する板・日付") {
                    RelativeSearchDays(a, editing, changed)
                    OutlinedButton(onClick = { boardPicker = true; a.loadBoardsOnDemand() }, enabled = editing,
                        modifier = Modifier.fillMaxWidth().padding(8.dp)) {
                        Text(boardLabel)
                    }
                    if (a.boardStatus.error != null) Text(a.boardStatus.error.toString(), color = MaterialTheme.colorScheme.error,
                        modifier = Modifier.padding(12.dp))
                    Row(Modifier.padding(8.dp), horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                        OutlinedButton(onClick = { dateField = "from" }, enabled = editing, modifier = Modifier.weight(1f)) {
                            Text("開始 ${displayDate(fromDate)}")
                        }
                        OutlinedButton(onClick = { dateField = "to" }, enabled = editing, modifier = Modifier.weight(1f)) {
                            Text("終了 ${displayDate(toDate)}")
                        }
                    }
                    if (a.fromInput.error != null) Text(a.fromInput.error.toString(), color = MaterialTheme.colorScheme.error,
                        modifier = Modifier.padding(12.dp))
                }
            }
            if (source == 1 && a.edgeMode.selectedItemPosition == 0) item {
                HaiagaruUi.Group("KyodemoでIDを検索する日付") {
                    Row(Modifier.padding(8.dp), horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                        OutlinedButton(onClick = { dateField = "from" }, enabled = editing,
                            modifier = Modifier.weight(1f)) {
                            Text("開始 ${displayDate(a.fromInput.text.toString())}")
                        }
                        OutlinedButton(onClick = { dateField = "to" }, enabled = editing,
                            modifier = Modifier.weight(1f)) {
                            Text("終了 ${displayDate(a.toInput.text.toString())}")
                        }
                    }
                    Text("初期範囲は直近7日です。カレンダーで範囲を変更できます。ID検索はKyodemoの検索結果を直接開き、スレを順に走査しません。",
                        Modifier.padding(horizontal = 12.dp), style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant)
                }
            }
            if (!a.postsOnly() || (source == 1 && !fullWacchoi)) item {
                HaiagaruUi.Group("絞り込み") {
                    if (source == 1) {
                        ChoiceChips(listOf("投稿ID", "ワッチョイ上4桁", "ワッチョイ下4桁"), a.edgeMode.selectedItemPosition, editing) {
                            a.edgeMode.setSelection(it); changed()
                        }
                    } else if (!fullWacchoi) {
                        val upper = a.halfGroup.checkedRadioButtonId == a.halfGroup.getChildAt(0).id
                        ChoiceChips(listOf("上側（ハイフン前）", "下側（ハイフン後）"), if (upper) 0 else 1, editing) {
                            a.halfGroup.check(a.halfGroup.getChildAt(it).id); changed()
                        }
                    }
                    BoundTextField(a.fourInput,
                        if (fullWacchoi) "ワッチョイ全文（例：abcd-Ef12）" else if (source == 1 && a.edgeMode.selectedItemPosition == 0) "投稿ID（ID:付き可）" else "ワッチョイの文字（部分一致・空欄可）",
                        enabled = editing, changed = changed)
                    if (source == 2 || (source == 1 && a.edgeMode.selectedItemPosition != 0)) {
                        BoundTextField(a.titleKeywordInput, "スレ名に含まれる言葉（空欄可）", editing, changed)
                        BoundTextField(a.bodyKeywordInput, "レス本文に含まれる言葉（空欄可）", editing, changed)
                        Text("スレ名だけ・本文だけでも検索できます。複数の言葉は空白で区切ります。",
                            Modifier.padding(12.dp), style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.onSurfaceVariant)
                    } else if (source == 1 && a.edgeMode.selectedItemPosition == 0) {
                        Text("IDはKyodemoの検索を直接開きます。スレごとの走査は行いません。",
                            Modifier.padding(12.dp), style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant)
                    }
                    if (source == 1) ChoiceChips(listOf("過去ログ", "現行スレ"), if (a.edgePast.isChecked) 0 else 1, editing) {
                        a.edgePast.isChecked = it == 0; changed()
                    }
                }
            }
            if (source != 2 && !a.postsOnly()) item {
                HaiagaruUi.Group {
                    TextButton(onClick = { advanced = !advanced }, modifier = Modifier.fillMaxWidth()) {
                        Text(if (advanced) "走査・通信の上限を閉じる" else "走査・通信の上限  ·  ${a.pageLimitInput.text}${if (source == 1) "スレ" else "ページ"}")
                    }
                    if (advanced) {
                        BoundTextField(a.pageLimitInput, if (source == 1) "調べるスレ数（1〜10000）" else "板・日付ごとの一覧ページ数（1〜10000）", editing, changed)
                        BoundTextField(a.requestLimitInput, "通信回数の上限（0は無制限）", editing, changed)
                        BoundTextField(a.startOffsetInput, if (source == 1) "開始スレ位置（0は先頭）" else "開始ページ（0は先頭・最初の板と日付に適用）", editing, changed)
                        Text("通信間隔はHaiagaru設定に従います（初期値：Hissi 3秒、Kyodemo 10秒）。短くすると相手サイトへの負荷が増え、アクセス制限や一時的な利用停止につながる場合があります。上限や制限に達したら停止します。通信回数は開始・再開ごとに数えます。",
                            Modifier.padding(12.dp), style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.onSurfaceVariant)
                    }
                }
            }
            if (a.statusView.text.isNotBlank() && !running) item {
                Text(a.statusView.text.toString(), Modifier.padding(8.dp), style = MaterialTheme.typography.bodyMedium)
            }
            if (results.isNotEmpty()) item { Text("検索結果 ${results.size}件", style = MaterialTheme.typography.titleMedium) }
            items(results, key = { System.identityHashCode(it) }) { result -> SearchResultCard(result) }
            if (results.isEmpty() && !running) item {
                Text("検索結果はここに表示されます。検索サービスに収録されていない投稿は見つかりません。",
                    style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.onSurfaceVariant, modifier = Modifier.padding(8.dp))
            }
        }
    }
    if (options) androidx.compose.ui.window.Dialog(onDismissRequest = { options = false },
        properties = androidx.compose.ui.window.DialogProperties(usePlatformDefaultWidth = false)) {
        Scaffold(Modifier.fillMaxSize(), topBar = {
            TopAppBar(title = { Text("投稿検索の設定") }, navigationIcon = {
                IconButton(onClick = { options = false }) { Icon(Icons.AutoMirrored.Filled.ArrowBack,"戻る") }
            })
        }) { insets -> Box(Modifier.fillMaxSize().padding(insets)) { SearchOptionsSheet(a, prefs, toggleValues, changed) } }
    }
    if (boardPicker) {
        // Snapshot native bindings in this revision scope. The lazy content lambda
        // can otherwise be reused with stale checked/status values.
        val boardRows = settingsRows(a.boardChoices)
        val boardStatus = a.boardStatus.text.toString()
        ModalBottomSheet(onDismissRequest = { boardPicker = false }) {
            LazyColumn(Modifier.fillMaxWidth().imePadding(), contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)) {
                item { Text("検索する板", style = MaterialTheme.typography.headlineSmall) }
                item { BoundTextField(a.boardFilter, "板名・カテゴリで絞り込み", changed = changed) }
                item { Text(boardStatus, style = MaterialTheme.typography.bodySmall) }
                item { TextButton(onClick = { a.reloadTemplateBoards(); changed() }) { Text("板一覧を再取得") } }
                val actions = a.boardSection.getChildAt(2) as ViewGroup
                items((0 until actions.childCount).map { actions.getChildAt(it) }) { button ->
                    TextButton(onClick = { button.performClick(); changed() }) { Text((button as NativeButton).text.toString()) }
                }
                items(boardRows, key = { (it.control as android.widget.CheckBox).tag.toString() }) { option ->
                    BoundSettingRow(option, changed)
                }
                item { Button(onClick = { boardPicker = false }, Modifier.fillMaxWidth()) { Text("選択を完了") } }
            }
        }
    }
    if (dateField.isNotEmpty()) {
        val target = if (dateField == "from") a.fromInput else a.toInput
        val dateFormat = remember { java.text.SimpleDateFormat("yyyyMMdd", java.util.Locale.US).apply {
            timeZone = java.util.TimeZone.getTimeZone("UTC"); isLenient = false
        } }
        val initial = remember(dateField) { runCatching { dateFormat.parse(target.text.toString())?.time }.getOrNull() }
        val date = rememberDatePickerState(initialSelectedDateMillis = initial)
        DatePickerDialog(onDismissRequest = { dateField = "" },
            dismissButton = { TextButton(onClick = { dateField = "" }) { Text("キャンセル") } },
            confirmButton = { TextButton(enabled = date.selectedDateMillis != null, onClick = {
                date.selectedDateMillis?.let { target.setText(dateFormat.format(java.util.Date(it))); target.error = null }
                dateField = ""; changed()
            }) { Text("選択") } }) { DatePicker(date) }
    }
}

private fun displayDate(value: String) = if (value.length == 8) "${value.take(4)}/${value.substring(4, 6)}/${value.takeLast(2)}" else value

@OptIn(ExperimentalLayoutApi::class)
@Composable
private fun ChoiceChips(labels: List<String>, selected: Int, enabled: Boolean, choose: (Int) -> Unit) {
    FlowRow(Modifier.padding(horizontal = 8.dp), horizontalArrangement = Arrangement.spacedBy(8.dp)) {
        labels.forEachIndexed { index, label ->
            FilterChip(selected == index, { choose(index) }, { Text(label) }, enabled = enabled)
        }
    }
}

@Composable
private fun SearchToggle(label: String, summary: String, checked: Boolean, toggle: (Boolean) -> Unit) {
    Row(Modifier.fillMaxWidth().heightIn(min = 64.dp).toggleable(checked, role = Role.Switch, onValueChange = toggle).padding(12.dp),
        verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(16.dp)) {
        Column(Modifier.weight(1f)) { Text(label, style = MaterialTheme.typography.titleMedium)
            Text(summary, style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.onSurfaceVariant) }
        Switch(checked, onCheckedChange = null)
    }
}

@Composable
private fun SearchResultCard(result: View) {
    val children = if (result is ViewGroup) (0 until result.childCount).map { result.getChildAt(it) } else listOf(result)
    val texts = children.filterIsInstance<NativeText>().filter { it !is NativeButton }.map { it.text.toString() }
    val title = texts.firstOrNull()?.lineSequence()?.firstOrNull().orEmpty()
    val description = if (texts.size > 1) texts.drop(1).joinToString("\n") else texts.firstOrNull()?.substringAfter('\n', "").orEmpty()
    val action = children.firstOrNull { it is NativeButton } ?: result
    var expanded by remember { mutableStateOf(false) }
    HaiagaruUi.Group {
        Column(Modifier.padding(12.dp), verticalArrangement = Arrangement.spacedBy(10.dp)) {
            SelectionContainer { Text(title, style = MaterialTheme.typography.titleMedium) }
            SelectionContainer { Text(description, maxLines = if (expanded) Int.MAX_VALUE else 7,
                overflow = TextOverflow.Ellipsis, style = MaterialTheme.typography.bodyMedium, color = MaterialTheme.colorScheme.onSurfaceVariant) }
            if (description.length > 200) TextButton(onClick = { expanded = !expanded }) { Text(if (expanded) "短く表示" else "全文を表示") }
            FilledTonalButton(onClick = { action.performClick() }) { Text(if (result.tag == 0) "投稿者ページを開く" else "スレを開く") }
        }
    }
}

@Composable
private fun SearchOptionsSheet(a: HissiWacchoiSearchController, prefs: SharedPreferences,
                               toggleValues: Map<String, Boolean>, changed: () -> Unit) {
    var confirm by remember { mutableIntStateOf(0) }
    var retention by rememberSaveable { mutableStateOf(false) }
    if (retention) {
        SearchRetention(a, prefs) { retention = false; changed() }
        return
    }
    LazyColumn(Modifier.fillMaxWidth(), contentPadding = PaddingValues(16.dp), verticalArrangement = Arrangement.spacedBy(12.dp)) {
        item { Text("検索の設定", style = MaterialTheme.typography.headlineSmall) }
        item { HissiTemplateSettings(prefs,a) }
        listOf(
            Triple("wacchoiBackgroundSearch", "画面を閉じても検索する", "通知から停止・検索画面への復帰ができます"),
            Triple("wacchoiSearchHistory", "検索条件と結果を保存する", "履歴から再検索・通信なしの閲覧ができます"),
            Triple("showEdgeSearch", "エッヂを検索先に表示", "Kyodemoの現行スレ・過去ログを検索します"),
            Triple("showZzzSearch", "ZZZSearchを検索先に表示", "検索条件を渡してアプリ内で開きます")
        ).forEach { (key, label, summary) -> item(key = key) {
            HaiagaruUi.Group { SearchToggle(label, summary, toggleValues.getValue(key)) {
                prefs.edit().putBoolean(key, it).apply(); SettingsEffects.changed(a, key, it); changed()
            } }
        } }
        item { TextButton(onClick = { retention = true }) { Text("履歴・キャッシュの保持件数") } }
        item { TextButton(onClick = { confirm = 1 }) { Text("保存した検索条件・結果を削除") } }
        item { TextButton(onClick = { confirm = 2 }) { Text("検索用ページキャッシュを削除") } }
        item { Text("ツールバーの表示・非表示は、HOME・板・スレの各ツールバー設定で変更できます。",
            style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.onSurfaceVariant) }
    }
    if (confirm != 0) AlertDialog(onDismissRequest = { confirm = 0 }, title = { Text(if (confirm == 1) "検索履歴を削除しますか？" else "検索キャッシュを削除しますか？") },
        text = { Text(if (confirm == 1) "保存した検索条件と結果を削除します。取得ページのキャッシュは残ります。" else "取得ページを削除します。検索履歴・保存結果は残ります。検索中は再作成される場合があります。") },
        dismissButton = { TextButton(onClick = { confirm = 0 }) { Text("キャンセル") } },
        confirmButton = { TextButton(onClick = { WacchoiHistory.clear(a, confirm == 2); confirm = 0; changed() }) { Text("削除") } })
}

@Composable
private fun SearchRetention(a: HissiWacchoiSearchController, prefs: SharedPreferences, back: () -> Unit) {
    var values by rememberSaveable { mutableStateOf(WacchoiStorageLimits.KEYS.indices.map { WacchoiStorageLimits.value(a, it).toString() }) }
    var invalid by remember { mutableIntStateOf(-1) }
    LazyColumn(Modifier.fillMaxWidth().imePadding(), contentPadding = PaddingValues(16.dp), verticalArrangement = Arrangement.spacedBy(12.dp)) {
        item { TextButton(onClick = back) { Text("検索の設定に戻る") } }
        item { Text("履歴・キャッシュの保持", style = MaterialTheme.typography.headlineSmall) }
        item { Text("0は無制限です。大きな値は保存容量を増やします。上限を下げると次回保存時に古いデータから整理され、削除された結果は戻せません。",
            style = MaterialTheme.typography.bodyMedium, color = MaterialTheme.colorScheme.onSurfaceVariant) }
        items(WacchoiStorageLimits.KEYS.size) { index ->
            OutlinedTextField(values[index], { text -> values = values.toMutableList().also { it[index] = text }; if (invalid == index) invalid = -1 },
                label = { Text(WacchoiStorageLimits.LABELS[index]) }, modifier = Modifier.fillMaxWidth(), singleLine = true,
                isError = invalid == index, keyboardOptions = androidx.compose.foundation.text.KeyboardOptions(keyboardType = androidx.compose.ui.text.input.KeyboardType.Number),
                supportingText = if (invalid == index) ({ Text("0以上の整数を入力してください") }) else null)
        }
        item { Button(onClick = {
            val parsed = values.map { it.trim().toLongOrNull()?.takeIf { number -> number >= 0 } }
            invalid = parsed.indexOfFirst { it == null }
            if (invalid < 0) {
                val editor = prefs.edit()
                parsed.forEachIndexed { index, number -> editor.putLong("wacchoiLimit." + WacchoiStorageLimits.KEYS[index], number!!) }
                editor.apply(); back()
            }
        }, Modifier.fillMaxWidth()) { Text("保存") } }
    }
}
