package app.jimaku.extension;

import android.app.Activity;
import android.app.Application;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Rect;
import android.graphics.RectF;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.Choreographer;
import android.view.MotionEvent;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewConfiguration;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityNodeInfo;

import java.lang.ref.WeakReference;
import java.util.ArrayDeque;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;

import android.content.ContextWrapper;
import android.widget.LinearLayout;

import app.jimaku.extension.gateway.Cancellation;
import app.jimaku.extension.gateway.Gateway;
import app.jimaku.extension.gateway.GatewayException;
import app.jimaku.extension.gateway.Requests;
import app.jimaku.extension.jobs.Glide;
import app.jimaku.extension.menu.Menu;
import app.jimaku.extension.menu.MenuInput;
import app.jimaku.extension.menu.Subtitle;
import app.jimaku.extension.menu.Version;
import app.jimaku.extension.overlay.Hint;
import app.jimaku.extension.overlay.Message;
import app.jimaku.extension.overlay.PlayerButton;
import app.jimaku.extension.overlay.SubtitleView;
import app.jimaku.extension.session.AccountState;
import app.jimaku.extension.session.VideoSession;
import app.jimaku.extension.settings.KeptAccount;
import app.jimaku.extension.settings.KeptInstall;
import app.jimaku.extension.settings.KeptPending;
import app.jimaku.extension.settings.KeptResults;
import app.jimaku.extension.settings.Look;
import app.jimaku.extension.shared.Samples;
import app.jimaku.extension.subtitles.Line;
import app.jimaku.extension.subtitles.LineCursor;
import app.jimaku.extension.youtube.CaptionTrack;
import app.jimaku.extension.youtube.TrackInfo;
import app.jimaku.extension.youtube.YouTube;

/**
 * Jimaku in the watch player: follows Morphe's player events, looks up the video in the watch
 * player, and draws the subtitle for the current position. Everything here runs on the main thread.
 * <p>
 * Work per frame runs only while subtitles can show and the video plays. While they can show and
 * the video is paused, a check a few times a second catches seeks and the controls. While they
 * can't show, nothing runs until one of Morphe's events or a layout change says otherwise.
 */
final class Player implements VideoSession.Display, VideoSession.Host, Menu.Host {
    private static final String OVERLAYS_LAYOUT =
            "com.google.android.apps.youtube.app.common.player.overlay.YouTubePlayerOverlaysLayout";
    private static final long PAUSED_CHECK_MILLIS = 250;
    /** YouTube's views in the row of controls at the bottom of the player, by resource name. */
    private static final String[] CONTROLS_ROW = {"timestamps_container", "fullscreen_button"};
    /** YouTube's top bar in the player, and its CC button, beside which Jimaku's button sits. */
    private static final String TOP_BAR = "player_additional_view_container";
    private static final String CC_BUTTON = "player_subtitle_button";
    /** YouTube's settings button at the top bar's end, under whose glyph Jimaku's message ends. */
    private static final String OVERFLOW_BUTTON = "player_overflow_button";
    /** The extension's hint, with the phone's verb: hard-coded, as the extension's wording has "click". */
    private static final String HINT_WORDS = "Subtitles in %s \u2013 tap here";

    private final Handler main = new Handler(Looper.getMainLooper());
    private final VideoSession session;
    /** The account, one for every video. */
    private final AccountState account;
    private final MessageToast toast = new MessageToast();
    private final Choreographer.FrameCallback frame = frameTimeNanos -> Guard.run("frame", () -> {
        framePosted = false;
        update();
    });
    private final Runnable pausedCheck = () -> Guard.run("paused check", () -> {
        pausedCheckPosted = false;
        update();
    });
    private final View.OnLayoutChangeListener layoutChange =
            (v, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) ->
                    Guard.run("layout change", this::onLayoutChange);

    private WeakReference<Activity> activity = new WeakReference<>(null);
    private SubtitleView view;
    private Message message;
    /** The one-time pointer at Jimaku's button, while the install hasn't seen it. */
    private Hint hint;
    private ViewGroup overlay;
    private WeakReference<View> controls = new WeakReference<>(null);
    private WeakReference<View> surface = new WeakReference<>(null);
    /** Whether {@link #surface} is the result of a search since the last layout change. */
    private boolean surfaceSearched;
    private final View[] controlsRow = new View[CONTROLS_ROW.length];
    private boolean controlsRowSearched;
    private String loggedControlsRow;
    private final int[] viewLocation = new int[2];
    private final int[] otherLocation = new int[2];
    private final Rect area = new Rect();
    private final Rect surfaceArea = new Rect();

    /** The video Morphe last reported, in whatever player. */
    private String videoId;
    /** A video whose subtitles stopped after a fault; it isn't looked up again. */
    private String faultedVideo;
    /** The playing state from Morphe's video state event, or null before the first one. */
    private Boolean statePlaying;
    /** When the playback time last moved forward, by the uptime clock, and to what. */
    private long timeMovedAt = -1;
    private long lastTimeMillis = -1;
    private LineCursor cursor;
    private String lang;
    private LineCursor originalCursor;
    private String originalLang;
    /** The app's activities between started and stopped: while there are none, the app is in the background. */
    private final Set<Activity> started = Collections.newSetFromMap(new WeakHashMap<>());
    /** Whether {@link #update} runs: the session's changes it causes need no second pass. */
    private boolean updating;
    /** While Settings is open, the captions last drawn stay through the gap before the next. */
    private String heldText;
    private String heldOriginal;
    private boolean editing;
    /** A drag by the captions' grip under way: where the finger went down and where the captions were then. */
    private Drag drag;

