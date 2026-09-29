package app.morphe.extension.pixiv.navigation

import android.app.Activity
import android.content.Intent
import android.content.res.ColorStateList
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.util.TypedValue
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.view.WindowInsets
import android.widget.FrameLayout
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.TextView

object PersistentNavHelper {

    private const val TAG = "PixivNav"

    const val TAG_PERSISTENT_NAV = "morphe_persistent_bottom_nav"
    const val TAB_HOME = 0
    const val TAB_SEARCH = 1
    const val TAB_NEW = 2
    const val TAB_NOTIFICATIONS = 3
    const val TAB_MYPAGE = 4

    const val RES_MENU_BOTTOM_NAV = 0x7f0f0001
    const val RES_COLOR_BOTTOM_NAV = 0x7f060039
    const val RES_ID_AD_CONTAINER = 0x7f0a004f
    const val RES_ID_BOTTOM_NAV = 0x7f0a00c0
    const val RES_ID_HOME = 0x7f0a0212
    const val RES_ID_SEARCH = 0x7f0a04e1
    const val RES_ID_NEW = 0x7f0a03fd
    const val RES_ID_NOTIFICATIONS = 0x7f0a0410
    const val RES_ID_MYPAGE = 0x7f0a03e7

    data class TabInfo(
        val index: Int,
        val resId: Int,
        val drawableName: String,
        val stringName: String,
        val defaultTitle: String
    )

    private val TABS = listOf(
        TabInfo(TAB_HOME, RES_ID_HOME, "bottom_navigation_home_icon", "core_string_home", "Home"),
        TabInfo(TAB_SEARCH, RES_ID_SEARCH, "feature_component_ic_search", "core_string_search", "Search"),
        TabInfo(TAB_NEW, RES_ID_NEW, "bottom_navigation_newest_icon", "new_works_title", "New"),
        TabInfo(TAB_NOTIFICATIONS, RES_ID_NOTIFICATIONS, "bottom_navigation_notifications_icon", "core_string_notifications", "Notifications"),
        TabInfo(TAB_MYPAGE, RES_ID_MYPAGE, "bottom_navigation_mypage_icon", "my_page_title", "My Page")
    )

    @JvmStatic
    fun attachBottomNav(activity: Activity?) {
        attachBottomNav(activity, -1)
    }

    @JvmStatic
    fun attachBottomNav(activity: Activity?, currentTabId: Int) {
        if (activity == null) return
        try {
            if (!isEligibleActivity(activity)) return

            val handler = Handler(Looper.getMainLooper())
            handler.post {
                try {
                    doAttachBottomNav(activity, currentTabId)
                } catch (t: Throwable) {
                    Log.e(TAG, "Error in doAttachBottomNav", t)
                }
            }
        } catch (t: Throwable) {
            Log.e(TAG, "Error in attachBottomNav", t)
        }
    }

    private fun doAttachBottomNav(activity: Activity, currentTabId: Int) {
        if (activity.isFinishing || activity.isDestroyed) return

        val contentView = activity.findViewById<ViewGroup>(android.R.id.content) ?: return

        // Prevent duplicate injection
        if (contentView.findViewWithTag<View>(TAG_PERSISTENT_NAV) != null) {
            Log.d(TAG, "Persistent nav already attached in ${activity.javaClass.simpleName}")
            return
        }

        // Find ad_container slot if present in the activity layout
        var adContainer = activity.findViewById<ViewGroup>(RES_ID_AD_CONTAINER)
        if (adContainer == null) {
            val resId = activity.resources.getIdentifier("ad_container", "id", activity.packageName)
            if (resId != 0) adContainer = activity.findViewById(resId)
        }

        val navView = createBottomNavView(activity, currentTabId) ?: run {
            Log.e(TAG, "createBottomNavView returned null")
            return
        }

        if (adContainer != null) {
            Log.d(TAG, "Attaching persistent nav into ad_container in ${activity.javaClass.simpleName}")
            adContainer.visibility = View.VISIBLE
            adContainer.setBackgroundColor(android.graphics.Color.TRANSPARENT)
            val lp = adContainer.layoutParams
            if (lp != null) {
                lp.height = ViewGroup.LayoutParams.WRAP_CONTENT
                adContainer.layoutParams = lp
            }
            adContainer.removeAllViews()
            adContainer.addView(
                navView,
                ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
                )
            )
            adContainer.setTag(RES_ID_BOTTOM_NAV, true)
            adContainer.requestLayout()
        } else {
            Log.d(TAG, "Attaching persistent nav into contentView in ${activity.javaClass.simpleName}")
            val frameParams = FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM
            )
            contentView.addView(navView, frameParams)

