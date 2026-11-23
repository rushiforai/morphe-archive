package app.tiktoklitepatches.extension;

import android.view.View;
import android.view.ViewGroup;

import java.lang.reflect.Method;
import java.util.List;
import java.util.regex.Pattern;

final class NativeAboutSection {
    private static final Pattern APP_VERSION = Pattern.compile("v[0-9]+(?:\\.[0-9]+)+\\s*\\([0-9]+\\)");

    private NativeAboutSection() {}

    static void hideWhenReady(View settings) {
        hideWhenReady(settings, 20);
    }

    private static void hideWhenReady(View settings, int attempts) {
        settings.postDelayed(() -> {
            if (!settings.isAttachedToWindow()) return;
            try {
                if (hideInView(settings)) return;
            } catch (ReflectiveOperationException | RuntimeException ignored) {
                // Leave the original page usable if this version uses another renderer.
                return;
            }
            if (attempts > 1) hideWhenReady(settings, attempts - 1);
        }, 200);
    }

    private static boolean hideInView(View view) throws ReflectiveOperationException {
        Method rendererGetter;
        try {
            rendererGetter = view.getClass().getMethod("getLynxUIRendererInternal");
        } catch (NoSuchMethodException ignored) {
            rendererGetter = null;
        }
        if (rendererGetter != null) {
            Object renderer = rendererGetter.invoke(view);
            if (renderer != null) {
                Object owner = renderer.getClass().getField("LB").get(renderer);
                if (owner != null) {
                    Object body = owner.getClass().getField("LB").get(owner);
                    if (body != null && hideInTree(owner, body)) return true;
                }
            }
        }

        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                if (hideInView(group.getChildAt(i))) return true;
            }
        }
        return false;
    }

    private static boolean hideInTree(Object owner, Object node) throws ReflectiveOperationException {
        List<?> children = (List<?>) node.getClass().getMethod("getChildren").invoke(node);
        if ("scroll-view".equals(tag(node))) return hideAboutSection(owner, node, children);
        for (Object child : children) {
            if (hideInTree(owner, child)) return true;
        }
        return false;
    }

    private static boolean hideAboutSection(Object owner, Object scroll, List<?> rows) throws ReflectiveOperationException {
        // The version usually ends the scroll content. A signed-in page can add
        // an account section around it, so locate it rather than using the last index.
        int version = rows.size() - 1;
        while (version >= 6 && !isVersion(rows.get(version))) version--;
        if (version < 6) return false;

        int boundary = version;
        int heading = precedingHeading(rows, boundary);
        int links = boundary - heading - 1;
        if (links < 3 && heading >= 2 && isSectionHeading(rows, heading)) {
            boundary = heading - 1;
            heading = precedingHeading(rows, boundary);
            links = boundary - heading - 1;
        }
        if (!isSectionHeading(rows, heading) || links < 3 || links > 5) return false;

        int start = heading - 1;
        int end = boundary == version ? version + 1 : boundary;
        int removedHeight = end < rows.size() ? top(rows.get(end)) - top(rows.get(start)) : 0;
        if (end < rows.size() && removedHeight <= 0) return false;

        Class<?> base = Class.forName("com.lynx.tasm.behavior.ui.LynxBaseUI", false,
                scroll.getClass().getClassLoader());
        // The renderer owns both the child collection and the flattened draw list.
        Method remove = owner.getClass().getMethod("LIIL", int.class, int.class);
        Method sign = base.getMethod("getSign");
        Method measure = scroll.getClass().getMethod("measure");
        Method layoutChildren = scroll.getClass().getMethod("layoutChildren");
        View host = (View) scroll.getClass().getMethod("getView").invoke(scroll);
        Method setTop = base.getMethod("setTop", int.class);
        if (version >= end) {
            // Keep the native bottom inset so the last account action can scroll above the mod entry.
            base.getMethod("setAlpha", float.class).invoke(rows.get(version), 0f);
        }
        for (int i = rows.size() - 1; i >= end; i--) {
            setTop.invoke(rows.get(i), top(rows.get(i)) - removedHeight);
        }
        for (int i = end - 1; i >= start; i--) {
            remove.invoke(owner, -1, sign.invoke(rows.get(i)));
        }
        host.requestLayout();
        measure.invoke(scroll);
        layoutChildren.invoke(scroll);
        host.invalidate();
        return true;
    }

    private static boolean isVersion(Object row) throws ReflectiveOperationException {
        if (!"text".equals(tag(row))) return false;
        Object label = row.getClass().getMethod("getAccessibilityLabel").invoke(row);
        return label != null && APP_VERSION.matcher(label.toString().trim()).matches();
    }

    private static int precedingHeading(List<?> rows, int boundary) throws ReflectiveOperationException {
        int heading = boundary - 1;
        while (heading >= 0 && "x-ripple".equals(tag(rows.get(heading)))) heading--;
        return heading;
    }

    private static boolean isSectionHeading(List<?> rows, int heading) throws ReflectiveOperationException {
        return heading >= 2 && "text".equals(tag(rows.get(heading)))
                && "view".equals(tag(rows.get(heading - 1)))
                && "x-ripple".equals(tag(rows.get(heading - 2)));
    }

    private static int top(Object row) throws ReflectiveOperationException {
        return (int) row.getClass().getMethod("getTop").invoke(row);
    }

    private static Object tag(Object node) throws ReflectiveOperationException {
        return node.getClass().getMethod("getTagName").invoke(node);
    }
}
