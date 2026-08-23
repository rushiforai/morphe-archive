package dev.jason.gboardpatches.extension.toprowswipe;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.Consumer;
import java.util.function.Function;

import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.LooperMode;

@RunWith(RobolectricTestRunner.class)
@LooperMode(LooperMode.Mode.PAUSED)
public final class GboardTopRowSwipeTransitionTest {
    @After
    public void resetRuntimeState() {
        GboardTopRowSwipeRuntime.VISIBLE_TOP_ROW_KEYS.clear();
        GboardTopRowSwipeRuntime.setCurrentPage(
                GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN,
                GboardTopRowSwipeRuntime.TopRowPage.STOCK);
    }

    @Test
    public void invalidTransitionRecyclesEveryProvidedSnapshot() throws Exception {
        FrameLayout host = host();
        Bitmap afterBitmap = bitmap();
        GboardTopRowSwipeRuntime.RowSnapshot after = snapshot(host, afterBitmap);

        transitionMethod().invoke(null,
                new HashMap<View, GboardTopRowSwipeRuntime.VisibleTopRowKey>(),
                null,
                after,
                1);

        assertTrue(afterBitmap.isRecycled());
    }

    @Test
    public void normalCleanupRestoresRowRemovesOverlayAndRecyclesOnlyOnce()
            throws Exception {
        TransitionFixture fixture = transitionFixture(true);
        Method cleanup = cleanupMethod();

        cleanup.invoke(null,
                fixture.visible,
                fixture.host,
                fixture.overlay,
                fixture.before,
                fixture.after,
                fixture.cleaned);
        cleanup.invoke(null,
                fixture.visible,
                fixture.host,
                fixture.overlay,
                fixture.before,
                fixture.after,
                fixture.cleaned);

        assertEquals(1f, fixture.row.getAlpha(), 0f);
        assertNull(fixture.overlay.getParent());
        assertTrue(fixture.before.bitmap.isRecycled());
        assertTrue(fixture.after.bitmap.isRecycled());
        assertTrue(fixture.cleaned.get());
    }

    @Test
    public void startupExceptionAfterAlphaHideRunsFullCleanup() throws Exception {
        TransitionFixture fixture = transitionFixture(false);
        Method cleanup = cleanupMethod();
        Runnable cleanupAction = () -> invokeCleanup(cleanup, fixture);
        Runnable failingStartup = () -> {
            fixture.host.addView(fixture.overlay);
            fixture.row.setAlpha(0f);
            throw new IllegalStateException("animation start failed");
        };

        startupMethod().invoke(null, failingStartup, cleanupAction);

        assertEquals(1f, fixture.row.getAlpha(), 0f);
        assertNull(fixture.overlay.getParent());
        assertTrue(fixture.before.bitmap.isRecycled());
        assertTrue(fixture.after.bitmap.isRecycled());
        assertTrue(fixture.cleaned.get());
    }

    @Test
    public void animationCancelAndEndShareTheSameIdempotentCleanup() throws Exception {
        String source = new String(Files.readAllBytes(
                Path.of("src/main/java/dev/jason/gboardpatches/extension/toprowswipe/"
                        + "GboardTopRowSwipeRuntime.java")),
                StandardCharsets.UTF_8).replace("\r\n", "\n");
        int transitionStart = source.indexOf("private static void maybeAnimateTopRowTransition");
        int alphaStart = source.indexOf("private static void setTopRowAlpha", transitionStart);
        assertTrue(transitionStart >= 0 && alphaStart > transitionStart);
        String transition = source.substring(transitionStart, alphaStart);

        assertTrue(transition.contains("public void onAnimationCancel(Animator animation)"));
        assertTrue(transition.contains("public void onAnimationEnd(Animator animation)"));
        assertEquals(2, countOccurrences(transition, "cleanup.run();"));
        assertTrue(transition.contains("runTopRowTransitionStartup"));
    }

