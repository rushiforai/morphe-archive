package app.wordfeudwordfinder.extension.play;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.junit.After;
import org.junit.Test;

public class RefreshDiagnosticTest {
    @After
    public void reset() {
        RefreshDiagnostic.clearLast();
    }

    @Test
    public void buildsOneLineFromSteps() {
        List<String> published = new ArrayList<>();
        RefreshDiagnostic d = new RefreshDiagnostic(published::add);
        d.strategy("RouteBounce");
        d.step("activity=MainActivity");
        d.step("engine=via getFlutterEngine OK");
        d.step("dartExecutor OK");
        d.step(RefreshDiagnostic.message("send", "flutter/navigation", 63) + " OK");
        assertNull(RefreshDiagnostic.last());
        d.finish();
        String expected = "RouteBounce: activity=MainActivity | engine=via getFlutterEngine OK | dartExecutor OK"
                + " | send(flutter/navigation,63B) OK";
        assertEquals(expected, RefreshDiagnostic.last());
        assertEquals(1, published.size());
        assertEquals("RouteBounce: FAILED 0/? sent", published.get(0)); // the listener gets the summary
        d.step("late"); // ignored after finish
        d.finish();
        assertEquals(1, published.size());
        assertEquals(expected, d.text());
        assertTrue(d.isFinished());
    }

    @Test
    public void jniFallbackText() {
        RefreshDiagnostic d = new RefreshDiagnostic(null);
        d.strategy("RouteBounce");
        d.step("activity=MainActivity");
        d.step("engine: NoSuchMethodException getFlutterEngine on MainActivity");
        d.step("engine fields: none");
        d.step("-> FlutterJNI path");
        d.step("jni=captured, dispatchPlatformMessage via getMethod");
        d.step(RefreshDiagnostic.message("dispatch", "flutter/navigation", 63) + " OK");
        assertEquals("RouteBounce: activity=MainActivity | engine: NoSuchMethodException getFlutterEngine on "
                + "MainActivity | engine fields: none | -> FlutterJNI path | jni=captured, dispatchPlatformMessage "
                + "via getMethod | dispatch(flutter/navigation,63B) OK", d.text());
    }

    @Test
    public void summaryIsShort() {
        List<String> published = new ArrayList<>();
        RefreshDiagnostic d = new RefreshDiagnostic(published::add);
        d.strategy("ForegroundSignal");
        d.expect(2);
        d.step("jni=captured, dispatchPlatformMessage via getMethod");
        d.sent("jni", "dispatch(x,3B) OK");
        assertEquals("ForegroundSignal: FAILED 1/2 sent", d.summary());
        d.sent("jni", "dispatch(x,3B) OK");
        d.finish();
        assertEquals(Arrays.asList("ForegroundSignal: jni 2/2 OK"), published);
        assertEquals("ForegroundSignal: jni=captured, dispatchPlatformMessage via getMethod | dispatch(x,3B) OK"
                + " | dispatch(x,3B) OK", RefreshDiagnostic.last());
    }

    @Test
    public void summaryKeepsTheFirstFailureAndIsCapped() {
        RefreshDiagnostic d = new RefreshDiagnostic(null);
        d.strategy("ForegroundSignal");
        d.step("jni=none");
        d.fail("no FlutterJNI");
        d.fail("not possible");
        assertEquals("ForegroundSignal: FAILED no FlutterJNI", d.summary());
        assertEquals("ForegroundSignal: jni=none | no FlutterJNI | not possible", d.text());
        d.strategy("Other");
        d.fail("send #1 IllegalStateException " + "x".repeat(200));
        assertEquals(RefreshDiagnostic.MAX_SUMMARY, d.summary().length());
        assertTrue(d.summary().startsWith("Other: FAILED send #1 IllegalStateException"));
        assertEquals("no strategies", new RefreshDiagnostic(null).summary());
    }

    @Test
    public void textIsOneLineAndCapped() {
        RefreshDiagnostic d = new RefreshDiagnostic(null);
        d.strategy("A\nB");
        for (int i = 0; i < 100; i++) d.step("step\r\n" + i);
        String t = d.text();
        assertFalse(t.contains("\n") || t.contains("\r"));
        assertEquals(RefreshDiagnostic.MAX_LENGTH, t.length());
    }

    @Test
    public void reasonUnwrapsReflection() {
        Throwable t = new InvocationTargetException(new IllegalStateException("Not attached"));
        assertEquals("IllegalStateException Not attached", RefreshDiagnostic.reason(t));
        assertEquals("NoSuchMethodException", RefreshDiagnostic.reason(new NoSuchMethodException()));
    }

    @Test
    public void failingListenerIsSwallowed() {
        RefreshDiagnostic d = new RefreshDiagnostic(s -> { throw new IllegalStateException(); });
        d.step("x");
        d.finish();
        assertEquals("x", RefreshDiagnostic.last());
    }
}
