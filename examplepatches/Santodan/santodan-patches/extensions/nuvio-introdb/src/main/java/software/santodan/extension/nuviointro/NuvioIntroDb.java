package software.santodan.extension.nuviointro;

import software.santodan.nuvio.NuvioAccess;

import software.santodan.nuvio.NuvioNative;

import android.app.Activity;
import android.app.Application;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicBoolean;

/** Native Compose UI. Credentials live in Settings; playback only captures and submits. */
public final class NuvioIntroDb {
    private static final String TAG = "SantodanIntroDB";
    private static SharedPreferences preferences;
    private static Object revision, keyText, keyFocus, keyFocused;
    private static int serial;
    private static boolean foreground;
    private static final Handler main = new Handler(Looper.getMainLooper());
    private static final AtomicBoolean sending = new AtomicBoolean();
    private static final ExecutorService worker = new ThreadPoolExecutor(0, 1, 15, TimeUnit.SECONDS,
        new SynchronousQueue<>(), r -> { Thread t = new Thread(r, "IntroDB-submit"); t.setDaemon(true); return t; });
    private static Draft draft;
    private static final class Draft {
        final WeakReference<Object> controller;
        final String media;
        final Submission target;
        final SegmentCapture capture = new SegmentCapture();
        final AtomicBoolean cancelled = new AtomicBoolean();
        volatile HttpURLConnection connection;
        boolean review, picker, busy, accepted;
        String type = "intro", status = "";
        Draft(Object controller, String media, Submission target) {
            this.controller = new WeakReference<>(controller); this.media = media; this.target = target;
        }
    }
    private NuvioIntroDb() {}
    public static boolean holdControlsTimer(Object controller) {
        Draft current = draft;
        return foreground && current != null && current.review && !current.cancelled.get()
            && current.controller.get() == controller;
    }
    public static void resume(Activity activity) {
        long started = System.nanoTime();
        Log.d(TAG, "Startup begin: stage=introdb.activity thread=" + Thread.currentThread().getName());
        foreground = true; preferences = activity.getApplicationContext().getSharedPreferences("santodan_introdb", 0);
        Log.d(TAG, "Runtime ready; Anime Skip key editor, filmstrip stage icons, exact cancellation overload");
        Log.d(TAG, "Startup end: stage=introdb.activity elapsedMs=" + (System.nanoTime() - started) / 1_000_000);
    }
    public static void pause(Activity activity) { foreground = false; Log.d(TAG, "Activity paused; clearing capture"); reset(); keyText = null; keyFocus = null; keyFocused = null; }
    private static SharedPreferences prefs() throws Exception {
        if (preferences == null) {
            Application app = (Application)Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
            preferences = app.getSharedPreferences("santodan_introdb", 0);
        }
        return preferences;
    }
    private static boolean enabled() throws Exception { return prefs().getBoolean("enabled", false); }
    private static void observe(ClassLoader loader) throws Exception {
        if (revision == null) revision = IntroUi.state(loader, 0);
        IntroUi.get(revision);
    }
    private static void changed() {
        if (revision != null) try { IntroUi.set(revision, ++serial); }
        catch (Exception error) { throw new IllegalStateException("IntroDB state update failed", error); }
    }
    private static void reset() {
        Draft old = draft; draft = null;
        if (old != null) {
            old.cancelled.set(true);
            HttpURLConnection connection = old.connection;
            if (connection != null) {
                Thread cancel = new Thread(connection::disconnect, "IntroDB-cancel"); cancel.setDaemon(true); cancel.start();
            }
            Object controller = old.controller.get();
            if (foreground && old.review && controller != null) try {
                Class<?> timers = controller.getClass().getClassLoader().loadClass(NuvioNative.PLAYER_TIMERS_NAME);
                IntroUi.method(timers, "F", 1).invoke(null, controller);
                IntroUi.method(timers, "H", 1).invoke(null, controller);
            } catch (Exception error) { Log.e(TAG, "Native controls timer restart failed", error); }
        }
        changed();
    }
    public static void renderSettings(Object composer) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        IntroUi.method(composer.getClass(), "d0", 1).invoke(composer, 0x53494310);
        try {
            observe(loader);
            IntroUi.method(loader.loadClass(NuvioNative.SETTINGS_ROWS_NAME), "m", 13).invoke(null, "IntroDB segment submissions",
                "Show a playback button to mark segment start and end times, then review before submitting.", enabled(),
                IntroUi.click(loader, () -> { boolean value = !enabled(); prefs().edit().putBoolean("enabled", value).apply(); Log.d(TAG, "Submissions enabled=" + value); reset(); }),
                null, IntroUi.click(loader, () -> {}), false, null, 0L, false, composer, 0, 1008);
            String key = prefs().getString("key", "");
            IntroUi.row(composer, "IntroDB API key", "Enter or remove the API key used for segment submissions on this device.",
                key.isBlank() ? "Not set" : "Configured", () -> {
                    keyText = IntroUi.state(loader, prefs().getString("key", ""));
                    keyFocus = loader.loadClass(NuvioNative.FOCUS_REQUESTER_NAME).getDeclaredConstructor().newInstance();
                    keyFocused = IntroUi.state(loader, false);
                    changed();
                    Log.d(TAG, "Opening API key editor");
                });
            if (keyText != null) IntroUi.editor(composer, keyText, keyFocus, keyFocused, () -> {
                String value = ((String)IntroUi.get(keyText)).trim();
                if (value.contains("\n") || value.contains("\r")) return;
                prefs().edit().putString("key", value).apply(); Log.d(TAG, "API key saved; configured=" + !value.isEmpty()); keyText = null; keyFocus = null; keyFocused = null; reset();
            }, () -> { prefs().edit().putString("key", "").apply(); keyText = null; keyFocus = null; keyFocused = null; Log.d(TAG, "API key cleared"); reset(); },
                () -> { keyText = null; keyFocus = null; keyFocused = null; changed(); });
        } finally { IntroUi.method(composer.getClass(), "p", 1).invoke(composer, false); }
    }
    public static void renderControl(Object owner, Object composer) {
        try {
            ClassLoader loader = composer.getClass().getClassLoader();
            IntroUi.method(composer.getClass(), "d0", 1).invoke(composer, 0x53494311);
            try {
                observe(loader);
                if (!enabled()) { if (draft != null) reset(); return; }
                Object state = IntroUi.field(owner, "e");
                Object controller = IntroUi.field(IntroUi.field(owner, "c"), "Y");
                String video = (String)NuvioAccess.currentVideo(state);
                String media = video + "|" + NuvioAccess.currentSeason(state) + "|" + NuvioAccess.currentEpisode(state) + "|" + IntroUi.field(state, "i");
                if (draft != null && (draft.controller.get() != controller || !draft.media.equals(media))) reset();
                Submission target;
                try { target = new Submission(video, (Integer)NuvioAccess.currentSeason(state), (Integer)NuvioAccess.currentEpisode(state)); }
                catch (IllegalArgumentException unavailable) { return; }
                Object timeline = IntroUi.method(loader.loadClass("kotlinx.coroutines.flow.StateFlow"), "getValue", 0).invoke(IntroUi.field(controller, "H0"));
                if ((Boolean)IntroUi.field(timeline, "d")) { if (draft != null) reset(); return; }
                Draft current = draft;
                String label = current == null ? "Submit segment: mark start" : current.review ? "Submit segment: review" :
                    "Submit segment: mark end (start " + SegmentCapture.time(current.capture.start) + ")";
                Object icon = IntroIcons.icon(loader, current == null ? 0 : current.review ? 2 : 1);
                Object[] button = new Object[]{icon, null, label,
                    IntroUi.click(loader, () -> mark(controller, media, target, loader)), null, IntroUi.field(owner, "o"),
                    current == null || !current.busy, IntroUi.field(owner, "p"), IntroUi.field(owner, "q"), 0L, composer, 0, 530};
                boolean collected = false;
                try {
                    Class<?> customization = loader.loadClass("software.santodan.extension.nuviobuttons.NuvioPlaybackButtons");
                    collected = (Boolean)customization.getMethod("collectIntroDb", Object[].class).invoke(null, (Object)button);
                } catch (ClassNotFoundException standalone) { /* Independently selectable patch. */ }
                if (!collected) IntroUi.method(loader.loadClass(NuvioNative.PLAYER_CONTROLS_NAME), NuvioNative.NATIVE_BUTTON_METHOD, 13).invoke(null, button);
                if (current != null && current.review) renderReview(composer, current);
            } finally { IntroUi.method(composer.getClass(), "p", 1).invoke(composer, false); }
        } catch (Exception error) { Log.e(TAG, "Native IntroDB control failed", error); throw new IllegalStateException("Native IntroDB control failed", error); }
    }
    public static Object settingsIcon(ClassLoader loader) throws Exception { return IntroIcons.icon(loader, 0); }
    private static void mark(Object controller, String media, Submission target, ClassLoader loader) throws Exception {
        if (!enabled()) { reset(); return; }
        if (draft == null || draft.controller.get() != controller || !draft.media.equals(media)) { reset(); draft = new Draft(controller, media, target); }
        Draft current = draft;
        if (current.busy) return;
        if (prefs().getString("key", "").isBlank()) {
            current.status = "Set your IntroDB API key in Settings > Layout > Santodan-Patches > Playback."; openReview(current); changed(); return;
        }
        if (current.review) { changed(); return; }
        Long position = (Long)IntroUi.method(loader.loadClass(NuvioNative.PLAYER_POSITION_NAME), "e", 1).invoke(null, controller);
        try {
            if (position == null) throw new IllegalArgumentException("Playback position is unavailable.");
            boolean complete = current.capture.mark(position);
            Log.d(TAG, (complete ? "End" : "Start") + " captured positionMs=" + position);
            if (complete) openReview(current);
            current.status = "";
        } catch (IllegalArgumentException error) { current.status = error.getMessage(); openReview(current); }
        changed();
    }
    private static void openReview(Draft current) throws Exception {
        current.review = true;
        Object controller = current.controller.get();
        if (controller == null) return;
        // The full-screen pause overlay owns a separate job from controls hiding.
        // Use its native cancellation route to clear both the job and visibility.
        IntroUi.method(controller.getClass().getClassLoader().loadClass(NuvioNative.PLAYER_TIMERS_NAME), "i", 1).invoke(null, controller);
        Object job = IntroUi.field(controller, "T0");
        if (job != null) try {
            ClassLoader loader = controller.getClass().getClassLoader();
            java.lang.reflect.Method cancel = loader.loadClass("kotlinx.coroutines.Job$DefaultImpls").getDeclaredMethod("cancel$default",
                loader.loadClass("kotlinx.coroutines.Job"), java.util.concurrent.CancellationException.class, int.class, Object.class);
            cancel.setAccessible(true); cancel.invoke(null, job, null, 1, null);
        } catch (ReflectiveOperationException error) {
            Log.e(TAG, "Cannot suspend controls timer for review", error);
        }
        Log.d(TAG, "Opening native segment review");
    }
    private static void renderReview(Object composer, Draft current) throws Exception {
        IntroUi.dialog(composer, "Submit segment to IntroDB", current.target.imdb + " · Season " + current.target.season + " · Episode " + current.target.episode,
            NuvioIntroDb::reset, nested -> {
                if (current.capture.start >= 0) IntroUi.label(nested, "Start: " + SegmentCapture.time(current.capture.start));
                if (current.capture.end >= 0) IntroUi.label(nested, "End: " + SegmentCapture.time(current.capture.end));
                IntroUi.label(nested, "Segment: " + current.type + (current.status.isBlank() ? "" : "\n" + current.status));
                IntroUi.dropdown(nested, current.type, current.picker, !current.busy && !current.accepted,
                    expanded -> { current.picker = expanded; changed(); },
                    type -> { current.type = type; current.picker = false; changed(); });
                IntroUi.actions(nested, current.busy ? "Submitting…" : "Submit", !current.busy && !current.accepted && current.capture.end > current.capture.start,
                    () -> submit(current), current.accepted ? "Close" : "Cancel", NuvioIntroDb::reset);
            });
    }
    private static void submit(Draft current) throws Exception {
        if (draft != current || current.cancelled.get() || !enabled() || current.busy || current.accepted) return;
        String key = prefs().getString("key", "").trim();
        if (key.isEmpty()) { current.status = "Set your IntroDB API key in Settings."; changed(); return; }
        final String payload = current.target.json(current.capture.start, current.capture.end, current.type);
        if (!sending.compareAndSet(false, true)) { current.status = "A previous submission is finishing. Try again shortly."; changed(); return; }
        current.busy = true; current.status = "Submitting…"; changed();
        Log.d(TAG, "Submitting segment type=" + current.type + " startMs=" + current.capture.start + " endMs=" + current.capture.end);
        try {
            worker.execute(() -> {
                IntroDbClient.Result response = null;
                try { response = IntroDbClient.submit(key, payload, current.cancelled::get, c -> current.connection = c); }
                catch (Exception error) { Log.w(TAG, "Submission unconfirmed; error=" + error.getClass().getSimpleName()); }
                finally { sending.set(false); }
                final int code = response == null ? -1 : response.code;
                final String reason = response == null ? "" : response.error;
                main.post(() -> {
                    if (current.cancelled.get() || draft != current) return;
                    current.busy = false; current.accepted = code == 200 || code == 201;
                    Log.d(TAG, "Submission completed HTTP=" + code + " accepted=" + current.accepted);
                    current.status = current.accepted ? "Submitted successfully." : code == 401 || code == 403 ? "IntroDB rejected the API key. Update it in Settings." :
                        code < 0 ? "Submission could not be confirmed. Check IntroDB before retrying." : "IntroDB rejected the submission (HTTP " + code + ")." +
                            (reason.isEmpty() ? "" : "\n" + reason);
                    changed();
                });
            });
        } catch (RejectedExecutionException error) { sending.set(false); current.busy = false; current.status = "Submission worker is busy. Try again shortly."; changed(); }
    }
}