    @Test
    public void replacementTransitionCleansOwnedOverlayBeforeStrictVisibilityCopy()
            throws Exception {
        AttachedRow attached = attachedRow();
        Map<View, GboardTopRowSwipeRuntime.VisibleTopRowKey> firstVisible =
                cacheVisibleRow(attached.row);
        Bitmap firstBeforeBitmap = bitmap();
        Bitmap firstAfterBitmap = bitmap();
        transitionMethod().invoke(null,
                firstVisible,
                snapshot(attached.host, firstBeforeBitmap),
                snapshot(attached.host, firstAfterBitmap),
                1);

        assertEquals(0f, attached.row.getAlpha(), 0f);
        assertNotNull(attached.host.findViewWithTag(
                GboardTopRowSwipeRuntime.ROW_TRANSITION_OVERLAY_TAG));

        AtomicInteger rebindCount = new AtomicInteger(0);
        AtomicReference<GboardTopRowSwipeRuntime.TopRowPage> metadataPage =
                new AtomicReference<GboardTopRowSwipeRuntime.TopRowPage>(
                        GboardTopRowSwipeRuntime.TopRowPage.STOCK);
        java.util.ArrayList<GboardTopRowSwipeRuntime.RowSnapshot> secondSnapshots =
                new java.util.ArrayList<GboardTopRowSwipeRuntime.RowSnapshot>();
        Function<Map<View, GboardTopRowSwipeRuntime.VisibleTopRowKey>,
                GboardTopRowSwipeRuntime.RowSnapshot> snapshotter = visible -> {
                    assertEquals(1, visible.size());
                    GboardTopRowSwipeRuntime.RowSnapshot snapshot =
                            snapshot(attached.host, bitmap());
                    secondSnapshots.add(snapshot);
                    return snapshot;
                };
        Consumer<GboardTopRowSwipeRuntime.TopRowPage> pageSetter = page ->
                GboardTopRowSwipeRuntime.setCurrentPage(
                        GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN, page);
        Consumer<Map<View, GboardTopRowSwipeRuntime.VisibleTopRowKey>> rebinder = visible -> {
            assertEquals(1, visible.size());
            rebindCount.incrementAndGet();
            metadataPage.set(GboardTopRowSwipeRuntime.currentPage(
                    GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN));
        };

        boolean applied = (Boolean) applyTransitionMethod().invoke(
                null,
                attached.row,
                GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN,
                GboardTopRowSwipeRuntime.TopRowPage.STOCK,
                GboardTopRowSwipeRuntime.TopRowPage.CUSTOM,
                -1,
                snapshotter,
                pageSetter,
                rebinder);

        assertTrue(applied);
        assertTrue(firstBeforeBitmap.isRecycled());
        assertTrue(firstAfterBitmap.isRecycled());
        assertEquals(1, rebindCount.get());
        assertEquals(GboardTopRowSwipeRuntime.TopRowPage.CUSTOM,
                GboardTopRowSwipeRuntime.currentPage(
                        GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN));
        assertEquals(GboardTopRowSwipeRuntime.TopRowPage.CUSTOM, metadataPage.get());
        assertTrue(GboardTopRowSwipeRuntime.VISIBLE_TOP_ROW_KEYS.containsKey(attached.row));
        assertEquals(0f, attached.row.getAlpha(), 0f);
        assertNotNull(attached.host.findViewWithTag(
                GboardTopRowSwipeRuntime.ROW_TRANSITION_OVERLAY_TAG));

        cleanupOwnedTransitionMethod().invoke(null, attached.row);
        cleanupOwnedTransitionMethod().invoke(null, attached.row);

        assertEquals(1f, attached.row.getAlpha(), 0f);
        assertNull(attached.host.findViewWithTag(
                GboardTopRowSwipeRuntime.ROW_TRANSITION_OVERLAY_TAG));
        assertEquals(2, secondSnapshots.size());
        assertTrue(secondSnapshots.get(0).bitmap.isRecycled());
        assertTrue(secondSnapshots.get(1).bitmap.isRecycled());
    }

