package com.sarp.tiktokliquidglass

import android.app.Activity
import android.content.Context
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.graphics.Typeface
import android.text.Editable
import android.text.TextUtils
import android.text.TextWatcher
import android.util.TypedValue
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.widget.FrameLayout
import android.widget.LinearLayout
import android.widget.TextView
import kotlin.math.roundToInt

/**
 * Vector magnifying glass icon rendered for the inline feed search tag/capsule.
 */
class SearchMagnifierView(
    context: Context,
    private val tintColor: Int = Color.WHITE
) : View(context) {

    private val paint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.STROKE
        strokeCap = Paint.Cap.ROUND
        strokeJoin = Paint.Join.ROUND
        color = tintColor
    }

    override fun onDraw(canvas: Canvas) {
        val w = width.toFloat()
        val h = height.toFloat()
        if (w <= 0f || h <= 0f) return

        val strokePx = TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP,
            1.45f,
            resources.displayMetrics
        ).coerceAtLeast(1.5f)
        paint.strokeWidth = strokePx

        val cx = w * 0.42f
        val cy = h * 0.42f
        val r = w * 0.27f
        canvas.drawCircle(cx, cy, r, paint)
        canvas.drawLine(w * 0.62f, h * 0.62f, w * 0.86f, h * 0.86f, paint)
    }
}

/**
 * Replaces TikTok's bottom feed search bar ("Ara · <query>") with a compact inline pill/badge
 * (`[🔍 • Sorgu]`) next to the creator's username, supporting both Mergen (0dp Obsidian) and
 * Kyant0 Liquid Glass styles.
 */
object FeedSearchPillHelper {

    private const val TAG_SEARCH_ORIG_VIS = 0x53415270
    private const val TAG_ROW_ORIG_ORIENT = 0x53415271
    private const val TAG_ROW_ORIG_GRAVITY = 0x53415272
    private const val TAG_SEARCH_PILL_SLOT = 0x53415273
    private const val TAG_SEARCH_WATCHER = 0x53415274
    private const val TAG_SEARCH_CONTAINER_LISTENER = 0x53415275
    private const val TAG_SEARCH_WE_HID = 0x53415276
    private const val TAG_SYNC_PENDING = 0x53415277
    private const val TAG_PILL_TEXT_VIEW = 0x53415278
    private const val TAG_TITLE_ORIG_MAXW = 0x53415279
    private const val TAG_ROW_LAYOUT_GUARD = 0x5341527A
    private const val TAG_PILL_STYLE_TAG = 0x5341527B

    private fun dp(context: Context, value: Float): Int = MergenDesign.dp(context, value)

    private fun isEffectivelyActive(activity: Activity): Boolean =
        MergenPrefs.isModEffectivelyActive(activity) && MergenPrefs.isLiquidGlassBarEnabled(activity)

    fun syncForWidgetContainer(activity: Activity, widgetContainer: ViewGroup, active: Boolean) {
        if (!active) {
            restoreForWidgetContainer(activity, widgetContainer)
            return
        }

        val banner = TikTokViewResolver.findFeedSearchBanner(activity, widgetContainer)
        val authorRow = TikTokViewResolver.findAuthorRow(activity, widgetContainer)

        if (banner == null) {
            hidePillSlot(authorRow)
            return
        }

        if (banner.containerToHide.getTag(TAG_SEARCH_ORIG_VIS) == null) {
            banner.containerToHide.setTag(TAG_SEARCH_ORIG_VIS, banner.containerToHide.visibility)
        }

        attachListenersOnce(activity, widgetContainer, banner)

        val query = TikTokViewResolver.extractSearchQuery(banner.textView.text)
        val anchorVisible = if (banner.visibilityAnchor === banner.containerToHide &&
            banner.containerToHide.getTag(TAG_SEARCH_WE_HID) == true
        ) {
            true
        } else {
            banner.visibilityAnchor.visibility == View.VISIBLE && banner.clickTarget.visibility == View.VISIBLE
        }
        val bannerHasSearch = query.isNotEmpty() && anchorVisible

        if (bannerHasSearch && authorRow != null) {
            banner.containerToHide.setTag(TAG_SEARCH_WE_HID, true)
            if (banner.containerToHide.visibility != View.GONE) {
                if (banner.containerToHide.isInLayout) {
                    banner.containerToHide.post {
                        if (banner.containerToHide.isAttachedToWindow) {
                            banner.containerToHide.visibility = View.GONE
                        }
                    }
                } else {
                    banner.containerToHide.visibility = View.GONE
                }
            }

            if (authorRow.getTag(TAG_ROW_ORIG_ORIENT) == null) {
                authorRow.setTag(TAG_ROW_ORIG_ORIENT, authorRow.orientation)
                authorRow.setTag(TAG_ROW_ORIG_GRAVITY, authorRow.gravity)
            }
            if (authorRow.orientation != LinearLayout.HORIZONTAL) {
                authorRow.orientation = LinearLayout.HORIZONTAL
            }
            authorRow.gravity = Gravity.CENTER_VERTICAL

            val kyant0 = MergenPrefs.isKyant0Style(activity)
            val wantedStyle = if (kyant0) "kyant0" else "mergen"
            val backdrop = findFeedBackdrop(activity, widgetContainer)
            val existingSlot = findPillSlot(authorRow) as? FrameLayout
            if (existingSlot != null && existingSlot.getTag(TAG_PILL_STYLE_TAG) == wantedStyle) {
                updateSlotContent(activity, existingSlot, banner, query, backdrop)
            } else if (authorRow.isInLayout) {
                authorRow.post {
                    if (authorRow.isAttachedToWindow && !activity.isFinishing && !activity.isDestroyed) {
                        val slot = ensurePillSlot(activity, authorRow, backdrop, kyant0)
                        updateSlotContent(activity, slot, banner, query, backdrop)
                    }
                }
            } else {
                val slot = ensurePillSlot(activity, authorRow, backdrop, kyant0)
                updateSlotContent(activity, slot, banner, query, backdrop)
            }
            applyAuthorTitleCap(activity, authorRow, active = true)
            attachAuthorRowLayoutGuardOnce(activity, authorRow)
        } else {
            banner.containerToHide.setTag(TAG_SEARCH_WE_HID, false)
            hidePillSlot(authorRow)
            if (authorRow != null) {
                applyAuthorTitleCap(activity, authorRow, active = false)
            }
        }
    }

