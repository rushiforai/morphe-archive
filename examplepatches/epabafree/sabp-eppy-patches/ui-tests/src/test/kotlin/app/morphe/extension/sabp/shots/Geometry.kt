package app.morphe.extension.sabp.shots

import android.view.View
import android.view.ViewGroup
import org.junit.Assert.assertTrue

/** Geometry helpers: positions relative to an ancestor, computed from a real measure/layout pass. */
object Geometry {
    fun layout(root: View, widthPx: Int) {
        root.measure(
            View.MeasureSpec.makeMeasureSpec(widthPx, View.MeasureSpec.EXACTLY),
            View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED),
        )
        root.layout(0, 0, root.measuredWidth, root.measuredHeight)
    }

    /** Left/top of v inside ancestor. */
    fun offset(v: View, ancestor: View): IntArray {
        var x = 0
        var y = 0
        var cur: View? = v
        while (cur != null && cur !== ancestor) {
            x += cur.left
            y += cur.top
            val p = cur.parent
            if (p is View && p !== ancestor) {
                x -= p.scrollX
                y -= p.scrollY
            }
            cur = p as? View
        }
        return intArrayOf(x, y)
    }

    fun centerX(v: View, ancestor: View) = offset(v, ancestor)[0] + v.width / 2f
    fun centerY(v: View, ancestor: View) = offset(v, ancestor)[1] + v.height / 2f

    fun assertNear(what: String, a: Float, b: Float, tolerancePx: Float) {
        assertTrue("$what: $a vs $b (tolerance $tolerancePx px)", Math.abs(a - b) <= tolerancePx)
    }

    /** All descendants of type T. */
    inline fun <reified T : View> find(root: View): List<T> = findAll(root, T::class.java)

    fun <T : View> findAll(root: View, type: Class<T>): List<T> {
        val out = ArrayList<T>()
        val stack = ArrayDeque<View>()
        stack.add(root)
        while (stack.isNotEmpty()) {
            val v = stack.removeFirst()
            if (type.isInstance(v)) out.add(type.cast(v))
            if (v is ViewGroup) for (i in 0 until v.childCount) stack.add(v.getChildAt(i))
        }
        return out
    }
}