    @Test
    public void rebindFailureRollsBackPageMetadataAndEveryOwnedResource()
            throws Exception {
        AttachedRow attached = attachedRow();
        cacheVisibleRow(attached.row);
        java.util.ArrayList<GboardTopRowSwipeRuntime.RowSnapshot> snapshots =
                new java.util.ArrayList<GboardTopRowSwipeRuntime.RowSnapshot>();
        Function<Map<View, GboardTopRowSwipeRuntime.VisibleTopRowKey>,
                GboardTopRowSwipeRuntime.RowSnapshot> snapshotter = visible -> {
                    GboardTopRowSwipeRuntime.RowSnapshot snapshot =
                            snapshot(attached.host, bitmap());
                    snapshots.add(snapshot);
                    return snapshot;
                };
        Consumer<GboardTopRowSwipeRuntime.TopRowPage> pageSetter = page ->
                GboardTopRowSwipeRuntime.setCurrentPage(
                        GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN, page);
        AtomicInteger rebindCount = new AtomicInteger(0);
        AtomicReference<GboardTopRowSwipeRuntime.TopRowPage> metadataPage =
                new AtomicReference<GboardTopRowSwipeRuntime.TopRowPage>(
                        GboardTopRowSwipeRuntime.TopRowPage.STOCK);
        Consumer<Map<View, GboardTopRowSwipeRuntime.VisibleTopRowKey>> rebinder = visible -> {
            metadataPage.set(GboardTopRowSwipeRuntime.currentPage(
                    GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN));
            if (rebindCount.incrementAndGet() == 1) {
                FrameLayout partialOverlay = new FrameLayout(attached.activity);
                partialOverlay.setTag(GboardTopRowSwipeRuntime.ROW_TRANSITION_OVERLAY_TAG);
                attached.host.addView(partialOverlay);
                attached.row.setAlpha(0f);
                throw new IllegalStateException("injected rebind failure");
            }
        };

        boolean applied = (Boolean) applyTransitionMethod().invoke(
                null,
                attached.row,
                GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN,
                GboardTopRowSwipeRuntime.TopRowPage.STOCK,
                GboardTopRowSwipeRuntime.TopRowPage.CUSTOM,
                1,
                snapshotter,
                pageSetter,
                rebinder);

        assertFalse(applied);
        assertEquals(2, rebindCount.get());
        assertEquals(1, snapshots.size());
        assertTrue(snapshots.get(0).bitmap.isRecycled());
        assertEquals(GboardTopRowSwipeRuntime.TopRowPage.STOCK,
                GboardTopRowSwipeRuntime.currentPage(
                        GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN));
        assertEquals(GboardTopRowSwipeRuntime.TopRowPage.STOCK, metadataPage.get());
        assertEquals(1f, attached.row.getAlpha(), 0f);
        assertNull(attached.host.findViewWithTag(
                GboardTopRowSwipeRuntime.ROW_TRANSITION_OVERLAY_TAG));
        assertTrue(GboardTopRowSwipeRuntime.VISIBLE_TOP_ROW_KEYS.containsKey(attached.row));

        cleanupOwnedTransitionMethod().invoke(null, attached.row);
        cleanupOwnedTransitionMethod().invoke(null, attached.row);
        assertEquals(1f, attached.row.getAlpha(), 0f);
        assertNull(attached.host.findViewWithTag(
                GboardTopRowSwipeRuntime.ROW_TRANSITION_OVERLAY_TAG));
    }

    private static Method transitionMethod() throws Exception {
        Method method = GboardTopRowSwipeRuntime.class.getDeclaredMethod(
                "maybeAnimateTopRowTransition",
                Map.class,
                GboardTopRowSwipeRuntime.RowSnapshot.class,
                GboardTopRowSwipeRuntime.RowSnapshot.class,
                int.class);
        method.setAccessible(true);
        return method;
    }

    private static Method cleanupMethod() throws Exception {
        Method method = GboardTopRowSwipeRuntime.class.getDeclaredMethod(
                "cleanupTopRowTransition",
                Map.class,
                ViewGroup.class,
                View.class,
                GboardTopRowSwipeRuntime.RowSnapshot.class,
                GboardTopRowSwipeRuntime.RowSnapshot.class,
                AtomicBoolean.class);
        method.setAccessible(true);
        return method;
    }

    private static Method startupMethod() throws Exception {
        Method method = GboardTopRowSwipeRuntime.class.getDeclaredMethod(
                "runTopRowTransitionStartup", Runnable.class, Runnable.class);
        method.setAccessible(true);
        return method;
    }

    private static Method applyTransitionMethod() throws Exception {
        Method method = GboardTopRowSwipeRuntime.class.getDeclaredMethod(
                "applyTopRowPageTransition",
                View.class,
                GboardTopRowSwipeRuntime.TopRowLayoutKind.class,
                GboardTopRowSwipeRuntime.TopRowPage.class,
                GboardTopRowSwipeRuntime.TopRowPage.class,
                int.class,
                Function.class,
                Consumer.class,
                Consumer.class);
        method.setAccessible(true);
        return method;
    }

    private static Method cleanupOwnedTransitionMethod() throws Exception {
        Method method = GboardTopRowSwipeRuntime.class.getDeclaredMethod(
                "cleanupOwnedTopRowTransition", View.class);
        method.setAccessible(true);
        return method;
    }

