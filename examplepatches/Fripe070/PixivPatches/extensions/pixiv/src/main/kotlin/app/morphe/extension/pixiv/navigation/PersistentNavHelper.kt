package app.morphe.extension.pixiv.navigation

import android.app.Activity
import android.content.Intent
import android.content.res.ColorStateList
import android.os.Build
import android.util.TypedValue
import android.view.Gravity
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup
import android.view.WindowInsets
import android.widget.FrameLayout
import java.lang.reflect.Proxy

object PersistentNavHelper {

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

    @JvmStatic
    fun attachBottomNav(activity: Activity?) {
        attachBottomNav(activity, -1)
    }

    @JvmStatic
    fun attachBottomNav(activity: Activity?, currentTabId: Int) {
        if (activity == null) return
        try {
            if (!isEligibleActivity(activity)) return

            val contentView = activity.findViewById<ViewGroup>(android.R.id.content) ?: return
            if (contentView.findViewWithTag<View>(TAG_PERSISTENT_NAV) != null) {
                return
            }

            // Check if activity layout defines an ad_container slot
            var adContainer = activity.findViewById<ViewGroup>(RES_ID_AD_CONTAINER)
            if (adContainer == null) {
                val resId = activity.resources.getIdentifier("ad_container", "id", activity.packageName)
                if (resId != 0) {
                    adContainer = activity.findViewById(resId)
                }
            }

            // Reuse ad_container slot if present so native layout constraints (layout_above) are preserved
            if (adContainer != null && adContainer.findViewWithTag<View>(TAG_PERSISTENT_NAV) == null) {
                adContainer.visibility = View.VISIBLE
                adContainer.removeAllViews()
                val navView = createBottomNavView(activity, currentTabId) ?: return
                val lp = ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
                )
                adContainer.addView(navView, lp)
                adContainer.setTag(RES_ID_BOTTOM_NAV, true)
                return
            }

            // Fallback: dock inside contentView with Gravity.BOTTOM and pad root content
            val navView = createBottomNavView(activity, currentTabId) ?: return
            val frameParams = FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM
            )
            contentView.addView(navView, frameParams)

