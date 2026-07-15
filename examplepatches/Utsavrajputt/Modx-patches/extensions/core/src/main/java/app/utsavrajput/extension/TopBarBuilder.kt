package app.utsavrajput.extension

import android.app.Activity
import android.graphics.Color
import android.graphics.Typeface
import android.util.TypedValue
import android.view.Gravity
import android.view.View
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.TextView

/**
 * Top bar shared by ToolsActivity and AboutActivity — bold left-aligned
 * title matching MX Player's own "MX Player" title style (28sp, bold,
 * white, top-left).
 *
 * Tools screen additionally gets two right-side icons (search, sort/layout
 * toggle) matching MX Player's own top-right icon row — visual only for
 * now, no click behavior wired yet (functionality to be added later).
 * About screen gets the plain title only, no icons.
 */
object TopBarBuilder {

    private fun dp(activity: Activity, value: Int): Int {
        return TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP,
            value.toFloat(),
            activity.resources.displayMetrics,
        ).toInt()
    }

    @JvmStatic
    fun build(activity: Activity, title: String, showToolIcons: Boolean): View {
        val statusInset = Insets.statusBarHeight(activity)

        val bar = LinearLayout(activity).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            setPadding(dp(activity, 16), statusInset + dp(activity, 8), dp(activity, 16), dp(activity, 16))
        }

        val titleView = TextView(activity).apply {
            text = title
            setTextColor(Color.WHITE)
            textSize = 28f
            setTypeface(typeface, Typeface.BOLD)
        }
        bar.addView(
            titleView,
            LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f),
        )

        if (showToolIcons) {
            val iconRow = LinearLayout(activity).apply {
                orientation = LinearLayout.HORIZONTAL
                gravity = Gravity.CENTER_VERTICAL
            }

            val searchIcon = ImageView(activity).apply {
                setImageBitmap(IconAssets.searchIcon())
                layoutParams = LinearLayout.LayoutParams(dp(activity, 24), dp(activity, 24)).apply {
                    marginEnd = dp(activity, 20)
                }
            }
            val sortIcon = ImageView(activity).apply {
                setImageBitmap(IconAssets.sortIcon())
                layoutParams = LinearLayout.LayoutParams(dp(activity, 24), dp(activity, 24))
            }

            iconRow.addView(searchIcon)
            iconRow.addView(sortIcon)
            bar.addView(iconRow)
        }

        return bar
    }
}