    private static final class Drag {
        final float downX;
        final float downY;
        final float startDx;
        final float startDy;

        Drag(float downX, float downY, float startDx, float startDy) {
            this.downX = downX;
            this.downY = downY;
            this.startDx = startDx;
            this.startDy = startDy;
        }
    }

    private Look look;
    private Menu menu;
    private PlayerButton button;
    /** In a preview build, the bar a preview state shows in place of the session's. */
    private boolean previewing;
    private boolean previewWorking;
    private Glide previewGlide;
    private boolean previewFailed;
    private final Preview.Work previewWork = new Preview.Work() {
        @Override
        public void set(boolean working, Glide glide, boolean failed) {
            previewing = true;
            previewWorking = working;
            previewGlide = glide;
            previewFailed = failed;
            updateButton();
        }

        @Override
        public void off() {
            previewing = false;
            updateButton();
        }
    };
    private WeakReference<ViewGroup> topBar = new WeakReference<>(null);
    private boolean topBarMissingLogged;

    private volatile YouTube youtube;
    private final Preview preview;

    private boolean framePosted;
    private boolean pausedCheckPosted;
    /** What the log last said runs: "frames", "paused check" or "nothing". */
    private String loggedWork = "nothing";

    Player() {
        // An error a request throws ends its thread, never the app; the pool starts another.
        ExecutorService requests = Requests.pool((dead, fault) -> JimakuLog.fault("requests thread", fault));
        Gateway gateway = new Gateway(KeptInstall.of(Morphe::context));
        VideoSession.Timer timer = new VideoSession.Timer() {
            @Override
            public long now() {
                return System.currentTimeMillis();
            }

            @Override
            public Runnable after(long millis, Runnable run) {
                Runnable guarded = () -> Guard.run("job check", run);
                main.postDelayed(guarded, millis);
                return () -> main.removeCallbacks(guarded);
            }
        };
        session = new VideoSession(gateway, gateway, new Tracks(), KeptResults.of(Morphe::context), KeptPending.of(Morphe::context), this,
                toast, timer, requests, answer -> main.post(() -> Guard.run("gateway answer", answer)), this);
        account = new AccountState(gateway, KeptAccount.of(Morphe::context), requests,
                answer -> main.post(() -> Guard.run("account answer", answer)), timer, this::browse, toast);
        preview = BuildConfig.PREVIEW ? new Preview(account) : null;
        account.addListener(() -> {
            if (menu != null) menu.refresh();
            session.accountChanged();
        });
    }

