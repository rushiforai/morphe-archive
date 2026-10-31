package io.github.emotionbug.patches.runtime;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.os.SystemClock;
import android.service.notification.StatusBarNotification;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;
import org.json.JSONObject;
import java.util.WeakHashMap;

/** Main-process publication owner. Worker commands arrive only through the same-UID provider. */
public final class SummaryNotifications {
    static final String OWNED = "io.github.emotionbug.summary.owned";
    static final String JOB_ID = "io.github.emotionbug.summary.job";
    static final String RECORDING_ID = "io.github.emotionbug.summary.recording";
    static final String BRIEFING_ID = "io.github.emotionbug.summary.briefing";
    static final String REPLACED = "io.github.emotionbug.summary.replaced";
    private static final String NATIVE = "io.github.emotionbug.summary.native";
    private static final Object PUBLICATION = new Object();
    private static final Map<PendingIntent, NativeIdentity> INTENTS = new WeakHashMap<>();
    private static String owner;
    private static Active active;
    private static boolean initialized;
    private SummaryNotifications() { }

    static final class Target {
        final String tag;
        final int id;
        final boolean replacesNative;
        Target(String tag, int id, boolean replacesNative) {
            this.tag = tag; this.id = id; this.replacesNative = replacesNative;
        }
    }
    private static final class Active {
        final String token = UUID.randomUUID().toString();
        final long job;
        SummaryStore.Job snapshot;
        String stage = "preparing";
        long expires;
        boolean replaced;
        Active(SummaryStore.Job job) { this.job = job.id; snapshot = job; renew(); }
        void renew() { expires = SystemClock.elapsedRealtime() + SummaryProgressNotification.TIMEOUT_MS; }
    }
    private static final class NativeIdentity {
        final Context context;
        final long briefing;
        NativeIdentity(Context context, long briefing) { this.context = context.getApplicationContext(); this.briefing = briefing; }
    }

    static String fallbackTag(long job) { return "ebpatcher-summary-" + job; }

    static void initialize(Context context) {
        synchronized (PUBLICATION) {
            if (initialized) return;
            initialized = true;
            cancelOngoing(context, 0);
        }
    }

    /** Generation-fenced IPC. Only worker stage/heartbeat commands renew the process-death lease. */
    static Bundle status(Context context, String command, Bundle values) {
        synchronized (PUBLICATION) {
            initialize(context);
            expire(context);
            Bundle result = new Bundle();
            if ("connect".equals(command)) {
                owner = UUID.randomUUID().toString();
                active = null;
                cancelOngoing(context, 0);
                result.putString("owner", owner);
                return result;
            }
            if (values == null || owner == null || !owner.equals(values.getString("owner"))) return result;
            if ("begin".equals(command)) {
                SummaryStore.Job job = byId(context, values.getLong("job"));
                if (job == null || job.revision != values.getInt("revision")) return result;
                if (active != null) cancelOngoing(context, active.job);
                active = new Active(job);
                publish(context, job, true, false, true);
                result.putString("session", active.token);
            } else if (active != null && active.token.equals(values.getString("session"))) {
                if ("stage".equals(command)) {
                    String stage = values.getString("stage");
                    if (SummaryProgressNotification.stageText(stage) == null) return result;
                    active.stage = stage;
                    active.renew();
                    SummaryStore.Job job = byId(context, active.job);
                    if (job != null) publish(context, job, true, false, true);
                } else if ("heartbeat".equals(command)) {
                    active.renew();
                    SummaryStore.Job job = byId(context, active.job);
                    if (job != null) publish(context, job, true, false, true);
                } else if ("finish".equals(command)) {
                    SummaryStore.Job job = byId(context, active.job);
                    long id = active.job;
                    // Fresh committed native state is sampled here, never in the inference process.
                    if (!publish(context, job == null ? active.snapshot : job, false, false, true)) cancelOngoing(context, id);
                    active = null;
                } else if ("close".equals(command)) {
                    long id = active.job;
                    active = null;
                    cancelOngoing(context, id);
                }
                result.putBoolean("accepted", true);
            }
            return result;
        }
    }

