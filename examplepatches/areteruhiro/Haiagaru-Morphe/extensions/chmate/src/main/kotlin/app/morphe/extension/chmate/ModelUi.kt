package app.morphe.extension.chmate

import android.view.View
import android.view.ViewGroup
import android.widget.*
import androidx.activity.compose.BackHandler
import androidx.activity.compose.LocalOnBackPressedDispatcherOwner
import androidx.compose.foundation.combinedClickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.*
import androidx.compose.material3.pulltorefresh.PullToRefreshBox
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.drawBehind
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.platform.LocalView
import androidx.compose.ui.unit.Density
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.viewinterop.AndroidView
import kotlinx.coroutines.delay
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.gestures.detectHorizontalDragGestures
import androidx.compose.foundation.gestures.detectVerticalDragGestures
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.semantics.*

/** Only archive-search controls opt in; settings and result rows retain their spacing. */
internal val LocalArchiveControlLayout = staticCompositionLocalOf { 100 }

/** Keep the actions in their own scrollable viewport; the grip resizes that viewport. */
@OptIn(ExperimentalLayoutApi::class, androidx.compose.foundation.ExperimentalFoundationApi::class)
@Composable private fun CheckerToolbar(view: LinearLayout, revision: Int, modifier: Modifier, changed: () -> Unit) {
    val providers = view.getTag(CheckerBarOptions.PROVIDERS_TAG) == true
    ResizableCheckerBar(view, if (providers) CheckerBarOptions.PROVIDERS else CheckerBarOptions.ACTIONS, 32,
        if (providers) "検索先切替バーの高さ" else "操作バーの高さ", modifier, changed) { height ->
        val scroll = rememberScrollState()
        CompositionLocalProvider(LocalMinimumInteractiveComponentSize provides 0.dp) {
            FlowRow(Modifier.fillMaxWidth().height(height.dp).verticalScroll(scroll),
                horizontalArrangement = Arrangement.spacedBy(4.dp)) {
                for (index in 0 until view.childCount) {
                    val button = view.getChildAt(index) as? Button ?: continue
                    if (button.visibility != View.VISIBLE) continue
                    Box(Modifier.height(height.coerceAtMost(32f).dp).combinedClickable(
                        enabled = button.isEnabled, role = Role.Button,
                        onClick = { button.performClick(); changed() },
                        onLongClick = if (button.isLongClickable) ({ button.performLongClick(); changed() }) else null
                    ).padding(horizontal = 8.dp), contentAlignment = Alignment.Center) {
                        Text(button.text.toString(), fontSize = 13.sp, maxLines = 1,
                            color = MaterialTheme.colorScheme.primary.copy(alpha = if (button.isEnabled) 1f else .38f))
                    }
                }
            }
        }
    }
}

