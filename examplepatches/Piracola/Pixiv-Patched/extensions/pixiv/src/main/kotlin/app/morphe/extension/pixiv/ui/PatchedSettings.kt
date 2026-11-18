package app.morphe.extension.pixiv.ui

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.content.res.Configuration
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Typeface
import android.graphics.drawable.GradientDrawable
import android.text.InputFilter
import android.text.InputType
import android.util.TypedValue
import android.view.Gravity
import android.view.View
import android.view.inputmethod.InputMethodManager
import android.widget.EditText
import android.widget.FrameLayout
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.ScrollView
import android.widget.TextView
import android.widget.Toast
import app.morphe.extension.pixiv.aiflag.AiFilterSettingsView
import app.morphe.extension.pixiv.history.HistoryStore
import app.morphe.extension.pixiv.search.BookmarkThreshold
import app.morphe.extension.pixiv.search.SearchRankingConfig
import java.net.HttpURLConnection
import java.net.URL
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import java.util.concurrent.Executors

/**
 * The Pixiv-Patched page, reached from the Pixiv-Patched item in the home drawer. It shows the state
 * of every patch, a shortcut to the AI work settings and the browsing history kept on this device.
 */
object PatchedSettings {

    private const val DETAIL_ACTIVITY = "jp.pxv.android.feature.routing.intentfilter.IntentFilterActivity"

    private const val ILLUST_DETAIL_ACTIVITY =
        "jp.pxv.android.feature.illustviewer.detail.IllustDetailSingleActivity"

    private const val NOVEL_DETAIL_ACTIVITY =
        "jp.pxv.android.feature.novelviewer.noveltext.NovelTextActivity"

    private val timeFormat = SimpleDateFormat("MM-dd HH:mm", Locale.getDefault())
    private val imagePool = Executors.newFixedThreadPool(3)
    private val imageCache = object : LinkedHashMap<String, Bitmap>(32, 0.75f, true) {
        override fun removeEldestEntry(eldest: MutableMap.MutableEntry<String, Bitmap>?) = size > 96
    }

    private class Palette(context: Context) {
        val dark = (context.resources.configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK) ==
            Configuration.UI_MODE_NIGHT_YES
        val background = if (dark) 0xFF121212.toInt() else 0xFFF5F5F7.toInt()
        val card = if (dark) 0xFF1E1E1E.toInt() else 0xFFFFFFFF.toInt()
        val primary = if (dark) 0xFFEEEEEE.toInt() else 0xFF1F2937.toInt()
        val secondary = if (dark) 0xFF9E9E9E.toInt() else 0xFF6B7280.toInt()
        val divider = if (dark) 0xFF2D2D2D.toInt() else 0xFFE5E7EB.toInt()
        val accent = 0xFF0096FA.toInt()
    }

    @JvmStatic
    fun show(host: View?) {
        PageHost.open(host) { activity ->
            SearchRankingConfig.ensureLoaded()
            BookmarkThreshold.ensureLoaded()
            buildRootPage(activity, Palette(activity))
        }
    }

