package app.mahirsn.extension.youtube.history;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.youtube.addon.AddOnApi;
import app.morphe.extension.youtube.patches.VideoInformation;
import app.morphe.extension.youtube.shared.PlayerType;
import app.morphe.extension.youtube.shared.VideoState;

/**
 * Keeps the watch history and resume positions on a server of your own, the way YouTube's own
 * history does, so YouTube's history can stay off.
 * <p>
 * Reports the video that plays (id, title, channel, position, length) every few seconds and when
 * playback pauses, ends or moves to another video, and offers to continue a reopened video where
 * it was left. Shorts and the muted previews that play in the feeds are left out. Runs on the
 * Morphe Patches add-on hooks; all network calls are off the main thread and failures are silent,
 * so a server that is down never affects playback.
 */
@SuppressWarnings("unused")
public final class WatchHistory {
    private static final String TAG = "WatchHistory";
    private static final long REPORT_EVERY_MS = 10_000;
    private static final long RESUME_MIN_MS = 15_000;   // not from the first seconds…
    private static final long RESUME_END_MS = 20_000;   // …nor from the credits
    private static final long RESUME_WINDOW_MS = 5_000; // only right after the video starts
    private static final long PROMPT_SHOWN_MS = 15_000;

    /** Settings, in Morphe settings > Personal history. Keys match the preferences WatchHistoryPatch adds. */
    static final class Prefs {
        static final BooleanSetting ASK = new BooleanSetting("mahirsn_history_resume_ask", true);
        static final BooleanSetting BUTTON = new BooleanSetting("mahirsn_history_resume_button", true);
        // The navigation bar is built once, so these take effect after a restart.
        static final BooleanSetting TAB_SHORTS = new BooleanSetting("mahirsn_history_tab_shorts", false, true);
        static final BooleanSetting TAB_HOME = new BooleanSetting("mahirsn_history_tab_home", false, true);
    }

    private static final AtomicBoolean registered = new AtomicBoolean();
    static final ExecutorService io = Executors.newSingleThreadExecutor();
    static final Handler main = new Handler(Looper.getMainLooper());

    // Main thread only (all add-on hooks run there).
    private static String videoId;
    private static String title = "";
    private static String channel = "";
    private static long timeMs, lengthMs, lastReportAt;
    private static boolean resumeChecked;
    private static String resumeFor;      // video the saved position belongs to
    private static long resumeAtMs;
    private static WeakReference<View> playerView = new WeakReference<>(null);
    private static ResumeChip prompt;

    /** The server, set when patching. */
    static String serverUrl() {
        return "";
    }

    /** The token the server expects in X-Token, set when patching. */
    static String token() {
        return "";
    }

    /** Injection point: called from AddOnManager.registerAddOns() of Morphe Patches. */
    public static void register() {
        if (!registered.compareAndSet(false, true) || serverUrl().isEmpty()) return;
        Prefs.ASK.get(); // registers the settings before the settings screen can open
        AddOnApi.addVideoIdListener(WatchHistory::onVideoId);
        AddOnApi.addVideoTimeListener(WatchHistory::onVideoTime);
        AddOnApi.addVideoStateListener(WatchHistory::onVideoState);
        AddOnApi.addPlayerOverlayButtonsListener(v -> onPlayerButtons((View) v));
        AddOnApi.addLegacyPlayerControlsListener(v -> onLegacyControls((View) v));
    }

    // --- reporting ----------------------------------------------------------------------------

    private static void onVideoId(String id) {
        if (id == null || id.isEmpty() || id.equals(videoId)) return;
        flush(false);
        dismissPrompt();
        videoId = id;
        title = "";
        channel = "";
        timeMs = lengthMs = lastReportAt = 0;
        resumeChecked = false;
        resumeFor = null;
        if (VideoInformation.lastVideoIdIsShort()) return;

        final String asked = id;
        io.execute(() -> {
            String body = request("GET", "/progress/" + asked, null);
            if (body == null) return;
            long pos = (long) (number(body, "pos") * 1000);
            long len = (long) (number(body, "len") * 1000);
            main.post(() -> {
                if (!asked.equals(videoId) || pos <= RESUME_MIN_MS || (len > 0 && pos >= len - RESUME_END_MS)) return;
                resumeFor = asked;
                resumeAtMs = pos;
                if (Prefs.ASK.get()) showPrompt(0);
            });
        });
    }

