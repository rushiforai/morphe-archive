package app.utsavrajput.extension

import android.app.Activity
import android.graphics.Color
import android.graphics.Typeface
import android.view.Gravity
import android.view.ViewGroup
import android.widget.LinearLayout
import android.widget.ScrollView
import android.widget.TextView

/**
 * Shared helpers for building extension screens 100% in code.
 *
 * Why: Morphe's extendWith("extensions/core.mpe") only merges this module's
 * compiled DEX classes into MX Player's APK - it does NOT merge this
 * module's resources.arsc / res/ folder. Any R.layout.* or R.id.* reference
 * from this module points at resource IDs that simply don't exist in the
 * host app's resource table, and crashes with
 * android.content.res.Resources$NotFoundException the moment
 * setContentView()/findViewById() runs (confirmed in crash_log.txt for
 * AboutActivity - Resource ID #0x7f070000 type #0x5 is not valid).
 *
 * Building every view directly with Kotlin code sidesteps resource
 * resolution entirely, so it works regardless of whether Morphe ever adds
 * resource merging for extensions.
 */
object UiUtils {

    const val BACKGROUND = "#111111"
    const val ROW_BACKGROUND = "#1C1C1C"
    const val TEXT_SECONDARY = "#AAAAAA"

    /** Plain holder - deliberately NOT kotlin.Pair (see class doc above for why). */
    class Scaffold(val scroll: ScrollView, val content: LinearLayout)

    /**
     * ScrollView(match, match, dark bg) wrapping a vertical
     * LinearLayout(match, wrap, padding 24) - matches the old
     * activity_*.xml "ScrollView > LinearLayout" scaffold used by most
     * screens. Returns both views via Scaffold (not kotlin.Pair - see
     * class doc for why): scaffold.scroll goes to setContentView(),
     * scaffold.content is where you addView() your rows.
     */
    fun scaffold(activity: Activity): Scaffold {
        val content = LinearLayout(activity).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(24, 24, 24, 24)
        }
        val scroll = ScrollView(activity).apply {
            setBackgroundColor(Color.parseColor(BACKGROUND))
            addView(
                content,
                ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                ),
            )
        }
        return Scaffold(scroll, content)
    }

    /**
     * Non-scrolling root column (match, match, dark bg, padding 24) - used
     * by screens that were a plain root LinearLayout in XML (PIN screen,
     * Transfer Files, URL Stream) rather than a ScrollView.
     */
    fun rootColumn(activity: Activity, centered: Boolean = false): LinearLayout =
        LinearLayout(activity).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(24, 24, 24, 24)
            setBackgroundColor(Color.parseColor(BACKGROUND))
            if (centered) gravity = Gravity.CENTER
        }

    fun heading(activity: Activity, text: String, sizeSp: Float = 22f, marginBottom: Int = 16): TextView =
        TextView(activity).apply {
            this.text = text
            setTextColor(Color.WHITE)
            textSize = sizeSp
            setTypeface(typeface, Typeface.BOLD)
            layoutParams = LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
            ).apply { this.bottomMargin = marginBottom }
        }

    /**
     * A top app-bar: back arrow + title, dark background, bottom divider.
     * Meant to sit ABOVE the scrollable content (add to the Activity's
     * root, not inside the scaffold's scrolling column) so it stays fixed
     * while content scrolls underneath - matches how MX Player's own
     * screens are laid out, instead of a plain heading floating at the
     * top of a scroll view.
     */
    fun topBar(activity: Activity, title: String): LinearLayout {
        val back = TextView(activity).apply {
            text = "\u2190"
            setTextColor(Color.WHITE)
            textSize = 20f
            setPadding(0, 0, 24, 0)
            isClickable = true
            isFocusable = true
            setOnClickListener { activity.finish() }
        }

        val titleView = TextView(activity).apply {
            this.text = title
            setTextColor(Color.WHITE)
            textSize = 18f
            setTypeface(typeface, Typeface.BOLD)
        }

        return LinearLayout(activity).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            setPadding(24, 32, 24, 24)
            setBackgroundColor(Color.parseColor(BACKGROUND))
            layoutParams = LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
            )
            addView(back)
            addView(titleView)
        }
    }

    /**
     * Full-screen root: a fixed topBar() on top, with a scaffold()'s
     * scrollable content below it filling the rest of the screen. This is
     * the standard shell every extension screen should use - call
     * setContentView(root) with the returned root, then addView() your
     * rows into .content.
     */
    class Screen(val root: LinearLayout, val content: LinearLayout)

    fun screen(activity: Activity, title: String): Screen {
        val inner = scaffold(activity)
        val root = LinearLayout(activity).apply {
            orientation = LinearLayout.VERTICAL
            setBackgroundColor(Color.parseColor(BACKGROUND))
            layoutParams = ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT,
            )
            addView(topBar(activity, title))
            addView(
                inner.scroll,
                LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    0,
                    1f,
                ),
            )
        }
        return Screen(root, inner.content)
    }

    /** A horizontal row: weighted title on the left, one action Button on the right. */
    fun titleRow(activity: Activity, title: String, sizeSp: Float, button: android.widget.Button, marginBottom: Int = 16): LinearLayout =
        LinearLayout(activity).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            layoutParams = LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
            ).apply { this.bottomMargin = marginBottom }

            addView(
                TextView(activity).apply {
                    text = title
                    setTextColor(Color.WHITE)
                    textSize = sizeSp
                    setTypeface(typeface, Typeface.BOLD)
                    layoutParams = LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f)
                },
            )
            addView(button)
        }

    /** An empty vertical container LinearLayout(match, wrap) for lists of rows built at runtime. */
    fun container(activity: Activity): LinearLayout =
        LinearLayout(activity).apply {
            orientation = LinearLayout.VERTICAL
            layoutParams = LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
            )
        }
}
