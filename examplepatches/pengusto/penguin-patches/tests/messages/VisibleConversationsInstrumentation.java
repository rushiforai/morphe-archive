package io.github.pengusto.patches.tests;

import android.app.*;
import android.content.*;
import android.net.Uri;
import android.os.*;
import android.provider.Telephony;
import io.github.pengusto.patches.extension.messages.VisibleConversations;
import java.util.concurrent.*;

/** Emulator only, no sending. Provider fixtures are removed in finally. */
public final class VisibleConversationsInstrumentation extends Instrumentation {
    private int checks;
    private void check(boolean ok, String why) { if (!ok) throw new AssertionError(why); checks++; }
    private int read(Context context, Uri uri) {
        try (var c = context.getContentResolver().query(uri, new String[]{"read"}, null, null, null)) {
            if (c == null || !c.moveToFirst()) throw new AssertionError("fixture missing");
            return c.getInt(0);
        }
    }
    private void awaitRead(Context context, Uri uri) {
        long until = SystemClock.uptimeMillis() + 5000;
        while (read(context, uri) == 0 && SystemClock.uptimeMillis() < until) SystemClock.sleep(25);
    }
    @Override public void onCreate(Bundle args) { super.onCreate(args); start(); }
    @Override public void onStart() {
        Bundle result = new Bundle(); Uri fixture = null, other = null;
        Activity[] activities = new Activity[2];
        runOnMainSync(() -> { activities[0] = new Activity(); activities[1] = new Activity(); });
        Activity a = activities[0], b = activities[1];
        try {
            if (!Build.HARDWARE.contains("ranchu")) throw new IllegalStateException("isolated emulator only");
            Context context = getTargetContext();
            check(VisibleConversations.skipRead(a, false), "new activity not visible");
            VisibleConversations.resume(a, 101);
            check(!VisibleConversations.skipRead(a, false), "visible unread can be read");
            check(VisibleConversations.skipRead(a, true), "already-read remains read");
            check(VisibleConversations.isVisible(101) && !VisibleConversations.isVisible(102), "thread isolation");
            VisibleConversations.resume(b, 102); VisibleConversations.pause(a);
            check(VisibleConversations.isVisible(102) && !VisibleConversations.isVisible(101), "old activity pause preserves new activity");
            VisibleConversations.resume(a, 102); VisibleConversations.pause(b);
            check(VisibleConversations.isVisible(102), "same thread in two instances");
            VisibleConversations.pause(a);
            check(!VisibleConversations.isVisible(102) && VisibleConversations.skipRead(a, false), "paused never auto-read");
            VisibleConversations.resume(a, 103); VisibleConversations.resume(a, 104);
            check(!VisibleConversations.isVisible(103) && VisibleConversations.isVisible(104), "resume replaces thread");
            check(!VisibleConversations.isVisible(0), "invalid thread never suppresses");
            boolean[] suppress = {true}; int[] fallbackCalls = {0};
            runOnMainSync(() -> {
                VisibleConversations.pause(a);
                suppress[0] = VisibleConversations.suppress(context, 1, false, 104, () -> fallbackCalls[0]++);
            });
            check(!suppress[0], "queued notification checks visibility at execution, not scheduling");
            long thread = Telephony.Threads.getOrCreateThreadId(context, "15550007777");
            ContentValues values = new ContentValues(); values.put("address", "15550007777"); values.put("body", "Penguin isolated lifecycle fixture");
            values.put("read", 0); values.put("seen", 0); values.put("thread_id", thread); values.put("date", System.currentTimeMillis());
            fixture = context.getContentResolver().insert(Telephony.Sms.Inbox.CONTENT_URI, values);
            values.put("body", "Penguin unrelated unread fixture"); other = context.getContentResolver().insert(Telephony.Sms.Inbox.CONTENT_URI, values);
            final Uri message = fixture; final long id = ContentUris.parseId(fixture);
            VisibleConversations.resume(a, thread);
            check(!VisibleConversations.suppress(context, id, false, thread, () -> {}), "background caller fails open");
            runOnMainSync(() -> suppress[0] = VisibleConversations.suppress(context, id, false, thread, () -> fallbackCalls[0]++));
            check(suppress[0], "visible message suppressed at main-thread execution");
            awaitRead(context, fixture);
            check(read(context, fixture) == 1, "exact provider message read");
            check(read(context, other) == 0, "later/unrelated message in same thread stays unread");
            CountDownLatch fallback = new CountDownLatch(1); boolean[] replayDecision = {true};
            runOnMainSync(() -> VisibleConversations.suppress(context, Long.MAX_VALUE, false, thread, () -> {
                fallbackCalls[0]++;
                replayDecision[0] = VisibleConversations.suppress(context, Long.MAX_VALUE, false, thread, () -> {});
                fallback.countDown();
            }));
            check(fallback.await(5, TimeUnit.SECONDS), "failed provider mark replays original notification");
            check(!replayDecision[0], "fallback cannot recursively suppress");
            check(fallbackCalls[0] == 1, "original notification fallback exactly once");
            VisibleConversations.pause(a);
            runOnMainSync(() -> suppress[0] = VisibleConversations.suppress(context, id, false, thread, () -> {}));
            check(!suppress[0], "post-pause notification allowed");
            result.putString("stream", "PASS: " + checks + " lifecycle/thread/provider/fallback assertions\n"); finish(-1, result);
        } catch (Throwable failure) { result.putString("stream", "FAIL: " + failure); finish(0, result); }
        finally {
            VisibleConversations.pause(a); VisibleConversations.pause(b);
            Context context = getTargetContext();
            if (fixture != null) context.getContentResolver().delete(fixture, null, null);
            if (other != null) context.getContentResolver().delete(other, null, null);
        }
    }
}
