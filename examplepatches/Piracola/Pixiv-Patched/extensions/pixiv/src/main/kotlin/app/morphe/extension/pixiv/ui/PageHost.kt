package app.morphe.extension.pixiv.ui

import android.app.Activity
import android.app.Dialog
import android.content.Context
import android.content.ContextWrapper
import android.content.res.Configuration
import android.graphics.Color
import android.graphics.PixelFormat
import android.graphics.drawable.ColorDrawable
import android.view.Gravity
import android.view.KeyEvent
import android.view.View
import android.view.WindowManager
import android.view.animation.AccelerateInterpolator
import android.view.animation.DecelerateInterpolator
import android.widget.FrameLayout
import android.widget.Toast

/**
 * The one full-screen window every patched page lives in.
 *
 * The pages were separate dialogs before - one window each - and that is what made the transitions
 * unreliable: a window has already laid out and drawn its content by the time a `post` callback
 * from the caller runs, so the first frame the user saw was always the finished screen, with the
 * slide only starting afterwards. A window also cannot be clicked through, so a small picker dialog
 * could not be dismissed by tapping around it, and every page switch had to fake an activity
 * transition on a window that was being created and destroyed at the same time.
 *
 * Here the window is created once per visit and keeps a stack of plain views. Pushing sets the
 * incoming page's offset synchronously, in the same call that adds it, so the frame that first
 * contains it is already the slid-in start; popping slides the top page out and drops it. BACK is
 * handled once, at the host. The picker is a scrim plus a card inside the same window, which makes
 * tapping outside it work and gives the card a real shadow.
 */
object PageHost {

    /** How long a page takes to travel across the screen, in step with Pixiv's own transitions. */
    private const val SLIDE_MILLIS = 260L

    /** Leaving is a touch quicker than arriving, the way the platform's back transitions run. */
    private const val SLIDE_BACK_MILLIS = 220L

    private const val FADE_MILLIS = 160L

    /**
     * The dim behind an in-window popup. Dark enough to read as a modal and to make the card stand
     * out, light enough that the card's own shadow still has something to fall on.
     */
    private const val SCRIM_COLOR = 0x73000000.toInt()

    /** The popup card grows into place from slightly smaller, the way the platform's own menus do. */
    private const val CARD_REST_SCALE = 0.96f

    private var host: Host? = null

    /**
     * Opens the patched pages, building the first one with [buildRoot], or does nothing when the
     * pages are already on screen.
     */
    fun open(source: View?, buildRoot: (Activity) -> View?) {
        val activity = findActivity(source?.context) ?: return
        if (activity.isFinishing || activity.isDestroyed) return
        val existing = host
        // The pages belong to one activity's window: a host left over from another one (or from a
        // window that is already gone but still reports itself as showing) has to be let go, or the
        // entry in the drawer would never open again for the rest of the process's life.
        if (existing != null && existing.isShowing && existing.activity === activity) return
        if (existing != null) {
            runCatching { existing.dialog.dismiss() }
            host = null
        }

        val root = try {
            buildRoot(activity)
        } catch (t: Throwable) {
            Toast.makeText(activity, "${Strings.pageTitle}: ${t.message}", Toast.LENGTH_SHORT).show()
            null
        } ?: return

        try {
            val dialog = Dialog(activity, theme(activity))
            val session = Host(activity, dialog)
            session.addRoot(root)
            dialog.setContentView(session.root)
            dialog.setCancelable(false)
            dialog.setOnKeyListener { _, keyCode, event -> session.onKey(keyCode, event) }
            dialog.setOnDismissListener { if (host === session) host = null }

            // Everything that shapes the window before its first frame is set before it is shown:
            // a dim or a window animation that was cleared afterwards would already have been drawn
            // once, which is the flash this host exists to avoid.
            dialog.window?.apply {
                setFormat(PixelFormat.TRANSLUCENT)
                setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE)
                setLayout(
                    WindowManager.LayoutParams.MATCH_PARENT,
                    WindowManager.LayoutParams.MATCH_PARENT
                )
                // The window carries no paint of its own: the pages paint themselves, and the strip
                // a page has not reached yet has to show the screen underneath, or the slide would
                // travel over a background that never moves.
                setBackgroundDrawable(ColorDrawable(Color.TRANSPARENT))
                clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND)
                setWindowAnimations(0)
            }

