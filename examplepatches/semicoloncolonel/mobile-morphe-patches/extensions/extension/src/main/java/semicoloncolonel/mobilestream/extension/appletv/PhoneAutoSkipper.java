package semicoloncolonel.mobilestream.extension.appletv;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Locale;

/**
 * "Auto-skip" for the Apple TV phone app.
 *
 * The stream lists its skippable parts (promos for other titles, recaps, and
 * intros) as Skip segments. While the player is inside one, its view model
 * holds it as the active segment and shows a Skip button, which calls the
 * view model's skip method to seek to the segment's end. Each time a segment
 * becomes active, it is passed here, and a chosen one is skipped through that
 * same method. Each segment is skipped once per playback, so rewinding into
 * one plays it.
 *
 * Recaps and intros are told apart by their button label ("Skip Recap",
 * "Skip Intro"). Every other segment is a promo, whether or not it carries
 * promo details, as on the Android TV app, where a promo's button is a plain
 * "Skip". Segments whose action is to play the next video are left alone.
 */
@SuppressWarnings("unused")
public final class PhoneAutoSkipper {
    private static final String TAG = "MSP-ATV-SKIP";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    // A segment at the very start becomes active before the player is ready,
    // and a seek made then is lost, so the skip waits a moment, as a press would.
    private static final long SKIP_DELAY_MS = 800;
    private static final long RETRY_DELAY_MS = 1500;
    private static final int MAX_TRIES = 3;
    // Raised when a "Watch" button is pressed, which cancels retries already
    // scheduled, so going back into a skipped part is not undone.
    private static volatile int retryEpoch;

    private static volatile WeakReference<Object> viewModel = new WeakReference<>(null);
    // Segments already skipped in this playback, by their contents (start,
    // target, label, ...), since the player rebuilds the segment objects.
    // Rewinding into one plays it.
    private static final java.util.Set<String> skipped =
            java.util.Collections.synchronizedSet(new java.util.HashSet<>());

    private PhoneAutoSkipper() {
    }

    // Overwritten by the patch.
    public static boolean skipPromos() {
        return false;
    }

    public static boolean skipRecaps() {
        return false;
    }

    public static boolean skipIntros() {
        return false;
    }

    public static String labelField() {
        return "";
    }

    public static String actionField() {
        return "";
    }

    public static String promoField() {
        return "";
    }

    public static String skipMethod() {
        return "";
    }

    public static String skipsField() {
        return "";
    }

    public static String startField() {
        return "";
    }

    public static String durationField() {
        return "";
    }

    public static String targetField() {
        return "";
    }

    // "Watch Recap" and "Watch Intro": after a recap or intro is skipped, the
    // app's own Skip button, labeled this way, shows for a few seconds where
    // the skipped part ends, and goes back to its start.
    private static final String WATCH_RECAP = "Watch Recap";
    private static final String WATCH_INTRO = "Watch Intro";
    private static final double WATCH_WINDOW_SECONDS = 10.0;
    private static final double WATCH_SHOWN_SECONDS = 5.0;
    // Each added segment's key (toString) and the start it goes back to.
    private static final java.util.Map<String, Double> watchStarts =
            java.util.Collections.synchronizedMap(new java.util.HashMap<>());
    // Parts already gone back to in this playback (label and start): their
    // "Watch" button is not offered again.
    private static final java.util.Set<String> watched =
            java.util.Collections.synchronizedSet(new java.util.HashSet<>());
    // Session data objects that got "Watch" segments, to take a used one out.
    private static final java.util.Map<Object, Boolean> withWatch =
            java.util.Collections.synchronizedMap(new java.util.WeakHashMap<>());

    private static String watchKey(String label, Object start) {
        return label + "@" + start;
    }

    private static boolean isWatch(Object label) {
        return WATCH_RECAP.equals(label) || WATCH_INTRO.equals(label);
    }

    private static void write(Object target, String name, Object value) throws Exception {
        Field field = target.getClass().getDeclaredField(name);
        field.setAccessible(true);
        field.set(target, value);
    }

    private static Object newSegment(Class<?> type, Double start, Double duration, Double target, String label)
            throws Exception {
        for (java.lang.reflect.Constructor<?> constructor : type.getDeclaredConstructors()) {
            Class<?>[] params = constructor.getParameterTypes();
            if (params.length == 6 && params[0] == Double.class && params[3] == String.class) {
                constructor.setAccessible(true);
                return constructor.newInstance(start, duration, target, label, null, null);
            }
        }
        throw new IllegalStateException("segment constructor not found");
    }

    /**
     * Called at the end of the session data's constructor: for each recap or
     * intro that Auto-skip skips, adds a "Watch Recap" or "Watch Intro"
     * segment that starts where it ends.
     */
    public static void addRewatch(Object sessionData) {
        if (!skipRecaps() && !skipIntros()) {
            return;
        }
        try {
            Field skipsField = sessionData.getClass().getDeclaredField(skipsField());
            skipsField.setAccessible(true);
            Object current = skipsField.get(sessionData);
            if (!(current instanceof java.util.List) || ((java.util.List<?>) current).isEmpty()) {
                return;
            }
            java.util.List<Object> skips = new java.util.ArrayList<>((java.util.List<?>) current);
            java.util.List<Object> added = new java.util.ArrayList<>();
            for (Object skip : skips) {
                Object label = read(skip, labelField());
                if (isWatch(label)) {
                    return;
                }
                if (read(skip, actionField()) != null || read(skip, promoField()) != null) {
                    continue;
                }
                String text = label == null ? "" : label.toString().toLowerCase(Locale.ROOT);
                String watch = text.contains("recap") && skipRecaps() ? WATCH_RECAP
                        : text.contains("intro") && skipIntros() ? WATCH_INTRO : null;
                Object start = read(skip, startField());
                Object end = read(skip, targetField());
                if (watch == null || !(start instanceof Double) || !(end instanceof Double)) {
                    continue;
                }
                if (watched.contains(watchKey(watch, start))) {
                    continue;
                }
                double from = (Double) end;
                Object segment = newSegment(skip.getClass(), from, WATCH_SHOWN_SECONDS,
                        from + WATCH_WINDOW_SECONDS, watch);
                watchStarts.put(segment.toString(), (Double) start);
                added.add(segment);
            }
            if (!added.isEmpty()) {
                skips.addAll(added);
                skipsField.set(sessionData, skips);
                withWatch.put(sessionData, Boolean.TRUE);
            }
        } catch (Throwable t) {
            Log.w(TAG, "could not add Watch Recap", t);
        }
    }

