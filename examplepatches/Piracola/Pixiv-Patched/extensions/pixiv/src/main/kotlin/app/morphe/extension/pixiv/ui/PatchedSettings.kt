package app.morphe.extension.pixiv.ui

import android.app.Activity
import android.app.Dialog
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.res.Configuration
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Typeface
import android.graphics.drawable.ColorDrawable
import android.graphics.drawable.GradientDrawable
import android.util.TypedValue
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.ScrollView
import android.widget.TextView
import android.widget.Toast
import app.morphe.extension.pixiv.aiflag.AiFilterSettingsView
import app.morphe.extension.pixiv.history.HistoryStore
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
        val activity = findActivity(host?.context) ?: return
        try {
            val palette = Palette(activity)
            val dialog = Dialog(activity, dialogTheme(palette))
            val root = LinearLayout(activity).apply {
                orientation = LinearLayout.VERTICAL
                setBackgroundColor(palette.background)
            }
            root.addView(buildToolbar(activity, palette) { dialog.dismiss() })
            val contentHolder = LinearLayout(activity).apply {
                orientation = LinearLayout.VERTICAL
                layoutParams = LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    0,
                    1f
                )
            }
            fun render() {
                contentHolder.removeAllViews()
                contentHolder.addView(buildContent(activity, palette) { render() })
            }
            render()
            root.addView(contentHolder)
            dialog.setContentView(root)
            dialog.show()
            dialog.window?.setLayout(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
            )
            dialog.window?.setBackgroundDrawable(ColorDrawable(palette.background))
        } catch (t: Throwable) {
            Toast.makeText(activity, "${Strings.pageTitle}: ${t.message}", Toast.LENGTH_SHORT).show()
        }
    }

    private fun findActivity(context: Context?): Activity? {
        var current = context
        while (current is ContextWrapper) {
            if (current is Activity) return current
            current = current.baseContext
        }
        return current as? Activity
    }

    private fun dialogTheme(palette: Palette): Int =
        if (palette.dark) android.R.style.Theme_Material_NoActionBar
        else android.R.style.Theme_Material_Light_NoActionBar

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
            setBackgroundColor(palette.card)
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

    private fun openAiSettings(activity: Activity) {
        try {
            val palette = Palette(activity)
            val dialog = Dialog(activity, dialogTheme(palette))
            val view = AiFilterSettingsView.build(activity) { dialog.dismiss() } ?: return
            dialog.setContentView(view)
            dialog.show()
            dialog.window?.setLayout(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
            )
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

    private fun openDetail(context: Context, entry: HistoryStore.Entry) {
        try {
            val url = if (entry.kind == HistoryStore.KIND_NOVEL) {
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
        } catch (_: Throwable) {
        }
    }

    private fun dp(context: Context, value: Float): Int = TypedValue.applyDimension(
        TypedValue.COMPLEX_UNIT_DIP,
        value,
        context.resources.displayMetrics
    ).toInt()
}