    private static TransitionFixture transitionFixture(boolean activeTransition) {
        FrameLayout host = host();
        View row = new View(RuntimeEnvironment.getApplication());
        host.addView(row);
        FrameLayout overlay = new FrameLayout(RuntimeEnvironment.getApplication());
        if (activeTransition) {
            row.setAlpha(0f);
            host.addView(overlay);
        }
        Map<View, GboardTopRowSwipeRuntime.VisibleTopRowKey> visible =
                new HashMap<View, GboardTopRowSwipeRuntime.VisibleTopRowKey>();
        visible.put(row, new GboardTopRowSwipeRuntime.VisibleTopRowKey(
                new Object(),
                0,
                GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN));
        return new TransitionFixture(
                host,
                row,
                overlay,
                visible,
                snapshot(host, bitmap()),
                snapshot(host, bitmap()),
                new AtomicBoolean(false));
    }

    private static void invokeCleanup(Method cleanup, TransitionFixture fixture) {
        try {
            cleanup.invoke(null,
                    fixture.visible,
                    fixture.host,
                    fixture.overlay,
                    fixture.before,
                    fixture.after,
                    fixture.cleaned);
        } catch (ReflectiveOperationException exception) {
            throw new AssertionError(exception);
        }
    }

    private static FrameLayout host() {
        return new FrameLayout(RuntimeEnvironment.getApplication());
    }

    private static AttachedRow attachedRow() {
        ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class)
                .setup()
                .visible();
        Activity activity = controller.get();
        FrameLayout host = new FrameLayout(activity);
        View row = new View(activity);
        host.addView(row, new FrameLayout.LayoutParams(100, 40));
        activity.setContentView(host);
        host.measure(
                View.MeasureSpec.makeMeasureSpec(300, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(200, View.MeasureSpec.EXACTLY));
        host.layout(0, 0, 300, 200);
        row.layout(0, 0, 100, 40);
        assertTrue(row.isAttachedToWindow());
        return new AttachedRow(controller, activity, host, row);
    }

    private static Map<View, GboardTopRowSwipeRuntime.VisibleTopRowKey> cacheVisibleRow(
            View row) {
        Map<View, GboardTopRowSwipeRuntime.VisibleTopRowKey> visible =
                new HashMap<View, GboardTopRowSwipeRuntime.VisibleTopRowKey>();
        GboardTopRowSwipeRuntime.VisibleTopRowKey state =
                new GboardTopRowSwipeRuntime.VisibleTopRowKey(
                        new Object(),
                        0,
                        GboardTopRowSwipeRuntime.TopRowLayoutKind.ZHUYIN);
        visible.put(row, state);
        GboardTopRowSwipeRuntime.VISIBLE_TOP_ROW_KEYS.put(row, state);
        return visible;
    }

    private static Bitmap bitmap() {
        return Bitmap.createBitmap(2, 2, Bitmap.Config.ARGB_8888);
    }

    private static GboardTopRowSwipeRuntime.RowSnapshot snapshot(
            ViewGroup host, Bitmap bitmap) {
        return new GboardTopRowSwipeRuntime.RowSnapshot(
                host, new Rect(0, 0, 2, 2), bitmap);
    }

    private static int countOccurrences(String source, String needle) {
        int count = 0;
        int index = 0;
        while ((index = source.indexOf(needle, index)) >= 0) {
            count++;
            index += needle.length();
        }
        return count;
    }

    private static final class TransitionFixture {
        final FrameLayout host;
        final View row;
        final FrameLayout overlay;
        final Map<View, GboardTopRowSwipeRuntime.VisibleTopRowKey> visible;
        final GboardTopRowSwipeRuntime.RowSnapshot before;
        final GboardTopRowSwipeRuntime.RowSnapshot after;
        final AtomicBoolean cleaned;

        TransitionFixture(FrameLayout host,
                View row,
                FrameLayout overlay,
                Map<View, GboardTopRowSwipeRuntime.VisibleTopRowKey> visible,
                GboardTopRowSwipeRuntime.RowSnapshot before,
                GboardTopRowSwipeRuntime.RowSnapshot after,
                AtomicBoolean cleaned) {
            this.host = host;
            this.row = row;
            this.overlay = overlay;
            this.visible = visible;
            this.before = before;
            this.after = after;
            this.cleaned = cleaned;
        }
    }

    private static final class AttachedRow {
        final ActivityController<Activity> controller;
        final Activity activity;
        final FrameLayout host;
        final View row;

        AttachedRow(ActivityController<Activity> controller,
                Activity activity,
                FrameLayout host,
                View row) {
            this.controller = controller;
            this.activity = activity;
            this.host = host;
            this.row = row;
        }
    }
}
