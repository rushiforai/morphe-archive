package app.ckzombies.extension;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;

import android.view.SurfaceHolder;

import org.junit.Test;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class ScreenFitTest {

    /** A holder that only records the calls made to it. */
    private static SurfaceHolder holder(final List<String> calls) {
        return (SurfaceHolder) Proxy.newProxyInstance(SurfaceHolder.class.getClassLoader(),
                new Class<?>[] {SurfaceHolder.class}, new InvocationHandler() {
                    public Object invoke(Object proxy, Method method, Object[] args) {
                        calls.add(method.getName() + (args == null ? "" : Arrays.toString(args)));
                        return null;
                    }
                });
    }

    private static List<String> fit(int width, int height) {
        List<String> calls = new ArrayList<String>();
        ScreenFit.fit(holder(calls), width, height);
        return calls;
    }

    @Test
    public void aSharperScreenGetsA720HighSurfaceOfTheSameShape() {
        // The game's view on the 1080p phones of the test lab, and a 1440p one.
        assertArrayEquals(new int[] {1339, 720}, ScreenFit.surfaceSize(2009, 1080));
        assertArrayEquals(new int[] {1280, 720}, ScreenFit.surfaceSize(2560, 1440));
        assertArrayEquals(new int[] {1152, 720}, ScreenFit.surfaceSize(2560, 1600));
        assertArrayEquals(new int[] {720, 1339}, ScreenFit.surfaceSize(1080, 2009));
    }

    @Test
    public void a720pOrSmallerScreenKeepsItsOwnSize() {
        assertArrayEquals(new int[] {1475, 720}, ScreenFit.surfaceSize(1475, 720));
        assertArrayEquals(new int[] {800, 480}, ScreenFit.surfaceSize(800, 480));
        assertArrayEquals(new int[] {720, 1475}, ScreenFit.surfaceSize(720, 1475));
    }

    @Test
    public void theSurfaceIsFixedAndTouchesAreScaledToIt() {
        assertEquals(Collections.singletonList("setFixedSize[1339, 720]"), fit(2009, 1080));
        assertEquals(0, ScreenFit.x(0));
        assertEquals(1339, ScreenFit.x(2009));
        assertEquals(720, ScreenFit.y(1080));
        // The Store button's middle: (52, 665) on the surface, pressed at (78, 998) on the view.
        assertEquals(51, ScreenFit.x(78));
        assertEquals(665, ScreenFit.y(998));
    }

    @Test
    public void theDragThresholdShrinksWithTheSurface() {
        fit(2009, 1080);
        // The game's own value for a 1080p display, 1080 * 10 / 320, becomes the one for 720p.
        assertEquals(720 * 10 / 320, ScreenFit.threshold(1080 * 10 / 320));
        assertEquals(1, ScreenFit.threshold(1));
        fit(1080, 2009);
        assertEquals(22, ScreenFit.threshold(33));
    }

    @Test
    public void aSmallScreenIsLeftAsItIs() {
        assertEquals(Collections.singletonList("setSizeFromLayout"), fit(1475, 720));
        assertEquals(1234, ScreenFit.x(1234));
        assertEquals(567, ScreenFit.y(567));
        assertEquals(22, ScreenFit.threshold(22));
    }

    @Test
    public void everyLayoutSizesItsHolderEvenWhenTheSizeIsTheSame() {
        // A second view of the same size, after the game was closed and opened in one process.
        fit(2009, 1080);
        assertEquals(Collections.singletonList("setFixedSize[1339, 720]"), fit(2009, 1080));
    }

    @Test
    public void aViewGoingFromLargeToSmallGivesTheSurfaceBack() {
        fit(2009, 1080);
        assertEquals(Collections.singletonList("setSizeFromLayout"), fit(1339, 720));
        assertEquals(100, ScreenFit.x(100));
    }

    @Test
    public void aViewWithoutASizeIsIgnored() {
        fit(2009, 1080);
        assertEquals(Collections.emptyList(), fit(0, 1080));
        assertEquals(Collections.emptyList(), fit(2009, 0));
        assertEquals(720, ScreenFit.y(1080));
    }
}