@Composable private fun ResizableCheckerBar(view: View, key: String, fallback: Int, label: String,
    modifier: Modifier = Modifier, changed: () -> Unit, content: @Composable (Float) -> Unit) {
    val prefs = remember(view) { view.context.getSharedPreferences(WacchoiSearchOptions.PREFS, 0) }
    var height by remember(view, key) { mutableFloatStateOf(CheckerBarOptions.height(view.context, key, fallback).toFloat()) }
    var handles by remember(view) { mutableStateOf(prefs.getBoolean(CheckerBarOptions.HANDLES, true)) }
    var dragging by remember(view) { mutableStateOf(false) }
    val density = LocalDensity.current.density
    DisposableEffect(prefs, key) {
        val listener = android.content.SharedPreferences.OnSharedPreferenceChangeListener { _, changedKey ->
            if (changedKey == key && !dragging) height = CheckerBarOptions.height(view.context, key, fallback).toFloat()
            if (changedKey == CheckerBarOptions.HANDLES) handles = prefs.getBoolean(CheckerBarOptions.HANDLES, true)
        }
        prefs.registerOnSharedPreferenceChangeListener(listener)
        onDispose { prefs.unregisterOnSharedPreferenceChangeListener(listener) }
    }
    fun save(value: Float) {
        val bounded = value.toInt().coerceIn(20, 80)
        height = bounded.toFloat()
        CheckerBarOptions.save(view.context, key, bounded)
        if (key == CheckerBarOptions.ACTIONS) view.setTag(HissiMenuController.TOOLBAR_HEIGHT_TAG, bounded)
        changed()
    }
    Column(modifier.fillMaxWidth()) {
        content(height)
        if (!handles) return@Column
        val color = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = .6f)
        Box(Modifier.fillMaxWidth().height(20.dp).semantics {
            contentDescription = label
            stateDescription = "${height.toInt()}dp。上下にドラッグして調整"
            progressBarRangeInfo = ProgressBarRangeInfo(height, 20f..80f, 59)
            setProgress { save(it); true }
        }.pointerInput(view, key, density) {
            var start = height
            var delta = 0f
            detectVerticalDragGestures(
                onDragStart = { dragging = true; start = height; delta = 0f },
                onDragEnd = { dragging = false; save(height) },
                onDragCancel = { dragging = false; height = CheckerBarOptions.height(view.context, key, fallback).toFloat() },
                onVerticalDrag = { event, amount ->
                    event.consume(); delta += amount / density; height = (start + delta).coerceIn(20f, 80f)
                })
        }, contentAlignment = Alignment.Center) {
            HorizontalDivider(Modifier.width(30.dp), thickness = 3.dp, color = color)
        }
    }
}

/** Observe legacy controllers without attaching their form widgets or replacing listeners. */
@Composable internal fun rememberModelRevision(vararg roots: View?): Int {
    var revision by remember(*roots) { mutableIntStateOf(0) }
    val lifecycle = androidx.lifecycle.compose.LocalLifecycleOwner.current.lifecycle
    LaunchedEffect(*roots) {
        var previous = Long.MIN_VALUE
        while (true) {
            if (!lifecycle.currentState.isAtLeast(androidx.lifecycle.Lifecycle.State.STARTED)) { delay(200); continue }
            val value = roots.fold(7L) { hash, root -> hash * 31 + modelFingerprint(root) }
            if (value != previous) { previous = value; revision++ }
            delay(200)
        }
    }
    return revision
}

private fun modelFingerprint(view: View?): Long {
    if (view == null) return 0L
    var value = System.identityHashCode(view).toLong()
    value = value * 31 + System.identityHashCode(view.getTag(0x48690b03))
    value = value * 31 + (view.getTag(HissiMenuController.TOOLBAR_HEIGHT_TAG)?.hashCode() ?: 0)
    value = value * 31 + (view.getTag(HissiMenuController.RESULT_TABS_TAG)?.hashCode() ?: 0)
    value = value * 31 + (view.getTag(EddiArchiveSearchUi.CONTROL_SCALE_TAG)?.hashCode() ?: 0)
    value = value * 31 + (view.getTag(EddiArchiveSearchUi.RESULT_SCALE_TAG)?.hashCode() ?: 0)
    value = value * 31 + (view.getTag(EddiArchiveSearchUi.REFRESH_ENABLED_TAG)?.hashCode() ?: 0)
    value = value * 31 + (view.getTag(EddiArchiveSearchUi.SEARCH_BUSY_TAG)?.hashCode() ?: 0)
    value = value * 31 + view.visibility + if (view.isEnabled) 1 else 0
    when (view) {
        is TextView -> value = value * 31 + view.text.hashCode() + (view.error?.hashCode() ?: 0)
        is ImageView -> value = value * 31 + System.identityHashCode(view.drawable)
        is ProgressBar -> value = value * 31 + view.progress
    }
    if (view is CompoundButton) value = value * 31 + if (view.isChecked) 1 else 0
    if (view is AdapterView<*>) {
        value = value * 31 + System.identityHashCode(view.adapter) + (view.adapter?.count ?: 0)
        return value * 31 + view.selectedItemPosition
    }
    if (view is NativeSurfaceSlot) return value
    if (view is ViewGroup) for (index in 0 until view.childCount) value = value * 31 + modelFingerprint(view.getChildAt(index))
    return value
}

