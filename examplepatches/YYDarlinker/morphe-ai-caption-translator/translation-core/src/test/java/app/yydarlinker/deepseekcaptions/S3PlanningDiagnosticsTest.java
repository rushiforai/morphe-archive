package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.content.Context;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.*;

/** Miss diagnostics through the real Controller bridge, including uncached empty authored plans. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, manifest = Config.NONE)
@LooperMode(LooperMode.Mode.PAUSED)
public class S3PlanningDiagnosticsTest {
    final S2DisplayPlanningTest fixture = new S2DisplayPlanningTest();
    final List<String> marks = new ArrayList<>();

    @Before public void before() throws Exception {
        fixture.before();
        TranslationRuntime.install(new TranslationRuntime.Host() {
            TranslationSettings settings(Context c) { throw new AssertionError("no settings read"); }
            TranslationSourceAccess.Source load(Context c, String u, boolean translate,
                    DeepSeekApiClient.RequestControl control) { throw new AssertionError("no IO"); }
            void mark(Context c, String stage, String detail, CaptionCredentialRef credential) {
                marks.add(stage + ":" + detail);
            }
        });
    }
    @After public void after() throws Exception { fixture.after(); }

    @Test public void automaticMissLogsOnceAndHitsStaySilent() throws Exception {
        RebuildController.Session s = fixture.session(RebuildDisplayGroupsTest.words("one."), false);
        RebuildProtocol.Plan plan = new RebuildProtocol.Plan(Collections.singletonList(
                new RebuildProtocol.Event(0, 0, 0, 399, "一。")), "{}");
        List<RebuildDisplayGroups.Unit> first = fixture.units(s, plan);
        String expected = "REBUILD_UNIT_MODE:session=" + s.id
                + ";block=0;authored=false;url=fixture";
        assertEquals(Collections.singletonList(expected), marks);
        assertSame(first, fixture.units(s, plan));
        assertEquals(Collections.singletonList(expected), marks);
        fixture.budget = new CaptionPresentationBudget(900, 12, 20, fixture.language.renderSpec);
        assertNotSame(first, fixture.units(s, plan));
        assertEquals(Arrays.asList(expected, expected), marks);
        s.source = null;
        assertNull(fixture.anchors(s, first.get(0)));
    }

    @Test public void emptyAuthoredMissesRepeatBothMarksWithoutReplacingCachedPlan() throws Exception {
        RebuildController.Session s = fixture.session(RebuildDisplayGroupsTest.words("one."), true);
        RebuildProtocol.Plan full = new RebuildProtocol.Plan(Collections.singletonList(
                new RebuildProtocol.Event(0, 0, 0, 399, "一。")), "{}");
        List<RebuildDisplayGroups.Unit> first = fixture.units(s, full);
        assertEquals(2, marks.size());
        marks.clear();
        RebuildProtocol.Plan empty = new RebuildProtocol.Plan(Collections.emptyList(), "{}");
        s.work.initialize(1);s.work.slots[0].provisional = empty;
        assertTrue(fixture.units(s, empty).isEmpty());
        List<String> expected = Arrays.asList(
                "REBUILD_CUE_PROJECTION:session=" + s.id
                        + ";block=0;groups=1;cue_pages=0;event_pages=0;events=0;partial=true",
                "REBUILD_UNIT_MODE:session=" + s.id
                        + ";block=0;authored=true;partial=true;units=0;cue_pages=0;event_pages=0;"
                        + "cues=1;groups=1;events_per_group=0:0"
                        + ";url=fixture");
        assertEquals(expected, marks);
        assertTrue(fixture.units(s, empty).isEmpty());
        List<String> twice = new ArrayList<>(expected); twice.addAll(expected);
        assertEquals(twice, marks);
        assertSame(first, fixture.units(s, full));
        assertEquals(twice, marks);
    }
}
