package dev.jason.gboardpatches.extension.japaneseqwertyglide;

import android.view.View;
import com.google.android.libraries.inputmethod.metadata.KeyboardSource;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.shadows.ShadowSystemClock;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.time.Duration;
import java.util.ArrayList;
import java.util.concurrent.FutureTask;
import java.util.List;
import java.util.Map;

@RunWith(RobolectricTestRunner.class)
public final class GboardJapaneseQwertyGlideRuntimeTest {
    @Test
    public void rapidFinalStrokesQueueInOrderAndSessionChangeDiscardsThem() throws Exception {
        FakeManager manager = new FakeManager();
        GboardJapaneseQwertyGlideRuntime.augmentMotionEventHandlers(manager,
                new FakeInfo[]{new FakeInfo(SPATIAL, null, false)},
                new FakeDefinition(0x7f1706ec), new FakeViewDefinition(), null);
        Field bridges = GboardJapaneseQwertyGlideRuntime.class.getDeclaredField("BRIDGES");
        bridges.setAccessible(true);
        Object bridge = ((Map<?, ?>) bridges.get(null)).get(manager);
        Field layout = bridge.getClass().getDeclaredField("layout");
        layout.setAccessible(true);
        layout.set(bridge, new FakeLayout());
        Class<?> requestType = Class.forName(GboardJapaneseQwertyGlideRuntime.class.getName() + "$DecodeRequest");
        Constructor<?> constructor = requestType.getDeclaredConstructors()[0];
        constructor.setAccessible(true);
        Object running = constructor.newInstance(new Object(), manager, bridge);
        Field pendingField = GboardJapaneseQwertyGlideRuntime.class.getDeclaredField("PENDING");
        pendingField.setAccessible(true);
        @SuppressWarnings("unchecked") Map<Long, Object> pending = (Map<Long, Object>) pendingField.get(null);
        pending.put(992233L, running);
        Method submit = GboardJapaneseQwertyGlideRuntime.class.getDeclaredMethod("submitDecode",
                Object.class, Object.class, bridge.getClass(), Object.class);
        submit.setAccessible(true);
        Object first = new Object();
        Object second = new Object();
        submit.invoke(null, new Object(), manager, bridge, first);
        submit.invoke(null, new Object(), manager, bridge, second);
        Field finalsField = bridge.getClass().getDeclaredField("finals");
        finalsField.setAccessible(true);
        java.util.ArrayDeque<?> finals = (java.util.ArrayDeque<?>) finalsField.get(bridge);
        Assert.assertEquals(2, finals.size());
        Field touch = finals.peekFirst().getClass().getDeclaredField("touch");
        touch.setAccessible(true);
        Assert.assertSame(first, touch.get(finals.peekFirst()));
        Assert.assertSame(second, touch.get(finals.peekLast()));
        GboardJapaneseQwertyGlideRuntime.onInputSessionChanged();
        Assert.assertTrue(finals.isEmpty());
        Assert.assertTrue(pending.isEmpty());
    }

    @Test
    public void previewGroupIsCenteredAndOverflowKeepsStockPosition() {
        android.widget.FrameLayout strip = new android.widget.FrameLayout(RuntimeEnvironment.getApplication());
        strip.layout(0, 0, 600, 50);
        View first = new View(strip.getContext());
        View second = new View(strip.getContext());
        strip.addView(first);
        strip.addView(second);
        first.layout(0, 0, 80, 50);
        second.layout(80, 0, 200, 50);
        GboardJapaneseQwertyGlideRuntime.centerPreviewChildren(strip);
        Assert.assertEquals(200f, first.getTranslationX(), 0f);
        Assert.assertEquals(200f, second.getTranslationX(), 0f);
        second.layout(80, 0, 700, 50);
        GboardJapaneseQwertyGlideRuntime.centerPreviewChildren(strip);
        Assert.assertEquals(0f, first.getTranslationX(), 0f);
    }