    private static void expire(Context context) {
        if (active != null && active.expires <= SystemClock.elapsedRealtime()) {
            long job = active.job;
            active = null;
            cancelOngoing(context, job);
        }
    }

    /** Only wws.Z's original getActivity call is redirected; its intent and flags stay unchanged. */
    public static PendingIntent pendingIntent(Context context, int request, Intent intent, int flags) {
        PendingIntent pending = PendingIntent.getActivity(context, request, intent, flags);
        try {
            if (pending != null && intent.getIntExtra("GOTO_ACTIVITY", -1) == 511
                    && intent.getLongExtra("BRIEF_INFO_ID", 0) > 0 && intent.getComponent() != null
                    && context.getPackageName().equals(intent.getComponent().getPackageName())) {
                synchronized (INTENTS) { INTENTS.put(pending, new NativeIdentity(context, intent.getLongExtra("BRIEF_INFO_ID", 0))); }
            } else if (pending != null) {
                synchronized (INTENTS) { INTENTS.remove(pending); }
            }
        } catch (RuntimeException | LinkageError ignored) { /* Original intent remains valid. */ }
        return pending;
    }

    /** The original predicate, notify, adoption and refresh share one publication critical section. */
    public static boolean publishNative(Object publisher, Object builder, Integer id, Object predicate) {
        synchronized (PUBLICATION) {
            final Method original;
            final Class<?> function;
            try {
                ClassLoader loader = publisher.getClass().getClassLoader();
                function = Class.forName("kotlin.jvm.functions.Function1", false, loader);
                original = publisher.getClass().getMethod("k",
                        Class.forName("com.skt.prod.dialer.business.notification.n0", false, loader), Integer.class, function);
            } catch (ReflectiveOperationException error) {
                throw new IllegalStateException("The verified summary publisher is unavailable", error);
            }
            Object filtered = predicate;
            final NativeIdentity[] accepted = new NativeIdentity[1];
            try {
                Method invoke = function.getMethod("invoke", Object.class);
                filtered = Proxy.newProxyInstance(function.getClassLoader(), new Class<?>[] { function }, (proxy, method, args) -> {
                    if ("hashCode".equals(method.getName())) return System.identityHashCode(proxy);
                    if ("equals".equals(method.getName())) return proxy == args[0];
                    if ("toString".equals(method.getName())) return "EBPatcher summary notification predicate";
                    if (!"invoke".equals(method.getName()) || args == null || args.length != 1) return null;
                    if (predicate != null) {
                        Object decision;
                        try { decision = invoke.invoke(predicate, args[0]); }
                        catch (InvocationTargetException error) { throw error.getCause(); }
                        if (!Boolean.TRUE.equals(decision)) return decision;
                    }
                    if (!(args[0] instanceof Notification)) return true;
                    Notification notification = (Notification) args[0];
                    NativeIdentity identity;
                    synchronized (INTENTS) { identity = INTENTS.get(notification.contentIntent); }
                    if (identity == null) return true;
                    accepted[0] = identity;
                    return !nativeArriving(identity.context, identity.briefing, notification);
                });
            } catch (ReflectiveOperationException | RuntimeException | LinkageError unavailable) {
                // Optional wrapper failure still invokes the original publisher and predicate.
                AdotSummaryHooks.failed(unavailable);
            }
            final boolean result;
            try { result = Boolean.TRUE.equals(original.invoke(publisher, builder, id, filtered)); }
            catch (InvocationTargetException error) { return rethrow(error.getCause()); }
            catch (IllegalAccessException error) { throw new IllegalStateException(error); }
            NativeIdentity identity = accepted[0];
            if (result && identity != null) {
                try {
                    SummaryStore.Job job = byBriefing(identity.context, identity.briefing);
                    if (job != null) refresh(identity.context, job.id);
                } catch (RuntimeException | LinkageError ignored) { /* Preserve the original publisher result. */ }
            }
            return result;
        }
    }

    @SuppressWarnings("unchecked") private static <E extends Throwable> boolean rethrow(Throwable error) throws E {
        throw (E) error;
    }

