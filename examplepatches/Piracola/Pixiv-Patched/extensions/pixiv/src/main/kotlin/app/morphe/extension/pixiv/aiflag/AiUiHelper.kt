package app.morphe.extension.pixiv.aiflag

import android.content.Context
import android.graphics.Color
import android.graphics.Typeface
import android.graphics.drawable.BitmapDrawable
import android.graphics.drawable.GradientDrawable
import android.os.Build
import android.util.TypedValue
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.widget.FrameLayout
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.TextView
import app.morphe.extension.pixiv.viewer.EnhancedViewerHelper
import java.util.Collections
import java.util.WeakHashMap
import java.util.concurrent.ConcurrentHashMap

object AiUiHelper {

    private const val TAG_AI_BADGE = "morphe_ai_badge"
    private const val TAG_DETAIL_AI_PILL = "morphe_detail_ai_pill"
    private const val TAG_DETAIL_AI_BANNER = "morphe_detail_ai_banner"
    private const val TAG_TITLE_ROW = "morphe_title_row"

    /** Compared against the superclass chain, so app subclasses of RecyclerView match as well. */
    private const val RECYCLER_VIEW_CLASS_NAME = "androidx.recyclerview.widget.RecyclerView"

    /** Reflex safety stop while walking up to the RecyclerView; deeper than any Pixiv item layout. */
    private const val ITEM_ROOT_MAX_DEPTH = 8

    // Empirical values for the detail screen: toolbar (~56dp) + status bar (~32dp)
    // + banner (~34dp) plus breathing margins. Tuned by eye on 6.202.1 - re-check visually before editing.
    private const val DETAIL_HEADER_SPACE_DP = 102f
    // Empirical: offset from the top of the padded header area down to the banner.
    private const val DETAIL_BANNER_TOP_OFFSET_DP = 58f

    private val resIds = ConcurrentHashMap<String, Int>()

    /** Visibility and height an item had before "hide completely" collapsed it. */
    private class ItemOriginalState(val visibility: Int, val height: Int)

    // Original item state, so "hide completely" can collapse an item and restore it on recycle.
    private val itemOriginals = Collections.synchronizedMap(WeakHashMap<View, ItemOriginalState>())

    // Listener currently attached to each detail ImageView, replaced (not stacked) on every rebind.
    // Weak keys: a View holds its whole parent tree, so a strong key would pin every detail screen.
    private val detailLayoutListeners =
        Collections.synchronizedMap(WeakHashMap<View, View.OnLayoutChangeListener>())

    @JvmStatic
    fun onThumbnailBound(thumbnailView: ViewGroup?, illust: Any?) {
        if (thumbnailView == null) return
        try {
            val context = thumbnailView.context
            AiDetectionHelper.ensureContext(context)

            val actualIllust = AiDetectionHelper.unwrapIllust(illust) ?: illust
            val isAi = AiDetectionHelper.isAi(actualIllust)
            val imageView = findMainImageView(thumbnailView)

            if (isAi) {
                if (AiFilterConfig.getHideCompletely(context)) {
                    hideItemCompletely(thumbnailView)
                } else {
                    showItem(thumbnailView)
                    imageView?.alpha = 0.25f
                    showBadge(thumbnailView, context)
                }
            } else {
                showItem(thumbnailView)
                imageView?.alpha = 1.0f
                hideBadge(thumbnailView)
            }
        } catch (_: Throwable) {
            // Safety: never crash view binding
        }
    }