    /** The watch player is on screen (in any size), not a feed preview or a Short. */
    private static boolean onWatchPlayer() {
        String type = PlayerType.getCurrent().name();
        return type.startsWith("WATCH_WHILE") || type.equals("VIRTUAL_REALITY_FULLSCREEN");
    }

    private static void onVideoTime(long time) {
        // A preview never gets a position, so flush() never reports it either.
        if (videoId == null || VideoInformation.lastVideoIdIsShort() || !onWatchPlayer()) return;
        timeMs = time;
        long length = VideoInformation.getVideoLength();
        if (length > 0) lengthMs = length;
        String t = VideoInformation.getVideoTitle();
        if (t != null && !t.isEmpty()) title = t;
        String c = VideoInformation.getChannelName();
        if (c != null && !c.isEmpty()) channel = c;

        if (!resumeChecked && videoId.equals(resumeFor)) {
            resumeChecked = true;
            if (!Prefs.ASK.get() && time < RESUME_WINDOW_MS) {
                VideoInformation.seekTo(resumeAtMs);
                return;
            }
        }

        long now = System.currentTimeMillis();
        if (now - lastReportAt >= REPORT_EVERY_MS) {
            lastReportAt = now;
            report(true);
        }
    }

    private static void onVideoState(VideoState state) {
        if (state == VideoState.PAUSED || state == VideoState.ENDED) flush(false);
    }

    /** Reports the current video now, if there is one worth reporting. */
    private static void flush(boolean playing) {
        if (videoId != null && timeMs > 0 && !VideoInformation.lastVideoIdIsShort()) report(playing);
    }

    private static void report(boolean playing) {
        final String json = "{\"id\":" + quote(videoId)
                + ",\"title\":" + quote(title)
                + ",\"channel\":" + quote(channel)
                + ",\"pos\":" + (timeMs / 1000.0)
                + ",\"len\":" + (lengthMs / 1000.0)
                + ",\"playing\":" + playing + "}";
        io.execute(() -> request("POST", "/progress", json));
    }

    // --- continuing where it was left ---------------------------------------------------------

    /** Whether the current video has a saved position ahead of where it plays now. */
    private static boolean canResume() {
        return videoId != null && videoId.equals(resumeFor) && resumeAtMs > timeMs + 3_000;
    }

    private static void resume() {
        dismissPrompt();
        if (canResume()) VideoInformation.seekTo(resumeAtMs);
    }

    /** "Keep watching · 12:34" in the player for a few seconds, styled like YouTube's "Skip ad". */
    private static void showPrompt(int attempt) {
        View player = playerRoot();
        if (player == null) {
            // The player is laid out a moment after the video starts.
            if (attempt < 60) main.postDelayed(() -> showPrompt(attempt + 1), 250);
            else Log.i(TAG, "prompt: no player view");
            return;
        }
        if (!canResume() || !onWatchPlayer()) {
            Log.i(TAG, "prompt: not now, " + PlayerType.getCurrent() + " at " + timeMs + " of " + resumeAtMs);
            return;
        }
        dismissPrompt();
        Context ctx = player.getContext();
        String label = Ui.str(ctx, "keep_watching", "Keep watching") + " · " + Ui.clock(resumeAtMs);
        ResumeChip chip = new ResumeChip(ctx, label, WatchHistory::resume);
        if (!chip.attach(player)) {
            Log.i(TAG, "prompt: no place in the player");
            return;
        }
        prompt = chip;
        main.postDelayed(() -> { if (prompt == chip) dismissPrompt(); }, PROMPT_SHOWN_MS);
    }

    /**
     * The window the player is in, once the player's overlay exists there. The player controls
     * (and with them the button listeners) are only created when the controls are first shown,
     * so the current activity is the way in until then.
     */
    private static View playerRoot() {
        View known = playerView.get();
        View root = known != null && known.isAttachedToWindow() ? known.getRootView() : null;
        if (root == null) {
            try {
                Object activity = Class.forName("app.morphe.extension.shared.Utils").getMethod("getActivity").invoke(null);
                if (activity instanceof android.app.Activity) root = ((android.app.Activity) activity).getWindow().getDecorView();
            } catch (Throwable ignored) {
            }
        }
        if (root == null) return null;
        return Ui.find(root, "morphe_sb_skip_sponsor_button") != null || Ui.find(root, "youtube_controls_overlay") != null
                ? root : null;
    }

    private static void dismissPrompt() {
        ResumeChip p = prompt;
        prompt = null;
        if (p != null) p.detach();
    }

