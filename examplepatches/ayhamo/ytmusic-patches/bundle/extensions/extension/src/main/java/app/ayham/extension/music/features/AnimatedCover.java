package app.ayham.extension.music.features;

import android.app.Activity;
import android.graphics.Matrix;
import android.graphics.SurfaceTexture;
import android.media.MediaPlayer;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Surface;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.Properties;

/**
 * Animated covers (BitChord's canvas, no Kawarp): a muted, looping motion clip drawn over
 * YouTube Music's own album art (player_thumbnail), the way BitChord does it, with Android's
 * MediaPlayer on a TextureView. Only one clip plays, only while the player is expanded and in
 * song mode; otherwise it is paused and hidden, and YT's art shows as usual.
 *
 * spike.properties: canvas=1 turns it on; canvasUrl=... plays that URL for every song (test);
 * canvasApple=1 looks the song up on Apple Music (AppleCanvas).
 */
final class AnimatedCover {
    private static final String TAG = "Ayham";
    private static final Handler main = new Handler(Looper.getMainLooper());

    private static TextureView view;
    private static MediaPlayer player;
    private static Surface surface;
    /** Written on the main thread, read by the lookup thread to drop a skipped song. */
    private static volatile String key = "";
    private static String playingUrl;
    private static int videoW, videoH;
    private static long lookupStart;
    /** Metrolist's letterbox zoom (CanvasFrameSampler.detectLetterboxZoom), from the live frame. */
    private static float zoom = 1f;
    /** The live frame, 48 px on its longest side (Metrolist's CanvasFrameSampler), reused. */
    private static android.graphics.Bitmap sample;
    private static long sampledAt;
    /** The last transform set, so an unchanged layout is not set again each frame. */
    private static final float[] fitWas = new float[6];

    private AnimatedCover() {
    }

    private static java.io.File cacheDir;
    private static final long SETTLE_MS = 700;

    static void attach(Activity activity) {
        cacheDir = activity.getCacheDir();
        CanvasCache.init(activity.getFilesDir());
        final View decor = activity.getWindow().getDecorView();
        final String pkg = activity.getPackageName();
        final int pageId = id(activity, "player_page", pkg);
        final int thumbId = id(activity, "player_thumbnail", pkg);
        final int artistId = id(activity, "artist", pkg);
        final int titleId = id(activity, "title", pkg);
        Log.i(TAG, "canvas: ids thumb=" + thumbId + " artist=" + artistId);

        decor.getViewTreeObserver().addOnPreDrawListener(() -> {
            try {
                tick(activity, decor, pageId, thumbId, artistId, titleId);
            } catch (Throwable t) {
                Features.failed("canvas", t);
            }
            return true;
        });
    }

    private static int id(Activity a, String name, String pkg) {
        return a.getResources().getIdentifier(name, "id", pkg);
    }

    private static void tick(Activity activity, View decor, int pageId, int thumbId, int artistId, int titleId) {
        Properties ps = Features.props();
        if (!CanvasSettings.anyMaster(ps) || CanvasSettings.blockedByMobile(activity, ps)) {
            // switched off in the settings (or on mobile data, when asked): drop the clip and show YT's art
            if (!key.isEmpty() || player != null) {
                key = "";
                stop();
                if (view != null) view.setVisibility(View.GONE);
                Log.i(TAG, "canvas: switched off");
            }
            return;
        }
        View page = decor.findViewById(pageId);
        View thumb = page == null ? null : page.findViewById(thumbId);
        if (thumb == null || !(thumb.getParent() instanceof ViewGroup)) return;
        ViewGroup host = (ViewGroup) thumb.getParent();

        if (view == null || view.getParent() != host) {
            if (view != null && view.getParent() instanceof ViewGroup) ((ViewGroup) view.getParent()).removeView(view);
            // the view of a destroyed activity is not moved into the new one (it would keep the old
            // activity alive): a new view, and its clip starts again (from the saved lookup) so it
            // gets a first frame
            if (view != null && view.getContext() != activity && view.getContext() instanceof Activity
                    && (((Activity) view.getContext()).isDestroyed() || ((Activity) view.getContext()).isFinishing())) {
                stop();
                key = "";
                view = null;
            }
            if (view == null) view = newView(activity);
            host.addView(view, new ViewGroup.LayoutParams(thumb.getWidth(), thumb.getHeight()));
            Log.i(TAG, "canvas: view added over player_thumbnail in " + host.getClass().getName());
        }
        // Follow the art's size and position (it animates between the expanded and mini player).
        ViewGroup.LayoutParams lp = view.getLayoutParams();
        if (lp.width != thumb.getWidth() || lp.height != thumb.getHeight()) {
            lp.width = thumb.getWidth();
            lp.height = thumb.getHeight();
            view.setLayoutParams(lp);
            fit();
        }
        if (view.getX() != thumb.getX()) view.setX(thumb.getX());
        if (view.getY() != thumb.getY()) view.setY(thumb.getY());
        view.setZ(thumb.getZ() + 1);
        fit(); // the banner moves and grows on its own: the video stays where Metrolist draws it

        // Song mode and expanded only; in video mode the thumbnail is hidden.
        int[] at = new int[2];
        page.getLocationOnScreen(at);
        boolean wanted = thumb.isShown() && thumb.getAlpha() > 0.5f && at[1] < decor.getHeight() / 2;

        long now = System.currentTimeMillis();
        if (wanted != lastWanted) {
            lastWanted = wanted;
            View a = shown(page, artistId);
            Log.i(TAG, "canvas state: wanted=" + wanted + " thumbShown=" + thumb.isShown() + " alpha=" + thumb.getAlpha()
                    + " pageY=" + at[1] + " artist=" + (a == null ? null : ((TextView) a).getText())
                    + " title=" + text(page, titleId, artistId, true));
        }
        // BitChord's clip plays only while the music plays: paused, it holds its frame
        boolean music = PlayerScreen.playingFor(activity, 0) != Boolean.FALSE;
        if (!wanted || now - lastTextCheck < 500) {
            applyVisibility(wanted, music);
            return;
        }
        lastTextCheck = now;
        String title = text(page, titleId, artistId, true);
        String artist = text(page, titleId, artistId, false);
        // the settings are part of the key: a change looks the song up again, and forgets the
        // "failed" marks so the new choice is tried at once (canvas.md §13 rule 10)
        String sources = "\u0000" + CanvasSettings.signature(Features.props());
        if (!lastSettings.isEmpty() && !lastSettings.equals(sources)) {
            int n = CanvasCache.forgetMisses();
            Log.i(TAG, "canvas: settings changed: " + n + " failed marks forgotten");
        }
        lastSettings = sources;
        if (title != null && artist != null && !(title + "\u0000" + artist + sources).equals(key)) {
            key = title + "\u0000" + artist + sources;
            onSong(title, artist);
        }
        applyVisibility(wanted, music);
    }

