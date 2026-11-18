package app.revanced.extension.rif;

import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.SystemClock;
import android.os.Build;
import android.util.Log;
import android.util.TypedValue;
import android.view.GestureDetector;
import android.view.Gravity;
import android.view.DisplayCutout;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.RoundedCorner;
import android.view.WindowInsets;
import android.webkit.WebView;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListPopupWindow;
import android.widget.Spinner;
import android.widget.TextView;

import org.json.JSONException;
import org.json.JSONObject;

import java.lang.ref.WeakReference;
import java.util.Locale;

/**
 * Helpers for the "YouTube player controls" patch. rif draws no controls of its own for
 * YouTube: it puts android-youtube-player's default overlay over the iframe (controls=0), so
 * everything here drives the iframe's JS API through the player WebView.
 *
 * <ul>
 * <li>double-tap the left/right half: seek -10 s / +10 s (more taps in a row add more);</li>
 * <li>hold: 2x speed until released;</li>
 * <li>a gear button (top right) opening a popup like rif's own video player's: speed, captions;</li>
 * <li>playerVars: captions on by default.</li>
 * </ul>
 */
public final class YouTubePlayerControls {

    private static final String TAG = "RifYouTubeControls";
    private static final int SEEK_SECONDS = 10;
    /** Taps within this time of a seek count as more seeks (YouTube style). */
    private static final long CHAIN_MS = 800;
    private static final long FADE_MS = 300;
    /**
     * YouTube's caption fontSize option ("fontSizeIncrement", clamped to -2..4, fractions work): the
     * text is (1 + 0.25 * n) times the default, and the default scales with the video's width, so
     * the size in dp is the same for any player once n is picked from the player's size (measured).
     */
    private static final float CAPTION_MAX_STEP = 4f;
    /** Where YouTube puts the bottom of the caption box: this fraction of the player's height (measured). */
    private static final float CAPTION_BOTTOM = 0.98f;
    /** Aspect ratios (width / height) by video id. */
    private static final java.util.Map<String, Float> ASPECTS = new java.util.concurrent.ConcurrentHashMap<>();

    private YouTubePlayerControls() {}

    /** Hook B: the iframe's playerVars. */
    public static void playerVars(JSONObject vars) {
        try {
            // Whether captions show is decided per video (Controls.wantCaptions), not here.
            if (vars == null || !(Settings.youtubeCaptionsLandscape() || Settings.youtubeCaptionsVertical()
                    || Settings.youtubeCaptionsShorts())) {
                return;
            }
            vars.put("cc_lang_pref", Locale.getDefault().getLanguage());
        } catch (JSONException | RuntimeException ignored) {
        }
    }

    /** The newest player's controls (one player is on screen at a time). */
    private static volatile WeakReference<Controls> current = new WeakReference<>(null);

    /** Hook C: the page's {@code sendStateChange(state)} (runs on a JS-bridge thread). */
    public static void onState(String state) {
        Controls c = current.get();
        if (c != null && state != null) c.stateChanged(state);
    }

    /** Hook C: the page's {@code sendError(error)} (runs on a JS-bridge thread). */
    public static void onError() {
        Controls c = current.get();
        if (c != null) c.stateChanged("ERROR");
    }

    /** Hook A: the control overlay {@code ui} was just attached to {@code player}. */
    public static void onPlayerUi(ViewGroup player, View ui) {
        try {
            if (player.getChildCount() < 1 || !(player.getChildAt(0) instanceof WebView)
                    || !(ui instanceof ViewGroup)) {
                return;
            }
            new Controls((WebView) player.getChildAt(0), (ViewGroup) ui).install();
        } catch (Throwable t) {
            Log.w(TAG, "install failed", t);
        }
    }

    private static int resource(Context ctx, String name, String type) {
        return ctx.getResources().getIdentifier(name, type, ctx.getPackageName());
    }

