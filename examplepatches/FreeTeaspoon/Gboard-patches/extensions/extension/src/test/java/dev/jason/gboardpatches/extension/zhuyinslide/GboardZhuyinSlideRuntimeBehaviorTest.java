package dev.jason.gboardpatches.extension.zhuyinslide;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.content.Context;

import java.lang.ref.Reference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

@RunWith(RobolectricTestRunner.class)
public final class GboardZhuyinSlideRuntimeBehaviorTest {
    private Context context;

    @Before
    public void setUp() {
        context = RuntimeEnvironment.getApplication();
    }

    @Test
    public void bindPatchingUsesExactTargetReflectionAndPreservesNativeActions()
            throws Exception {
        Object view = GboardZhuyinSlideTargetFixture.newSoftKeyView(context);
        Object metadata = metadata("ㄉ", new String[] {"ㄉ", "2", "@"}, "@", null);
        Object nativeUp = GboardZhuyinSlideTargetFixture.exactAction(metadata, "SLIDE_UP");

        Object patched = GboardZhuyinSlideRuntime.patchIncomingSoftKeyMetadata(view, metadata);

        assertNotSame(metadata, patched);
        assertSame(nativeUp, GboardZhuyinSlideTargetFixture.exactAction(patched, "SLIDE_UP"));
        assertEquals("2", GboardZhuyinSlideTargetFixture.actionPayload(
                GboardZhuyinSlideTargetFixture.exactAction(patched, "SLIDE_DOWN")));
        assertTrue(GboardZhuyinSlideRuntime.isPatchedMetadata(patched));
        assertSame(patched,
                GboardZhuyinSlideRuntime.patchIncomingSoftKeyMetadata(view, metadata));
    }

    @Test
    public void engGetsOnlyPublishedDownActionAndEnglishFailsOpen() throws Exception {
        Object view = GboardZhuyinSlideTargetFixture.newSoftKeyView(context);
        Object eng = metadata("ㄥ", new String[] {"ㄥ", "？"}, null, null);

        Object patched = GboardZhuyinSlideRuntime.patchIncomingSoftKeyMetadata(view, eng);

        assertNotSame(eng, patched);
        assertNull(GboardZhuyinSlideTargetFixture.exactAction(patched, "SLIDE_UP"));
        assertEquals("？", GboardZhuyinSlideTargetFixture.actionPayload(
                GboardZhuyinSlideTargetFixture.exactAction(patched, "SLIDE_DOWN")));

        Object english = metadata("q", new String[] {"q", "1", "Q"}, null, null);
        assertSame(english,
                GboardZhuyinSlideRuntime.patchIncomingSoftKeyMetadata(view, english));
    }

    @Test
    public void equalButDistinctMetadataUsesWeakIdentityMarkersAndCache() throws Exception {
        Object view = GboardZhuyinSlideTargetFixture.newSoftKeyView(context);
        Object first = metadata("ㄆ", new String[] {"ㄆ", "q", "Q"}, null, null);
        Object second = metadata("ㄆ", new String[] {"ㄆ", "q", "Q"}, null, null);
        assertEquals(first, second);
        assertNotSame(first, second);

        Object firstPatched =
                GboardZhuyinSlideRuntime.patchIncomingSoftKeyMetadata(view, first);
        Object secondPatched =
                GboardZhuyinSlideRuntime.patchIncomingSoftKeyMetadata(view, second);

        assertNotSame(first, firstPatched);
        assertNotSame(second, secondPatched);
        assertNotSame(firstPatched, secondPatched);
    }

    @Test
    public void weakIdentityMapPurgesEnqueuedKeysWithoutStructuralEquality() throws Exception {
        Class<?> mapClass = Class.forName(
                GboardZhuyinSlideRuntime.class.getName() + "$WeakIdentityMap");
        Constructor<?> constructor = mapClass.getDeclaredConstructor();
        constructor.setAccessible(true);
        Object weakIdentityMap = constructor.newInstance();
        Method put = mapClass.getDeclaredMethod("put", Object.class, Object.class);
        Method get = mapClass.getDeclaredMethod("get", Object.class);
        put.setAccessible(true);
        get.setAccessible(true);
        Field valuesField = mapClass.getDeclaredField("values");
        valuesField.setAccessible(true);

        Object key = new Object();
        put.invoke(weakIdentityMap, key, "value");
        Map<?, ?> values = (Map<?, ?>) valuesField.get(weakIdentityMap);
        assertEquals(1, values.size());
        Reference<?> storedReference = (Reference<?>) values.keySet().iterator().next();
        storedReference.clear();
        assertTrue(storedReference.enqueue());

        get.invoke(weakIdentityMap, new Object());

        assertTrue(values.isEmpty());
    }

