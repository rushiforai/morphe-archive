package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.app.Activity;
import android.graphics.Rect;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.annotation.LooperMode;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * The caption must be placed against the anchor's actual parent, not a stale hostRef: a comment
 * sheet moves the player into an inset container, and using the outer host shifts the whole box.
 */
@RunWith(RobolectricTestRunner.class)
@Config(
        sdk = 28,
        qualifiers = "w1280dp-h1000dp-mdpi",
        shadows = {CaptionPlacementParentTest.Surface.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@LooperMode(LooperMode.Mode.PAUSED)
public class CaptionPlacementParentTest {
    private static final int INSET_X = 144, INSET_Y = 263;
    private static final int VIDEO_W = 800, VIDEO_H = 600;

    @Implements(CaptionSurface.class)
    public static class Surface {
        static FrameLayout outer, inner;
        static Rect local = new Rect();

        @Implementation
        public static FrameLayout stableCaptionHost() {
            return outer;
        }

        @Implementation
        public static FrameLayout captionHost() {
            return outer;
        }

        @Implementation
        public static boolean pinnedHost(FrameLayout host) {
            return false;
        }

        @Implementation
        public static boolean topmostOverlayHost(FrameLayout host) {
            return false;
        }

        @Implementation
        public static FrameLayout touchHost() {
            return null;
        }

        @Implementation
        public static boolean isShorts() {
            return false;
        }

        @Implementation
        public static View currentSurfaceView() {
            return null;
        }

        @Implementation
        public static Rect currentVideoBounds(View host) {
            if (host == inner) return new Rect(local);
            if (host == outer)
                return new Rect(
                        local.left + INSET_X,
                        local.top + INSET_Y,
                        local.right + INSET_X,
                        local.bottom + INSET_Y);
            return null;
        }

        @Implementation
        public static Rect refreshedVideoBounds(View host) {
            return currentVideoBounds(host);
        }
    }

    private Activity activity;
    private FrameLayout root, outer, inner, anchor;
    private TextView text;

    @Before
    public void before() throws Exception {
        activity = Robolectric.buildActivity(Activity.class).setup().visible().get();
        root = new FrameLayout(activity);
        activity.setContentView(root);
        outer = new FrameLayout(activity);
        root.addView(
                outer,
                new FrameLayout.LayoutParams(
                        FrameLayout.LayoutParams.MATCH_PARENT,
                        FrameLayout.LayoutParams.MATCH_PARENT));
        inner = new FrameLayout(activity);
        FrameLayout.LayoutParams inset =
                new FrameLayout.LayoutParams(VIDEO_W, VIDEO_H);
        inset.leftMargin = INSET_X;
        inset.topMargin = INSET_Y;
        outer.addView(inner, inset);
        anchor = new FrameLayout(activity);
        inner.addView(anchor, new FrameLayout.LayoutParams(1, 1));
        text = new TextView(activity);
        text.setText("Caption");
        text.setTextSize(20);
        anchor.addView(
                text,
                new FrameLayout.LayoutParams(
                        FrameLayout.LayoutParams.WRAP_CONTENT,
                        FrameLayout.LayoutParams.WRAP_CONTENT));
        layout();
        assertEquals("the test must start in the inset container", inner, anchor.getParent());

        Surface.outer = outer;
        Surface.inner = inner;
        Surface.local.set(0, 0, VIDEO_W, VIDEO_H);
        set("hostRef", new WeakReference<>(outer));
        set("anchorRef", new WeakReference<>(anchor));
        set("textRef", new WeakReference<>(text));
        set("boxWidth", 0);
        set("boxHeight", 0);
    }

    @After
    public void after() throws Exception {
        if (anchor != null && anchor.getParent() instanceof View) {
            ((android.view.ViewGroup) anchor.getParent()).removeView(anchor);
        }
        set("hostRef", new WeakReference<>(null));
        set("anchorRef", new WeakReference<>(null));
        set("textRef", new WeakReference<>(null));
        set("beforeTraversalScheduled", false);
        activity.finish();
    }

    /**
     * A pre-draw pass must never remount the anchor. When the parent and hostRef disagree it can
     * only mark the content dirty and ask for the next traversal.
     */
    @Test
    public void preDrawDoesNotAttachWhenTheParentDiffersFromTheHost() throws Exception {
        set("boxWidth", 400);
        set("boxHeight", 80);
        set("contentNow", false);
        set("dirty", false);
        set("beforeTraversalScheduled", false);

        Method follow =
                CaptionOverlay.class.getDeclaredMethod(
                        "followVisibleTextTranslation", Activity.class, FrameLayout.class);
        follow.setAccessible(true);
        follow.invoke(null, activity, anchor);

        assertSame("pre-draw must leave the anchor where it is", inner, anchor.getParent());
        assertSame(
                "pre-draw must not replace hostRef",
                outer,
                ((WeakReference<?>) get("hostRef")).get());
        assertTrue("the next frame is asked to commit", (Boolean) get("contentNow"));
        assertTrue("the content is marked dirty", (Boolean) get("dirty"));
        assertTrue(
                "a before-traversal frame is scheduled",
                (Boolean) get("beforeTraversalScheduled"));
    }

    @Test
    public void theBoxIsCenteredOnTheVideoInTheAnchorsActualParent() throws Exception {
        // The caller's rectangle is in hostRef coordinates, as the old render path computed it.
        Rect hostRelativeVideo = new Rect(
                INSET_X, INSET_Y, INSET_X + VIDEO_W, INSET_Y + VIDEO_H);
        Method place =
                CaptionOverlay.class.getDeclaredMethod(
                        "placeVisibleText",
                        Activity.class,
                        FrameLayout.class,
                        FrameLayout.class,
                        TextView.class,
                        Rect.class,
                        int.class,
                        boolean.class);
        place.setAccessible(true);
        place.invoke(null, activity, outer, anchor, text, hostRelativeVideo, 400, true);

        // The stale parent is remounted onto the real host, then the position is computed there.
        assertEquals(outer, anchor.getParent());
        layout();

        int[] anchorLocation = new int[2];
        anchor.getLocationOnScreen(anchorLocation);
        int[] innerLocation = new int[2];
        inner.getLocationOnScreen(innerLocation);
        float captionCenter = anchorLocation[0] + anchor.getWidth() / 2f;
        float videoCenter = innerLocation[0] + Surface.local.exactCenterX();

        assertEquals(
                "caption center follows the video inside the inset parent",
                videoCenter,
                captionCenter,
                1f);
    }

    private void layout() {
        root.measure(
                View.MeasureSpec.makeMeasureSpec(1000, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(1000, View.MeasureSpec.EXACTLY));
        root.layout(0, 0, 1000, 1000);
    }

    private static void set(String name, Object value) throws Exception {
        Field field = CaptionOverlay.class.getDeclaredField(name);
        field.setAccessible(true);
        field.set(null, value);
    }

    private static Object get(String name) throws Exception {
        Field field = CaptionOverlay.class.getDeclaredField(name);
        field.setAccessible(true);
        return field.get(null);
    }
}