    private fun updateSlotContent(
        activity: Activity,
        slot: FrameLayout,
        banner: TikTokViewResolver.FeedSearchBanner,
        query: String,
        backdrop: View
    ) {
        val tagView = slot.getChildAt(0) as? ViewGroup
        (tagView as? KyantGlassSurfaceView)?.setBackdropSource(backdrop)
        val label = tagView?.getTag(TAG_PILL_TEXT_VIEW) as? TextView
        val targetText = "\u2022 $query"
        if (label != null && label.text?.toString() != targetText) {
            label.text = targetText
        }
        tagView?.setOnClickListener {
            MergenHaptics.playTap(activity)
            triggerSearchClick(banner)
        }
        if (slot.visibility != View.VISIBLE) {
            slot.visibility = View.VISIBLE
        }
    }

    fun restoreForWidgetContainer(activity: Activity, widgetContainer: ViewGroup) {
        val authorRow = TikTokViewResolver.findAuthorRow(activity, widgetContainer)
        if (authorRow != null) {
            applyAuthorTitleCap(activity, authorRow, active = false)
            findPillSlot(authorRow)?.let { slot ->
                if (authorRow.isInLayout) {
                    authorRow.post {
                        if (slot.parent === authorRow) {
                            authorRow.removeView(slot)
                        }
                    }
                } else {
                    authorRow.removeView(slot)
                }
            }
            (authorRow.getTag(TAG_ROW_ORIG_ORIENT) as? Int)?.let { origOrient ->
                authorRow.orientation = origOrient
                authorRow.setTag(TAG_ROW_ORIG_ORIENT, null)
            }
            (authorRow.getTag(TAG_ROW_ORIG_GRAVITY) as? Int)?.let { origGrav ->
                authorRow.gravity = origGrav
                authorRow.setTag(TAG_ROW_ORIG_GRAVITY, null)
            }
        }

        val banner = TikTokViewResolver.findFeedSearchBanner(activity, widgetContainer)
        if (banner != null) {
            banner.containerToHide.setTag(TAG_SEARCH_WE_HID, false)
            val origVis = banner.containerToHide.getTag(TAG_SEARCH_ORIG_VIS) as? Int
            if (origVis != null) {
                banner.containerToHide.visibility = origVis
                banner.containerToHide.setTag(TAG_SEARCH_ORIG_VIS, null)
            }
        }
    }

