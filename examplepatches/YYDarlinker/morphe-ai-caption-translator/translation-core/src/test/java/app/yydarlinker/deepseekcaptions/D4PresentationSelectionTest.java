package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.content.Context;
import android.os.SystemClock;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Collections;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;

/** Real controller/guard boundary with a controlled platform clock and no source or model IO. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, manifest = Config.NONE)
@LooperMode(LooperMode.Mode.PAUSED)
public class D4PresentationSelectionTest {
    private final AtomicLong clock = new AtomicLong(1000);
    private final AtomicInteger clockState = new AtomicInteger(2);
    private final List<TranslationOutput.RenderGuard> guards = new ArrayList<>();
    private final List<String> texts = new ArrayList<>();
    private Object oldHost, oldSink;
    private RebuildController.Session session;

    private static Field field(Class<?> type, String name) throws Exception {
        Field f = type.getDeclaredField(name); f.setAccessible(true); return f;
    }
    private static Object call(String name, RebuildController.Session session) throws Exception {
        Method m = RebuildController.class.getDeclaredMethod(name, RebuildController.Session.class);
        m.setAccessible(true); return m.invoke(null, session);
    }
    private static TranslationSourceAccess.Source raw(String json) throws Exception {
        byte[] bytes = json.getBytes(StandardCharsets.UTF_8);
        return new TranslationSourceAccess.Source(bytes, CaptionDocument.parse(bytes, "application/json"), "", 0, null);
    }
    private RebuildController.Session create(boolean sourceOnly) throws Exception {
        RebuildController.Session s = new RebuildController.Session(RuntimeEnvironment.getApplication(),
                "https://www.youtube.com/api/timedtext?v=d4-video&lang=en", "d4-video", "d4-fixture", "zh-Hans",
                new TranslationSettings(true, "https://example.invalid/v1", "fixture", "faithful", "fixture-key", "stored_custom"),
                sourceOnly, true, CaptionLanguageContext.explicit("en", "zh-Hans"));
        s.position = clock.get();
        field(RebuildController.class, "active").set(null, s);
        call("position", s); // Establish the first serial with the real CLOCK.
        return s;
    }

    @Before public void setup() throws Exception {
        oldHost = field(TranslationRuntime.class, "host").get(null);
        oldSink = field(TranslationOutput.class, "sink").get(null);
        TranslationRuntime.install(new TranslationRuntime.Host() {
            TranslationSettings settings(Context c) { throw new AssertionError("unexpected settings"); }
            TranslationSourceAccess.Source load(Context c, String u, boolean t,
                    DeepSeekApiClient.RequestControl control) { throw new AssertionError("unexpected IO"); }
            TranslationRuntime.ClockSample clock(String owner) {
                return new TranslationRuntime.ClockSample(true, "d4-video", clock.get(), SystemClock.elapsedRealtime(), clockState.get(), 1f);
            }
        });
        TranslationOutput.install(new TranslationOutput.Sink() {
            public void showStatus(String text, TranslationOutput.RenderGuard guard) { texts.add(text); guards.add(guard); }
            public void showWaitingEvent(String text, TranslationOutput.RenderGuard guard, String id, long start, long end, long at) {
                texts.add(text); guards.add(guard);
            }
            public void showEvent(String text, TranslationOutput.RenderGuard guard, String id, long start, long end, long at, CaptionRenderSpec spec) {
                texts.add(text); guards.add(guard);
            }
        });
        RebuildController.stop();
        RebuildController.video("d4-video");
    }

    @After public void teardown() throws Exception {
        RebuildController.stop();
        field(TranslationRuntime.class, "host").set(null, oldHost);
        field(TranslationOutput.class, "sink").set(null, oldSink);
    }

    @Test public void applicationTimeNativeSeekInvalidatesGuardAndConsumesSerialOnce() throws Exception {
        session = create(false);
        session.status = "pending";
        call("render", session);
        TranslationOutput.RenderGuard guard = guards.get(0);
        assertTrue(guard.isValid());
        int generation = session.generation;
        clock.set(1100);
        assertEquals(1100, guard.displayPosition(1000));
        assertEquals(generation + 1, session.generation);
        assertFalse(guard.isValid());
        guard.onApplied();
        assertNotEquals(session.renderRevision, session.appliedRenderRevision);
        guard.displayPosition(1000);
        assertEquals("the same seek serial is not consumed twice", generation + 1, session.generation);
    }

    @Test public void generationIsCapturedBeforeSelectionDiscoversSeekAndOldGuardKeepsItsWindow() throws Exception {
        session = create(false);
        session.raw = raw("{\"events\":[{\"tStartMs\":0,\"dDurationMs\":1500,\"segs\":[{\"utf8\":\"one\"}]},"
                + "{\"tStartMs\":1500,\"dDurationMs\":1500,\"segs\":[{\"utf8\":\"two\"}]}]}");
        call("render", session);
        TranslationOutput.RenderGuard first = guards.get(0);
        assertEquals(0, first.windowStart()); assertEquals(1500, first.windowEnd());
        int generation = session.generation;
        clock.set(2000);
        call("render", session);
        TranslationOutput.RenderGuard discovered = guards.get(1);
        assertEquals(generation + 1, session.generation);
        assertFalse("selection discovered the seek after generation capture", discovered.isValid());
        assertEquals("the reused selection cannot change an earlier guard", 0, first.windowStart());
        assertEquals(1500, first.windowEnd());
        call("render", session);
        TranslationOutput.RenderGuard retried = guards.get(2);
        assertTrue("unapplied content is submitted again", retried.isValid());
        assertEquals(1500, retried.windowStart()); assertEquals(3000, retried.windowEnd());
        assertFalse(first.isValid()); assertFalse(discovered.isValid());
    }

    @Test public void sourceModeReclassifiesTheCurrentUrlWithoutAnotherSession() throws Exception {
        session = create(true);
        session.raw = raw("{\"events\":[{\"tStartMs\":0,\"dDurationMs\":3000,\"segs\":[{\"utf8\":\"Manual\\nline\"}]}]}");
        session.source = new RebuildSource(Arrays.asList(
                new RebuildSource.Word("Machine", 0, 1500, 0, RebuildSource.Precision.NATIVE),
                new RebuildSource.Word("words", 1500, 3000, 0, RebuildSource.Precision.NATIVE)));
        call("render", session);
        assertEquals("Manual\nline", texts.get(0));
        session.url += "&kind=asr";
        call("render", session);
        assertEquals("Machine words", texts.get(1));
        assertSame(session, field(RebuildController.class, "active").get(null));
    }

    @Test public void pendingPlanIsAdoptedOnlyAfterTheShownPageBoundary() throws Exception {
        clockState.set(3);
        session = create(false);
        session.source = new RebuildSource(Arrays.asList(
                new RebuildSource.Word("First.", 0, 1500, 0, RebuildSource.Precision.NATIVE),
                new RebuildSource.Word("Second.", 1500, 3000, 1, RebuildSource.Precision.NATIVE)));
        session.blocks = Collections.singletonList(new RebuildPlanner.Block(0, 0, 1, session.source));
        session.presentation.configure(session.source, session.blocks, session.languageContext);
        session.work.initialize(1);
        RebuildProtocol.Plan original = new RebuildProtocol.Plan(Collections.singletonList(
                new RebuildProtocol.Event(0, 0, 0, 1500, "旧页。")), "{}");
        RebuildProtocol.Plan replacement = new RebuildProtocol.Plan(Arrays.asList(
                new RebuildProtocol.Event(0, 0, 0, 1500, "改写旧页。"),
                new RebuildProtocol.Event(1, 1, 1500, 3000, "新页。")), "{}");
        session.work.slots[0].accepted = original;
        session.work.slots[0].state = RebuildController.READY;
        call("render", session);
        assertEquals("旧页。", texts.get(texts.size() - 1));
        session.work.slots[0].pending = replacement;
        call("render", session);
        assertSame(original, session.work.slots[0].accepted);
        assertSame(replacement, session.work.slots[0].pending);
        int generation = session.generation;
        clock.set(1600);
        call("render", session);
        assertEquals(generation, session.generation);
        assertSame(replacement, session.work.slots[0].accepted);
        assertNull(session.work.slots[0].pending);
        assertEquals("新页。", texts.get(texts.size() - 1));
    }
}