    @Test
    public void previewOnlyRendersWithoutSelectingOrInjectingTextAndCanBeCleared() throws Exception {
        Class<?> keyboardType = Class.forName("JpGlidePreviewKeyboardFixture");
        Object keyboard = keyboardType.getConstructor().newInstance();
        Method render = GboardJapaneseQwertyGlideRuntime.class.getDeclaredMethod(
                "renderPreview", Object.class, List.class);
        render.setAccessible(true);
        render.invoke(null, keyboard, java.util.Arrays.asList("hello", "help"));
        List<?> candidates = (List<?>) keyboardType.getField("candidates").get(keyboard);
        Assert.assertEquals(2, candidates.size());
        Assert.assertEquals("hello", candidates.get(0).getClass().getField("a").get(candidates.get(0)));
        Assert.assertNull(keyboardType.getField("selected").get(keyboard));
        Assert.assertEquals(false, keyboardType.getField("autoSelect").get(keyboard));
        render.invoke(null, keyboard, java.util.Collections.emptyList());
        Assert.assertTrue(((List<?>) keyboardType.getField("candidates").get(keyboard)).isEmpty());
    }

    @Test
    public void liveCandidatesFilterDuplicatesInvalidWordsAndLimitToThree() throws Exception {
        FakeDiff diff = new FakeDiff();
        for (String word : new String[]{"hello", "hello", "123", "help", "held", "hell"}) {
            diff.e.d.add(new FakeCandidate(word));
        }
        Assert.assertEquals(java.util.Arrays.asList("hello", "help", "held"),
                GboardJapaneseQwertyGlideRuntime.previewWords(diff));
        diff.e.d.clear();
        diff.d.h = "word";
        Assert.assertEquals(java.util.Collections.singletonList("word"),
                GboardJapaneseQwertyGlideRuntime.previewWords(diff));
    }

    private static final String SPATIAL =
            "com.google.android.libraries.inputmethod.motioneventhandler.SpatialModelMotionEventHandler";

    @Test
    public void japaneseModeRecognisesOnlyTheJapaneseQwertyDefinitions() {
        Assert.assertEquals("ABC", GboardJapaneseQwertyGlideRuntime.japaneseMode(
                new int[] {0x7f1706ec}));
        Assert.assertEquals("kana", GboardJapaneseQwertyGlideRuntime.japaneseMode(
                new int[] {0x7f1706ed}));
        Assert.assertNull(GboardJapaneseQwertyGlideRuntime.japaneseMode(
                new int[] {0x7f1704ab}));
        Assert.assertNull(GboardJapaneseQwertyGlideRuntime.japaneseMode(null));
    }

    @Test
    public void keyboardDefIdsComeOnlyFromXmlSources() throws Exception {
        FakeDefinition definition = new FakeDefinition(0x7f1706ec);
        definition.d.add(0, new KeyboardSource.UnparceledProvider("provider"));
        definition.d.add(new KeyboardSource.Xml(0x7f1706ed));
        Assert.assertArrayEquals(new int[] {0x7f1706ec, 0x7f1706ed},
                GboardJapaneseQwertyGlideRuntime.keyboardDefResourceIds(definition));
        definition.d.clear();
        definition.d.add(new KeyboardSource.UnparceledProvider("provider"));
        Assert.assertEquals(0, GboardJapaneseQwertyGlideRuntime.keyboardDefResourceIds(definition).length);
        definition.d = null;
        Assert.assertEquals(0, GboardJapaneseQwertyGlideRuntime.keyboardDefResourceIds(definition).length);
        FakeInfo[] stock = {new FakeInfo(SPATIAL, null, false)};
        FakeDefinition providerOnly = new FakeDefinition(0x7f1706ec);
        providerOnly.d.set(0, new KeyboardSource.UnparceledProvider("provider"));
        Assert.assertSame(stock, GboardJapaneseQwertyGlideRuntime.augmentMotionEventHandlers(
                new FakeManager(), stock, providerOnly, new FakeViewDefinition(), null));
    }

