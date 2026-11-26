package com.sarp.tiktokliquidglass

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.graphics.Rect
import android.os.Build
import android.util.TypedValue
import android.view.SurfaceView
import android.view.TextureView
import android.view.View
import android.view.ViewGroup
import android.view.WindowInsets
import android.widget.AbsListView
import android.widget.Button
import android.widget.EditText
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.ScrollView
import android.widget.SeekBar
import android.widget.TabHost
import android.widget.TextView
import kotlin.math.max
import kotlin.math.roundToInt

/**
 * Version-resilient View discovery layer compatible with both stock TikTok and TikTok You.
 * Uses known obfuscated resource IDs as fast-paths and structural/type/geometry heuristics
 * as fallbacks so UI injection survives app updates.
 */
object TikTokViewResolver {

    const val TAG_MERGEN_MANAGED_VIEW = 0x53415260
    private const val TAG_SCROLL_ORIG_PAD = 0x53415290
    private const val TAG_SCROLL_ORIG_CLIP = 0x53415291

    @Volatile
    private var cachedTtYouAvailable: Boolean? = null

    fun dp(context: Context, value: Float): Float =
        TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value, context.resources.displayMetrics)

    fun isSettingsActivity(activity: Activity): Boolean {
        val cls = activity.javaClass
        val fullName = cls.name
        if (fullName == "com.ss.android.ugc.aweme.setting.ui.SettingContainerActivity") return true
        return fullName.contains(".setting.") && cls.simpleName.contains("SettingContainer")
    }

    fun isTikTokYouAvailable(context: Context): Boolean {
        cachedTtYouAvailable?.let { return it }
        val available = try {
            val intent = Intent().setClassName(context.packageName, "Z.sf")
            context.packageManager.resolveActivity(intent, 0) != null
        } catch (_: Throwable) {
            false
        }
        cachedTtYouAvailable = available
        return available
    }

    fun statusBarTopInset(activity: Activity, decor: View): Int {
        val raw = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            decor.rootWindowInsets?.getInsets(WindowInsets.Type.statusBars())?.top ?: 0
        } else {
            @Suppress("DEPRECATION")
            decor.rootWindowInsets?.systemWindowInsetTop ?: 0
        }
        return max(raw, dp(activity, 24f).roundToInt())
    }

    fun navBarBottomInset(decor: View): Int {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            decor.rootWindowInsets?.getInsets(WindowInsets.Type.navigationBars())?.bottom ?: 0
        } else {
            @Suppress("DEPRECATION")
            decor.rootWindowInsets?.systemWindowInsetBottom ?: 0
        }
    }

    fun findFragmentTabHost(root: View): ViewGroup? {
        findExactFragmentTabHost(root)?.let { return it }
        return findStructuralTabHost(root)
    }

    private fun findExactFragmentTabHost(root: View): ViewGroup? {
        if (root.javaClass.name == "com.ss.android.ugc.aweme.ui.FragmentTabHost" && root is ViewGroup) {
            return root
        }
        if (root is ViewGroup) {
            for (i in 0 until root.childCount) {
                val found = findExactFragmentTabHost(root.getChildAt(i))
                if (found != null) return found
            }
        }
        return null
    }

    private fun findStructuralTabHost(root: View): ViewGroup? {
        if (root !is ViewGroup) return null
        if (root.height > 0 && root.width > 0) {
            var hasContentSibling = false
            var hasBottomTabs = false
            for (i in 0 until root.childCount) {
                val c = root.getChildAt(i)
                if (c is ViewGroup && c.height >= root.height * 0.7f && c.width >= root.width * 0.9f) {
                    hasContentSibling = true
                    if (findStructuralTabContainerRecursive(c, root.context, root.height) != null) {
                        hasBottomTabs = true
                    }
                }
                if (c is ViewGroup && isLikelyTabStrip(c, root.context, root.height)) {
                    hasBottomTabs = true
                }
            }
            if (hasContentSibling && hasBottomTabs) return root
        }
        for (i in 0 until root.childCount) {
            val found = findStructuralTabHost(root.getChildAt(i))
            if (found != null) return found
        }
        return null
    }

    fun findTabContainer(activity: Activity, host: ViewGroup): ViewGroup? {
        val byId = findViewByIdName(activity, host, "onp") as? ViewGroup
        if (byId != null && byId.childCount in 4..6) return byId
        return findStructuralTabContainerRecursive(host, activity, host.height)
    }

    private fun findStructuralTabContainerRecursive(
        group: ViewGroup,
        context: Context,
        hostHeight: Int
    ): ViewGroup? {
        if (isLikelyTabStrip(group, context, hostHeight)) return group
        for (i in 0 until group.childCount) {
            val child = group.getChildAt(i)
            if (child is ViewGroup) {
                val found = findStructuralTabContainerRecursive(child, context, hostHeight)
                if (found != null) return found
            }
        }
        return null
    }

    private fun isLikelyTabStrip(view: ViewGroup, context: Context, hostHeight: Int): Boolean {
        if (view.childCount !in 4..6) return false
        if (hostHeight > 0 && view.top <= hostHeight * 0.65f) return false
        val minH = dp(context, 40f).roundToInt()
        val maxH = dp(context, 100f).roundToInt()
        if (view.height !in minH..maxH) return false
        var clickableCount = 0
        for (i in 0 until view.childCount) {
            if (view.getChildAt(i).isClickable) clickableCount++
        }
        return clickableCount >= 4
    }

    fun findBackdropSource(activity: Activity, barParent: ViewGroup, tabContainer: ViewGroup): View? {
        val byId = findViewByIdName(activity, barParent, "y9d")
        if (byId != null && byId !== tabContainer) return byId

        val tabIdx = barParent.indexOfChild(tabContainer)
        val limit = if (tabIdx > 0) tabIdx else barParent.childCount
        var best: View? = null
        var bestArea = 0L
        for (i in 0 until limit) {
            val child = barParent.getChildAt(i)
            if (child !== tabContainer &&
                child !is LiquidGlassBarView &&
                child.width >= barParent.width * 0.9f &&
                child.height >= barParent.height * 0.7f
            ) {
                val area = child.width.toLong() * child.height.toLong()
                if (area >= bestArea) {
                    best = child
                    bestArea = area
                }
            }
        }
        return best
    }

    fun findVideoSeekBar(activity: Activity, barParent: ViewGroup): View? {
        findViewByIdName(activity, barParent, "video_seek_bar")?.let { return it }
        return findSeekBarFallback(barParent, barParent)
    }

    private fun findSeekBarFallback(view: View, rootExcluded: View): View? {
        if (view !== rootExcluded) {
            if (view is SeekBar || view.javaClass.simpleName.contains("SeekBar", ignoreCase = true)) {
                return view
            }
        }
        if (view is ViewGroup) {
            for (i in 0 until view.childCount) {
                val found = findSeekBarFallback(view.getChildAt(i), rootExcluded)
                if (found != null) return found
            }
        }
        return null
    }

    fun findBottomSpacer(activity: Activity, host: ViewGroup): View? =
        findViewByIdName(activity, host, "cnc")

    fun findBottomChromeBg(
        activity: Activity,
        host: ViewGroup,
        tabContainer: ViewGroup? = null
    ): View? {
        findViewByIdName(activity, host, "ch4")?.let { return it }
        val tc = tabContainer ?: findTabContainer(activity, host) ?: return null
        val barParent = tc.parent as? ViewGroup ?: return null
        val slop = dp(activity, 12f).roundToInt()
        for (i in 0 until barParent.childCount) {
            val child = barParent.getChildAt(i)
            if (child !== tc &&
                child !is LiquidGlassBarView &&
                child.getTag(TAG_MERGEN_MANAGED_VIEW) == null &&
                !child.isClickable &&
                child.height in 1..dp(activity, 120f).roundToInt() &&
                child.top >= tc.top - slop
            ) {
                return child
            }
        }
        return null
    }

    fun findBottomDivider(activity: Activity, host: ViewGroup): View? =
        findViewByIdName(activity, host, "cnj")

    fun findNavBarStrip(activity: Activity, decor: View): View? =
        findViewByIdName(activity, decor, "gsf")

    fun isFeedInteractContainer(view: View, cachedZufId: Int, hostHeight: Int): Boolean {
        if (cachedZufId != 0) {
            return view.id == cachedZufId
        }
        if (view !is ViewGroup) return false
        if (hostHeight > 0 && view.height < hostHeight * 0.7f) return false
        val name = view.javaClass.simpleName
        if (name.contains("InteractCheckDraw", ignoreCase = true)) return true
        if (!name.contains("Interact", ignoreCase = true)) return false
        return !name.contains("Right", ignoreCase = true) &&
            !name.contains("Info", ignoreCase = true) &&
            !name.contains("Bottom", ignoreCase = true) &&
            !name.contains("Item", ignoreCase = true) &&
            !name.contains("Button", ignoreCase = true) &&
            !name.contains("Area", ignoreCase = true) &&
            !name.contains("Tag", ignoreCase = true) &&
            !name.contains("Sticker", ignoreCase = true)
    }

    fun isPlayerContainer(
        activity: Activity,
        view: View,
        cachedPlayerId: Int,
        cachedRohId: Int
    ): Boolean {
        if (cachedPlayerId != 0 || cachedRohId != 0) {
            val id = view.id
            return id != View.NO_ID && (id == cachedPlayerId || id == cachedRohId)
        }
        if (view !is ViewGroup) return false
        val screenW = activity.resources.displayMetrics.widthPixels
        for (i in 0 until view.childCount) {
            val child = view.getChildAt(i)
            if ((child is TextureView || child is SurfaceView) && child.width >= screenW * 0.5f) {
                return true
            }
        }
        return false
    }

    fun isFeedChromeMask(view: View, maskIds: IntArray): Boolean {
        val id = view.id
        if (id == View.NO_ID) return false
        for (maskId in maskIds) {
            if (maskId != 0 && id == maskId) return true
        }
        return false
    }

    fun findViewByIdName(activity: Activity, root: View, name: String): View? {
        val id = activity.resources.getIdentifier(name, "id", activity.packageName)
        return if (id != 0) root.findViewById(id) else null
    }

    data class FeedSearchBanner(
        val containerToHide: View,
        val visibilityAnchor: View,
        val clickTarget: View,
        val fallbackClickTarget: View?,
        val textView: TextView
    )

    fun isWidgetContainer(activity: Activity, view: View, cachedWidgetId: Int): Boolean {
        if (view !is ViewGroup) return false
        if (cachedWidgetId != 0) return view.id == cachedWidgetId
        return findFeedSearchBanner(activity, view) != null && findAuthorRow(activity, view) != null
    }

    fun findFeedSearchBanner(activity: Activity, widgetContainer: ViewGroup): FeedSearchBanner? {
        val vj6 = findViewByIdName(activity, widgetContainer, "vj6") as? TextView
        val iag = findViewByIdName(activity, widgetContainer, "iag")
        if (vj6 != null && iag != null) {
            val ljb = findViewByIdName(activity, widgetContainer, "ljb")
            val exl = findViewByIdName(activity, widgetContainer, "exl")
            val ewb = findViewByIdName(activity, widgetContainer, "ewb")
            return FeedSearchBanner(
                containerToHide = ljb ?: exl ?: ewb ?: iag,
                visibilityAnchor = ewb ?: iag,
                clickTarget = iag,
                fallbackClickTarget = exl,
                textView = vj6
            )
        }

        val zufId = activity.resources.getIdentifier("zuf", "id", activity.packageName)
        val maxBannerH = dp(activity, 64f).roundToInt()
        val minTop = (widgetContainer.height * 0.75f).roundToInt()
        for (i in 0 until widgetContainer.childCount) {
            val child = widgetContainer.getChildAt(i)
            if (zufId != 0 && child.id == zufId) continue
            if (child.height > 0 && child.height <= maxBannerH && child.top >= minTop) {
                val tv = findBannerTextView(child)
                if (tv != null) {
                    val clickable = findFirstClickable(child) ?: child
                    return FeedSearchBanner(
                        containerToHide = child,
                        visibilityAnchor = clickable,
                        clickTarget = clickable,
                        fallbackClickTarget = child,
                        textView = tv
                    )
                }
            }
        }
        return null
    }

    private fun findBannerTextView(view: View): TextView? {
        if (view is TextView) {
            val t = view.text?.toString()?.trim().orEmpty()
            if (t.contains('\u00B7') ||
                t.contains('\u2022') ||
                t.startsWith("Ara ", ignoreCase = true) ||
                t.startsWith("Search ", ignoreCase = true)
            ) {
                return view
            }
        }
        if (view is ViewGroup) {
            for (i in 0 until view.childCount) {
                val found = findBannerTextView(view.getChildAt(i))
                if (found != null) return found
            }
        }
        return null
    }

    private fun findFirstClickable(view: View): View? {
        if (view.isClickable && view is ViewGroup) return view
        if (view is ViewGroup) {
            for (i in 0 until view.childCount) {
                val found = findFirstClickable(view.getChildAt(i))
                if (found != null) return found
            }
        }
        return if (view.isClickable) view else null
    }

    fun findAuthorRow(activity: Activity, widgetContainer: ViewGroup): LinearLayout? {
        val pkg = activity.packageName
        val res = activity.resources
        val titleView = findViewByIdName(activity, widgetContainer, "title")
            ?: findFallbackAuthorTitle(activity, widgetContainer)
            ?: return null

        val exjId = res.getIdentifier("exj", "id", pkg)
        val screenW = res.displayMetrics.widthPixels
        val baseW = if (widgetContainer.width > 0) widgetContainer.width else screenW
        val minRowW = max((baseW * 0.55f).roundToInt(), (screenW * 0.55f).roundToInt())

        var cur: View? = titleView.parent as? View
        var depth = 0
        while (cur != null && cur !== widgetContainer && depth < 5) {
            if (cur is LinearLayout) {
                if (exjId != 0 && cur.id == exjId) {
                    return cur
                }
                if (cur.width >= minRowW &&
                    (cur.orientation == LinearLayout.HORIZONTAL || cur.childCount <= 2)
                ) {
                    return cur
                }
            }
            cur = cur.parent as? View
            depth++
        }
        return null
    }

    private fun findFallbackAuthorTitle(activity: Activity, root: ViewGroup): View? {
        val h = if (root.height > 0) root.height else activity.resources.displayMetrics.heightPixels
        val w = if (root.width > 0) root.width else activity.resources.displayMetrics.widthPixels
        return searchFallbackTitle(root, h, w)
    }

    private fun searchFallbackTitle(view: View, rootH: Int, rootW: Int): View? {
        if ((view is Button || view is TextView) && view.isClickable) {
            if (view.width > 0 && view.left < rootW * 0.5f && view.top > rootH * 0.45f) {
                val txt = (view as TextView).text?.toString()?.trim().orEmpty()
                if (txt.isNotEmpty() && txt.length <= 40) return view
            }
        }
        if (view is ViewGroup) {
            for (i in 0 until view.childCount) {
                val found = searchFallbackTitle(view.getChildAt(i), rootH, rootW)
                if (found != null) return found
            }
        }
        return null
    }

    fun extractSearchQuery(rawText: CharSequence?): String {
        val trimmed = rawText?.toString()?.trim().orEmpty()
        if (trimmed.isEmpty()) return ""
        val dotIdx = trimmed.indexOf('\u00B7')
        val bulletIdx = trimmed.indexOf('\u2022')
        val colonIdx = trimmed.indexOf(':')
        var bestSep = -1
        for (idx in intArrayOf(dotIdx, bulletIdx, colonIdx)) {
            if (idx in 0..14 && (bestSep == -1 || idx < bestSep)) {
                bestSep = idx
            }
        }
        return if (bestSep >= 0) {
            trimmed.substring(bestSep + 1).trim()
        } else {
            trimmed
        }
    }

    fun findOuterHorizontalPager(host: ViewGroup): ViewGroup? {
        val pkg = host.context.packageName
        val vpId = host.resources.getIdentifier("viewpager", "id", pkg)
        var cur: View? = host.parent as? View
        var depth = 0
        while (cur != null && depth < 4) {
            if (cur is ViewGroup) {
                if ((vpId != 0 && cur.id == vpId) ||
                    cur.javaClass.name.contains("ViewPager", ignoreCase = true) ||
                    cur.javaClass.simpleName == "05rH" ||
                    cur.javaClass.simpleName == "05p8"
                ) {
                    return cur
                }
            }
            cur = cur.parent as? View
            depth++
        }
        return null
    }

    fun findActiveWidgetContainer(activity: Activity, root: View): ViewGroup? {
        val widgetId = activity.resources.getIdentifier("widget_container", "id", activity.packageName)
        val screenW = activity.resources.displayMetrics.widthPixels
        val screenH = activity.resources.displayMetrics.heightPixels
        val candidates = ArrayList<ViewGroup>(4)
        collectWidgetContainers(activity, root, widgetId, candidates)
        if (candidates.isEmpty()) return null

        val loc = IntArray(2)
        var best: ViewGroup? = null
        var bestScore = Int.MAX_VALUE
        for (c in candidates) {
            if (!c.isShown || c.width <= 0 || c.height <= 0) continue
            c.getLocationOnScreen(loc)
            if (loc[0] in (-screenW / 3)..(screenW / 3) && loc[1] in (-screenH / 3)..(screenH / 3)) {
                val score = kotlin.math.abs(loc[0]) + kotlin.math.abs(loc[1])
                if (score < bestScore) {
                    best = c
                    bestScore = score
                }
            }
        }
        return best ?: candidates.firstOrNull { it.isShown }
    }

    private fun collectWidgetContainers(
        activity: Activity,
        view: View,
        widgetId: Int,
        out: MutableList<ViewGroup>
    ) {
        if (view is ViewGroup && view.getTag(TAG_MERGEN_MANAGED_VIEW) == null) {
            if (widgetId != 0) {
                if (view.id == widgetId) {
                    out.add(view)
                    return
                }
            } else if (findFeedSearchBanner(activity, view) != null && findAuthorRow(activity, view) != null) {
                out.add(view)
                return
            }
            for (i in 0 until view.childCount) {
                collectWidgetContainers(activity, view.getChildAt(i), widgetId, out)
            }
        }
    }

    fun findMusicButton(activity: Activity, root: View): View? {
        val scope: View = findActiveWidgetContainer(activity, root) ?: root
        findViewByIdName(activity, scope, "pog")?.let { if (it.isShown) return it }
        val block = findViewByIdName(activity, scope, "videomusiccoverblock") as? ViewGroup
        if (block != null) {
            for (i in 0 until block.childCount) {
                val c = block.getChildAt(i)
                if (c is Button && c.isClickable) return c
            }
            val firstClick = findFirstClickable(block)
            if (firstClick != null) return firstClick
        }
        return findViewByIdName(activity, scope, "pog")
    }

    fun findCurrentSoundTitle(activity: Activity, root: View): String? {
        val scope: View = findActiveWidgetContainer(activity, root) ?: root
        val musicBtn = findMusicButton(activity, scope)
        val desc = musicBtn?.contentDescription?.toString()?.trim().orEmpty()
        if (desc.isNotEmpty()) {
            val cleaned = stripSoundPrefix(desc)
            if (cleaned.isNotEmpty()) return cleaned
        }
        val titleBtn = findViewByIdName(activity, scope, "title") as? TextView
        val author = titleBtn?.text?.toString()?.trim().orEmpty()
        return if (author.isNotEmpty()) author else null
    }

    private fun stripSoundPrefix(raw: String): String {
        val colonIdx = raw.indexOf(':')
        if (colonIdx in 1..14) {
            val after = raw.substring(colonIdx + 1).trim()
            if (after.isNotEmpty()) return after
        }
        return raw
    }

    fun findInboxUnreadBadge(activity: Activity, tabContainer: ViewGroup): Int? {
        val inboxTab = (findViewByIdName(activity, tabContainer, "oni") as? ViewGroup)
            ?: (if (tabContainer.childCount >= 4) tabContainer.getChildAt(3) as? ViewGroup else null)
            ?: return null

        return findNumericBadge(inboxTab)
    }

    private fun findNumericBadge(view: View): Int? {
        if (view is TextView && view.visibility == View.VISIBLE) {
            val txt = view.text?.toString()?.trim().orEmpty()
            if (txt.isNotEmpty() && txt.length <= 5 && txt[0].isDigit()) {
                val digits = txt.takeWhile { it.isDigit() }
                return digits.toIntOrNull()
            }
        }
        if (view is ViewGroup) {
            for (i in 0 until view.childCount) {
                val found = findNumericBadge(view.getChildAt(i))
                if (found != null) return found
            }
        }
        return null
    }

    fun findLongPressTarget(activity: Activity, root: View): View? {
        val scope: View = findActiveWidgetContainer(activity, root) ?: root
        findViewByIdName(activity, scope, "long_press_layout")?.let { return it }
        return findByContentDesc(scope, "Video")
    }

    private fun findByContentDesc(view: View, desc: String): View? {
        if (desc.equals(view.contentDescription?.toString(), ignoreCase = true) && view.isLongClickable) {
            return view
        }
        if (view is ViewGroup) {
            for (i in 0 until view.childCount) {
                val found = findByContentDesc(view.getChildAt(i), desc)
                if (found != null) return found
            }
        }
        return null
    }

    fun findTopTabsHeader(activity: Activity, root: View): View? {
        findViewByIdName(activity, root, "uwq")?.let { return it }
        return null
    }

    fun findAncestorTabHost(view: View): TabHost? {
        var cur: View? = view.parent as? View
        var depth = 0
        while (cur != null && depth < 6) {
            if (cur is TabHost) return cur
            cur = cur.parent as? View
            depth++
        }
        return null
    }

    fun findCreateTabIndex(tabContainer: ViewGroup?): Int {
        if (tabContainer == null || tabContainer.childCount < 4) return -1
        val count = tabContainer.childCount
        for (i in 0 until count) {
            val child = tabContainer.getChildAt(i)
            if (child.id != View.NO_ID) {
                val entryName = try {
                    tabContainer.resources.getResourceEntryName(child.id)
                } catch (_: Throwable) {
                    null
                }
                if (entryName == "ond") return i
            }
        }
        if (count == 5) {
            var tvCount = 0
            var noTvIdx = -1
            for (i in 0 until count) {
                if (containsTextView(tabContainer.getChildAt(i))) {
                    tvCount++
                } else if (noTvIdx < 0) {
                    noTvIdx = i
                }
            }
            if (tvCount >= 3 && noTvIdx >= 0) {
                return noTvIdx
            }
            return 2
        }
        return -1
    }

    private fun containsTextView(view: View): Boolean {
        if (view is TextView) return true
        if (view is ViewGroup) {
            for (i in 0 until view.childCount) {
                if (containsTextView(view.getChildAt(i))) return true
            }
        }
        return false
    }

    fun getSelectedTabIndex(tabContainer: ViewGroup?): Int {
        if (tabContainer == null) return -1
        val createIdx = findCreateTabIndex(tabContainer)
        for (i in 0 until tabContainer.childCount) {
            if (i == createIdx) continue
            if (tabContainer.getChildAt(i).isSelected) return i
        }
        return -1
    }

    fun getActiveTabIndex(host: ViewGroup?, tabContainer: ViewGroup?): Int {
        val selected = getSelectedTabIndex(tabContainer)
        if (selected >= 0) return selected

        val count = tabContainer?.childCount ?: 0
        val th = (host as? TabHost) ?: (tabContainer?.let { findAncestorTabHost(it) })
        val tag = getActiveTabTag(th)?.uppercase()
        if (!tag.isNullOrEmpty()) {
            when (tag) {
                "HOME", "FEED" -> return 0
                "FRIENDS", "FOLLOW", "FAMILIAR" -> return if (count > 1) 1 else 0
                "NOTIFICATION", "INBOX" -> return if (count >= 5) 3 else (count - 2).coerceAtLeast(0)
                "USER", "PROFILE", "ME", "MY_PROFILE" -> return if (count > 0) count - 1 else 4
            }
        }

        if (th != null && th.currentTab >= 0) {
            val hostTab = th.currentTab
            val createIdx = findCreateTabIndex(tabContainer)
            if (count > 0 && createIdx in 0 until count && hostTab >= createIdx) {
                return (hostTab + 1).coerceAtMost(count - 1)
            }
            return if (count > 0) hostTab.coerceIn(0, count - 1) else hostTab
        }
        return -1
    }

    fun getActiveTabTag(host: ViewGroup?): String? =
        (host as? TabHost)?.currentTabTag

    fun isFeedOverlaySheetOpen(activity: Activity, decor: View, host: ViewGroup? = null): Boolean {
        if (PeekSheetAndProfileController.isInPeekState(activity)) return true
        val resolvedHost = host ?: findFragmentTabHost(decor)
        val outerPager = resolvedHost?.let { findOuterHorizontalPager(it) }
        if (outerPager != null && outerPager.scrollX > dp(activity, 8f)) {
            return true
        }

        val screenW = activity.resources.displayMetrics.widthPixels
        val screenH = activity.resources.displayMetrics.heightPixels

        try {
            val wmgClass = Class.forName("android.view.WindowManagerGlobal")
            val wmg = wmgClass.getMethod("getInstance").invoke(null)
            val mViewsField = wmgClass.getDeclaredField("mViews").apply { isAccessible = true }
            @Suppress("UNCHECKED_CAST")
            val views = mViewsField.get(wmg) as? List<View>
            if (views != null) {
                for (i in views.indices.reversed()) {
                    val v = views[i]
                    if (v === decor || !v.isShown || v.getTag(TAG_MERGEN_MANAGED_VIEW) != null) continue
                    val clsName = v.javaClass.name
                    if (v is ViewGroup &&
                        v.width >= screenW * 0.75f &&
                        v.height >= screenH * 0.22f &&
                        (clsName.contains("DecorView") || clsName.contains("PopupDecorView") || clsName.contains("Dialog"))
                    ) {
                        return true
                    }
                }
            }
        } catch (_: Throwable) {
        }

        val designSheetId = activity.resources.getIdentifier("design_bottom_sheet", "id", activity.packageName)
        return scanOverlaySheetInTree(
            activity = activity,
            view = decor,
            designSheetId = designSheetId,
            screenW = screenW,
            screenH = screenH,
            isRoot = true
        )
    }

    private fun scanOverlaySheetInTree(
        activity: Activity,
        view: View,
        designSheetId: Int,
        screenW: Int,
        screenH: Int,
        isRoot: Boolean
    ): Boolean {
        if (!view.isShown || view.getTag(TAG_MERGEN_MANAGED_VIEW) != null) return false
        if (view is EditText && view.width > 0 && view.height > 0) {
            return true
        }
        if (view is ViewGroup && !isRoot && view.width >= screenW * 0.75f && view.height >= screenH * 0.22f) {
            if (designSheetId != 0 && view.id == designSheetId) {
                return true
            }
            if (view.id != View.NO_ID) {
                val entryName = try {
                    activity.resources.getResourceEntryName(view.id)
                } catch (_: Throwable) {
                    null
                }
                if (entryName != null && entryName.contains("comment", ignoreCase = true)) {
                    return true
                }
            }
            val clsName = view.javaClass.name
            if (clsName.contains("Comment", ignoreCase = true) ||
                clsName.contains("BottomSheet", ignoreCase = true) ||
                clsName.contains("TuxSheet", ignoreCase = true) ||
                clsName.contains("SharePanel", ignoreCase = true)
            ) {
                return true
            }
            if (view.parent?.javaClass?.name?.contains("CoordinatorLayout", ignoreCase = true) == true &&
                view.top > screenH * 0.10f &&
                view.height < screenH * 0.96f
            ) {
                return true
            }
        }
        if (view is ViewGroup) {
            for (i in 0 until view.childCount) {
                if (scanOverlaySheetInTree(activity, view.getChildAt(i), designSheetId, screenW, screenH, isRoot = false)) {
                    return true
                }
            }
        }
        return false
    }

    fun isOwnProfileActive(
        activity: Activity,
        decor: View,
        tabContainer: ViewGroup? = null
    ): Boolean {
        val host = findFragmentTabHost(decor)
        val tag = getActiveTabTag(host)?.uppercase()
        if (tag == "USER" || tag == "PROFILE" || tag == "ME" || tag == "MY_PROFILE") {
            return true
        }

        val tc = tabContainer ?: host?.let { findTabContainer(activity, it) }
        val activeIdx = getActiveTabIndex(host, tc)
        if (activeIdx >= 4) return true

        val glassIdx = LiquidGlassController.getAttachedGlassBar(activity)?.getActiveTabIndex() ?: -1
        if (glassIdx >= 4 && activeIdx < 0) return true

        val activeFeed = findActiveWidgetContainer(activity, decor)
        if (activeFeed == null && hasOwnProfileMarker(activity, decor)) {
            return true
        }
        return false
    }

    fun isOnFeedTab(
        activity: Activity,
        decor: View,
        tabContainer: ViewGroup? = null
    ): Boolean {
        if (isOwnProfileActive(activity, decor, tabContainer)) return false
        val host = findFragmentTabHost(decor)
        val tag = getActiveTabTag(host)?.uppercase()
        if (!tag.isNullOrEmpty()) {
            if (tag == "HOME" || tag == "FEED" || tag == "FRIENDS" || tag == "FOLLOW" || tag == "FAMILIAR") {
                return true
            }
            if (tag == "NOTIFICATION" || tag == "INBOX" || tag == "PUBLISH") {
                return false
            }
        }
        val tc = tabContainer ?: host?.let { findTabContainer(activity, it) }
        val activeIdx = getActiveTabIndex(host, tc)
        if (activeIdx >= 0) return activeIdx == 0 || activeIdx == 1
        val glassIdx = LiquidGlassController.getAttachedGlassBar(activity)?.getActiveTabIndex() ?: -1
        if (glassIdx >= 0) return glassIdx == 0 || glassIdx == 1
        return findActiveWidgetContainer(activity, decor)?.isShown == true
    }

    private fun hasOwnProfileMarker(activity: Activity, decor: View): Boolean {
        findViewByIdName(activity, decor, "edit_profile")?.let {
            if (it.isShown) return true
        }
        return containsVisibleExactOrStartsWith(decor, arrayOf("Profili düzenle", "Edit profile"))
    }

    private fun containsVisibleExactOrStartsWith(view: View, queries: Array<String>): Boolean {
        if (!view.isShown) return false
        if (view is TextView) {
            val txt = view.text?.toString()?.trim().orEmpty()
            if (txt.isNotEmpty() && txt.length <= 28) {
                for (q in queries) {
                    if (txt.equals(q, ignoreCase = true) || txt.startsWith(q, ignoreCase = true)) {
                        return true
                    }
                }
            }
        }
        if (view is ViewGroup && view.getTag(TAG_MERGEN_MANAGED_VIEW) == null) {
            for (i in 0 until view.childCount) {
                if (containsVisibleExactOrStartsWith(view.getChildAt(i), queries)) return true
            }
        }
        return false
    }

    fun findAuthorTitleView(activity: Activity, widgetContainer: ViewGroup): View? {
        findViewByIdName(activity, widgetContainer, "title")?.let { if (it.isShown) return it }
        return findFallbackAuthorTitle(activity, widgetContainer)
    }

    fun findCreatorAvatarView(activity: Activity, widgetContainer: ViewGroup): ImageView? {
        val candidateNames = arrayOf("user_avatar", "avatar", "avatar_iv", "h8l", "o6o")
        for (name in candidateNames) {
            val v = findViewByIdName(activity, widgetContainer, name)
            if (v is ImageView && v.isShown && v.width > 0 && v.height > 0 && v.drawable != null) {
                return v
            }
        }
        val screenW = activity.resources.displayMetrics.widthPixels
        val screenH = activity.resources.displayMetrics.heightPixels
        val minSize = dp(activity, 36f).roundToInt()
        val maxSize = dp(activity, 70f).roundToInt()
        val loc = IntArray(2)
        var best: ImageView? = null
        var bestTop = Int.MAX_VALUE

        fun scan(v: View) {
            if (!v.isShown || v.getTag(TAG_MERGEN_MANAGED_VIEW) != null) return
            if (v is ImageView && v.drawable != null) {
                val w = v.width
                val h = v.height
                if (w in minSize..maxSize && h in minSize..maxSize && kotlin.math.abs(w - h) <= dp(activity, 10f)) {
                    v.getLocationOnScreen(loc)
                    if (loc[0] >= (screenW * 0.72f).roundToInt() &&
                        loc[1] in (screenH * 0.22f).roundToInt()..(screenH * 0.70f).roundToInt()
                    ) {
                        if (loc[1] < bestTop) {
                            bestTop = loc[1]
                            best = v
                        }
                    }
                }
            }
            if (v is ViewGroup) {
                for (i in 0 until v.childCount) {
                    scan(v.getChildAt(i))
                }
            }
        }
        scan(widgetContainer)
        return best
    }

    fun findCreatorAvatarBounds(activity: Activity, decor: View, padDp: Float = 18f): Rect? {
        val widget = findActiveWidgetContainer(activity, decor) ?: return null
        val avatar = findCreatorAvatarView(activity, widget) ?: return null
        if (!avatar.isShown || avatar.width <= 0 || avatar.height <= 0) return null
        val loc = IntArray(2)
        avatar.getLocationOnScreen(loc)
        val pad = dp(activity, padDp).roundToInt()
        return Rect(
            loc[0] - pad,
            loc[1] - pad,
            loc[0] + avatar.width + pad,
            loc[1] + avatar.height + pad
        )
    }

    fun findFeedFollowButton(activity: Activity, widgetContainer: ViewGroup): View? {
        for (name in arrayOf("follow", "follow_btn", "h8m", "o6p")) {
            findViewByIdName(activity, widgetContainer, name)?.let {
                if (it.isShown && it.isClickable) return it
            }
        }
        val avatar = findCreatorAvatarView(activity, widgetContainer) ?: return null
        val avLoc = IntArray(2)
        avatar.getLocationOnScreen(avLoc)
        val avBottom = avLoc[1] + avatar.height
        val screenW = activity.resources.displayMetrics.widthPixels
        val maxBtnSize = dp(activity, 44f).roundToInt()
        val loc = IntArray(2)

        fun scan(v: View): View? {
            if (!v.isShown || v === avatar || v.getTag(TAG_MERGEN_MANAGED_VIEW) != null) return null
            if (v.isClickable && v.width in 12..maxBtnSize && v.height in 12..maxBtnSize) {
                v.getLocationOnScreen(loc)
                val cx = loc[0] + v.width / 2
                val cy = loc[1] + v.height / 2
                if (cx >= (screenW * 0.72f).roundToInt() &&
                    cy in (avBottom - dp(activity, 16f).roundToInt())..(avBottom + dp(activity, 26f).roundToInt())
                ) {
                    return v
                }
            }
            if (v is ViewGroup) {
                for (i in 0 until v.childCount) {
                    scan(v.getChildAt(i))?.let { return it }
                }
            }
            return null
        }
        return scan(widgetContainer)
    }

    fun findFeedShareButton(activity: Activity, widgetContainer: ViewGroup): View? {
        for (name in arrayOf("share", "share_btn", "share_container")) {
            findViewByIdName(activity, widgetContainer, name)?.let {
                if (it.isShown) return findClickableSelfOrAncestor(it) ?: it
            }
        }
        return findShareByContentDesc(widgetContainer)
    }

    private fun findShareByContentDesc(view: View): View? {
        if (!view.isShown || view.getTag(TAG_MERGEN_MANAGED_VIEW) != null) return null
        val desc = view.contentDescription?.toString()?.trim().orEmpty()
        if (desc.isNotEmpty() && desc.length <= 42 &&
            (desc.contains("Paylaş", ignoreCase = true) || desc.contains("Share", ignoreCase = true))
        ) {
            return findClickableSelfOrAncestor(view) ?: view
        }
        if (view is ViewGroup) {
            for (i in 0 until view.childCount) {
                findShareByContentDesc(view.getChildAt(i))?.let { return it }
            }
        }
        return null
    }

    fun applyBottomClearanceToScrollables(root: View, bottomPadPx: Int) {
        val minHeight = (root.height * 0.35f).roundToInt()
        walkApplyScrollableClearance(root, bottomPadPx, minHeight)
    }

    private fun walkApplyScrollableClearance(view: View, bottomPadPx: Int, minHeight: Int) {
        if (!view.isShown || view.getTag(TAG_MERGEN_MANAGED_VIEW) != null) return
        if (view is ViewGroup && view.height >= minHeight && isScrollableContainer(view)) {
            if (view.getTag(TAG_SCROLL_ORIG_PAD) == null) {
                view.setTag(TAG_SCROLL_ORIG_PAD, view.paddingBottom)
                view.setTag(TAG_SCROLL_ORIG_CLIP, view.clipToPadding)
            }
            val origPad = (view.getTag(TAG_SCROLL_ORIG_PAD) as? Int) ?: 0
            val targetPad = max(origPad, bottomPadPx)
            if (view.clipToPadding) {
                view.clipToPadding = false
            }
            if (view.paddingBottom < targetPad) {
                view.setPadding(view.paddingLeft, view.paddingTop, view.paddingRight, targetPad)
            }
        }
        if (view is ViewGroup) {
            for (i in 0 until view.childCount) {
                walkApplyScrollableClearance(view.getChildAt(i), bottomPadPx, minHeight)
            }
        }
    }

    fun restoreBottomClearanceFromScrollables(view: View) {
        val origPad = view.getTag(TAG_SCROLL_ORIG_PAD) as? Int
        if (origPad != null && view is ViewGroup) {
            view.setPadding(view.paddingLeft, view.paddingTop, view.paddingRight, origPad)
            view.clipToPadding = (view.getTag(TAG_SCROLL_ORIG_CLIP) as? Boolean) ?: true
            view.setTag(TAG_SCROLL_ORIG_PAD, null)
            view.setTag(TAG_SCROLL_ORIG_CLIP, null)
        }
        if (view is ViewGroup) {
            for (i in 0 until view.childCount) {
                restoreBottomClearanceFromScrollables(view.getChildAt(i))
            }
        }
    }

    private fun isScrollableContainer(v: ViewGroup): Boolean {
        if (v is ScrollView || v is AbsListView) return true
        return hasClassNamed(v.javaClass, "RecyclerView") ||
            hasClassNamed(v.javaClass, "NestedScrollView")
    }

    private fun hasClassNamed(cls: Class<*>?, simpleTarget: String): Boolean {
        var c = cls
        var depth = 0
        while (c != null && depth < 5) {
            if (c.simpleName.equals(simpleTarget, ignoreCase = true)) return true
            c = c.superclass
            depth++
        }
        return false
    }

    fun findVerticalViewPager(root: View): ViewGroup? {
        if (root is ViewGroup) {
            val name = root.javaClass.name
            val simple = root.javaClass.simpleName
            if (name == "com.ss.android.ugc.aweme.common.widget.VerticalViewPager" ||
                simple.contains("VerticalViewPager", ignoreCase = true)
            ) {
                return root
            }
            for (i in 0 until root.childCount) {
                findVerticalViewPager(root.getChildAt(i))?.let { return it }
            }
        }
        return null
    }

    fun findNotInterestedInAnyWindow(activity: Activity): View? =
        findMenuActionInAnyWindow(activity, arrayOf("İlgilenmiyorum", "Not interested"))

    fun findSaveVideoInAnyWindow(activity: Activity): View? =
        findMenuActionInAnyWindow(activity, arrayOf("Videoyu kaydet", "Save video", "İndir", "Download"))

    fun findPlaybackSpeedInAnyWindow(activity: Activity): View? =
        findMenuActionInAnyWindow(activity, arrayOf("Oynatma hızı", "Playback speed", "Hız", "Speed"))

    fun findMenuActionInAnyWindow(activity: Activity, labels: Array<String>): View? {
        activity.window?.decorView?.let { decor ->
            findMenuActionInTree(decor, labels)?.let { return it }
        }
        try {
            val wmgClass = Class.forName("android.view.WindowManagerGlobal")
            val getInstance = wmgClass.getMethod("getInstance")
            val wmg = getInstance.invoke(null)
            val mViewsField = wmgClass.getDeclaredField("mViews").apply { isAccessible = true }
            @Suppress("UNCHECKED_CAST")
            val views = mViewsField.get(wmg) as? List<View>
            if (views != null) {
                for (i in views.indices.reversed()) {
                    val v = views[i]
                    if (v.isShown) {
                        findMenuActionInTree(v, labels)?.let { return it }
                    }
                }
            }
        } catch (_: Throwable) {
        }
        return null
    }

    fun findNotInterestedButton(root: View): View? =
        findMenuActionInTree(root, arrayOf("İlgilenmiyorum", "Not interested"))

    fun findMenuActionInTree(root: View, labels: Array<String>): View? {
        if (!root.isShown || root.getTag(TAG_MERGEN_MANAGED_VIEW) != null) return null
        if (root is TextView) {
            val txt = root.text?.toString()?.trim().orEmpty()
            if (txt.isNotEmpty() && txt.length <= 36) {
                for (label in labels) {
                    if (txt.equals(label, ignoreCase = true) || txt.contains(label, ignoreCase = true)) {
                        return findClickableSelfOrAncestor(root) ?: root
                    }
                }
            }
        }
        val desc = root.contentDescription?.toString()?.trim().orEmpty()
        if (desc.isNotEmpty() && desc.length <= 42) {
            for (label in labels) {
                if (desc.contains(label, ignoreCase = true)) {
                    return findClickableSelfOrAncestor(root) ?: root
                }
            }
        }
        if (root is ViewGroup) {
            for (i in 0 until root.childCount) {
                findMenuActionInTree(root.getChildAt(i), labels)?.let { return it }
            }
        }
        return null
    }

    private fun findClickableSelfOrAncestor(view: View): View? {
        var cur: View? = view
        var depth = 0
        while (cur != null && depth < 5) {
            if (cur.isClickable) return cur
            cur = cur.parent as? View
            depth++
        }
        return null
    }
}