    /**
     * The first page of the stack: the toolbar and the settings, status and history sections. The
     * sections are rebuilt in place after a change, so the page itself never has to be replaced.
     */
    private fun buildRootPage(context: Context, palette: Palette): View {
        val root = LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            setBackgroundColor(palette.background)
            layoutParams = FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT,
                FrameLayout.LayoutParams.MATCH_PARENT
            )
        }
        root.addView(buildToolbar(context, palette) { PageHost.close() })

        val contentHolder = LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            layoutParams = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                0,
                1f
            )
        }
        fun render() {
            contentHolder.removeAllViews()
            contentHolder.addView(buildContent(context, palette) { render() })
        }
        render()
        root.addView(contentHolder)
        return root
    }

    private fun buildToolbar(
        context: Context,
        palette: Palette,
        title: String = Strings.pageTitle,
        onBack: () -> Unit
    ): View =
        LinearLayout(context).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            setBackgroundColor(palette.card)
            val horizontal = dp(context, 16f)
            setPadding(horizontal, 0, horizontal, 0)
            layoutParams = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                dp(context, 56f)
            )
            addView(
                TextView(context).apply {
                    text = "←"
                    textSize = 24f
                    setTextColor(palette.primary)
                    setPadding(0, 0, dp(context, 14f), 0)
                    setOnClickListener { onBack() }
                }
            )
            addView(
                TextView(context).apply {
                    text = title
                    textSize = 18f
                    typeface = Typeface.DEFAULT_BOLD
                    setTextColor(palette.primary)
                }
            )
        }

    private fun buildContent(context: Context, palette: Palette, onClear: () -> Unit): View {
        val column = LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(dp(context, 16f), dp(context, 8f), dp(context, 16f), dp(context, 24f))
        }

        column.addView(sectionHeader(context, Strings.settingsSection, palette))
        column.addView(
            card(context, palette).apply {
                addView(entryRow(context, palette, Strings.aiSettingsEntry, Strings.aiSettingsHint))
                addView(divider(context, palette))
                addView(searchRankingRow(context, palette, onClear))
                addView(divider(context, palette))
                addView(
                    settingsRow(
                        context,
                        palette,
                        Strings.bookmarkThreshold,
                        Strings.bookmarkThresholdHint,
                        label = { bookmarkThresholdLabel() },
                        onEdited = onClear
                    ) { picked ->
                        showBookmarkThresholdPicker(context, palette) { floor ->
                            BookmarkThreshold.setFloor(context, floor)
                            picked()
                        }
                    }
                )
                addView(divider(context, palette))
                addView(
                    settingsRow(
                        context,
                        palette,
                        Strings.relativeThreshold,
                        Strings.relativeThresholdHint,
                        label = { relativeThresholdLabel() },
                        onEdited = onClear
                    ) { picked ->
                        showRelativeThresholdPicker(context, palette) { percent ->
                            if (percent == null) {
                                BookmarkThreshold.clearPercentile(context)
                            } else {
                                BookmarkThreshold.setPercentile(context, percent)
                            }
                            picked()
                        }
                    }
                )
                addView(divider(context, palette))
                addView(
                    settingsRow(
                        context,
                        palette,
                        Strings.fillBudget,
                        Strings.fillBudgetHint,
                        label = { Strings.fillBudgetValue(BookmarkThreshold.fillBudgetMs) },
                        onEdited = onClear
                    ) { picked ->
                        showFillBudgetPicker(context, palette) { milliseconds ->
                            BookmarkThreshold.setFillBudget(context, milliseconds)
                            picked()
                        }
                    }
                )
            }
        )

        column.addView(sectionHeader(context, Strings.statusSection, palette))
        column.addView(
            card(context, palette).apply {
                addView(statusRow(context, palette, Strings.premium, Strings.enabled))
                addView(divider(context, palette))
                addView(statusRow(context, palette, Strings.adblock, Strings.enabled))
                addView(divider(context, palette))
                addView(statusRow(context, palette, Strings.aiFlag, Strings.enabled))
                addView(divider(context, palette))
                addView(
                    statusRow(
                        context,
                        palette,
                        Strings.historyCount,
                        "${HistoryStore.count(context)} ${Strings.countSuffix}"
                    )
                )
            }
        )

        column.addView(sectionHeader(context, Strings.historySection, palette))
        val entries = HistoryStore.entries(context)
        if (entries.isEmpty()) {
            column.addView(
                TextView(context).apply {
                    text = Strings.historyEmpty
                    textSize = 13f
                    setTextColor(palette.secondary)
                    setPadding(dp(context, 4f), dp(context, 4f), dp(context, 4f), dp(context, 12f))
                }
            )
        } else {
            val historyCard = card(context, palette)
            entries.forEachIndexed { index, entry ->
                if (index > 0) historyCard.addView(divider(context, palette))
                historyCard.addView(historyRow(context, palette, entry))
            }
            column.addView(historyCard)
        }

        column.addView(
            TextView(context).apply {
                text = Strings.clearHistory
                textSize = 14f
                gravity = Gravity.CENTER
                setTextColor(palette.accent)
                setPadding(0, dp(context, 16f), 0, dp(context, 16f))
                setOnClickListener {
                    HistoryStore.clear(context)
                    Toast.makeText(context, Strings.historyCleared, Toast.LENGTH_SHORT).show()
                    onClear()
                }
            }
        )

        return ScrollView(context).apply {
            setBackgroundColor(palette.background)
            addView(column)
        }
    }

    @JvmStatic
    fun setupHistory(activity: Activity) {
        try {
            val palette = Palette(activity)
            val root = LinearLayout(activity).apply {
                orientation = LinearLayout.VERTICAL
                setBackgroundColor(palette.background)
            }
            root.addView(buildToolbar(activity, palette, Strings.historySection) { activity.finish() })
            val holder = LinearLayout(activity).apply {
                orientation = LinearLayout.VERTICAL
                layoutParams = LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    0,
                    1f
                )
            }
            var tab = HistoryStore.KIND_ILLUST
            fun render() {
                holder.removeAllViews()
                holder.addView(buildTabs(activity, palette, tab) { next ->
                    tab = next
                    render()
                })
                holder.addView(buildHistoryList(activity, palette, tab) { render() })
            }
            render()
            root.addView(holder)
            activity.setContentView(root)
        } catch (t: Throwable) {
            Toast.makeText(activity, "${Strings.pageTitle}: ${t.message}", Toast.LENGTH_SHORT).show()
        }
    }

    private fun buildTabs(
        context: Context,
        palette: Palette,
        selected: String,
        onSelect: (String) -> Unit
    ): View {
        val row = LinearLayout(context).apply {
            orientation = LinearLayout.HORIZONTAL
            setBackgroundColor(palette.card)
            layoutParams = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                dp(context, 48f)
            )
        }
        listOf(
            HistoryStore.KIND_ILLUST to Strings.historyIllustTab,
            HistoryStore.KIND_NOVEL to Strings.historyNovelTab
        ).forEach { (kind, label) ->
            val active = kind == selected
            row.addView(
                LinearLayout(context).apply {
                    orientation = LinearLayout.VERTICAL
                    gravity = Gravity.CENTER
                    layoutParams = LinearLayout.LayoutParams(
                        0,
                        LinearLayout.LayoutParams.MATCH_PARENT,
                        1f
                    )
                    setOnClickListener { onSelect(kind) }
                    addView(
                        TextView(context).apply {
                            text = label
                            textSize = 15f
                            gravity = Gravity.CENTER
                            layoutParams = LinearLayout.LayoutParams(
                                LinearLayout.LayoutParams.MATCH_PARENT,
                                LinearLayout.LayoutParams.WRAP_CONTENT
                            )
                            setTextColor(if (active) palette.primary else palette.secondary)
                            if (active) typeface = Typeface.DEFAULT_BOLD
                        }
                    )
                    addView(
                        View(context).apply {
                            setBackgroundColor(if (active) palette.accent else 0x00000000)
                            layoutParams = LinearLayout.LayoutParams(
                                dp(context, 28f),
                                dp(context, 3f)
                            ).also { it.topMargin = dp(context, 6f) }
                        }
                    )
                }
            )
        }
        return row
    }

    private fun buildHistoryList(
        context: Context,
        palette: Palette,
        kind: String,
        onCleared: () -> Unit
    ): View {
        val column = LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(dp(context, 16f), dp(context, 8f), dp(context, 16f), dp(context, 24f))
        }
        val entries = HistoryStore.entries(context).filter { it.kind == kind }
        if (entries.isEmpty()) {
            column.addView(
                TextView(context).apply {
                    text = if (kind == HistoryStore.KIND_NOVEL) Strings.historyEmptyNovel
                    else Strings.historyEmptyIllust
                    textSize = 13f
                    setTextColor(palette.secondary)
                    setPadding(dp(context, 4f), dp(context, 8f), dp(context, 4f), dp(context, 12f))
                }
            )
        } else {
            val historyCard = card(context, palette)
            entries.forEachIndexed { index, entry ->
                if (index > 0) historyCard.addView(divider(context, palette))
                historyCard.addView(historyRow(context, palette, entry, showKind = false))
            }
            column.addView(historyCard)
            column.addView(
                TextView(context).apply {
                    text = Strings.clearHistory
                    textSize = 14f
                    gravity = Gravity.CENTER
                    setTextColor(palette.accent)
                    setPadding(0, dp(context, 16f), 0, dp(context, 16f))
                    setOnClickListener {
                        HistoryStore.clearKind(context, kind)
                        Toast.makeText(context, Strings.historyCleared, Toast.LENGTH_SHORT).show()
                        onCleared()
                    }
                }
            )
        }
        return ScrollView(context).apply {
            setBackgroundColor(palette.background)
            addView(column)
        }
    }

    private fun sectionHeader(context: Context, title: String, palette: Palette): TextView =
        TextView(context).apply {
            text = title
            textSize = 12f
            typeface = Typeface.DEFAULT_BOLD
            setTextColor(palette.accent)
            setPadding(dp(context, 4f), dp(context, 16f), dp(context, 4f), dp(context, 8f))
        }

    private fun card(context: Context, palette: Palette): LinearLayout =
        LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            background = GradientDrawable().apply {
                shape = GradientDrawable.RECTANGLE
                setColor(palette.card)
                cornerRadius = dp(context, 10f).toFloat()
            }
            // The rows and the dividers between them are square, so they are clipped to the radius.
            clipToOutline = true
            setPadding(0, dp(context, 4f), 0, dp(context, 4f))
            layoutParams = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
            )
        }

    private fun divider(context: Context, palette: Palette): View =
        View(context).apply {
            setBackgroundColor(palette.divider)
            layoutParams = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                Math.max(1, dp(context, 0.5f))
            )
        }

    private fun statusRow(context: Context, palette: Palette, title: String, value: String): View =
        LinearLayout(context).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            setPadding(dp(context, 16f), dp(context, 14f), dp(context, 16f), dp(context, 14f))
            addView(
                TextView(context).apply {
                    text = title
                    textSize = 15f
                    setTextColor(palette.primary)
                    layoutParams = LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f)
                }
            )
            addView(
                TextView(context).apply {
                    text = value
                    textSize = 14f
                    setTextColor(palette.accent)
                }
            )
        }

    private fun entryRow(context: Context, palette: Palette, title: String, hint: String): View =
        LinearLayout(context).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            setPadding(dp(context, 16f), dp(context, 14f), dp(context, 16f), dp(context, 14f))
            setOnClickListener { openAiSettings(context as Activity) }
            addView(
                LinearLayout(context).apply {
                    orientation = LinearLayout.VERTICAL
                    layoutParams = LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f)
                    addView(
                        TextView(context).apply {
                            text = title
                            textSize = 15f
                            setTextColor(palette.primary)
                        }
                    )
                    addView(
                        TextView(context).apply {
                            text = hint
                            textSize = 11f
                            setTextColor(palette.secondary)
                            setPadding(0, dp(context, 2f), 0, 0)
                        }
                    )
                }
            )
            addView(
                TextView(context).apply {
                    text = "›"
                    textSize = 22f
                    setTextColor(palette.secondary)
                    setPadding(dp(context, 8f), 0, 0, 0)
                }
            )
        }

    private fun searchRankingRow(
        context: Context,
        palette: Palette,
        onChanged: () -> Unit
    ): View =
        LinearLayout(context).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            setPadding(dp(context, 16f), dp(context, 14f), dp(context, 16f), dp(context, 14f))
            setOnClickListener {
                SearchRankingConfig.setMode(
                    context,
                    SearchRankingConfig.next(SearchRankingConfig.current)
                )
                onChanged()
            }
            addView(
                LinearLayout(context).apply {
                    orientation = LinearLayout.VERTICAL
                    layoutParams = LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f)
                    addView(
                        TextView(context).apply {
                            text = Strings.searchRanking
                            textSize = 15f
                            setTextColor(palette.primary)
                        }
                    )
                    addView(
                        TextView(context).apply {
                            text = Strings.searchRankingHint
                            textSize = 11f
                            setTextColor(palette.secondary)
                            setPadding(0, dp(context, 2f), 0, 0)
                        }
                    )
                }
            )
            addView(
                TextView(context).apply {
                    text = Strings.searchRankingMode(SearchRankingConfig.current)
                    textSize = 14f
                    setTextColor(palette.accent)
                    setPadding(dp(context, 8f), 0, 0, 0)
                }
            )
        }

    private fun floorLabel(floor: Int): String =
        if (floor > 0) Strings.bookmarkThresholdValue(floor) else Strings.off

    private fun bookmarkThresholdLabel(): String {
        return floorLabel(BookmarkThreshold.current)
    }

    /**
     * What the share currently resolves to on the search the user is on. That resolved count only
     * appears while the search it was read off is still held: a number with nothing behind it would
     * read as a measurement.
     */
    private fun relativeThresholdLabel(): String {
        if (BookmarkThreshold.mode != BookmarkThreshold.MODE_PERCENTILE) return Strings.off
        val percent = BookmarkThreshold.percentile
        val preview = BookmarkThreshold.resolvedFloorPreview()
        return if (preview == null) {
            Strings.bookmarkThresholdPercentLabel(percent)
        } else {
            Strings.bookmarkThresholdPercentEstimate(percent, preview)
        }
    }

    /** The title over its hint, the left half every settings row is built from. */
    private fun settingsLabel(
        context: Context,
        palette: Palette,
        title: String,
        hint: String
    ): View =
        LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            layoutParams = LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f)
            addView(
                TextView(context).apply {
                    text = title
                    textSize = 15f
                    setTextColor(palette.primary)
                }
            )
            addView(
                TextView(context).apply {
                    text = hint
                    textSize = 11f
                    setTextColor(palette.secondary)
                    setPadding(0, dp(context, 2f), 0, 0)
                }
            )
        }

    /**
     * A settings row that opens a picker and shows the current choice on the right.
     *
     * The label is read once more after the picker returns, and [onEdited] rebuilds the page: a
     * choice here can turn a neighbouring row off, and that row has to say so at once.
     */
    private fun settingsRow(
        context: Context,
        palette: Palette,
        title: String,
        hint: String,
        label: () -> String,
        onEdited: () -> Unit,
        picker: (picked: () -> Unit) -> Unit
    ): View {
        val value = TextView(context).apply {
            textSize = 14f
            setTextColor(palette.accent)
            setPadding(dp(context, 8f), 0, 0, 0)
        }

        fun refresh() {
            value.text = label()
        }
        refresh()

        return LinearLayout(context).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            setPadding(dp(context, 16f), dp(context, 14f), dp(context, 16f), dp(context, 14f))
            setOnClickListener {
                picker {
                    refresh()
                    onEdited()
                }
            }
            addView(settingsLabel(context, palette, title, hint))
            addView(value)
        }
    }

    /**
     * The card every picker on this page is drawn on: the scrim, the rounded list and the height cap.
     * The rows are built into a column the caller owns, because the bookmark picker swaps its list
     * for the input form without closing the card.
     */
    private fun showPickerCard(context: Context, palette: Palette, build: (LinearLayout) -> Unit) {
        try {
            val column = LinearLayout(context).apply {
                orientation = LinearLayout.VERTICAL
                setPadding(0, dp(context, 12f), 0, dp(context, 10f))
            }
            build(column)

            val card = CappedScrollView(context).apply {
                background = GradientDrawable().apply {
                    setColor(palette.card)
                    cornerRadius = dp(context, 16f).toFloat()
                }
                // Keeps the rows from painting into the rounded corners while the list scrolls, and
                // gives the shadow the same outline as the card.
                clipToOutline = true
                elevation = dp(context, 24f).toFloat()
                // Taps that land on the card have to stay on the card, or the scrim behind it closes
                // the picker on a tap that was meant for a row's padding.
                isClickable = true
                layoutParams = FrameLayout.LayoutParams(
                    (context.resources.displayMetrics.widthPixels * 0.86f).toInt(),
                    FrameLayout.LayoutParams.WRAP_CONTENT
                )
                addView(column)
            }
            PageHost.showOverlay(card)
        } catch (_: Throwable) {
        }
    }

    private fun pickerTitle(context: Context, palette: Palette, text: String): TextView =
        TextView(context).apply {
            this.text = text
            textSize = 16f
            typeface = Typeface.DEFAULT_BOLD
            setTextColor(palette.primary)
            setPadding(dp(context, 20f), dp(context, 4f), dp(context, 20f), dp(context, 10f))
        }

    private fun pickerRow(context: Context, label: String, color: Int, onTap: () -> Unit): TextView =
        TextView(context).apply {
            text = label
            textSize = 15f
            setTextColor(color)
            setPadding(dp(context, 20f), dp(context, 12f), dp(context, 20f), dp(context, 12f))
            setOnClickListener { onTap() }
        }

    /**
     * The typed-value form all three pickers fall back to: a number field, the range it takes and the
     * save/cancel pair. The range is checked here so a value out of bounds is refused the same way
     * wherever it was typed.
     */
    private fun showNumberInput(
        context: Context,
        palette: Palette,
        column: LinearLayout,
        title: String,
        scale: String,
        initial: String,
        range: IntRange,
        onCancel: () -> Unit,
        onSave: (Int) -> Unit
    ) {
        column.removeAllViews()
        column.addView(pickerTitle(context, palette, title))
        val input = EditText(context).apply {
            inputType = InputType.TYPE_CLASS_NUMBER
            filters = arrayOf(InputFilter.LengthFilter(range.last.toString().length + 1))
            textSize = 16f
            setTextColor(palette.primary)
            setHintTextColor(palette.secondary)
            setPadding(dp(context, 20f), dp(context, 6f), dp(context, 20f), dp(context, 6f))
            setText(initial)
        }
        column.addView(input)
        column.addView(
            TextView(context).apply {
                text = scale
                textSize = 11f
                setTextColor(palette.secondary)
                setPadding(dp(context, 20f), 0, dp(context, 20f), dp(context, 10f))
            }
        )
        column.addView(
            pickerRow(context, Strings.save, palette.accent) {
                val value = input.text.toString().toIntOrNull()
                if (value == null || value !in range) {
                    Toast.makeText(
                        context,
                        Strings.numberInvalid(range.first, range.last),
                        Toast.LENGTH_SHORT
                    ).show()
                    return@pickerRow
                }
                onSave(value)
                PageHost.dismissOverlay()
            }
        )
        column.addView(pickerRow(context, Strings.cancel, palette.secondary) { onCancel() })
        input.post {
            input.requestFocus()
            // The current value is in the field already; typing should replace it, not append.
            input.selectAll()
            runCatching {
                val imm = context.getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager
                imm.showSoftInput(input, InputMethodManager.SHOW_IMPLICIT)
            }
        }
    }

    /** [onPick] receives null for the row's off, which is not a share of anything. */
    private fun showRelativeThresholdPicker(
        context: Context,
        palette: Palette,
        onPick: (Int?) -> Unit
    ) {
        val shares = BookmarkThreshold.PERCENTILES
        val chosen = if (BookmarkThreshold.mode == BookmarkThreshold.MODE_PERCENTILE) {
            BookmarkThreshold.percentile
        } else {
            null
        }
        showPickerCard(context, palette) { column ->

            // The list and the input open each other: the last row of the list is the input, and
            // cancelling the input is a way back to the list.
            lateinit var showPresets: () -> Unit

            fun showInput() {
                showNumberInput(
                    context,
                    palette,
                    column,
                    Strings.relativeThresholdCustomTitle,
                    Strings.relativeThresholdScale,
                    chosen?.toString() ?: "",
                    BookmarkThreshold.MIN_PERCENT..BookmarkThreshold.MAX_PERCENT,
                    onCancel = showPresets
                ) { percent -> onPick(percent) }
            }

            showPresets = {
                column.removeAllViews()
                column.addView(pickerTitle(context, palette, Strings.relativeThresholdTitle))
                column.addView(
                    pickerRow(context, Strings.off, if (chosen == null) palette.accent else palette.primary) {
                        onPick(null)
                        PageHost.dismissOverlay()
                    }
                )
                shares.forEach { percent ->
                    column.addView(
                        pickerRow(
                            context,
                            Strings.bookmarkThresholdPercentLabel(percent),
                            if (percent == chosen) palette.accent else palette.primary
                        ) {
                            onPick(percent)
                            PageHost.dismissOverlay()
                        }
                    )
                }
                column.addView(
                    pickerRow(context, Strings.bookmarkThresholdCustom, palette.accent) { showInput() }
                )
            }

            showPresets()
        }
    }

    private fun showFillBudgetPicker(context: Context, palette: Palette, onPick: (Int) -> Unit) {
        val budgets = BookmarkThreshold.FILL_BUDGETS
        val chosen = BookmarkThreshold.fillBudgetMs
        showPickerCard(context, palette) { column ->

            // See [showRelativeThresholdPicker]: the list and the input open each other.
            lateinit var showPresets: () -> Unit

            fun showInput() {
                showNumberInput(
                    context,
                    palette,
                    column,
                    Strings.fillBudgetCustomTitle,
                    Strings.fillBudgetScale,
                    if (chosen > 0) (chosen / 1000).toString() else "",
                    0..BookmarkThreshold.MAX_FILL_SECONDS,
                    onCancel = showPresets
                ) { seconds -> onPick(seconds * 1000) }
            }

            showPresets = {
                column.removeAllViews()
                column.addView(pickerTitle(context, palette, Strings.fillBudgetTitle))
                budgets.forEach { milliseconds ->
                    column.addView(
                        pickerRow(
                            context,
                            Strings.fillBudgetValue(milliseconds),
                            if (milliseconds == chosen) palette.accent else palette.primary
                        ) {
                            onPick(milliseconds)
                            PageHost.dismissOverlay()
                        }
                    )
                }
                column.addView(
                    pickerRow(context, Strings.bookmarkThresholdCustom, palette.accent) { showInput() }
                )
            }

            showPresets()
        }
    }

    private fun showBookmarkThresholdPicker(
        context: Context,
        palette: Palette,
        onFloor: (Int) -> Unit
    ) {
        showPickerCard(context, palette) { column ->

            // See [showRelativeThresholdPicker]: the list and the input open each other.
            lateinit var showPresets: () -> Unit

            fun showInput() {
                val shown = BookmarkThreshold.current
                showNumberInput(
                    context,
                    palette,
                    column,
                    Strings.bookmarkThresholdCustomTitle,
                    Strings.bookmarkThresholdScale,
                    if (shown > 0) shown.toString() else "",
                    0..BookmarkThreshold.MAX_FLOOR,
                    onCancel = showPresets
                ) { floor -> onFloor(floor) }
            }

            showPresets = {
                column.removeAllViews()
                column.addView(pickerTitle(context, palette, Strings.bookmarkThresholdTitle))
                BookmarkThreshold.PRESETS.forEach { floor ->
                    val chosen = floor == BookmarkThreshold.current
                    column.addView(
                        pickerRow(
                            context,
                            floorLabel(floor),
                            if (chosen) palette.accent else palette.primary
                        ) {
                            onFloor(floor)
                            PageHost.dismissOverlay()
                        }
                    )
                }
                column.addView(
                    pickerRow(context, Strings.bookmarkThresholdCustom, palette.accent) { showInput() }
                )
            }

            showPresets()
        }
    }

    private fun openAiSettings(activity: Activity) {
        try {
            val page = AiFilterSettingsView.build(activity) { PageHost.pop() } ?: return
            PageHost.push(page)
        } catch (_: Throwable) {
        }
    }

    private fun historyRow(
        context: Context,
        palette: Palette,
        entry: HistoryStore.Entry,
        showKind: Boolean = true
    ): View =
        LinearLayout(context).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            setPadding(dp(context, 16f), dp(context, 10f), dp(context, 16f), dp(context, 10f))
            setOnClickListener { openDetail(context, entry) }

            addView(
                ImageView(context).apply {
                    val size = dp(context, 44f)
                    layoutParams = LinearLayout.LayoutParams(size, size)
                    scaleType = ImageView.ScaleType.CENTER_CROP
                    background = GradientDrawable().apply {
                        cornerRadius = dp(context, 6f).toFloat()
                        setColor(palette.divider)
                    }
                    loadThumb(context, entry.thumb, this)
                }
            )

            addView(
                LinearLayout(context).apply {
                    orientation = LinearLayout.VERTICAL
                    setPadding(dp(context, 12f), 0, dp(context, 8f), 0)
                    layoutParams = LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f)
                    addView(
                        TextView(context).apply {
                            text = entry.title.ifBlank { "#${entry.id}" }
                            textSize = 14f
                            setTextColor(palette.primary)
                            maxLines = 1
                            ellipsize = android.text.TextUtils.TruncateAt.END
                        }
                    )
                    addView(
                        TextView(context).apply {
                            val author = entry.author.ifBlank { "—" }
                            text = "$author · ${timeFormat.format(Date(entry.time))}"
                            textSize = 11f
                            setTextColor(palette.secondary)
                            setPadding(0, dp(context, 2f), 0, 0)
                            maxLines = 1
                            ellipsize = android.text.TextUtils.TruncateAt.END
                        }
                    )
                }
            )

            if (showKind) {
                addView(
                    TextView(context).apply {
                        text = if (entry.kind == HistoryStore.KIND_NOVEL) Strings.kindNovel
                        else Strings.kindIllust
                        textSize = 11f
                        setTextColor(palette.secondary)
                        setPadding(dp(context, 8f), 0, 0, 0)
                    }
                )
            }
        }

    private fun loadThumb(context: Context, url: String, target: ImageView) {
        if (url.isBlank()) return
        imageCache[url]?.let {
            target.setImageBitmap(it)
            return
        }
        imagePool.execute {
            val bitmap = runCatching {
                val connection = (URL(url).openConnection() as HttpURLConnection).apply {
                    connectTimeout = 8000
                    readTimeout = 8000
                    setRequestProperty("Referer", "https://www.pixiv.net/")
                }
                connection.inputStream.use { BitmapFactory.decodeStream(it) }
            }.getOrNull() ?: return@execute
            synchronized(imageCache) { imageCache[url] = bitmap }
            target.post { target.setImageBitmap(bitmap) }
        }
    }

    /**
     * The detail screens take a work id of their own, so a history entry can open the work straight
     * away. Sending the `https://www.pixiv.net/...` link through the router instead makes the router
     * resolve it, and that resolution is drawn on the app's launch screen - a full-screen flash of
     * the splash artwork on the way to every work. The router stays as the fallback for when a build
     * renames or removes one of the two activities.
     */
    private fun openDetail(context: Context, entry: HistoryStore.Entry) {
        val isNovel = entry.kind == HistoryStore.KIND_NOVEL
        val direct = runCatching {
            context.startActivity(
                Intent().apply {
                    setClassName(
                        context.packageName,
                        if (isNovel) NOVEL_DETAIL_ACTIVITY else ILLUST_DETAIL_ACTIVITY
                    )
                    if (isNovel) putExtra("NOVEL_ID", entry.id) else putExtra("ILLUST_ID", entry.id)
                    if (context !is Activity) addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                }
            )
        }.isSuccess
        if (direct) return

        runCatching {
            val url = if (isNovel) {
                "https://www.pixiv.net/novel/show.php?id=${entry.id}"
            } else {
                "https://www.pixiv.net/artworks/${entry.id}"
            }
            context.startActivity(
                Intent(Intent.ACTION_VIEW, android.net.Uri.parse(url)).apply {
                    setClassName(context.packageName, DETAIL_ACTIVITY)
                    addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                }
            )
        }
    }

    private fun dp(context: Context, value: Float): Int = TypedValue.applyDimension(
        TypedValue.COMPLEX_UNIT_DIP,
        value,
        context.resources.displayMetrics
    ).toInt()
}

/**
 * A list that stops growing at most of the screen. The picker holds a share group above a count
 * group, and a card taller than the screen puts its last rows past the edge where nothing scrolls.
 */
private class CappedScrollView(context: Context) : ScrollView(context) {

    override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
        val cap = (resources.displayMetrics.heightPixels * CARD_HEIGHT_SHARE).toInt()
        super.onMeasure(
            widthMeasureSpec,
            View.MeasureSpec.makeMeasureSpec(cap, View.MeasureSpec.AT_MOST)
        )
    }

    private companion object {
        const val CARD_HEIGHT_SHARE = 0.82f
    }
}