    static boolean nativeArriving(Context context, long briefing, Notification incoming) {
        synchronized (PUBLICATION) {
            try {
                initialize(context);
                expire(context);
                if (briefing <= 0 || (incoming.flags & (Notification.FLAG_GROUP_SUMMARY | Notification.FLAG_FOREGROUND_SERVICE)) != 0)
                    return false;
                if (incoming.extras == null) incoming.extras = new Bundle();
                incoming.extras.putBoolean(NATIVE, true);
                incoming.extras.putLong(BRIEFING_ID, briefing);
                SummaryStore.Job job = byBriefing(context, briefing);
                if (job == null || !hasOwned(context, job)) return false;
                return publish(context, job, active != null && active.job == job.id, true, false);
            } catch (RuntimeException | LinkageError ignored) { return false; }
        }
    }

    static Target target(Context context, SummaryStore.Job job) {
        synchronized (PUBLICATION) {
            try {
                NotificationManager manager = context.getSystemService(NotificationManager.class);
                if (manager == null) return null;
                Target owned = null;
                for (StatusBarNotification status : manager.getActiveNotifications()) {
                    if (!matches(context, status, job)) continue;
                    Bundle extras = status.getNotification().extras;
                    Target target = new Target(status.getTag(), status.getId(), extras.getBoolean(NATIVE) || extras.getBoolean(REPLACED));
                    if (!extras.getBoolean(OWNED)) return target;
                    owned = target;
                }
                return owned;
            } catch (RuntimeException | LinkageError ignored) { return null; }
        }
    }

    static String outcome(Context context, SummaryStore.Job job) {
        synchronized (PUBLICATION) {
            try {
                SummaryStore.Job fresh = byId(context, job.id);
                if (fresh != null) return SummaryStore.get(context).nativeOutcome(fresh);
                // Retention may prune a hidden completed job after native acknowledgement but before
                // the worker's finish command. The durable journal, not an old recommendation, wins.
                JSONObject journal = SummaryStore.get(context).nativeJournal(job.recordingId, job.audio);
                if (journal == null || job.briefingId > 0 && journal.optLong("briefing_id") != job.briefingId) return null;
                return journalOutcome(journal);
            } catch (RuntimeException | LinkageError ignored) { return null; }
        }
    }

    private static String journalOutcome(JSONObject journal) {
        String source = journal.optString("source");
        if (!"1".equals(journal.optString("committed")) || "1".equals(journal.optString("api_pending"))
                || !journal.optString("token").equals(journal.optString("applied_token"))
                || !source.equals(journal.optString("applied_source"))) return "pending";
        return "local".equals(source) || "api".equals(source) ? source : "pending";
    }

    /** Never recreates a dismissed terminal notice, and never renews an inference lease. */
    static void refresh(Context context, long jobId) {
        synchronized (PUBLICATION) {
            try {
                initialize(context);
                expire(context);
                SummaryStore.Job job = byId(context, jobId);
                if (job == null) return;
                if (active == null || active.job != jobId) cancelOngoing(context, jobId);
                publish(context, job, active != null && active.job == jobId, false, false);
            } catch (RuntimeException | LinkageError ignored) { /* Result storage is independent of status. */ }
        }
    }

