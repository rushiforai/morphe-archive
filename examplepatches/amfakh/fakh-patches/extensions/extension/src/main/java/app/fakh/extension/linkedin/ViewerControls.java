package app.fakh.extension.linkedin;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;

import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Keeps the download button of a Compose media viewer level with the viewer's back button, and shown only while the
 * back button is (a tap on the screen hides and shows the controls of the viewer). The semantics tree of the viewer is
 * read before every frame for this, so the button changes in the same frame as the controls. The back button is the
 * labelled node in the top left corner that is smaller than the screen.
 */
final class ViewerControls implements ViewTreeObserver.OnPreDrawListener {
    private final ViewGroup content;
    private final View button;
    private boolean shown = true;
    /** Whether the back button has been seen: until then the button stays, so a viewer without one is not affected. */
    private boolean seenBack;
    /** Frames in a row without the back button. One frame without it is the controls being laid out again. */
    private int missing;

    private ViewerControls(ViewGroup content, View button) {
        this.content = content;
        this.button = button;
    }

    /** Starts following the controls of the viewer in the content of an activity until the button is removed. */
    static void follow(ViewGroup content, View button) {
        content.getViewTreeObserver().addOnPreDrawListener(new ViewerControls(content, button));
    }

    @Override
    public boolean onPreDraw() {
        try {
            if (button.isAttachedToWindow()) {
                update();
                return true;
            }
        } catch (Throwable t) {
            Diagnostics.error("viewer controls unreadable", t);
        }
        content.getViewTreeObserver().removeOnPreDrawListener(this);
        return true;
    }

    private void update() throws Exception {
        View compose = composeView(content);
        if (compose == null) return;
        Object owner = compose.getClass().getMethod("getSemanticsOwner").invoke(compose);
        Object root = owner.getClass().getMethod("getUnmergedRootSemanticsNode").invoke(owner);
        // The top of the back button, or NaN when there is none.
        float[] found = {Float.NaN};
        scan(root, compose.getWidth(), compose.getHeight(), 0, found);

        boolean back = !Float.isNaN(found[0]);
        seenBack |= back;
        missing = back ? 0 : missing + 1;
        // Makes sure there is a next frame to confirm it.
        if (missing == 1 && seenBack) content.postInvalidateOnAnimation();
        boolean controls = back || !seenBack || (shown && missing < 2);
        if (controls != shown) {
            shown = controls;
            // The controls of the viewer appear and disappear without a fade, and so does the button.
            button.setVisibility(controls ? View.VISIBLE : View.INVISIBLE);
        }
        if (back) {
            int[] origin = new int[2];
            content.getLocationInWindow(origin);
            FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) button.getLayoutParams();
            int top = Math.round(found[0]) - origin[1];
            if (Math.abs(params.topMargin - top) > 1) {
                params.topMargin = top;
                button.setLayoutParams(params);
            }
        }
    }

    /** The largest Compose view under a parent. */
    private static View composeView(View view) {
        View best = view.getClass().getName().endsWith("AndroidComposeView") ? view : null;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = composeView(group.getChildAt(i));
                if (found != null && (best == null || found.getWidth() * found.getHeight() > best.getWidth() * best.getHeight())) {
                    best = found;
                }
            }
        }
        return best;
    }

    private static void scan(Object node, int width, int height, int depth, float[] found) throws Exception {
        if (depth > 60) return;
        Object rect = node.getClass().getMethod("getBoundsInWindow").invoke(node);
        Class<?> r = rect.getClass();
        float left = r.getField("left").getFloat(rect);
        float top = r.getField("top").getFloat(rect);
        float w = r.getField("right").getFloat(rect) - left;
        float h = r.getField("bottom").getFloat(rect) - top;

        Object config = node.getClass().getMethod("getConfig").invoke(node);
        Iterator<?> it = (Iterator<?>) config.getClass().getMethod("iterator").invoke(config);
        boolean labelled = false;
        while (it.hasNext()) {
            Object key = ((Map.Entry<?, ?>) it.next()).getKey();
            Object name = key.getClass().getField("name").get(key);
            labelled |= "ContentDescription".equals(name) || "Text".equals(name);
        }
        if (labelled && top < height * 0.15f && left < width * 0.25f && w < width * 0.3f && !(top >= found[0])) {
            found[0] = top;
        }
        Method children = node.getClass().getMethod("getChildren$ui", boolean.class, boolean.class, boolean.class);
        for (Object child : (List<?>) children.invoke(node, true, false, false)) {
            scan(child, width, height, depth + 1, found);
        }
    }
}