/** Only WebView and platform playback/canvas content use View interop. */
internal class NativeSurfaceSlot(val surface: View) : View(surface.context)

internal fun weightedSurface(root: View?): Int? = if (root is LinearLayout)
    (0 until root.childCount).firstOrNull {
        val child = root.getChildAt(it)
        child is NativeSurfaceSlot && child.visibility == View.VISIBLE &&
            (child.layoutParams as? LinearLayout.LayoutParams)?.weight?.let { weight -> weight > 0 } == true
    } else null

/** Bounded browser plus independently scrolling controls, also used by web dialogs. */
@Composable internal fun BrowserModel(root: LinearLayout, revision: Int, modifier: Modifier, changed: () -> Unit) {
    val index = weightedSurface(root) ?: return
    BoxWithConstraints(modifier) {
        val percent = if (root.getTag(HissiMenuController.CHECKER_LAYOUT_TAG) == true || root.context is HissiMenuActivity)
            root.context.getSharedPreferences(WacchoiSearchOptions.PREFS, 0).getInt("checkerHeaderPercent", 20).coerceIn(10, 60) else 20
        val controlsHeight = maxHeight * (percent / 100f)
        Column(Modifier.fillMaxSize()) {
            if (index > 0) Column(Modifier.fillMaxWidth().heightIn(max = controlsHeight)
                .verticalScroll(rememberScrollState())) {
                for (i in 0 until index) ModelContent(root.getChildAt(i), revision, insideScroll = true, changed = changed)
            }
            ModelContent(root.getChildAt(index), revision, Modifier.weight(1f), changed = changed)
            if (index + 1 < root.childCount) Column(Modifier.fillMaxWidth().heightIn(max = controlsHeight)
                .verticalScroll(rememberScrollState())) {
                for (i in index + 1 until root.childCount) ModelContent(root.getChildAt(i), revision, insideScroll = true, changed = changed)
            }
        }
    }
}

internal fun prepareNativeSurfaces(root: ViewGroup) {
    for (index in 0 until root.childCount) {
        val child = root.getChildAt(index)
        if (child is NativeSurfaceSlot) continue
        val browserFrame = child is FrameLayout && ((0 until child.childCount).any { child.getChildAt(it) is android.webkit.WebView } || (child.layoutParams as? LinearLayout.LayoutParams)?.weight?.let { it > 0 } == true)
        if (child is android.webkit.WebView || child is VideoView || browserFrame ||
            child.javaClass.name.endsWith("GifViewerActivity\$GifCanvas")) {
            val params = child.layoutParams
            root.removeViewAt(index)
            root.addView(NativeSurfaceSlot(child).apply { visibility = child.visibility }, index, params)
        } else if (child is ViewGroup) prepareNativeSurfaces(child)
    }
}

