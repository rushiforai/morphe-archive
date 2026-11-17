package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.webkit.CookieManager;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebSettings;
import android.webkit.WebStorage;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * The window a shared video link plays in, over the chat it was tapped in (#188).
 *
 * <p>Nothing is scraped or downloaded. The frame loads the platform's own embed page, the one those sites publish for
 * anyone to put on a page, and the platform does the playing. YouTube's embed answers to the messages its frame
 * already listens for, so there the play, pause, replay and title come from the video itself and Hush draws the
 * buttons. The other three embeds carry their own buttons inside the frame, with the title line, the full-screen
 * button and the open-in-the-app button around them.
 *
 * <p>The frame gets a jar of its own that's emptied when the window opens and again when it closes, refuses
 * third-party cookies, keeps nothing on disk, and has storage, files, content and location all turned off. The
 * privacy host is tried first, and the ordinary one only if that fails to load, which happens on a phone or a router
 * that blocks the privacy host by name. If the second try fails too the window closes and the link goes on to the app
 * it belongs to, so a tap is never swallowed by a frame that stayed blank.
 */
final class LinkPlayerSheet {
    /** How long the buttons stay up after a tap while the video is playing. */
    static final long FADE_MS = 2000;
    /** How often the frame is asked where the video is up to. */
    static final long POLL_MS = 500;
    static final int FADE_ANIMATION_MS = 220;

    /** YouTube's own player states. Anything else means it isn't playing and isn't finished. */
    static final int ENDED = 0;
    static final int PLAYING = 1;
    static final int PAUSED = 2;

    /** The window that's up, so a second tap replaces it instead of stacking another one on top. Tests read it. */
    static volatile LinkPlayerSheet showing;

    /** Empties the frame's cookie jar. Tests swap it, since there's no browser process under them. */
    interface Jar {
        void clear();
    }

    static volatile Jar cookies = LinkPlayerSheet::clearBrowserState;

    private final Context context;
    private final Uri link;
    private final LinkPlayer.Embed embed;
    private final SettingsText text;
    private final Handler handler = new Handler(Looper.getMainLooper());

    Dialog dialog;
    WebView frame;
    TextView title;
    View root;
    View buttons;
    ImageView centre;
    FrameLayout stage;
    /** Whether a fade is waiting to run. Tracked here rather than asked of the handler, which only answers from API 29. */
    boolean fadeWaiting;

    /** How many times a page has been put in the frame, which stays at one across a full-screen round trip. */
    int loads;
    int state = -1;
    String videoTitle = "";
    boolean fullScreen;
    boolean onFallback;
    boolean closed;

    private LinkPlayerSheet(Context context, Uri link, LinkPlayer.Embed embed) {
        this.context = context;
        this.link = link;
        this.embed = embed;
        this.text = new SettingsText(context);
    }

    /**
     * Puts the player up over [context]. Answers no when it can't, which is the answer that leaves the tap to
     * Messenger: off the main thread, with no screen to hang a window on, or when the window itself refuses to show.
     */
    static boolean show(Context context, Uri link, LinkPlayer.Embed embed) {
        if (context == null || link == null || embed == null) return false;
        if (Looper.myLooper() != Looper.getMainLooper()) return false;
        Activity activity = ChatJump.activity(context);
        if (activity != null && (activity.isFinishing() || activity.isDestroyed())) return false;
        LinkPlayerSheet open = showing;
        if (open != null) open.close();
        LinkPlayerSheet sheet = new LinkPlayerSheet(context, link, embed);
        if (!sheet.open()) return false;
        showing = sheet;
        return true;
    }

    private boolean open() {
        try {
            cookies.clear();
            Dialog built = new Dialog(context, MaterialYouTheme.chatDialogTheme());
            built.setContentView(card());
            built.setOnDismissListener(gone -> release());
            built.setOnKeyListener((shown, code, event) -> {
                if (code != android.view.KeyEvent.KEYCODE_BACK || event.getAction() != android.view.KeyEvent.ACTION_UP) return false;
                if (fullScreen) {
                    setFullScreen(false);
                    return true;
                }
                return false;
            });
            dialog = built;
            Window window = built.getWindow();
            if (window != null) window.setLayout(WindowManager.LayoutParams.MATCH_PARENT, WindowManager.LayoutParams.WRAP_CONTENT);
            ChatJump.showOverChat(built, context);
            if (!built.isShowing()) {
                built.dismiss();
                return false;
            }
            load(embed.page);
            poll();
            showButtons();
            return true;
        } catch (RuntimeException | LinkageError error) {
            Settings.hookFailed(LinkPlayer.KEY, "Can't open the video link player", error);
            release();
            return false;
        }
    }

    // ---- the window's own views, built in code since the extension adds no Android resources ----

    private float density() {
        DisplayMetrics metrics = context.getResources().getDisplayMetrics();
        return metrics.density <= 0 ? 1f : metrics.density;
    }

    private int dp(int value) {
        return Math.round(value * density());
    }

    private View card() {
        LinearLayout root = new LinearLayout(context);
        this.root = root;
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(16), dp(16), dp(16), dp(16));

        title = new TextView(context);
        title.setMaxLines(1);
        title.setEllipsize(TextUtils.TruncateAt.END);
        title.setTextSize(15);
        title.setTextColor(MaterialYouTheme.chatIsLight() ? 0xFF1C1E21 : 0xFFE4E6EB);
        title.setText(embed.platform);
        root.addView(title, new LinearLayout.LayoutParams(-1, -2));

        stage = new FrameLayout(context);
        stage.setBackgroundColor(Color.BLACK);
        stage.setOnClickListener(tap -> showButtons());
        LinearLayout.LayoutParams stageParams = new LinearLayout.LayoutParams(-1, -2);
        stageParams.topMargin = dp(10);
        root.addView(stage, stageParams);

        frame = buildFrame();
        stage.addView(frame, new FrameLayout.LayoutParams(-1, -1));
        buttons = buildButtons();
        stage.addView(buttons, new FrameLayout.LayoutParams(-1, -1));
        return root;
    }

    /** The frame is sized to the shape the platform shows a video in, so nothing is letterboxed into a strip. */
    private void sizeStage() {
        if (stage == null) return;
        DisplayMetrics metrics = context.getResources().getDisplayMetrics();
        ViewGroup.LayoutParams params = stage.getLayoutParams();
        if (fullScreen) {
            params.height = metrics.heightPixels;
        } else {
            int width = metrics.widthPixels - dp(32);
            boolean tall = LinkPlayer.TIKTOK.equals(embed.platform) || LinkPlayer.INSTAGRAM.equals(embed.platform);
            params.height = tall ? Math.min(Math.round(width * 16f / 9f), Math.round(metrics.heightPixels * 0.7f))
                : Math.round(width * 9f / 16f);
        }
        stage.setLayoutParams(params);
    }

    @SuppressWarnings("deprecation")
    private WebView buildFrame() {
        WebView web = new WebView(context);
        web.setBackgroundColor(Color.BLACK);
        WebSettings settings = web.getSettings();
        // The embeds are scripts, so this one has to be on. Everything a script could keep or reach is not.
        settings.setJavaScriptEnabled(true);
        settings.setMediaPlaybackRequiresUserGesture(false);
        settings.setDomStorageEnabled(false);
        settings.setDatabaseEnabled(false);
        settings.setAllowFileAccess(false);
        settings.setAllowContentAccess(false);
        settings.setGeolocationEnabled(false);
        settings.setCacheMode(WebSettings.LOAD_NO_CACHE);
        settings.setJavaScriptCanOpenWindowsAutomatically(false);
        settings.setSupportMultipleWindows(false);
        settings.setSaveFormData(false);
        if (Build.VERSION.SDK_INT >= 29) settings.setForceDark(WebSettings.FORCE_DARK_ON);
        try {
            CookieManager jar = CookieManager.getInstance();
            jar.setAcceptThirdPartyCookies(web, false);
        } catch (RuntimeException | LinkageError noBrowser) {
            // A phone with no usable WebView answers here, and the window closes itself on the load failure below.
            Settings.hookFailedPrivately(LinkPlayer.KEY, "No cookie jar for the video frame", noBrowser);
        }
        web.setWebViewClient(new WebViewClient() {
            @Override public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
                // The player itself is frames within frames, so only a main-frame move away from the platform counts as
                // a tap. Everything the embed loads for itself is left alone, and a tap goes to the app it belongs to.
                if (request == null) return false;
                if (!request.isForMainFrame() || onEmbedHost(request.getUrl())) return false;
                handOff(request.getUrl());
                return true;
            }

            @Override public void onReceivedError(WebView view, WebResourceRequest request, WebResourceError error) {
                // YouTube's embed is a frame inside Hush's own page, so its failure is the one that matters there.
                if (request != null && !request.isForMainFrame() && !onEmbedHost(request.getUrl())) return;
                loadFailed();
            }
        });
        return web;
    }

    /** Whether [target] is the platform the window is showing, rather than somewhere a tap is taking the viewer. */
    boolean onEmbedHost(Uri target) {
        String host = LinkPlayer.host(target);
        return !host.isEmpty() && host.equals(LinkPlayer.host(Uri.parse(currentHost())));
    }

    /** The host the frame is pointed at, which is the ordinary YouTube one once the privacy host has failed. */
    String currentHost() {
        return onFallback && embed.fallbackPage != null ? LinkPlayer.YOUTUBE_FALLBACK_HOST : embed.host;
    }

    private View buildButtons() {
        FrameLayout overlay = new FrameLayout(context);
        overlay.setOnClickListener(tap -> showButtons());

        if (embed.ownControls) {
            centre = new ImageView(context);
            centre.setImageDrawable(new PlayerIcon(PlayerIcon.PLAY));
            centre.setBackground(pill());
            int pad = dp(14);
            centre.setPadding(pad, pad, pad, pad);
            centre.setContentDescription(text.get("link_player_play"));
            centre.setOnClickListener(tap -> toggle());
            FrameLayout.LayoutParams centreParams = new FrameLayout.LayoutParams(dp(64), dp(64), Gravity.CENTER);
            overlay.addView(centre, centreParams);
        }

        TextView open = new TextView(context);
        open.setText(text.get("link_player_open", embed.platform));
        open.setTextColor(Color.WHITE);
        open.setTextSize(13);
        open.setBackground(pill());
        open.setCompoundDrawablePadding(dp(6));
        Drawable opening = SettingsIcons.icon(context, SettingsIcons.OPENING, Color.WHITE);
        opening.setBounds(0, 0, dp(16), dp(16));
        open.setCompoundDrawables(opening, null, null, null);
        open.setPadding(dp(12), dp(8), dp(12), dp(8));
        open.setOnClickListener(tap -> handOff(link));
        FrameLayout.LayoutParams openParams = new FrameLayout.LayoutParams(-2, -2, Gravity.BOTTOM | Gravity.START);
        openParams.leftMargin = dp(10);
        openParams.bottomMargin = dp(10);
        overlay.addView(open, openParams);

        ImageView expand = new ImageView(context);
        expand.setImageDrawable(new PlayerIcon(PlayerIcon.FULL_SCREEN));
        expand.setBackground(pill());
        int pad = dp(9);
        expand.setPadding(pad, pad, pad, pad);
        expand.setContentDescription(text.get("link_player_full_screen"));
        expand.setOnClickListener(tap -> setFullScreen(!fullScreen));
        FrameLayout.LayoutParams expandParams = new FrameLayout.LayoutParams(dp(38), dp(38), Gravity.BOTTOM | Gravity.END);
        expandParams.rightMargin = dp(10);
        expandParams.bottomMargin = dp(10);
        overlay.addView(expand, expandParams);
        return overlay;
    }

    private Drawable pill() {
        GradientDrawable pill = new GradientDrawable();
        pill.setShape(GradientDrawable.RECTANGLE);
        pill.setCornerRadius(dp(20));
        pill.setColor(0x99000000);
        return pill;
    }

    // ---- what the frame is asked to do ----

    private void load(String page) {
        if (frame == null) return;
        loads++;
        sizeStage();
        if (embed.ownControls) frame.loadDataWithBaseURL(currentHost(), youtubeDocument(page), "text/html", "utf-8", null);
        else frame.loadUrl(page);
    }

    /**
     * The YouTube frame, wrapped in a page of Hush's own. The wrapper talks to the frame with the messages YouTube's
     * embed already listens for when enablejsapi is set, so no script of YouTube's is loaded to drive it and no Java
     * object is handed to the page. The player's state and the video's title come back the same way.
     */
    static String youtubeDocument(String page) {
        return "<!doctype html><html><head><meta charset='utf-8'>"
            + "<meta name='viewport' content='width=device-width,initial-scale=1'>"
            + "<style>html,body{margin:0;padding:0;background:#000;height:100%;overflow:hidden}"
            + "iframe{border:0;width:100%;height:100%;display:block}</style></head><body>"
            + "<iframe id='f' allow='autoplay; encrypted-media' allowfullscreen src='" + page + "'></iframe>"
            + "<script>var f=document.getElementById('f'),st=-1,ttl='';"
            + "function send(n,a){try{f.contentWindow.postMessage(JSON.stringify({event:'command',func:n,args:a||[]}),'*');}catch(e){}}"
            + "window.addEventListener('message',function(e){try{var d=JSON.parse(e.data);"
            + "if(d.event==='onStateChange'){st=d.info;}"
            + "else if(d.event==='infoDelivery'&&d.info){"
            + "if(typeof d.info.playerState==='number'){st=d.info.playerState;}"
            + "if(d.info.videoData&&d.info.videoData.title){ttl=d.info.videoData.title;}}}catch(x){}});"
            + "f.addEventListener('load',function(){try{f.contentWindow.postMessage(JSON.stringify({event:'listening'}),'*');}catch(e){}});"
            + "function hushPlay(){send('playVideo');}function hushPause(){send('pauseVideo');}"
            + "function hushReplay(){send('seekTo',[0,true]);send('playVideo');}"
            + "function hushStatus(){return st+'\\u0001'+ttl;}</script></body></html>";
    }

    private void poll() {
        if (closed || frame == null || !embed.ownControls) return;
        frame.evaluateJavascript("hushStatus()", this::onStatus);
        handler.postDelayed(this::poll, POLL_MS);
    }

    /** The frame's answer: the player's state and the video's title, as the wrapper packs them. */
    void onStatus(String answer) {
        if (answer == null) return;
        String unquoted = answer;
        if (unquoted.length() >= 2 && unquoted.startsWith("\"") && unquoted.endsWith("\"")) {
            unquoted = unquoted.substring(1, unquoted.length() - 1).replace("\\\"", "\"").replace("\\\\", "\\");
        }
        if ("null".equals(unquoted)) return;
        // The frame packs the two answers with a character no title holds. It arrives as its JSON escape.
        unquoted = unquoted.replace("\\u0001", "\u0001");
        int split = unquoted.indexOf('\u0001');
        String reported = split < 0 ? unquoted : unquoted.substring(0, split);
        String name = split < 0 ? "" : unquoted.substring(split + 1);
        int was = state;
        try {
            state = Integer.parseInt(reported.trim());
        } catch (NumberFormatException notAState) {
            return;
        }
        if (!name.isEmpty() && !name.equals(videoTitle)) {
            videoTitle = name;
            if (title != null) title.setText(name);
        }
        if (state != was) onStateChanged();
    }

    private void onStateChanged() {
        if (centre != null) {
            centre.setImageDrawable(new PlayerIcon(state == ENDED ? PlayerIcon.REPLAY
                : state == PLAYING ? PlayerIcon.PAUSE : PlayerIcon.PLAY));
            centre.setContentDescription(text.get(state == ENDED ? "link_player_replay"
                : state == PLAYING ? "link_player_pause" : "link_player_play"));
        }
        // Paused or finished, the buttons are what the screen is for, so they stay up until it plays again.
        if (state == PLAYING) showButtons();
        else keepButtons();
    }

    private void toggle() {
        if (frame == null) return;
        if (state == ENDED) frame.evaluateJavascript("hushReplay()", null);
        else if (state == PLAYING) frame.evaluateJavascript("hushPause()", null);
        else frame.evaluateJavascript("hushPlay()", null);
        showButtons();
    }

    // ---- the buttons coming and going ----

    /** Brings the buttons back and starts the fade again, unless the video is paused or finished. */
    void showButtons() {
        if (buttons == null) return;
        handler.removeCallbacks(this.fade);
        fadeWaiting = false;
        buttons.setAlpha(1f);
        buttons.setVisibility(View.VISIBLE);
        if (!embed.ownControls || state == PLAYING) {
            handler.postDelayed(this.fade, FADE_MS);
            fadeWaiting = true;
        }
    }

    /** Leaves the buttons up with no fade waiting, for when the video isn't playing. */
    private void keepButtons() {
        if (buttons == null) return;
        handler.removeCallbacks(this.fade);
        fadeWaiting = false;
        buttons.setAlpha(1f);
        buttons.setVisibility(View.VISIBLE);
    }

    private final Runnable fade = new Runnable() {
        @Override public void run() {
            fadeWaiting = false;
            if (closed || buttons == null) return;
            buttons.animate().alpha(0f).setDuration(FADE_ANIMATION_MS)
                .withEndAction(() -> {
                    if (!closed && buttons != null && buttons.getAlpha() == 0f) buttons.setVisibility(View.INVISIBLE);
                });
        }
    };

    // ---- full screen ----

    /**
     * Full screen fills the window and takes the system bars away. The frame itself is never rebuilt, so the video
     * carries on from where it was rather than starting again.
     */
    void setFullScreen(boolean on) {
        if (fullScreen == on || dialog == null) return;
        fullScreen = on;
        sizeStage();
        if (title != null) title.setVisibility(on ? View.GONE : View.VISIBLE);
        int pad = on ? 0 : dp(16);
        if (root != null) root.setPadding(pad, pad, pad, pad);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setLayout(WindowManager.LayoutParams.MATCH_PARENT,
                on ? WindowManager.LayoutParams.MATCH_PARENT : WindowManager.LayoutParams.WRAP_CONTENT);
            systemBars(window, on);
        }
        showButtons();
    }

    @SuppressWarnings("deprecation")
    private void systemBars(Window window, boolean hidden) {
        try {
            if (Build.VERSION.SDK_INT >= 30) {
                android.view.WindowInsetsController bars = window.getInsetsController();
                if (bars == null) return;
                if (hidden) bars.hide(android.view.WindowInsets.Type.systemBars());
                else bars.show(android.view.WindowInsets.Type.systemBars());
            } else {
                View decor = window.getDecorView();
                decor.setSystemUiVisibility(hidden
                    ? View.SYSTEM_UI_FLAG_FULLSCREEN | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION | View.SYSTEM_UI_FLAG_IMMERSIVE
                    : 0);
            }
        } catch (RuntimeException | LinkageError error) {
            // A window that won't hide its bars is still a window the video plays in.
            Settings.hookFailedPrivately(LinkPlayer.KEY, "Can't hide the bars for the video", error);
        }
    }

    // ---- leaving ----

    /**
     * The privacy host failed, so the ordinary one gets one try. A second failure means the frame isn't going to show
     * anything, and the link goes on to the app it belongs to rather than leaving an empty window up.
     */
    void loadFailed() {
        if (closed) return;
        if (!onFallback && embed.fallbackPage != null) {
            onFallback = true;
            load(embed.fallbackPage);
            return;
        }
        handOff(link);
    }

    /** Closes the player and opens [target] the way the chat would have without the switch. */
    void handOff(Uri target) {
        close();
        try {
            Intent open = new Intent(Intent.ACTION_VIEW, target == null ? link : target);
            open.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(open);
        } catch (RuntimeException noApp) {
            Settings.hookFailedPrivately(LinkPlayer.KEY, "Nothing on the phone opens that link", noApp);
        }
    }

    void close() {
        // The dialog's own dismiss listener arrives on a posted message, so the teardown runs here rather than waiting
        // for it. release() only ever runs once, so the listener landing afterwards costs nothing.
        if (dialog != null && dialog.isShowing()) dialog.dismiss();
        release();
    }

    /** Everything the window held, let go of once: the frame, its jar, the timers and the record of being up. */
    void release() {
        if (closed) return;
        closed = true;
        fadeWaiting = false;
        handler.removeCallbacksAndMessages(null);
        if (frame != null) {
            try {
                frame.stopLoading();
                frame.loadUrl("about:blank");
                frame.clearHistory();
                frame.clearCache(true);
                ViewGroup parent = (ViewGroup) frame.getParent();
                if (parent != null) parent.removeView(frame);
                frame.destroy();
            } catch (RuntimeException | LinkageError error) {
                Settings.hookFailedPrivately(LinkPlayer.KEY, "Can't tear down the video frame", error);
            }
            frame = null;
        }
        cookies.clear();
        if (showing == this) showing = null;
    }

    private static void clearBrowserState() {
        try {
            CookieManager jar = CookieManager.getInstance();
            jar.removeAllCookies(null);
            jar.flush();
            WebStorage.getInstance().deleteAllData();
        } catch (RuntimeException | LinkageError noBrowser) {
            Settings.hookFailedPrivately(LinkPlayer.KEY, "Can't empty the video frame's jar", noBrowser);
        }
    }

    /** The player's own buttons, drawn rather than shipped, so they stay sharp at any size and add nothing to carry. */
    static final class PlayerIcon extends Drawable {
        static final int PLAY = 0;
        static final int PAUSE = 1;
        static final int REPLAY = 2;
        static final int FULL_SCREEN = 3;

        private final int shape;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        PlayerIcon(int shape) {
            this.shape = shape;
            paint.setColor(Color.WHITE);
        }

        @Override public void draw(Canvas canvas) {
            Rect at = getBounds();
            float w = at.width();
            float h = at.height();
            float cx = at.left + w / 2f;
            float cy = at.top + h / 2f;
            float stroke = Math.max(2f, Math.min(w, h) / 10f);
            switch (shape) {
                case PLAY: {
                    Path play = new Path();
                    play.moveTo(at.left + w * 0.3f, at.top + h * 0.2f);
                    play.lineTo(at.left + w * 0.82f, cy);
                    play.lineTo(at.left + w * 0.3f, at.top + h * 0.8f);
                    play.close();
                    paint.setStyle(Paint.Style.FILL);
                    canvas.drawPath(play, paint);
                    break;
                }
                case PAUSE: {
                    paint.setStyle(Paint.Style.FILL);
                    float bar = w * 0.17f;
                    canvas.drawRect(cx - bar * 1.6f, at.top + h * 0.2f, cx - bar * 0.4f, at.top + h * 0.8f, paint);
                    canvas.drawRect(cx + bar * 0.4f, at.top + h * 0.2f, cx + bar * 1.6f, at.top + h * 0.8f, paint);
                    break;
                }
                case REPLAY: {
                    paint.setStyle(Paint.Style.STROKE);
                    paint.setStrokeWidth(stroke);
                    paint.setStrokeCap(Paint.Cap.ROUND);
                    float radius = Math.min(w, h) * 0.3f;
                    canvas.drawArc(cx - radius, cy - radius, cx + radius, cy + radius, 300f, 300f, false, paint);
                    Path head = new Path();
                    head.moveTo(cx + radius * 0.2f, cy - radius * 1.1f);
                    head.lineTo(cx + radius * 1.1f, cy - radius * 0.9f);
                    head.lineTo(cx + radius * 0.5f, cy - radius * 0.2f);
                    head.close();
                    paint.setStyle(Paint.Style.FILL);
                    canvas.drawPath(head, paint);
                    break;
                }
                default: {
                    paint.setStyle(Paint.Style.STROKE);
                    paint.setStrokeWidth(stroke);
                    paint.setStrokeCap(Paint.Cap.ROUND);
                    float inset = Math.min(w, h) * 0.22f;
                    float arm = Math.min(w, h) * 0.2f;
                    float l = at.left + inset;
                    float t = at.top + inset;
                    float r = at.right - inset;
                    float b = at.bottom - inset;
                    canvas.drawLine(l, t, l + arm, t, paint);
                    canvas.drawLine(l, t, l, t + arm, paint);
                    canvas.drawLine(r, t, r - arm, t, paint);
                    canvas.drawLine(r, t, r, t + arm, paint);
                    canvas.drawLine(l, b, l + arm, b, paint);
                    canvas.drawLine(l, b, l, b - arm, paint);
                    canvas.drawLine(r, b, r - arm, b, paint);
                    canvas.drawLine(r, b, r, b - arm, paint);
                }
            }
        }

        @Override public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override public void setColorFilter(ColorFilter filter) {
            paint.setColorFilter(filter);
        }

        @Override public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