    @JvmStatic
    fun onDetailImageBound(viewHolder: Any?, illust: Any?) {
        try {
            if (viewHolder == null || illust == null) return

            val itemView = itemViewOf(viewHolder) ?: return
            val context = itemView.context
            val actualIllust = AiDetectionHelper.unwrapIllust(illust) ?: illust
            val isAi = AiDetectionHelper.isAi(actualIllust)

            // The pager item carries the real page index (Llc2;->e:I); the adapter position of the
            // ViewHolder is only a fallback, since it is -1 while detached and shift after recycling.
            val pageIndex = AiDetectionHelper.pageIndex(illust) ?: adapterPositionOf(viewHolder)

            if (!isAi || pageIndex != 0) {
                itemView.findViewWithTag<View>(TAG_DETAIL_AI_BANNER)?.visibility = View.GONE
                if (itemView.paddingTop != 0) itemView.setPadding(0, 0, 0, 0)
                return
            }

            // Dedicated header area above the image.
            val headerSpace = dpToPx(context, DETAIL_HEADER_SPACE_DP).toInt()
            if (itemView.paddingTop != headerSpace) {
                itemView.setPadding(0, headerSpace, 0, 0)
                itemView.clipToPadding = false
            }

            // Position the banner within the header gap, safely below the toolbar icons.
            val bannerOffsetFromTop = -headerSpace + dpToPx(context, DETAIL_BANNER_TOP_OFFSET_DP).toInt()

            var banner = itemView.findViewWithTag<View>(TAG_DETAIL_AI_BANNER)
            if (banner == null) {
                banner = createInlineWarningBanner(context)
                val lp = FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
                ).apply {
                    gravity = Gravity.TOP or Gravity.CENTER_HORIZONTAL
                    topMargin = bannerOffsetFromTop
                }
                itemView.addView(banner, lp)
            } else {
                val lp = banner.layoutParams as? FrameLayout.LayoutParams
                if (lp != null && lp.topMargin != bannerOffsetFromTop) {
                    lp.topMargin = bannerOffsetFromTop
                    banner.layoutParams = lp
                }
            }

            banner.visibility = View.VISIBLE
            banner.bringToFront()
        } catch (_: Throwable) {
        }
    }

    private fun createInlineWarningBanner(context: Context): View {
        val banner = LinearLayout(context).apply {
            tag = TAG_DETAIL_AI_BANNER
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL

            val padH = dpToPx(context, 14f).toInt()
            val padV = dpToPx(context, 6f).toInt()
            setPadding(padH, padV, padH + dpToPx(context, 2f).toInt(), padV)

            // Deep obsidian-crimson frosted glass gradient
            val bg = GradientDrawable(
                GradientDrawable.Orientation.LEFT_RIGHT,
                intArrayOf(
                    0xF22B090E.toInt(),
                    0xF2450C16.toInt(),
                    0xF22B090E.toInt()
                )
            ).apply {
                shape = GradientDrawable.RECTANGLE
                cornerRadius = dpToPx(context, 24f)
                setStroke(dpToPx(context, 1.2f).toInt(), 0x99FB7185.toInt()) // luminous rose accent border
            }
            background = bg

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                elevation = dpToPx(context, 6f)
            }
        }

        // Circular luminous icon badge
        val iconBadge = TextView(context).apply {
            text = "✦"
            textSize = 10.5f
            typeface = Typeface.DEFAULT_BOLD
            setTextColor(0xFFFF758F.toInt())
            gravity = Gravity.CENTER
            includeFontPadding = false

            val badgeSize = dpToPx(context, 19f).toInt()
            val lp = LinearLayout.LayoutParams(badgeSize, badgeSize).apply {
                marginEnd = dpToPx(context, 7f).toInt()
                rightMargin = dpToPx(context, 7f).toInt()
            }
            layoutParams = lp

            val iconBg = GradientDrawable().apply {
                shape = GradientDrawable.OVAL
                setColor(0x59FF4D6D.toInt()) // 35% translucent vibrant coral
                setStroke(dpToPx(context, 0.8f).toInt(), 0x80FF758F.toInt())
            }
            background = iconBg
        }
        banner.addView(iconBadge)

        // Main typography with clean styling
        val textView = TextView(context).apply {
            text = "AI-Generated Work"
            textSize = 11.5f
            typeface = Typeface.DEFAULT_BOLD
            setTextColor(0xFFFFF1F2.toInt())
            gravity = Gravity.CENTER_VERTICAL
            includeFontPadding = false
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                letterSpacing = 0.03f
            }
            setShadowLayer(dpToPx(context, 2f), 0f, dpToPx(context, 1f), 0x99000000.toInt())
        }
        banner.addView(textView)

        return banner
    }

    @JvmStatic
    fun onDetailBottomBarBound(view: View?, illust: Any?) {
        try {
            if (view == null || illust == null) return
            val actualIllust = AiDetectionHelper.unwrapIllust(illust) ?: illust
            val isAi = AiDetectionHelper.isAi(actualIllust)

            val context = view.context
            AiDetectionHelper.ensureContext(context)

            // Cache current detail bitmap for instant fullscreen placeholder
            view.post {
                try {
                    val imgResId = idOf(context, "image_view")
                    val iv = if (imgResId != 0) view.rootView?.findViewById<ImageView>(imgResId) else null
                    if (iv != null) {
                        grabSnapshot(iv, actualIllust)
                        // setWork runs on every rebind: replace the listener the previous bind left
                        // behind so they cannot pile up on the same ImageView.
                        detailLayoutListeners.remove(iv)?.let { iv.removeOnLayoutChangeListener(it) }
                        // The listener reads the view from its own argument instead of closing over it,
                        // so the map's weak key is not kept alive by its own value.
                        val listener = View.OnLayoutChangeListener { changed, _, _, _, _, _, _, _, _ ->
                            (changed as? ImageView)?.let { grabSnapshot(it, actualIllust) }
                        }
                        iv.addOnLayoutChangeListener(listener)
                        detailLayoutListeners[iv] = listener
                        // Two queued posts can reach the same ImageView: only the registered one stays.
                        if (detailLayoutListeners[iv] !== listener) {
                            iv.removeOnLayoutChangeListener(listener)
                        }
                    }
                } catch (_: Throwable) {
                }
            }

            // 1. Maintain title pill metadata in bottom bar
            val resId = idOf(context, "title_text_view")
            val titleView = if (resId != 0) {
                view.findViewById<TextView>(resId)
            } else {
                view as? TextView
            }

            if (titleView != null) {
                val parentLayout = titleView.parent as? ViewGroup
                if (parentLayout != null) {
                    var titleRow = parentLayout.findViewWithTag<LinearLayout>(TAG_TITLE_ROW)

                    if (titleRow == null) {
                        if (parentLayout is LinearLayout && parentLayout.orientation == LinearLayout.VERTICAL) {
                            val titleIdx = parentLayout.indexOfChild(titleView)
                            if (titleIdx >= 0) {
                                parentLayout.removeView(titleView)
                                titleRow = LinearLayout(context).apply {
                                    tag = TAG_TITLE_ROW
                                    orientation = LinearLayout.HORIZONTAL
                                    gravity = Gravity.CENTER_VERTICAL
                                    layoutParams = LinearLayout.LayoutParams(
                                        ViewGroup.LayoutParams.WRAP_CONTENT,
                                        ViewGroup.LayoutParams.WRAP_CONTENT
                                    )
                                }
                                titleView.layoutParams = LinearLayout.LayoutParams(
                                    ViewGroup.LayoutParams.WRAP_CONTENT,
                                    ViewGroup.LayoutParams.WRAP_CONTENT
                                )
                                titleRow.addView(titleView)
                                parentLayout.addView(titleRow, titleIdx)
                            }
                        }
                    }

                    val containerForPill = titleRow ?: parentLayout
                    var pill = containerForPill.findViewWithTag<TextView>(TAG_DETAIL_AI_PILL)

                    if (isAi) {
                        if (pill == null) {
                            pill = TextView(context).apply {
                                tag = TAG_DETAIL_AI_PILL
                                text = "AI"
                                textSize = 9.5f
                                typeface = Typeface.DEFAULT_BOLD
                                setTextColor(Color.WHITE)

                                val radius = dpToPx(context, 3.5f)
                                val bg = GradientDrawable().apply {
                                    shape = GradientDrawable.RECTANGLE
                                    setColor(0xFFE11D48.toInt()) // Rose-600
                                    cornerRadius = radius
                                }
                                background = bg

                                val pxH = dpToPx(context, 4.5f).toInt()
                                val pxV = dpToPx(context, 1f).toInt()
                                setPadding(pxH, pxV, pxH, pxV)

                                val margin = dpToPx(context, 6f).toInt()
                                layoutParams = LinearLayout.LayoutParams(
                                    ViewGroup.LayoutParams.WRAP_CONTENT,
                                    ViewGroup.LayoutParams.WRAP_CONTENT
                                ).apply {
                                    gravity = Gravity.CENTER_VERTICAL
                                    leftMargin = margin
                                    marginStart = margin
                                }
                            }
                            containerForPill.addView(pill)
                        }
                        pill.visibility = View.VISIBLE
                    } else {
                        pill?.visibility = View.GONE
                    }
                }
            }
        } catch (_: Throwable) {
        }
    }

    @JvmStatic
    fun onDetailViewBound(detailContainer: ViewGroup?, illust: Any?) {
        try {
            if (detailContainer == null || illust == null) return
            onDetailImageBound(detailContainer, illust)
        } catch (_: Throwable) {
        }
    }

    @JvmStatic
    fun onDetailMetadataBound(titleView: TextView?, authorView: TextView?, illust: Any?) {
        try {
            if (titleView == null || illust == null) return
            onDetailBottomBarBound(titleView, illust)
        } catch (_: Throwable) {
        }
    }

    private fun itemViewOf(viewHolder: Any): ViewGroup? {
        var currentClass: Class<*>? = viewHolder.javaClass
        while (currentClass != null) {
            try {
                val field = currentClass.getDeclaredField("itemView")
                field.isAccessible = true
                val view = field.get(viewHolder) as? ViewGroup
                if (view != null) return view
            } catch (_: Throwable) {
            }
            currentClass = currentClass.superclass
        }
        return null
    }

    private fun adapterPositionOf(viewHolder: Any): Int {
        for (methodName in arrayOf("getAbsoluteAdapterPosition", "getLayoutPosition", "getAdapterPosition")) {
            try {
                val position = viewHolder.javaClass.getMethod(methodName).invoke(viewHolder) as? Int
                if (position != null && position >= 0) return position
            } catch (_: Throwable) {
            }
        }
        return -1
    }

    /** Hands the detail screen's current bitmap to the viewer; it keeps its own copy. */
    private fun grabSnapshot(imageView: ImageView, illust: Any?) {
        try {
            val drawable = imageView.drawable
            if (drawable is BitmapDrawable && drawable.bitmap != null && !drawable.bitmap.isRecycled) {
                EnhancedViewerHelper.setCachedDetailBitmap(drawable.bitmap, illust)
            }
        } catch (_: Throwable) {
        }
    }

    /** The item root: the closest ancestor that is a direct child of a RecyclerView. */
    private fun itemRootOf(view: View): ViewGroup? {
        var root = view as? ViewGroup ?: return null
        repeat(ITEM_ROOT_MAX_DEPTH) {
            val parent = root.parent as? ViewGroup ?: return null
            if (isRecyclerView(parent)) return root
            root = parent
        }
        return null
    }

    /** True for androidx RecyclerView and every app subclass of it; the host is not always the base class. */
    private fun isRecyclerView(view: View): Boolean {
        var clazz: Class<*>? = view.javaClass
        while (clazz != null) {
            if (clazz.name == RECYCLER_VIEW_CLASS_NAME) return true
            clazz = clazz.superclass
        }
        return false
    }

    /**
     * "Hide completely" must not leave a grid hole: ThumbnailView is the only child of the item root
     * (feature_commonlist_view_illust_item.xml), so collapse the root as well and restore it later.
     * Everything is resolved before anything is touched - a half applied hide is worse than none.
     */
    private fun hideItemCompletely(thumbnailView: ViewGroup) {
        val itemRoot = itemRootOf(thumbnailView) ?: return
        val lp = itemRoot.layoutParams ?: return
        if (!itemOriginals.containsKey(itemRoot)) {
            itemOriginals[itemRoot] = ItemOriginalState(itemRoot.visibility, lp.height)
        }
        thumbnailView.visibility = View.GONE
        if (itemRoot.visibility != View.GONE) itemRoot.visibility = View.GONE
        if (lp.height != 0) {
            lp.height = 0
            itemRoot.layoutParams = lp
        }
    }

    private fun showItem(thumbnailView: ViewGroup) {
        val itemRoot = itemRootOf(thumbnailView)
        val original = itemRoot?.let { itemOriginals.remove(it) }

        if (thumbnailView.visibility != View.VISIBLE) thumbnailView.visibility = View.VISIBLE
        if (itemRoot == null || original == null) return

        // Restore what the app had, not a hard coded VISIBLE / wrap_content.
        if (itemRoot.visibility != original.visibility) itemRoot.visibility = original.visibility
        val lp = itemRoot.layoutParams ?: return
        if (lp.height != original.height) {
            lp.height = original.height
            itemRoot.layoutParams = lp
        }
    }

    private fun findMainImageView(viewGroup: ViewGroup): ImageView? {
        val resId = idOf(viewGroup.context, "image_view")
        if (resId != 0) {
            val iv = viewGroup.findViewById<ImageView>(resId)
            if (iv != null) return iv
        }

        // Fallback: search for first suitable ImageView that is not a small icon
        var bestCandidate: ImageView? = null
        for (i in 0 until viewGroup.childCount) {
            val child = viewGroup.getChildAt(i)
            if (child is ImageView) {
                bestCandidate = child
            } else if (child is ViewGroup) {
                val found = findMainImageView(child)
                if (found != null) return found
            }
        }
        return bestCandidate
    }

    private fun showBadge(parent: ViewGroup, context: Context) {
        var badge = parent.findViewWithTag<TextView>(TAG_AI_BADGE)
        if (badge == null) {
            badge = TextView(context).apply {
                tag = TAG_AI_BADGE
                text = "AI"
                textSize = 10f
                typeface = Typeface.DEFAULT_BOLD
                setTextColor(Color.WHITE)

                val radius = dpToPx(context, 4f)
                val bg = GradientDrawable().apply {
                    shape = GradientDrawable.RECTANGLE
                    setColor(0xFFDC2626.toInt()) // Tailwind Red-600
                    cornerRadius = radius
                }
                background = bg

                val pxH = dpToPx(context, 5f).toInt()
                val pxV = dpToPx(context, 2f).toInt()
                setPadding(pxH, pxV, pxH, pxV)

                val margin = dpToPx(context, 6f).toInt()
                layoutParams = FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
                ).apply {
                    gravity = Gravity.TOP or Gravity.START
                    topMargin = margin
                    leftMargin = margin
                    marginStart = margin
                }
            }
            parent.addView(badge)
        }
        badge.visibility = View.VISIBLE
        badge.bringToFront()
    }

    private fun hideBadge(parent: ViewGroup) {
        val badge = parent.findViewWithTag<View>(TAG_AI_BADGE)
        badge?.visibility = View.GONE
    }

    private fun idOf(context: Context, name: String): Int = resIds.getOrPut(name) {
        try {
            context.resources.getIdentifier(name, "id", context.packageName)
        } catch (_: Throwable) {
            0
        }
    }

    private fun dpToPx(context: Context, dp: Float): Float {
        return TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP,
            dp,
            context.resources.displayMetrics
        )
    }
}