@OptIn(androidx.compose.foundation.ExperimentalFoundationApi::class, ExperimentalLayoutApi::class)
@Composable internal fun ModelContent(view: View, revision: Int = 0, modifier: Modifier = Modifier,
    insideScroll: Boolean = false, changed: () -> Unit = {}) {
    if (view.visibility != View.VISIBLE) return
    if (view is LinearLayout && (view.getTag(HissiMenuController.TOOLBAR_HEIGHT_TAG) is Int || view.getTag(CheckerBarOptions.PROVIDERS_TAG) == true)) {
        CheckerToolbar(view, revision, modifier, changed)
        return
    }
    if (view is ViewGroup && view.getTag(EddiArchiveSearchUi.RESULT_CARD_TAG) == true) {
        val ruleColor = MaterialTheme.colorScheme.outline.copy(alpha = .70f)
        val first = view.getTag(EddiArchiveSearchUi.RESULT_FIRST_TAG) == true
        val padding = EddiArchiveSearchUi.clampResultPadding(view.getTag(EddiArchiveSearchUi.RESULT_PADDING_TAG) as? Int ?: 16)
        Box(modifier.fillMaxWidth().heightIn(min = 48.dp).combinedClickable(
            enabled = view.isEnabled, onClick = { view.performClick(); changed() }) .drawBehind {
            val stroke = 1.dp.toPx()
            if (first) drawLine(ruleColor, Offset(0f, stroke / 2), Offset(size.width, stroke / 2), stroke)
            drawLine(ruleColor, Offset(0f, size.height - stroke / 2), Offset(size.width, size.height - stroke / 2), stroke)
        }.padding(horizontal = 12.dp, vertical = padding.dp)) {
            Column(verticalArrangement = Arrangement.spacedBy(4.dp)) {
                for (index in 0 until view.childCount) {
                    val text = view.getChildAt(index) as? TextView ?: continue
                    Text(text.text.toString(), fontSize = if (index == 0) 16.sp else 12.sp,
                        color = if (index == 0) MaterialTheme.colorScheme.onSurface else MaterialTheme.colorScheme.onSurfaceVariant)
                }
            }
        }
        return
    }
    when (view) {
        is NativeSurfaceSlot -> AndroidView(factory = { view.surface },
            modifier = if (view.layoutParams?.width == 1 && view.layoutParams?.height == 1) Modifier.size(1.dp)
                else if ((view.layoutParams as? LinearLayout.LayoutParams)?.weight?.let { it > 0 } == true)
                    modifier.fillMaxSize()
                else modifier.fillMaxWidth().height(420.dp))
        is ListView -> {
            val adapter = view.adapter ?: return
            DisposableEffect(adapter) {
                val observer = object : android.database.DataSetObserver() {
                    override fun onChanged() { changed() }
                    override fun onInvalidated() { changed() }
                }
                adapter.registerDataSetObserver(observer)
                onDispose { adapter.unregisterDataSetObserver(observer) }
            }
            androidx.compose.foundation.lazy.LazyColumn(Modifier.fillMaxWidth().heightIn(max = 480.dp),
                verticalArrangement = Arrangement.spacedBy(4.dp)) {
                items(adapter.count) { index ->
                    val row = adapter.getView(index, null, view)
                    val label = adapter.getItem(index)?.toString().orEmpty()
                    val selectable = adapter.isEnabled(index) && view.isEnabled
                    Surface(shape = MaterialTheme.shapes.medium, color = MaterialTheme.colorScheme.surfaceContainerLow,
                        border = androidx.compose.foundation.BorderStroke(1.dp, MaterialTheme.colorScheme.outline),
                        modifier = Modifier.fillMaxWidth().combinedClickable(enabled = selectable,
                            onClick = {
                                if (view.choiceMode != ListView.CHOICE_MODE_NONE)
                                    view.setItemChecked(index, if (view.choiceMode == ListView.CHOICE_MODE_SINGLE) true else !view.isItemChecked(index))
                                view.performItemClick(row, index, adapter.getItemId(index)); changed()
                            },
                            onLongClick = { view.onItemLongClickListener?.onItemLongClick(view, row, index, adapter.getItemId(index)); changed() })) {
                        Column(Modifier.padding(12.dp)) {
                            if (view.choiceMode != ListView.CHOICE_MODE_NONE) Checkbox(view.isItemChecked(index), onCheckedChange = null)
                            if (row is TextView) Text(row.text.toString(), style = MaterialTheme.typography.bodyMedium)
                            else ModelContent(row, revision, changed = changed)
                            if (row !is TextView && row !is ViewGroup && label.isNotBlank()) Text(label)
                        }
                    }
                }
            }
        }
        is SeekBar -> {
            Slider(value = view.progress.toFloat().coerceIn(0f, view.max.coerceAtLeast(1).toFloat()),
                onValueChange = { value -> view.progress = value.toInt(); changed() },
                valueRange = 0f..view.max.coerceAtLeast(1).toFloat(), enabled = view.isEnabled)
        }
        is CompoundButton -> {
            var checked by remember(view) { mutableStateOf(view.isChecked) }
            Row(modifier.fillMaxWidth().heightIn(min = 48.dp), verticalAlignment = Alignment.CenterVertically) {
                Checkbox(checked = checked, onCheckedChange = { value ->
                    checked = value
                    view.isChecked = value
                    changed()
                }, enabled = view.isEnabled)
                Text(view.text?.toString().orEmpty(), Modifier.weight(1f),
                    style = MaterialTheme.typography.bodyMedium,
                    color = if (view.isEnabled) MaterialTheme.colorScheme.onSurface else MaterialTheme.colorScheme.onSurface.copy(alpha = .38f))
            }
        }
        is ProgressBar -> {
            if (view.isIndeterminate) LinearProgressIndicator(Modifier.fillMaxWidth())
            else LinearProgressIndicator(progress = { view.progress.toFloat() / view.max.coerceAtLeast(1) }, modifier = Modifier.fillMaxWidth())
        }
        is Spinner, is TextView, is ImageView -> {
            val label = if (view is EditText) view.hint?.toString().orEmpty()
                else if (view is TextView) view.text.toString() else view.contentDescription?.toString().orEmpty()
            BoundSettingRow(BoundSetting(view, label), changed)
        }
        is LinearLayout -> if (view.orientation == LinearLayout.HORIZONTAL &&
            (0 until view.childCount).all { (view.getChildAt(it) is Button && view.getChildAt(it) !is CompoundButton) || view.getChildAt(it).javaClass == View::class.java }) {
            val resultTab = view.getTag(HissiMenuController.RESULT_TABS_TAG) as? Int
            if (resultTab != null) {
                val buttons = (0 until view.childCount).mapNotNull { view.getChildAt(it) as? Button }
                if (buttons.isNotEmpty()) {
                    ResizableCheckerBar(view, CheckerBarOptions.TABS, 40, "レス・スレ・名前バーの高さ", changed = changed) { height ->
                        CompositionLocalProvider(LocalMinimumInteractiveComponentSize provides 0.dp) {
                            TabRow(selectedTabIndex = resultTab.coerceIn(buttons.indices),
                                modifier = Modifier.height(height.dp),
                                containerColor = MaterialTheme.colorScheme.surface,
                                contentColor = MaterialTheme.colorScheme.primary) {
                                buttons.forEachIndexed { index, button ->
                                    Tab(selected = index == resultTab, enabled = button.isEnabled,
                                        modifier = Modifier.height(height.dp),
                                        onClick = { button.performClick(); changed() }) {
                                        Text(button.text.toString(), fontSize = 13.sp, maxLines = 1)
                                    }
                                }
                            }
                        }
                    }
                }
                return
            }
            val scale = LocalArchiveControlLayout.current
            val compact = scale < 100
            val toolbarHeight = (view.getTag(HissiMenuController.TOOLBAR_HEIGHT_TAG) as? Int)?.coerceIn(32, 56)
            val effectiveHeight = toolbarHeight?.let { maxOf(it.toFloat(), 20f * LocalDensity.current.fontScale + 8f).dp }
            CompositionLocalProvider(LocalMinimumInteractiveComponentSize provides (if (toolbarHeight != null) 0.dp else LocalMinimumInteractiveComponentSize.current)) {
            FlowRow(Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.spacedBy((8f * scale / 100f).dp)) {
                for (index in 0 until view.childCount) {
                    val button = view.getChildAt(index) as? Button ?: continue
                    if (button.visibility == View.VISIBLE) {
                        val release = button.getTag(0x48690b01) as? Runnable
                        if (release == null) TextButton(onClick = { button.performClick(); changed() }, enabled = button.isEnabled,
                            contentPadding = if (toolbarHeight != null) PaddingValues(horizontal = 8.dp) else if (compact) PaddingValues(horizontal = (8f + (scale - 50) * .16f).dp, vertical = ((scale - 50) * .16f).dp) else ButtonDefaults.TextButtonContentPadding,
                            modifier = if (effectiveHeight != null) Modifier.height(effectiveHeight) else Modifier.heightIn(min = 48.dp)) { Text(button.text.toString()) }
                        else Text(button.text.toString(), style = MaterialTheme.typography.labelLarge,
                            modifier = Modifier.padding(12.dp).pointerInput(button) {
                                detectTapGestures(onTap = { if (button.isEnabled) { button.performClick(); changed() } },
                                    onLongPress = { if (button.isEnabled) { button.performLongClick(); changed() } },
                                    onPress = { try { awaitRelease() } finally { release.run(); changed() } })
                            })
                    }
                }
            }
            }
        } else ModelChildren(view, revision, insideScroll, changed)
        is ScrollView -> {
            if (insideScroll) {
                ModelChildren(view, revision, true, changed)
                return
            }
            val scroll = rememberScrollState()
            var horizontal by remember(view) { mutableFloatStateOf(0f) }
            @Suppress("UNCHECKED_CAST")
            val swipe = view.getTag(0x48690b02) as? java.util.function.Consumer<Boolean>
            val gestures = if (swipe == null) Modifier else Modifier.pointerInput(view) {
                detectHorizontalDragGestures(
                    onDragStart = { horizontal = 0f },
                    onDragEnd = { if (kotlin.math.abs(horizontal) > 96.dp.toPx()) swipe.accept(horizontal > 0) },
                    onDragCancel = { horizontal = 0f },
                    onHorizontalDrag = { _, amount -> horizontal += amount })
            }
            val request = view.getTag(0x48690b03) as? HaiagaruUi.ScrollRequest
            LaunchedEffect(view, request) { if (request != null) scroll.scrollTo(request.position) }
            LaunchedEffect(view) { snapshotFlow { scroll.value }.collect { view.setTag(0x48690b04, it) } }
            Column(modifier.fillMaxWidth().heightIn(max = 600.dp).then(gestures).verticalScroll(scroll)) {
                ModelChildren(view, revision, true, changed)
            }
        }
        is ViewGroup -> ModelChildren(view, revision, insideScroll, changed)
    }
}

