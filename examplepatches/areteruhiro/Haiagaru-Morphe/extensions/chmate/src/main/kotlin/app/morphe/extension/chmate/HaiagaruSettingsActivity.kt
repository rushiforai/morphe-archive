package app.morphe.extension.chmate

import android.content.SharedPreferences
import android.os.Bundle
import android.view.MotionEvent
import android.view.ViewGroup
import androidx.activity.compose.BackHandler
import androidx.compose.ui.platform.ComposeView
import androidx.compose.foundation.clickable
import androidx.compose.foundation.combinedClickable
import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.KeyboardArrowRight
import androidx.compose.material.icons.filled.Search
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.compositeOver
import androidx.compose.ui.graphics.luminance
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.text.style.TextOverflow
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

class HaiagaruSettingsActivity : HaiagaruComposeActivity() {
    private var revision by mutableIntStateOf(0)
    private val preferences = mutableListOf<SharedPreferences>()
    private val listener = SharedPreferences.OnSharedPreferenceChangeListener { _, _ -> revision++ }
    private var gestures: HaiagaruSettingsGestures? = null
    private var top: () -> Unit = {}
    private var bottom: () -> Unit = {}

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        listOf(WacchoiSearchOptions.PREFS, "haiagaru_response_actions", ToolbarIcons.PREFS).forEach {
            preferences.add(getSharedPreferences(it, 0))
        }
        preferences.add(android.preference.PreferenceManager.getDefaultSharedPreferences(this))
        preferences.forEach { it.registerOnSharedPreferenceChangeListener(listener) }
        // Set match-parent before attaching or composing. activity-compose creates
        // a wrap-content root, which API 26 measures as 0x0 on the first pass.
        val content = ComposeView(this).apply {
            layoutParams = android.widget.FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT)
            setContent { HaiagaruUi.Theme { SettingsScreen() } }
        }
        setContentView(content)
        gestures = HaiagaruSettingsGestures(this, window.decorView,
            { onBackPressedDispatcher.onBackPressed() }, { top() }, { bottom() }).also { it.setCloseAction { finish() } }
        if (savedInstanceState == null) window.decorView.post {
            SettingsBackupIntroduction.offer(this) {
                SettingsSupport.offer(this) { MinimalSetup.offer(this) }
            }
        }
    }

    @Deprecated("Activity result compatibility")
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: android.content.Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == SettingsProfiles.OPEN && resultCode == RESULT_OK && data?.data != null)
            startActivity(android.content.Intent(this, SettingsImportActivity::class.java).setData(data.data)
                .addFlags(android.content.Intent.FLAG_GRANT_READ_URI_PERMISSION))
    }

    override fun onResume() {
        super.onResume()
        Haiagaru.onSettingsResume(this)
        val light = resources.configuration.uiMode and android.content.res.Configuration.UI_MODE_NIGHT_MASK !=
            android.content.res.Configuration.UI_MODE_NIGHT_YES
        if (android.os.Build.VERSION.SDK_INT >= 30) {
            val mask = android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS or
                android.view.WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS
            window.insetsController?.setSystemBarsAppearance(if (light) mask else 0, mask)
        } else {
            @Suppress("DEPRECATION")
            var flags = window.decorView.systemUiVisibility
            if (android.os.Build.VERSION.SDK_INT >= 23) flags = if (light)
                flags or android.view.View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR
                else flags and android.view.View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR.inv()
            if (android.os.Build.VERSION.SDK_INT >= 26) flags = if (light)
                flags or android.view.View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR
                else flags and android.view.View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR.inv()
            @Suppress("DEPRECATION")
            window.decorView.systemUiVisibility = flags
        }
        revision++
    }
    override fun onDestroy() {
        gestures?.close()
        preferences.forEach { it.unregisterOnSharedPreferenceChangeListener(listener) }
        Haiagaru.settingsClosed()
        super.onDestroy()
    }

    override fun dispatchTouchEvent(event: MotionEvent): Boolean {
        val router = gestures
        if (router != null) {
            val intercepted = router.isIntercepted
            if (router.dispatch(event)) {
                if (!intercepted && router.isIntercepted) MotionEvent.obtain(event).also {
                    it.action = MotionEvent.ACTION_CANCEL; super.dispatchTouchEvent(it); it.recycle()
                }
                return true
            }
        }
        return super.dispatchTouchEvent(event)
    }

    @OptIn(ExperimentalMaterial3Api::class, ExperimentalFoundationApi::class)
    @Composable
    private fun SettingsScreen() {
        var focusLabel by rememberSaveable { mutableStateOf(intent.getStringExtra("haiagaru.settings.highlight").orEmpty()) }
        var selected by rememberSaveable { mutableIntStateOf(settingsGroups().indexOfFirst {
            intent.getStringExtra("haiagaru.settings.category") in it.sources }) }
        var query by rememberSaveable { mutableStateOf(intent.getStringExtra("haiagaru.settings.search").orEmpty().take(160)) }
        var categoryQuery by rememberSaveable { mutableStateOf("") }
        val searchQuery = if (selected >= 0) categoryQuery else query
        val english = SettingsLanguage.text(getSharedPreferences(WacchoiSearchOptions.PREFS, 0)
            .getString("settingsLanguage", "ja"), java.util.Locale.getDefault(), "ja", "en") == "en"
        val groups = remember { settingsGroups() }
        // Lazy content can be measured after Back has changed the mutable index.
        // Capture the category object for this composition instead of indexing later.
        val currentCategory = groups.getOrNull(selected)
        val bodies = remember { mutableMapOf<String, android.widget.LinearLayout>() }
        fun body(key: String) = bodies.getOrPut(key) { Haiagaru.settingsCategory(this, key).also(::prepareSettingsBindings) }
        var matches by remember { mutableStateOf<List<Pair<SettingsGroup, BoundSetting>>>(emptyList()) }
        var searching by remember { mutableStateOf(false) }
        var indexedQuery by remember { mutableStateOf("") }
        var indexedScope by remember { mutableIntStateOf(-2) }
        // Home, search and category content have different item sets. Sharing a
        // state (and resetting it on navigation) discarded the home position.
        val homeList = rememberLazyListState()
        val searchList = rememberLazyListState()
        val categoryList = rememberLazyListState()
        val categorySearchList = rememberLazyListState()
        val list = if (selected >= 0) { if (categoryQuery.isBlank()) categoryList else categorySearchList }
            else if (query.isBlank()) homeList else searchList
        val scope = rememberCoroutineScope()
        val invalidation = revision
        // The backing Views are detached from Compose. Resnapshot their visibility
        // when settings change so the lazy list receives a new set of rows.
        val categoryRows = remember(currentCategory, searchQuery.isBlank(), invalidation) {
            if (searchQuery.isBlank()) currentCategory?.sources.orEmpty().map { source ->
                source to settingsRows(body(source))
            } else emptyList()
        }
        fun containsLabel(row: BoundSetting): Boolean = row.label == focusLabel ||
            row.children.orEmpty().any { containsLabel(it) }
        LaunchedEffect(selected, categoryRows, focusLabel) {
            if (focusLabel.isBlank() || selected < 0 || categoryRows.isEmpty()) return@LaunchedEffect
            var position = 1
            for ((source, rows) in categoryRows) {
                if (currentCategory!!.sources.size > 1) position++
                val index = rows.indexOfFirst { containsLabel(it) }
                if (index >= 0) { categoryList.animateScrollToItem(position + index); break }
                position += rows.size
            }
        }
        // Snapshot native toggle values on every preference refresh, even while the
        // asynchronous search index is being rebuilt. Keep the same controls/listeners.
        val visibleMatches = if (indexedScope == selected) matches.map { (group, option) -> group to option.refreshed() } else emptyList()
        val update: () -> Unit = { revision++ }
        var copying by remember { mutableStateOf(false) }
        val copyAction: @Composable () -> Unit = {
            TextButton(enabled = !copying, onClick = {
                val chosen = currentCategory?.let { listOf(it) } ?: groups
                copying = true
                scope.launch {
                    try {
                        val text = StringBuilder("Haiagaru設定")
                        for (group in chosen) {
                            text.append("\n").append(group.title(english))
                            for (source in group.sources) {
                                text.append("\n").append(SettingsCopy.hierarchy(sectionTitle(source, english), body(source)))
                                withFrameNanos { }
                            }
                        }
                        SettingsCopy.copy(this@HaiagaruSettingsActivity, text.toString())
                    } finally { copying = false }
                }
            }) { Text(if (copying) "コピー中…" else "階層をコピー") }
        }
        val back = {
            if (selected >= 0 && categoryQuery.isNotEmpty()) categoryQuery = ""
            else if (selected >= 0) selected = -1
            else if (query.isNotEmpty()) query = "" else finish()
        }
        BackHandler { back() }
        SideEffect {
            top = { scope.launch { list.animateScrollToItem(0) }; Unit }
            bottom = { scope.launch { list.animateScrollToItem((list.layoutInfo.totalItemsCount - 1).coerceAtLeast(0)) }; Unit }
        }
        LaunchedEffect(selected) {
            // Rebuild editors on navigation, so a toggle changed in the expert
            // projection cannot leave its ordinary-category control stale.
            bodies.clear()
            if (selected >= 0 && focusLabel.isBlank()) {
                categoryList.scrollToItem(0); categorySearchList.scrollToItem(0)
            }
            revision++
        }
        LaunchedEffect(searchQuery, selected, invalidation) {
            if (searchQuery.isBlank()) { matches = emptyList(); searching = false; return@LaunchedEffect }
            if (searchQuery != indexedQuery || selected != indexedScope) { searching = true; delay(200) }
            val found = mutableListOf<Pair<SettingsGroup, BoundSetting>>()
            val searchGroups = currentCategory?.let { listOf(it) } ?: groups
            for (group in searchGroups) {
                group.sources.forEach { source -> flattenedSettingsRows(body(source)).forEach {
                    val control = it.control
                    val actionable = control is android.widget.CompoundButton ||
                        control is android.widget.Button || control is android.widget.EditText ||
                        control is android.widget.Spinner || control.hasOnClickListeners()
                    if (actionable && SettingsSections.matches(it.keywords + " " + group.ja + " " + group.en, searchQuery)) found.add(group to it.copy(
                        searchTrail = listOf(sectionTitle(source, english), it.searchTrail).filter { part -> part.isNotBlank() }.joinToString(" > ")))
                } }
                withFrameNanos { }
            }
            matches = found; indexedQuery = searchQuery; indexedScope = selected; searching = false
        }
        Scaffold(topBar = {
            if (selected < 0 && query.isBlank()) TopAppBar(expandedHeight = 64.dp, title = {
                Column {
                    Text("Haiagaru", maxLines = 1)
                    Text("Patch ${BuildConfig.HAIAGARU_VERSION}", style = MaterialTheme.typography.labelSmall, maxLines = 1)
                }
            },
                actions = { copyAction() },
                navigationIcon = { IconButton(onClick = back) { Icon(Icons.AutoMirrored.Filled.ArrowBack, if (english) "Back" else "戻る") } })
            else TopAppBar(expandedHeight = 64.dp, title = {
                Column {
                    Text(if (selected < 0) (if (english) "Find a setting" else "設定を検索") else currentCategory?.title(english).orEmpty(),
                        maxLines = 1, overflow = androidx.compose.ui.text.style.TextOverflow.Ellipsis)
                    Text("Patch ${BuildConfig.HAIAGARU_VERSION}", style = MaterialTheme.typography.labelSmall, maxLines = 1)
                }
            },
                actions = { copyAction() },
                navigationIcon = { IconButton(onClick = back) { Icon(Icons.AutoMirrored.Filled.ArrowBack, if (english) "Back" else "戻る") } })
        }) { insets ->
            LazyColumn(state = list, modifier = Modifier.fillMaxSize().padding(insets).imePadding(),
                contentPadding = PaddingValues(start = 12.dp, end = 12.dp, top = if (selected < 0) 4.dp else 12.dp, bottom = 16.dp), verticalArrangement = Arrangement.spacedBy(8.dp)) {
                item { SettingsSearchField(searchQuery, {
                    if (selected >= 0) categoryQuery = it.take(160) else query = it.take(160)
                }, if (selected >= 0) (if (english) "Search this category" else "このカテゴリ内を検索")
                    else if (english) "Find a setting" else "設定を検索") }
                if (selected < 0 && query.isBlank()) {
                        item {
                            SettingsFrame {
                                SettingsHomeAction(if (english) "Haiagaru update history" else "Haiagaru更新履歴") {
                                    UpdateHistory.show(this@HaiagaruSettingsActivity)
                                }
                            }
                        }
                        item {
                            SettingsFrame {
                                Row(Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                                    SettingsHomeAction(if (english) "Share settings" else "設定を共有", Modifier.weight(1f)) { SettingsProfiles.share(this@HaiagaruSettingsActivity) }
                                    SettingsHomeAction(if (english) "Load settings" else "設定を読み込む", Modifier.weight(1f)) { SettingsProfiles.open(this@HaiagaruSettingsActivity) }
                                }
                                Spacer(Modifier.height(6.dp))
                                SettingsHomeAction(if (english) "Choose minimal setup again" else "最低限構成を選び直す") { MinimalSetup.choose(this@HaiagaruSettingsActivity) }

                            }
                        }
                        item { Text(if (english) "Share display and behavior settings as a .haiagaru file. Authentication, history, NG rules and native toolbar settings are excluded."
                            else ".haiagaru形式で表示・動作設定を共有します。認証情報、履歴、NG登録、標準ツールバー設定は含めません。",
                            style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = .75f),
                            modifier = Modifier.padding(horizontal = 8.dp, vertical = 2.dp)) }
                        item { Text(if (english) "Saved automatically. Choose what you want to change." else "変更は自動で保存されます。変えたいことから選べます。",
                            style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.onSurfaceVariant,
                            modifier = Modifier.padding(horizontal = 8.dp, vertical = 2.dp)) }
                        items(groups, key = { it.id }) { group ->
                            SettingsFrame(onClick = {
                                categoryQuery = ""
                                selected = groups.indexOf(group)
                            }, padded = false) {
                                ListItem(headlineContent = { Text(group.title(english), style = MaterialTheme.typography.titleMedium, fontSize = 17.sp,
                                    color = HaiagaruUi.settingsCategoryColor) },
                                    supportingContent = { Text(if (english) group.enSummary else group.summary, fontSize = 12.sp, maxLines = 1, overflow = TextOverflow.Ellipsis) },
                                    leadingContent = { Box(Modifier.size(36.dp), contentAlignment = Alignment.Center) {
                                        SettingsCategoryIcon(group.id, group.mark)
                                    } },
                                    trailingContent = { Icon(Icons.AutoMirrored.Filled.KeyboardArrowRight, null) },
                                    colors = ListItemDefaults.colors(containerColor = MaterialTheme.colorScheme.surface),
                                    modifier = Modifier.heightIn(min = 64.dp))
                            }
                        }
                        item { Text(if (english) "Toolbar buttons: change visibility in ChMate's toolbar editor. Search options are on the search screen."
                            else "ツールバーの表示はChMateのツールバー設定で。検索のオン／オフや履歴保存は検索画面で変更できます。",
                            style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.onSurfaceVariant,
                            modifier = Modifier.padding(8.dp)) }
                        item {
                            SettingsFrame(onClick = { startActivity(SettingsSupport.intent(this@HaiagaruSettingsActivity)) }) {
                                Text(if (english) "Support board" else "サポート板", style = MaterialTheme.typography.titleMedium)
                                Text("ChMate用Morpheパッチ「Haiagaru」", style = MaterialTheme.typography.bodyMedium)
                                Text(SettingsSupport.URL, color = MaterialTheme.colorScheme.primary,
                                    style = MaterialTheme.typography.bodySmall)
                            }
                        }
                } else if (searchQuery.isNotBlank()) {
                        item { Text(if (searching || indexedScope != selected) (if (english) "Searching…" else "検索中…") else if (visibleMatches.isEmpty())
                            (if (english) "No settings found. Try a shorter word." else "見つかりませんでした。短い言葉で探してみてください。")
                            else if (english) "${visibleMatches.size} settings" else "${visibleMatches.size}件の設定") }
                        if (visibleMatches.isNotEmpty()) item {
                            Text(if (english) "Change settings here. Changes are saved automatically."
                                else "検索結果のスイッチでオン／オフできます。長押しすると設定一覧を開き、該当項目が青く点滅します。",
                                style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.onSurfaceVariant)
                        }
                        items(visibleMatches, key = { (group, option) -> "${group.id}:${System.identityHashCode(option.control)}" }) {
                            (group, option) -> Box(Modifier.combinedClickable(onClick = {}, onLongClick = {
                                focusLabel = option.label
                                selected = groups.indexOf(group)
                                categoryQuery = ""
                            })) { SettingsFrame(padded = false) {
                                Text(group.title(english), style = MaterialTheme.typography.titleSmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant, modifier = Modifier.padding(start = 12.dp, top = 10.dp))
                                SettingCopyScope(listOf("Haiagaru設定", group.title(english))) {
                                    BoundSettingRow(option, update)
                                }
                            } }
                        }
                } else if (currentCategory != null) {
                    val group = currentCategory
                    categoryRows.forEachIndexed { index, (source, rows) ->
                        if (group.sources.size > 1) item("heading:$source") {
                            Text(sectionTitle(source, english), style = MaterialTheme.typography.titleSmall, fontSize = 15.sp,
                                color = HaiagaruUi.settingsCategoryColor,
                                modifier = Modifier.padding(start = 12.dp, top = if (index == 0) 0.dp else 8.dp))
                        }
                        items(rows, key = { "${source}:${System.identityHashCode(it.control)}" }) { option ->
                            SettingsFrame(padded = false) {
                                SettingCopyScope(listOf("Haiagaru設定", group.title(english), sectionTitle(source, english))) {
                                    CompositionLocalProvider(LocalSettingHighlight provides focusLabel) {
                                        BoundSettingRow(option, update)
                                    }
                                }
                            }
                        }
                    }
                }
                item { Spacer(Modifier.height(12.dp)) }
            }
        }
    }
}