    private fun attachListenersOnce(
        activity: Activity,
        widgetContainer: ViewGroup,
        banner: TikTokViewResolver.FeedSearchBanner
    ) {
        if (banner.textView.getTag(TAG_SEARCH_WATCHER) == null) {
            banner.textView.setTag(TAG_SEARCH_WATCHER, true)
            banner.textView.addTextChangedListener(object : TextWatcher {
                override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {}
                override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {}
                override fun afterTextChanged(s: Editable?) {
                    postSync(activity, widgetContainer)
                }
            })
        }

        if (banner.containerToHide.getTag(TAG_SEARCH_CONTAINER_LISTENER) == null) {
            banner.containerToHide.setTag(TAG_SEARCH_CONTAINER_LISTENER, true)
            banner.containerToHide.addOnLayoutChangeListener { v, _, _, _, _, _, _, _, _ ->
                if (!isEffectivelyActive(activity)) return@addOnLayoutChangeListener
                val q = TikTokViewResolver.extractSearchQuery(banner.textView.text)
                val visibleAnchor = banner.visibilityAnchor === v ||
                    banner.visibilityAnchor.visibility == View.VISIBLE
                if (q.isNotEmpty() && visibleAnchor) {
                    v.setTag(TAG_SEARCH_WE_HID, true)
                    if (v.visibility != View.GONE) {
                        if (!v.isInLayout) {
                            v.visibility = View.GONE
                        } else {
                            v.post {
                                if (v.isAttachedToWindow && isEffectivelyActive(activity) && v.visibility != View.GONE) {
                                    v.visibility = View.GONE
                                }
                            }
                        }
                    }
                    postSync(activity, widgetContainer)
                }
            }
        }

        if (banner.visibilityAnchor !== banner.containerToHide &&
            banner.visibilityAnchor.getTag(TAG_SEARCH_CONTAINER_LISTENER) == null
        ) {
            banner.visibilityAnchor.setTag(TAG_SEARCH_CONTAINER_LISTENER, true)
            banner.visibilityAnchor.addOnLayoutChangeListener { _, _, _, _, _, _, _, _, _ ->
                if (isEffectivelyActive(activity)) {
                    postSync(activity, widgetContainer)
                }
            }
        }
    }

    private fun postSync(activity: Activity, widgetContainer: ViewGroup) {
        if (widgetContainer.getTag(TAG_SYNC_PENDING) == true) return
        widgetContainer.setTag(TAG_SYNC_PENDING, true)
        widgetContainer.post {
            widgetContainer.setTag(TAG_SYNC_PENDING, false)
            if (widgetContainer.isAttachedToWindow && !activity.isFinishing && !activity.isDestroyed) {
                syncForWidgetContainer(activity, widgetContainer, isEffectivelyActive(activity))
            }
        }
    }

    private fun findPillSlot(authorRow: LinearLayout): View? {
        for (i in 0 until authorRow.childCount) {
            val child = authorRow.getChildAt(i)
            if (child.getTag(TAG_SEARCH_PILL_SLOT) == true) {
                return child
            }
        }
        return null
    }

    private fun hidePillSlot(authorRow: LinearLayout?) {
        if (authorRow == null) return
        findPillSlot(authorRow)?.let { slot ->
            if (slot.visibility != View.GONE) {
                slot.visibility = View.GONE
            }
        }
    }

    private fun findFeedBackdrop(activity: Activity, widgetContainer: ViewGroup): View {
        val parentRoot = widgetContainer.parent as? View ?: widgetContainer
        return TikTokViewResolver.findViewByIdName(activity, parentRoot, "player_view")
            ?: TikTokViewResolver.findViewByIdName(activity, parentRoot, "y9d")
            ?: parentRoot
    }

    private fun ensurePillSlot(
        activity: Activity,
        authorRow: LinearLayout,
        backdrop: View,
        kyant0: Boolean
    ): FrameLayout {
        val wantedStyle = if (kyant0) "kyant0" else "mergen"
        val existing = findPillSlot(authorRow) as? FrameLayout
        if (existing != null) {
            if (existing.getTag(TAG_PILL_STYLE_TAG) == wantedStyle) {
                return existing
            }
            authorRow.removeView(existing)
        }

        val slot = FrameLayout(activity).apply {
            setTag(TAG_SEARCH_PILL_SLOT, true)
            setTag(TAG_PILL_STYLE_TAG, wantedStyle)
            setTag(TikTokViewResolver.TAG_MERGEN_MANAGED_VIEW, true)
        }

        val strokePx = dp(activity, 1f).coerceAtLeast(1)
        val outerHolder: ViewGroup = if (kyant0) {
            KyantGlassSurfaceView(
                context = activity,
                backdropSource = backdrop,
                isCapsule = true,
                blurRadiusDp = 6f,
                refractionHeightDp = 12f,
                refractionAmountDp = 12f,
                forceDarkGlass = true
            )
        } else {
            FrameLayout(activity).apply {
                background = MergenDesign.sharpBox(
                    fillColor = Color.argb(235, 0, 0, 0),
                    strokeColor = Color.argb(176, 255, 255, 255),
                    strokePx = strokePx
                )
            }
        }
        outerHolder.isClickable = true
        outerHolder.isFocusable = true

        val pillRow = LinearLayout(activity).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            val hPad = dp(activity, 7f)
            val vPad = dp(activity, 3f)
            setPadding(hPad, vPad, hPad, vPad)
        }