@OptIn(androidx.compose.foundation.ExperimentalFoundationApi::class)
@Composable private fun ModelChildren(view: ViewGroup, revision: Int, insideScroll: Boolean = false, changed: () -> Unit) {
    // Result cards use a listener on their LinearLayout, not on the title TextView.
    val click = if (!view.hasOnClickListeners()) Modifier else Modifier.combinedClickable(
        enabled = view.isEnabled, onClick = { view.performClick(); changed() },
        onLongClick = { view.performLongClick(); changed() })
    val resultList = view.childCount > 0 && (0 until view.childCount).all {
        view.getChildAt(it).getTag(EddiArchiveSearchUi.RESULT_CARD_TAG) == true
    }
    val gap = if (resultList) 0f else 8f * LocalArchiveControlLayout.current / 100f
    Column(Modifier.fillMaxWidth().then(click), verticalArrangement = Arrangement.spacedBy(gap.dp)) {
            // Pair explanatory labels with editable fields while retaining composite controls and lists.
            var index = 0
            while (index < view.childCount) {
                val child = view.getChildAt(index++)
                val next = view.getChildAt(index)
                if (child is TextView && child !is Button && child !is EditText && !child.hasOnClickListeners() &&
                    (next is EditText || next is Spinner) && child.visibility == View.VISIBLE) {
                    index++
                    if (next.visibility == View.VISIBLE)
                        BoundSettingRow(labeledSetting(next, child.text.toString()), changed)
                } else ModelContent(child, revision, insideScroll = insideScroll, changed = changed)
            }
    }
}