    /** Takes a used "Watch" segment out of the session data that has it. */
    private static void removeWatch(String key) {
        Object[] all;
        synchronized (withWatch) {
            all = withWatch.keySet().toArray();
        }
        for (Object sessionData : all) {
            try {
                Field skipsField = sessionData.getClass().getDeclaredField(skipsField());
                skipsField.setAccessible(true);
                Object current = skipsField.get(sessionData);
                if (!(current instanceof java.util.List)) continue;
                java.util.List<Object> kept = new java.util.ArrayList<>();
                for (Object skip : (java.util.List<?>) current) {
                    if (!key.equals(skip.toString())) kept.add(skip);
                }
                skipsField.set(sessionData, kept);
            } catch (Throwable t) {
                Log.w(TAG, "could not remove Watch segment", t);
            }
        }
    }

    /**
     * Called at the start of the skip method: a "Watch Recap" or "Watch
     * Intro" press goes back to the start of the part it follows.
     */
    public static Object resolve(Object skip) {
        try {
            if (skip != null && isWatch(read(skip, labelField()))) {
                Double start = watchStarts.get(skip.toString());
                if (start != null) {
                    Log.i(TAG, "going back to " + start);
                    retryEpoch++;
                    String label = (String) read(skip, labelField());
                    watched.add(watchKey(label, start));
                    removeWatch(skip.toString());
                    return newSegment(skip.getClass(), (Double) read(skip, startField()),
                            (Double) read(skip, durationField()), start, (String) read(skip, labelField()));
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "could not go back", t);
        }
        return skip;
    }

    /** Called at the end of the player view model's constructor. */
    public static void register(Object model) {
        viewModel = new WeakReference<>(model);
        skipped.clear();
        watched.clear();
    }

    private static Object read(Object skip, String name) throws Exception {
        Field field = skip.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(skip);
    }

    private static boolean chosen(Object skip) throws Exception {
        Object action = read(skip, actionField());
        Object label = read(skip, labelField());
        Object promo = read(skip, promoField());
        Log.i(TAG, "skip segment: label=" + label + ", action=" + action + ", promo=" + (promo != null));
        if (action != null || isWatch(label)) {
            return false;
        }
        String text = label == null ? "" : label.toString().toLowerCase(Locale.ROOT);
        if (promo == null && text.contains("recap")) {
            return skipRecaps();
        }
        if (promo == null && text.contains("intro")) {
            return skipIntros();
        }
        // Promos: a segment with promo details, or a plain "Skip" button.
        return skipPromos();
    }

    /** Called each time a Skip segment becomes the active one. */
    public static void onActive(Object skip) {
        if (skip == null || skipped.contains(skip.toString())) {
            return;
        }
        try {
            if (!chosen(skip)) {
                return;
            }
        } catch (Throwable t) {
            Log.w(TAG, "could not read skip segment", t);
            return;
        }
        skipped.add(skip.toString());
        final int epoch = retryEpoch;
        MAIN.postDelayed(() -> skip(skip, 1, epoch), SKIP_DELAY_MS);
    }

    /** Whether the view model still holds this segment as the active one. */
    private static boolean stillActive(Object model, Object skip) {
        for (Field field : model.getClass().getDeclaredFields()) {
            try {
                field.setAccessible(true);
                Object holder = field.get(model);
                if (holder == null) continue;
                Method getValue = holder.getClass().getMethod("getValue");
                if (getValue.getParameterTypes().length == 0 && getValue.invoke(holder) == skip) return true;
            } catch (Throwable ignored) {
                // Not a state holder.
            }
        }
        return false;
    }

    /**
     * Skips the segment. A seek made while the player is still starting can
     * be lost, so while the segment is still the active one, the skip is
     * tried again, up to MAX_TRIES times.
     */
    private static void skip(Object skip, int attempt, int epoch) {
        Object model = viewModel.get();
        if (model == null || epoch != retryEpoch) {
            return;
        }
        if (attempt > 1 && !stillActive(model, skip)) {
            return;
        }
        try {
            for (Method method : model.getClass().getDeclaredMethods()) {
                if (method.getName().equals(skipMethod())
                        && method.getParameterTypes().length == 1
                        && method.getParameterTypes()[0].isInstance(skip)) {
                    method.setAccessible(true);
                    method.invoke(model, skip);
                    Log.i(TAG, "skipped, try " + attempt);
                    if (attempt < MAX_TRIES) {
                        MAIN.postDelayed(() -> skip(skip, attempt + 1, epoch), RETRY_DELAY_MS);
                    }
                    return;
                }
            }
            Log.w(TAG, "skip method not found");
        } catch (Throwable t) {
            Log.w(TAG, "could not skip", t);
        }
    }
}
