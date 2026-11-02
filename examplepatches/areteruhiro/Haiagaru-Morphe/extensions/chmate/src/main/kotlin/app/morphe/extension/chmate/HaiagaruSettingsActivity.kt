package app.morphe.extension.chmate

import android.content.SharedPreferences
import android.os.Bundle
import android.view.MotionEvent
import androidx.activity.compose.BackHandler
import androidx.activity.compose.setContent
import androidx.compose.foundation.clickable
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
        setContent { HaiagaruUi.Theme { SettingsScreen() } }
        gestures = HaiagaruSettingsGestures(this, window.decorView,
            { onBackPressedDispatcher.onBackPressed() }, { top() }, { bottom() }).also { it.setCloseAction { finish() } }
        if (savedInstanceState == null) window.decorView.post {
            PersonalNgSubmissions.offerOnSettingsOpen(this) { MinimalSetup.offer(this) }
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

    @OptIn(ExperimentalMaterial3Api::class)
    @Composable
    private fun SettingsScreen() {
        var selected by rememberSaveable { mutableIntStateOf(-1) }
        var query by rememberSaveable { mutableStateOf("") }
        val english = SettingsLanguage.text(getSharedPreferences(WacchoiSearchOptions.PREFS, 0)
            .getString("settingsLanguage", "ja"), java.util.Locale.getDefault(), "ja", "en") == "en"
        val groups = remember { settingsGroups() }
        val bodies = remember { mutableMapOf<String, android.widget.LinearLayout>() }
        fun body(key: String) = bodies.getOrPut(key) { Haiagaru.settingsCategory(this, key).also(::prepareSettingsBindings) }
        var matches by remember { mutableStateOf<List<Pair<SettingsGroup, BoundSetting>>>(emptyList()) }
        var searching by remember { mutableStateOf(false) }
        var indexedQuery by remember { mutableStateOf("") }
        // Home, search and category content have different item sets. Sharing a
        // state (and resetting it on navigation) discarded the home position.
        val homeList = rememberLazyListState()
        val searchList = rememberLazyListState()
        val categoryList = rememberLazyListState()
        val list = if (selected >= 0) categoryList else if (query.isBlank()) homeList else searchList
        val scope = rememberCoroutineScope()
        val invalidation = revision
        // Snapshot native toggle values on every preference refresh, even while the
        // asynchronous search index is being rebuilt. Keep the same controls/listeners.
        val visibleMatches = matches.map { (group, option) -> group to option.refreshed() }
        val update: () -> Unit = { revision++ }
        val back = { if (selected >= 0) selected = -1 else if (query.isNotEmpty()) query = "" else finish() }
        BackHandler { back() }
        SideEffect {
            top = { scope.launch { list.animateScrollToItem(0) }; Unit }
            bottom = { scope.launch { list.animateScrollToItem((list.layoutInfo.totalItemsCount - 1).coerceAtLeast(0)) }; Unit }
        }
        LaunchedEffect(selected) {
            // Rebuild editors on navigation, so a toggle changed in the expert
            // projection cannot leave its ordinary-category control stale.
            bodies.clear()
            if (selected >= 0) categoryList.scrollToItem(0)
            revision++
        }
        LaunchedEffect(query, invalidation) {
            if (query.isBlank()) { matches = emptyList(); searching = false; return@LaunchedEffect }
            if (query != indexedQuery) { searching = true; delay(200) }
            val found = mutableListOf<Pair<SettingsGroup, BoundSetting>>()
            for (group in groups) {
                group.sources.forEach { source -> settingsRows(body(source)).forEach {
                    val control = it.control
                    val actionable = control is android.widget.CompoundButton ||
                        control is android.widget.Button || control is android.widget.EditText ||
                        control is android.widget.Spinner || control.hasOnClickListeners()
                    if (actionable && SettingsSections.matches(it.keywords + " " + group.ja + " " + group.en, query)) found.add(group to it)
                } }
                withFrameNanos { }
            }
            matches = found; indexedQuery = query; searching = false
        }
        Scaffold(topBar = {
            if (selected < 0 && query.isBlank()) TopAppBar(expandedHeight = 48.dp, title = { Text("Haiagaru") },
                navigationIcon = { IconButton(onClick = back) { Icon(Icons.AutoMirrored.Filled.ArrowBack, if (english) "Back" else "戻る") } })
            else TopAppBar(expandedHeight = 48.dp, title = { Text(if (selected < 0) (if (english) "Find a setting" else "設定を検索") else groups[selected].title(english),
                maxLines = 1, overflow = androidx.compose.ui.text.style.TextOverflow.Ellipsis) },
                navigationIcon = { IconButton(onClick = back) { Icon(Icons.AutoMirrored.Filled.ArrowBack, if (english) "Back" else "戻る") } })
        }) { insets ->
            LazyColumn(state = list, modifier = Modifier.fillMaxSize().padding(insets).imePadding(),
                contentPadding = PaddingValues(start = 12.dp, end = 12.dp, top = 4.dp, bottom = 16.dp), verticalArrangement = Arrangement.spacedBy(8.dp)) {
                if (selected < 0) {
                    item { OutlinedTextField(query, { query = it }, placeholder = { Text(if (english) "Find a setting" else "設定を検索") },
                        leadingIcon = { Icon(Icons.Filled.Search, null) }, singleLine = true,
                        modifier = Modifier.fillMaxWidth(), shape = androidx.compose.foundation.shape.RoundedCornerShape(28.dp)) }
                    if (query.isBlank()) {
                        item {
                            SettingsHomeCard {
                                Row(Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                                    SettingsHomeAction(if (english) "Share settings" else "設定を共有", Modifier.weight(1f)) { SettingsProfiles.share(this@HaiagaruSettingsActivity) }
                                    SettingsHomeAction(if (english) "Load settings" else "設定を読み込む", Modifier.weight(1f)) { SettingsProfiles.open(this@HaiagaruSettingsActivity) }
                                }
                                Spacer(Modifier.height(6.dp))
                                SettingsHomeAction(if (english) "Choose minimal setup again" else "最低限構成を選び直す") { MinimalSetup.show(this@HaiagaruSettingsActivity) }

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
                            SettingsHomeCard(onClick = { selected = groups.indexOf(group) }, padded = false) {
                                ListItem(headlineContent = { Text(group.title(english), style = MaterialTheme.typography.titleMedium) },
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
                    } else {
                        item { Text(if (searching) (if (english) "Searching…" else "検索中…") else if (matches.isEmpty())
                            (if (english) "No settings found. Try a shorter word." else "見つかりませんでした。短い言葉で探してみてください。")
                            else if (english) "${matches.size} settings" else "${matches.size}件の設定") }
                        if (matches.isNotEmpty()) item {
                            Text(if (english) "Change settings here. Changes are saved automatically."
                                else "検索結果のスイッチでオン／オフできます。変更は自動で保存されます。",
                                style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.onSurfaceVariant)
                        }
                        items(visibleMatches, key = { (group, option) -> "${group.id}:${System.identityHashCode(option.control)}" }) {
                            (group, option) -> HaiagaruUi.Group(group.title(english)) { BoundSettingRow(option, update) }
                        }
                    }
                } else {
                    val group = groups[selected]
                    item { HaiagaruUi.Group {
                        Text(group.title(english), style = MaterialTheme.typography.titleMedium)
                        HorizontalDivider()
                        Text(if (english) group.enSummary else group.summary, color = MaterialTheme.colorScheme.onSurfaceVariant)
                    } }
                    group.sources.forEach { source ->
                        val rows = settingsRows(body(source))
                        if (group.sources.size > 1) item("heading:$source") {
                            Text(sectionTitle(source, english), style = MaterialTheme.typography.titleSmall,
                                color = MaterialTheme.colorScheme.primary, modifier = Modifier.padding(start = 12.dp, top = 8.dp))
                        }
                        items(rows, key = { "${source}:${System.identityHashCode(it.control)}" }) { option ->
                            HaiagaruUi.Group { BoundSettingRow(option, update) }
                        }
                    }
                }
                item { Spacer(Modifier.height(12.dp)) }
            }
        }
    }
}

private fun sectionTitle(source: String, english: Boolean) = (when (source) {
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

/** Home-only cards; preference editors keep their existing controls and persistence. */
@Composable
private fun SettingsHomeCard(onClick: (() -> Unit)? = null, padded: Boolean = true,
    content: @Composable ColumnScope.() -> Unit) {
    Surface(modifier = Modifier.fillMaxWidth().then(if (onClick != null) Modifier.clickable(onClick = onClick) else Modifier),
        shape = RoundedCornerShape(12.dp), color = MaterialTheme.colorScheme.surface,
        border = BorderStroke(0.5.dp, MaterialTheme.colorScheme.outlineVariant.copy(alpha = .3f)),
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
