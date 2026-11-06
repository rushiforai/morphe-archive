package app.morphe.extension.youtube.bilibilidanmaku;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.Toast;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.youtube.patches.VideoInformation;
import app.morphe.extension.youtube.shared.PlayerType;
import app.morphe.extension.youtube.shared.VideoState;

/** Called by the YouTube bytecode patch. All view and dialog mutations run on the main thread. */
@SuppressWarnings("unused")
public final class BilibiliDanmakuController {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final BilibiliDanmakuSource SOURCE = new BilibiliDanmakuSource();
    private static final Object CLOCK = new Object();
    private static final String PREFS = "morphe_bilibili_danmaku";
    private static final String OVERLAY_TAG = "morphe_bilibili_danmaku_overlay";

    private static WeakReference<ViewGroup> rootRef = new WeakReference<>(null);
    private static WeakReference<BilibiliDanmakuOverlayView> overlayRef = new WeakReference<>(null);
    private static volatile String videoId = "";
    private static volatile boolean playing;
    private static volatile boolean visible;
    private static boolean observed;
    private static volatile long generation;
    private static volatile Thread task;
    private static String startedForVideo = "";
    private static String currentSource = "";
    private static String currentSourceTitle = "";
    private static String currentSourceCover = "";
    private static String status = "点击选择弹幕";
    private static volatile boolean loginNeeded;
    private static boolean loginHintShown;
    private static List<DanmakuComment> currentData = Collections.emptyList();

    private static long sampledVideoTimeMs = -1;
    private static long sampledAtRealtimeMs;
    private static double playbackSpeed = 1.0;

    private BilibiliDanmakuController() {}