    /** Opens {@code url} in the phone's browser: jimaku.app's sign-in, or Stripe's payment page. */
    private boolean browse(String url) {
        Activity current = activity.get();
        Context context = current != null && !current.isFinishing() ? current : Morphe.context();
        if (context == null) return false;
        // Not a leave by the viewer: YouTube doesn't go to picture-in-picture, so its return is a start that foreground() hears.
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url)).addCategory(Intent.CATEGORY_BROWSABLE)
                .addFlags(Intent.FLAG_ACTIVITY_NO_USER_ACTION);
        if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try {
            context.startActivity(intent);
            return true;
        } catch (ActivityNotFoundException | SecurityException e) {
            JimakuLog.warn("No browser for " + Uri.parse(url).getHost() + ": " + e);
            return false;
        }
    }

    /** YouTube's caption tracks and their lines, asked as the installed app, once there is a context to say which app. */
    private final class Tracks implements VideoSession.Tracks {
        @Override
        public TrackInfo tracks(String video, Cancellation cancellation) throws GatewayException {
            YouTube reader = reader();
            return reader != null ? reader.tracks(video, cancellation) : null;
        }

        @Override
        public String captions(TrackInfo info, CaptionTrack track, Cancellation cancellation) throws GatewayException {
            YouTube reader = reader();
            if (reader == null) throw new GatewayException("no_captions");
            return reader.captions(info, track, cancellation);
        }

        private YouTube reader() {
            YouTube reader = youtube;
            if (reader == null) {
                Context context = Morphe.context();
                if (context == null) return null;
                reader = YouTube.of(context);
                youtube = reader;
            }
            return reader;
        }
    }

    /** The session's message, as the player's {@link Message}; while there is none, nothing shows, and a new one hears the job again. */
    private final class MessageToast implements VideoSession.Toast, AccountState.Messages {
        @Override
        public void info(String words) {
            if (message != null) message.info(words);
        }

        @Override
        public void hold(String words, VideoSession.Action action) {
            hold(words, action, null);
        }

        @Override
        public void hold(String words, VideoSession.Action forward, VideoSession.Action second) {
            if (message != null) message.hold(words, action(forward), action(second));
        }

        @Override
        public void progress(String words, boolean announce, VideoSession.Action stop, String strong, Glide glide) {
            if (message != null) message.progress(words, announce, action(stop), strong, glide);
        }

        @Override
        public void ask(String question, Runnable onYes) {
            if (message != null) message.ask(question, onYes);
        }

        @Override
        public void reask(String question) {
            if (message != null) message.reask(question);
        }

        @Override
        public void hide() {
            if (message != null) message.hide();
        }

        @Override
        public boolean showingProgress() {
            return message != null && message.showingProgress();
        }

        @Override
        public boolean asking() {
            return message != null && message.asking();
        }

        private Message.Action action(VideoSession.Action action) {
            return action == null ? null : new Message.Action(action.label, action.run);
        }
    }

    /** The settings, read once there is a context to read them from. */
    private Look look() {
        if (look == null) {
            Context context = Morphe.context();
            if (context == null) context = activity.get();
            if (context == null) return null;
            Context app = context.getApplicationContext();
            look = new Look(app != null ? app : context);
            look.setOnChange(() -> Guard.run("settings change", this::onLookChange));
            menu = new Menu(look, this);
        }
        return look;
    }

    private void onLookChange() {
        if (menu != null) menu.refresh();
        // Original caption switched off leaves the original; on, it is read.
        session.originalChanged();
        update();
    }

    @Override
    public String preferred() {
        return Languages.languageFor(Locale.getDefault());
    }

    @Override
    public boolean on() {
        Look settings = look();
        return settings != null && settings.on();
    }

    @Override
    public void setOn(boolean on) {
        Look settings = look();
        if (settings != null && settings.on() != on) settings.setOn(on);
    }

    @Override
    public boolean dual() {
        Look settings = look();
        return settings != null && settings.dual();
    }

    @Override
    public MenuInput.Account account() {
        return account.account();
    }

    @Override
    public boolean minutesKnown() {
        return account.minutesKnown();
    }

    @Override
    public Version mode() {
        Look settings = look();
        return settings != null ? settings.mode() : null;
    }

    @Override
    public void setMode(Version mode) {
        Look settings = look();
        if (settings != null) settings.setMode(mode);
    }

    @Override
    public void minutesChanged() {
        account.readAgain();
    }

    /** Buy minutes, in a message: the menu opens on Account. */
    @Override
    public void openAccount() {
        openMenu();
        if (menu != null) menu.openAccount();
    }

    @Override
    public AccountState accountState() {
        return account;
    }

    @Override
    public void flipMode(Version mode) {
        session.setMode(mode);
    }

    @Override
    public Double mediaSeconds() {
        long millis = Morphe.videoLengthMillis();
        return millis > 0 ? millis / 1000.0 : null;
    }

    @Override
    public String video() {
        return session.video();
    }

    @Override
    public MenuInput input() {
        return session.input();
    }

    @Override
    public void show(Subtitle subtitle) {
        session.choose(subtitle);
    }

    @Override
    public void hide() {
        session.hide();
    }

    @Override
    public void start(Subtitle subtitle) {
        session.generate(subtitle);
    }

    @Override
    public void stop(Subtitle subtitle) {
        session.stop(subtitle);
    }

    @Override
    public void busy() {
        session.busy();
    }

    @Override
    public void settingsShown(boolean shown) {
        editing = shown;
        heldText = null;
        heldOriginal = null;
        // Settings closed under a drag: its touches no longer come, so the drag ends here, unsaved.
        if (!shown && drag != null) {
            drag = null;
            if (view != null) view.setDragging(false);
        }
        if (view != null) view.setEditing(shown);
        update();
    }

    @Override
    public Boolean darkTheme() {
        try {
            return Morphe.darkTheme();
        } catch (RuntimeException | LinkageError e) {
            JimakuLog.warn("No theme from Morphe: " + e);
            return null;
        }
    }

    /**
     * Drags the captions by their grip while Settings is open, as the extension does with a pointer:
     * they follow the finger within their reach, and where they are dropped is kept as a share of
     * the player. A touch that doesn't move them changes nothing.
     */
    @Override
    public boolean besideTouch(MotionEvent event) {
        SubtitleView captions = view;
        Look settings = look();
        if (captions == null || settings == null) return false;
        int[] at = new int[2];
        captions.getLocationOnScreen(at);
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN -> {
                RectF grip = captions.gripArea();
                if (grip.isEmpty() || !grip.contains(event.getRawX() - at[0], event.getRawY() - at[1])) return false;
                drag = new Drag(event.getRawX(), event.getRawY(), captions.drawnOffsetX(), captions.drawnOffsetY());
                captions.setDragging(true);
                if (menu != null) menu.setSeeThrough(true);
                return true;
            }
            case MotionEvent.ACTION_MOVE -> {
                Drag current = drag;
                Rect video = captions.videoArea();
                if (current == null) return false;
                if (video.isEmpty()) return true;
                // Up the screen is a larger offset from their own place.
                float dx = current.startDx + event.getRawX() - current.downX;
                float dy = current.startDy - (event.getRawY() - current.downY);
                captions.setPosition(dx / video.width(), dy / video.height());
                return true;
            }
            case MotionEvent.ACTION_UP, MotionEvent.ACTION_CANCEL -> {
                Drag ended = drag;
                if (ended == null) return false;
                drag = null;
                captions.setDragging(false);
                if (menu != null) menu.setSeeThrough(false);
                float slop = ViewConfiguration.get(captions.getContext()).getScaledTouchSlop();
                boolean moved = Math.hypot(event.getRawX() - ended.downX, event.getRawY() - ended.downY) > slop;
                Rect video = captions.videoArea();
                if (!moved || video.isEmpty()) {
                    update();
                    return true;
                }
                float dx = captions.drawnOffsetX();
                float dy = captions.drawnOffsetY();
                if (dx == 0 && dy == 0) settings.resetPosition();
                else settings.setPosition(dx / video.width(), dy / video.height());
                return true;
            }
            default -> {
                return drag != null;
            }
        }
    }

    /**
     * Keeps the resumed activity, to find the player in its views before the controls first show, and
     * whether the app is in the foreground, where alone a job is checked.
     */
    void watchActivities(Context context) {
        if (context instanceof Activity current) {
            activity = new WeakReference<>(current);
            started.add(current);
        }
        Context app = context != null ? context.getApplicationContext() : null;
        if (!(app instanceof Application application)) {
            JimakuLog.warn("No application to follow activities in");
            return;
        }
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityResumed(Activity resumed) {
                Guard.run("activity resumed", () -> {
                    activity = new WeakReference<>(resumed);
                    update();
                });
            }

            @Override
            public void onActivityCreated(Activity created, Bundle state) {
            }

            @Override
            public void onActivityStarted(Activity shown) {
                Guard.run("activity started", () -> {
                    // Back from the browser, or anywhere else: the account is read, and a payment confirmed.
                    boolean back = started.isEmpty();
                    started.add(shown);
                    session.setForeground(true);
                    if (back) account.foreground();
                });
            }

            @Override
            public void onActivityPaused(Activity paused) {
            }

            @Override
            public void onActivityStopped(Activity stopped) {
                Guard.run("activity stopped", () -> {
                    started.remove(stopped);
                    if (started.isEmpty()) session.setForeground(false);
                });
            }

            @Override
            public void onActivitySaveInstanceState(Activity saved, Bundle state) {
            }

            @Override
            public void onActivityDestroyed(Activity destroyed) {
            }
        });
    }

    void onControlsCreated(View controlsButton) {
        if (controlsButton == null) return;
        if (controls.get() == null) JimakuLog.info("Overlay buttons start at " + describe(controlsButton));
        controls = new WeakReference<>(controlsButton);
        controlsRowSearched = false;
        ViewGroup found = overlaysLayout(controlsButton);
        if (found == null) {
            JimakuLog.warn("No player overlay layout above " + ancestry(controlsButton));
            return;
        }
        attach(found);
        placeButton();
        update();
    }

    void onNewVideo() {
        videoId = null;
        session.reset();
    }

    void onVideoId(String id) {
        videoId = id;
        update();
    }

    void onVideoState(Object state) {
        String name = String.valueOf(state);
        boolean nowPlaying = "PLAYING".equals(name);
        if (statePlaying == null || statePlaying != nowPlaying) JimakuLog.info("Video state " + name);
        statePlaying = nowPlaying;
        update();
    }

    void onVideoTime(long millis) {
        if (BuildConfig.FAULT_TEST) throw new IllegalStateException("Fault test at " + millis + " ms");
        if (millis != lastTimeMillis) {
            lastTimeMillis = millis;
            timeMovedAt = SystemClock.uptimeMillis();
        }
        update();
    }

    /**
     * Playing, by Morphe's video state event. Until that event has fired once, playing while the
     * time listener, which reports about once a second, saw the time move in the last 1.5 seconds.
     */
    private boolean isPlaying() {
        if (statePlaying != null) return statePlaying;
        return timeMovedAt >= 0 && SystemClock.uptimeMillis() - timeMovedAt < 1500;
    }

    /** After a fault: this video's subtitles go, and it plays on without them. */
    void onFault() {
        faultedVideo = videoId;
        if (menu != null) menu.close();
        session.reset();
    }

    @Override
    public void changed() {
        if (menu != null) menu.refresh();
        updateButton();
        if (!updating) update();
    }

    @Override
    public void lines(String lang, List<Line> lines) {
        cursor = lines == null ? null : new LineCursor(lines);
        this.lang = lines == null ? null : lang;
        if (!updating) update();
    }

    @Override
    public void original(String lang, List<Line> lines) {
        originalCursor = lines == null ? null : new LineCursor(lines);
        originalLang = lines == null ? null : lang;
        if (!updating) update();
    }

    /** Called from inside {@link VideoSession#open}, so it only stops; it must not open the video again. */
    @Override
    public void clear() {
        cursor = null;
        lang = null;
        originalCursor = null;
        originalLang = null;
        heldText = null;
        heldOriginal = null;
        if (view != null) {
            view.setText(null, null);
            view.setOriginal(null, null);
        }
        if (menu != null) menu.refresh();
        updateButton();
        if (!updating) schedule(false, false);
    }

    private void onLayoutChange() {
        surfaceSearched = false;
        controlsRowSearched = false;
        // Fullscreen moves the top bar: the message goes to where it is in the new layout, once it shows.
        if (message != null && (overlay.getWidth() != messageWidth || overlay.getHeight() != messageHeight)) {
            messageWidth = overlay.getWidth();
            messageHeight = overlay.getHeight();
            message.setAnchor(-1, -1, false);
        }
        placeButton();
        update();
    }

    private int messageWidth;
    private int messageHeight;

    /**
     * The message under the top bar's end: its end at the settings glyph's outer edge, 12 dp into that
     * button, and its pill 4 dp below the bar. Measured while the top bar shows; while the controls
     * hide it stays where it was. It shows only in the watch player at full size.
     */
    private void placeMessage(boolean fullSize) {
        if (message == null || overlay == null) return;
        int visibility = fullSize ? View.VISIBLE : View.GONE;
        if (message.getVisibility() != visibility) {
            // From the layout listener the change waits for the next pass; the next update corrects it if it moved on.
            Message shown = message;
            if (shown.isInLayout()) shown.post(() -> shown.setVisibility(visibility));
            else shown.setVisibility(visibility);
        }
        if (!fullSize || !Morphe.controlsShown()) return;
        int id = resourceId(OVERFLOW_BUTTON);
        View end = id != 0 ? overlay.findViewById(id) : null;
        if (end == null || !end.isShown() || end.getWidth() == 0) end = topBar.get();
        if (end == null || !end.isShown() || end.getWidth() == 0) return;
        message.getLocationInWindow(viewLocation);
        end.getLocationInWindow(otherLocation);
        int left = otherLocation[0] - viewLocation[0];
        int top = otherLocation[1] - viewLocation[1];
        boolean atLeft = left + end.getWidth() / 2 < message.getWidth() / 2;
        int inset = dp(12);
        message.setAnchor(atLeft ? left + inset : left + end.getWidth() - inset, top + end.getHeight() - dp(4), atLeft);
    }

    private int dp(float value) {
        return Math.round(value * overlay.getResources().getDisplayMetrics().density);
    }

    /**
     * The hint under Jimaku's button, while the install hasn't seen it: in the full-size watch player
     * with a video open, where the button shows, and not over a menu or the message. It is as faded as
     * the controls that hold the button, and leaves with them. Run on each update and before each
     * frame drawn while it is attached, which is how it follows YouTube's fade.
     */
    private void placeHint() {
        if (hint == null) return;
        Look settings = look();
        if (settings == null || !settings.hintPending()) {
            hint.hide();
            return;
        }
        String type = Morphe.playerType();
        boolean wanted = !Morphe.lastVideoIsShort() && Morphe.showsSubtitles(type) && session.video() != null
                && button != null && button.isShown() && button.getWidth() > 0
                && (menu == null || !menu.isOpen()) && (message == null || !message.showing());
        float alpha = wanted ? shownAlpha(button) : 0f;
        if (alpha < 0.05f) {
            hint.hide();
            return;
        }
        button.getLocationInWindow(otherLocation);
        hint.getLocationInWindow(viewLocation);
        int centre = otherLocation[0] - viewLocation[0] + button.getWidth() / 2;
        int top = otherLocation[1] - viewLocation[1] + button.getHeight() - dp(4);
        hint.show(String.format(Locale.ROOT, HINT_WORDS, Languages.englishName(preferred())), centre, top, alpha);
    }

    /** How opaque {@code view} draws: its alpha times each of its parents'. */
    private static float shownAlpha(View view) {
        float alpha = 1f;
        for (Object at = view; at instanceof View shown; at = shown.getParent()) alpha *= shown.getAlpha();
        return alpha;
    }

    /** Opens the video in the session if it is new in the watch player, then draws or stops. */
    private void update() {
        if (updating) return;
        updating = true;
        try {
            String type = Morphe.playerType();
            boolean isShort = Morphe.lastVideoIsShort();

            Look settings = look();
            if (videoId != null && !isShort && Morphe.isWatchPlayer(type) && settings != null
                    && !videoId.equals(faultedVideo) && !videoId.equals(session.video())) {
                session.open(videoId);
                account.readOnce();
            }

            boolean original = originalCursor != null;
            boolean fullSize = settings != null && !isShort && Morphe.showsSubtitles(type);
            boolean mayShow = fullSize && (cursor != null || original || editing);
            // The button is wanted whether or not subtitles show: after YouTube made its activity anew,
            // the overlay is found again here, as Morphe doesn't report the new controls.
            if (fullSize && (view == null || !view.isAttachedToWindow())) findOverlayInActivity();
            boolean canShow = mayShow && isOnScreen();
            placeMessage(fullSize);
            placeHint();
            if (preview != null && fullSize) preview.apply(Morphe.context(), message, previewWork);
            if (canShow) draw();
            else if (view != null) {
                view.setText(null, null);
                view.setOriginal(null, null);
            }

            boolean playing = isPlaying();
            schedule(canShow && playing, canShow && !playing);
        } finally {
            updating = false;
        }
    }

    /** Two lines that read the same, however their rows are broken. */
    private static boolean sameText(String a, String b) {
        return a.replaceAll("\\s+", " ").trim().equals(b.replaceAll("\\s+", " ").trim());
    }

    private boolean isOnScreen() {
        return view != null && view.isAttachedToWindow()
                && view.getWindowVisibility() == View.VISIBLE && view.isShown()
                && view.getWidth() > 0 && view.getHeight() > 0;
    }

    private void draw() {
        Look settings = look();
        // A later timing shows each caption that much later: on screen is the caption of that much earlier.
        double t = Morphe.videoTimeMillis() / 1000.0 - settings.timing(session.video()) / 10.0;
        Line line = cursor != null ? cursor.at(t) : null;
        Line originalLine = originalCursor != null ? originalCursor.at(t) : null;
        String text = line == null ? null : line.text;
        String originalText = originalLine == null ? null : originalLine.text;
        // A line of the original that reads as the one below it would only repeat it.
        if (originalText != null && text != null && sameText(originalText, text)) originalText = null;
        String originalLang = this.originalLang;
        String textLang = lang;

        if (editing) {
            // Through a gap the last lines stay. With no translation on, or nothing on screen yet, the
            // sample stands in, with the original's above it where Original caption shows one, as in
            // the extension; a sample is never held.
            boolean untranslated = cursor == null;
            if (!untranslated && text == null && originalText == null) {
                text = heldText;
                originalText = heldOriginal;
            }
            if (untranslated || (text == null && originalText == null)) {
                heldText = null;
                heldOriginal = null;
                textLang = preferred();
                text = Samples.line(textLang);
                originalLang = settings.dual() ? session.originalLanguage() : null;
                originalText = originalLang != null && !originalLang.equals(textLang) ? Samples.line(originalLang) : null;
            } else {
                heldText = text;
                heldOriginal = originalText;
            }
        }

        view.setLook(settings.translation(), settings.original(), settings.background());
        if (drag == null) view.setPosition(settings.positionX(), settings.positionY());
        view.setEditing(editing);
        view.setText(text, textLang);
        view.setOriginal(originalText, originalLang);
        view.setVideoArea(videoArea());
        view.setControlsTop(Morphe.controlsShown() ? controlsTop() : -1);
        Rect cover = menu != null ? menu.settingsCover() : null;
        if (cover != null) {
            int[] at = new int[2];
            view.getLocationOnScreen(at);
            cover.offset(-at[0], -at[1]);
        }
        view.setCovered(cover);
    }

    /**
     * Jimaku's button as first child of YouTube's top bar, left of CC, sized as CC. Put back where
     * YouTube rebuilt the bar; without the bar, subtitles show as before, without the button.
     */
    private void placeButton() {
        if (overlay == null) return;
        ViewGroup bar = topBar.get();
        if (bar == null || !bar.isAttachedToWindow()) {
            bar = null;
            int id = resourceId(TOP_BAR);
            View found = id != 0 ? overlay.findViewById(id) : null;
            Activity current = activity.get();
            if (found == null && id != 0 && current != null && current.getWindow() != null) {
                View decor = current.getWindow().peekDecorView();
                if (decor != null) found = decor.findViewById(id);
            }
            if (found instanceof ViewGroup group) bar = group;
            topBar = new WeakReference<>(bar);
        }
        if (bar == null) {
            if (!topBarMissingLogged) JimakuLog.warn("No top bar to place the button in");
            topBarMissingLogged = true;
            return;
        }
        if (button != null && button.getParent() == bar && bar.getChildAt(0) == button) return;
        // A bar of a new activity gets a button of its own, so none keeps a finished activity.
        if (button != null && button.getContext() != bar.getContext()) {
            if (button.getParent() instanceof ViewGroup oldParent) oldParent.removeView(button);
            button = null;
        }
        if (button == null) {
            button = new PlayerButton(bar.getContext());
            button.setOnClickListener(v -> Guard.run("button", this::openMenu));
        }
        if (button.getParent() instanceof ViewGroup oldParent) oldParent.removeView(button);
        int ccId = resourceId(CC_BUTTON);
        View cc = ccId != 0 ? bar.findViewById(ccId) : null;
        ViewGroup.LayoutParams params;
        if (cc != null && cc.getLayoutParams() instanceof LinearLayout.LayoutParams ccParams && bar instanceof LinearLayout) {
            params = new LinearLayout.LayoutParams(ccParams);
        } else {
            int size = Math.round(48 * bar.getResources().getDisplayMetrics().density);
            params = new ViewGroup.LayoutParams(size, size);
        }
        bar.addView(button, 0, params);
        updateButton();
        JimakuLog.info("Button placed in the top bar" + (cc != null ? ", beside CC" : ""));
    }

    /**
     * The button's fill, name and bar, from the session, as the extension's describeState() has them:
     * a job filling along its glide, or sweeping without one, and "!" where something failed.
     */
    private void updateButton() {
        if (button == null) return;
        VideoSession.Control state = session.control();
        button.setOn(state.on);
        button.setName(state.name());
        if (previewing) button.setWork(previewWorking, previewGlide, previewFailed);
        else button.setWork(state.working, state.glide, state.error && !state.working);
    }

    private void openMenu() {
        // A press of the button is what the hint asks for: it has been seen, whether or not it showed.
        Look seen = look();
        if (seen != null) seen.hintSeen();
        if (hint != null) hint.hide();
        Activity current = activityOf(button != null ? button.getContext() : null);
        if (current == null || current.isFinishing() || current.isDestroyed()) current = activity.get();
        if (current == null || current.isFinishing() || current.isDestroyed() || look() == null) return;
        int maxTop = 0;
        if (overlay != null && overlay.isShown()) {
            overlay.getLocationOnScreen(otherLocation);
            maxTop = otherLocation[1] + overlay.getHeight();
        }
        menu.open(current, maxTop);
        session.menuOpened();
        account.read();
    }

    private static Activity activityOf(Context context) {
        while (context instanceof ContextWrapper wrapper) {
            if (context instanceof Activity found) return found;
            context = wrapper.getBaseContext();
        }
        return null;
    }

    /** A view ID of YouTube's by its resource name, or 0. */
    private int resourceId(String name) {
        if (overlay == null || overlay.getId() == View.NO_ID) return 0;
        Resources resources = overlay.getResources();
        try {
            return resources.getIdentifier(name, "id", resources.getResourcePackageName(overlay.getId()));
        } catch (Resources.NotFoundException e) {
            return 0;
        }
    }

    private void schedule(boolean frames, boolean check) {
        if (frames && !framePosted) {
            framePosted = true;
            Choreographer.getInstance().postFrameCallback(frame);
        } else if (!frames && framePosted) {
            framePosted = false;
            Choreographer.getInstance().removeFrameCallback(frame);
        }

        if (check && !pausedCheckPosted) {
            pausedCheckPosted = true;
            main.postDelayed(pausedCheck, PAUSED_CHECK_MILLIS);
        } else if (!check && pausedCheckPosted) {
            pausedCheckPosted = false;
            main.removeCallbacks(pausedCheck);
        }

        String work = frames ? "frames" : check ? "paused check" : "nothing";
        if (!work.equals(loggedWork)) {
            loggedWork = work;
            JimakuLog.info("Runs " + work);
        }
    }

    private void attach(ViewGroup found) {
        if (overlay == found && view != null && view.getParent() == found) return;
        if (overlay != null) overlay.removeOnLayoutChangeListener(layoutChange);
        // An overlay of a new activity gets a view of its own, so none keeps a finished activity.
        if (view != null && view.getContext() != found.getContext()) {
            if (view.getParent() instanceof ViewGroup oldParent) oldParent.removeView(view);
            view = null;
        }
        if (view == null) {
            view = new SubtitleView(found.getContext());
            view.setOnScreenChange(() -> Guard.run("screen change", this::update));
        }
        ViewParent parent = view.getParent();
        if (parent instanceof ViewGroup oldParent) oldParent.removeView(view);
        found.addView(view, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        if (message != null && message.getContext() != found.getContext()) {
            if (message.getParent() instanceof ViewGroup oldParent) oldParent.removeView(message);
            message = null;
        }
        boolean made = message == null;
        if (made) {
            message = new Message(found.getContext());
            message.setOnDismiss(() -> Guard.run("message closed", () -> {
                if (button != null && button.isShown()) button.performAccessibilityAction(AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null);
            }));
        }
        if (message.getParent() instanceof ViewGroup oldParent) oldParent.removeView(message);
        // Over the subtitles and YouTube's controls, so its buttons take their touches.
        found.addView(message, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        if (hint != null && hint.getContext() != found.getContext()) {
            if (hint.getParent() instanceof ViewGroup oldParent) oldParent.removeView(hint);
            hint = null;
        }
        if (hint == null) {
            hint = new Hint(found.getContext());
            hint.setFollow(this::placeHint);
            hint.setOnClose(() -> {
                Look seen = look();
                if (seen != null) seen.hintSeen();
                if (button != null && button.isShown()) button.performAccessibilityAction(AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null);
            });
        }
        if (hint.getParent() instanceof ViewGroup oldParent) oldParent.removeView(hint);
        found.addView(hint, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        found.addOnLayoutChangeListener(layoutChange);
        overlay = found;
        surfaceSearched = false;
        controlsRowSearched = false;
        JimakuLog.info("Attached to the player overlay");
        placeButton();
        // A new player activity has a new message: the job waited on shows in it again.
        if (made) session.messageReplaced();
    }

    /** The part of the view the video covers: the video surface cut to the view, or the whole view. */
    private Rect videoArea() {
        area.set(0, 0, view.getWidth(), view.getHeight());
        View video = videoSurface();
        if (video == null || !video.isShown() || video.getWidth() == 0) return area;
        view.getLocationInWindow(viewLocation);
        video.getLocationInWindow(otherLocation);
        int left = otherLocation[0] - viewLocation[0];
        int top = otherLocation[1] - viewLocation[1];
        surfaceArea.set(left, top, left + video.getWidth(), top + video.getHeight());
        if (surfaceArea.intersect(area)) area.set(surfaceArea);
        return area;
    }

    /** The largest surface the player draws video into, next to the overlay layout. */
    private View videoSurface() {
        View cached = surface.get();
        if (surfaceSearched && (cached == null || cached.isAttachedToWindow())) return cached;
        surfaceSearched = true;
        ViewParent root = overlay != null ? overlay.getParent() : null;
        if (!(root instanceof ViewGroup player)) return null;
        View largest = null;
        long largestArea = 0;
        ArrayDeque<View> queue = new ArrayDeque<>();
        queue.add(player);
        while (!queue.isEmpty()) {
            View next = queue.poll();
            if (next == view) continue;
            if (next instanceof SurfaceView || next instanceof TextureView) {
                long size = (long) next.getWidth() * next.getHeight();
                if (next.isShown() && size > largestArea) {
                    largest = next;
                    largestArea = size;
                }
            } else if (next instanceof ViewGroup group) {
                for (int i = 0; i < group.getChildCount(); i++) queue.add(group.getChildAt(i));
            }
        }
        surface = new WeakReference<>(largest);
        return largest;
    }

    /**
     * The top of the row of controls at the bottom of the player, in the view's coordinates, or -1:
     * the highest of YouTube's time and fullscreen button and the view the overlay-buttons listener
     * passed, which sits in that row. The container they sit in reaches far higher than they do.
     */
    private int controlsTop() {
        view.getLocationInWindow(viewLocation);
        int top = -1;
        for (View part : controlsRow()) top = higher(top, part);
        return higher(top, controls.get());
    }

    /** The higher of {@code top} and the top of {@code part} if it shows, in the view's coordinates. */
    private int higher(int top, View part) {
        if (part == null || !part.isShown() || part.getHeight() == 0) return top;
        part.getLocationInWindow(otherLocation);
        int partTop = otherLocation[1] - viewLocation[1];
        return top < 0 || partTop < top ? partTop : top;
    }

    /** YouTube's views of {@link #CONTROLS_ROW} in the overlay, searched again after a layout change. */
    private View[] controlsRow() {
        if (controlsRowSearched) return controlsRow;
        controlsRowSearched = true;
        Arrays.fill(controlsRow, null);
        for (int i = 0; i < CONTROLS_ROW.length; i++) {
            int id = resourceId(CONTROLS_ROW[i]);
            if (id != 0) controlsRow[i] = overlay.findViewById(id);
        }
        StringBuilder found = new StringBuilder();
        for (int i = 0; i < CONTROLS_ROW.length; i++) {
            if (controlsRow[i] != null) found.append(found.length() == 0 ? "" : ", ").append(CONTROLS_ROW[i]);
        }
        String row = found.length() == 0 ? "none" : found.toString();
        if (!row.equals(loggedControlsRow)) {
            loggedControlsRow = row;
            JimakuLog.info("Controls row found: " + row);
        }
        return controlsRow;
    }

    /**
     * Before the controls first show, the overlay buttons don't exist yet: find the player's
     * overlay layout in the activity's views instead. Runs only while subtitles are waiting to
     * show and no view is attached, at most on each of Morphe's player events.
     */
    private void findOverlayInActivity() {
        Activity current = activity.get();
        View decor = current != null && current.getWindow() != null ? current.getWindow().peekDecorView() : null;
        if (decor == null) return;
        ViewGroup largest = null;
        long largestArea = 0;
        ArrayDeque<View> queue = new ArrayDeque<>();
        queue.add(decor);
        while (!queue.isEmpty()) {
            View next = queue.poll();
            if (!(next instanceof ViewGroup group)) continue;
            if (OVERLAYS_LAYOUT.equals(group.getClass().getName())) {
                long size = (long) group.getWidth() * group.getHeight();
                if (group.isShown() && size > largestArea) {
                    largest = group;
                    largestArea = size;
                }
                continue;
            }
            for (int i = 0; i < group.getChildCount(); i++) queue.add(group.getChildAt(i));
        }
        if (largest != null) attach(largest);
    }

    private static ViewGroup overlaysLayout(View start) {
        for (ViewParent parent = start.getParent(); parent != null; parent = parent.getParent()) {
            if (parent instanceof ViewGroup group && OVERLAYS_LAYOUT.equals(group.getClass().getName())) return group;
        }
        return null;
    }

    /** A view's class and resource name, for the log. */
    private static String describe(View view) {
        String name = view.getClass().getName();
        if (view.getId() == View.NO_ID) return name;
        try {
            return name + " " + view.getResources().getResourceEntryName(view.getId());
        } catch (Resources.NotFoundException e) {
            return name;
        }
    }

    private static String ancestry(View start) {
        StringBuilder chain = new StringBuilder(start.getClass().getName());
        for (ViewParent parent = start.getParent(); parent != null; parent = parent.getParent()) {
            chain.append(" < ").append(parent.getClass().getName());
        }
        return chain.toString();
    }
}
