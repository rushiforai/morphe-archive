package app.morphe.extension.sabp.shots

import android.os.SystemClock
import android.view.MotionEvent
import android.view.View
import android.widget.FrameLayout
import app.cash.paparazzi.DeviceConfig
import app.cash.paparazzi.Paparazzi
import app.morphe.extension.sabp.EppyTheme
import app.morphe.extension.sabp.ui.CoverGestures
import org.junit.Assert.assertEquals
import org.junit.Rule
import org.junit.Test

/** Double-tap seeking: taps classified from real touch events on a laid-out cover. */
class CoverGesturesTest {
    @get:Rule
    val paparazzi = Paparazzi(deviceConfig = DeviceConfig.PIXEL_5, theme = "android:Theme.Material.Light.NoActionBar")

    private val steps = ArrayList<Int>()
    private var singles = 0
    private lateinit var frame: FrameLayout
    private lateinit var g: CoverGestures

    private fun setup() {
        val ctx = TestContext(paparazzi.context, mapOf("skin" to "material", "mode" to "light", "doubleTapSeconds" to 10, "reduceMotion" to true))
        val t = EppyTheme.resolve(ctx, 0)
        frame = FrameLayout(ctx)
        g = CoverGestures(ctx, t, { side, s -> steps.add(side * s) }, frame) { singles++ }
        frame.measure(View.MeasureSpec.makeMeasureSpec(800, View.MeasureSpec.EXACTLY), View.MeasureSpec.makeMeasureSpec(800, View.MeasureSpec.EXACTLY))
        frame.layout(0, 0, 800, 800)
    }

    private var clock = SystemClock.uptimeMillis()

    private fun tap(x: Float, gapMs: Long = 120) {
        clock += gapMs
        val down = MotionEvent.obtain(clock, clock, MotionEvent.ACTION_DOWN, x, 400f, 0)
        val up = MotionEvent.obtain(clock, clock + 40, MotionEvent.ACTION_UP, x, 400f, 0)
        frame.dispatchTouchEvent(down)
        frame.dispatchTouchEvent(up)
        down.recycle()
        up.recycle()
        clock += 40
    }

    @Test
    fun singleTapDoesNotSeek() {
        setup()
        tap(200f)
        assertEquals("a single tap never seeks", 0, steps.size)
    }

    @Test
    fun doubleTapAndAccumulate() {
        setup()
        tap(150f)
        tap(150f)
        assertEquals("double-tap left = one step back", listOf(-10), steps)
        tap(160f, 300)
        tap(170f, 300)
        assertEquals("further taps on the same side accumulate", listOf(-10, -10, -10), steps)
        assertEquals(-30, g.total())
        // The other side starts a new burst in the other direction.
        tap(650f, 300)
        assertEquals(listOf(-10, -10, -10, 10), steps)
        assertEquals(10, g.total())
    }

    @Test
    fun slowTapsAreNotADoubleTap() {
        setup()
        tap(650f)
        tap(650f, 800)
        assertEquals("taps 800 ms apart are two single taps", 0, steps.size)
    }
}