    // --- the player button --------------------------------------------------------------------

    /** Whether the player uses the old style buttons (Morphe's "Restore old player buttons"). */
    private static boolean legacyButtons() {
        try {
            return Class.forName("app.morphe.extension.youtube.patches.LegacyPlayerControlsPatch")
                    .getField("RESTORE_OLD_PLAYER_BUTTONS").getBoolean(null);
        } catch (Throwable e) {
            return false;
        }
    }

    private static final View.OnClickListener RESUME_CLICK = v -> {
        if (canResume()) resume();
        else Toast.makeText(v.getContext(), Ui.str(v.getContext(), "keep_watching", "Keep watching")
                + ": –", Toast.LENGTH_SHORT).show();
    };

    private static final View.OnLongClickListener HISTORY_LONG_CLICK = v -> {
        HistoryDialog.show(v.getContext());
        return true;
    };

    /**
     * The button goes where Morphe puts its own player buttons, in whichever style the player
     * uses, so it looks and hides like them. The calls go through reflection because their
     * signatures hold Android types, which the compile-only stubs leave out; the patch checks
     * both exist before it patches anything.
     */
    private static void onPlayerButtons(View sourceButton) {
        playerView = new WeakReference<>(sourceButton);
        if (legacyButtons() || !Prefs.BUTTON.get()) return;
        try {
            Class.forName("app.morphe.extension.youtube.videoplayer.PlayerOverlayButton")
                    .getMethod("addButton", View.class, String.class,
                            View.OnClickListener.class, View.OnLongClickListener.class)
                    .invoke(null, sourceButton, "mahirsn_history_resume_bold", RESUME_CLICK, HISTORY_LONG_CLICK);
        } catch (Throwable e) {
            Log.i(TAG, "player button: " + e);
        }
    }

    private static void onLegacyControls(View controls) {
        playerView = new WeakReference<>(controls);
        if (!legacyButtons()) return;
        try {
            Class.forName("app.morphe.extension.youtube.addon.AddOnApi")
                    .getMethod("createLegacyButton", String.class, View.class, String.class,
                            BooleanSetting.class, View.OnClickListener.class, View.OnLongClickListener.class)
                    .invoke(null, "mahirsn_history", controls, "mahirsn_history_resume",
                            Prefs.BUTTON, RESUME_CLICK, HISTORY_LONG_CLICK);
        } catch (Throwable e) {
            Log.i(TAG, "legacy button: " + e);
        }
    }

    // --- History in place of a navigation bar button -----------------------------------------

    /**
     * Injection point: NavigationBar.navigationTabCreatedCallback() of Morphe Patches, after the
     * code other patches add there (so a Shorts button hidden by Morphe comes back when the user
     * chose to turn it into History).
     */
    public static void navigationTabCreated(Enum<?> button, View tab) {
        try {
            String name = button.name();
            if (!(name.equals("SHORTS") && Prefs.TAB_SHORTS.get()) && !(name.equals("HOME") && Prefs.TAB_HOME.get())) {
                return;
            }
            tab.setVisibility(View.VISIBLE);
            tab.post(() -> makeHistoryTab(tab));
        } catch (Exception e) {
            Log.i(TAG, "tab: " + e);
        }
    }