internal fun sectionTitle(source: String, english: Boolean) = (when (source) {
    "DISPLAY" -> "画面と操作" to "Display and controls"
    "SOCIAL" -> "リンクカード・Xのプレビュー" to "Link cards and X previews"
    "POSTING" -> "入力と送信" to "Editor and sending"
    "UPLOAD" -> "画像・動画の投稿" to "Media uploads"
    "CHECKER" -> "IDチェッカー" to "ID checker"
    "ARCHIVE" -> "過去ログと保存レス" to "Old threads and saved posts"
    "GENERAL" -> "基本設定" to "Basics"
    else -> "通信・外部板" to "Network and external boards"
}).let { if (english) it.second else it.first }

private data class SettingsGroup(val id: String, val ja: String, val en: String, val summary: String,
    val enSummary: String, val mark: String, val sources: List<String>) {
    fun title(english: Boolean) = if (english) en else ja
}

private fun settingsGroups() = listOf(
    SettingsGroup("reading", "スレッド", "Reading", "画面・文字・コピー・リンクカード", "Layout, text, copying and link cards", "Aa", listOf("DISPLAY", "SOCIAL")),
    SettingsGroup("search", "探す・過去ログ", "Find posts and old threads", "IDチェッカー・DAT取得・保存したレス", "ID checker, DAT retrieval and saved posts", "↗", listOf("CHECKER", "ARCHIVE")),
    SettingsGroup("posting", "書き込む", "Posting", "入力・送信・画像や動画のアップロード", "Editor, sending and media uploads", "✎", listOf("POSTING", "UPLOAD")),
    SettingsGroup("media", "画像・動画", "Images and video", "再生・サムネイル・保存・キャッシュ", "Playback, thumbnails, downloads and cache", "▷", listOf("MEDIA")),
    SettingsGroup("ng", "NG・ミュート", "NG and muting", "見たくない投稿・ID・名前を隠す", "Hide unwanted posts, IDs and names", "−", listOf("NG")),
    SettingsGroup("history", "履歴・コピーした記事", "History and copied text", "閲覧・書き込みの履歴と保存件数", "Browsing, posting and retention", "↶", listOf("HISTORY")),
    SettingsGroup("backup", "バックアップ・機種変更", "Backup and transfer", "ローカル保存・復元・MEGA同期・データ移行", "Local backups, restore, MEGA sync and transfer", "↓", listOf("BACKUP")),
    SettingsGroup("system", "アプリ・通信", "App and network", "言語・広告・接続・外部板の認証", "Language, ads, connections and board sign-in", "⚙", listOf("GENERAL", "ADVANCED")),
    SettingsGroup("expert", "エキスパート設定", "Expert settings", "個別の動作を細かく切り替える", "Control additional behaviors individually", "⚙", listOf("EXPERT")),
)

