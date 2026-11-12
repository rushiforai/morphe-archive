// Based on SysAdminDoc/HushMessenger (GPL-3.0), extensions/messenger/src/main/java/app/hushmessenger/extension/Settings.java:
// the enabled() rule (installed && !paused && !safe mode && choice) and the privacy-safe hook-failure record
// (exception class and first own frame, never the message); modified 2026-10-14: rewritten for minSdk 23 as an
// immutable snapshot behind a volatile field, a patch-time registry with per-feature defaults and dependencies,
// commit() writes and fail-open semantics.

package app.template.extension.hevalcontrols;

import android.content.Context;
import android.util.Log;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * The Heval Controls settings engine. Patched hooks call {@link #isEnabled(String)}:
 * <pre>
 * const-string vX, "app.feature"
 * invoke-static/range {vX .. vX}, Lapp/template/extension/hevalcontrols/HevalSettings;->isEnabled(Ljava/lang/String;)Z
 * move-result vX
 * if-eqz vX, :stock
 * </pre>
 * Rules, in order:
 * <ol>
 * <li>Before the engine is initialised (no context yet): the feature's registered default.</li>
 * <li>Engine failure, global pause or safe mode: false (stock behaviour) for every feature.</li>
 * <li>Unknown id, unsupported registry, or a dependency that is off or missing: false.</li>
 * <li>Otherwise the user's choice, or the registered default when there is none.</li>
 * </ol>
 * Any exception answers false. "Fail-open" here means the app keeps working and falls back to
 * stock behaviour; it never means a modification is forced on.
 *
 * <p>List features ({@link Feature#isList()}) hold a set of picked keys instead of a switch. App
 * hooks read them with {@link #getHidden(String)} / {@link #isHidden(String, String)}, which follow
 * the same rules: before the engine starts, on engine failure, pause, safe mode, an unknown id or a
 * dependency that is off, the set is empty (stock). {@code isEnabled(listId)} answers whether the
 * effective set is non-empty. The picker lists the options that app extensions supply through
 * {@link #registerOptions(String, Map)} (static seeds, this process only) and
 * {@link #reportOptionsSeen(String, String, String)} (persisted, at most {@value #MAX_OPTIONS} per
 * list), each optionally with an icon from {@link #setOptionIconProvider} (in memory, never saved).
 */
@SuppressWarnings("unused")
public final class HevalSettings {
    private static final String TAG = "HevalControls";

    /** Preference key prefix of a feature choice: {@code f.<featureId>}. */
    public static final String FEATURE_PREFIX = "f.";
    /** Preference key prefix of a list feature's picked keys (a string set): {@code l.<featureId>}. */
    public static final String LIST_PREFIX = "l.";
    /**
     * Preference key prefix of a list feature's seen options (a string set of
     * {@code key TAB label} entries): {@code o.<featureId>}.
     */
    public static final String OPTIONS_PREFIX = "o.";
    /** At most this many persisted options per list; later new keys are dropped. */
    public static final int MAX_OPTIONS = 500;
    /** At most this many picked keys per list. */
    public static final int MAX_HIDDEN = 500;
    /** Longest accepted key; longer keys are ignored. */
    public static final int MAX_KEY_LENGTH = 100;
    /** Longer labels are cut to this length. */
    static final int MAX_LABEL_LENGTH = 120;
    /** Seen options are written in batches, this long after the first new one. */
    private static final long OPTIONS_FLUSH_DELAY_MS = 1500;
    static final String KEY_PAUSED = "_paused";
    static final String KEY_SAFE_MODE = "_safe_mode";
    static final String KEY_THEME = "_theme";

    public static final String THEME_SYSTEM = "system";
    public static final String THEME_LIGHT = "light";
    public static final String THEME_DARK = "dark";
    public static final String THEME_AMOLED = "amoled";

    /** What the settings screen shows for a feature. */
    public enum State { ENABLED, DISABLED, RESTART_REQUIRED, UNSUPPORTED, FAILED, BUILD_TIME_ONLY }

    private static final Object LOCK = new Object();
    /** Null until the engine is initialised. Immutable once published. */
    private static volatile Snapshot snapshot;
    /** The first snapshot of this process: what start-only hooks read. */
    private static volatile Snapshot baseline;
    /** Strong reference: it is also the SharedPreferences change listener (see PrefsStore). */
    private static volatile Store store;
    private static volatile String initSource = "none";
    private static volatile String engineError;
    private static final Map<String, String> failures = new ConcurrentHashMap<>();
    /** Static options per list, from {@link #registerOptions}. Each value is immutable. */
    private static final Map<String, Map<String, String>> seeds = new ConcurrentHashMap<>();
    /** Option icons per list, from {@link #setOptionIconProvider}. In memory only. */
    private static final Map<String, OptionIconProvider> iconProviders = new ConcurrentHashMap<>();
    /** The longest icon {@link #optionIcon} passes on (a tag-sequence flag is 14 chars). */
    public static final int MAX_ICON_LENGTH = 32;
    /** The longest image URL {@link #optionImageUrl} passes on. */
    public static final int MAX_IMAGE_URL_LENGTH = 512;
    private static final String HTTPS = "https://";
    /** Seen options not yet persisted, per list. */
    private static final Map<String, ConcurrentHashMap<String, String>> pendingOptions = new ConcurrentHashMap<>();
    private static final AtomicBoolean flushScheduled = new AtomicBoolean();
    /** Tests: flush seen options on the calling thread. */
    static volatile boolean synchronousOptionsFlush;

    // ---------------------------------------------------------------------------------------
    // Hot path
    // ---------------------------------------------------------------------------------------

    /**
     * Whether the patched behaviour of {@code featureId} should run. No file IO, no allocation
     * once the engine is ready: one volatile read and one HashMap lookup.
     */
    public static boolean isEnabled(String featureId) {
        try {
            Snapshot current = snapshot;
            if (current == null) {
                current = initLazily();
                if (current == null) return Registry.get().defaultFor(featureId);
            }
            Boolean on = current.effective.get(featureId);
            return on != null && on;
        } catch (Throwable failure) {
            return false;
        }
    }

    /**
     * The keys the user picked in list feature {@code listId} that should be hidden right now.
     * Empty (stock) before the engine starts, on engine failure, pause, safe mode, for an unknown
     * id, a switch id or a dependency that is off. The set is immutable and shared: no file IO and
     * no allocation once the engine is ready. A change replaces it, so keep no long-lived copy.
     */
    public static Set<String> getHidden(String listId) {
        try {
            Snapshot current = snapshot;
            if (current == null) {
                current = initLazily();
                if (current == null) return Collections.emptySet();
            }
            Set<String> hidden = current.hidden.get(listId);
            return hidden != null ? hidden : Collections.<String>emptySet();
        } catch (Throwable failure) {
            return Collections.emptySet();
        }
    }

    /** Whether {@code key} is hidden in list feature {@code listId} right now. Never throws. */
    public static boolean isHidden(String listId, String key) {
        try {
            return key != null && getHidden(listId).contains(key);
        } catch (Throwable failure) {
            return false;
        }
    }

    // ---------------------------------------------------------------------------------------
    // Initialisation
    // ---------------------------------------------------------------------------------------

    /** Called by the init provider before Application.onCreate. Idempotent and thread-safe. */
    public static void init(Context context) {
        init(context, "provider");
    }

    static Snapshot init(Context context, String source) {
        Snapshot current = snapshot;
        if (current != null) return current;
        synchronized (LOCK) {
            if (snapshot != null) return snapshot;
            Store created;
            try {
                Context app = context.getApplicationContext();
                created = new PrefsStore(app != null ? app : context);
            } catch (Throwable failure) {
                return publishFailure(failure, source);
            }
            return attach(created, source);
        }
    }

    /** First hook before the provider ran (or in a process without it): find the context lazily. */
    private static Snapshot initLazily() {
        Context app = AppContext.currentApplication();
        // Null inside Application.attachBaseContext: answer the default and retry on the next call.
        if (app == null) return null;
        return init(app, "lazy");
    }

    private static Snapshot attach(Store created, String source) {
        store = created;
        initSource = source;
        created.setOnChange(new Runnable() {
            @Override
            public void run() {
                rebuild();
            }
        });
        Snapshot built = build(created);
        baseline = built;
        snapshot = built;
        // Options seen before the engine started are written now.
        if (!pendingOptions.isEmpty()) scheduleOptionsFlush();
        return built;
    }

    private static Snapshot publishFailure(Throwable failure, String source) {
        engineError = describe(failure);
        Log.e(TAG, "Settings engine unavailable, every feature stays stock: " + engineError);
        initSource = source;
        Snapshot failed = Snapshot.failed();
        baseline = failed;
        snapshot = failed;
        return failed;
    }

    /** Rebuilds the snapshot after the store changed. */
    static void rebuild() {
        synchronized (LOCK) {
            Store current = store;
            if (current != null) snapshot = build(current);
        }
    }

    private static Snapshot build(Store source) {
        try {
            Snapshot built = Snapshot.from(Registry.get(), source.readAll());
            engineError = null;
            return built;
        } catch (Throwable failure) {
            engineError = describe(failure);
            Log.e(TAG, "Settings could not be read, every feature stays stock: " + engineError);
            return Snapshot.failed();
        }
    }

    // ---------------------------------------------------------------------------------------
    // Writes (settings screen, crash guard). Synchronous commit(), then an immediate rebuild.
    // ---------------------------------------------------------------------------------------

    /** Saves a feature choice. Unknown, build-time-only and list ids are ignored (false). */
    public static boolean setEnabled(String featureId, boolean enabled) {
        Feature feature = Registry.get().feature(featureId);
        if (feature == null || feature.buildTimeOnly || feature.isList()) return false;
        return write(Collections.<String, Object>singletonMap(FEATURE_PREFIX + featureId, enabled), null);
    }

    public static boolean setPaused(boolean paused) {
        return write(Collections.<String, Object>singletonMap(KEY_PAUSED, paused), null);
    }

    public static boolean setSafeMode(boolean safeMode) {
        return write(Collections.<String, Object>singletonMap(KEY_SAFE_MODE, safeMode), null);
    }

    public static boolean setTheme(String theme) {
        if (!THEME_SYSTEM.equals(theme) && !THEME_LIGHT.equals(theme) && !THEME_DARK.equals(theme)
                && !THEME_AMOLED.equals(theme)) return false;
        return write(Collections.<String, Object>singletonMap(KEY_THEME, theme), null);
    }

    /**
     * Saves the picked keys of list feature {@code listId}; an empty set removes the choice
     * (stock). Invalid keys (empty, longer than {@value #MAX_KEY_LENGTH}, or holding a tab or line
     * break) are dropped. False for an unknown or switch id, more than {@value #MAX_HIDDEN} keys, or
     * a failed write.
     */
    public static boolean setHidden(String listId, Set<String> keys) {
        Feature feature = Registry.get().feature(listId);
        if (feature == null || !feature.isList()) return false;
        Set<String> clean = new HashSet<>();
        if (keys != null) {
            for (String key : keys) if (isValidKey(key)) clean.add(key);
        }
        if (clean.size() > MAX_HIDDEN) return false;
        if (clean.isEmpty()) return write(null, Collections.singletonList(LIST_PREFIX + listId));
        return write(Collections.<String, Object>singletonMap(LIST_PREFIX + listId, clean), null);
    }

    /** Adds {@code key} to, or removes it from, the picked keys of list feature {@code listId}. */
    public static boolean setHidden(String listId, String key, boolean hidden) {
        if (!isValidKey(key)) return false;
        synchronized (LOCK) {
            Set<String> next = new HashSet<>(pickedHidden(listId));
            if (hidden ? !next.add(key) : !next.remove(key)) return true;
            return setHidden(listId, next);
        }
    }

    /** Empties the picked keys of list feature {@code listId} (stock). */
    public static boolean clearHidden(String listId) {
        return setHidden(listId, Collections.<String>emptySet());
    }

    /**
     * Saves many choices in one write (profiles and import). {@code switches} maps a runtime
     * switch's id to its choice; {@code lists} maps a list's id to its picked keys, where an empty
     * set removes the choice (stock). Unknown ids, build-time-only features, a switch id in
     * {@code lists} or the other way round, invalid keys and lists over {@value #MAX_HIDDEN} keys are
     * skipped. False when nothing valid was given or the write failed.
     */
    public static boolean applyChoices(Map<String, Boolean> switches, Map<String, Set<String>> lists) {
        Registry registry = Registry.get();
        Map<String, Object> puts = new HashMap<>();
        List<String> removes = new ArrayList<>();
        if (switches != null) {
            for (Map.Entry<String, Boolean> entry : switches.entrySet()) {
                Feature feature = registry.feature(entry.getKey());
                if (feature == null || feature.buildTimeOnly || feature.isList() || entry.getValue() == null) continue;
                puts.put(FEATURE_PREFIX + feature.id, entry.getValue());
            }
        }
        if (lists != null) {
            for (Map.Entry<String, Set<String>> entry : lists.entrySet()) {
                Feature feature = registry.feature(entry.getKey());
                if (feature == null || !feature.isList()) continue;
                Set<String> clean = new HashSet<>();
                if (entry.getValue() != null) {
                    for (String key : entry.getValue()) if (isValidKey(key)) clean.add(key);
                }
                if (clean.size() > MAX_HIDDEN) continue;
                if (clean.isEmpty()) removes.add(LIST_PREFIX + feature.id);
                else puts.put(LIST_PREFIX + feature.id, clean);
            }
        }
        if (puts.isEmpty() && removes.isEmpty()) return false;
        return write(puts, removes);
    }

    /** Every feature back to its default and the pause off. Safe mode and theme are kept. */
    public static boolean resetAll() {
        synchronized (LOCK) {
            Store current = store;
            if (current == null) return false;
            List<String> removes = new ArrayList<>();
            try {
                for (String key : current.readAll().keySet()) {
                    // Picked list keys go too; seen options are not a choice and stay.
                    if (key.startsWith(FEATURE_PREFIX) || key.startsWith(LIST_PREFIX) || KEY_PAUSED.equals(key)) {
                        removes.add(key);
                    }
                }
            } catch (Throwable failure) {
                return false;
            }
            return write(null, removes);
        }
    }

    private static boolean write(Map<String, Object> puts, List<String> removes) {
        synchronized (LOCK) {
            Store current = store;
            if (current == null) return false;
            boolean saved;
            try {
                saved = current.commit(puts, removes);
            } catch (Throwable failure) {
                Log.e(TAG, "Settings could not be saved: " + describe(failure));
                saved = false;
            }
            snapshot = build(current);
            return saved;
        }
    }

    // ---------------------------------------------------------------------------------------
    // List options (what the picker offers)
    // ---------------------------------------------------------------------------------------

    /**
     * Static options for the picker of list feature {@code listId}, for example a bundled list of
     * countries. Kept in memory for this process only and merged with earlier calls; call it from
     * code that runs at process start (an Application hook or the extension's class initialiser)
     * so the picker has them. Labels of seen options win over these. Never throws.
     */
    public static void registerOptions(String listId, Map<String, String> keyToLabel) {
        try {
            if (listId == null || keyToLabel == null) return;
            synchronized (seeds) {
                Map<String, String> merged = new HashMap<>();
                Map<String, String> existing = seeds.get(listId);
                if (existing != null) merged.putAll(existing);
                for (Map.Entry<String, String> entry : keyToLabel.entrySet()) {
                    String key = entry.getKey();
                    if (!isValidKey(key) || (merged.size() >= MAX_OPTIONS && !merged.containsKey(key))) continue;
                    merged.put(key, cleanLabel(entry.getValue(), key));
                }
                seeds.put(listId, Collections.unmodifiableMap(merged));
            }
        } catch (Throwable ignored) {
            // Never let an options report fail a hook.
        }
    }

    /**
     * Records that the app showed option {@code key} with {@code label} in list feature
     * {@code listId}, so the picker can offer it. Persisted (at most {@value #MAX_OPTIONS} per
     * list, written in the background in batches). Cheap for an option already known with the same
     * label: two map lookups, no IO. Unknown and switch ids are ignored. Never throws.
     */
    public static void reportOptionsSeen(String listId, String key, String label) {
        try {
            if (listId == null || !isValidKey(key)) return;
            String clean = cleanLabel(label, key);
            Snapshot current = snapshot;
            if (current != null) {
                Map<String, String> saved = current.options.get(listId);
                if (saved != null) {
                    String known = saved.get(key);
                    if (clean.equals(known)) return;
                    if (known == null && saved.size() >= MAX_OPTIONS) return;
                }
            }
            ConcurrentHashMap<String, String> pending = pendingOptions.get(listId);
            if (pending != null && clean.equals(pending.get(key))) return;
            Feature feature = Registry.get().feature(listId);
            if (feature == null || !feature.isList()) return;
            if (pending == null) {
                synchronized (pendingOptions) {
                    pending = pendingOptions.get(listId);
                    if (pending == null) {
                        pending = new ConcurrentHashMap<>();
                        pendingOptions.put(listId, pending);
                    }
                }
            }
            if (pending.size() >= MAX_OPTIONS && !pending.containsKey(key)) return;
            pending.put(key, clean);
            scheduleOptionsFlush();
        } catch (Throwable ignored) {
            // Never let an options report fail a hook.
        }
    }

    /** {@link #reportOptionsSeen(String, String, String)} for several options at once. */
    public static void reportOptionsSeen(String listId, Map<String, String> keyToLabel) {
        try {
            if (keyToLabel == null) return;
            for (Map.Entry<String, String> entry : keyToLabel.entrySet()) {
                reportOptionsSeen(listId, entry.getKey(), entry.getValue());
            }
        } catch (Throwable ignored) {
            // Never let an options report fail a hook.
        }
    }

    /**
     * Every option of list feature {@code listId}, key to label, unsorted: the static seeds, the
     * persisted and pending seen options (their labels win), and every picked key (labelled by its
     * key when no option names it), so a picked key can always be unpicked.
     */
    public static Map<String, String> options(String listId) {
        Map<String, String> all = new HashMap<>();
        if (listId == null) return all;
        Map<String, String> seeded = seeds.get(listId);
        if (seeded != null) all.putAll(seeded);
        Snapshot current = snapshot;
        if (current != null) {
            Map<String, String> saved = current.options.get(listId);
            if (saved != null) all.putAll(saved);
        }
        Map<String, String> pending = pendingOptions.get(listId);
        if (pending != null) all.putAll(pending);
        for (String key : pickedHidden(listId)) {
            if (!all.containsKey(key)) all.put(key, key);
        }
        return all;
    }

    /**
     * Supplies the icon of a picker option: a short text drawn before its label, such as an emoji
     * flag ({@link OptionIcons}). Called by the picker while it loads, never by a hook.
     */
    public interface OptionIconProvider {
        /** The icon of option {@code key}, or null for none. */
        String iconFor(String key);
    }

    /**
     * An icon provider that also names an image for an option, such as a flag on the app's own image
     * server. The picker shows {@link #iconFor} at once and swaps in the image once it has loaded
     * (off the main thread, cached); a failed load keeps the text icon. A separate interface rather
     * than a default method, so a provider built without it keeps working however the extensions
     * were desugared. Register it with {@link #setOptionIconProvider}.
     */
    public interface OptionImageProvider extends OptionIconProvider {
        /** The https URL of option {@code key}'s image, or null for none. */
        String imageUrlFor(String key);
    }

    /**
     * Sets the icon provider of list feature {@code listId} (null removes it). Kept in memory for
     * this process only, like {@link #registerOptions}: icons are never saved and never change what
     * is hidden. Register it from the same process-start code as the seeds. Never throws.
     */
    public static void setOptionIconProvider(String listId, OptionIconProvider provider) {
        try {
            if (listId == null) return;
            if (provider == null) iconProviders.remove(listId);
            else iconProviders.put(listId, provider);
        } catch (Throwable ignored) {
            // Icons are cosmetic.
        }
    }

    /**
     * The icon of option {@code key} of list feature {@code listId}, trimmed, or null: when no
     * provider is set, or it answers null, blank, longer than {@value #MAX_ICON_LENGTH} chars or with
     * a tab or line break, or it throws. Never throws.
     */
    public static String optionIcon(String listId, String key) {
        try {
            if (listId == null || key == null) return null;
            OptionIconProvider provider = iconProviders.get(listId);
            if (provider == null) return null;
            String icon = provider.iconFor(key);
            if (icon == null) return null;
            icon = icon.trim();
            if (icon.isEmpty() || icon.length() > MAX_ICON_LENGTH) return null;
            for (int i = 0; i < icon.length(); i++) {
                char c = icon.charAt(i);
                if (c == '\t' || c == '\n' || c == '\r') return null;
            }
            return icon;
        } catch (Throwable ignored) {
            return null;
        }
    }

    /**
     * The image URL of option {@code key} of list feature {@code listId}, trimmed, or null: when the
     * list's provider is not an {@link OptionImageProvider}, or it answers null, a URL that is not
     * {@code https://<host>...}, longer than {@value #MAX_IMAGE_URL_LENGTH} chars or with a character
     * outside printable ASCII (spaces included), or it throws. Never throws.
     */
    public static String optionImageUrl(String listId, String key) {
        try {
            if (listId == null || key == null) return null;
            OptionIconProvider provider = iconProviders.get(listId);
            if (!(provider instanceof OptionImageProvider)) return null;
            String url = ((OptionImageProvider) provider).imageUrlFor(key);
            if (url == null) return null;
            url = url.trim();
            if (url.length() > MAX_IMAGE_URL_LENGTH || !url.regionMatches(true, 0, HTTPS, 0, HTTPS.length())) return null;
            for (int i = 0; i < url.length(); i++) {
                char c = url.charAt(i);
                if (c <= ' ' || c > '~') return null;
            }
            // A host must follow the scheme: "https://", "https:///x" and "https://@x" have none.
            int hostEnd = HTTPS.length();
            while (hostEnd < url.length() && "/?#@".indexOf(url.charAt(hostEnd)) < 0) hostEnd++;
            if (hostEnd == HTTPS.length()) return null;
            return url;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void scheduleOptionsFlush() {
        if (!flushScheduled.compareAndSet(false, true)) return;
        if (synchronousOptionsFlush) {
            flushScheduled.set(false);
            flushOptions();
            return;
        }
        try {
            Thread writer = new Thread(new Runnable() {
                @Override
                public void run() {
                    try {
                        Thread.sleep(OPTIONS_FLUSH_DELAY_MS);
                    } catch (InterruptedException interrupted) {
                        Thread.currentThread().interrupt();
                    }
                    // Cleared before the batch is read, so an option reported during the write
                    // schedules another flush instead of waiting for this one.
                    flushScheduled.set(false);
                    flushOptions();
                }
            }, "HevalControls-options");
            writer.setDaemon(true);
            writer.start();
        } catch (Throwable failure) {
            flushScheduled.set(false);
        }
    }

    /** Merges the pending seen options into the store. Kept pending until the engine has a store. */
    static void flushOptions() {
        try {
            synchronized (LOCK) {
                Store current = store;
                if (current == null || pendingOptions.isEmpty()) return;
                Map<String, ?> values = current.readAll();
                Map<String, Object> puts = new HashMap<>();
                Map<String, Map<String, String>> batch = new HashMap<>();
                for (Map.Entry<String, ConcurrentHashMap<String, String>> entry : pendingOptions.entrySet()) {
                    String listId = entry.getKey();
                    Map<String, String> taken = new HashMap<>(entry.getValue());
                    if (taken.isEmpty()) continue;
                    batch.put(listId, taken);
                    Map<String, String> merged = new LinkedHashMap<>(readOptions(values.get(OPTIONS_PREFIX + listId)));
                    boolean changed = false;
                    for (Map.Entry<String, String> option : taken.entrySet()) {
                        String key = option.getKey(), label = option.getValue();
                        if (label.equals(merged.get(key))) continue;
                        if (!merged.containsKey(key) && merged.size() >= MAX_OPTIONS) continue;
                        merged.put(key, label);
                        changed = true;
                    }
                    if (changed) puts.put(OPTIONS_PREFIX + listId, encodeOptions(merged));
                }
                if (!puts.isEmpty() && !write(puts, null)) return;
                // Persisted (or already known, or over the cap): no longer pending. An entry whose
                // label changed since the batch was read stays for the next flush.
                for (Map.Entry<String, Map<String, String>> entry : batch.entrySet()) {
                    ConcurrentHashMap<String, String> pending = pendingOptions.get(entry.getKey());
                    if (pending == null) continue;
                    for (Map.Entry<String, String> option : entry.getValue().entrySet()) {
                        pending.remove(option.getKey(), option.getValue());
                    }
                }
            }
        } catch (Throwable failure) {
            Log.w(TAG, "Seen options could not be saved: " + describe(failure));
        }
    }

    /** A key a list can hold: non-empty, at most {@value #MAX_KEY_LENGTH} chars, no tab or line break. */
    static boolean isValidKey(String key) {
        if (key == null || key.isEmpty() || key.length() > MAX_KEY_LENGTH) return false;
        for (int i = 0; i < key.length(); i++) {
            char c = key.charAt(i);
            if (c == '\t' || c == '\n' || c == '\r') return false;
        }
        return true;
    }

    /** The label without tabs or line breaks, trimmed and cut; the key when it is empty. */
    static String cleanLabel(String label, String key) {
        if (label == null) return key;
        boolean clean = !label.isEmpty() && label.length() <= MAX_LABEL_LENGTH
                && label.charAt(0) > ' ' && label.charAt(label.length() - 1) > ' ';
        for (int i = 0; clean && i < label.length(); i++) {
            char c = label.charAt(i);
            if (c == '\t' || c == '\n' || c == '\r') clean = false;
        }
        if (clean) return label;
        String fixed = label.replace('\t', ' ').replace('\n', ' ').replace('\r', ' ').trim();
        if (fixed.length() > MAX_LABEL_LENGTH) fixed = fixed.substring(0, MAX_LABEL_LENGTH).trim();
        return fixed.isEmpty() ? key : fixed;
    }

    static Set<String> encodeOptions(Map<String, String> options) {
        Set<String> encoded = new HashSet<>();
        for (Map.Entry<String, String> entry : options.entrySet()) {
            encoded.add(entry.getKey() + '\t' + entry.getValue());
        }
        return encoded;
    }

    /** Stored seen options; malformed entries are skipped. Never null. */
    static Map<String, String> readOptions(Object value) {
        if (!(value instanceof Set)) return Collections.emptyMap();
        Map<String, String> options = new HashMap<>();
        for (Object entry : (Set<?>) value) {
            if (!(entry instanceof String) || options.size() >= MAX_OPTIONS) continue;
            String text = (String) entry;
            int tab = text.indexOf('\t');
            if (tab <= 0) continue;
            String key = text.substring(0, tab);
            if (isValidKey(key)) options.put(key, cleanLabel(text.substring(tab + 1), key));
        }
        return Collections.unmodifiableMap(options);
    }

    /** Stored picked keys; invalid entries are skipped. Never null. */
    static Set<String> readKeys(Object value) {
        if (!(value instanceof Set)) return Collections.emptySet();
        Set<String> keys = new HashSet<>();
        for (Object key : (Set<?>) value) {
            if (key instanceof String && isValidKey((String) key) && keys.size() < MAX_HIDDEN) keys.add((String) key);
        }
        return keys.isEmpty() ? Collections.<String>emptySet() : Collections.unmodifiableSet(keys);
    }

    // ---------------------------------------------------------------------------------------
    // Hook failures (privacy-safe)
    // ---------------------------------------------------------------------------------------

    /**
     * For extension helpers that caught an exception in a hook (and returned the stock value).
     * Keeps the exception class and the first Heval frame only, never the message, which could
     * hold user content.
     */
    public static void reportFailure(String featureId, Throwable failure) {
        try {
            if (featureId == null || failure == null) return;
            String description = describe(failure);
            failures.put(featureId, description);
            Log.w(TAG, "Feature " + featureId + " failed and fell back to stock: " + description);
        } catch (Throwable ignored) {
            // Never let failure reporting fail a hook.
        }
    }

    /** "<exception class> at <Class.method:line>" for the first app.template.extension frame. */
    static String describe(Throwable failure) {
        StackTraceElement[] stack = failure.getStackTrace();
        StackTraceElement frame = stack == null || stack.length == 0 ? null : stack[0];
        if (stack != null) {
            for (StackTraceElement element : stack) {
                if (element.getClassName().startsWith("app.template.extension.")) {
                    frame = element;
                    break;
                }
            }
        }
        if (frame == null) return failure.getClass().getName();
        String className = frame.getClassName();
        return failure.getClass().getName() + " at " + className.substring(className.lastIndexOf('.') + 1)
                + "." + frame.getMethodName() + (frame.getLineNumber() >= 0 ? ":" + frame.getLineNumber() : "");
    }

    // ---------------------------------------------------------------------------------------
    // Read API for the settings screen and diagnostics
    // ---------------------------------------------------------------------------------------

    /** Whether the engine has a snapshot (it may be a failed one). */
    public static boolean isReady() {
        return snapshot != null;
    }

    public static boolean isPaused() {
        Snapshot current = snapshot;
        return current != null && current.paused;
    }

    public static boolean isSafeMode() {
        Snapshot current = snapshot;
        return current != null && current.safeMode;
    }

    /** Whether the engine could not read its settings, so every feature is stock. */
    public static boolean isEngineFailed() {
        Snapshot current = snapshot;
        return current != null && current.failed;
    }

    /** The exception class of the last engine failure, or null. */
    public static String engineError() {
        return engineError;
    }

    /** "provider", "lazy", "test" or "none". */
    public static String initSource() {
        return initSource;
    }

    public static String theme() {
        Snapshot current = snapshot;
        return current == null ? THEME_SYSTEM : current.theme;
    }

    /** The saved choice (or the default), ignoring pause, safe mode and dependencies. */
    public static boolean isChosen(String featureId) {
        Snapshot current = snapshot;
        if (current == null) return Registry.get().defaultFor(featureId);
        Boolean chosen = current.chosen.get(featureId);
        return chosen != null && chosen;
    }

    /**
     * Whether the Patch settings screen marks a feature as on (its row marker and its section's "N on"
     * count): a chosen switch, a list with at least one pick, or a patch-time change. Like
     * {@link #isChosen}, it ignores pause, safe mode, dependencies and pending restarts.
     */
    public static boolean showsOn(Feature feature) {
        if (feature == null) return false;
        return feature.buildTimeOnly || isChosen(feature.id);
    }

    /** The picked keys of a list feature, ignoring pause, safe mode and dependencies. Never null. */
    public static Set<String> pickedHidden(String listId) {
        Snapshot current = snapshot;
        if (current == null || listId == null) return Collections.emptySet();
        Set<String> picked = current.picked.get(listId);
        return picked != null ? picked : Collections.<String>emptySet();
    }

    /** The last hook failure of a feature in this process, or null. */
    public static String failureOf(String featureId) {
        return featureId == null ? null : failures.get(featureId);
    }

    /** The first dependency of a feature that this APK does not have, or null. */
    public static String missingDependency(Feature feature) {
        Registry registry = Registry.get();
        for (String dependency : feature.dependencies) {
            if (registry.feature(dependency) == null) return dependency;
        }
        return null;
    }

    public static State stateOf(Feature feature) {
        if (feature.buildTimeOnly) return State.BUILD_TIME_ONLY;
        if (missingDependency(feature) != null) return State.UNSUPPORTED;
        if (failures.containsKey(feature.id)) return State.FAILED;
        if (feature.restartRequired && restartPending(feature.id)) return State.RESTART_REQUIRED;
        return isEnabled(feature.id) ? State.ENABLED : State.DISABLED;
    }

    /** How many restart-required features (lists included) now answer differently from process start. */
    public static int pendingRestartCount() {
        int count = 0;
        for (Feature feature : Registry.get().features()) {
            if (feature.restartRequired && !feature.buildTimeOnly && restartPending(feature.id)) count++;
        }
        return count;
    }

    private static boolean restartPending(String featureId) {
        Snapshot now = snapshot, start = baseline;
        if (now == null || start == null) return false;
        return now.isOn(featureId) != start.isOn(featureId) || !now.hiddenOf(featureId).equals(start.hiddenOf(featureId));
    }

    // ---------------------------------------------------------------------------------------
    // Snapshot
    // ---------------------------------------------------------------------------------------

    /** Everything a hook needs, computed once per change. Never mutated after publication. */
    static final class Snapshot {
        final boolean paused, safeMode, failed;
        final String theme;
        /** The user's choice or default per registered runtime feature. */
        final Map<String, Boolean> chosen;
        /** Only the features that are on right now (Boolean.TRUE). A list is on when it hides something. */
        final Map<String, Boolean> effective;
        /** The picked keys per list feature (empty included), ignoring pause and safe mode. */
        final Map<String, Set<String>> picked;
        /** The keys to hide right now, only for the lists that are on. */
        final Map<String, Set<String>> hidden;
        /** Persisted seen options per list feature that has any. */
        final Map<String, Map<String, String>> options;

        private Snapshot(boolean paused, boolean safeMode, boolean failed, String theme,
                         Map<String, Boolean> chosen, Map<String, Boolean> effective,
                         Map<String, Set<String>> picked, Map<String, Set<String>> hidden,
                         Map<String, Map<String, String>> options) {
            this.paused = paused;
            this.safeMode = safeMode;
            this.failed = failed;
            this.theme = theme;
            this.chosen = chosen;
            this.effective = effective;
            this.picked = picked;
            this.hidden = hidden;
            this.options = options;
        }

        static Snapshot failed() {
            return new Snapshot(false, false, true, THEME_SYSTEM,
                    Collections.<String, Boolean>emptyMap(), Collections.<String, Boolean>emptyMap(),
                    Collections.<String, Set<String>>emptyMap(), Collections.<String, Set<String>>emptyMap(),
                    Collections.<String, Map<String, String>>emptyMap());
        }

        static Snapshot from(Registry registry, Map<String, ?> values) {
            boolean paused = Boolean.TRUE.equals(values.get(KEY_PAUSED));
            boolean safeMode = Boolean.TRUE.equals(values.get(KEY_SAFE_MODE));
            Object savedTheme = values.get(KEY_THEME);
            String theme = savedTheme instanceof String ? (String) savedTheme : THEME_SYSTEM;

            Map<String, Boolean> chosen = new HashMap<>();
            Map<String, Set<String>> picked = new HashMap<>();
            Map<String, Map<String, String>> options = new HashMap<>();
            for (Feature feature : registry.features()) {
                if (feature.isList()) {
                    // A wrong type reads as nothing picked (stock).
                    Set<String> keys = readKeys(values.get(LIST_PREFIX + feature.id));
                    picked.put(feature.id, keys);
                    chosen.put(feature.id, !keys.isEmpty());
                    Map<String, String> seen = readOptions(values.get(OPTIONS_PREFIX + feature.id));
                    if (!seen.isEmpty()) options.put(feature.id, seen);
                    continue;
                }
                Object value = feature.buildTimeOnly ? null : values.get(FEATURE_PREFIX + feature.id);
                // Unknown keys in the store are never read; a wrong type falls back to the default.
                chosen.put(feature.id, value instanceof Boolean ? (Boolean) value : feature.defaultEnabled);
            }

            Map<String, Boolean> effective = new HashMap<>();
            Map<String, Set<String>> hidden = new HashMap<>();
            if (!paused && !safeMode && registry.decoded.supported) {
                for (Feature feature : registry.features()) {
                    if (resolve(registry, feature, chosen, new HashSet<String>())) {
                        effective.put(feature.id, Boolean.TRUE);
                        if (feature.isList()) hidden.put(feature.id, picked.get(feature.id));
                    }
                }
            }
            return new Snapshot(paused, safeMode, false, theme,
                    Collections.unmodifiableMap(chosen), Collections.unmodifiableMap(effective),
                    Collections.unmodifiableMap(picked), Collections.unmodifiableMap(hidden),
                    Collections.unmodifiableMap(options));
        }

        /** On when chosen and every dependency resolves on; a missing or cyclic dependency is off. */
        private static boolean resolve(Registry registry, Feature feature, Map<String, Boolean> chosen, Set<String> visiting) {
            if (!Boolean.TRUE.equals(chosen.get(feature.id)) || !visiting.add(feature.id)) return false;
            for (String dependencyId : feature.dependencies) {
                Feature dependency = registry.feature(dependencyId);
                if (dependency == null || !resolve(registry, dependency, chosen, visiting)) return false;
            }
            visiting.remove(feature.id);
            return true;
        }

        boolean isOn(String featureId) {
            return Boolean.TRUE.equals(effective.get(featureId));
        }

        Set<String> hiddenOf(String featureId) {
            Set<String> keys = hidden.get(featureId);
            return keys != null ? keys : Collections.<String>emptySet();
        }
    }

    // ---------------------------------------------------------------------------------------
    // Tests
    // ---------------------------------------------------------------------------------------

    static void initForTests(Store testStore) {
        synchronized (LOCK) {
            attach(testStore, "test");
        }
    }

    static void resetForTests() {
        synchronized (LOCK) {
            snapshot = null;
            baseline = null;
            store = null;
            initSource = "none";
            engineError = null;
            failures.clear();
            seeds.clear();
            iconProviders.clear();
            pendingOptions.clear();
            flushScheduled.set(false);
            synchronousOptionsFlush = false;
        }
    }

    private HevalSettings() { }
}