    @SuppressLint("ClickableViewAccessibility")
    private static void makeHistoryTab(View view) {
        // The hook may hand over the icon rather than the whole button.
        View tab = view;
        while (!tab.isClickable() && tab.getParent() instanceof View) tab = (View) tab.getParent();
        tab.setVisibility(View.VISIBLE);
        Context ctx = tab.getContext();
        String label = Ui.str(ctx, "morphe_change_start_page_entry_history", "History");
        tab.setContentDescription(label);

        if (tab instanceof ViewGroup) {
            // YouTube's own history icon, tinted by the theme like the other buttons.
            ImageView icon = Ui.find((ViewGroup) tab, ImageView.class);
            TextView text = Ui.find((ViewGroup) tab, TextView.class);
            int res = Ui.id(ctx, "drawable", "yt_outline_experimental_history_vd_theme_24");
            if (res == 0) res = Ui.id(ctx, "drawable", "mahirsn_history_tab");
            final int historyIcon = res;
            if (icon != null && historyIcon != 0) {
                icon.setImageResource(historyIcon);
                android.graphics.drawable.Drawable[] ours = {icon.getDrawable()};
                // The app sets the button's own icon again whenever the selected button changes
                // (a filled Home when Home is the start page); put History back before drawing.
                View clickTarget = tab;
                icon.getViewTreeObserver().addOnPreDrawListener(() -> {
                    if (icon.getDrawable() != ours[0]) {
                        icon.setImageResource(historyIcon);
                        ours[0] = icon.getDrawable();
                        // Rebinding the button also gives it the app's click handler again.
                        clickTarget.setOnClickListener(OPEN_HISTORY);
                    }
                    return true;
                });
            }
            if (text != null) text.setText(label);
        }

        // The navigation bar handles touches itself rather than through each button, so the
        // taps on this button are taken at the bar, before it would open Shorts or Home.
        View bar = tab;
        while (bar.getParent() instanceof View && Ui.id(ctx, "id", "pivot_bar") != bar.getId()) bar = (View) bar.getParent();
        if (Ui.id(ctx, "id", "pivot_bar") != bar.getId()) bar = (View) tab.getParent();
        historyTabs.add(new WeakReference<>(tab));
        // The app may deliver the tap as a click on the button (performClick) rather than as touches.
        tab.setOnClickListener(OPEN_HISTORY);
        tab.setOnTouchListener((v, e) -> {
            if (e.getActionMasked() == MotionEvent.ACTION_UP) HistoryDialog.show(v.getContext());
            return true;
        });
        if (bar != null && bar.getTag(TAG_KEY) == null) {
            bar.setTag(TAG_KEY, true);
            bar.setOnTouchListener((v, e) -> {
                View hit = historyTabAt(e.getRawX(), e.getRawY());
                if (hit == null) return false;
                if (e.getActionMasked() == MotionEvent.ACTION_UP) HistoryDialog.show(v.getContext());
                return true;
            });
        }
    }

    private static final View.OnClickListener OPEN_HISTORY = v -> {
        HistoryDialog.show(v.getContext());
    };

    private static final int TAG_KEY = 0x6d61686e; // any id outside the app's
    private static final java.util.List<WeakReference<View>> historyTabs = new java.util.ArrayList<>();

    private static View historyTabAt(float x, float y) {
        int[] at = new int[2];
        for (WeakReference<View> ref : historyTabs) {
            View t = ref.get();
            if (t == null || !t.isShown()) continue;
            t.getLocationOnScreen(at);
            if (x >= at[0] && x < at[0] + t.getWidth() && y >= at[1] && y < at[1] + t.getHeight()) return t;
        }
        return null;
    }

    // --- helpers ------------------------------------------------------------------------------

    static String request(String method, String path, String json) {
        HttpURLConnection c = null;
        try {
            c = (HttpURLConnection) new URL(serverUrl() + path).openConnection();
            c.setRequestMethod(method);
            c.setConnectTimeout(5000);
            c.setReadTimeout(10000);
            c.setRequestProperty("X-Token", token());
            if (json != null) {
                c.setDoOutput(true);
                c.setRequestProperty("Content-Type", "application/json");
                try (OutputStream out = c.getOutputStream()) {
                    out.write(json.getBytes(StandardCharsets.UTF_8));
                }
            }
            if (c.getResponseCode() != 200) return null;
            try (InputStream in = c.getInputStream()) {
                ByteArrayOutputStream buf = new ByteArrayOutputStream();
                byte[] chunk = new byte[4096];
                for (int n; (n = in.read(chunk)) > 0; ) buf.write(chunk, 0, n);
                return buf.toString("UTF-8");
            }
        } catch (Exception e) {
            Log.i(TAG, method + " " + path + ": " + e);
            return null;
        } finally {
            if (c != null) c.disconnect();
        }
    }

    private static double number(String json, String key) {
        int i = json.indexOf("\"" + key + "\"");
        if (i < 0) return 0;
        i = json.indexOf(':', i) + 1;
        int j = i;
        while (j < json.length() && "0123456789.-eE+ ".indexOf(json.charAt(j)) >= 0) j++;
        try {
            return Double.parseDouble(json.substring(i, j).trim());
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private static String quote(String s) {
        StringBuilder b = new StringBuilder("\"");
        for (char ch : (s == null ? "" : s).toCharArray()) {
            if (ch == '"' || ch == '\\') b.append('\\').append(ch);
            else if (ch < 0x20) b.append(String.format("\\u%04x", (int) ch));
            else b.append(ch);
        }
        return b.append('"').toString();
    }

    private WatchHistory() {
    }
}