    @Test
    public void bodyHandlersGainTheGestureHandlerRightAfterSpatialModel() throws Exception {
        FakeInfo[] stock = {
                new FakeInfo("a.BasicMotionEventHandler", "pref", true),
                new FakeInfo(SPATIAL, "pref", false),
                new FakeInfo(".inlinesuggestion.InlineSuggestionScrubSpaceMotionEventHandler", null, false),
        };

        Object[] augmented =
                GboardJapaneseQwertyGlideRuntime.augmentedHandlerInfos(stock, "BODY");

        Assert.assertNotNull(augmented);
        Assert.assertEquals(FakeInfo.class, augmented.getClass().getComponentType());
        Assert.assertEquals(4, augmented.length);
        Assert.assertSame(stock[0], augmented[0]);
        Assert.assertSame(stock[1], augmented[1]);
        Assert.assertSame(stock[2], augmented[3]);
        FakeInfo gesture = (FakeInfo) augmented[2];
        Assert.assertEquals(GboardJapaneseQwertyGlideRuntime.GESTURE_HANDLER_CLASS, gesture.a);
        Assert.assertEquals("enable_gesture_input", gesture.b);
        Assert.assertFalse(gesture.c);
        Assert.assertEquals(3, stock.length);
    }

    @Test
    public void nonBodyViewsAndAlreadyGlidingHandlersAreLeftAlone() throws Exception {
        FakeInfo[] stock = {new FakeInfo(SPATIAL, null, false)};
        FakeInfo[] gliding = {
                new FakeInfo(".libs.latin5.handler.LatinGestureMotionEventHandler", "p", false),
        };

        Assert.assertNull(GboardJapaneseQwertyGlideRuntime.augmentedHandlerInfos(stock, "HEADER"));
        Assert.assertNull(GboardJapaneseQwertyGlideRuntime.augmentedHandlerInfos(gliding, "BODY"));
    }

    @Test
    public void handlersWithoutSpatialModelGetTheGestureHandlerAppended() throws Exception {
        FakeInfo[] stock = {new FakeInfo("a.BasicMotionEventHandler", null, false)};

        Object[] augmented =
                GboardJapaneseQwertyGlideRuntime.augmentedHandlerInfos(stock, "BODY");

        Assert.assertNotNull(augmented);
        Assert.assertEquals(2, augmented.length);
        Assert.assertSame(stock[0], augmented[0]);
    }

    @Test
    public void kanaDoesNotGainAHandlerThroughThePublicAttachHook() {
        FakeInfo[] stock = {new FakeInfo(SPATIAL, null, false)};
        Assert.assertSame(stock, GboardJapaneseQwertyGlideRuntime.augmentMotionEventHandlers(
                new Object(), stock, new FakeDefinition(0x7f1706ed), new FakeViewDefinition(), null));
    }

    @Test
    public void abcTrailDoesNotRequireDecoderProxyLayoutOrDecodeCompletion() throws Exception {
        FakeManager manager = new FakeManager();
        FakeInfo[] stock = {new FakeInfo(SPATIAL, null, false)};
        GboardJapaneseQwertyGlideRuntime.augmentMotionEventHandlers(manager, stock,
                new FakeDefinition(0x7f1706ec), new FakeViewDefinition(), null);
        // The fake host has neither a Gboard decoder nor an observed layout.
        Assert.assertEquals(1, GboardJapaneseQwertyGlideRuntime.gestureReadyForManager(manager));
        GboardJapaneseQwertyGlideRuntime.onInputSessionChanged();
        Assert.assertEquals(1, GboardJapaneseQwertyGlideRuntime.gestureReadyForManager(manager));
        FakeManager kana = new FakeManager();
        GboardJapaneseQwertyGlideRuntime.augmentMotionEventHandlers(kana, stock,
                new FakeDefinition(0x7f1706ed), new FakeViewDefinition(), null);
        Assert.assertEquals(-1, GboardJapaneseQwertyGlideRuntime.gestureReadyForManager(kana));
        Assert.assertEquals(-1, GboardJapaneseQwertyGlideRuntime.gestureReadyForManager(new Object()));
    }

