package app.utsavrajput.extension

import android.app.Activity
import android.graphics.Color
import android.graphics.PorterDuff
import android.util.TypedValue
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.TextView

/**
 * Bottom nav bar shared by ToolsActivity (Search tab) and AboutActivity
 * (Games tab) — built once here so both screens stay pixel-identical and
 * any future fix only needs to happen in one place.
 *
 * Every value below was pulled directly from MX Player's own real APK
 * (com_mxtech_videoplayer_ad_2.14.1), not measured off a screenshot:
 *  - Container: res/layout/activity_media_list.xml, id online_bottom_layout
 *    -> background @drawable/mxskin__mx_home_tab_bg__dark -> flat color
 *    #FF121212, plus a separate 0.5dp separator View directly above it
 *    with color @color/mxskin__bottom_tab_divider__dark = #3396A2BA
 *    (20%-alpha light blue-grey, NOT solid).
 *  - Per-tab item: res/layout/aurora_home_tab.xml -> icon 22dp x 22dp,
 *    9dp top margin, label 10sp, 8dp bottom margin.
 *  - Label colors: res/color/mxskin__aurora_tab_text_color__dark.xml ->
 *    inactive #FF96A2BA, active (color_tab_select) #FF3C8CF0.
 */
object NavBarBuilder {

    private const val ACTIVE_BLUE = "#FF3C8CF0"
    private const val INACTIVE_GREY = "#FF96A2BA"
    private const val TOOLS_ACTIVE_RED = "#E53935"
    private const val TOOLS_INACTIVE_GREY = "#FF96A2BA"
    private const val BAR_BACKGROUND = "#FF121212"
    private const val BAR_SEPARATOR = "#3396A2BA"

    private fun dp(activity: Activity, value: Int): Int {
        return TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP,
            value.toFloat(),
            activity.resources.displayMetrics,
        ).toInt()
    }

    private fun dpF(activity: Activity, value: Float): Int {
        return TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP,
            value,
            activity.resources.displayMetrics,
        ).toInt()
    }

    /**
     * @param activity host activity (Tools or About)
     * @param activeTab one of "local", "fatafat", "tools", "about"
     */
    @JvmStatic
    fun build(activity: Activity, activeTab: String): LinearLayout {
        val navInset = Insets.navigationBarHeight(activity)

        val outer = LinearLayout(activity).apply {
            orientation = LinearLayout.VERTICAL
            layoutParams = LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
            )
        }

        // Native draws this as a separate 0.5dp View directly above the
        // bar, not a border on the bar itself — same here.
        outer.addView(
            View(activity).apply { setBackgroundColor(Color.parseColor(BAR_SEPARATOR)) },
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dpF(activity, 0.5f)),
        )

        val row = LinearLayout(activity).apply {
            orientation = LinearLayout.HORIZONTAL
            setBackgroundColor(Color.parseColor(BAR_BACKGROUND))
            setPadding(0, 0, 0, navInset)
            layoutParams = LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
            )
        }

        val keys = arrayOf("local", "fatafat", "tools", "about")
        val labels = arrayOf("Local", "Fatafat", "Tools", "About")

        var i = 0
        while (i < keys.size) {
            row.addView(
                buildTab(activity, keys[i], labels[i], keys[i].equals(activeTab)),
                LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f),
            )
            i = i + 1
        }

        outer.addView(row)
        return outer
    }

    private fun buildTab(activity: Activity, key: String, label: String, active: Boolean): LinearLayout {
        val tab = LinearLayout(activity).apply {
            orientation = LinearLayout.VERTICAL
            gravity = Gravity.CENTER
            isClickable = true
            isFocusable = true
            // aurora_home_tab.xml: 9dp top margin to icon, 8dp bottom
            // margin below label — applied here as container padding
            // since our tab is a self-contained column, not constraints.
            setPadding(0, dp(activity, 9), 0, dp(activity, 8))
        }

        // Native icon canvas is 22dp x 22dp for every tab. Tools' "X"
        // glyph is thin and doesn't fill its canvas the way the Fatafat
        // "F" logo does, so it reads visually smaller at the same dp
        // size — bump it up slightly to compensate, offsetting so it
        // still lines up with the other icons' vertical center.
        val iconSizeDp = if (key.equals("tools")) 26 else 22
        val iconTopOffset = if (key.equals("tools")) -dp(activity, 2) else 0

        val iconView = ImageView(activity).apply {
            layoutParams = LinearLayout.LayoutParams(dp(activity, iconSizeDp), dp(activity, iconSizeDp)).apply {
                bottomMargin = dp(activity, 4) + iconTopOffset
                topMargin = iconTopOffset
            }
        }

        var labelColor = Color.parseColor(INACTIVE_GREY)

        if (key.equals("local")) {
            iconView.setImageBitmap(if (active) IconAssets.localSelected() else IconAssets.localNormal())
            labelColor = Color.parseColor(if (active) ACTIVE_BLUE else INACTIVE_GREY)
        } else if (key.equals("fatafat")) {
            iconView.setImageBitmap(if (active) IconAssets.fatafatSelected() else IconAssets.fatafatDefault())
            labelColor = Color.parseColor(if (active) ACTIVE_BLUE else INACTIVE_GREY)
        } else if (key.equals("tools")) {
            iconView.setImageBitmap(IconAssets.modxLogo())
            val tint = Color.parseColor(if (active) TOOLS_ACTIVE_RED else TOOLS_INACTIVE_GREY)
            iconView.setColorFilter(tint, PorterDuff.Mode.SRC_IN)
            labelColor = tint
        } else {
            // about — pre-tinted artwork (white card stays white, glyph
            // switches black->blue), no runtime ColorFilter needed
            iconView.setImageBitmap(if (active) IconAssets.aboutSelected() else IconAssets.aboutNormal())
            labelColor = Color.parseColor(if (active) ACTIVE_BLUE else INACTIVE_GREY)
        }

        tab.addView(iconView)
        tab.addView(TextView(activity).apply {
            text = label
            // aurora_home_tab.xml label textSize = 10sp
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 10f)
            gravity = Gravity.CENTER
            setTextColor(labelColor)
        })

        if (!active) {
            tab.setOnClickListener {
                if (key.equals("tools")) {
                    ExtensionHooks.launchTools(activity)
                    activity.finish()
                    activity.overridePendingTransition(0, 0)
                } else if (key.equals("about")) {
                    ExtensionHooks.launchAbout(activity)
                    activity.finish()
                    activity.overridePendingTransition(0, 0)
                } else {
                    ExtensionHooks.switchTab(key)
                    activity.finish()
                    activity.overridePendingTransition(0, 0)
                }
            }
        }
        return tab
    }
}