/** The settings home, category rows and search results share the same outer frame. */
@Composable
private fun SettingsFrame(onClick: (() -> Unit)? = null, padded: Boolean = true,
    content: @Composable ColumnScope.() -> Unit) {
    val colors = MaterialTheme.colorScheme
    val dark = colors.surface.luminance() < colors.onSurface.luminance()
    val outline = if (dark) colors.onSurface.copy(alpha = .42f).compositeOver(colors.surface)
        else colors.outlineVariant.copy(alpha = .3f)
    Surface(modifier = Modifier.fillMaxWidth().then(if (onClick != null) Modifier.clickable(onClick = onClick) else Modifier),
        shape = RoundedCornerShape(12.dp), color = colors.surface,
        border = BorderStroke(if (dark) 1.dp else 0.5.dp, outline),
        shadowElevation = 0.dp) {
        Column(if (padded) Modifier.padding(horizontal = 12.dp, vertical = 10.dp) else Modifier, content = content)
    }
}

@Composable
private fun SettingsHomeAction(title: String, modifier: Modifier = Modifier, onClick: () -> Unit) {
    OutlinedButton(onClick = onClick, modifier = modifier.fillMaxWidth().heightIn(min = 48.dp),
        shape = RoundedCornerShape(8.dp), contentPadding = PaddingValues(horizontal = 14.dp, vertical = 10.dp)) {
        Text(title, style = MaterialTheme.typography.bodyMedium, modifier = Modifier.weight(1f))
        Icon(Icons.AutoMirrored.Filled.KeyboardArrowRight, null, modifier = Modifier.size(18.dp))
    }
}