    @Test
    public void diagnosticsFailureDoesNotDisableTrackedAbcTrail() throws Exception {
        final FakeManager manager = new FakeManager();
        GboardJapaneseQwertyGlideRuntime.augmentMotionEventHandlers(manager,
                new FakeInfo[]{new FakeInfo(SPATIAL, null, false)},
                new FakeDefinition(0x7f1706ec), new FakeViewDefinition(), null);
        final Object context = Class.forName("pml").getConstructor(Object.class).newInstance(manager);
        Object handler = new Object() {
            public final Object p = context;
        };
        // The handler deliberately lacks the fields used only by readiness diagnostics.
        Assert.assertEquals(1, GboardJapaneseQwertyGlideRuntime.overrideGestureReady(handler));
    }

    @Test
    public void resultUsesCommittedThenComposingTextAndThenTopCandidate() throws Exception {
        FakeDiff diff = new FakeDiff();
        diff.d.e = " world ";
        diff.d.h = "hello";
        diff.e.d.add(new FakeCandidate("other"));
        Assert.assertEquals("world", GboardJapaneseQwertyGlideRuntime.gestureWord(diff));
        diff.d.e = "";
        Assert.assertEquals("hello", GboardJapaneseQwertyGlideRuntime.gestureWord(diff));
        diff.d.h = "";
        Assert.assertEquals("other", GboardJapaneseQwertyGlideRuntime.gestureWord(diff));
    }

    @Test
    public void resultRejectsControlCharactersNonAlphabetAndArbitraryContext() {
        Assert.assertNull(GboardJapaneseQwertyGlideRuntime.alphabetWord("hello\nworld"));
        Assert.assertNull(GboardJapaneseQwertyGlideRuntime.alphabetWord("日本語"));
        Assert.assertNull(GboardJapaneseQwertyGlideRuntime.alphabetWord("two words"));
        Assert.assertNull(GboardJapaneseQwertyGlideRuntime.alphabetWord(""));
        Assert.assertEquals("don't", GboardJapaneseQwertyGlideRuntime.alphabetWord("don't"));
    }

    @Test
    public void layoutRequiresAllAlphabetKeysAndPositiveFiniteDimensions() throws Exception {
        FakeLayout layout = new FakeLayout();
        for (int code = 'a'; code <= 'z'; code++) layout.g.add(new FakeKey(code));
        Assert.assertTrue(GboardJapaneseQwertyGlideRuntime.validAlphabetLayout(layout));
        layout.g.remove(0);
        Assert.assertFalse(GboardJapaneseQwertyGlideRuntime.validAlphabetLayout(layout));
        layout.g.add(new FakeKey('A'));
        layout.e = Float.NaN;
        Assert.assertFalse(GboardJapaneseQwertyGlideRuntime.validAlphabetLayout(layout));
        layout.e = 100;
        layout.f = 0;
        Assert.assertFalse(GboardJapaneseQwertyGlideRuntime.validAlphabetLayout(layout));
    }

