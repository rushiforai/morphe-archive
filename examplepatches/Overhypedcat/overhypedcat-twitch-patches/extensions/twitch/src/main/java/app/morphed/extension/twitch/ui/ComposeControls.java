package app.morphed.extension.twitch.ui;

import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;

import java.lang.reflect.Method;
import java.util.ArrayDeque;
import java.util.regex.Pattern;

/**
 * Controls drawn by Jetpack Compose (the native player's vertical view): one view with no children to find, so
 * they are read through the accessibility nodes Compose gives for them. The stream's uptime ("5:00:48") is shown
 * only while the controls are up, in their top row.
 */
final class ComposeControls {
    /** An uptime as the player writes it: h:mm:ss or m:ss. */
    static final Pattern UPTIME = Pattern.compile("\\d{1,3}:\\d{2}(:\\d{2})?");
    /** Nodes looked at, at most (a screen of controls has a few dozen). */
    private static final int MAX_NODES = 400;
    /** Without a way to list a node's children: ids tried one by one, up to this. */
    private static final int MAX_PROBED_ID = 1500;

    private static Method childId;
    private static boolean childIdLooked;

    private ComposeControls() {
    }

    /**
     * Where the uptime is on screen, into {@code out}; false when it isn't shown (the controls are down) or the
     * nodes can't be read.
     */
    static boolean uptime(View compose, Rect out) {
        View host = compose;
        if (compose instanceof ViewGroup && ((ViewGroup) compose).getChildCount() > 0) {
            host = ((ViewGroup) compose).getChildAt(0); // the Compose view inside its holder
        }
        AccessibilityNodeProvider provider = host.getAccessibilityNodeProvider();
        if (provider == null) return false;
        AccessibilityNodeInfo root = provider.createAccessibilityNodeInfo(AccessibilityNodeProvider.HOST_VIEW_ID);
        if (root == null) return false;
        Method children = childIdMethod();
        if (children != null) {
            ArrayDeque<AccessibilityNodeInfo> queue = new ArrayDeque<>();
            queue.add(root);
            int seen = 0;
            while (!queue.isEmpty() && seen++ < MAX_NODES) {
                AccessibilityNodeInfo node = queue.poll();
                if (isUptime(node)) {
                    node.getBoundsInScreen(out);
                    return true;
                }
                for (int i = 0; i < node.getChildCount(); i++) {
                    try {
                        long id = (Long) children.invoke(node, i);
                        AccessibilityNodeInfo child = provider.createAccessibilityNodeInfo((int) (id >> 32));
                        if (child != null) queue.add(child);
                    } catch (ReflectiveOperationException | RuntimeException e) {
                        break; // listed no further: the ids are tried below
                    }
                }
            }
            if (queue.isEmpty()) return false; // all looked through: not shown
        }
        for (int id = 0; id <= MAX_PROBED_ID; id++) {
            AccessibilityNodeInfo node = provider.createAccessibilityNodeInfo(id);
            if (node != null && isUptime(node)) {
                node.getBoundsInScreen(out);
                return true;
            }
        }
        return false;
    }

    static boolean isUptime(CharSequence text) {
        return text != null && UPTIME.matcher(text.toString().trim()).matches();
    }

    private static boolean isUptime(AccessibilityNodeInfo node) {
        return isUptime(node.getText()) && node.isVisibleToUser();
    }

    /** AccessibilityNodeInfo's own way to list a node's children (not public), or null. */
    private static Method childIdMethod() {
        if (!childIdLooked) {
            childIdLooked = true;
            try {
                childId = AccessibilityNodeInfo.class.getDeclaredMethod("getChildId", int.class);
                childId.setAccessible(true);
            } catch (ReflectiveOperationException | RuntimeException blocked) {
                childId = null; // Android blocks it: the ids are tried one by one
            }
        }
        return childId;
    }
}
