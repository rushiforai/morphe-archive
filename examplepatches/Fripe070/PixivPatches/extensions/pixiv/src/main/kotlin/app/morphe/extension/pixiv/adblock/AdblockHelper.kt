package app.morphe.extension.pixiv.adblock

import android.app.Activity
import android.view.View
import android.view.ViewGroup

object AdblockHelper {

    private const val AD_CONTAINER_RES_ID = 0x7f0a004f

    @JvmStatic
    fun hideBanner(view: View?) {
        if (view == null) return
        try {
            view.visibility = View.GONE
            view.layoutParams?.let { lp ->
                lp.height = 0
                lp.width = 0
                view.layoutParams = lp
            }
        } catch (_: Throwable) {
        }
    }

    @JvmStatic
    fun collapseMainActivityBanner(activity: Activity?) {
        if (activity == null) return
        try {
            var container = activity.findViewById<View>(AD_CONTAINER_RES_ID)
            if (container == null) {
                val resId = activity.resources.getIdentifier("ad_container", "id", activity.packageName)
                if (resId != 0) {
                    container = activity.findViewById(resId)
                }
            }
            if (container != null) {
                hideAdContainer(container)
            }

            // Ensure BottomNavigationView in MainActivity receives WindowInsets bottom padding
            // so it stays safely above the gesture navigation pill and clears rounded corners
            applyMainActivityNavInsets(activity)
        } catch (_: Throwable) {
        }
    }

    @JvmStatic
    fun applyMainActivityNavInsets(activity: Activity?) {
        if (activity == null) return
        try {
            var navView = activity.findViewById<View>(0x7f0a00c0)
            if (navView == null) {
                val navId = activity.resources.getIdentifier("bottom_navigation", "id", activity.packageName)
                if (navId != 0) navView = activity.findViewById(navId)
            }
            if (navView != null) {
                navView.setOnApplyWindowInsetsListener { v, insets ->
                    val bottomInset = if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.R) {
                        insets.getInsets(
                            android.view.WindowInsets.Type.navigationBars() or android.view.WindowInsets.Type.displayCutout()
                        ).bottom
                    } else {
                        @Suppress("DEPRECATION")
                        insets.systemWindowInsetBottom
                    }
                    v.setPadding(v.paddingLeft, v.paddingTop, v.paddingRight, bottomInset)
                    insets
                }
                navView.requestApplyInsets()
            }
        } catch (_: Throwable) {
        }
    }

    @JvmStatic
    fun hideAdContainer(adContainer: View?) {
        if (adContainer == null) return
        try {
            // If adContainer is being utilized for persistent bottom navigation, maintain visibility
            if (adContainer.getTag(0x7f0a00c0) == true || adContainer.findViewWithTag<View>("morphe_persistent_bottom_nav") != null) {
                adContainer.visibility = View.VISIBLE
                if (adContainer is ViewGroup) {
                    for (i in adContainer.childCount - 1 downTo 0) {
                        val child = adContainer.getChildAt(i)
                        if (child.tag != "morphe_persistent_bottom_nav") {
                            adContainer.removeViewAt(i)
                        }
                    }
                }
                return
            }

            adContainer.visibility = View.GONE
            adContainer.layoutParams?.let { lp ->
                lp.height = 0
                adContainer.layoutParams = lp
            }
            if (adContainer is ViewGroup) {
                adContainer.removeAllViews()
            }
        } catch (_: Throwable) {
        }
    }

    @JvmStatic
    fun hideSponsoredItem(item: Any?) {
        if (item == null) return
        try {
            if (item is View) {
                hideSponsoredCard(item)
                return
            }
            // If item is a RecyclerView.ViewHolder, access its itemView field
            val clazz = item.javaClass
            val itemViewField = try {
                clazz.getField("itemView")
            } catch (_: NoSuchFieldException) {
                var c: Class<*>? = clazz
                var found: java.lang.reflect.Field? = null
                while (c != null && c != Any::class.java) {
                    try {
                        found = c.getDeclaredField("itemView")
                        found.isAccessible = true
                        break
                    } catch (_: NoSuchFieldException) {
                        c = c.superclass
                    }
                }
                found
            }

            itemViewField?.get(item)?.let { v ->
                if (v is View) {
                    hideSponsoredCard(v)
                }
            }
        } catch (_: Throwable) {
        }
    }

    @JvmStatic
    fun hideSponsoredCard(cardView: View?) {
        if (cardView == null) return
        try {
            cardView.visibility = View.GONE
            cardView.layoutParams?.let { lp ->
                lp.height = 0
                if (lp is ViewGroup.MarginLayoutParams) {
                    lp.setMargins(0, 0, 0, 0)
                }
                cardView.layoutParams = lp
            }
        } catch (_: Throwable) {
        }
    }
}