    private static long lastTextCheck;
    private static String lastSettings = "";
    private static boolean lastWanted, prepared;

    /** The animated cover is on the screen (the fullscreen art stays up while it plays, paused or not). */
    static boolean clipShowing() {
        return view != null && view.isShown() && view.getAlpha() > 0.5f && prepared;
    }

    /**
     * The clip is Apple's tall (3:4) cover: Metrolist's canvasTall layout. Only that one: a Spotify
     * canvas (9:16) or a music video fills the whole player, as in Metrolist.
     */
    static boolean tallClip() {
        return tallClip(videoW, videoH);
    }

    /** A w x h clip is Apple's tall cover: height over width above 1.2 and under 1.45 (3:4). */
    static boolean tallClip(int w, int h) {
        if (w == 0) return false;
        float r = h / (float) w;
        return r > 1.2f && r < 1.45f;
    }

    /**
     * Where Metrolist draws the clip, px from the player page's top-left on a W x H screen: a tall
     * cover fills fillMaxWidth().aspectRatio(3/4) at the top; anything else fills the whole player
     * (RESIZE_MODE_ZOOM, centre-cropped). Either is scaled by the letterbox zoom about its centre.
     */
    static android.graphics.RectF videoRect(int W, int H) {
        if (videoW == 0 || videoH == 0 || W == 0 || H == 0) return null;
        float bw = W, bh = tallClip() ? W * 4f / 3f : H;
        float sc = Math.max(bw / videoW, bh / videoH) * zoom;
        float rw = videoW * sc, rh = videoH * sc, cx = bw / 2, cy = bh / 2;
        return new android.graphics.RectF(cx - rw / 2, cy - rh / 2, cx + rw / 2, cy + rh / 2);
    }

    /** Metrolist's CanvasFrameSampler.detectLetterboxZoom: the zoom that takes black bars above and below off, 1..1.6. */
    static float letterboxZoom(int[] px, int w, int h) {
        if (w < 4 || h < 4 || isBlackRow(px, w, h / 2)) return 1f;
        int top = 0;
        while (top < h / 3 && isBlackRow(px, w, top)) top++;
        int bottom = 0;
        while (h - 1 - bottom > 2 * h / 3 && isBlackRow(px, w, h - 1 - bottom)) bottom++;
        int min = Math.max(1, h / 16);
        if (top < min || bottom < min) return 1f;
        int active = h - top - bottom;
        if (active < h / 2 || active >= h) return 1f;
        return Math.max(1f, Math.min(1.6f, h / (float) active));
    }

    /**
     * The frame is read from the view with the zoom already on it: once zoomed, the bars are cropped
     * off (it read 1 and zoomed out, flipping 1.0 and 1.17 every few frames on a letterboxed music
     * video) or, before the new zoom is drawn, still there (it zoomed again, up to 1.6). So it is
     * measured only while the clip is unzoomed, and the first zoom found holds for the clip.
     */
    static float nextZoom(float current, float measured) {
        return current > 1f ? current : Math.max(1f, Math.min(1.6f, measured));
    }

    private static boolean isBlackRow(int[] px, int w, int y) {
        int step = Math.max(1, w / 16), sum = 0, n = 0;
        for (int x = 0; x < w; x += step, n++) {
            int c = px[y * w + x];
            sum += (((c >> 16) & 0xFF) * 77 + ((c >> 8) & 0xFF) * 150 + (c & 0xFF) * 29) >> 8;
        }
        return n > 0 && sum / n < 24;
    }