    @Test
    public void pendingSnapshotRejectsEditorViewModeGenerationAndSessionChanges() throws Exception {
        FakeManager manager = new FakeManager();
        FakeInfo[] stock = {new FakeInfo(SPATIAL, null, false)};
        GboardJapaneseQwertyGlideRuntime.augmentMotionEventHandlers(manager, stock,
                new FakeDefinition(0x7f1706ec), new FakeViewDefinition(), null);
        Field bridgesField = GboardJapaneseQwertyGlideRuntime.class.getDeclaredField("BRIDGES");
        bridgesField.setAccessible(true);
        Object bridge = ((Map<?, ?>) bridgesField.get(null)).get(manager);
        Field layout = bridge.getClass().getDeclaredField("layout");
        layout.setAccessible(true);
        layout.set(bridge, new FakeLayout());
        Class<?> requestType = Class.forName(GboardJapaneseQwertyGlideRuntime.class.getName()
                + "$DecodeRequest");
        Constructor<?> constructor = requestType.getDeclaredConstructors()[0];
        constructor.setAccessible(true);
        Object request = constructor.newInstance(new Object(), manager, bridge);
        Method current = GboardJapaneseQwertyGlideRuntime.class.getDeclaredMethod("current", requestType);
        current.setAccessible(true);
        Assert.assertEquals(true, current.invoke(null, request));
        ((View) manager.j).layout(0, 0, 200, 100);
        Assert.assertEquals(false, current.invoke(null, request));
        ((View) manager.j).layout(0, 0, 100, 100);
        Assert.assertEquals(true, current.invoke(null, request));
        Object editor = manager.e.H;
        manager.e.H = new Object();
        Assert.assertEquals(false, current.invoke(null, request));
        manager.e.H = editor;
        manager.e.F++;
        Assert.assertEquals(false, current.invoke(null, request));
        manager.e.F--;
        Object view = manager.j;
        manager.j = new Object();
        Assert.assertEquals(false, current.invoke(null, request));
        manager.j = view;
        manager.m = false;
        Assert.assertEquals(false, current.invoke(null, request));
        manager.m = true;
        Field generation = bridge.getClass().getDeclaredField("generation");
        generation.setAccessible(true);
        generation.setLong(bridge, generation.getLong(bridge) + 1);
        Assert.assertEquals(false, current.invoke(null, request));
        Method currentFinal = GboardJapaneseQwertyGlideRuntime.class.getDeclaredMethod("currentFinal", requestType);
        currentFinal.setAccessible(true);
        Assert.assertEquals(true, currentFinal.invoke(null, request));
        Field editVersion = bridge.getClass().getDeclaredField("editVersion");
        editVersion.setAccessible(true);
        editVersion.setLong(bridge, editVersion.getLong(bridge) + 1);
        Assert.assertEquals(false, currentFinal.invoke(null, request));
        editVersion.setLong(bridge, editVersion.getLong(bridge) - 1);
        generation.setLong(bridge, generation.getLong(bridge) - 1);
        ShadowSystemClock.advanceBy(Duration.ofMillis(10001));
        Assert.assertEquals(false, current.invoke(null, request));
        Assert.assertEquals(false, currentFinal.invoke(null, request));
        request = constructor.newInstance(new Object(), manager, bridge);
        Assert.assertEquals(true, current.invoke(null, request));
        GboardJapaneseQwertyGlideRuntime.onInputSessionChanged();
        Assert.assertEquals(false, current.invoke(null, request));
    }

    @Test
    public void sessionChangeCancelsQueuedDispatchAndLateFutureRegistration() throws Exception {
        FakeManager manager = new FakeManager();
        FakeInfo[] stock = {new FakeInfo(SPATIAL, null, false)};
        GboardJapaneseQwertyGlideRuntime.augmentMotionEventHandlers(manager, stock,
                new FakeDefinition(0x7f1706ec), new FakeViewDefinition(), null);
        Field bridgesField = GboardJapaneseQwertyGlideRuntime.class.getDeclaredField("BRIDGES");
        bridgesField.setAccessible(true);
        Object bridge = ((Map<?, ?>) bridgesField.get(null)).get(manager);
        Class<?> requestType = Class.forName(GboardJapaneseQwertyGlideRuntime.class.getName()
                + "$DecodeRequest");
        Constructor<?> constructor = requestType.getDeclaredConstructors()[0];
        constructor.setAccessible(true);
        Object request = constructor.newInstance(new Object(), manager, bridge);
        Field pendingField = GboardJapaneseQwertyGlideRuntime.class.getDeclaredField("PENDING");
        pendingField.setAccessible(true);
        @SuppressWarnings("unchecked") Map<Long, Object> pending = (Map<Long, Object>) pendingField.get(null);
        Method retain = GboardJapaneseQwertyGlideRuntime.class.getDeclaredMethod(
                "retainFuture", requestType, long.class, java.util.concurrent.Future.class);
        retain.setAccessible(true);
        long id = 99112234L;
        final int[] executions = {0};
        Runnable task = new Runnable() {
            @Override
            public void run() { executions[0]++; }
        };
        FutureTask<Void> dispatch = new FutureTask<Void>(task, null);
        FutureTask<Void> lateDispatch = new FutureTask<Void>(task, null);
        pending.put(id, request);
        try {
            retain.invoke(null, request, id, dispatch);
            Assert.assertFalse(dispatch.isCancelled());
            GboardJapaneseQwertyGlideRuntime.onInputSessionChanged();
            Assert.assertTrue(dispatch.isCancelled());
            Assert.assertFalse(pending.containsKey(id));
            retain.invoke(null, request, id, lateDispatch);
            Assert.assertTrue(lateDispatch.isCancelled());
            dispatch.run();
            lateDispatch.run();
            Assert.assertEquals(0, executions[0]);
        } finally {
            pending.remove(id);
        }
    }