            host = session
            dialog.show()
            session.animateRootIn()
        } catch (t: Throwable) {
            host = null
            Toast.makeText(activity, "${Strings.pageTitle}: ${t.message}", Toast.LENGTH_SHORT).show()
        }
    }

    /** Puts a new page on top of the stack and slides it in from the right edge. */
    fun push(page: View?) {
        if (page == null) return
        host?.push(page)
    }

    /** Slides the top page back out and returns to the one below it. */
    fun pop() {
        host?.pop()
    }

    /** Closes the whole host: the stack slides out and the window goes away with it. */
    fun close() {
        host?.close()
    }

    /** Shows a popup above the current page, over a scrim that dismisses it when tapped. */
    fun showOverlay(content: View) {
        host?.showOverlay(content)
    }

    fun dismissOverlay() {
        host?.dismissOverlay()
    }

    private fun theme(context: Context): Int {
        val dark = (context.resources.configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK) ==
            Configuration.UI_MODE_NIGHT_YES
        return if (dark) {
            android.R.style.Theme_Material_NoActionBar
        } else {
            android.R.style.Theme_Material_Light_NoActionBar
        }
    }

    private fun findActivity(context: Context?): Activity? {
        var current = context
        while (current is ContextWrapper) {
            if (current is Activity) return current
            current = current.baseContext
        }
        return current as? Activity
    }

    private class Host(val activity: Activity, val dialog: Dialog) {

        /** The window's content: the page stack, with popups added over it. */
        val root = FrameLayout(activity)

        private val container = FrameLayout(activity)
        private val pages = ArrayList<View>()
        private var overlay: View? = null
        private var closing = false

        val isShowing: Boolean get() = dialog.isShowing

        init {
            root.addView(container, matchParent())
        }

        fun addRoot(page: View) {
            page.translationX = offscreen()
            container.addView(page, matchParent())
            pages.add(page)
        }

        /** Runs once the window is attached, so the first traversal draws the page already offset. */
        fun animateRootIn() {
            val page = pages.lastOrNull() ?: return
            page.animate()
                .translationX(0f)
                .setDuration(SLIDE_MILLIS)
                .setInterpolator(DecelerateInterpolator())
                .start()
        }

        fun push(page: View) {
            if (closing) return
            // Set before the page is added: the offset is part of the very first frame that contains
            // it, which is exactly what the old `post` version could not promise.
            page.translationX = offscreen()
            container.addView(page, matchParent())
            pages.add(page)
            page.animate()
                .translationX(0f)
                .setDuration(SLIDE_MILLIS)
                .setInterpolator(DecelerateInterpolator())
                .start()
        }

        fun pop() {
            if (closing) return
            if (overlay != null) {
                dismissOverlay()
                return
            }
            if (pages.size <= 1) {
                close()
                return
            }
            val page = pages.removeAt(pages.size - 1)
            page.animate()
                .translationX(offscreen())
                .setDuration(SLIDE_BACK_MILLIS)
                .setInterpolator(AccelerateInterpolator())
                .withEndAction { container.removeView(page) }
                .start()
        }

        fun close() {
            if (closing) return
            closing = true
            removeOverlayNow()
            if (!dialog.isShowing) {
                if (host === this) host = null
                return
            }
            root.animate()
                .translationX(offscreen())
                .setDuration(SLIDE_BACK_MILLIS)
                .setInterpolator(AccelerateInterpolator())
                .withEndAction { runCatching { dialog.dismiss() } }
                .start()
        }

        fun showOverlay(content: View) {
            if (overlay != null || closing) return
            val params = (content.layoutParams as? FrameLayout.LayoutParams)
                ?: FrameLayout.LayoutParams(
                    FrameLayout.LayoutParams.WRAP_CONTENT,
                    FrameLayout.LayoutParams.WRAP_CONTENT
                )
            params.gravity = Gravity.CENTER

            val scrim = View(activity).apply {
                setBackgroundColor(SCRIM_COLOR)
                isClickable = true
                setOnClickListener { dismissOverlay() }
            }
            val layer = FrameLayout(activity).apply {
                alpha = 0f
                addView(scrim, matchParent())
                addView(content, params)
            }
            content.scaleX = CARD_REST_SCALE
            content.scaleY = CARD_REST_SCALE

            root.addView(layer, matchParent())
            overlay = layer
            layer.animate().alpha(1f).setDuration(FADE_MILLIS).start()
            content.animate()
                .scaleX(1f)
                .scaleY(1f)
                .setDuration(FADE_MILLIS)
                .setInterpolator(DecelerateInterpolator())
                .start()
        }

        fun dismissOverlay() {
            val layer = overlay ?: return
            overlay = null
            layer.animate()
                .alpha(0f)
                .setDuration(FADE_MILLIS)
                .withEndAction { root.removeView(layer) }
                .start()
        }

        fun onKey(keyCode: Int, event: KeyEvent): Boolean {
            if (keyCode != KeyEvent.KEYCODE_BACK) return false
            if (event.action == KeyEvent.ACTION_UP) pop()
            return true
        }

        private fun removeOverlayNow() {
            val layer = overlay ?: return
            overlay = null
            root.removeView(layer)
        }

        private fun matchParent() = FrameLayout.LayoutParams(
            FrameLayout.LayoutParams.MATCH_PARENT,
            FrameLayout.LayoutParams.MATCH_PARENT
        )

        /**
         * The distance a page has to start from to be out of sight. Before the window is attached
         * the container has no width yet, and the display width is the same distance.
         */
        private fun offscreen(): Float =
            (if (container.width > 0) container.width else activity.resources.displayMetrics.widthPixels)
                .toFloat()
    }
}