            val child = contentView.getChildAt(0)
            if (child != null && child != navView) {
                val density = activity.resources.displayMetrics.density
                val navHeightPx = (56 * density).toInt()
                child.setPadding(
                    child.paddingLeft,
                    child.paddingTop,
                    child.paddingRight,
                    child.paddingBottom + navHeightPx
                )
            }
        } catch (_: Throwable) {
        }
    }

    private fun createBottomNavView(activity: Activity, currentTabId: Int): View? {
        return try {
            val bnvClass = Class.forName("com.google.android.material.bottomnavigation.BottomNavigationView")
            val navView = bnvClass.getConstructor(android.content.Context::class.java).newInstance(activity) as ViewGroup
            navView.tag = TAG_PERSISTENT_NAV

            // 1. Inflate standard 5-tab menu with native vector icons
            var menuId = activity.resources.getIdentifier("bottom_navigation", "menu", activity.packageName)
            if (menuId == 0) menuId = RES_MENU_BOTTOM_NAV
            bnvClass.getMethod("inflateMenu", Int::class.javaPrimitiveType).invoke(navView, menuId)

            // 2. Apply theme ColorStateList to item icons and labels
            var colorId = activity.resources.getIdentifier("bottom_navigation", "color", activity.packageName)
            if (colorId == 0) colorId = RES_COLOR_BOTTOM_NAV
            val csl = try {
                activity.getColorStateList(colorId)
            } catch (_: Throwable) {
                null
            }
            if (csl != null) {
                try {
                    bnvClass.getMethod("setItemIconTintList", ColorStateList::class.java).invoke(navView, csl)
                    bnvClass.getMethod("setItemTextColor", ColorStateList::class.java).invoke(navView, csl)
                } catch (_: Throwable) {
                }
            }

            // 3. Resolve background surface color dynamically from theme (respects dark, light, OLED)
            val typedValue = TypedValue()
            val attrId = activity.resources.getIdentifier("colorCharcoalSurface1", "attr", activity.packageName)
            var bgColor = 0xFF1F1F1F.toInt()
            if (attrId != 0 && activity.theme.resolveAttribute(attrId, typedValue, true)) {
                bgColor = typedValue.data
            }
            navView.setBackgroundColor(bgColor)

            // 4. Configure labeled display mode and flat elevation matching MainActivity
            try {
                bnvClass.getMethod("setLabelVisibilityMode", Int::class.javaPrimitiveType).invoke(navView, 1)
            } catch (_: Throwable) {
            }
            navView.elevation = 0f

            // 5. Apply WindowInsets padding to ensure navbar clears gesture pill and curved corners
            applyWindowInsetsPadding(navView)

            // 6. Hook item selection listener to dispatch cross-activity navigation
            try {
                val listenerClass = Class.forName("com.google.android.material.navigation.NavigationBarView\$OnItemSelectedListener")
                val proxy = Proxy.newProxyInstance(
                    activity.classLoader,
                    arrayOf(listenerClass)
                ) { _, method, args ->
                    if (method.name == "onNavigationItemSelected") {
                        val item = args?.get(0) as? MenuItem
                        if (item != null) {
                            dispatchTabNavigation(activity, item.itemId)
                        }
                        true
                    } else {
                        false
                    }
                }
                bnvClass.getMethod("setOnItemSelectedListener", listenerClass).invoke(navView, proxy)
            } catch (_: Throwable) {
                try {
                    val oldListenerClass = Class.forName("com.google.android.material.bottomnavigation.BottomNavigationView\$OnNavigationItemSelectedListener")
                    val proxy = Proxy.newProxyInstance(
                        activity.classLoader,
                        arrayOf(oldListenerClass)
                    ) { _, method, args ->
                        if (method.name == "onNavigationItemSelected") {
                            val item = args?.get(0) as? MenuItem
                            if (item != null) {
                                dispatchTabNavigation(activity, item.itemId)
                            }
                            true
                        } else {
                            false
                        }
                    }
                    bnvClass.getMethod("setOnNavigationItemSelectedListener", oldListenerClass).invoke(navView, proxy)
                } catch (_: Throwable) {
                }
            }

            // 7. Highlight the active tab corresponding to the current activity context
            val activeResId = if (currentTabId >= 0) {
                tabIndexToResId(currentTabId)
            } else {
                getActiveTabForActivity(activity)
            }
            if (activeResId != 0) {
                try {
                    bnvClass.getMethod("setSelectedItemId", Int::class.javaPrimitiveType).invoke(navView, activeResId)
                } catch (_: Throwable) {
                }
            }

            navView
        } catch (_: Throwable) {
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
                v.setPadding(v.paddingLeft, v.paddingTop, v.paddingRight, bottomInset)
                insets
            }
            view.requestApplyInsets()
        } catch (_: Throwable) {
        }
    }

    fun isEligibleActivity(activity: Activity): Boolean {
        val name = activity.javaClass.name
        // MainActivity already hosts its own native bottom navigation
        if (name.endsWith("MainActivity") || name.contains(".MainActivity")) return false
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
    fun dispatchTabNavigation(activity: Activity?, tabId: Int) {
        if (activity == null) return
        try {
            val targetResId = if (tabId in 0..4) tabIndexToResId(tabId) else tabId
            val currentTab = getActiveTabForActivity(activity)
            if (targetResId == currentTab) {
                activity.finish()
                return
            }

            val intent = Intent(activity, Class.forName("jp.pxv.android.MainActivity")).apply {
                flags = Intent.FLAG_ACTIVITY_CLEAR_TOP or Intent.FLAG_ACTIVITY_SINGLE_TOP
                putExtra("target_tab_id", targetResId)
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
        } catch (_: Throwable) {
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
            if (targetResId == 0) {
                val tabIndex = intent.getIntExtra("tab_index", -1)
                if (tabIndex in 0..4) {
                    targetResId = tabIndexToResId(tabIndex)
                }
            }

            if (targetResId != 0) {
                var bnv = activity.findViewById<View>(RES_ID_BOTTOM_NAV)
                if (bnv == null) {
                    val resId = activity.resources.getIdentifier("bottom_navigation", "id", activity.packageName)
                    if (resId != 0) bnv = activity.findViewById(resId)
                }
                if (bnv != null) {
                    try {
                        val bnvClass = Class.forName("com.google.android.material.navigation.NavigationBarView")
                        val setSelectedMethod = bnvClass.getMethod("setSelectedItemId", Int::class.javaPrimitiveType)
                        setSelectedMethod.invoke(bnv, targetResId)
                    } catch (_: Throwable) {
                        val bnvClass = Class.forName("com.google.android.material.bottomnavigation.BottomNavigationView")
                        val setSelectedMethod = bnvClass.getMethod("setSelectedItemId", Int::class.javaPrimitiveType)
                        setSelectedMethod.invoke(bnv, targetResId)
                    }
                }
                intent.removeExtra("target_tab_id")
                intent.removeExtra("target_tab_res_id")
                intent.removeExtra("tab_index")
                intent.removeExtra("tab_action")
            }
        } catch (_: Throwable) {
        }
    }
}