    public static final class FakeManager {
        public FakeKeyboard e = new FakeKeyboard();
        public Object j = new View(RuntimeEnvironment.getApplication());
        public boolean m = true;

        FakeManager() {
            ((View) j).layout(0, 0, 100, 100);
        }
    }

    @Test
    public void readinessDiagnosticsSurviveMissingGboardClassesAndReportIndependentConditions() throws Exception {
        FakeManager manager = new FakeManager();
        FakeInfo[] stock = {new FakeInfo(SPATIAL, null, false)};
        GboardJapaneseQwertyGlideRuntime.augmentMotionEventHandlers(manager, stock,
                new FakeDefinition(0x7f1706ec), new FakeViewDefinition(), null);
        Method diagnostics = GboardJapaneseQwertyGlideRuntime.class.getDeclaredMethod(
                "readinessDiagnostics", Object.class);
        diagnostics.setAccessible(true);
        String details = (String) diagnostics.invoke(null, new FakeHandler(manager));
        Assert.assertTrue(details.contains("trackedBridge=true"));
        Assert.assertTrue(details.contains("layoutPresent=false"));
        Assert.assertTrue(details.contains("view=100x100"));
        Assert.assertTrue(details.contains("layout=null"));
        Assert.assertTrue(details.contains("facilitatorProbe=probe-failed("));
        Assert.assertTrue(details.contains("primaryLocale=null"));
        Assert.assertTrue(details.contains("proxyPresent=false"));
        Assert.assertTrue(details.contains("pendingDecodes="));
    }

    public static final class FakeHandler {
        public FakeContext p;
        FakeHandler(FakeManager manager) { p = new FakeContext(manager); }
    }

    public static final class FakeContext {
        public FakeManager b;
        FakeContext(FakeManager manager) { b = manager; }
    }

    public static final class FakeKeyboard {
        public boolean G = true;
        public Object H = new Object();
        public long F;
    }

    public static final class FakeDefinition {
        public List<Object> d = new ArrayList<Object>();
        public String m = "QWERTY";
        public String e = "Japanese";
        FakeDefinition(int id) { d.add(new KeyboardSource.Xml(id)); }
    }

    public static final class FakeViewDefinition {
        public String b = "BODY";
    }

    public static final class FakeDiff {
        public FakeText d = new FakeText();
        public FakeSuggestions e = new FakeSuggestions();
    }

    public static final class FakeText {
        public String e = "";
        public String h = "";
    }

    public static final class FakeSuggestions {
        public List<FakeCandidate> d = new ArrayList<FakeCandidate>();
    }

    public static final class FakeCandidate {
        public String e;
        FakeCandidate(String word) { e = word; }
    }

    public static final class FakeLayout {
        public float e = 100;
        public float f = 100;
        public List<FakeKey> g = new ArrayList<FakeKey>();
    }

    public static final class FakeKey {
        public int d;
        FakeKey(int code) { d = code; }
    }

    public static final class FakeInfo {
        public final String a;
        public final String b;
        public final boolean c;

        public FakeInfo(String a, String b, boolean c) {
            this.a = a;
            this.b = b;
            this.c = c;
        }
    }
}