    private static int dp(Context ctx, float v) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v,
                ctx.getResources().getDisplayMetrics()));
    }

    /** One player's controls. All methods run on the main thread. */
    private static final class Controls {
        private final WebView web;
        private final ViewGroup ui;
        private final Context ctx;

        private View panel;
        private final TextView[] podLabels = new TextView[2]; // 0 = rewind (left), 1 = fast forward (right)
        private final View[] pods = new View[2];
        private TextView fastLabel;

        private int ratePercent = 100;
        /** Set once the popup changed captions: the page still reports the last track after "off". */
        private Boolean captionsChoice;
        private View playButton;
        private boolean ended;
        /** Last fontSize sent (NaN = send again). */
        private float captionStep = Float.NaN;
        /** Captions are meant to be showing (setting, or the popup for this video). */
        private boolean captionsOn;
        /** No PLAYING seen yet for the current video: apply the setting on the first one. */
        private boolean freshVideo = true;
        private int liftTop = -1, liftBottom = -1;
        /** The setting was applied to this video (first PLAYING), and the popup hasn't overridden it. */
        private boolean settingApplied, userChose;
        /** The current video's id and aspect ratio (width / height; 0 = not known yet). */
        private String videoId;
        private float aspect;
        private int[] bases;
        private long chainUntil;
        private int chainDir;
        private int chainSeconds;
        private boolean chainDown;
        private boolean tapMoved;
        private float downX, downY;
        private long downTime;
        private boolean fast;
        private final Runnable hidePods = this::fadePods;

        Controls(WebView web, ViewGroup ui) {
            this.web = web;
            this.ui = ui;
            this.ctx = ui.getContext();
        }

        void install() {
            panel = ui.findViewById(resource(ctx, "panel", "id"));
            if (panel == null) return;
            addFeedback();
            addGestures();
            addSettingsButton();
            // The library's own blue spinner would sit next to YouTube's white one in the page.
            View progress = ui.findViewById(resource(ctx, "progress", "id"));
            if (progress != null) progress.setAlpha(0f);
            playButton = ui.findViewById(resource(ctx, "play_pause_button", "id"));
            captionsOn = wantCaptions();
            current = new WeakReference<>(this);
            // Padding set inside a layout pass wouldn't be laid out, so do the work one turn later.
            ui.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> ui.post(() -> {
                try {
                    applyInsets();
                    applyCaptionSize();
                    updateLift();
                } catch (Throwable e) {
                    Log.w(TAG, "layout update failed", e);
                }
            }));
        }

        // ---- player state ----

        /** Runs on a bridge thread. */
        void stateChanged(final String state) {
            // The library's own listener reacts to the same event through a post to the main
            // thread queued after ours, so wait one more turn to run after it.
            ui.post(() -> ui.post(() -> {
                try {
                    applyState(state);
                } catch (Throwable t) {
                    Log.w(TAG, "applyState failed", t);
                }
            }));
        }

        private void applyState(String state) {
            // Like rif's in-app browser (v1.n0): keep the screen on only while video runs.
            queryVideo();
            ui.setKeepScreenOn("PLAYING".equalsIgnoreCase(state) || "BUFFERING".equalsIgnoreCase(state));
            ended = "ENDED".equalsIgnoreCase(state);
            // YouTube draws its own replay icon at the end; ours would sit on top of it.
            if (ended && playButton != null) playButton.setVisibility(View.INVISIBLE);
            if ("UNSTARTED".equalsIgnoreCase(state) || "CUED".equalsIgnoreCase(state)) {
                freshVideo = true;
                settingApplied = false;
                userChose = false;
                // YouTube remembers the viewer's last caption choice (also from the popup); the
                // settings decide for every video. "On" needs the module, so that waits for PLAYING.
                if (!wantCaptions()) setCaptions(false);
            }
            if ("PLAYING".equalsIgnoreCase(state)) {
                if (freshVideo) {
                    freshVideo = false;
                    boolean want = wantCaptions();
                    captionsChoice = want;
                    settingApplied = true;
                    setCaptions(want);
                }
                captionStep = Float.NaN; // force a resend: the page may have reset it
                applyCaptionSize();
            }
        }

        private void replay() {
            ended = false;
            js("player.seekTo(0,true);player.playVideo()");
        }

        // ---- captions on or off for a video ----

        /**
         * Which "captions on by default" setting applies: a Shorts link first, then a video known to
         * be vertical, else landscape (also when the shape isn't known yet; see reapplyForShape).
         */
        private boolean wantCaptions() {
            if (isShortsLink()) return Settings.youtubeCaptionsShorts();
            if (aspect > 0f && aspect < 1f) return Settings.youtubeCaptionsVertical();
            return Settings.youtubeCaptionsLandscape();
        }

        /**
         * The link rif was opened with: its browser fragment keeps the Uri in its arguments
         * (string keys, not obfuscated). The toolbar's address text is only a fallback.
         */
        private boolean isShortsLink() {
            try {
                // A fragment's root view carries the fragment as a tag (androidx, resource id name kept).
                Object fragment = null;
                int tagId = resource(ctx, "fragment_container_view_tag", "id");
                for (View v = ui; v != null && fragment == null; v = v.getParent() instanceof View ? (View) v.getParent() : null) {
                    fragment = v.getTag(tagId);
                }
                Class<?> c = fragment == null ? null : fragment.getClass();
                while (c != null && !"androidx.fragment.app.Fragment".equals(c.getName())) c = c.getSuperclass();
                if (c != null) {
                    // getArguments() is obfuscated: take the Bundle getters (the class has only that one without parameters).
                    for (java.lang.reflect.Method m : c.getDeclaredMethods()) {
                        if (m.getReturnType() != android.os.Bundle.class || m.getParameterTypes().length != 0) continue;
                        m.setAccessible(true);
                        android.os.Bundle args = (android.os.Bundle) m.invoke(fragment);
                        if (args == null) continue;
                        for (String key : new String[] {"com.andrewshu.android.reddit.KEY_URI",
                                "com.andrewshu.android.reddit.KEY_MODIFIED_URI"}) {
                            Object uri = args.get(key);
                            if (uri != null) {
                                return String.valueOf(uri).contains("/shorts/");
                            }
                        }
                    }
                }
            } catch (Throwable ignored) {
            }
            try {
                View t = ui.getRootView().findViewById(resource(ctx, "subtitle_text", "id"));
                return t instanceof TextView && String.valueOf(((TextView) t).getText()).contains("/shorts/");
            } catch (RuntimeException e) {
                return false;
            }
        }

        /** The shape arrived after the setting was applied: re-decide unless the popup was used. */
        private void reapplyForShape() {
            if (!settingApplied || userChose) return;
            boolean want = wantCaptions();
            if (want == captionsOn) return;
            captionsChoice = want;
            setCaptions(want);
        }

        // ---- captions size ----

        /**
         * The fontSize step that makes captions as big as in landscape full screen. YouTube sizes
         * them from the video's width (assumed 16:9: the smaller of the player's width and 16/9 of
         * its height); in landscape full screen that is 16/9 of the screen's short side. So a
         * portrait player gets about 3.1, landscape full screen 0, a landscape player with
         * the toolbar about 1.2.
         */
        private float wantStep() {
            int w = ui.getWidth(), h = ui.getHeight();
            if (w <= 0 || h <= 0) return 0f;
            float content = Math.min(w, h * 16f / 9f);
            float reference = shortSide() * 16f / 9f;
            float step = CAPTION_MAX_STEP * (reference / content - 1f);
            return Math.round(Math.max(0f, Math.min(CAPTION_MAX_STEP, step)) * 100f) / 100f;
        }

        private int shortSide() {
            if (Build.VERSION.SDK_INT >= 30) {
                android.view.WindowManager wm = ctx.getSystemService(android.view.WindowManager.class);
                if (wm != null) {
                    android.graphics.Rect r = wm.getMaximumWindowMetrics().getBounds();
                    return Math.min(r.width(), r.height());
                }
            }
            android.util.DisplayMetrics dm = ctx.getResources().getDisplayMetrics();
            return Math.min(dm.widthPixels, dm.heightPixels);
        }

        void applyCaptionSize() {
            float step = wantStep();
            if (step == captionStep) return;
            captionStep = step;
            setCaptionSize();
        }

        private void setCaptionSize() {
            // Doesn't switch captions on or off; the page keeps it per module load.
            js("player.setOption('captions','fontSize'," + (Float.isNaN(captionStep) ? 0 : captionStep) + ")");
        }

        // ---- lifting the captions above the controls ----

        /** The page's current video id; a new one means its aspect ratio is needed for the lift. */
        private void queryVideo() {
            web.evaluateJavascript("(function(){try{return player.getVideoData().video_id||''}catch(e){return ''}})()", value -> {
                try {
                    String id = value == null ? "" : value.replace("\"", "");
                    if (id.isEmpty() || id.equals(videoId)) return;
                    videoId = id;
                    Float known = ASPECTS.get(id);
                    aspect = known == null ? 0f : known;
                    updateLift();
                    reapplyForShape();
                    if (known == null) fetchAspect(id);
                } catch (Throwable t) {
                    Log.w(TAG, "queryVideo failed", t);
                }
            });
        }

        /**
         * The iframe API doesn't give a video's shape, and oEmbed reports 16:9 for everything. The
         * "original aspect ratio" thumbnails exist only for videos that aren't 16:9 (Shorts, 4:3).
         * Both missing (404) means 16:9. Anything else (offline, errors) leaves it unknown, and an
         * unknown shape never gets a lift.
         */
        private void fetchAspect(final String id) {
            new Thread(() -> {
                float a = 0f;
                try {
                    boolean absent = true;
                    for (String name : new String[] {"oardefault", "oar2"}) {
                        java.net.HttpURLConnection c = (java.net.HttpURLConnection) new java.net.URL(
                                "https://i.ytimg.com/vi/" + id + "/" + name + ".jpg").openConnection();
                        c.setConnectTimeout(5000);
                        c.setReadTimeout(5000);
                        try {
                            int code = c.getResponseCode();
                            if (code == 200) {
                                android.graphics.BitmapFactory.Options o = new android.graphics.BitmapFactory.Options();
                                o.inJustDecodeBounds = true;
                                android.graphics.BitmapFactory.decodeStream(c.getInputStream(), null, o);
                                if (o.outWidth > 0 && o.outHeight > 0) a = (float) o.outWidth / o.outHeight;
                                absent = false;
                                break;
                            } else if (code != 404) {
                                return;
                            }
                        } finally {
                            c.disconnect();
                        }
                    }
                    if (absent) a = 16f / 9f;
                } catch (Throwable t) {
                    return;
                }
                if (a <= 0f) return;
                final float found = a;
                if (ASPECTS.size() > 64) ASPECTS.clear();
                ASPECTS.put(id, found);
                ui.post(() -> {
                    try {
                        if (id.equals(videoId)) {
                            aspect = found;
                            updateLift();
                            reapplyForShape();
                        }
                    } catch (Throwable t) {
                        Log.w(TAG, "aspect update failed", t);
                    }
                });
            }, "RifYtAspect").start();
        }

        /**
         * YouTube puts captions at the bottom of its iframe and lifts them itself only when its
         * own controls are up (rif hides those: controls=0), so our bottom row covers them. The
         * iframe is cross-origin, but its element is ours: shrink it, so the captions clear the
         * bottom row. This is permanent (no change when the controls show or hide) and never
         * resizes the picture: it uses only the spare room around the video (known aspect ratio),
         * from both sides if that is enough (the picture doesn't move), else from the bottom (the
         * picture moves up by half). No room, an unknown shape, or landscape: no lift.
         */
        private void updateLift() {
            int top = 0, bottom = 0;
            View seek = ui.findViewById(resource(ctx, "youtube_player_seekbar", "id"));
            int w = ui.getWidth(), h = ui.getHeight();
            if (captionsOn && aspect > 0f && w > 0 && h > w) {
                float room = h - Math.min(h, w / aspect);
                float barH = seek != null && seek.getParent() instanceof View && ((View) seek.getParent()).getHeight() > 0
                        ? ((View) seek.getParent()).getHeight() : dp(ctx, 40);
                float target = h - barH - dp(ctx, 6);
                float have = CAPTION_BOTTOM * h;
                if (room >= 2f && have > target) {
                    float both = (have - target) / (2f * CAPTION_BOTTOM - 1f);
                    if (room >= 2f * both) {
                        top = Math.round(both);
                        bottom = top;
                    } else {
                        bottom = Math.round(Math.min(room, (have - target) / CAPTION_BOTTOM));
                    }
                }
            }
            if (top == liftTop && bottom == liftBottom) return;
            liftTop = top;
            liftBottom = bottom;
            float d = ctx.getResources().getDisplayMetrics().density;
            js("(function(t,b){var f=document.querySelector('iframe');if(!f)return;var s=f.style;"
                    + "s.position='absolute';s.left='0';s.width='100%';"
                    + "s.top=t+'px';s.height='calc(100% - '+(t+b)+'px)'})("
                    + (top / d) + "," + (bottom / d) + ")");
        }

        // ---- rounded corners and cutouts ----

        /** Horizontal distance from the screen edge still hidden by a rounded corner, d from the other edge. */
        static float cornerInset(float radius, float d) {
            if (radius <= 0 || d >= radius) return 0;
            float dy = radius - d;
            return radius - (float) Math.sqrt(radius * radius - dy * dy);
        }

        @android.annotation.TargetApi(31) // only called under an SDK_INT >= 31 check
        private int corner(WindowInsets wi, int position, float d) {
            RoundedCorner c = wi.getRoundedCorner(position);
            return c == null ? 0 : Math.round(cornerInset(c.getRadius(), d));
        }

        /** Pad the top and bottom rows by the rounded corners and the cutout, where the player touches them. */
        private void applyInsets() {
            if (Build.VERSION.SDK_INT < 23) return;
            ViewGroup extra = ui.findViewById(resource(ctx, "extra_views_container", "id"));
            View title = ui.findViewById(resource(ctx, "video_title", "id"));
            View seek = ui.findViewById(resource(ctx, "youtube_player_seekbar", "id"));
            if (extra == null || title == null || seek == null || !(seek.getParent() instanceof ViewGroup)) return;
            ViewGroup bottom = (ViewGroup) seek.getParent();
            if (bases == null) {
                bases = new int[] {title.getPaddingLeft(), extra.getPaddingRight(),
                        bottom.getPaddingLeft(), bottom.getPaddingRight()};
            }
            int left = 0, right = 0, topL = 0, topR = 0, botL = 0, botR = 0;
            WindowInsets wi = ui.getRootWindowInsets();
            if (wi != null && ui.getWidth() > 0) {
                int[] loc = new int[2];
                ui.getLocationInWindow(loc);
                View root = ui.getRootView();
                int slop = dp(ctx, 2);
                boolean atLeft = loc[0] <= slop;
                boolean atRight = loc[0] + ui.getWidth() >= root.getWidth() - slop;
                // Distance from the display's top and bottom edges: a rounded corner only matters
                // for controls that are close enough to it.
                float dTop = loc[1] + dp(ctx, 8);
                float dBottom = Math.max(0, root.getHeight() - (loc[1] + ui.getHeight())) + dp(ctx, 8);
                if (Build.VERSION.SDK_INT >= 31) {
                    topL = corner(wi, RoundedCorner.POSITION_TOP_LEFT, dTop);
                    topR = corner(wi, RoundedCorner.POSITION_TOP_RIGHT, dTop);
                    botL = corner(wi, RoundedCorner.POSITION_BOTTOM_LEFT, dBottom);
                    botR = corner(wi, RoundedCorner.POSITION_BOTTOM_RIGHT, dBottom);
                }
                if (Build.VERSION.SDK_INT >= 28) {
                    DisplayCutout cut = wi.getDisplayCutout();
                    if (cut != null) {
                        left = cut.getSafeInsetLeft();
                        right = cut.getSafeInsetRight();
                    }
                }
                if (!atLeft) { topL = 0; botL = 0; left = 0; }
                if (!atRight) { topR = 0; botR = 0; right = 0; }
            }
            int tl = Math.max(left, topL), tr = Math.max(right, topR);
            int bl = Math.max(left, botL), br = Math.max(right, botR);
            title.setPadding(bases[0] + tl, title.getPaddingTop(), title.getPaddingRight(), title.getPaddingBottom());
            extra.setPadding(extra.getPaddingLeft(), extra.getPaddingTop(), bases[1] + tr, extra.getPaddingBottom());
            bottom.setPadding(bases[2] + bl, bottom.getPaddingTop(), bases[3] + br, bottom.getPaddingBottom());
        }

        // ---- JS ----

        private void js(String code) {
            try {
                web.evaluateJavascript("try{" + code + "}catch(e){}", null);
            } catch (Throwable t) {
                Log.w(TAG, "js failed", t);
            }
        }

        private void seekJs(int seconds) {
            // __rifS keeps the target of the last seek so quick repeated taps stack even if
            // getCurrentTime() lags behind. The state guard matters: seekTo on a cued or
            // unstarted video would start playing it.
            js("(function(d){if(typeof player==='undefined'||!player.getCurrentTime)return;"
                    + "var s=player.getPlayerState();if(s==-1||s==5)return;var n=Date.now();"
                    + "var b=(window.__rifS&&n-window.__rifS.t<1500)?window.__rifS.v:player.getCurrentTime();"
                    + "var t=Math.max(0,b+d),u=player.getDuration();if(u>0)t=Math.min(t,u-1);"
                    + "window.__rifS={t:n,v:t};player.seekTo(t,true);"
                    + "YouTubePlayerBridge.sendVideoCurrentTime(''+t);})(" + seconds + ")");
        }

        private void setRate(int percent) {
            js("player.setPlaybackRate(" + (percent / 100f) + ")");
        }

        // ---- feedback overlay ----

        private void addFeedback() {
            FrameLayout overlay = new FrameLayout(ctx);
            overlay.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
            LinearLayout halves = new LinearLayout(ctx);
            halves.setOrientation(LinearLayout.HORIZONTAL);
            overlay.addView(halves, new FrameLayout.LayoutParams(-1, -1));
            for (int i = 0; i < 2; i++) {
                FrameLayout half = new FrameLayout(ctx);
                halves.addView(half, new LinearLayout.LayoutParams(0, -1, 1f));
                LinearLayout pod = new LinearLayout(ctx);
                pod.setOrientation(LinearLayout.VERTICAL);
                pod.setGravity(Gravity.CENTER_HORIZONTAL);
                ImageView icon = new ImageView(ctx);
                int res = resource(ctx, i == 0 ? "exo_icon_rewind" : "exo_icon_fastforward", "drawable");
                if (res != 0) icon.setImageResource(res);
                pod.addView(icon, new LinearLayout.LayoutParams(dp(ctx, 40), dp(ctx, 40)));
                TextView label = new TextView(ctx);
                label.setTextColor(Color.WHITE);
                label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
                label.setShadowLayer(4, 0, 0, Color.BLACK);
                pod.addView(label, new LinearLayout.LayoutParams(-2, -2));
                pod.setAlpha(0f);
                pod.setVisibility(View.INVISIBLE);
                half.addView(pod, new FrameLayout.LayoutParams(-2, -2, Gravity.CENTER));
                podLabels[i] = label;
                pods[i] = pod;
            }
            fastLabel = new TextView(ctx);
            fastLabel.setText("2x speed");
            fastLabel.setTextColor(Color.WHITE);
            fastLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            fastLabel.setPadding(dp(ctx, 12), dp(ctx, 6), dp(ctx, 12), dp(ctx, 6));
            GradientDrawable bg = new GradientDrawable();
            bg.setColor(0x99000000);
            bg.setCornerRadius(dp(ctx, 16));
            fastLabel.setBackground(bg);
            fastLabel.setVisibility(View.GONE);
            FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(-2, -2, Gravity.TOP | Gravity.CENTER_HORIZONTAL);
            lp.topMargin = dp(ctx, 48);
            overlay.addView(fastLabel, lp);
            // Above the touch panel, below the controls.
            ui.addView(overlay, Math.min(1, ui.getChildCount()), new FrameLayout.LayoutParams(-1, -1));
        }

        private void showPod(int dir) {
            int i = dir < 0 ? 0 : 1;
            pods[1 - i].animate().cancel();
            pods[1 - i].setAlpha(0f);
            pods[1 - i].setVisibility(View.INVISIBLE);
            podLabels[i].setText(chainSeconds + " s");
            View pod = pods[i];
            pod.animate().cancel();
            pod.setVisibility(View.VISIBLE);
            pod.animate().alpha(1f).setDuration(150).start();
            pod.removeCallbacks(hidePods);
            pod.postDelayed(hidePods, CHAIN_MS);
        }

        private void fadePods() {
            for (final View pod : pods) {
                if (pod.getVisibility() != View.VISIBLE) continue;
                pod.animate().alpha(0f).setDuration(FADE_MS)
                        .withEndAction(() -> pod.setVisibility(View.INVISIBLE)).start();
            }
        }

        // ---- gestures ----

        private void seek(int dir) {
            long now = SystemClock.uptimeMillis();
            if (now > chainUntil || dir != chainDir) chainSeconds = 0;
            chainSeconds += SEEK_SECONDS;
            chainDir = dir;
            chainUntil = now + CHAIN_MS;
            seekJs(dir * SEEK_SECONDS);
            showPod(dir);
        }

        private int sideOf(float x) {
            return x < panel.getWidth() / 2f ? -1 : 1;
        }

        private void addGestures() {
            final float slop = ViewConfiguration.get(ctx).getScaledTouchSlop();
            final GestureDetector detector = new GestureDetector(ctx, new GestureDetector.SimpleOnGestureListener() {
                @Override
                public boolean onDown(MotionEvent e) {
                    return true;
                }

                @Override
                public boolean onSingleTapConfirmed(MotionEvent e) {
                    if (ended) {
                        replay(); // YouTube's own replay icon is under the overlay
                        return true;
                    }
                    panel.performClick(); // the library's show/hide controls toggle
                    return true;
                }

                @Override
                public boolean onDoubleTap(MotionEvent e) {
                    seek(sideOf(e.getX()));
                    return true;
                }

                @Override
                public void onLongPress(MotionEvent e) {
                    fast = true;
                    setRate(200);
                    fastLabel.setVisibility(View.VISIBLE);
                }
            });
            panel.setOnTouchListener((v, e) -> {
                int a = e.getActionMasked();
                if (fast) {
                    if (a == MotionEvent.ACTION_UP || a == MotionEvent.ACTION_CANCEL) {
                        fast = false;
                        setRate(ratePercent);
                        fastLabel.setVisibility(View.GONE);
                    }
                    return true;
                }
                if (SystemClock.uptimeMillis() < chainUntil && (a == MotionEvent.ACTION_DOWN || chainDown)) {
                    // Right after a seek every quick tap seeks again, no double-tap needed.
                    if (a == MotionEvent.ACTION_DOWN) {
                        chainDown = true;
                        tapMoved = false;
                        downX = e.getX();
                        downY = e.getY();
                        downTime = e.getEventTime();
                    } else if (a == MotionEvent.ACTION_MOVE) {
                        if (Math.abs(e.getX() - downX) > slop || Math.abs(e.getY() - downY) > slop) tapMoved = true;
                    } else if (a == MotionEvent.ACTION_UP) {
                        chainDown = false;
                        if (!tapMoved && e.getEventTime() - downTime < ViewConfiguration.getLongPressTimeout()) {
                            seek(sideOf(downX));
                        }
                    } else if (a == MotionEvent.ACTION_CANCEL) {
                        chainDown = false;
                    }
                    return true;
                }
                detector.onTouchEvent(e);
                return true;
            });
        }

        // ---- settings button and popup ----

        private void addSettingsButton() {
            ViewGroup extra = ui.findViewById(resource(ctx, "extra_views_container", "id"));
            if (extra == null) return;
            int icon = resource(ctx, "exo_ic_settings", "drawable");
            if (icon == 0) return;
            ImageView gear = new ImageView(ctx);
            gear.setImageResource(icon);
            int bg = resource(ctx, "ayp_background_item_selected", "drawable");
            if (bg != 0) gear.setBackgroundResource(bg);
            gear.setPadding(dp(ctx, 8), dp(ctx, 8), dp(ctx, 8), dp(ctx, 8));
            gear.setClickable(true);
            gear.setFocusable(true);
            gear.setContentDescription("Settings");
            gear.setOnClickListener(this::openSettings);
            extra.addView(gear, 0, new LinearLayout.LayoutParams(-2, -2));
        }

        private void openSettings(final View anchor) {
            if (captionsChoice != null) {
                try {
                    showPopup(anchor, captionsChoice);
                } catch (Throwable t) {
                    Log.w(TAG, "popup failed", t);
                }
                return;
            }
            // Whether captions are showing now is only known to the page.
            web.evaluateJavascript("(function(){try{var t=player.getOption('captions','track');"
                    + "return !!(t&&t.languageCode)}catch(e){return false}})()", value -> {
                try {
                    showPopup(anchor, "true".equals(value));
                } catch (Throwable t) {
                    Log.w(TAG, "popup failed", t);
                }
            });
        }

        private void showPopup(View anchor, boolean captionsOn) {
            // The answer from the page can arrive after the player left the screen.
            if (!anchor.isAttachedToWindow()) return;
            int namesRes = resource(ctx, "video_playback_speed_spinner_choices", "array");
            int valuesRes = resource(ctx, "video_playback_speed_spinner_values", "array");
            if (namesRes == 0 || valuesRes == 0) return;
            final String[] speedNames = ctx.getResources().getStringArray(namesRes);
            final int[] speedValues = ctx.getResources().getIntArray(valuesRes);
            int item = resource(ctx, "video_setting_spinner_item", "layout");
            int modeRes = resource(ctx, "spinner_mode_in_popup_window", "integer");
            int mode = modeRes != 0 ? ctx.getResources().getInteger(modeRes) : Spinner.MODE_DROPDOWN;
            final Spinner[] rows = new Spinner[2];

            Spinner speed = new Spinner(ctx, mode);
            speed.setAdapter(new ArrayAdapter<>(ctx, item, speedNames));
            for (int i = 0; i < speedValues.length; i++) {
                if (speedValues[i] == ratePercent) speed.setSelection(i);
            }
            speed.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
                @Override
                public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                    if (speedValues[position] == ratePercent) return;
                    ratePercent = speedValues[position];
                    setRate(ratePercent);
                }

                @Override
                public void onNothingSelected(AdapterView<?> parent) {}
            });
            rows[0] = speed;

            final boolean[] on = {captionsOn};
            Spinner captions = new Spinner(ctx, mode);
            captions.setAdapter(new ArrayAdapter<>(ctx, item, new String[] {"Captions: off", "Captions: on"}));
            captions.setSelection(captionsOn ? 1 : 0);
            captions.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
                @Override
                public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                    boolean want = position == 1;
                    if (want == on[0]) return;
                    on[0] = want;
                    captionsChoice = want;
                    userChose = true;
                    setCaptions(want);
                }

                @Override
                public void onNothingSelected(AdapterView<?> parent) {}
            });
            rows[1] = captions;

            ListPopupWindow popup = new ListPopupWindow(ctx);
            popup.setModal(true);
            popup.setAnchorView(anchor);
            popup.setDropDownGravity(Gravity.END);
            int widthRes = resource(ctx, "video_settings_popup_window_content_width", "dimen");
            popup.setWidth(widthRes != 0 ? ctx.getResources().getDimensionPixelSize(widthRes) : dp(ctx, 320));
            popup.setAdapter(new BaseAdapter() {
                @Override public int getCount() { return rows.length; }
                @Override public Object getItem(int position) { return rows[position]; }
                @Override public long getItemId(int position) { return position; }
                @Override public View getView(int position, View convertView, ViewGroup parent) {
                    return rows[position];
                }
            });
            popup.show();
        }

        private void setCaptions(boolean on) {
            captionsOn = on;
            updateLift();
            if (!on) {
                js("player.setOption('captions','track',{})");
                return;
            }
            // After "off" the tracklist is empty while the page still reports the last track, so
            // use the tracklist (full object) if it has entries, else that last track, else the
            // device language. Setting just {languageCode} from an empty tracklist did nothing.
            js("(function(lang){player.loadModule('captions');var l=player.getOption('captions','tracklist')||[],p=null;"
                    + "for(var i=0;i<l.length;i++)if(l[i].languageCode==lang&&(!p||p.kind=='asr'))p=l[i];"
                    + "if(!p&&l.length)p=l[0];"
                    + "if(!p){p=player.getOption('captions','track');if(!(p&&p.languageCode))p={languageCode:lang}}"
                    + "player.setOption('captions','track',p)})('"
                    + Locale.getDefault().getLanguage().replace("'", "") + "')");
            captionStep = wantStep();
            setCaptionSize();
            ui.postDelayed(this::setCaptionSize, 800); // in case the module wasn't ready yet
        }
    }
}
