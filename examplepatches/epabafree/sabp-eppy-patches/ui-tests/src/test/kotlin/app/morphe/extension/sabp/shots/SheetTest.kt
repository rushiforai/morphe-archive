package app.morphe.extension.sabp.shots

import android.os.SystemClock
import android.view.MotionEvent
import android.view.View
import android.widget.LinearLayout
import android.widget.ScrollView
import android.widget.TextView
import app.cash.paparazzi.DeviceConfig
import app.cash.paparazzi.Paparazzi
import app.morphe.extension.sabp.EppyTheme
import app.morphe.extension.sabp.ui.PlayerSheet
import app.morphe.extension.sabp.ui.Ui
import org.junit.Assert.assertEquals
import org.junit.Rule
import org.junit.Test

/**
 * Drives the player sheet with real touch events after a real layout pass and checks where it
 * settles: drag/fling up from the tab strip, nested scrolling (a scrolled list scrolls before the
 * sheet moves), tab swipes, Back, and tapping the handle.
 */
class SheetTest {
    @get:Rule
    val paparazzi = Paparazzi(deviceConfig = DeviceConfig.PIXEL_5, theme = "android:Theme.Material.Light.NoActionBar")

    private lateinit var sheet: PlayerSheet
    private lateinit var lists: List<ScrollView>
    private var t0 = 0L

    private fun setup(): View {
        val ctx = TestContext(paparazzi.context, mapOf("skin" to "material", "mode" to "light", "reduceMotion" to true))
        val t = EppyTheme.resolve(ctx, 0)
        val host = FakeHost(ctx, t)
        sheet = PlayerSheet(host, t)
        lists = (0 until 5).map { tab ->
            val sv = ScrollView(ctx)
            val col = LinearLayout(ctx).apply { orientation = LinearLayout.VERTICAL }
            for (i in 0 until 60) col.addView(TextView(ctx).apply {
                text = "Tab $tab · row $i"
                textSize = 18f
                setPadding(40, 30, 40, 30)
            })
            sv.addView(col)
            sv
        }
        lists.forEachIndexed { i, sv ->
            sheet.setTab(i, object : PlayerSheet.Tab {
                override fun view() = sv
                override fun refresh(full: Boolean) {}
            })
        }
        val root = sheet.root
        val w = Ui.dp(ctx, 393f)
        val h = Ui.dp(ctx, 800f)
        root.measure(View.MeasureSpec.makeMeasureSpec(w, View.MeasureSpec.EXACTLY), View.MeasureSpec.makeMeasureSpec(h, View.MeasureSpec.EXACTLY))
        root.layout(0, 0, w, h)
        // The first layout positions the sheet; lay out again so children get sizes.
        root.measure(View.MeasureSpec.makeMeasureSpec(w, View.MeasureSpec.EXACTLY), View.MeasureSpec.makeMeasureSpec(h, View.MeasureSpec.EXACTLY))
        root.layout(0, 0, w, h)
        return root
    }

    private fun ev(root: View, action: Int, x: Float, y: Float, at: Long): Boolean {
        val e = MotionEvent.obtain(t0, at, action, x, y, 0)
        val r = root.dispatchTouchEvent(e)
        e.recycle()
        return r
    }

    /** A drag from (x, y0) to (x, y1) over ms milliseconds, in 12 steps. */
    private fun drag(root: View, x: Float, y0: Float, y1: Float, ms: Long, dx: Float = 0f) {
        t0 = SystemClock.uptimeMillis()
        ev(root, MotionEvent.ACTION_DOWN, x, y0, t0)
        for (i in 1..12) ev(root, MotionEvent.ACTION_MOVE, x + dx * i / 12, y0 + (y1 - y0) * i / 12, t0 + ms * i / 12)
        ev(root, MotionEvent.ACTION_UP, x + dx, y1, t0 + ms + 1)
        root.measure(View.MeasureSpec.makeMeasureSpec(root.width, View.MeasureSpec.EXACTLY), View.MeasureSpec.makeMeasureSpec(root.height, View.MeasureSpec.EXACTLY))
        root.layout(0, 0, root.width, root.height)
    }

    private fun headerY(root: View) = root.height - sheet.peekHeight() / 2f

    @Test
    fun dragAndFling() {
        val root = setup()
        assertEquals("starts collapsed", PlayerSheet.COLLAPSED, sheet.state())
        // Slow drag from the tab strip to around 45 % of the height: rests half open.
        drag(root, root.width / 2f, headerY(root), root.height * 0.45f + sheet.peekHeight() / 2f, 900)
        assertEquals("slow drag to the middle rests half open", PlayerSheet.HALF, sheet.state())
        // Fast fling up from half: expands.
        drag(root, root.width / 2f, root.height * 0.47f, root.height * 0.30f, 60)
        assertEquals("fling up expands", PlayerSheet.EXPANDED, sheet.state())
        paparazzi.snapshot(root, "sheet-expanded")
    }

    @Test
    fun nestedScrolling() {
        val root = setup()
        sheet.show(0)
        assertEquals(PlayerSheet.EXPANDED, sheet.state())
        val list = lists[0]
        val y = root.height * 0.6f
        // Drag up inside the expanded list: the list scrolls, the sheet stays.
        drag(root, root.width / 2f, y, y - 400, 400)
        assertEquals("expanded sheet stays while the list scrolls", PlayerSheet.EXPANDED, sheet.state())
        // Drag down while the list isn't at its top: the list scrolls back, sheet stays.
        list.scrollTo(0, 300)
        drag(root, root.width / 2f, y - 200, y, 600)
        assertEquals("sheet stays while the list can still scroll up", PlayerSheet.EXPANDED, sheet.state())
        // At the top, a downward fling collapses one step (to half), another collapses.
        list.scrollTo(0, 0)
        drag(root, root.width / 2f, root.height * 0.3f, root.height * 0.5f, 60)
        assertEquals("list at top: fling down moves the sheet", PlayerSheet.HALF, sheet.state())
        paparazzi.snapshot(root, "sheet-half")
    }

    @Test
    fun tabsBackAndHandle() {
        val root = setup()
        sheet.show(1)
        assertEquals(1, sheet.currentTab())
        // Sideways swipe in the content (away from the edges) goes to the next tab.
        drag(root, root.width / 2f, root.height * 0.6f, root.height * 0.6f + 4, 120, dx = -root.width * 0.4f)
        assertEquals("swipe left → next tab", 2, sheet.currentTab())
        assertEquals("tab swipe doesn't move the sheet", PlayerSheet.EXPANDED, sheet.state())
        // Back collapses.
        assertEquals(true, sheet.onBack())
        assertEquals(PlayerSheet.COLLAPSED, sheet.state())
        assertEquals("Back when collapsed is not consumed", false, sheet.onBack())
        // Each tab keeps its scroll position.
        sheet.show(3)
        root.measure(View.MeasureSpec.makeMeasureSpec(root.width, View.MeasureSpec.EXACTLY), View.MeasureSpec.makeMeasureSpec(root.height, View.MeasureSpec.EXACTLY))
        root.layout(0, 0, root.width, root.height)
        lists[3].scrollTo(0, 500)
        assertEquals("precondition: list scrolled", 500, lists[3].scrollY)
        sheet.show(0)
        sheet.show(3)
        root.measure(View.MeasureSpec.makeMeasureSpec(root.width, View.MeasureSpec.EXACTLY), View.MeasureSpec.makeMeasureSpec(root.height, View.MeasureSpec.EXACTLY))
        root.layout(0, 0, root.width, root.height)
        assertEquals("tab 3 keeps its scroll position", 500, lists[3].scrollY)
    }
}