        val iconSize = dp(activity, 11f)
        pillRow.addView(
            SearchMagnifierView(activity, Color.WHITE),
            LinearLayout.LayoutParams(iconSize, iconSize).apply {
                rightMargin = TypedValue.applyDimension(
                    TypedValue.COMPLEX_UNIT_DIP,
                    4f,
                    activity.resources.displayMetrics
                ).roundToInt()
            }
        )

        val queryTv = TextView(activity).apply {
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 10.5f)
            setTextColor(MergenDesign.OBSIDIAN_INK)
            typeface = if (kyant0) Typeface.create("sans-serif-medium", Typeface.BOLD) else Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            maxLines = 1
            isSingleLine = true
            ellipsize = TextUtils.TruncateAt.END
        }
        outerHolder.setTag(TAG_PILL_TEXT_VIEW, queryTv)
        pillRow.addView(
            queryTv,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT)
        )
        outerHolder.addView(pillRow)

        slot.addView(
            outerHolder,
            FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.START or Gravity.CENTER_VERTICAL
            )
        )

        authorRow.addView(
            slot,
            LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f).apply {
                leftMargin = dp(activity, 6f)
            }
        )
        return slot
    }

    private fun attachAuthorRowLayoutGuardOnce(activity: Activity, authorRow: LinearLayout) {
        if (authorRow.getTag(TAG_ROW_LAYOUT_GUARD) != null) return
        authorRow.setTag(TAG_ROW_LAYOUT_GUARD, true)
        authorRow.addOnLayoutChangeListener { _, left, _, right, _, _, _, _, _ ->
            val slot = findPillSlot(authorRow) ?: return@addOnLayoutChangeListener
            if (slot.visibility == View.VISIBLE && (right - left) > 0 && isEffectivelyActive(activity)) {
                authorRow.post {
                    if (slot.visibility == View.VISIBLE && isEffectivelyActive(activity)) {
                        applyAuthorTitleCap(activity, authorRow, active = true)
                    }
                }
            }
        }
    }

    private fun applyAuthorTitleCap(activity: Activity, authorRow: LinearLayout, active: Boolean) {
        val titleTv = findAuthorTitleTextView(activity, authorRow) ?: return
        if (active) {
            if (titleTv.getTag(TAG_TITLE_ORIG_MAXW) == null) {
                titleTv.setTag(TAG_TITLE_ORIG_MAXW, titleTv.maxWidth)
            }
            val rowWidth = if (authorRow.width > 0) {
                authorRow.width
            } else {
                (activity.resources.displayMetrics.widthPixels * 0.72f).roundToInt()
            }
            val cap = (rowWidth * 0.44f).roundToInt().coerceAtLeast(dp(activity, 88f))
            if (titleTv.maxWidth != cap) {
                titleTv.maxWidth = cap
                titleTv.isSingleLine = true
                titleTv.maxLines = 1
                titleTv.ellipsize = TextUtils.TruncateAt.END
            }
        } else {
            val origMax = titleTv.getTag(TAG_TITLE_ORIG_MAXW) as? Int
            if (origMax != null) {
                if (titleTv.maxWidth != origMax) {
                    titleTv.maxWidth = origMax
                }
                titleTv.setTag(TAG_TITLE_ORIG_MAXW, null)
            }
        }
    }

    private fun findAuthorTitleTextView(activity: Activity, authorRow: LinearLayout): TextView? {
        (TikTokViewResolver.findViewByIdName(activity, authorRow, "title") as? TextView)?.let { return it }
        if (authorRow.childCount == 0) return null
        return findFirstTextView(authorRow.getChildAt(0))
    }

    private fun findFirstTextView(view: View): TextView? {
        if (view is TextView) return view
        if (view is ViewGroup) {
            for (i in 0 until view.childCount) {
                val found = findFirstTextView(view.getChildAt(i))
                if (found != null) return found
            }
        }
        return null
    }

    private fun triggerSearchClick(banner: TikTokViewResolver.FeedSearchBanner) {
        try {
            if (banner.clickTarget.hasOnClickListeners()) {
                banner.clickTarget.performClick()
            } else {
                banner.fallbackClickTarget?.performClick() ?: banner.clickTarget.performClick()
            }
        } catch (_: Throwable) {
        }
    }
}
