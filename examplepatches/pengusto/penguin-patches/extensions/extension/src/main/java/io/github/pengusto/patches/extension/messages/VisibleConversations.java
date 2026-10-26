/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.pengusto.patches.extension.messages;

import android.app.Activity;
import android.content.*;
import android.os.*;
import android.util.Log;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Visibility is per Activity; synchronized for EventBus background readers. */
public final class VisibleConversations {
    private static final WeakHashMap<Activity, Long> visible = new WeakHashMap<>();
    private static final ThreadLocal<Boolean> replay = new ThreadLocal<>();
    private static final Handler main = new Handler(Looper.getMainLooper());
    private static final ExecutorService reads = Executors.newSingleThreadExecutor();
    public static synchronized void resume(Activity activity, long thread) { visible.put(activity, thread); }
    public static synchronized void pause(Activity activity) { visible.remove(activity); }
    public static synchronized boolean skipRead(Activity activity, boolean alreadyRead) {
        return alreadyRead || !visible.containsKey(activity);
    }
    public static synchronized boolean isVisible(long thread) {
        return thread > 0 && visible.containsValue(thread);
    }
    /** Stub bound to the exact-message provider write and Fossify's refresh events by the patch. */
    public static void markRead(Context context, long message, boolean mms, long thread) {
        throw new IllegalStateException("Missing Messages read bridge");
    }
    /** Called inside the original Handler Runnable, never before the main-thread queue. */
    public static boolean suppress(Context context, long message, boolean mms, long thread, Runnable original) {
        if (Boolean.TRUE.equals(replay.get()) || Looper.myLooper() != Looper.getMainLooper() || !isVisible(thread)) return false;
        reads.execute(() -> {
            try { markRead(context, message, mms, thread); }
            catch (RuntimeException failure) {
                Log.e("PenguinMessages", "Could not mark visible message read; keeping notification", failure);
                main.post(() -> {
                    replay.set(true);
                    try { original.run(); } finally { replay.remove(); }
                });
            }
        });
        return true;
    }
}