    @Test
    public void pointerKeepsInitialPatchedKeyAcrossCrossedKeysAndCleansAtEntry()
            throws Exception {
        Object tracker = GboardZhuyinSlideTargetFixture.newPointerTracker();
        Object anchorView = patchedAndBound("ㄆ", new String[] {"ㄆ", "q", "Q"});
        Object crossedView = patchedAndBound("ㄝ", new String[] {"ㄝ", "……"});
        GboardZhuyinSlideTargetFixture.setActions(tracker, "PRESS", "PRESS");

        assertFalse(GboardZhuyinSlideRuntime.maybeCaptureAndShouldSuppressRetarget(
                tracker, anchorView, 1.0f, 1.0f));

        GboardZhuyinSlideTargetFixture.setCurrentOwner(tracker, anchorView);
        GboardZhuyinSlideTargetFixture.setActions(tracker, "PRESS", "SLIDE_UP");
        assertTrue(GboardZhuyinSlideRuntime.maybeCaptureAndShouldSuppressRetarget(
                tracker, crossedView, 2.0f, 3.0f));

        GboardZhuyinSlideRuntime.clearPointerState(tracker);
        assertFalse(GboardZhuyinSlideRuntime.maybeCaptureAndShouldSuppressRetarget(
                tracker, crossedView, 2.0f, 3.0f));
    }

    @Test
    public void pointerRequiresNoStockOwnerAndExactVerticalActionOnAnchor() throws Exception {
        Object tracker = GboardZhuyinSlideTargetFixture.newPointerTracker();
        Object existingOwner = GboardZhuyinSlideTargetFixture.newSoftKeyView(context);
        Object patchedView = patchedAndBound("ㄥ", new String[] {"ㄥ", "？"});
        GboardZhuyinSlideTargetFixture.setCurrentOwner(tracker, existingOwner);
        GboardZhuyinSlideTargetFixture.setActions(tracker, "PRESS", "SLIDE_DOWN");

        assertFalse(GboardZhuyinSlideRuntime.maybeCaptureAndShouldSuppressRetarget(
                tracker, patchedView, 1.0f, 1.0f));

        GboardZhuyinSlideTargetFixture.setCurrentOwner(tracker, null);
        GboardZhuyinSlideTargetFixture.setActions(tracker, "PRESS", "PRESS");
        assertFalse(GboardZhuyinSlideRuntime.maybeCaptureAndShouldSuppressRetarget(
                tracker, patchedView, 1.0f, 1.0f));
        GboardZhuyinSlideTargetFixture.setCurrentOwner(tracker, patchedView);

        GboardZhuyinSlideTargetFixture.setActions(tracker, "PRESS", "SLIDE_UP");
        assertFalse(GboardZhuyinSlideRuntime.maybeCaptureAndShouldSuppressRetarget(
                tracker, patchedView, 1.0f, 1.0f));
        GboardZhuyinSlideTargetFixture.setActions(tracker, "PRESS", "SLIDE_DOWN");
        assertTrue(GboardZhuyinSlideRuntime.maybeCaptureAndShouldSuppressRetarget(
                tracker, patchedView, 1.0f, 1.0f));
    }

    @Test
    public void pointerErrorsFailOpenAndPreserveStockFlow() throws Exception {
        Object tracker = GboardZhuyinSlideTargetFixture.newPointerTracker();
        Object patchedView = patchedAndBound("ㄆ", new String[] {"ㄆ", "q", "Q"});
        GboardZhuyinSlideTargetFixture.setActions(tracker, "PRESS", "PRESS");
        assertFalse(GboardZhuyinSlideRuntime.maybeCaptureAndShouldSuppressRetarget(
                tracker, patchedView, 1.0f, 1.0f));
        GboardZhuyinSlideTargetFixture.setCurrentOwner(tracker, patchedView);
        GboardZhuyinSlideTargetFixture.setThrowOnResolve(tracker, true);

        assertFalse(GboardZhuyinSlideRuntime.maybeCaptureAndShouldSuppressRetarget(
                tracker, patchedView, 1.0f, 1.0f));
    }

    private Object patchedAndBound(String label, String[] tokens) throws Exception {
        Object view = GboardZhuyinSlideTargetFixture.newSoftKeyView(context);
        Object metadata = metadata(label, tokens, null, null);
        Object patched = GboardZhuyinSlideRuntime.patchIncomingSoftKeyMetadata(view, metadata);
        GboardZhuyinSlideTargetFixture.bind(view, patched, 10L);
        return view;
    }

    private Object metadata(String label, String[] tokens, String nativeUp, String nativeDown)
            throws Exception {
        return GboardZhuyinSlideTargetFixture.metadata(
                0x7f0b2800, label, label, tokens, nativeUp, nativeDown);
    }
}