            val density = activity.resources.displayMetrics.density
            val navHeightPx = (56 * density).toInt()
            for (i in 0 until contentView.childCount) {
                val child = contentView.getChildAt(i)
                if (child != navView) {
                    child.setPadding(
                        child.paddingLeft,
                        child.paddingTop,
                        child.paddingRight,
                        child.paddingBottom + navHeightPx
                    )
                    break
                }
            }
        }
    }

    private fun createBottomNavView(activity: Activity, currentTabId: Int): View? {
        return try {
            val density = activity.resources.displayMetrics.density

            // Determine active tab ID
            val activeResId = if (currentTabId >= 0) {
                tabIndexToResId(currentTabId)
            } else {
                getActiveTabForActivity(activity)
            }

            // Background: exactly matches MainActivity's app:backgroundTint="@color/charcoal_gray_80"
            val grayResId = activity.resources.getIdentifier("charcoal_gray_80", "color", activity.packageName)
            var bgColor = 0xFF333333.toInt()
            if (grayResId != 0) {
                try { bgColor = activity.getColor(grayResId) } catch (_: Throwable) {}
            }

            // Colors: matching MainActivity's bottom_navigation itemIconTint / itemTextColor
            val activeColor = 0xFFFFFFFF.toInt()
            val inactiveColor = 0x8AFFFFFF.toInt()

            // Root container
            val rootLayout = LinearLayout(activity).apply {
                tag = TAG_PERSISTENT_NAV
                orientation = LinearLayout.VERTICAL
                layoutParams = ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
                )
                setBackgroundColor(bgColor)
                elevation = 0f
            }

            // Apply WindowInsets padding to ensure navbar clears gesture pill and curved corners
            applyWindowInsetsPadding(rootLayout)

            // Inner horizontal bar
            val barHeightPx = (56 * density).toInt()
            val barLayout = LinearLayout(activity).apply {
                orientation = LinearLayout.HORIZONTAL
                layoutParams = LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    barHeightPx
                )
                gravity = Gravity.CENTER_VERTICAL
            }

            // Build 5 tabs matching MainActivity
            for (tab in TABS) {
                val isSelected = (tab.resId == activeResId)
                val itemColor = if (isSelected) activeColor else inactiveColor

                val tabView = LinearLayout(activity).apply {
                    orientation = LinearLayout.VERTICAL
                    gravity = Gravity.CENTER
                    layoutParams = LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1.0f)
                    isClickable = true
                    isFocusable = true

                    val outValue = TypedValue()
                    if (activity.theme.resolveAttribute(android.R.attr.selectableItemBackgroundBorderless, outValue, true)) {
                        setBackgroundResource(outValue.resourceId)
                    }

                    // Vector Icon
                    val iconSizePx = (24 * density).toInt()
                    val iconView = ImageView(activity).apply {
                        layoutParams = LinearLayout.LayoutParams(iconSizePx, iconSizePx).apply {
                            gravity = Gravity.CENTER_HORIZONTAL
                            topMargin = (6 * density).toInt()
                            bottomMargin = (2 * density).toInt()
                        }
                        scaleType = ImageView.ScaleType.FIT_CENTER

                        val dResId = activity.resources.getIdentifier(tab.drawableName, "drawable", activity.packageName)
                        if (dResId != 0) {
                            try {
                                setImageDrawable(activity.getDrawable(dResId))
                            } catch (_: Throwable) {}
                        }
                        imageTintList = ColorStateList.valueOf(itemColor)
                    }
                    addView(iconView)

                    // Text Label
                    val labelView = TextView(activity).apply {
                        layoutParams = LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.WRAP_CONTENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT
                        ).apply {
                            gravity = Gravity.CENTER_HORIZONTAL
                            bottomMargin = (6 * density).toInt()
                        }
                        setTextSize(TypedValue.COMPLEX_UNIT_SP, 10f)
                        isSingleLine = true

                        val sResId = activity.resources.getIdentifier(tab.stringName, "string", activity.packageName)
                        val titleText = if (sResId != 0) {
                            try { activity.getString(sResId) } catch (_: Throwable) { tab.defaultTitle }
                        } else {
                            tab.defaultTitle
                        }
                        text = titleText
                        setTextColor(itemColor)
                    }
                    addView(labelView)

                    setOnClickListener {
                        dispatchTabNavigation(activity, tab.resId)
                    }
                }
                barLayout.addView(tabView)
            }

            rootLayout.addView(barLayout)
            rootLayout
        } catch (t: Throwable) {
            Log.e(TAG, "Error creating bottom nav view", t)
            null
        }
    }

    @JvmStatic
    fun applyWindowInsetsPadding(view: View?) {
        if (view == null) return
        try {
            view.setOnApplyWindowInsetsListener { v, insets ->
                val bottomInset = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                    insets.getInsets(
                        WindowInsets.Type.navigationBars() or WindowInsets.Type.displayCutout()
                    ).bottom
                } else {
                    @Suppress("DEPRECATION")
                    insets.systemWindowInsetBottom
                }
                v.setPadding(0, 0, 0, bottomInset)
                insets
            }
            view.requestApplyInsets()
        } catch (t: Throwable) {
            Log.e(TAG, "Error applying window insets", t)
        }
    }

    fun isEligibleActivity(activity: Activity): Boolean {
        val name = activity.javaClass.name
        // MainActivity hosts its own native bottom navigation: handle incoming tab intents
        if (name.endsWith("MainActivity") || name.contains(".MainActivity")) {
            handleMainActivityIntent(activity, activity.intent)
            return false
        }
        // Exclude fullscreen image zoom viewers
        if (name.contains("FullScreenImage")) return false
        // Exclude novel reading text viewer
        if (name.contains("NovelText")) return false
        // Exclude preference/settings screens
        if (name.contains("SettingActivity") || name.contains("AiShowSetting") || name.contains("AppThemeSetting")) return false
        // Exclude trampoline routing activities
        if (name.contains("RoutingActivity") || name.contains("IntentFilter") || name.contains("SchemeFilter")) return false
        // Exclude auth / login screens
        if (name.contains("prelogin") || name.contains("Auth")) return false
        return true
    }

    fun getActiveTabForActivity(activity: Activity): Int {
        val name = activity.javaClass.name
        return when {
            name.contains("Search") -> RES_ID_SEARCH
            name.contains("Ranking") -> RES_ID_HOME
            name.contains("Bookmark") || name.contains("Collection") -> RES_ID_MYPAGE
            name.contains("History") -> RES_ID_MYPAGE
            name.contains("Notification") || name.contains("Information") -> RES_ID_NOTIFICATIONS
            name.contains("UserWork") || name.contains("UserProfile") -> RES_ID_MYPAGE
            name.contains("IllustDetail") -> RES_ID_HOME
            else -> RES_ID_HOME
        }
    }

    fun tabIndexToResId(index: Int): Int {
        return when (index) {
            TAB_HOME -> RES_ID_HOME
            TAB_SEARCH -> RES_ID_SEARCH
            TAB_NEW -> RES_ID_NEW
            TAB_NOTIFICATIONS -> RES_ID_NOTIFICATIONS
            TAB_MYPAGE -> RES_ID_MYPAGE
            else -> RES_ID_HOME
        }
    }

    @JvmStatic
    fun dispatchTabNavigation(activity: Activity?, targetResId: Int) {
        if (activity == null) return
        try {
            Log.d(TAG, "dispatchTabNavigation: targetResId=0x${Integer.toHexString(targetResId)}")
            val currentTab = getActiveTabForActivity(activity)
            if (targetResId == currentTab) {
                Log.d(TAG, "Current tab matches target, finishing activity to return to feed")
                activity.finish()
                return
            }

            val intent = Intent(activity, Class.forName("jp.pxv.android.MainActivity")).apply {
                flags = Intent.FLAG_ACTIVITY_CLEAR_TOP or Intent.FLAG_ACTIVITY_SINGLE_TOP
                putExtra("target_tab_res_id", targetResId)
                when (targetResId) {
                    RES_ID_HOME -> { putExtra("tab_action", "home"); putExtra("tab_index", TAB_HOME) }
                    RES_ID_SEARCH -> { putExtra("tab_action", "search"); putExtra("tab_index", TAB_SEARCH) }
                    RES_ID_NEW -> { putExtra("tab_action", "new"); putExtra("tab_index", TAB_NEW) }
                    RES_ID_NOTIFICATIONS -> { putExtra("tab_action", "notifications"); putExtra("tab_index", TAB_NOTIFICATIONS) }
                    RES_ID_MYPAGE -> { putExtra("tab_action", "mypage"); putExtra("tab_index", TAB_MYPAGE) }
                }
            }
            activity.startActivity(intent)
        } catch (t: Throwable) {
            Log.e(TAG, "Error dispatching navigation", t)
        }
    }

    @JvmStatic
    fun handleMainActivityIntent(activity: Activity?, intent: Intent?) {
        if (activity == null || intent == null) return
        try {
            var targetResId = intent.getIntExtra("target_tab_res_id", 0)
            if (targetResId == 0) {
                targetResId = intent.getIntExtra("target_tab_id", 0)
            }
            if (targetResId in 0..4) {
                targetResId = tabIndexToResId(targetResId)
            }

            if (targetResId != 0) {
                Log.d(TAG, "handleMainActivityIntent: targetResId=0x${Integer.toHexString(targetResId)}")
                activity.intent = intent
                val finalTargetResId = targetResId
                Handler(Looper.getMainLooper()).post {
                    try {
                        var bnv = activity.findViewById<View>(RES_ID_BOTTOM_NAV)
                        if (bnv == null) {
                            val resId = activity.resources.getIdentifier("bottom_navigation", "id", activity.packageName)
                            if (resId != 0) bnv = activity.findViewById(resId)
                        }
                        if (bnv != null) {
                            val setSelectedMethod = bnv.javaClass.getMethod("setSelectedItemId", Int::class.javaPrimitiveType)
                            setSelectedMethod.invoke(bnv, finalTargetResId)
                            Log.d(TAG, "Successfully invoked setSelectedItemId(0x${Integer.toHexString(finalTargetResId)}) on MainActivity bottom nav")
                        }
                    } catch (t: Throwable) {
                        Log.e(TAG, "Error selecting tab on MainActivity", t)
                    }
                }
                intent.removeExtra("target_tab_id")
                intent.removeExtra("target_tab_res_id")
                intent.removeExtra("tab_index")
                intent.removeExtra("tab_action")
            }
        } catch (t: Throwable) {
            Log.e(TAG, "Error handling MainActivity intent", t)
        }
    }
}
