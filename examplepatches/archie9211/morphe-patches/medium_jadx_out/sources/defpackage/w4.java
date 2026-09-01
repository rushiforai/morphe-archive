package defpackage;

import android.app.Notification;
import android.os.Build;
import android.view.accessibility.AccessibilityNodeInfo;
import android.window.BackEvent;
import java.lang.Thread;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class w4 {
    public static final ic8 a(BackEvent backEvent) {
        return new ic8(backEvent.getProgress(), backEvent.getTouchX(), backEvent.getTouchY(), backEvent.getSwipeEdge(), Build.VERSION.SDK_INT >= 36 ? backEvent.getFrameTimeMillis() : 0L);
    }

    public static final String b(Thread.State state) {
        switch (ykd.a[state.ordinal()]) {
            case 1:
                return "new";
            case 2:
                return "blocked";
            case 3:
                return "runnable";
            case 4:
                return "terminated";
            case 5:
                return "timed_waiting";
            case 6:
                return "waiting";
            default:
                ygf.a();
                return null;
        }
    }

    public static int c(AccessibilityNodeInfo accessibilityNodeInfo) {
        return accessibilityNodeInfo.getChecked();
    }

    public static int d(AccessibilityNodeInfo accessibilityNodeInfo) {
        return accessibilityNodeInfo.getExpandedState();
    }

    public static CharSequence e(AccessibilityNodeInfo accessibilityNodeInfo) {
        return accessibilityNodeInfo.getSupplementalDescription();
    }

    public static boolean f(AccessibilityNodeInfo accessibilityNodeInfo) {
        return accessibilityNodeInfo.isFieldRequired();
    }

    public static final long g(Thread thread) {
        return Build.VERSION.SDK_INT >= 36 ? thread.threadId() : thread.getId();
    }

    public static void h(Notification.Builder builder) {
        builder.setShortCriticalText(null);
    }
}
