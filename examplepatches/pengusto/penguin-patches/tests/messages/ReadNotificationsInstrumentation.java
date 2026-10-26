package io.github.pengusto.patches.tests;

import android.app.*;
import android.os.*;
import android.content.Context;
import io.github.pengusto.patches.extension.messages.ReadNotifications;

/** Run only in an isolated emulator, against the installed patched APK. */
public final class ReadNotificationsInstrumentation extends Instrumentation {
    private int checks;
    private NotificationManager manager;
    private void check(boolean ok, String message) { if (!ok) throw new AssertionError(message); checks++; }
    private boolean active(int id) { for (var n : manager.getActiveNotifications()) if (n.getId() == id) return true; return false; }
    private void await(int id, boolean expected) {
        long deadline = SystemClock.uptimeMillis() + 3000;
        while (active(id) != expected && SystemClock.uptimeMillis() < deadline) SystemClock.sleep(25);
    }
    private void post(Context context, long thread) {
        manager.notify(Long.hashCode(thread), new Notification.Builder(context, "penguin-regression")
            .setSmallIcon(android.R.drawable.ic_dialog_info).setContentTitle("Synthetic regression fixture").build());
    }
    @Override public void onCreate(Bundle args) { super.onCreate(args); start(); }
    @Override public void onStart() {
        Bundle result = new Bundle();
        try {
            if (!Build.HARDWARE.contains("ranchu") && !Build.HARDWARE.contains("goldfish")) throw new IllegalStateException("Use an isolated emulator");
            Context context = getTargetContext();
            manager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            manager.createNotificationChannel(new NotificationChannel("penguin-regression", "Synthetic regression", NotificationManager.IMPORTANCE_LOW));
            long first = 991001L, other = 991002L, wide = (1L << 40) + 991003L;
            post(context, first); post(context, other); post(context, wide);
            await(Long.hashCode(first), true); await(Long.hashCode(other), true); await(Long.hashCode(wide), true);
            check(active(Long.hashCode(first)) && active(Long.hashCode(other)) && active(Long.hashCode(wide)), "fixtures posted");
            ReadNotifications.cancel(context, first);
            await(Long.hashCode(first), false);
            check(!active(Long.hashCode(first)), "selected thread canceled");
            check(active(Long.hashCode(other)), "unrelated thread retained");
            check(active(Long.hashCode(wide)), "unrelated wide thread retained");
            ReadNotifications.cancel(context, first);
            check(active(Long.hashCode(other)), "idempotent cancellation");
            ReadNotifications.cancel(context, wide);
            await(Long.hashCode(wide), false);
            check(!active(Long.hashCode(wide)) && active(Long.hashCode(other)), "Java Long.hashCode notification identity");
            manager.cancel(Long.hashCode(other));
            result.putString("stream", "PASS: " + checks + " notification assertions against installed patched app\n");
            finish(-1, result);
        } catch (Throwable failure) { result.putString("stream", "FAIL: " + failure); finish(0, result); }
        finally { if (manager != null) manager.deleteNotificationChannel("penguin-regression"); }
    }
}