@Composable
private fun SettingsCategoryIcon(id: String, mark: String) {
    if (id == "reading") {
        Text("Aa", style = MaterialTheme.typography.titleLarge)
    } else {
        // Vector paths avoid platform-dependent emoji and remain crisp at any density.
        val color = MaterialTheme.colorScheme.onSurface
        androidx.compose.foundation.Canvas(Modifier.size(30.dp)) {
            val scale = size.width / 24f
            fun path(points: List<Pair<Float, Float>>, close: Boolean = false) {
                val p = androidx.compose.ui.graphics.Path()
                points.forEachIndexed { i, v -> if (i == 0) p.moveTo(v.first * scale, v.second * scale) else p.lineTo(v.first * scale, v.second * scale) }
                if (close) p.close()
                drawPath(p, color, style = androidx.compose.ui.graphics.drawscope.Stroke(1.5f * scale,
                    cap = androidx.compose.ui.graphics.StrokeCap.Round, join = androidx.compose.ui.graphics.StrokeJoin.Round))
            }
            when (id) {
                "search" -> { path(listOf(5f to 19f, 19f to 5f)); path(listOf(7f to 5f, 19f to 5f, 19f to 17f)) }
                "posting" -> { path(listOf(3f to 21f, 5f to 14f, 17f to 2f, 22f to 7f, 10f to 19f), true); path(listOf(14f to 5f, 19f to 10f)) }
                "media" -> path(listOf(6f to 2f, 21f to 12f, 6f to 22f), true)
                "ng" -> path(listOf(3f to 12f, 21f to 12f))
                "backup" -> { path(listOf(12f to 2f, 12f to 21f)); path(listOf(6f to 15f, 12f to 21f, 18f to 15f)) }
                "history" -> {
                    drawArc(color, -135f, 300f, false, androidx.compose.ui.geometry.Offset(3f * scale, 3f * scale),
                        androidx.compose.ui.geometry.Size(18f * scale, 18f * scale), style = androidx.compose.ui.graphics.drawscope.Stroke(1.5f * scale))
                    path(listOf(2f to 2f, 2f to 8f, 8f to 8f)); path(listOf(12f to 6f, 12f to 12f, 16f to 15f))
                }
                else -> {
                    val points = (0 until 48).map { i ->
                        val a = i * Math.PI / 24 - Math.PI / 2
                        val r = if (i % 6 in 1..3) 10.0 else 8.0
                        (12 + kotlin.math.cos(a) * r).toFloat() to (12 + kotlin.math.sin(a) * r).toFloat()
                    }
                    path(points, true)
                    drawCircle(color, 3f * scale, style = androidx.compose.ui.graphics.drawscope.Stroke(1.5f * scale))
                }
            }
        }
    }
}