    /** A w x h size with the clip's shape, its longest side [side] px. */
    static int[] sampleSize(int side) {
        if (videoW == 0 || videoH == 0) return new int[]{side, side};
        float k = side / (float) Math.max(videoW, videoH);
        return new int[]{Math.max(1, Math.round(videoW * k)), Math.max(1, Math.round(videoH * k))};
    }

    /** Each new clip frame (Metrolist samples every one): its letterbox zoom, and the live blurred backdrop. */
    private static void sampled() {
        if (!clipShowing() || !view.isAvailable() || !FullArt.clipMode() || videoW == 0) return;
        // reading a frame back from the GPU stalls the main thread: only when it is used, the
        // backdrop's next mesh (every 3 s) or the letterbox zoom still measured (4 times a second)
        long now = android.os.SystemClock.uptimeMillis();
        boolean measuring = zoom <= 1f && now - sampledAt >= 250;
        if (!measuring && !ArtBackdrop.wantsFrame()) return;
        sampledAt = now;
        int[] sz = sampleSize(48);
        try {
            if (sample == null || sample.getWidth() != sz[0] || sample.getHeight() != sz[1])
                sample = android.graphics.Bitmap.createBitmap(sz[0], sz[1], android.graphics.Bitmap.Config.ARGB_8888);
            view.getBitmap(sample);
        } catch (Throwable t) {
            return;
        }
        int[] px = new int[sz[0] * sz[1]];
        sample.getPixels(px, 0, sz[0], 0, 0, sz[0], sz[1]);
        float z = nextZoom(zoom, letterboxZoom(px, sz[0], sz[1]));
        if (Math.abs(z - zoom) > 0.03f) {
            Log.i(TAG, "canvas: letterbox zoom " + zoom + " -> " + z);
            zoom = z;
            fit();
        }
        ArtBackdrop.live(px, sz[0], sz[1], tallClip());
    }

    /** A frame of the shown clip at w x h (the background's blurred backdrop), or null. */
    static android.graphics.Bitmap frame(int w, int h) {
        if (!clipShowing() || !view.isAvailable()) return null;
        try {
            return view.getBitmap(w, h);
        } catch (Throwable t) {
            return null;
        }
    }

    private static void applyVisibility(boolean wanted, boolean music) {
        if (player != null) {
            boolean ready = prepared; // not the first frame: a clip paused before it never shows one
            boolean run = wanted && music;
            if (run && ready && !player.isPlaying()) {
                player.start();
                Log.i(TAG, "canvas: resumed (expanded, music playing)");
            } else if (!run && player.isPlaying()) {
                player.pause();
                Log.i(TAG, "canvas: paused (" + (wanted ? "music paused" : "collapsed or video mode") + ")");
            }
        }
        int vis = wanted ? View.VISIBLE : View.INVISIBLE;
        if (view.getVisibility() != vis) view.setVisibility(vis);
    }

    /** The player page's title and artist, found next to each other (the queue has titles too). */
    private static String text(View page, int titleId, int artistId, boolean wantTitle) {
        View artist = shown(page, artistId);
        if (!(artist instanceof TextView) || !(artist.getParent() instanceof ViewGroup)) return null;
        if (!wantTitle) return ((TextView) artist).getText().toString();
        View parent = (View) artist.getParent();
        for (int up = 0; up < 4 && parent instanceof ViewGroup; up++, parent = (View) parent.getParent()) {
            View title = shown(parent, titleId);
            if (title != null) return ((TextView) title).getText().toString();
        }
        return null;
    }

