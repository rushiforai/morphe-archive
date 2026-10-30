package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import java.lang.reflect.*;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Pre-extraction observations through the unchanged Controller. No planner copy or new hook. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, manifest = Config.NONE)
@LooperMode(LooperMode.Mode.PAUSED)
public class S2DisplayPlanningTest {
    final CaptionLanguageContext language = CaptionLanguageContext.explicit("en", "zh-Hans");
    CaptionPresentationBudget budget;
    Object oldSink, oldHost;

    static Object field(Class<?> type, String name, Object target) throws Exception {
        Field f = type.getDeclaredField(name); f.setAccessible(true); return f.get(target);
    }
    static void set(Class<?> type, String name, Object target, Object value) throws Exception {
        Field f = type.getDeclaredField(name); f.setAccessible(true); f.set(target, value);
    }
    static Object call(String name, Class<?>[] types, Object... args) throws Exception {
        Method m = RebuildController.class.getDeclaredMethod(name, types);
        m.setAccessible(true); return m.invoke(null, args);
    }
    @Before public void before() throws Exception {
        RebuildController.stop();
        oldSink = field(TranslationOutput.class, "sink", null);
        oldHost = field(TranslationRuntime.class, "host", null);
        TranslationRuntime.install(new TranslationRuntime.Host() {
            TranslationSettings settings(android.content.Context c) { throw new AssertionError("no settings lookup"); }
            TranslationSourceAccess.Source load(android.content.Context c, String u, boolean translate,
                    DeepSeekApiClient.RequestControl control) { throw new AssertionError("no source/network access"); }
        });
        TranslationOutput.install(new TranslationOutput.Sink() {
            public CaptionPresentationBudget budget() { return budget; }
        });
    }
    @After public void after() throws Exception {
        RebuildController.stop();
        set(TranslationOutput.class, "sink", null, oldSink);
        set(TranslationRuntime.class, "host", null, oldHost);
    }
    RebuildController.Session session(RebuildSource source, boolean authored) throws Exception {
        RebuildController.Session s = new RebuildController.Session(
                RuntimeEnvironment.getApplication(), "fixture", (String)field(RebuildController.class, "video", null),
                "s2-fixture", "zh-Hans", new TranslationSettings(true, "https://example.invalid/v1",
                "fixture-model", "faithful", "fixture-key", "stored_custom"), false, true, language);
        s.source = source;
        s.blocks = Collections.singletonList(authored
                ? new RebuildPlanner.Block(0, 0, source.words.size()-1, source,
                        RebuildPlanner.cueRanges(source, 0, source.words.size()-1))
                : new RebuildPlanner.Block(0, 0, source.words.size()-1, source));
        s.presentation.configure(s.source, s.blocks, s.languageContext);
        return s;
    }
    @SuppressWarnings("unchecked")
    List<RebuildDisplayGroups.Unit> units(RebuildController.Session s, RebuildProtocol.Plan plan) throws Exception {
        return (List<RebuildDisplayGroups.Unit>)call("displayUnits",
                new Class<?>[]{RebuildController.Session.class, int.class, RebuildProtocol.Plan.class}, s, 0, plan);
    }
    static String rows(List<RebuildDisplayGroups.Unit> units) {
        List<String> out = new ArrayList<>();
        for (RebuildDisplayGroups.Unit u : units) out.add(u.from+"-"+u.to+"@"+u.start+"-"+u.end+"="+u.text);
        return out.toString();
    }
    @Test public void originalCacheUsesPlanIdentityAndEffectiveMeasurementGeometry() throws Exception {
        RebuildSource source = RebuildDisplayGroupsTest.words("ranked", "second.", "Heck,", "first.");
        RebuildController.Session s = session(source, false);
        RebuildProtocol.Plan plan = new RebuildProtocol.Plan(Arrays.asList(
                new RebuildProtocol.Event(0,1,0,799,"排在第二"),
                new RebuildProtocol.Event(2,3,800,1599,"有的排第一。")), "{}");
        List<RebuildDisplayGroups.Unit> first = units(s, plan);
        assertEquals("[0-3@0-1599=排在第二\u200b有的排第一。]", rows(first));
        assertSame(first, units(s, plan));
        budget = new CaptionPresentationBudget(900, 12, 20, language.renderSpec);
        List<RebuildDisplayGroups.Unit> measured = units(s, plan);
        assertNotSame(first, measured); assertEquals(rows(first), rows(measured));
        budget = new CaptionPresentationBudget(900, 10, 20, language.renderSpec);
        assertSame("minimum is not part of the grouping measurement key", measured, units(s, plan));
        budget = new CaptionPresentationBudget(900, 10, 20,
                CaptionLanguageContext.explicit("ja", "en").renderSpec);
        assertSame("foreign-target spec falls back to session measurement", measured, units(s, plan));
        budget = new CaptionPresentationBudget(800, 10, 20, language.renderSpec);
        List<RebuildDisplayGroups.Unit> narrower = units(s, plan); assertNotSame(measured, narrower);
        budget = new CaptionPresentationBudget(800, 10, 21, language.renderSpec);
        assertNotSame(narrower, units(s, plan));
        List<RebuildDisplayGroups.Unit> previous = units(s, plan);
        assertNotSame(previous, units(s, new RebuildProtocol.Plan(plan.events, "{}")));
        previous = units(s, plan);
        android.widget.TextView text = new android.widget.TextView(RuntimeEnvironment.getApplication());
        text.setTextScaleX(1.25f);
        CaptionRenderSpec changedPaint = language.renderSpec.withPaint(text);
        assertFalse(language.renderSpec.sameMeasurement(changedPaint));
        budget = new CaptionPresentationBudget(800,10,21,changedPaint);
        assertNotSame(previous,units(s,plan));
        assertSame(units(s,plan),units(s,plan));
        System.out.println("S2_ORIGINAL_CACHE auto="+rows(first)+";same=true;minimum_only=hit;foreign_spec=hit;width=miss;preferred=miss;new_plan=miss;paint=miss");
    }
    @Test public void originalControllerProjectsAuthoredCrossCueEvents() throws Exception {
        RebuildSource source = new RebuildSource(Arrays.asList(
                new RebuildSource.Word("First.",0,1500,0,RebuildSource.Precision.NATIVE),
                new RebuildSource.Word("Second.",1500,3000,1,RebuildSource.Precision.NATIVE),
                new RebuildSource.Word("Third.",3000,4500,2,RebuildSource.Precision.NATIVE)));
        RebuildController.Session s = session(source, true);
        RebuildProtocol.Plan cross = new RebuildProtocol.Plan(Arrays.asList(
                new RebuildProtocol.Event(0,1,0,3000,"跨两个人工字幕。"),
                new RebuildProtocol.Event(2,2,3000,4500,"最后一页。")), "{}");
        List<RebuildDisplayGroups.Unit> result = units(s, cross);
        assertEquals("[0-1@0-3000=跨两个人工字幕。, 2-2@3000-4500=最后一页。]", rows(result));
        assertSame(result, units(s, cross));
        System.out.println("S2_ORIGINAL_AUTHORED "+rows(result));
    }
    long[] anchors(RebuildController.Session s, RebuildDisplayGroups.Unit u) throws Exception {
        return s == null ? null : s.presentation.anchors(s.source, u);
    }
    @Test public void originalAnchorsKeepStrictMarginsSpacingPauseAndEmptyResults() throws Exception {
        List<RebuildSource.Word> words = Arrays.asList(
                new RebuildSource.Word("edge,",0,1200,0,RebuildSource.Precision.NATIVE),
                new RebuildSource.Word("one,",1200,1201,0,RebuildSource.Precision.NATIVE),
                new RebuildSource.Word("close,",1201,1281,0,RebuildSource.Precision.NATIVE),
                new RebuildSource.Word("two,",1281,1282,0,RebuildSource.Precision.NATIVE),
                new RebuildSource.Word("pause",1502,1800,0,RebuildSource.Precision.NATIVE),
                new RebuildSource.Word("end,",1800,3800,0,RebuildSource.Precision.NATIVE));
        RebuildController.Session s = session(new RebuildSource(words), false);
        RebuildDisplayGroups.Unit u = new RebuildDisplayGroups.Unit(0,
                Collections.singletonList(new RebuildProtocol.Event(0,5,0,5000,"锚点")),
                Collections.singletonList(""),5000,false);
        assertArrayEquals(new long[]{1201,1282,1800}, anchors(s,u));
        assertNull(anchors(s,null)); assertNull(anchors(null,u));
        RebuildController.Session empty = session(RebuildDisplayGroupsTest.words("plain", "words"), false);
        assertNull(anchors(empty,u));
        List<RebuildSource.Word> many = new ArrayList<>();
        for(int i=0;i<70;i++) many.add(new RebuildSource.Word("a,",1300+i*100,1301+i*100,0,RebuildSource.Precision.NATIVE));
        RebuildDisplayGroups.Unit longUnit = new RebuildDisplayGroups.Unit(0,
                Collections.singletonList(new RebuildProtocol.Event(0,69,0,10000,"上限")),
                Collections.singletonList(""),10000,false);
        long[] capped = anchors(session(new RebuildSource(many),false),longUnit);
        assertEquals(64,capped.length); assertEquals(1301,capped[0]); assertEquals(7601,capped[63]);
        System.out.println("S2_ORIGINAL_ANCHORS [1201, 1282, 1800];empty=null;cap=64;first=1301;last=7601");
    }
    @Test public void newerSubmissionInvalidatesUnappliedCallbackBeforeGenerationChanges() throws Exception {
        RebuildController.Session s = session(RebuildDisplayGroupsTest.words("unused"), false);
        s.source = null; s.status = "pending";
        set(RebuildController.class,"active",null,s);
        List<TranslationOutput.RenderGuard> guards = new ArrayList<>();
        TranslationOutput.install(new TranslationOutput.Sink() {
            public void showStatus(String text, TranslationOutput.RenderGuard guard) { guards.add(guard); }
        });
        call("render", new Class<?>[]{RebuildController.Session.class},s);
        assertEquals(1, guards.size()); assertTrue(guards.get(0).isValid());
        long revision=s.renderRevision; int generation=s.generation;
        call("render", new Class<?>[]{RebuildController.Session.class},s);
        assertEquals(2, guards.size()); assertEquals(revision,s.renderRevision); assertEquals(generation,s.generation);
        assertFalse(guards.get(0).isValid()); assertTrue(guards.get(1).isValid());
        guards.get(0).onApplied(); assertNotEquals(revision,s.appliedRenderRevision);
        guards.get(1).onApplied(); assertEquals(revision,s.appliedRenderRevision);
        s.generation++; assertFalse(guards.get(1).isValid());
        System.out.println("S2_ORIGINAL_SUBMISSION same_revision=true;same_generation=true;old_valid=false;new_valid=true;old_applied=false;new_applied=true;generation_change_valid=false");
    }
}