    /** Called only under PUBLICATION, including the final identity check and exact duplicate removal. */
    private static boolean publish(Context context, SummaryStore.Job job, boolean ongoing, boolean replaced, boolean allowCreate) {
        try {
            if (active != null && active.job == job.id) active.snapshot = job;
            if (android.os.Build.VERSION.SDK_INT >= 33 && context.checkSelfPermission("android.permission.POST_NOTIFICATIONS")
                    != android.content.pm.PackageManager.PERMISSION_GRANTED) return false;
            NotificationManager manager = context.getSystemService(NotificationManager.class);
            if (manager == null || !manager.areNotificationsEnabled()) return false;
            Target destination = target(context, job);
            if (destination == null && !allowCreate) return false;
            if (destination == null || !keyMatches(context, manager, destination, job, false)) {
                if (!allowCreate) return false;
                destination = new Target(fallbackTag(job.id), SummaryProgressNotification.NOTIFICATION, false);
                if (!keyMatches(context, manager, destination, job, true)) return false;
            }
            replaced |= destination.replacesNative || active != null && active.job == job.id && active.replaced;
            String text = ongoing ? SummaryProgressNotification.stageText(active.stage)
                    : SummaryProgressNotification.resultText(outcome(context, job), replaced);
            if (text == null) return false;
            SummaryProgressNotification.ensureChannel(manager);
            Notification notification = SummaryProgressNotification.notification(context, job, text, ongoing, replaced);
            if (ongoing) notification = Notification.Builder.recoverBuilder(context, notification)
                    .setTimeoutAfter(Math.max(1, active.expires - SystemClock.elapsedRealtime())).build();
            // An adopted native key is never treated as empty/available after its identity changes.
            if (!keyMatches(context, manager, destination, job, allowCreate && fallbackTag(job.id).equals(destination.tag))) return false;
            manager.notify(destination.tag, destination.id, notification);
            if (active != null && active.job == job.id) active.replaced = replaced;
            for (StatusBarNotification status : manager.getActiveNotifications()) {
                if (matches(context, status, job)
                        && (destination.id != status.getId() || !Objects.equals(destination.tag, status.getTag()))) {
                    Target duplicate = new Target(status.getTag(), status.getId(), false);
                    if (keyMatches(context, manager, duplicate, job, false)) manager.cancel(duplicate.tag, duplicate.id);
                }
            }
            return true;
        } catch (RuntimeException | LinkageError ignored) { return false; }
    }

    private static boolean keyMatches(Context context, NotificationManager manager, Target target, SummaryStore.Job job, boolean absent) {
        for (StatusBarNotification status : manager.getActiveNotifications())
            if (status.getId() == target.id && Objects.equals(status.getTag(), target.tag)) return matches(context, status, job);
        return absent;
    }

    private static boolean hasOwned(Context context, SummaryStore.Job job) {
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        if (manager == null) return false;
        for (StatusBarNotification status : manager.getActiveNotifications())
            if (matches(context, status, job) && status.getNotification().extras.getBoolean(OWNED)) return true;
        return false;
    }

    private static void cancelOngoing(Context context, long job) {
        try {
            NotificationManager manager = context.getSystemService(NotificationManager.class);
            if (manager == null) return;
            for (StatusBarNotification status : manager.getActiveNotifications()) {
                Notification notice = status.getNotification();
                if (context.getPackageName().equals(status.getPackageName()) && notice.extras != null
                        && notice.extras.getBoolean(OWNED) && (job == 0 || notice.extras.getLong(JOB_ID) == job)
                        && (notice.flags & Notification.FLAG_ONGOING_EVENT) != 0)
                    manager.cancel(status.getTag(), status.getId());
            }
        } catch (RuntimeException | LinkageError ignored) { /* The system timeout also removes a dead lease. */ }
    }

    private static boolean matches(Context context, StatusBarNotification status, SummaryStore.Job job) {
        Notification notification = status.getNotification();
        if (!context.getPackageName().equals(status.getPackageName()) || notification.extras == null
                || (notification.flags & (Notification.FLAG_GROUP_SUMMARY | Notification.FLAG_FOREGROUND_SERVICE)) != 0) return false;
        Bundle extras = notification.extras;
        if (extras.getBoolean(OWNED)) return extras.getLong(JOB_ID, -1) == job.id;
        return extras.getBoolean(NATIVE) && job.briefingId > 0 && extras.getLong(BRIEFING_ID, -1) == job.briefingId;
    }
    private static SummaryStore.Job byId(Context context, long id) { return job(context, "SELECT * FROM jobs WHERE id=?", id); }
    private static SummaryStore.Job byBriefing(Context context, long id) { return job(context, "SELECT * FROM jobs WHERE briefing_id=?", id); }
    private static SummaryStore.Job job(Context context, String query, long id) {
        if (id <= 0) return null;
        try (Cursor cursor = SummaryStore.get(context).getReadableDatabase().rawQuery(query, new String[] { Long.toString(id) })) {
            if (!cursor.moveToFirst()) return null;
            SummaryStore.Job result = new SummaryStore.Job(cursor);
            return cursor.moveToNext() ? null : result;
        }
    }
}