    private static View shown(View v, int id) {
        if (v.getId() == id && v.isShown() && v instanceof TextView && ((TextView) v).length() > 0) return v;
        if (v instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) {
                View found = shown(g.getChildAt(i), id);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static TextureView newView(Activity activity) {
        TextureView v = new TextureView(activity);
        v.setAlpha(0f);
        v.setSurfaceTextureListener(new TextureView.SurfaceTextureListener() {
            @Override
            public void onSurfaceTextureAvailable(SurfaceTexture st, int w, int h) {
                surface = new Surface(st);
                if (player != null) player.setSurface(surface);
                fit();
            }

            @Override
            public void onSurfaceTextureSizeChanged(SurfaceTexture st, int w, int h) {
                fit();
            }

            @Override
            public boolean onSurfaceTextureDestroyed(SurfaceTexture st) {
                if (player != null) player.setSurface(null);
                if (surface != null) surface.release();
                surface = null;
                return true;
            }

            @Override
            public void onSurfaceTextureUpdated(SurfaceTexture st) {
                // switched off for this run after it kept failing (Features.failed)
                if ("0".equals(Features.props().getProperty("canvas frame"))) return;
                try {
                    sampled();
                } catch (Throwable t) {
                    Features.failed("canvas frame", t);
                }
            }
        });
        return v;
    }

    private static View shownWithId(View v, int id) {
        if (v.getId() == id && v.isShown()) return v;
        if (v instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) {
                View f = shownWithId(g.getChildAt(i), id);
                if (f != null) return f;
            }
        }
        return null;
    }

    private static final java.util.concurrent.ExecutorService aheadWorker = java.util.concurrent.Executors.newSingleThreadExecutor();
    private static final java.util.Set<String> aheadAsked = java.util.Collections.synchronizedSet(new java.util.HashSet<>());

    /**
     * Prism's CanvasAhead: the next two songs' music-video loops, fetched one at a time on an
     * unmetered network, 15 s after they show up next in the queue (skipping through songs asks
     * for none), so their canvas shows from the cache as they start.
     */
    static void ahead(java.util.List<String[]> next) {
        if (cacheDir == null) return;
        for (String[] s : next) {
            // no artist: no search (a "no video" answer would be saved for a day)
            if (s[0] == null || s[1] == null || s.length < 3 || s[2] == null || s[2].isEmpty() || !aheadAsked.add(s[0])) continue;
            main.postDelayed(() -> aheadWorker.execute(() -> {
                try {
                    android.net.ConnectivityManager cm = (android.net.ConnectivityManager) app.ayham.extension.music.automix.Automix.context()
                            .getSystemService(android.content.Context.CONNECTIVITY_SERVICE);
                    if (cm == null || cm.isActiveNetworkMetered()) {
                        aheadAsked.remove(s[0]);
                        return;
                    }
                    // the settings and the song's choices as they are now, 15 s on (canvas.md §13 rules 1, 4,
                    // 6-7; §15): the same quality, mode and choices, and cache key, the song's own lookup uses
                    Properties p = Features.props();
                    if (!CanvasSettings.on(p, CanvasSettings.VIDEO) || "0".equals(p.getProperty("canvasVideo"))
                            || CanvasSettings.blockedByMobile(Features.appContext, p)) {
                        aheadAsked.remove(s[0]);
                        return;
                    }
                    CanvasChoices.Song ch = CanvasChoices.get(s[0]);
                    if (ch.off.contains(CanvasSettings.VIDEO)) {
                        aheadAsked.remove(s[0]);
                        return;
                    }
                    String mvKey = CanvasCache.videoKey(s[0]) + CanvasSettings.videoKeySuffix(p) + ch.keySuffix();
                    boolean[] none = {false};
                    java.io.File f;
                    synchronized (VideoCanvas.class) {
                        if (CanvasCache.lookup(mvKey) != null) return;
                        f = VideoCanvas.clip(s[0], s[1], s[2], 0, cacheDir, 1080, none,
                                CanvasSettings.ytHeight(p), CanvasSettings.fullVideo(p), ch);
                    }
                    if (f != null || none[0]) CanvasCache.put(mvKey, f == null ? null : f.getAbsolutePath());
                    Log.i(TAG, "canvas ahead: '" + s[1] + "' " + (f != null ? "loop cached" : none[0] ? "has no video" : "not this time"));
                } catch (Throwable t) {
                    aheadAsked.remove(s[0]);
                    Log.w(TAG, "canvas ahead: '" + s[1] + "' failed: " + t);
                }
            }), 15_000);
        }
    }

    private static void onSong(String title, String artist) {
        final String forKey = key;
        // the old clip fades out over the next art (the backdrop holds its frame meanwhile), not cut
        if (view != null && player != null && view.getAlpha() > 0f) {
            MediaPlayer was = player;
            view.animate().cancel();
            view.animate().alpha(0f).setDuration(300).withEndAction(() -> {
                if (player == was) stop();
            }).start();
        } else stop();
        // the clip is sized for the art on screen (from 360p up to 1080p)
        final int artPx = view == null ? 720 : Math.max(view.getWidth(), view.getHeight());
        // full-screen art is about 3:4: Apple's tall clip fits it, the square one the normal art
        final boolean tall = FullArt.on();
        Properties p = Features.props();
        String fixed = p.getProperty("canvasUrl", "").trim();
        boolean apple = "1".equals(p.getProperty("canvasApple"));
        boolean spotify = !"0".equals(p.getProperty("canvasSpotify"));
        boolean video = spotify && !"0".equals(p.getProperty("canvasVideo")); // both full-screen loops are "Canvas"
                lookupStart = System.currentTimeMillis();
        Log.i(TAG, "canvas: song '" + title + "' by '" + artist + "'");
        new Thread(() -> {
            // skipping through songs: only look up the one that stays for a moment
            try {
                Thread.sleep(SETTLE_MS);
            } catch (InterruptedException ignored) {
            }
            if (!forKey.equals(key)) {
                Log.i(TAG, "canvas: '" + title + "' skipped before lookup");
                return;
            }
            String songKey = CanvasCache.appleKey(title, artist, tall) + CanvasSettings.appleKeySuffix(p);
            String saved = null, vid = null;
            if (fixed.isEmpty()) {
                // a downloaded song's clip by its video id first (works offline)
                try {
                    // only when the queue already names this song (it can lag a song behind)
                    vid = app.ayham.extension.music.automix.Automix.currentIdFor(title);
                    // a song just started: the queue names it a moment later (a downloaded song's
                    // saved clip needs its id, and offline nothing else answers)
                    for (int i = 0; vid == null && i < 6 && forKey.equals(key); i++) {
                        app.ayham.extension.music.automix.Automix.refreshQueue();
                        Thread.sleep(500);
                        vid = app.ayham.extension.music.automix.Automix.currentIdFor(title);
                    }
                } catch (Throwable ignored) {
                }
                // its downloaded Spotify canvas and art clip, in the online lookup's order and under the same
                // switches: the master switch (canvas.md §13 rule 1) and the song's own (§15: its video or Use
                // first, a source off for the song skipped). A video or Use of the music video goes online.
                if (vid != null) saved = savedClip(vid, p, CanvasChoices.get(vid));
            }
            if (saved != null && !saved.isEmpty()) {
                // saved lookup: a miss for 24 h, or the clip file (also offline)
                Log.i(TAG, "canvas: saved lookup: " + (saved.isEmpty() ? "no clip" : "clip " + new java.io.File(saved).getName()));
                final String clip = saved;
                if (!clip.isEmpty()) main.post(() -> {
                    if (forKey.equals(key)) play(clip);
                });
                return;
            }
            // the song's length for the music video's and Spotify's length checks: the player's own, checked
            // by the song's id (the playing id is this song's before and after the read), else unknown (0: not
            // checked). YT's player gives no album: null.
            long songLength = 0;
            if (vid != null) {
                try {
                    if (vid.equals(app.ayham.extension.music.automix.Automix.currentId())) {
                        long ms = app.ayham.extension.music.automix.Automix.durationMs();
                        if (vid.equals(app.ayham.extension.music.automix.Automix.currentId())) songLength = Math.max(0, ms);
                    }
                } catch (Throwable ignored) {
                }
            }
            final long songMs = songLength;
            Look l = new Look();
            l.title = title;
            l.artist = artist;
            l.forKey = forKey;
            l.vid = vid;
            l.songMs = songMs;
            l.artPx = artPx;
            l.tall = tall;
            l.songKey = songKey;
            l.fixed = fixed;
            l.p = p;
            l.ch = vid == null ? new CanvasChoices.Song() : CanvasChoices.get(vid);
            current = new String[]{title, artist, vid};
            if (!fixed.isEmpty()) {
                lookApple(l);
                return;
            }
            // canvas.md §13: the sources strictly in the listener's order, each under its switches
            // §15: the listener's video (rule 6) or Use (rule 7) first; a source switched off for the song skipped
            for (String src : orderFor(p, l.ch)) {
                if (!forKey.equals(key)) return;
                if (!CanvasSettings.on(p, src) || l.ch.off.contains(src)) continue;
                boolean stop = CanvasSettings.VIDEO.equals(src) ? lookVideo(l) : CanvasSettings.SPOTIFY.equals(src) ? lookSpotify(l) : lookApple(l);
                if (stop) return;
            }
            Log.i(TAG, "canvas: no source has a clip for '" + title + "' in " + (System.currentTimeMillis() - lookupStart) + " ms");
        }, "ayham-canvas").start();
    }

    /** The listener's source order for a song: its video or Use first (canvas.md §15 rules 6, 7). */
    static java.util.List<String> orderFor(Properties p, CanvasChoices.Song ch) {
        java.util.List<String> order = new java.util.ArrayList<>(CanvasSettings.order(p));
        String first = ch.video != null ? CanvasSettings.VIDEO : ch.use;
        if (first != null && order.remove(first)) order.add(0, first);
        return order;
    }

    /**
     * A downloaded song's saved clip (Spotify canvas or Apple art clip) by its video id, taken in the
     * song's source order, each only while its source is on and not off for the song; null when the
     * song's own video or Use names the music video (looked up online) or nothing is saved. (The
     * settings' order putting the video first doesn't: a saved clip plays before it, also offline.)
     */
    static String savedClip(String vid, Properties p, CanvasChoices.Song ch) {
        boolean videoChosen = ch.video != null || CanvasSettings.VIDEO.equals(ch.use);
        for (String src : orderFor(p, ch)) {
            if (!CanvasSettings.on(p, src) || ch.off.contains(src)) continue;
            if (CanvasSettings.VIDEO.equals(src)) {
                if (videoChosen) return null;
                continue;
            }
            String s = CanvasCache.lookup(CanvasSettings.SPOTIFY.equals(src) ? CanvasCache.spotifyIdKey(vid) : CanvasCache.idKey(vid));
            if (s != null && !s.isEmpty()) return s;
        }
        return null;
    }

    /** One song's lookup, as the sources share it. */
    private static final class Look {
        String title, artist, forKey, vid, songKey, fixed;
        long songMs;
        int artPx;
        boolean tall;
        Properties p;
        CanvasChoices.Song ch;
    }

    static java.io.File cacheDir() {
        return cacheDir;
    }

    /** The song the canvas looked up last: {title, artist, videoId or null}. */
    static volatile String[] current;

    /** The clip on the screen now: its path (null none) and its source (CanvasSettings.VIDEO, SPOTIFY, APPLE). */
    static String showing() {
        return player != null ? playingUrl : null;
    }

    static String sourceOf(String path) {
        if (path == null) return null;
        String n = new java.io.File(path).getName();
        return n.startsWith("mv_") ? CanvasSettings.VIDEO : n.startsWith("sp-") ? CanvasSettings.SPOTIFY : CanvasSettings.APPLE;
    }

    /** §15: the song's canvas looked at again at once (as a settings change does). */
    static void relook() {
        main.post(() -> {
            key = "";
            lastTextCheck = 0;
        });
    }

    /** The cache key of the song's music video loop under the settings and its choices. */
    static String loopKey(String vid, CanvasChoices.Song ch) {
        return CanvasCache.videoKey(vid) + CanvasSettings.videoKeySuffix(Features.props()) + ch.keySuffix();
    }

    static String appleKeyNow(String title, String artist) {
        return CanvasCache.appleKey(title, artist, FullArt.on()) + CanvasSettings.appleKeySuffix(Features.props());
    }

    /** The music video's loop (canvas.md §5-7). True: stop here (it plays, or the song moved on). */
    private static boolean lookVideo(Look l) {
        String title = l.title, artist = l.artist, forKey = l.forKey, vid = l.vid, songKey = l.songKey, fixed = l.fixed;
        long songMs = l.songMs;
        int artPx = l.artPx;
        boolean tall = l.tall, video = true, spotify = true, apple = true;
        if (fixed.isEmpty() && video && vid != null) {
            String mvKey = CanvasCache.videoKey(vid) + CanvasSettings.videoKeySuffix(l.p) + l.ch.keySuffix(), saidMv = CanvasCache.lookup(mvKey);
            // a saved clip the cache trim has since deleted is cut again; so is one cut before §15 wrote
            // its .info, or the song's menu could not offer Pick another part and Not this video for it
            final String had = saidMv != null && !saidMv.isEmpty()
                    && (new java.io.File(saidMv).length() == 0 || VideoCanvas.infoOf(saidMv) == null) ? null : saidMv;
            if (had != null && !had.isEmpty()) {
                Log.i(TAG, "canvas: video loop from cache");
                main.post(() -> {
                    if (forKey.equals(key)) play(had);
                });
                return true;
            }
            if (had == null) {
                try {
                    boolean[] none = {false};
                    java.io.File f;
                    synchronized (VideoCanvas.class) {
                        // one cut at a time: by the time this one's turn comes the queue may have moved
                        // on, or the look-ahead may have cut it already
                        if (!vid.equals(app.ayham.extension.music.automix.Automix.currentIdFor(title))) {
                            Log.i(TAG, "canvas: the queue moved on before its cut: none made");
                            return true;
                        }
                        String now = CanvasCache.lookup(mvKey);
                        if (now != null && !now.isEmpty() && new java.io.File(now).length() > 0) {
                            main.post(() -> {
                                if (forKey.equals(key)) play(now);
                            });
                            return true;
                        }
                        f = VideoCanvas.clip(vid, title, artist, songMs, cacheDir, artPx, none, CanvasSettings.ytHeight(l.p), CanvasSettings.fullVideo(l.p), l.ch);
                    }
                    // still this song: a clip cut while the queue moved on is not saved under its id
                    if (!vid.equals(app.ayham.extension.music.automix.Automix.currentIdFor(title))) {
                        Log.i(TAG, "canvas: the queue moved on while cutting: not saved");
                        if (f != null && !f.delete()) Log.w(TAG, "canvas: could not delete " + f.getName());
                        return true;
                    }
                    if (f != null || none[0]) CanvasCache.put(mvKey, f == null ? null : f.getAbsolutePath());
                    if (f != null) {
                        String path = f.getAbsolutePath();
                        Log.i(TAG, "canvas: video loop in " + (System.currentTimeMillis() - lookupStart) + " ms");
                        main.post(() -> {
                            if (forKey.equals(key)) play(path);
                        });
                        return true;
                    }
                } catch (Throwable t) {
                    Log.w(TAG, "canvas video: failed: " + t);
                }
                if (!forKey.equals(key)) return true;
            }
        }
        return false;
    }

    /** Spotify's canvas (§4). True: stop here. */
    private static boolean lookSpotify(Look l) {
        String title = l.title, artist = l.artist, forKey = l.forKey, vid = l.vid, songKey = l.songKey, fixed = l.fixed;
        long songMs = l.songMs;
        int artPx = l.artPx;
        boolean tall = l.tall, video = true, spotify = true, apple = true;
        if (fixed.isEmpty() && spotify) {
            String spKey = CanvasCache.spotifyKey(title, artist), had = CanvasCache.lookup(spKey);
            if (had != null && !had.isEmpty() && new java.io.File(had).length() > 0) {
                Log.i(TAG, "canvas: spotify canvas from cache");
                main.post(() -> {
                    if (forKey.equals(key)) play(had);
                });
                return true;
            }
            if (had == null || !had.isEmpty()) {
                try {
                    java.io.File f = SpotifyCanvas.find(title, artist, null, songMs, cacheDir);
                    CanvasCache.put(spKey, f == null ? null : f.getAbsolutePath());
                    if (f != null) {
                        String path = f.getAbsolutePath();
                        Log.i(TAG, "canvas: spotify canvas in " + (System.currentTimeMillis() - lookupStart) + " ms");
                        main.post(() -> {
                            if (forKey.equals(key)) play(path);
                        });
                        return true;
                    }
                } catch (Throwable t) {
                    // a failed lookup is not saved as a miss: asked again next time
                    Log.w(TAG, "canvas spotify: failed: " + t);
                }
                if (!forKey.equals(key)) return true;
            }
        }
        return false;
    }

    /** Apple's animated cover (§3), or the test link. True: it plays. */
    private static boolean lookApple(Look l) {
        String title = l.title, artist = l.artist, forKey = l.forKey, vid = l.vid, songKey = l.songKey, fixed = l.fixed;
        long songMs = l.songMs;
        int artPx = l.artPx;
        boolean tall = l.tall, video = true, spotify = true, apple = true;
        if (fixed.isEmpty()) {
            String saidApple = CanvasCache.lookup(songKey);
            final String hadApple = saidApple != null && !saidApple.isEmpty() && !saidApple.contains("://")
                    && new java.io.File(saidApple).length() == 0 ? null : saidApple;
            if (hadApple != null) {
                Log.i(TAG, "canvas: saved lookup: " + (hadApple.isEmpty() ? "no clip" : "clip " + new java.io.File(hadApple).getName()));
                if (!hadApple.isEmpty()) main.post(() -> {
                    if (forKey.equals(key)) play(hadApple);
                });
                return !hadApple.isEmpty();
            }
        }
        String url = null;
        String alt = null;
        boolean failed = false;
        try {
            if (!fixed.isEmpty()) url = fixed;
            else if (apple) {
                String[] found = AppleCanvas.find(title, artist, null, tall);
                if (found != null) {
                    url = found[0];
                    alt = found[1];
                }
            }
        } catch (Throwable t) {
            failed = true;
            Log.w(TAG, "canvas: lookup failed: " + t);
        }
        if (url != null && url.contains(".m3u8") && forKey.equals(key)) {
            // the clip for the art's shape, else the other shape's (Prism's tall alternate)
            java.io.File f = null;
            for (String u : new String[]{url, alt}) {
                if (u == null || f != null) continue;
                try {
                    f = HlsClip.fetch(u, cacheDir, artPx, CanvasSettings.appleCap(l.p));
                } catch (Throwable t) {
                    Log.w(TAG, "canvas: clip download failed: " + t);
                }
            }
            url = f == null ? null : f.getAbsolutePath();
            // no file is a failed download, not "no clip": not saved as a miss for 24 h
            if (f == null) failed = true;
        }
        if (!failed && fixed.isEmpty() && apple && (url == null || !url.contains(".m3u8"))) CanvasCache.put(songKey, url);
        final String found = url;
        Log.i(TAG, "canvas: lookup " + (found == null ? "none" : "hit") + " in "
                + (System.currentTimeMillis() - lookupStart) + " ms");
        if (found != null) main.post(() -> {
            if (forKey.equals(key)) play(found);
        });
        return found != null;
    }

    private static void play(String url) {
        stop();
        // the player page is gone (its activity destroyed): played again when it comes back
        if (view == null) return;
        // a clip shown again counts as used for the cache trim (least recently shown go first)
        if (url != null && url.startsWith("/")) //noinspection ResultOfMethodCallIgnored
            new java.io.File(url).setLastModified(System.currentTimeMillis());
        playingUrl = url;
        final long start = System.currentTimeMillis();
        MediaPlayer mp = new MediaPlayer();
        player = mp;
        try {
            mp.setDataSource(url);
            mp.setVolume(0f, 0f);
            mp.setLooping(true);
            if (surface != null) mp.setSurface(surface);
            mp.setOnVideoSizeChangedListener((m, w, h) -> {
                videoW = w;
                videoH = h;
                Log.i(TAG, "canvas: video " + w + "x" + h);
                fit();
            });
            mp.setOnInfoListener((m, what, extra) -> {
                if (what == MediaPlayer.MEDIA_INFO_VIDEO_RENDERING_START && m == player) {
                    Log.i(TAG, "canvas: first frame " + (System.currentTimeMillis() - start) + " ms after play, "
                            + (System.currentTimeMillis() - lookupStart) + " ms after song change");
                    view.animate().alpha(1f).setDuration(400).start();
                }
                return false;
            });
            mp.setOnErrorListener((m, what, extra) -> {
                Log.w(TAG, "canvas: player error " + what + "/" + extra + " for " + playingUrl);
                if (m == player) stop();
                return true;
            });
            mp.setOnPreparedListener(m -> {
                if (m != player) return;
                Log.i(TAG, "canvas: prepared in " + (System.currentTimeMillis() - start) + " ms");
                prepared = true;
                m.start();
            });
            mp.prepareAsync();
        } catch (Exception e) {
            Log.w(TAG, "canvas: play failed", e);
            stop();
        }
    }

    /** The app went to the background: the clip stops decoding (the next frame of the page starts it again). */
    static void background() {
        if (player != null && player.isPlaying()) {
            player.pause();
            Log.i(TAG, "canvas: paused (the app is in the background)");
        }
    }

    /** The activity is destroyed: its view and the clip's player go, so they don't keep it alive. */
    static void forget(Activity a) {
        if (view != null && view.getContext() == a) {
            stop();
            key = "";
            if (view.getParent() instanceof ViewGroup) ((ViewGroup) view.getParent()).removeView(view);
            view = null;
        }
    }

    private static void stop() {
        if (view != null) {
            view.animate().cancel();
            view.setAlpha(0f);
        }
        if (player != null) {
            MediaPlayer mp = player;
            player = null;
            try {
                mp.release();
            } catch (Exception ignored) {
            }
        }
        videoW = videoH = 0;
        zoom = 1f;
        java.util.Arrays.fill(fitWas, 0);
        prepared = false;
    }

    /**
     * Crop the clip into the art: inside a music video's baked-in bars, at its judged place across
     * the picture (the .crop sidecar); centred for anything else.
     */
    private static String cropFor, cardFit;
    private static float[] crop;

    private static void fit() {
        if (view == null || videoW == 0 || videoH == 0 || view.getWidth() == 0) return;
        float vw = view.getWidth(), vh = view.getHeight();
        if (FullArt.on() && FullArt.clipMode() && FullArt.bannerSide() > 0 && metrolistFit(vw, vh)) return;
        if (fitWas[4] != 0) cardFit = null; // coming back from the full-screen fit: set the card's again
        fitWas[4] = 0; // the card's crop: the full-screen one is set again when it comes back
        String path = playingUrl == null ? null : playingUrl.startsWith("file://") ? playingUrl.substring(7) : playingUrl;
        // runs on every pre-draw: the crop file is read once per clip, and an unchanged fit is not set
        // again (setTransform redraws, which would call this again)
        if (!java.util.Objects.equals(path, cropFor)) {
            cropFor = path;
            crop = VideoCanvas.cropOf(path);
            cardFit = null;
        }
        String fitKey = path + "|" + vw + "x" + vh + "|" + videoW + "x" + videoH;
        if (fitKey.equals(cardFit)) return;
        cardFit = fitKey;
        float[] c = crop;
        float cx = c == null ? 0.5f : c[0];
        float ax = c == null ? 0 : c[1] * videoW, ay = c == null ? 0 : c[2] * videoH;
        float aw = c == null ? videoW : videoW * (1 - c[1] - c[3]), ah = c == null ? videoH : videoH * (1 - c[2] - c[4]);
        float sx, sy, sw, sh;
        if (aw / ah > vw / vh) {
            sh = ah;
            sw = ah * vw / vh;
            sx = ax + cx * (aw - sw);
            sy = ay;
        } else {
            sw = aw;
            sh = aw * vh / vw;
            sx = ax;
            sy = ay + (ah - sh) / 2;
        }
        // the view first stretches the whole frame over itself; map the chosen part onto the view
        android.graphics.RectF src = new android.graphics.RectF(sx * vw / videoW, sy * vh / videoH, (sx + sw) * vw / videoW, (sy + sh) * vh / videoH);
        Matrix m = new Matrix();
        m.setRectToRect(src, new android.graphics.RectF(0, 0, vw, vh), Matrix.ScaleToFit.FILL);
        view.setTransform(m);
    }

    /**
     * Full-screen art: the clip where Metrolist draws it (videoRect), seen through the banner (our
     * view sits in YT's card, scaled up as the banner): the screen rect taken into the view's own px.
     */
    private static boolean metrolistFit(float vw, float vh) {
        View root = view.getRootView();
        android.graphics.RectF r = videoRect(root.getWidth(), root.getHeight());
        if (r == null) return false;
        float s = 1;
        for (View v = view; v != null; v = v.getParent() instanceof View ? (View) v.getParent() : null) s *= v.getScaleX();
        if (s <= 0) return false;
        int[] at = new int[2];
        view.getLocationOnScreen(at);
        float top = FullArt.pageTop();
        float l = (r.left - at[0]) / s, t = (r.top + top - at[1]) / s, w = r.width() / s, h = r.height() / s;
        if (Math.abs(l - fitWas[0]) < 0.5f && Math.abs(t - fitWas[1]) < 0.5f && Math.abs(w - fitWas[2]) < 0.5f
                && Math.abs(h - fitWas[3]) < 0.5f && fitWas[4] == vw && fitWas[5] == vh) return true;
        fitWas[0] = l;
        fitWas[1] = t;
        fitWas[2] = w;
        fitWas[3] = h;
        fitWas[4] = vw;
        fitWas[5] = vh;
        Matrix m = new Matrix();
        m.setRectToRect(new android.graphics.RectF(0, 0, vw, vh), new android.graphics.RectF(l, t, l + w, t + h), Matrix.ScaleToFit.FILL);
        view.setTransform(m);
        view.invalidate();
        return true;
    }
}