/** Bounded result viewport: do not nest it in ModelScreen's scrolling form. */
@OptIn(ExperimentalMaterial3Api::class)
@Composable internal fun ArchiveSearchScreen(activity: android.app.Activity, root: LinearLayout,
    back: () -> Unit = { activity.finish() },
    showTopBar: Boolean = true, embedded: Boolean = false) {
    var localRevision by remember(root) { mutableIntStateOf(0) }
    val revision = rememberModelRevision(root) + localRevision
    val changed = { localRevision++; Unit }
    val appearance = (root.getChildAt(0) as LinearLayout).getChildAt(1) as Button
    val searchVisibility = (root.getChildAt(0) as LinearLayout).getChildAt(2) as Button
    val form = root.getChildAt(1) as LinearLayout
    val density = LocalDensity.current
    val controlScale = EddiArchiveSearchUi.clampTextScale(root.getTag(EddiArchiveSearchUi.CONTROL_SCALE_TAG) as? Int ?: 100)
    val resultScale = EddiArchiveSearchUi.clampTextScale(root.getTag(EddiArchiveSearchUi.RESULT_SCALE_TAG) as? Int ?: 100)
    val layoutScale = EddiArchiveSearchUi.clampControlLayout(root.getTag(EddiArchiveSearchUi.CONTROL_LAYOUT_TAG) as? Int ?: 100)
    val controlsDensity = Density(density.density, density.fontScale * controlScale / 100f)
    val resultsDensity = Density(density.density, density.fontScale * resultScale / 100f)
    if (!embedded && LocalOnBackPressedDispatcherOwner.current != null) {
        BackHandler(enabled = LocalView.current.isShown) { back() }
    }
    Scaffold(contentWindowInsets = if (embedded) WindowInsets(0.dp) else ScaffoldDefaults.contentWindowInsets,
        topBar = { if (showTopBar) CompositionLocalProvider(LocalDensity provides controlsDensity) { TopAppBar(
        windowInsets = if (embedded) WindowInsets(0.dp) else TopAppBarDefaults.windowInsets,
        title = { Text("エッヂ過去ログ検索", fontSize = 18.sp, maxLines = 1,
            overflow = androidx.compose.ui.text.style.TextOverflow.Ellipsis) }, navigationIcon = {
        TextButton(onClick = back) { Text("戻る") }
    }, actions = {
        TextButton(onClick = { searchVisibility.performClick(); changed() },
            modifier = Modifier.semantics { contentDescription = searchVisibility.text.toString() }) { Text("検索折/開") }
        TextButton(onClick = { appearance.performClick(); changed() }) { Text(appearance.text.toString()) }
    }) } }) { insets ->
        BoxWithConstraints(Modifier.fillMaxSize().padding(insets).imePadding().padding(horizontal = 16.dp)) {
            val formHeight = maxHeight * if (embedded) .30f else .40f
            Column(Modifier.fillMaxSize(), verticalArrangement = Arrangement.spacedBy((8f * layoutScale / 100f).dp)) {
                CompositionLocalProvider(LocalDensity provides controlsDensity, LocalArchiveControlLayout provides layoutScale) {
                if (form.visibility == View.VISIBLE) {
                Column(Modifier.fillMaxWidth().heightIn(max = formHeight).verticalScroll(rememberScrollState())) {
                    for (index in 0 until form.childCount) {
                        // This form already owns vertical scrolling. Flatten the
                        // model's advanced-options ScrollView so focus relocation
                        // cannot make two nested scrollers fight on every keystroke.
                        ModelContent(form.getChildAt(index), revision, insideScroll = true, changed = changed)
                    }
                }
                }
                Text((root.getChildAt(2) as TextView).text.toString(),
                    style = MaterialTheme.typography.bodySmall, maxLines = 2,
                    overflow = androidx.compose.ui.text.style.TextOverflow.Ellipsis)
                }
                CompositionLocalProvider(LocalDensity provides resultsDensity) {
                    val refresh = root.getTag(EddiArchiveSearchUi.REFRESH_ACTION_TAG) as? Runnable
                    val refreshEnabled = refresh != null && root.getTag(EddiArchiveSearchUi.REFRESH_ENABLED_TAG) == true
                    if (refreshEnabled) {
                        PullToRefreshBox(
                            isRefreshing = root.getTag(EddiArchiveSearchUi.SEARCH_BUSY_TAG) == true,
                            onRefresh = { refresh?.run(); changed() }, modifier = Modifier.weight(1f).fillMaxWidth()
                        ) {
                            ModelContent(root.getChildAt(3), revision, Modifier.fillMaxSize(), changed = changed)
                        }
                    } else ModelContent(root.getChildAt(3), revision, Modifier.weight(1f), changed = changed)
                }
                CompositionLocalProvider(LocalDensity provides controlsDensity) {
                ModelContent(root.getChildAt(4), revision, changed = changed)
                val original = root.getChildAt(5) as Button
                TextButton(onClick = { original.performClick(); changed() }) {
                    Text(original.text.toString(), maxLines = 1)
                }
                }
            }
        }
    }
}

