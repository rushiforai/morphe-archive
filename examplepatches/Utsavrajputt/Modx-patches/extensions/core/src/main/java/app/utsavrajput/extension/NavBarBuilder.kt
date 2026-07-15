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
    private const val BAR_SEPARATOR = "#232428"

    private fun dp(activity: Activity, value: Int): Int {
        return TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP,
            value.toFloat(),
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
            setPadding(0, dp(activity, 14), 0, dp(activity, 8) + navInset)
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

        // Tools' "X" glyph is thin and doesn't fill its canvas the way the
        // Fatafat "F" logo does, so it reads visually smaller at the same
        // dp size — bump it up a bit to match, offsetting the top margin
        // so it still lines up with the other icons.
        val iconSizeDp = if (key.equals("tools")) 30 else 24
        val iconTopOffset = if (key.equals("tools")) -dp(activity, 3) else 0

        val iconView = ImageView(activity).apply {
            layoutParams = LinearLayout.LayoutParams(dp(activity, iconSizeDp), dp(activity, iconSizeDp)).apply {
                bottomMargin = dp(activity, 2) + iconTopOffset
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