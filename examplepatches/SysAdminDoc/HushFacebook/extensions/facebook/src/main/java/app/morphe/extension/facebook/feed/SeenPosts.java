/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;

import androidx.annotation.Nullable;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.function.LongSupplier;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.facebook.settings.SettingsStatus;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * Posts you've already scrolled past stay out of the feed on later loads.
 *
 * <p>Facebook's viewport logger decides a post was seen: when a post leaves the screen after being
 * on it long enough to count as a view (250 ms), its dwell runnable would call
 * {@code persistSeenState} with the feed unit, except on the News Feed itself, where Facebook skips
 * that call. The patch hands the same unit to {@link #seen} right after the dwell check, before the
 * News Feed skip, so the dwell is Facebook's own on every surface, and it fires as the post leaves,
 * which means the post on screen is never judged. {@link #seen} remembers the unit's cache id. The feed guard asks {@link #hideReason} for every unit it's about to add, and a
 * remembered one is dropped before Facebook adds it.
 *
 * <p>Only a short hash of each id is kept, in one file in the app's own storage with the time it was
 * seen. It never leaves the phone and isn't part of an exported settings file. At most {@link #CAP}
 * posts are kept, the oldest forgotten first, and a post is forgotten once it's older than the days
 * the setting names: on a lookup, and for every post when the file is read and each time it's
 * written, so nothing sits in it past its days. A time up to a day ahead of the clock, as after a
 * small correction, counts as now, so a post just seen stays hidden. A time more than a day ahead,
 * as after the clock was set far back, counts as past rather than keeping a post hidden longer.
 * Every write is off the main thread, and an empty list leaves no file.
 *
 * <p>Turning the switch off forgets the list: the settings screen empties it as the switch goes
 * off, and a hook that finds the switch off (after an import or a reset turned it off) empties it
 * once. Forget seen posts empties it whatever the switch says.
 *
 * <p>Off, paused, before the settings are ready, or when anything here fails, nothing is hidden and
 * nothing is remembered. A pause keeps the list as it was.
 */
public final class SeenPosts {
    /** How long a seen post stays hidden. */
    public enum Keep {
        ONE_DAY(1, "1_day"),
        THREE_DAYS(3, "3_days"),
        SEVEN_DAYS(7, "7_days"),
        THIRTY_DAYS(30, "30_days");

        public final int days;

        /** What a settings file holds for this choice. It never changes once written. */
        public final String fileValue;

        Keep(int days, String fileValue) {
            this.days = days;
            this.fileValue = fileValue;
        }

        /** The choice a settings file names, or null when it names none this build knows. */
        @Nullable
        public static Keep fromFile(@Nullable Object value) {
            if (!(value instanceof String)) return null;
            for (Keep keep : values()) {
                if (keep.fileValue.equals(value)) return keep;
            }
            return null;
        }
    }

    /** Most posts remembered. The oldest go first. */
    static final int CAP = 5000;

    /** Counted under the patch's name each time a seen post is kept out of the feed. */
    static final String HIDDEN = "Already seen posts hidden";
    /** Counted when a seen post is new to the store. */
    static final String REMEMBERED = "Seen posts remembered";
    /** Counted when a seen post's unit gave no id to remember it by. */
    static final String NO_ID = "Seen posts with no id";

    /** The reason the feed counts a hidden post under. */
    static final String REASON = "already seen";

    private static final String FAMILY = FamilyNames.SEEN_POSTS;
    private static final String FILE_NAME = "hushfacebook_seen_posts.txt";
    private static final long DAY_MS = 24L * 60 * 60 * 1000;
    /** How far ahead of the clock a time may be and still count as now. */
    static final long CLOCK_SLACK_MS = DAY_MS;
    private static final long WRITE_DELAY_MS = 5_000;

    /** Id to the time it was seen, oldest first. Guarded by itself. */
    private static final LinkedHashMap<String, Long> STORE = new LinkedHashMap<>();
    /** Held across a write, so two writes land in the order their lists were taken. */
    private static final Object WRITE = new Object();
    private static boolean loaded;
    private static boolean dirty;
    private static boolean writeScheduled;

    /**
     * Whether the list was emptied and nothing has been remembered since, so a hook that finds the
     * switch off doesn't empty it again for every post.
     */
    private static volatile boolean forgotten;

    @Nullable static Boolean inBuildForTests;
    @Nullable static File fileForTests;
    @Nullable static Runnable laterForTests;
    /** Runs a write at once instead of on a background thread, for tests. */
    @Nullable static Executor backgroundForTests;
    static LongSupplier clock = System::currentTimeMillis;

    /** The getCacheId() of a unit's class. One object, so a thread never pairs one class with another's reader. */
    private static final class CacheIdReader {
        final Class<?> owner;
        final Method reader;

        CacheIdReader(Class<?> owner, Method reader) {
            this.owner = owner;
            this.reader = reader;
        }
    }

    @Nullable private static volatile CacheIdReader cacheIdReader;

    private SeenPosts() {
    }

    private static boolean inBuild() {
        Boolean forTests = inBuildForTests;
        return forTests != null ? forTests : SettingsStatus.seenPosts();
    }

    /**
     * Injection point, in the viewport logger's dwell runnable right after its seen check: the feed
     * unit Facebook just decided you've seen. Remembers it while the switch is on. Never throws, and
     * changes nothing about what Facebook does.
     */
    public static void seen(Object unit) {
        try {
            HookStatus.invoked(FAMILY);
            if (unit == null || !Utils.settingsReady()) return;
            if (!Settings.HIDE_SEEN_POSTS.savedValue()) {
                forgetWhileOff();
                return;
            }
            if (!Settings.HIDE_SEEN_POSTS.get()) return;
            if (!isPost(unit)) return;
            String id = idOf(unit);
            if (id == null) {
                HookStatus.counted(FAMILY, NO_ID);
                return;
            }
            HookStatus.bound(FAMILY, "seen state");
            if (remember(id, clock.getAsLong())) HookStatus.counted(FAMILY, REMEMBERED);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "seen state", failure);
        }
    }

    /**
     * The feed guard's question about a unit it's about to add: {@link #REASON} when the post was
     * seen within the days the setting names and the switch is on, otherwise null. Never throws.
     */
    @Nullable
    static String hideReason(@Nullable Object unit) {
        try {
            if (unit == null || !inBuild()) return null;
            HookStatus.invoked(FAMILY);
            if (!Utils.settingsReady()) return null;
            if (!Settings.HIDE_SEEN_POSTS.savedValue()) {
                forgetWhileOff();
                return null;
            }
            if (!Settings.HIDE_SEEN_POSTS.get()) return null;
            if (!isPost(unit)) return null;
            String id = idOf(unit);
            if (id == null) return null;
            HookStatus.bound(FAMILY, "feed guard");
            long now = clock.getAsLong();
            if (!isRemembered(id, now, Settings.SEEN_POSTS_KEEP.get().days * DAY_MS)) return null;
            HookStatus.counted(FAMILY, HIDDEN);
            return REASON;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "feed guard", failure);
            return null;
        }
    }

    /** Whether the unit is a post. A unit that isn't a GraphQLStory has no seen state worth keeping. */
    private static boolean isPost(Object unit) {
        PostText.Members found = PostText.members();
        return found.story == null || found.story.isInstance(unit);
    }

    /** The unit's cache id through its public {@code getCacheId()}, hashed, or null when it has none. */
    @Nullable
    static String idOf(Object unit) {
        try {
            CacheIdReader known = cacheIdReader;
            if (known == null || known.owner != unit.getClass()) {
                Method reader = unit.getClass().getMethod("getCacheId");
                if (reader.getReturnType() != String.class) return null;
                known = new CacheIdReader(unit.getClass(), reader);
                cacheIdReader = known;
            }
            Object id = known.reader.invoke(unit);
            if (!(id instanceof String) || ((String) id).isEmpty()) return null;
            return hash((String) id);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return null;
        }
    }

    private static String hash(String id) {
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256").digest(id.getBytes(StandardCharsets.UTF_8));
            StringBuilder hex = new StringBuilder(16);
            for (int i = 0; i < 8; i++) hex.append(String.format("%02x", digest[i]));
            return hex.toString();
        } catch (java.security.NoSuchAlgorithmException impossible) {
            throw new IllegalStateException(impossible);
        }
    }

    /** Remembers [id] as seen at [now]. True when it's new to the store. */
    static boolean remember(String id, long now) {
        synchronized (STORE) {
            loadLocked();
            Long before = STORE.remove(id);
            STORE.put(id, now);
            trimLocked();
            dirty = true;
            forgotten = false;
            scheduleWriteLocked();
            return before == null;
        }
    }

    /** Whether [id] was seen less than [keepMs] before [now]. An older one is dropped, and so is one seen over a day after [now]. */
    static boolean isRemembered(String id, long now, long keepMs) {
        synchronized (STORE) {
            loadLocked();
            Long at = STORE.get(id);
            if (at == null) return false;
            if (expired(at, now, keepMs)) {
                STORE.remove(id);
                dirty = true;
                scheduleWriteLocked();
                return false;
            }
            return true;
        }
    }

    /**
     * Whether a post seen at [at] is past [keepMs] at [now]. A time up to {@link #CLOCK_SLACK_MS}
     * ahead of [now], left by a small clock correction, counts as now, so the post a moment ago
     * isn't brought back. One further ahead, left by a clock set far back, counts as past: it would
     * otherwise keep the post hidden until the clock caught up and then for the whole keep time again.
     */
    static boolean expired(long at, long now, long keepMs) {
        if (at > now + CLOCK_SLACK_MS) return true;
        return now - Math.min(at, now) >= keepMs;
    }

    /** Drops every post past the days the setting names. Marks the store for a write when it drops one. */
    private static void pruneLocked(long now) {
        long keepMs = savedKeepMs();
        for (Iterator<Long> times = STORE.values().iterator(); times.hasNext(); ) {
            if (expired(times.next(), now, keepMs)) {
                times.remove();
                dirty = true;
            }
        }
    }

    /**
     * The days the setting holds, as the store is pruned by on a read or a write. Before the
     * settings are ready it's the longest choice, so nothing goes early, and the settings aren't
     * loaded from a thread that got here first.
     */
    private static long savedKeepMs() {
        return (Utils.settingsReady() ? Settings.SEEN_POSTS_KEEP.savedValue() : Keep.THIRTY_DAYS).days * DAY_MS;
    }

    /** How many posts are remembered. */
    static int size() {
        synchronized (STORE) {
            loadLocked();
            return STORE.size();
        }
    }

    /**
     * Forget seen posts, and the switch going off: empties the store now and deletes its file on a
     * background thread. Safe to call on the main thread.
     */
    public static void clear() {
        synchronized (STORE) {
            loaded = true;
            STORE.clear();
            dirty = true;
            forgotten = true;
        }
        Executor forTests = backgroundForTests;
        if (forTests != null) forTests.execute(SeenPosts::writeNow);
        else Utils.runOnBackgroundThread(SeenPosts::writeNow);
    }

    /**
     * A hook found the switch off. A list left from when it was on, or from before an import or a
     * reset turned it off, is emptied, once until something is remembered again.
     */
    private static void forgetWhileOff() {
        if (forgotten) return;
        clear();
    }

    private static void trimLocked() {
        while (STORE.size() > CAP) {
            Iterator<String> oldest = STORE.keySet().iterator();
            oldest.next();
            oldest.remove();
        }
    }

    /**
     * Writes the store now, on this thread, which is never the main one: posts past their days are
     * dropped first, and an empty store deletes the file.
     */
    static void writeNow() {
        synchronized (WRITE) {
            List<String> lines = new ArrayList<>();
            synchronized (STORE) {
                writeScheduled = false;
                if (loaded) pruneLocked(clock.getAsLong());
                if (!dirty) return;
                dirty = false;
                for (Map.Entry<String, Long> entry : STORE.entrySet()) lines.add(entry.getValue() + " " + entry.getKey());
            }
            File file = file();
            if (file == null) return;
            File temporary = new File(file.getPath() + ".tmp");
            if (lines.isEmpty()) {
                // Nothing to keep, so nothing is left on the phone, a half-written copy included.
                //noinspection ResultOfMethodCallIgnored
                temporary.delete();
                if (file.exists() && !file.delete()) {
                    Logger.printDebug(() -> "Seen posts: could not delete the store");
                }
                return;
            }
            try (Writer out = new OutputStreamWriter(new FileOutputStream(temporary), StandardCharsets.UTF_8)) {
                for (String line : lines) out.write(line + "\n");
            } catch (IOException failure) {
                Logger.printDebug(() -> "Seen posts: could not write the store: " + failure.getClass().getSimpleName());
                return;
            }
            if (!temporary.renameTo(file)) {
                //noinspection ResultOfMethodCallIgnored
                file.delete();
                //noinspection ResultOfMethodCallIgnored
                temporary.renameTo(file);
            }
        }
    }

    private static void scheduleWriteLocked() {
        if (writeScheduled) return;
        writeScheduled = true;
        Runnable later = laterForTests;
        if (later != null) {
            later.run();
            return;
        }
        new Handler(Looper.getMainLooper()).postDelayed(
                () -> Utils.runOnBackgroundThread(SeenPosts::writeNow), WRITE_DELAY_MS);
    }

    private static void loadLocked() {
        if (loaded) return;
        loaded = true;
        File file = file();
        if (file == null || !file.isFile()) return;
        try (BufferedReader in = new BufferedReader(
                new InputStreamReader(new FileInputStream(file), StandardCharsets.UTF_8))) {
            String line;
            while ((line = in.readLine()) != null) {
                int space = line.indexOf(' ');
                if (space <= 0) continue;
                try {
                    STORE.put(line.substring(space + 1), Long.parseLong(line.substring(0, space)));
                } catch (NumberFormatException skip) {
                    // A damaged line is dropped; the rest still count.
                }
            }
            trimLocked();
        } catch (IOException failure) {
            Logger.printDebug(() -> "Seen posts: could not read the store: " + failure.getClass().getSimpleName());
        }
        // Posts that ran out while Facebook was closed go now, and the file follows.
        pruneLocked(clock.getAsLong());
        if (dirty) scheduleWriteLocked();
    }

    @Nullable
    private static File file() {
        File forTests = fileForTests;
        if (forTests != null) return forTests;
        Context context = Utils.getContext();
        return context == null ? null : new File(context.getFilesDir(), FILE_NAME);
    }

    /** Forgets what's in memory, so the next use reads the file again. For tests. */
    static void resetForTests() {
        synchronized (STORE) {
            STORE.clear();
            loaded = false;
            dirty = false;
            writeScheduled = false;
        }
        forgotten = false;
        inBuildForTests = null;
        fileForTests = null;
        laterForTests = null;
        backgroundForTests = null;
        clock = System::currentTimeMillis;
    }

    /** The diagnostic report's line about the store: how many posts, never which. */
    public static final LogBufferManager.ReportSection REPORT = new LogBufferManager.ReportSection() {
        @Override public String title() {
            return "SEEN POSTS";
        }

        @Override public List<String> lines() {
            List<String> lines = new ArrayList<>();
            if (!inBuild()) return lines;
            lines.add("Remembered: " + size() + " of " + CAP + ", kept for "
                    + (Utils.settingsReady() ? Settings.SEEN_POSTS_KEEP.get().days : Keep.SEVEN_DAYS.days) + " days");
            return lines;
        }
    };

    /** The toast after Forget seen posts. */
    public static String clearedMessage() {
        return L10n.t("Seen posts forgotten.");
    }
}