/** Compose shell for controller-built tools, including asynchronous status and list changes. */
@OptIn(ExperimentalMaterial3Api::class)
@Composable internal fun ModelScreen(activity: android.app.Activity, title: String, root: View,
    back: () -> Unit = { @Suppress("DEPRECATION") activity.onBackPressed() }, showTopBar: Boolean = true,
    embedded: Boolean = false) {
    var localRevision by remember(root) { mutableIntStateOf(0) }
    val revision = rememberModelRevision(root) + localRevision
    if (root is ViewGroup) prepareNativeSurfaces(root)
    @Suppress("UNUSED_VARIABLE") val observed = revision
    Scaffold(contentWindowInsets = if (embedded) WindowInsets(0.dp) else ScaffoldDefaults.contentWindowInsets,
        topBar = { if (showTopBar) TopAppBar(title = { Text(title) }, navigationIcon = {
        TextButton(onClick = back) { Text("戻る") }
    }) }) { insets ->
        val surfaceIndex = if (root is LinearLayout) (0 until root.childCount).firstOrNull {
            val child = root.getChildAt(it)
            child is NativeSurfaceSlot && (child.layoutParams as? LinearLayout.LayoutParams)?.weight?.let { weight -> weight > 0 } == true
        } else null
        if (root is LinearLayout && surfaceIndex != null) {
            // A WebView owns its vertical scrolling. Never measure it inside verticalScroll.
            BoxWithConstraints(Modifier.fillMaxSize().padding(insets).imePadding()) {
                val checker = root.getTag(HissiMenuController.CHECKER_LAYOUT_TAG) == true
                val percent = if (checker) root.context.getSharedPreferences(WacchoiSearchOptions.PREFS, 0)
                    .getInt("checkerHeaderPercent", 20).coerceIn(10, 60) else if (activity is ExternalBoardAuthActivity) 55 else 25
                val controlsHeight = maxHeight * (percent / 100f)
                Column(Modifier.fillMaxSize()) {
                    if (surfaceIndex > 0) Column(Modifier.fillMaxWidth().heightIn(max = controlsHeight)
                        .verticalScroll(rememberScrollState()).padding(horizontal = 12.dp)) {
                        for (index in 0 until surfaceIndex) ModelContent(root.getChildAt(index), revision, insideScroll = true) { localRevision++ }
                    }
                    ModelContent(root.getChildAt(surfaceIndex), revision, Modifier.weight(1f)) { localRevision++ }
                    if (surfaceIndex + 1 < root.childCount) Column(Modifier.fillMaxWidth().heightIn(max = controlsHeight)
                        .verticalScroll(rememberScrollState())) {
                        for (index in surfaceIndex + 1 until root.childCount) ModelContent(root.getChildAt(index), revision, insideScroll = true) { localRevision++ }
                    }
                }
            }
        } else {
        Column(Modifier.fillMaxSize().padding(insets).imePadding().verticalScroll(rememberScrollState())
            .padding(16.dp), verticalArrangement = Arrangement.spacedBy(12.dp)) {
            HaiagaruUi.Group { ModelContent(root, revision) { localRevision++ } }
        }
        }
    }
}
