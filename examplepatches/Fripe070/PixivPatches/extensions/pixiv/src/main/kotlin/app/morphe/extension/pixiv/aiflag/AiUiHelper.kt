package app.morphe.extension.pixiv.aiflag

import android.app.Activity
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
import android.widget.RelativeLayout
import android.widget.TextView

object AiUiHelper {

    private const val TAG_AI_BADGE = "morphe_ai_badge"
    private const val TAG_DETAIL_AI_PILL = "morphe_detail_ai_pill"
    private const val TAG_DETAIL_AI_BANNER = "morphe_detail_ai_banner"
    private const val RES_ID_TOOLBAR = 0x7f0a0599

    @Volatile
    private var dismissedIllustId: String? = null

    @JvmStatic
    fun onThumbnailBound(thumbnailView: ViewGroup?, illust: Any?) {
        if (thumbnailView == null) return
        try {
            val context = thumbnailView.context
            AiDetectionHelper.appContext = context.applicationContext

            val actualIllust = AiDetectionHelper.unwrapIllust(illust) ?: illust
            val isAi = AiDetectionHelper.isAi(actualIllust)
            val imageView = findMainImageView(thumbnailView)

            if (isAi) {
                val hideCompletely = AiFilterConfig.getHideCompletely(context)
                if (hideCompletely) {
                    thumbnailView.visibility = View.GONE
                } else {
                    thumbnailView.visibility = View.VISIBLE
                    imageView?.alpha = 0.25f
                    showBadge(thumbnailView, context)
                }
            } else {
                thumbnailView.visibility = View.VISIBLE
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
            
            var currentClass: Class<*>? = viewHolder.javaClass
            var itemView: ViewGroup? = null
            while (currentClass != null) {
                try {
                    val field = currentClass.getDeclaredField("itemView")
                    field.isAccessible = true
                    itemView = field.get(viewHolder) as? ViewGroup
                    if (itemView != null) break
                } catch (_: Exception) {
                }
                currentClass = currentClass.superclass
            }
            if (itemView == null) return

            val context = itemView.context
            val actualIllust = AiDetectionHelper.unwrapIllust(illust) ?: illust
            val isAi = AiDetectionHelper.isAi(actualIllust)

            var position = -1
            try {
                val getAdapterPos = viewHolder.javaClass.getMethod("getAbsoluteAdapterPosition")
                position = getAdapterPos.invoke(viewHolder) as Int
            } catch (_: Exception) {
                try {
                    val getLayoutPos = viewHolder.javaClass.getMethod("getLayoutPosition")
                    position = getLayoutPos.invoke(viewHolder) as Int
                } catch (_: Exception) {}
            }

            var banner = itemView.findViewWithTag<View>(TAG_DETAIL_AI_BANNER)
            val imgResId = context.resources.getIdentifier("image_view", "id", context.packageName)
            val imageView = if (imgResId != 0) itemView.findViewById<View>(imgResId) else null

            if (!isAi || position != 0) {
                banner?.visibility = View.GONE
                itemView.setPadding(0, 0, 0, 0)
                return
            }

            // Dedicated header area above the image:
            // Toolbar (56dp) + status bar (~32dp) + banner (~34dp) + breathing margins
            val headerSpace = dpToPx(context, 102f).toInt()
            itemView.setPadding(0, headerSpace, 0, 0)
            itemView.clipToPadding = false

            // Position banner within the header gap, safely below the toolbar icons
            val bannerOffsetFromTop = -headerSpace + dpToPx(context, 58f).toInt()

            if (banner == null) {
                banner = createInlineWarningBanner(context)
                val lp = android.widget.FrameLayout.LayoutParams(
                    android.view.ViewGroup.LayoutParams.WRAP_CONTENT,
                    android.view.ViewGroup.LayoutParams.WRAP_CONTENT
                ).apply {
                    gravity = Gravity.TOP or Gravity.CENTER_HORIZONTAL
                    topMargin = bannerOffsetFromTop
                }
                itemView.addView(banner, lp)
            } else {
                val lp = banner.layoutParams as? android.widget.FrameLayout.LayoutParams
                if (lp != null && lp.topMargin != bannerOffsetFromTop) {
                    lp.topMargin = bannerOffsetFromTop
                    banner.layoutParams = lp
                }
            }

            banner.visibility = View.VISIBLE
            banner.bringToFront()
        } catch (e: Throwable) {
            e.printStackTrace()
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
            AiDetectionHelper.appContext = context.applicationContext
            app.morphe.extension.pixiv.premium.HistoryHelper.recordView(actualIllust)

            // Cache current detail bitmap for instant fullscreen placeholder
            view.post {
                try {
                    val root = view.rootView
                    val imgResId = context.resources.getIdentifier("image_view", "id", context.packageName)
                    val iv = if (imgResId != 0) root?.findViewById<ImageView>(imgResId) else null
                    if (iv != null) {
                        val grab = {
                            val d = iv.drawable
                            if (d is BitmapDrawable && d.bitmap != null && !d.bitmap.isRecycled) {
                                app.morphe.extension.pixiv.viewer.EnhancedViewerHelper.setCachedDetailBitmap(d.bitmap, actualIllust)
                            }
                        }
                        grab()
                        iv.addOnLayoutChangeListener { _, _, _, _, _, _, _, _, _ -> grab() }
                    }
                } catch (_: Throwable) {
                }
            }

            // 1. Maintain title pill metadata in bottom bar
            val resId = context.resources.getIdentifier("title_text_view", "id", context.packageName)
            val titleView = if (resId != 0) {
                view.findViewById<TextView>(resId)
            } else {
                view as? TextView
            }

            if (titleView != null) {
                val parentLayout = titleView.parent as? ViewGroup
                if (parentLayout != null) {
                    val rowTag = "morphe_title_row"
                    var titleRow = parentLayout.findViewWithTag<LinearLayout>(rowTag)

                    if (titleRow == null) {
                        if (parentLayout is LinearLayout && parentLayout.orientation == LinearLayout.VERTICAL) {
                            val titleIdx = parentLayout.indexOfChild(titleView)
                            if (titleIdx >= 0) {
                                parentLayout.removeView(titleView)
                                titleRow = LinearLayout(context).apply {
                                    tag = rowTag
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

            // 2. Display prominent full-width warning banner below toolbar
            // showDetailAiBanner(view, actualIllust, isAi) // Replaced by inline banner above page 0
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

    private fun showDetailAiBanner(anchorView: View, illust: Any?, isAi: Boolean) {
        val coordinator = findCoordinatorLayout(anchorView)
            ?: (anchorView.rootView as? ViewGroup)
            ?: (anchorView.context as? Activity)?.findViewById(android.R.id.content)
            ?: return

        var banner = coordinator.findViewWithTag<View>(TAG_DETAIL_AI_BANNER)
        val context = coordinator.context
        val currentIllustId = getIllustId(illust)

        if (!isAi) {
            banner?.visibility = View.GONE
            return
        }

        // If the user manually dismissed the banner on this artwork, respect their decision
        if (currentIllustId != null && currentIllustId == dismissedIllustId) {
            banner?.visibility = View.GONE
            return
        }

        if (banner == null) {
            banner = createWarningBanner(context) {
                if (currentIllustId != null) {
                    dismissedIllustId = currentIllustId
                }
            }
            coordinator.addView(banner)
        }

        banner.visibility = View.VISIBLE
        banner.alpha = 1f
        banner.bringToFront()

        val toolbar = findToolbar(coordinator)
        if (toolbar != null) {
            fun updatePosition() {
                val top = if (toolbar.bottom > 0) toolbar.bottom else (toolbar.top + toolbar.height)
                if (top > 0) {
                    banner.translationY = top.toFloat()
                }
            }

            updatePosition()
            toolbar.post { updatePosition() }

            val existingListener = banner.getTag(RES_ID_TOOLBAR) as? View.OnLayoutChangeListener
            if (existingListener != null) {
                toolbar.removeOnLayoutChangeListener(existingListener)
            }
            val newListener = View.OnLayoutChangeListener { _, _, _, _, _, _, _, _, _ ->
                updatePosition()
            }
            banner.setTag(RES_ID_TOOLBAR, newListener)
            toolbar.addOnLayoutChangeListener(newListener)
        } else {
            banner.translationY = dpToPx(context, 80f)
        }
    }

    private fun createWarningBanner(context: Context, onDismiss: () -> Unit): View {
        val banner = RelativeLayout(context).apply {
            tag = TAG_DETAIL_AI_BANNER
            val padH = dpToPx(context, 16f).toInt()
            val padV = dpToPx(context, 9f).toInt()
            setPadding(padH, padV, padH, padV)

            // Deep warning red with high contrast (~94% opacity)
            val bg = GradientDrawable().apply {
                shape = GradientDrawable.RECTANGLE
                setColor(0xF0B91C1C.toInt())
            }
            background = bg

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                elevation = dpToPx(context, 4f)
            }

            layoutParams = ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
            )
        }

        // Centered warning text: "⚠ AI-Generated Work"
        val textView = TextView(context).apply {
            text = "⚠  AI-Generated Work"
            textSize = 13.5f
            typeface = Typeface.DEFAULT_BOLD
            setTextColor(Color.WHITE)
            gravity = Gravity.CENTER
            includeFontPadding = false
            setShadowLayer(dpToPx(context, 1.5f), 0f, dpToPx(context, 1f), 0x80000000.toInt())

            val lp = RelativeLayout.LayoutParams(
                RelativeLayout.LayoutParams.WRAP_CONTENT,
                RelativeLayout.LayoutParams.WRAP_CONTENT
            ).apply {
                addRule(RelativeLayout.CENTER_IN_PARENT)
            }
            layoutParams = lp
        }
        banner.addView(textView)

        // Dismiss '✕' button on the far right
        val closeButton = TextView(context).apply {
            text = "✕"
            textSize = 14f
            typeface = Typeface.DEFAULT_BOLD
            setTextColor(0xCCFFFFFF.toInt())
            val p = dpToPx(context, 6f).toInt()
            setPadding(p, p, p, p)

            val lp = RelativeLayout.LayoutParams(
                RelativeLayout.LayoutParams.WRAP_CONTENT,
                RelativeLayout.LayoutParams.WRAP_CONTENT
            ).apply {
                addRule(RelativeLayout.ALIGN_PARENT_END)
                addRule(RelativeLayout.CENTER_VERTICAL)
            }
            layoutParams = lp

            setOnClickListener {
                onDismiss()
                banner.animate()
                    .alpha(0f)
                    .setDuration(150)
                    .withEndAction { banner.visibility = View.GONE }
                    .start()
            }
        }
        banner.addView(closeButton)

        return banner
    }

    private fun findCoordinatorLayout(view: View): ViewGroup? {
        var curr: View? = view
        while (curr != null) {
            val parent = curr.parent
            if (parent is ViewGroup) {
                if (parent.javaClass.name.contains("CoordinatorLayout")) {
                    return parent
                }
            }
            curr = parent as? View
        }

        val resId = view.context.resources.getIdentifier("illust_detail_view", "id", view.context.packageName)
        if (resId != 0) {
            val found = view.rootView?.findViewById<ViewGroup>(resId)
            if (found != null) return found
        }

        val root = view.rootView as? ViewGroup
        if (root != null) {
            return findViewGroupByClassName(root, "CoordinatorLayout")
        }

        return null
    }

    private fun findViewGroupByClassName(group: ViewGroup, targetSubstring: String): ViewGroup? {
        if (group.javaClass.name.contains(targetSubstring)) return group
        for (i in 0 until group.childCount) {
            val child = group.getChildAt(i)
            if (child is ViewGroup) {
                val found = findViewGroupByClassName(child, targetSubstring)
                if (found != null) return found
            }
        }
        return null
    }

    private fun findToolbar(container: ViewGroup): View? {
        val resId = container.context.resources.getIdentifier("tool_bar", "id", container.context.packageName)
        if (resId != 0) {
            val tb = container.findViewById<View>(resId)
            if (tb != null) return tb
        }
        for (i in 0 until container.childCount) {
            val child = container.getChildAt(i)
            if (child.javaClass.name.contains("Toolbar")) {
                return child
            }
        }
        val rootTb = container.rootView?.findViewById<View>(resId)
        if (rootTb != null) return rootTb

        return null
    }

    private fun getIllustId(illust: Any?): String? {
        if (illust == null) return null
        val actual = AiDetectionHelper.unwrapIllust(illust) ?: illust
        return runCatching {
            val m = actual.javaClass.getMethod("getId")
            m.invoke(actual)?.toString()
        }.getOrNull() ?: runCatching {
            var c: Class<*>? = actual.javaClass
            var f: java.lang.reflect.Field? = null
            while (c != null && f == null) {
                f = runCatching { c.getDeclaredField("id") }.getOrNull()
                c = c.superclass
            }
            f?.apply { isAccessible = true }?.get(actual)?.toString()
        }.getOrNull()
    }

    private fun findMainImageView(viewGroup: ViewGroup): ImageView? {
        val context = viewGroup.context
        val resId = context.resources.getIdentifier("image_view", "id", context.packageName)
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

    private fun dpToPx(context: Context, dp: Float): Float {
        return TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP,
            dp,
            context.resources.displayMetrics
        )
    }
}
