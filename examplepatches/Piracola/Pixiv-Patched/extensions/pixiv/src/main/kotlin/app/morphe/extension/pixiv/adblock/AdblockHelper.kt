package app.morphe.extension.pixiv.adblock

import android.view.View
import android.view.ViewGroup

object AdblockHelper {

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

    /**
     * Collapses the bottom banner frame (Lvy6;) of the illustration detail, fullscreen and novel text
     * screens. The frame is sized to 50dp plus 8dp top/bottom margin and keeps its own opaque
     * background, so hiding only its children leaves a 66dp strip behind.
     */
    @JvmStatic
    fun collapseOverlayFrame(frame: View?) {
        if (frame == null) return
        try {
            frame.visibility = View.GONE
            frame.layoutParams?.let { lp ->
                lp.width = 0
                lp.height = 0
                if (lp is ViewGroup.MarginLayoutParams) {
                    lp.setMargins(0, 0, 0, 0)
                }
                frame.layoutParams = lp
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
