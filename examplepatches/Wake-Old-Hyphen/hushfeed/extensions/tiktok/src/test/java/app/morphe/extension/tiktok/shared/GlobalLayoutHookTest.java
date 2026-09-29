package app.morphe.extension.tiktok.shared;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.widget.FrameLayout;

import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.shared.GlobalLayoutHook;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class GlobalLayoutHookTest {
    @Test public void replacingRootsDetachesTheOldListenerAndDetachStopsTheNewOne() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        FrameLayout first = new FrameLayout(activity);
        FrameLayout second = new FrameLayout(activity);
        AtomicInteger calls = new AtomicInteger();
        GlobalLayoutHook hook = new GlobalLayoutHook();

        assertTrue(hook.install(first, calls::incrementAndGet));
        first.getViewTreeObserver().dispatchOnGlobalLayout();
        assertEquals(1, calls.get());
        assertFalse(hook.install(first, calls::incrementAndGet));

        assertTrue(hook.install(second, calls::incrementAndGet));
        first.getViewTreeObserver().dispatchOnGlobalLayout();
        assertEquals(1, calls.get());
        second.getViewTreeObserver().dispatchOnGlobalLayout();
        assertEquals(2, calls.get());

        hook.detach();
        second.getViewTreeObserver().dispatchOnGlobalLayout();
        assertEquals(2, calls.get());
    }

    /**
     * A listener added before its root reached a window moves to the window's observer when the
     * root is attached, and the observer it was added to reports dead. Installing again on that
     * root added a second listener, so every layout pass ran twice, and detach couldn't reach it.
     */
    @Test public void aRootAttachedAfterInstallKeepsOneListenerThatDetachStillReaches() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            FrameLayout root = new FrameLayout(activity);
            AtomicInteger calls = new AtomicInteger();
            GlobalLayoutHook hook = new GlobalLayoutHook();

            assertTrue(hook.install(root, calls::incrementAndGet));
            activity.setContentView(root);
            controller.visible();
            assertTrue("the root never reached a window", root.isAttachedToWindow());

            assertFalse(hook.install(root, calls::incrementAndGet));
            calls.set(0);
            root.getViewTreeObserver().dispatchOnGlobalLayout();
            assertEquals("the pass ran more than once", 1, calls.get());

            hook.detach();
            root.getViewTreeObserver().dispatchOnGlobalLayout();
            assertEquals("detach left the listener on the window", 1, calls.get());
        }
    }

    @Test public void invalidInstallDetachesTheExistingListener() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        FrameLayout root = new FrameLayout(activity);
        AtomicInteger calls = new AtomicInteger();
        GlobalLayoutHook hook = new GlobalLayoutHook();

        assertTrue(hook.install(root, calls::incrementAndGet));
        assertFalse(hook.install(null, calls::incrementAndGet));
        root.getViewTreeObserver().dispatchOnGlobalLayout();
        assertEquals(0, calls.get());
    }
}
