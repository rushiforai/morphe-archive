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
                addView(bookmarkThresholdRow(context, palette, onClear))
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

    /** One group of rows, drawn as the same rounded card the AI filter page uses. */
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

    private fun thresholdLabel(floor: Int): String =
        if (floor > 0) Strings.bookmarkThresholdValue(floor) else Strings.bookmarkThresholdOff

    private fun bookmarkThresholdRow(
        context: Context,
        palette: Palette,
        onChanged: () -> Unit
    ): View {
        val value = TextView(context).apply {
            textSize = 14f
            setTextColor(palette.accent)
            setPadding(dp(context, 8f), 0, 0, 0)
        }

        fun refresh() {
            value.text = thresholdLabel(BookmarkThreshold.current)
        }
        refresh()

        return LinearLayout(context).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            setPadding(dp(context, 16f), dp(context, 14f), dp(context, 16f), dp(context, 14f))
            setOnClickListener {
                showBookmarkThresholdPicker(context, palette) { floor ->
                    BookmarkThreshold.setFloor(context, floor)
                    refresh()
                    onChanged()
                }
            }
            addView(
                LinearLayout(context).apply {
                    orientation = LinearLayout.VERTICAL
                    layoutParams = LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f)
                    addView(
                        TextView(context).apply {
                            text = Strings.bookmarkThreshold
                            textSize = 15f
                            setTextColor(palette.primary)
                        }
                    )
                    addView(
                        TextView(context).apply {
                            text = Strings.bookmarkThresholdHint
                            textSize = 11f
                            setTextColor(palette.secondary)
                            setPadding(0, dp(context, 2f), 0, 0)
                        }
                    )
                }
            )
            addView(value)
        }
    }

    /**
     * The picker used to be a window of its own, which is why tapping around it did nothing: with a
     * `WRAP_CONTENT` window the touches outside never reach it, and there is nothing behind it to
     * dim. It is now a scrim and a card inside the page's own window, so the scrim takes every tap
     * that misses the card, and the card's elevation draws a real shadow over it.
     *
     * The card changes its own contents in place: the presets first, then - behind the last row - a
     * number field, because the count somebody wants is rarely one of the round ones.
     */
    private fun showBookmarkThresholdPicker(
        context: Context,
        palette: Palette,
        onPicked: (Int) -> Unit
    ) {
        try {
            val column = LinearLayout(context).apply {
                orientation = LinearLayout.VERTICAL
                setPadding(0, dp(context, 12f), 0, dp(context, 10f))
            }

            fun title(text: String) = TextView(context).apply {
                this.text = text
                textSize = 16f
                typeface = Typeface.DEFAULT_BOLD
                setTextColor(palette.primary)
                setPadding(dp(context, 20f), dp(context, 4f), dp(context, 20f), dp(context, 10f))
            }

            fun actionRow(label: String, color: Int, onTap: () -> Unit) = TextView(context).apply {
                text = label
                textSize = 15f
                setTextColor(color)
                setPadding(dp(context, 20f), dp(context, 12f), dp(context, 20f), dp(context, 12f))
                setOnClickListener { onTap() }
            }

            fun showInput() {
                column.removeAllViews()
                column.addView(title(Strings.bookmarkThresholdCustomTitle))
                val input = EditText(context).apply {
                    inputType = InputType.TYPE_CLASS_NUMBER
                    filters = arrayOf(InputFilter.LengthFilter(6))
                    textSize = 16f
                    setTextColor(palette.primary)
                    setHintTextColor(palette.secondary)
                    setPadding(dp(context, 20f), dp(context, 6f), dp(context, 20f), dp(context, 6f))
                    val shown = BookmarkThreshold.current
                    setText(if (shown > 0) shown.toString() else "")
                    setSelection(text.length)
                }
                column.addView(input)
                column.addView(
                    TextView(context).apply {
                        text = Strings.bookmarkThresholdScale
                        textSize = 11f
                        setTextColor(palette.secondary)
                        setPadding(dp(context, 20f), 0, dp(context, 20f), dp(context, 10f))
                    }
                )
                column.addView(
                    actionRow(Strings.bookmarkThresholdSave, palette.accent) {
                        val floor = input.text.toString().toIntOrNull()
                        if (floor == null || floor < 0 || floor > BookmarkThreshold.MAX_FLOOR) {
                            Toast.makeText(context, Strings.bookmarkThresholdInvalid, Toast.LENGTH_SHORT).show()
                            return@actionRow
                        }
                        onPicked(floor)
                        PageHost.dismissOverlay()
                    }
                )
                input.post {
                    input.requestFocus()
                    // The current floor is in the field already; typing should replace it, not append.
                    input.selectAll()
                    runCatching {
                        val imm = context.getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager
                        imm.showSoftInput(input, InputMethodManager.SHOW_IMPLICIT)
                    }
                }
            }

            fun showPresets() {
                column.removeAllViews()
                column.addView(title(Strings.bookmarkThresholdTitle))
                BookmarkThreshold.PRESETS.forEach { floor ->
                    val current = floor == BookmarkThreshold.current
                    column.addView(
                        actionRow(
                            thresholdLabel(floor),
                            if (current) palette.accent else palette.primary
                        ) {
                            onPicked(floor)
                            PageHost.dismissOverlay()
                        }
                    )
                }
                column.addView(actionRow(Strings.bookmarkThresholdCustom, palette.accent) { showInput() })
            }

            showPresets()

            val card = ScrollView(context).apply {
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
