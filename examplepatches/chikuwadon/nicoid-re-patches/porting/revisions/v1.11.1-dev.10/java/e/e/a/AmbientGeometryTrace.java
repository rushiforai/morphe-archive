package e.e.a;

import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.WindowInsets;
import java.util.Arrays;

/** Temporary geometry-only diagnostics for the development build. */
final class AmbientGeometryTrace {
    private final int[] position = new int[2];
    private final Rect visible = new Rect();
    private long next;
    private String previous;

    boolean begin() {
        long now = SystemClock.uptimeMillis();
        if (now < next) return false;
        next = now + 1000;
        return true;
    }

    void unavailable(String role, View view) {
        if (!begin()) return;
        StringBuilder line = new StringBuilder("unavailable ").append(role);
        append(line, role, view);
        emit(line.toString());
    }

    void layout(View root, View host, View decor, View target, View source,
                View tab, ViewGroup pager, View page, Rect frame, Rect glow, Rect exterior,
                int[] limits, int intensity, int spread, boolean split, boolean tabActive,
                boolean pageActive) {
        StringBuilder line = new StringBuilder("NORMAL");
        line.append(" density=").append(root.getResources().getDisplayMetrics().density)
                .append(" strength=").append(intensity).append(" spreadDp=").append(spread)
                .append(" split=").append(split).append(" tabInstalled=").append(tabActive)
                .append(" pageInstalled=").append(pageActive)
                .append(" frame=").append(frame.toShortString()).append(" glow=").append(glow.toShortString())
                .append(" exterior=").append(exterior.toShortString())
                .append(" limitsPx=").append(Arrays.toString(limits));
        WindowInsets insets = decor.getRootWindowInsets();
        if (insets != null) {
            line.append(" insets=").append(insets.getSystemWindowInsetLeft()).append(',')
                    .append(insets.getSystemWindowInsetTop()).append(',')
                    .append(insets.getSystemWindowInsetRight()).append(',')
                    .append(insets.getSystemWindowInsetBottom());
        }
        append(line, "root", root);
        append(line, "host", host);
        append(line, "decor", decor);
        append(line, "commentlay", target);
        append(line, "source", source);
        int id = root.getResources().getIdentifier("videoLayout", "id", root.getContext().getPackageName());
        append(line, "videoLayout", id == 0 ? null : root.findViewById(id));
        append(line, "tab", tab);
        append(line, "pager", pager);
        if (pager != null) children(line, "pagerChild", pager);
        append(line, "matched", page);
        if (page instanceof ViewGroup) children(line, "matchedChild", (ViewGroup) page);
        emit(line.toString());
    }

    private void children(StringBuilder line, String label, ViewGroup parent) {
        int count = Math.min(parent.getChildCount(), 8);
        for (int i = 0; i < count; i++) append(line, label + i, parent.getChildAt(i));
    }

    private void append(StringBuilder line, String role, View view) {
        line.append("\n  ").append(role).append('=');
        if (view == null) {
            line.append("none");
            return;
        }
        view.getLocationOnScreen(position);
        Drawable bg = view.getBackground();
        ViewParent parent = view.getParent();
        line.append(view.getClass().getSimpleName())
                .append(" screen=").append(position[0]).append(',').append(position[1])
                .append(' ').append(view.getWidth()).append('x').append(view.getHeight())
                .append(" visible=").append(view.getGlobalVisibleRect(visible) ? visible.toShortString() : "none")
                .append(" shown=").append(view.isShown()).append(" alpha=").append(view.getAlpha())
                .append(" z=").append(view.getZ()).append(" elevation=").append(view.getElevation())
                .append(" bg=").append(bg == null ? "none" : bg.getClass().getSimpleName())
                .append(" parent=").append(parent == null ? "none" : parent.getClass().getSimpleName());
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            line.append(" clipChildren=").append(group.getClipChildren())
                    .append(" clipPadding=").append(group.getClipToPadding());
        }
    }

    private void emit(String message) {
        if (message.equals(previous)) return;
        previous = message;
        record(message);
    }

    static void record(String message) {
        String line = "[ambient-geometry] " + message;
        android.util.Log.i("nicoid-ambient", line);
        try {
            Dev112.staticCall("e.e.a.ModernDebug", "record", new Class<?>[]{String.class}, line);
        } catch (Exception ignored) {
            // Logcat still has the diagnostic if the export bridge is unavailable.
        }
    }
}