    /** Injection point. Receives the player view that contains SponsorBlock's overlay. */
    public static void initialize(ViewGroup overlayRoot) {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            MAIN.post(() -> initialize(overlayRoot));
            return;
        }
        try {
            if (!(overlayRoot instanceof FrameLayout)) return;
            ViewGroup previousRoot = rootRef.get();
            if (previousRoot != null && previousRoot != overlayRoot) {
                BilibiliDanmakuOverlayView previousOverlay = overlayRef.get();
                if (previousOverlay != null) previousOverlay.setActive(false);
            }
            if (!observed) {
                observed = true;
                app.morphe.extension.youtube.addon.AddOnApi.addVideoStateListener(BilibiliDanmakuController::setVideoState);
            }
            setSpeed(VideoInformation.getPlaybackSpeed());

            BilibiliDanmakuOverlayView layer = (BilibiliDanmakuOverlayView) overlayRoot.findViewWithTag(OVERLAY_TAG);
            if (layer == null) {
                layer = new BilibiliDanmakuOverlayView(overlayRoot.getContext());
                layer.setTag(OVERLAY_TAG);
                overlayRoot.addView(layer, 0, new FrameLayout.LayoutParams(-1, -1));
            }
            rootRef = new WeakReference<>(overlayRoot);
            overlayRef = new WeakReference<>(layer);
            BilibiliDanmakuSession.initialize(overlayRoot.getContext());
            BilibiliDanmakuAuth.maintainAsync(overlayRoot.getContext());
            layer.setComments(currentData);
            visible = PlayerType.getCurrent().isMaximizedOrFullscreen();
            setVideoState(VideoState.getCurrent());
            updateView();
            maybeStart();
        } catch (Exception ex) {
            Logger.printException(() -> "BilibiliDanmaku initialize", ex);
        }
    }

    /** Injection point. YouTube video IDs are used to keep per-video selections isolated. */
    public static void newVideoLoaded(String id) {
        if (id == null || id.isEmpty() || id.equals(videoId)) return;
        videoId = id;
        // Invalidate callbacks immediately: the video-id hook may run off the main thread.
        cancelTask();
        synchronized (CLOCK) {
            sampledVideoTimeMs = -1;
            sampledAtRealtimeMs = SystemClock.elapsedRealtime();
        }
        MAIN.post(() -> {
            if (!id.equals(videoId)) return;
            startedForVideo = "";
            currentSource = "";
            currentSourceTitle = "";
            currentSourceCover = "";
            currentData = Collections.emptyList();
            loginNeeded = false;
            status = "当前视频尚未匹配";
            BilibiliDanmakuOverlayView overlay = overlayRef.get();
            if (overlay != null) overlay.clearComments();
            BilibiliDanmakuSheet.sourceChanged();
            updateView();
            maybeStart();
        });
    }

    /** Injection point. Milliseconds of the current YouTube playback position. */
    public static void setVideoTime(long timeMs) {
        setPlayerType(PlayerType.getCurrent());
        setSpeed(VideoInformation.getPlaybackSpeed());
        synchronized (CLOCK) {
            sampledVideoTimeMs = timeMs;
            sampledAtRealtimeMs = SystemClock.elapsedRealtime();
        }
        BilibiliDanmakuOverlayView overlay = overlayRef.get();
        if (overlay != null) overlay.postInvalidateOnAnimation();
    }

    static long currentTimeMs() {
        synchronized (CLOCK) {
            if (sampledVideoTimeMs < 0 || !playing) return sampledVideoTimeMs;
            return sampledVideoTimeMs + Math.max(0, Math.round(
                    (SystemClock.elapsedRealtime() - sampledAtRealtimeMs) * playbackSpeed));
        }
    }

    private static void setPlayerType(PlayerType type) {
        visible = type != null && type.isMaximizedOrFullscreen();
        MAIN.post(() -> { updateView(); maybeStart(); });
    }

    public static void setVideoState(VideoState state) {
        synchronized (CLOCK) {
            boolean next = state == VideoState.PLAYING;
            if (playing && !next && sampledVideoTimeMs >= 0) {
                sampledVideoTimeMs = sampledVideoTimeMs + Math.max(0, Math.round(
                        (SystemClock.elapsedRealtime() - sampledAtRealtimeMs) * playbackSpeed));
            }
            sampledAtRealtimeMs = SystemClock.elapsedRealtime();
            playing = next;
        }
        MAIN.post(BilibiliDanmakuController::updateView);
    }

    private static void setSpeed(float speed) {
        synchronized (CLOCK) {
            if (playing && sampledVideoTimeMs >= 0) {
                sampledVideoTimeMs += Math.max(0, Math.round(
                        (SystemClock.elapsedRealtime() - sampledAtRealtimeMs) * playbackSpeed));
            }
            sampledAtRealtimeMs = SystemClock.elapsedRealtime();
            playbackSpeed = speed > 0 && !Float.isNaN(speed) && !Float.isInfinite(speed) ? speed : 1.0;
        }
    }

    static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static Context appContext() {
        ViewGroup root = rootRef.get();
        return root == null ? null : root.getContext().getApplicationContext();
    }

    static void updateView() {
        Context context = appContext();
        if (context == null) return;
        SharedPreferences p = prefs(context);
        boolean enabled = p.getBoolean("enabled", false);
        BilibiliDanmakuOverlayView overlay = overlayRef.get();
        if (overlay != null) {
            overlay.updateSettings(p.getInt("font", 19), p.getInt("opacity", 85), p.getInt("travel", 8),
                    p.getInt("area", 75), p.getInt("line_spacing", BilibiliDanmakuOverlayView.DEFAULT_LINE_SPACING),
                    p.getInt("max_len", 120), p.getBoolean("hide_color", false),
                    p.getBoolean("hide_fixed", false), p.getString("keywords", ""),
                    p.getFloat("rate", 1f), p.getLong("offset_ms", 0));
            overlay.setActive(enabled && visible && !videoId.isEmpty());
            overlay.setPlaying(playing);
        }
    }

    private static void setStatus(String text) {
        status = text;
        updateView();
        BilibiliDanmakuSheet.updateHeader();
    }

    static final int TONE_IDLE = 0, TONE_BUSY = 1, TONE_READY = 2, TONE_WARN = 3, TONE_ERROR = 4;

    /** Colour of the status dot shown next to the status line in the menu. */
    static int statusTone() {
        String text = status;
        if (loginNeeded) return TONE_WARN;
        if (text.startsWith("已加载")) return TONE_READY;
        if (text.startsWith("加载失败")) return TONE_ERROR;
        if (text.startsWith("正在") || text.startsWith("搜索中") || text.startsWith("下载弹幕")
                || text.startsWith("等待")) return TONE_BUSY;
        if (text.equals("弹幕已关闭") || text.equals("点击选择弹幕") || text.equals("当前视频尚未匹配")) return TONE_IDLE;
        return TONE_WARN;
    }

    /** Bilibili refused the last request because a (valid) login is required. */
    static boolean needsLogin() { return loginNeeded; }

    static int loadedCount() { return currentData.size(); }

    /** After a successful login, retry the current video with the new credentials. */
    static void reloadAfterLogin() {
        boolean retry = loginNeeded;
        loginNeeded = false;
        Context context = appContext();
        if (context == null || !prefs(context).getBoolean("enabled", false)) return;
        if (retry || currentData.isEmpty()) {
            startedForVideo = "";
            maybeStart();
        }
    }

    static ViewGroup playerRoot() { return rootRef.get(); }
    static String displayStatus() { return status; }
    static String displaySource() { return currentSource; }
    static String displaySourceTitle() { return currentSourceTitle; }
    static String displaySourceCover() { return currentSourceCover; }

    static void openCurrentSource(Context context) {
        String reference = currentSource;
        if (reference.isEmpty() || "本地 XML".equals(reference)) return;
        try {
            String normalized = BilibiliDanmakuSource.extractReference(reference);
            String url;
            if (normalized.startsWith("http://") || normalized.startsWith("https://")) {
                url = normalized;
            } else if (normalized.matches("(?i)ep\\d+|ss\\d+")) {
                url = "https://www.bilibili.com/bangumi/play/" + normalized;
            } else {
                url = "https://www.bilibili.com/video/" + normalized;
            }
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
            intent.setPackage("tv.danmaku.bili");
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            try {
                context.startActivity(intent);
            } catch (android.content.ActivityNotFoundException missingApp) {
                intent.setPackage(null);
                context.startActivity(intent);
            }
        } catch (Exception ex) {
            toast(context, "无法打开来源视频：" + ex.getMessage());
        }
    }
    static boolean hasComments() { return !currentData.isEmpty(); }

    static List<DanmakuComment> findComments(String keyword) {
        BilibiliDanmakuOverlayView overlay = overlayRef.get();
        return overlay == null ? Collections.emptyList() : overlay.findComments(keyword, 80);
    }

    static void seekToComment(Context context, DanmakuComment comment) {
        BilibiliDanmakuOverlayView overlay = overlayRef.get();
        if (overlay == null) return;
        long videoMs = Math.max(0, Math.round((comment.timeMs - overlay.offsetMs()) / overlay.rate()));
        if (!VideoInformation.seekTo(videoMs)) toast(context, "当前播放器无法跳转");
    }

    static void disableDanmaku(Context context) {
        prefs(context).edit().putBoolean("enabled", false).apply();
        cancelTask();
        setStatus("弹幕已关闭");
        updateView();
    }

    static void restartAutoSearch(Activity host) {
        prefs(host).edit().putBoolean("enabled", true).apply();
        startedForVideo = "";
        cancelTask();
        updateView();
        autoSearch(host);
    }

    static void openXmlPicker(Activity host) {
        host.startActivity(new Intent(host, BilibiliXmlPickerActivity.class));
    }

    private static Activity activity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            Context base = ((ContextWrapper) context).getBaseContext();
            if (base == context) break;
            context = base;
        }
        return null;
    }

    private static void toast(Context context, String message) {
        Toast.makeText(context, message, Toast.LENGTH_LONG).show();
    }

    public static void showMenu(Context context) {
        Activity host = activity(context);
        if (host == null || host.isFinishing()) return;
        BilibiliDanmakuSession.initialize(host);
        BilibiliDanmakuSheet.open(host);
    }

    static void enableDanmaku(Activity host) {
        prefs(host).edit().putBoolean("enabled", true).apply();
        startedForVideo = "";
        setStatus("正在准备弹幕…");
        updateView();
        maybeStart();
    }

    private static void maybeStart() {
        Context context = appContext();
        if (context == null || !visible || videoId.isEmpty() || !prefs(context).getBoolean("enabled", false)) return;
        if (videoId.equals(startedForVideo)) return;
        startedForVideo = videoId;
        // Long-lived sessions: renew the login well before Bilibili retires it (throttled).
        BilibiliDanmakuAuth.maintainAsync(context);
        String stored = prefs(context).getString("source_" + videoId, "");
        if ("xml".equals(stored)) loadSavedXml(context);
        else if (!stored.isEmpty()) loadVideoSource(context, stored);
        else {
            ViewGroup root = rootRef.get();
            Activity host = root == null ? null : activity(root.getContext());
            if (host != null) autoSearch(host);
        }
    }

    private static synchronized void cancelTask() {
        generation++;
        if (task != null) { task.interrupt(); task = null; }
    }

    private interface BackgroundAction { void run(long ticket) throws Exception; }

    private static void launch(BackgroundAction action) {
        cancelTask();
        long ticket = generation;
        Thread next = new Thread(() -> {
            try { action.run(ticket); }
            catch (InterruptedException ignored) { Thread.currentThread().interrupt(); }
            catch (Exception ex) {
                MAIN.post(() -> {
                    if (ticket != generation) return;
                    Context ctx = appContext();
                    if (ex instanceof BilibiliDanmakuSource.LoginRequiredException) {
                        // Not an error the user can fix by retrying: guide them to log in instead.
                        loginNeeded = true;
                        setStatus(ex.getMessage());
                        BilibiliDanmakuSheet.loginRequired();
                        if (ctx != null && !loginHintShown && !BilibiliDanmakuSheet.isShowing()) {
                            loginHintShown = true;
                            toast(ctx, "B 站弹幕：" + ex.getMessage() + "。点击播放器上的弹幕按钮即可扫码登录");
                        }
                        return;
                    }
                    Logger.printException(() -> "Bilibili danmaku loading", ex);
                    setStatus("加载失败：" + ex.getMessage());
                    if (ctx != null) toast(ctx, "B站弹幕加载失败：" + ex.getMessage());
                });
            }
        }, "BilibiliDanmakuLoader");
        task = next;
        next.start();
    }

    private static void autoSearch(Activity host) {
        // Only one outstanding delayed title lookup may own the automatic search.
        // Explicit user actions increment generation and supersede this lookup.
        autoSearch(host, videoId, generation, 0);
    }

    private static void autoSearch(Activity host, String requestedVideo, long ticket, int attempt) {
        if (ticket != generation || !requestedVideo.equals(videoId)
                || host.isFinishing() || host.isDestroyed()) return;
        if (!prefs(host).getBoolean("enabled", false)) return;
        // The video-id hook can run before the title of the new video is available.
        String loadedVideo = VideoInformation.getVideoId();
        String title = VideoInformation.getVideoTitle();
        if (!requestedVideo.equals(loadedVideo) || title == null || title.trim().isEmpty()) {
            if (attempt < 8) {
                MAIN.postDelayed(() -> autoSearch(host, requestedVideo, ticket, attempt + 1), 1500);
                setStatus("等待视频标题…");
            } else setStatus("未获取到视频标题，请手动搜索或输入链接");
            return;
        }
        search(host, title, true);
    }

    static void search(Activity host, String query, boolean auto) {
        if (query.isEmpty()) { toast(host, "请输入搜索关键词"); return; }
        final String id = videoId;
        setStatus("搜索中：" + query);
        launch(ticket -> {
            List<BilibiliDanmakuSource.Candidate> candidates = SOURCE.search(query);
            MAIN.post(() -> {
                if (ticket != generation || !id.equals(videoId) || host.isFinishing()) return;
                if (candidates.isEmpty()) { setStatus("无搜索结果，可手动输入链接"); return; }
                if (auto) {
                    BilibiliDanmakuSource.Candidate match = BilibiliDanmakuSource.bestMatch(
                            candidates, query, VideoInformation.getVideoLength());
                    if (match != null) loadVideoSource(host, match.bvid);
                    else {
                        setStatus("自动匹配不确定，请选择来源");
                        showCandidates(host, candidates);
                    }
                } else {
                    setStatus("请选择匹配来源");
                    showCandidates(host, candidates);
                }
            });
        });
    }

    private static void showCandidates(Activity host, List<BilibiliDanmakuSource.Candidate> candidates) {
        BilibiliDanmakuSheet.showCandidates(host, candidates);
    }

    static void choosePage(Activity host, String reference) {
        final String id = videoId;
        setStatus("正在获取视频分 P…");
        launch(ticket -> {
            List<BilibiliDanmakuSource.Page> pages = SOURCE.pages(reference);
            MAIN.post(() -> {
                if (ticket != generation || !id.equals(videoId) || host.isFinishing() || host.isDestroyed()) return;
                if (pages.size() <= 1) { loadVideoSource(host, reference); return; }
                BilibiliDanmakuSheet.showParts(host, reference, pages);
            });
        });
    }

    static void manual(Activity host, String sharedText) {
        final String reference;
        try { reference = BilibiliDanmakuSource.extractReference(sharedText); }
        catch (java.io.IOException ex) { toast(host, ex.getMessage()); return; }
        try {
            if (BilibiliDanmakuSource.isShortReference(reference)) {
                final String id = videoId;
                setStatus("正在解析 B 站分享链接…");
                launch(ticket -> {
                    String expanded = BilibiliDanmakuSource.expandShortReference(reference);
                    MAIN.post(() -> {
                        if (ticket == generation && id.equals(videoId) && !host.isFinishing() && !host.isDestroyed())
                            manual(host, expanded);
                    });
                });
                return;
            }
        } catch (java.io.IOException ex) { toast(host, ex.getMessage()); return; }
        if (reference.matches("(?is).*\\bss\\d+.*")) {
            final String id = videoId;
            setStatus("正在获取番剧剧集…");
            launch(ticket -> {
                List<BilibiliDanmakuSource.Episode> episodes = SOURCE.episodes(reference);
                MAIN.post(() -> {
                    if (ticket != generation || !id.equals(videoId) || host.isFinishing()) return;
                    BilibiliDanmakuSheet.showEpisodes(host, episodes);
                });
            });
        } else if (reference.matches("(?is).*\\b(?:bv[0-9a-z]{10}|av\\d+).*" )
                && !reference.matches("(?is).*[?&]p=\\d+.*")) {
            choosePage(host, reference);
        } else loadVideoSource(host, reference);
    }

    static void loadVideoSource(Context context, String sharedText) {
        final String reference;
        try { reference = BilibiliDanmakuSource.extractReference(sharedText); }
        catch (java.io.IOException ex) { toast(context, ex.getMessage()); return; }
        final String id = videoId;
        setStatus("正在解析：" + reference);
        prefs(context).edit().putBoolean("enabled", true).apply();
        startedForVideo = id;
        launch(ticket -> {
            BilibiliDanmakuSource.VideoSource info = SOURCE.resolve(reference);
            // Show the source card as soon as metadata arrives; downloading the
            // danmaku segments can take considerably longer than video lookup.
            MAIN.post(() -> {
                if (ticket != generation || !id.equals(videoId)) return;
                currentSource = reference;
                currentSourceTitle = info.title;
                currentSourceCover = info.cover;
                BilibiliDanmakuSheet.sourceChanged();
            });
            List<DanmakuComment> comments = SOURCE.download(info, (done, total) ->
                    MAIN.post(() -> {
                        if (ticket == generation && id.equals(videoId)) setStatus("下载弹幕 " + done + "/" + total + " 段");
                    }));
            MAIN.post(() -> {
                if (ticket != generation || !id.equals(videoId)) return;
                prefs(context).edit().putString("source_" + id, reference).apply();
                deliver(id, reference, info.title, info.cover, comments);
            });
        });
    }

    private static void deliver(String id, String source, List<DanmakuComment> data) {
        deliver(id, source, source, "", data);
    }

    private static void deliver(String id, String source, String title, String cover, List<DanmakuComment> data) {
        if (!id.equals(videoId)) return;
        currentData = data;
        currentSource = source;
        currentSourceTitle = title;
        currentSourceCover = cover;
        loginNeeded = false;
        BilibiliDanmakuOverlayView overlay = overlayRef.get();
        if (overlay != null) overlay.setComments(data);
        setStatus(String.format(java.util.Locale.ROOT, "已加载 %,d 条弹幕", data.size()));
        Context context = appContext();
        if (context != null && !BilibiliDanmakuSheet.isShowing())
            toast(context, String.format(java.util.Locale.ROOT, "B站弹幕：已加载 %,d 条", data.size()));
        updateView();
        BilibiliDanmakuSheet.sourceChanged();
    }

    private static String xmlFileName(String id) {
        return "morphe_bilibili_" + id.replaceAll("[^a-zA-Z0-9_-]", "") + ".xml";
    }

    private static void loadSavedXml(Context context) {
        final String id = videoId;
        setStatus("正在读取已导入的 XML…");
        launch(ticket -> {
            byte[] bytes;
            try (FileInputStream in = context.openFileInput(xmlFileName(id))) {
                bytes = BilibiliDanmakuSource.readBounded(in, BilibiliDanmakuSource.MAX_XML_BYTES);
            }
            List<DanmakuComment> data = BilibiliDanmakuSource.parseXml(bytes);
            MAIN.post(() -> {
                if (ticket == generation && id.equals(videoId)) deliver(id, "本地 XML", data);
            });
        });
    }

    /** Called by the translucent picker Activity when a document is selected. */
    static void importXml(Context context, Uri uri) {
        final String id = videoId;
        if (id.isEmpty()) { toast(context, "请先打开 YouTube 视频"); return; }
        setStatus("正在导入 XML…");
        launch(ticket -> {
            InputStream in = context.getContentResolver().openInputStream(uri);
            if (in == null) throw new java.io.IOException("无法打开 XML 文件");
            byte[] bytes = BilibiliDanmakuSource.readBounded(in, BilibiliDanmakuSource.MAX_XML_BYTES);
            List<DanmakuComment> data = BilibiliDanmakuSource.parseXml(bytes);
            if (data.isEmpty()) throw new java.io.IOException("没有读取到有效的 B 站 XML 弹幕");
            if (ticket != generation || !id.equals(videoId)) return;
            try (FileOutputStream out = context.openFileOutput(xmlFileName(id), Context.MODE_PRIVATE)) {
                out.write(bytes);
            }
            MAIN.post(() -> {
                if (ticket != generation || !id.equals(videoId)) return;
                prefs(context).edit().putString("source_" + id, "xml").putBoolean("enabled", true).apply();
                startedForVideo = id;
                deliver(id, "本地 XML", data);
            });
        });
    }

}
