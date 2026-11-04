package app.s.chzzk.extension;

import android.app.Activity;
import android.app.Application;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.WeakHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public final class LocalFollowing {
    public static final int START = 1;
    public static final int END = 2;
    public static final int TITLE = 4;
    public static final int CATEGORY = 8;
    public static final int JOB_ID = 0x5343464d;
    private static final int ALL_EVENTS = START | END | TITLE | CATEGORY;
    private static final String HOST = "api.chzzk.naver.com";
    private static final String NOTIFICATION_CHANNEL = "s_chzzk_following_events_v1";
    private static final String CHANNEL_EXTRA = "app.s.chzzk.following.channelId";
    private static final long ACTIVE_INTERVAL_MS = 60_000L;
    private static final long RUN_BUDGET_MS = 90_000L;
    private static final int MAX_CHANNELS_PER_RUN = 64;
    private static final int MAX_RESPONSE_BYTES = 512 * 1024;
    private static final Object LOCK = new Object();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor(task -> {
        Thread thread = new Thread(task, "s-chzzk-following");
        thread.setDaemon(true);
        return thread;
    });
    private static final LinkedHashMap<String, Entry> ENTRIES = new LinkedHashMap<>();
    private static final CopyOnWriteArrayList<Runnable> LISTENERS = new CopyOnWriteArrayList<>();
    private static final WeakHashMap<Activity, Boolean> RESUMED = new WeakHashMap<>();
    private static Context context;
    private static SharedPreferences preferences;
    private static boolean monitoringEnabled;
    private static boolean lifecycleRegistered;
    private static long lastRunElapsed;
    private static long blockedUntil;
    private static String scanAfter = "";
    private static Channel current;
    private static Run running;
    private static Object publicClient;
    private static final ThreadLocal<Run> REQUEST = new ThreadLocal<>();

    public interface Callback {
        void complete(Channel channel, String error);
    }

    public static final class Channel {
        public final String id;
        public final String name;
        public final String imageUrl;
        public final boolean following;
        public final int events;
        public final String status;
        public final String liveTitle;
        public final String category;
        public final String openDate;
        public final long liveId;
        public final long checkedAt;
        public final String error;

        private Channel(Entry entry) {
            id = entry.id;
            name = entry.name.isEmpty() ? entry.id : entry.name;
            imageUrl = entry.imageUrl;
            following = entry.following;
            events = entry.events;
            status = entry.error.isEmpty() ? entry.state.status : "UNKNOWN";
            liveTitle = entry.state.title;
            category = entry.state.category;
            openDate = entry.state.openDate;
            liveId = entry.state.liveId;
            checkedAt = entry.checkedAt;
            error = entry.error;
        }
    }

    private static final class State {
        boolean baseline;
        String status = "UNKNOWN";
        String session = "";
        String openDate = "";
        long liveId;
        String title = "";
        String categoryKey = "";
        String category = "";
        String started = "";
        String ended = "";

        State() {}

        State(JSONObject json) {
            baseline = json.optBoolean("baseline");
            status = json.optString("status", "UNKNOWN");
            session = json.optString("session");
            openDate = json.optString("openDate");
            liveId = json.optLong("liveId");
            title = json.optString("title");
            categoryKey = json.optString("categoryKey");
            category = json.optString("category");
            started = json.optString("started");
            ended = json.optString("ended");
        }

        JSONObject json() throws JSONException {
            return new JSONObject().put("baseline", baseline).put("status", status)
                .put("session", session).put("openDate", openDate).put("liveId", liveId)
                .put("title", title).put("categoryKey", categoryKey).put("category", category)
                .put("started", started).put("ended", ended);
        }
    }

    private static final class Entry {
        final String id;
        String name = "";
        String imageUrl = "";
        boolean following;
        boolean monitorTarget;
        int events;
        int revision;
        State state = new State();
        long checkedAt;
        int failures;
        long nextAttempt;
        String error = "";
        long observedAt;

        Entry(String id) { this.id = id; }

        Entry(JSONObject json) {
            id = json.optString("id");
            name = json.optString("name");
            imageUrl = json.optString("imageUrl");
            following = json.optBoolean("following");
            monitorTarget = json.optBoolean("monitorTarget");
            events = json.optInt("events") & ALL_EVENTS;
            if (!following) events &= ~START;
            JSONObject saved = json.optJSONObject("state");
            if (saved != null) state = new State(saved);
            checkedAt = json.optLong("checkedAt");
            failures = Math.max(0, Math.min(10, json.optInt("failures")));
            nextAttempt = json.optLong("nextAttempt");
            error = json.optString("error");
        }

        JSONObject json() throws JSONException {
            return new JSONObject().put("id", id).put("name", name).put("imageUrl", imageUrl)
                .put("following", following).put("monitorTarget", monitorTarget).put("events", events).put("state", state.json())
                .put("checkedAt", checkedAt).put("failures", failures)
                .put("nextAttempt", nextAttempt).put("error", error);
        }
    }

    private static final class Run {
        volatile boolean cancelled;
        boolean includeFollowing;
        volatile Object call;
        final Runnable timeout = this::cancel;
        final ArrayList<Completion> completions = new ArrayList<>();

        void cancel() {
            cancelled = true;
            Object active = call;
            if (active != null) cancelPublicCall(active);
        }
    }

    static final class Completion {
        Runnable action;
        Run run;
        boolean stopped;

        Completion(Runnable action) { this.action = action; }
    }

    private static final class Failure extends IOException {
        final int status;
        final long retryAfter;

        Failure(String message, int status, long retryAfter) {
            super(message);
            this.status = status;
            this.retryAfter = retryAfter;
        }
    }

    private LocalFollowing() {}

    public static void attach(Context host) {
        synchronized (LOCK) {
            if (context == null) {
                context = host.getApplicationContext();
                preferences = context.getSharedPreferences("s_chzzk_following", Context.MODE_PRIVATE);
                loadLocked();
            }
        }
        MAIN.post(() -> {
            if (!lifecycleRegistered && context instanceof Application) {
                lifecycleRegistered = true;
                ((Application) context).registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                    @Override public void onActivityResumed(Activity activity) {
                        RESUMED.put(activity, Boolean.TRUE);
                        scheduleActive();
                    }
                    @Override public void onActivityPaused(Activity activity) {
                        RESUMED.remove(activity);
                        if (RESUMED.isEmpty()) MAIN.removeCallbacks(ACTIVE);
                    }
                    @Override public void onActivityDestroyed(Activity activity) {
                        RESUMED.remove(activity);
                        if (RESUMED.isEmpty()) MAIN.removeCallbacks(ACTIVE);
                    }
                    @Override public void onActivityCreated(Activity activity, Bundle saved) {}
                    @Override public void onActivityStarted(Activity activity) {}
                    @Override public void onActivityStopped(Activity activity) {}
                    @Override public void onActivitySaveInstanceState(Activity activity, Bundle saved) {}
                });
            }
            if (host instanceof Activity) {
                RESUMED.put((Activity) host, Boolean.TRUE);
                scheduleActive();
            }
        });
        scheduleJob();
    }

    private static final Runnable ACTIVE = new Runnable() {
        @Override public void run() {
            if (RESUMED.isEmpty() || !hasMonitoring()) return;
            begin(null, false, false);
            MAIN.postDelayed(this, ACTIVE_INTERVAL_MS);
        }
    };

    private static void scheduleActive() {
        MAIN.removeCallbacks(ACTIVE);
        if (!RESUMED.isEmpty() && hasMonitoring()) MAIN.post(ACTIVE);
    }

    public static void capture(Object detail, Object status) {}

    public static void captureDetail(Object detail) { capture(detail, null); }

    public static void updateCurrent(String id, String name, String imageUrl) {
        String channelId = parseChannelId(id);
        if (channelId == null) return;
        boolean changed = false;
        synchronized (LOCK) {
            Entry entry = ENTRIES.get(channelId);
            if (entry == null) entry = new Entry(channelId);
            String nextName = text(name);
            String nextImage = text(imageUrl);
            if (!nextName.isEmpty() && !nextName.equals(entry.name)) {
                entry.name = nextName;
                changed = ENTRIES.containsKey(channelId);
            }
            if (!nextImage.isEmpty() && !nextImage.equals(entry.imageUrl)) {
                entry.imageUrl = nextImage;
                changed |= ENTRIES.containsKey(channelId);
            }
            Channel next = new Channel(entry);
            boolean currentChanged = current == null || !current.id.equals(next.id)
                || !current.name.equals(next.name) || !current.imageUrl.equals(next.imageUrl);
            current = next;
            if (changed) saveLocked();
            changed |= currentChanged;
        }
        if (changed) changed();
    }

    public static Channel current() {
        synchronized (LOCK) {
            if (current == null) return null;
            Entry entry = ENTRIES.get(current.id);
            if (entry != null) return new Channel(entry);
            Entry metadata = new Entry(current.id);
            metadata.name = current.name;
            metadata.imageUrl = current.imageUrl;
            return new Channel(metadata);
        }
    }

    public static Channel get(String id) {
        synchronized (LOCK) {
            Entry entry = ENTRIES.get(parseChannelId(id));
            return entry == null ? null : new Channel(entry);
        }
    }

    public static List<Channel> list() {
        synchronized (LOCK) {
            ArrayList<Channel> channels = new ArrayList<>();
            for (Entry entry : ENTRIES.values()) channels.add(new Channel(entry));
            return channels;
        }
    }

    public static List<Channel> following() {
        ArrayList<Channel> channels = new ArrayList<>();
        for (Channel channel : list()) if (channel.following) channels.add(channel);
        return channels;
    }

    public static boolean isFollowing(String id) {
        Channel channel = get(id);
        return channel != null && channel.following;
    }

    public static Channel setFollowing(String id, String name, String imageUrl, boolean following) {
        Channel result;
        synchronized (LOCK) {
            Entry entry = entryLocked(id, name, imageUrl);
            entry.following = following;
            if (!following) entry.events &= ~START;
            entry.revision++;
            result = new Channel(entry);
            if (!entry.following && !entry.monitorTarget && entry.events == 0) ENTRIES.remove(entry.id);
            saveLocked();
        }
        changed();
        scheduleJob();
        return result;
    }

    public static Channel setEvents(String id, String name, String imageUrl, int events) {
        Channel result;
        synchronized (LOCK) {
            Entry entry = entryLocked(id, name, imageUrl);
            entry.monitorTarget = true;
            int flags = events & ALL_EVENTS;
            if (!entry.following) flags &= ~START;
            if (entry.events != flags) {
                entry.events = flags;
                entry.revision++;
                entry.state.baseline = false;
                entry.failures = 0;
                entry.nextAttempt = 0;
                entry.error = "";
            }
            result = new Channel(entry);
            if (!entry.following && !entry.monitorTarget && entry.events == 0) ENTRIES.remove(entry.id);
            saveLocked();
        }
        changed();
        scheduleJob();
        MAIN.post(LocalFollowing::scheduleActive);
        return result;
    }

    public static void remove(String id) {
        synchronized (LOCK) {
            ENTRIES.remove(parseChannelId(id));
            saveLocked();
        }
        changed();
        scheduleJob();
    }

    public static boolean isMonitoringEnabled() {
        synchronized (LOCK) { return monitoringEnabled; }
    }

    public static void setMonitoringEnabled(boolean enabled) {
        synchronized (LOCK) {
            if (monitoringEnabled != enabled) {
                monitoringEnabled = enabled;
                lastRunElapsed = 0;
                for (Entry entry : ENTRIES.values()) {
                    entry.state.baseline = false;
                    entry.revision++;
                    entry.nextAttempt = 0;
                    entry.failures = 0;
                }
                if (running != null) running.cancel();
                saveLocked();
            }
        }
        scheduleJob();
        MAIN.post(LocalFollowing::scheduleActive);
        changed();
    }

    public static void addListener(Runnable listener) {
        if (listener != null) LISTENERS.addIfAbsent(listener);
    }

    public static void removeListener(Runnable listener) { LISTENERS.remove(listener); }

    private static void changed() {
        MAIN.post(() -> {
            for (Runnable listener : LISTENERS) {
                try { listener.run(); } catch (RuntimeException ignored) {}
            }
        });
    }

    public static String parseChannelId(String input) {
        if (input == null) return null;
        String value = input.trim();
        if (value.matches("(?i)[0-9a-f]{32}")) return value.toLowerCase(Locale.ROOT);
        try {
            Uri uri = Uri.parse(value.contains("://") ? value : "https://" + value);
            String host = uri.getHost();
            if (!"chzzk.naver.com".equalsIgnoreCase(host) && !"m.chzzk.naver.com".equalsIgnoreCase(host)) return null;
            List<String> parts = uri.getPathSegments();
            if (parts.size() == 1) value = parts.get(0);
            else if (parts.size() == 2 && "live".equals(parts.get(0))) value = parts.get(1);
            else return null;
            return value.matches("(?i)[0-9a-f]{32}") ? value.toLowerCase(Locale.ROOT) : null;
        } catch (RuntimeException ignored) { return null; }
    }

    public static String channelUrl(String id) {
        String channelId = parseChannelId(id);
        return channelId == null ? "" : "https://chzzk.naver.com/live/" + channelId;
    }

    public static Intent channelIntent(Context host, String id) {
        String channelId = parseChannelId(id);
        if (host == null || channelId == null) throw new IllegalArgumentException("Invalid channel");
        return nativeChannelIntent(host, channelId)
            .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
    }

    public static Intent nativeChannelIntent(Context host, String id) {
        return new Intent(Intent.ACTION_VIEW, Uri.parse(channelUrl(id))).setPackage(host.getPackageName());
    }

    public static boolean receiveChannelIntent(Activity host, Intent intent) {
        if (host == null || host.isFinishing() || host.isDestroyed() || intent == null) return false;
        String id = parseChannelId(intent.getStringExtra(CHANNEL_EXTRA));
        if (id == null) return false;
        intent.removeExtra(CHANNEL_EXTRA);
        nativeOpenChannel(host, id);
        return true;
    }

    public static void nativeOpenChannel(Activity host, String id) {}

    public static void add(String input, Callback callback) {
        String id = parseChannelId(input);
        if (id == null) {
            complete(callback, null, "채널 ID 또는 치지직 채널 주소를 확인해 주세요.");
            return;
        }
        WORKER.execute(() -> {
            Run request = new Run();
            MAIN.postDelayed(request.timeout, 20_000L);
            try {
                JSONObject data = get(request, "/service/v1/channels/" + id);
                if (!id.equals(data.optString("channelId"))) throw new IOException();
                Channel channel = setFollowing(id, data.optString("channelName"), data.optString("channelImageUrl"), true);
                complete(callback, channel, null);
            } catch (Exception error) {
                complete(callback, null, message(error));
            } finally {
                MAIN.removeCallbacks(request.timeout);
            }
        });
    }

    private static void complete(Callback callback, Channel channel, String error) {
        if (callback != null) MAIN.post(() -> callback.complete(channel, error));
    }

    public static void refresh(Runnable completed) { begin(completed, false, true); }

    static Completion startJob(Runnable completed) { return begin(completed, true, false); }

    static void stopJob(Completion completion) {
        if (completion == null) return;
        synchronized (LOCK) {
            completion.stopped = true;
            completion.action = null;
            if (completion.run != null) completion.run.cancel();
        }
    }

    private static Completion begin(Runnable completed, boolean job, boolean includeFollowing) {
        Completion completion = new Completion(completed);
        synchronized (LOCK) {
            if (!(includeFollowing ? hasRefreshTargetsLocked() : hasMonitoringLocked()) || System.currentTimeMillis() < blockedUntil) {
                postCompletion(completion);
                return completion;
            }
            if (running != null && !running.cancelled && (!includeFollowing || running.includeFollowing)) {
                running.completions.add(completion);
                completion.run = running;
                return completion;
            }
            long now = SystemClock.elapsedRealtime();
            if (!job && !includeFollowing && lastRunElapsed != 0 && now - lastRunElapsed < ACTIVE_INTERVAL_MS) {
                postCompletion(completion);
                return completion;
            }
            if (running != null) running.cancel();
            Run run = new Run();
            run.includeFollowing = includeFollowing;
            run.completions.add(completion);
            completion.run = run;
            running = run;
            lastRunElapsed = now;
            MAIN.postDelayed(run.timeout, RUN_BUDGET_MS);
            WORKER.execute(() -> scan(run));
        }
        return completion;
    }

    private static void scan(Run run) {
        long deadline = SystemClock.elapsedRealtime() + RUN_BUDGET_MS;
        try {
            ArrayList<String> ids = new ArrayList<>();
            String after;
            synchronized (LOCK) {
                for (Entry entry : ENTRIES.values()) {
                    if ((monitoringEnabled && entry.events != 0) || (run.includeFollowing && (entry.following || entry.events != 0))) ids.add(entry.id);
                }
                after = scanAfter;
            }
            Collections.sort(ids);
            int start = 0;
            while (start < ids.size() && ids.get(start).compareTo(after) <= 0) start++;
            int requests = 0;
            for (int visited = 0; visited < ids.size() && requests < MAX_CHANNELS_PER_RUN; visited++) {
                if (run.cancelled || SystemClock.elapsedRealtime() >= deadline) break;
                String id = ids.get((start + visited) % ids.size());
                int revision;
                synchronized (LOCK) {
                    if (!(run.includeFollowing ? hasRefreshTargetsLocked() : hasMonitoringLocked()) || System.currentTimeMillis() < blockedUntil) break;
                    Entry entry = ENTRIES.get(id);
                    if (!validLocked(entry, entry == null ? -1 : entry.revision, run) || entry.nextAttempt > System.currentTimeMillis()) continue;
                    revision = entry.revision;
                    scanAfter = id;
                }
                requests++;
                try {
                    poll(run, id, revision);
                } catch (Exception error) {
                    if (!run.cancelled) failed(id, revision, error, run);
                }
            }
        } finally {
            MAIN.removeCallbacks(run.timeout);
            ArrayList<Completion> completions;
            synchronized (LOCK) {
                if (running == run) running = null;
                saveLocked();
                completions = new ArrayList<>(run.completions);
                run.completions.clear();
            }
            for (Completion completion : completions) postCompletion(completion);
        }
    }

    private static void postCompletion(Completion completion) {
        MAIN.post(() -> {
            Runnable action;
            synchronized (LOCK) {
                action = completion.stopped ? null : completion.action;
                completion.action = null;
                completion.run = null;
            }
            if (action != null) action.run();
        });
    }

    private static void poll(Run run, String id, int revision) throws IOException, JSONException {
        JSONObject data = get(run, "/polling/v3.1/channels/" + id + "/live-status?includePlayerRecommendContent=false");
        String status = data.optString("status");
        if ((!"OPEN".equals(status) && !"CLOSE".equals(status)) || data.optBoolean("liveConnecting")) {
            throw new Failure("방송 상태를 아직 확인할 수 없습니다.", 0, 0);
        }
        String openDate = text(data.optString("openDate", ""));
        long liveId = 0;
        boolean detail;
        synchronized (LOCK) {
            Entry entry = ENTRIES.get(id);
            if (!validLocked(entry, revision, run)) return;
            detail = "OPEN".equals(status) && (!entry.state.baseline
                || !"OPEN".equals(entry.state.status) || openDate.isEmpty()
                || !openDate.equals(entry.state.openDate));
            if (!detail) liveId = entry.state.liveId;
        }
        String name = "";
        String image = "";
        if (detail) {
            JSONObject live = get(run, "/service/v3.3/channels/" + id + "/live-detail?cu=false&tm=false");
            if (!"OPEN".equals(live.optString("status")) || live.optBoolean("liveConnecting")) {
                throw new Failure("방송 상태를 다시 확인하고 있습니다.", 0, 0);
            }
            liveId = live.optLong("liveId");
            String liveOpen = text(live.optString("openDate", ""));
            if (!openDate.isEmpty() && !liveOpen.isEmpty() && !openDate.equals(liveOpen)) {
                throw new Failure("방송 상태를 다시 확인하고 있습니다.", 0, 0);
            }
            if (!liveOpen.isEmpty()) openDate = liveOpen;
            JSONObject channel = live.optJSONObject("channel");
            if (channel != null) {
                if (!id.equals(channel.optString("channelId"))) throw new IOException();
                name = text(channel.optString("channelName"));
                image = text(channel.optString("channelImageUrl"));
            }
        }
        applyObservation(run, id, revision, status, openDate, liveId,
            text(data.optString("liveTitle", "")), text(data.optString("liveCategoryValue", "")),
            name, image, SystemClock.elapsedRealtime());
    }

    public static void observe(String id, String title, String category, String status, String openDate, boolean connecting) {
        String channelId = parseChannelId(id);
        if (channelId == null || connecting || (!"OPEN".equals(status) && !"CLOSE".equals(status))) return;
        long observedAt = SystemClock.elapsedRealtime();
        int revision;
        synchronized (LOCK) {
            Entry entry = ENTRIES.get(channelId);
            if (entry == null || entry.events == 0 || !monitoringEnabled) return;
            revision = entry.revision;
        }
        WORKER.execute(() -> applyObservation(new Run(), channelId, revision, status, text(openDate), 0,
            text(title), text(category), "", "", observedAt));
    }

    private static void applyObservation(Run run, String id, int revision, String status,
        String openDate, long liveId, String title, String category, String name, String image, long observedAt) {
        String session = !openDate.isEmpty() ? "date:" + openDate : liveId > 0 ? "id:" + liveId : "";
        if ("OPEN".equals(status) && session.isEmpty()) return;
        int notices = 0;
        Channel snapshot;
        synchronized (LOCK) {
            Entry entry = ENTRIES.get(id);
            if (!validLocked(entry, revision, run)) return;
            if (observedAt < entry.observedAt) return;
            entry.observedAt = observedAt;
            notices = transition(entry.state, status, session, openDate, liveId, title, category,
                monitoringEnabled && entry.events != 0);
            if (!name.isEmpty()) entry.name = name;
            if (!image.isEmpty()) entry.imageUrl = image;
            entry.checkedAt = System.currentTimeMillis();
            entry.failures = 0;
            entry.nextAttempt = 0;
            entry.error = "";
            notices &= entry.events;
            if (!entry.following) notices &= ~START;
            if (!saveLocked(notices != 0)) {
                notices = 0;
                entry.error = "알림 상태를 저장하지 못했습니다.";
            }
            snapshot = new Channel(entry);
        }
        changed();
        if (notices != 0 && !run.cancelled) {
            try { notify(snapshot, notices, revision); } catch (RuntimeException ignored) {}
        }
    }

    private static int transition(State state, String status, String session, String openDate,
        long liveId, String title, String category, boolean notificationsEnabled) {
        if (!"OPEN".equals(status) && !"CLOSE".equals(status)) return 0;
        if ("OPEN".equals(status) && session.isEmpty()) return 0;
        int notices = 0;
        String categoryKey = category;
        boolean open = "OPEN".equals(status);
        boolean same = open && (state.session.equals(session)
            || (liveId > 0 && state.liveId == liveId));
        if (state.baseline && notificationsEnabled) {
            if (open && !same && !session.equals(state.started)) {
                notices |= START;
            } else if (!open && "OPEN".equals(state.status) && !state.session.equals(state.ended)) {
                notices |= END;
            } else if (open && same && "OPEN".equals(state.status)) {
                if (!title.isEmpty() && !state.title.isEmpty() && !title.equals(state.title)) notices |= TITLE;
                if (!categoryKey.isEmpty() && !state.categoryKey.isEmpty() && !categoryKey.equals(state.categoryKey)) notices |= CATEGORY;
            }
        }
        if (open) {
            state.session = session;
            state.openDate = openDate;
            state.liveId = liveId > 0 ? liveId : same ? state.liveId : 0;
            state.started = session;
            if (!title.isEmpty()) state.title = title;
            if (!categoryKey.isEmpty()) state.categoryKey = categoryKey;
            if (!category.isEmpty()) state.category = category;
        } else if ("OPEN".equals(state.status)) {
            state.ended = state.session;
        }
        state.baseline = notificationsEnabled;
        state.status = status;
        return notices;
    }

    private static boolean validLocked(Entry entry, int revision, Run run) {
        return entry != null && entry.revision == revision && !run.cancelled
            && ((monitoringEnabled && entry.events != 0) || (run.includeFollowing && (entry.following || entry.events != 0)));
    }

    private static void failed(String id, int revision, Exception error, Run run) {
        synchronized (LOCK) {
            Entry entry = ENTRIES.get(id);
            if (!validLocked(entry, revision, run)) return;
            entry.failures = Math.min(10, entry.failures + 1);
            long delay = Math.min(6 * 60 * 60_000L, 60_000L << Math.min(9, entry.failures - 1));
            if (error instanceof Failure) {
                Failure failure = (Failure) error;
                delay = Math.max(delay, failure.retryAfter);
                if (failure.status >= 400 && failure.status < 500) delay = Math.max(delay, 15 * 60_000L);
                if (failure.status == 429) blockedUntil = System.currentTimeMillis() + delay;
            }
            entry.nextAttempt = System.currentTimeMillis() + delay;
            entry.error = message(error);
            saveLocked();
        }
        changed();
    }

    private static String message(Exception error) {
        if (error instanceof Failure) return error.getMessage();
        return "공개 방송 정보를 가져오지 못했습니다. 잠시 후 다시 확인합니다.";
    }

    private static void notify(Channel channel, int events, int revision) {
        synchronized (LOCK) {
            Entry entry = ENTRIES.get(channel.id);
            if (entry == null || !monitoringEnabled || entry.revision != revision) return;
            events &= entry.events;
            if (!entry.following) events &= ~START;
            if (events == 0) return;
        }
        if (Build.VERSION.SDK_INT >= 33 && context.checkSelfPermission("android.permission.POST_NOTIFICATIONS") != PackageManager.PERMISSION_GRANTED) return;
        NotificationManager manager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
        if (manager == null || !manager.areNotificationsEnabled()) return;
        NotificationChannel notificationChannel = new NotificationChannel(NOTIFICATION_CHANNEL, "팔로잉 추가 알림", NotificationManager.IMPORTANCE_DEFAULT);
        notificationChannel.setDescription("기기에서 확인한 방송 시작·종료·제목·카테고리 변경");
        manager.createNotificationChannel(notificationChannel);
        ArrayList<String> kinds = new ArrayList<>();
        if ((events & START) != 0) kinds.add("방송 시작");
        if ((events & END) != 0) kinds.add("방송 종료");
        if ((events & TITLE) != 0) kinds.add("제목 변경");
        if ((events & CATEGORY) != 0) kinds.add("카테고리 변경");
        String kind = android.text.TextUtils.join(" · ", kinds);
        String body = channel.liveTitle;
        if ((events & CATEGORY) != 0 && !channel.category.isEmpty()) body = body.isEmpty() ? channel.category : body + "\n" + channel.category;
        if (body.isEmpty()) body = kind;
        Intent intent = channelIntent(context, channel.id);
        PendingIntent pending = PendingIntent.getActivity(context, channel.id.hashCode(), intent, PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        Notification notification = new Notification.Builder(context, NOTIFICATION_CHANNEL)
            .setSmallIcon(context.getApplicationInfo().icon != 0 ? context.getApplicationInfo().icon : android.R.drawable.ic_popup_reminder)
            .setContentTitle(channel.name + " · " + kind).setContentText(body)
            .setStyle(new Notification.BigTextStyle().bigText(body)).setContentIntent(pending)
            .setAutoCancel(true).setCategory(Notification.CATEGORY_SOCIAL).setGroup("s_chzzk_following")
            .setWhen(System.currentTimeMillis()).build();
        manager.notify((channel.id + ":" + events).hashCode(), notification);
    }

    private static Entry entryLocked(String id, String name, String imageUrl) {
        String channelId = parseChannelId(id);
        if (channelId == null) throw new IllegalArgumentException("Invalid channel ID");
        Entry entry = ENTRIES.get(channelId);
        if (entry == null) {
            entry = new Entry(channelId);
            ENTRIES.put(channelId, entry);
        }
        if (name != null && !name.isEmpty()) entry.name = name;
        if (imageUrl != null && !imageUrl.isEmpty()) entry.imageUrl = imageUrl;
        return entry;
    }

    private static String text(String value) { return value == null || "null".equals(value) ? "" : value; }

    private static boolean hasRefreshTargetsLocked() {
        if (context == null) return false;
        for (Entry entry : ENTRIES.values()) if (entry.following || entry.events != 0) return true;
        return false;
    }

    private static boolean hasMonitoring() {
        synchronized (LOCK) { return hasMonitoringLocked(); }
    }

    private static boolean hasMonitoringLocked() {
        if (context == null || !monitoringEnabled) return false;
        for (Entry entry : ENTRIES.values()) if (entry.events != 0) return true;
        return false;
    }

    private static void scheduleJob() {
        synchronized (LOCK) {
            if (context == null) return;
            JobScheduler scheduler = (JobScheduler) context.getSystemService(Context.JOB_SCHEDULER_SERVICE);
            if (scheduler == null) return;
            if (!hasMonitoringLocked()) {
                scheduler.cancel(JOB_ID);
                if (running != null) running.cancel();
                return;
            }
            if (scheduler.getPendingJob(JOB_ID) == null) {
                scheduler.schedule(new JobInfo.Builder(JOB_ID, new ComponentName(context, FollowMonitorJobService.class))
                    .setRequiredNetworkType(JobInfo.NETWORK_TYPE_ANY).setPeriodic(15 * 60_000L)
                    .setPersisted(true).build());
            }
        }
    }

    private static void loadLocked() {
        try {
            JSONObject saved = new JSONObject(preferences.getString("state", "{}"));
            monitoringEnabled = saved.optBoolean("enabled", false);
            blockedUntil = saved.optLong("blockedUntil");
            scanAfter = saved.optString("scanAfter");
            JSONArray rows = saved.optJSONArray("channels");
            if (rows != null) for (int i = 0; i < rows.length(); i++) {
                JSONObject row = rows.optJSONObject(i);
                if (row == null) continue;
                Entry entry = new Entry(row);
                if (parseChannelId(entry.id) != null && (entry.following || entry.monitorTarget || entry.events != 0)) ENTRIES.put(entry.id, entry);
            }
        } catch (JSONException ignored) {}
    }

    private static void saveLocked() { saveLocked(false); }

    private static boolean saveLocked(boolean durable) {
        if (preferences == null) return false;
        try {
            JSONArray rows = new JSONArray();
            for (Entry entry : ENTRIES.values()) rows.put(entry.json());
            JSONObject saved = new JSONObject().put("enabled", monitoringEnabled).put("channels", rows)
                .put("blockedUntil", blockedUntil).put("scanAfter", scanAfter);
            SharedPreferences.Editor editor = preferences.edit().putString("state", saved.toString());
            if (durable) return editor.commit();
            editor.apply();
            return true;
        } catch (JSONException ignored) { return false; }
    }

    // Replaced with version-checked bridges to an independent native OkHttp client.
    public static Object createPublicClient() { return null; }
    public static Object createPublicCall(Object client, String url) { return null; }
    public static Object executePublicCall(Object call) throws IOException { throw new IOException(); }
    public static void cancelPublicCall(Object call) {}
    public static int publicResponseCode(Object response) { return 0; }
    public static String publicResponseHeader(Object response, String name) { return null; }
    public static InputStream publicResponseStream(Object response) { return null; }

    public static Object publicGet(String url) throws IOException {
        if (!url.startsWith("https://" + HOST + "/")) throw new IOException();
        if (publicClient == null) publicClient = createPublicClient();
        Object call = createPublicCall(publicClient, url);
        Run run = REQUEST.get();
        if (run != null) {
            run.call = call;
            if (run.cancelled) {
                cancelPublicCall(call);
                throw new IOException();
            }
        }
        return executePublicCall(call);
    }

    private static JSONObject get(Run run, String path) throws IOException, JSONException {
        if (run.cancelled) throw new IOException();
        Object response = null;
        REQUEST.set(run);
        try {
            response = publicGet("https://" + HOST + path);
            int status = publicResponseCode(response);
            if (status != 200) {
                long retry = 0;
                try { retry = Math.min(6 * 60 * 60_000L, Long.parseLong(publicResponseHeader(response, "Retry-After")) * 1_000L); } catch (RuntimeException ignored) {}
                throw new Failure("공개 방송 조회에 실패했습니다. (HTTP " + status + ")", status, Math.max(0, retry));
            }
            ByteArrayOutputStream body = new ByteArrayOutputStream();
            try (InputStream input = publicResponseStream(response)) { copy(input, body); }
            if (run.cancelled) throw new IOException();
            JSONObject result = new JSONObject(new String(body.toByteArray(), StandardCharsets.UTF_8));
            int code = result.optInt("code", 0);
            JSONObject content = result.optJSONObject("content");
            if (code != 200 || content == null) throw new Failure("공개 방송 정보를 확인할 수 없습니다. (" + code + ")", code, 0);
            return content;
        } finally {
            if (response instanceof Closeable) {
                try { ((Closeable) response).close(); } catch (IOException ignored) {}
            }
            run.call = null;
            REQUEST.remove();
        }
    }

    private static void copy(InputStream input, ByteArrayOutputStream body) throws IOException {
        if (input == null) throw new IOException();
        byte[] buffer = new byte[8_192];
        int length;
        while ((length = input.read(buffer)) != -1) {
            if (length > MAX_RESPONSE_BYTES - body.size()) throw new IOException();
            body.write(buffer, 0, length);
        }
    }
}
