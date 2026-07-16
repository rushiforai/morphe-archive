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
 * Matches native MX Player "Local" tab bar:
 *  - Dark-grey (#121212) background + 1px top separator line, same as
 *    native — pure black was blending into the content above it and made
 *    the bar look height/boundary-less by comparison.
 *  - Height + padding account for the real navigation-bar inset (gesture
 *    pill area) via Insets.navigationBarHeight(), instead of a fixed guess.
 *  - Local / Fatafat use real extracted MX Player PNG/WebP art.
 *  - Tools (Modx logo) / About (info icon) use single artwork per state,
 *    pre-tinted at asset-build time (grey/red, black-card/blue-card).
 */
object NavBarBuilder {

    private const val ACTIVE_BLUE = "#4A90E2"
    private const val INACTIVE_GREY = "#888888"
    private const val TOOLS_ACTIVE_RED = "#E53935"
    private const val TOOLS_INACTIVE_GREY = "#9E9E9E"
    private const val BAR_BACKGROUND = "#121212"
    private const val BAR_SEPARATOR = "#1A1B1E"

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
            setBackgroundColor(Color.parseColor(BAR_BACKGROUND))
            layoutParams = LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
            )
        }

        // 1px separator line — native MX Player draws this same subtle
        // top border between content and the nav bar.
        outer.addView(
            View(activity).apply { setBackgroundColor(Color.parseColor(BAR_SEPARATOR)) },
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(activity, 1) + 1),
        )

        val row = LinearLayout(activity).apply {
            orientation = LinearLayout.HORIZONTAL
            setPadding(0, dpF(activity, 6.2f), 0, dp(activity, 8) + navInset)
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
        }

        // Measured directly against native MX Player screenshots (icon
        // bounding-box width/height + vertical start position, pixel for
        // pixel) — each tab's icon was a different size/position relative
        // to native, not just Tools:
        //   Local:   custom was ~20% smaller than native, sat too high
        //   Fatafat: custom was ~11% smaller than native, position was fine
        //   Tools:   size already matched native, but sat ~9px too high
        //   About:   custom was ~13% smaller than native, sat slightly high
        //
        // iconSizeDp = matched to native's measured icon size.
        // topMarginDp/bottomMarginDp = chosen so icon+top+bottom always
        // sums to 31dp for every tab — this pushes each icon down to its
        // native vertical position *within its own slot*, without moving
        // the label below it or changing any other tab's total height
        // (so the bar's outer height stays fixed).
        val iconSizeDp: Int
        val iconTopMarginDp: Int
        when {
            key.equals("local") -> { iconSizeDp = 26; iconTopMarginDp = 4 }
            key.equals("fatafat") -> { iconSizeDp = 24; iconTopMarginDp = 0 }
            key.equals("tools") -> { iconSizeDp = 26; iconTopMarginDp = 5 }
            else -> { iconSizeDp = 25; iconTopMarginDp = 1 } // about
        }
        val iconBottomMarginDp = 31 - iconSizeDp - iconTopMarginDp

        val iconView = ImageView(activity).apply {
            layoutParams = LinearLayout.LayoutParams(dp(activity, iconSizeDp), dp(activity, iconSizeDp)).apply {
                topMargin = dp(activity, iconTopMarginDp)
                bottomMargin = dp(activity, iconBottomMarginDp)
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
            textSize = 11f
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
