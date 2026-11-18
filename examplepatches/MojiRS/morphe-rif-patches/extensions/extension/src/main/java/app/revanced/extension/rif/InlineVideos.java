package app.revanced.extension.rif;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.SurfaceTexture;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.media.AudioAttributes;
import android.media.AudioFocusRequest;
import android.media.AudioManager;
import android.media.MediaMetadataRetriever;
import android.media.MediaPlayer;
import android.media.PlaybackParams;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.Spannable;
import android.text.Spanned;
import android.text.style.URLSpan;
import android.util.Log;
import android.util.LruCache;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.Surface;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.lang.ref.WeakReference;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Inline comment videos (part of "Inline comment images").
 *
 * {@link #load} (background, from InlineImages.load) resolves a video link and grabs its
 * first frame; InlineImages then puts a {@link VideoSpan} on its own line below the link: a
 * box the size of the video showing that frame. {@link
 * #attach} (main thread, from InlineImages.attach) puts an overlay over each such box, in
 * the FrameLayout rif wraps comment and selftext bodies in: a TextureView that MediaPlayer
 * plays the video into (drawn by the hardware straight to the screen), and media controls.
 * The span only reserves the space, draws the still frame, and reports where it was drawn
 * so the overlay can follow it.
 *
 * Videos play muted and looping (or wait for a tap, with autoplay off). A tap on a video
 * shows controls like rif's own player's: play/pause, sound, seek, and full screen (rif's
 * player). While they're
 * hidden, touches fall through the overlay to the TextView, so long press selects the
 * comment as on images. Reddit serves a video's sound as a separate file; unmuting downloads
 * it (SoundCache; streaming it made the sound cut out) and plays the copy with a second
 * MediaPlayer kept in sync.
 *
 * Playback follows the TextureView's surface: it starts when the surface is created (the
 * row is on screen) and is released when it's destroyed (scrolled off / recycled). A video
 * re-bound into a new row (e.g. after a vote) hands its player over without restarting.
 */
public final class InlineVideos {

    private InlineVideos() {}

    private static final String TAG = "RifInlineVideos";
    // Hardware decoders are limited; past this many, extra videos show their still frame
    // (a tap on one then stops the longest-playing other video).
    private static final int MAX_PLAYERS = 4;
    private static final int MAX_MPD_BYTES = 256 * 1024;
    // A player that's meant to be playing but hasn't moved for this long is rebuilt.
    private static final int STALL_TICKS = 8; // x 250 ms
    // How long the last frame stays in place of the first after a video's surface goes
    // (e.g. a row hidden or scrolled away); covers rif's row animations.
    private static final long SNAPSHOT_MS = 1500;
    private static final String RIF_MAIN_ACTIVITY = "com.andrewshu.android.reddit.MainActivity";

    // reddit.com/link/{id}/video/{mediaId}/player: a video embedded in a comment.
    private static final Pattern PLAYER_LINK = Pattern.compile(
            "^https?://(?:www\\.|old\\.|new\\.|m\\.)?reddit\\.com/link/([A-Za-z0-9]+)/video/([A-Za-z0-9]+)/player/?(?:[?#].*)?$",
            Pattern.CASE_INSENSITIVE);
    // v.redd.it/{id}: a video post.
    private static final Pattern V_REDD_IT = Pattern.compile(
            "^https?://v\\.redd\\.it/([A-Za-z0-9]+)/?(?:[?#].*)?$", Pattern.CASE_INSENSITIVE);
    // i.imgur.com/{id}.gifv / .mp4
    private static final Pattern IMGUR_VIDEO = Pattern.compile(
            "^https?://(?:i\\.)?imgur\\.com/([A-Za-z0-9]+)\\.(?:gifv|mp4)(?:[?#].*)?$",
            Pattern.CASE_INSENSITIVE);

    private static final Pattern MPD_WIDTH = Pattern.compile("\\swidth=\"(\\d+)\"");
    private static final Pattern MPD_HEIGHT = Pattern.compile("\\sheight=\"(\\d+)\"");
    private static final Pattern MPD_BANDWIDTH = Pattern.compile("\\sbandwidth=\"(\\d+)\"");
    private static final Pattern MPD_BASE_URL = Pattern.compile("<BaseURL>([^<]+)</BaseURL>");

    /** A playable video: the stream to play inline, its sound, size, and a frame source. */
    static final class Video {
        final String url;
        final String posterUrl;
        // Separate sound file (reddit), or null: then the video file's own track, if any.
        final String audioUrl;
        // Whether the video file itself may carry sound (imgur).
        final boolean embeddedAudio;
        final int width;
        final int height;

        Video(String url, String posterUrl, String audioUrl, boolean embeddedAudio, int width, int height) {
            this.url = url;
            this.posterUrl = posterUrl;
            this.audioUrl = audioUrl;
            this.embeddedAudio = embeddedAudio;
            this.width = width;
            this.height = height;
        }

        boolean hasSound() {
            return audioUrl != null || embeddedAudio;
        }

        /** Disk form: one field per line. */
        String serialize() {
            return url + "\n" + posterUrl + "\n" + (audioUrl == null ? "" : audioUrl) + "\n"
                    + embeddedAudio + "\n" + width + "\n" + height;
        }

        static Video parse(String s) {
            if (s == null) return null;
            try {
                String[] f = s.split("\n", -1);
                return new Video(f[0], f[1], f[2].isEmpty() ? null : f[2], Boolean.parseBoolean(f[3]),
                        Integer.parseInt(f[4]), Integer.parseInt(f[5]));
            } catch (Throwable t) {
                return null;
            }
        }
    }

    // Link -> resolved video, to avoid re-fetching manifests.
    private static final LruCache<String, Video> RESOLVED = new LruCache<>(128);
    // Link -> when its lookup last failed (uptime ms). A failure is retried after
    // RETRY_FAILED_MS, not remembered for the whole session: a just-posted Reddit video's
    // manifest isn't there until Reddit has processed it, and a network error passes.
    private static final LruCache<String, Long> FAILED = new LruCache<>(128);
    private static final long RETRY_FAILED_MS = 2 * 60 * 1000;

    static boolean isVideoLink(String url) {
        return url != null && (PLAYER_LINK.matcher(url).matches() || V_REDD_IT.matcher(url).matches()
                || IMGUR_VIDEO.matcher(url).matches());
    }

    // ---- background: resolve a video and its still frame ---------------------------------

    /**
     * What video link [url] shows (InlineImages.load's video part): the video and its still
     * frame, null if inline videos are off or it isn't playable, or Media.missing if
     * [network] is false and it isn't cached.
     */
    static InlineImages.Media load(String url, boolean network) {
        if (!Settings.inlineVideos()) return null;
        Video video = resolve(url, network);
        if (video == MISSING) return InlineImages.Media.missingVideo(0, 0);
        if (video == null) return null;
        Poster poster = poster(video, network);
        if (poster == null) {
            if (video.width <= 0 || video.height <= 0) return InlineImages.Media.missingVideo(0, 0);
            int[] size = displaySize(video.width, video.height);
            return InlineImages.Media.missingVideo(size[0], size[1]);
        }
        return InlineImages.Media.video(video, poster);
    }

    /** The span for a loaded video ([media] from load()), to go on its own line below [link]. */
    static VideoSpan newSpan(InlineImages.Media media, URLSpan link) {
        return new VideoSpan(posterDrawable(media.poster), media.video, link);
    }

    private static final Video MISSING = new Video("", "", null, false, 0, 0);

    private static Video resolve(String url, boolean network) {
        Video cached = RESOLVED.get(url);
        if (cached != null) return cached;
        Long failedAt = FAILED.get(url);
        if (failedAt != null) {
            if (SystemClock.uptimeMillis() - failedAt < RETRY_FAILED_MS) return null;
            FAILED.remove(url);
        }
        Matcher m;
        if ((m = IMGUR_VIDEO.matcher(url)).matches()) {
            String mp4 = "https://i.imgur.com/" + m.group(1) + ".mp4";
            Video video = new Video(mp4, mp4, null, true, 0, 0); // size comes from the frame grab
            RESOLVED.put(url, video);
            return video;
        }
        Video stored = Video.parse(InlineCache.getText("video:" + url));
        if (stored != null) {
            RESOLVED.put(url, stored);
            return stored;
        }
        if (!network) return MISSING;
        Video video = null;
        if ((m = PLAYER_LINK.matcher(url)).matches()) {
            video = fromManifest("https://v.redd.it/link/" + m.group(1) + "/asset/" + m.group(2) + "/");
        } else if ((m = V_REDD_IT.matcher(url)).matches()) {
            video = fromManifest("https://v.redd.it/" + m.group(1) + "/");
        }
        if (video == null) {
            FAILED.put(url, SystemClock.uptimeMillis());
            return null;
        }
        RESOLVED.put(url, video);
        InlineCache.putText("video:" + url, video.serialize());
        return video;
    }

    /**
     * Reads a v.redd.it DASH manifest at [base]: its renditions are plain MP4 files next to
     * it, video-only plus separate sound. Plays the largest video up to 480p (sharp enough
     * inline, light on data), grabs the still frame from the smallest, and uses the
     * best-quality sound file.
     */
    private static Video fromManifest(String base) {
        String mpd = InlineImages.fetchText(base + "DASHPlaylist.mpd", null, "application/dash+xml,*/*", MAX_MPD_BYTES);
        if (mpd == null) return null;
        String best = null, smallest = null, audio = null;
        int bestW = 0, bestH = 0, bestP = -1;
        int smallestW = 0, smallestH = 0, smallestP = Integer.MAX_VALUE;
        long audioBandwidth = -1;
        // Split at each rendition: the first chunk is the header, AdaptationSet attributes
        // stay with the chunk before a rendition, so width/height/BaseURL are its own.
        for (String rep : mpd.split("<Representation")) {
            Matcher u = MPD_BASE_URL.matcher(rep);
            if (!u.find()) continue; // header
            String file = u.group(1).trim();
            Matcher w = MPD_WIDTH.matcher(rep), h = MPD_HEIGHT.matcher(rep);
            if (!w.find() || !h.find()) {
                // No picture size: a sound rendition. Keep the highest bandwidth.
                Matcher b = MPD_BANDWIDTH.matcher(rep);
                long bandwidth = b.find() ? Long.parseLong(b.group(1)) : 0;
                if (bandwidth > audioBandwidth) {
                    audioBandwidth = bandwidth;
                    audio = file;
                }
                continue;
            }
            int width = Integer.parseInt(w.group(1)), height = Integer.parseInt(h.group(1));
            int p = Math.min(width, height);
            if (p < smallestP) {
                smallestP = p;
                smallest = file;
                smallestW = width;
                smallestH = height;
            }
            if (p <= 480 && p > bestP) {
                bestP = p;
                best = file;
                bestW = width;
                bestH = height;
            }
        }
        if (smallest == null) return null;
        if (best == null) { // every rendition is above 480p: play the smallest
            best = smallest;
            bestW = smallestW;
            bestH = smallestH;
        }
        return new Video(absolute(base, best), absolute(base, smallest),
                audio == null ? null : absolute(base, audio), false, bestW, bestH);
    }

    private static String absolute(String base, String file) {
        return file.startsWith("http") ? file : base + file;
    }

    /** A video's still frame (null if it couldn't be grabbed: then black) and the video's size. */
    static final class Poster {
        final Bitmap frame;
        final int width;
        final int height;

        Poster(Bitmap frame, int width, int height) {
            this.frame = frame;
            this.width = width;
            this.height = height;
        }

        /** Disk form: the size, then the frame as a JPEG. */
        byte[] serialize() {
            ByteArrayOutputStream out = new ByteArrayOutputStream(32 * 1024);
            out.write(ByteBuffer.allocate(8).putInt(width).putInt(height).array(), 0, 8);
            frame.compress(Bitmap.CompressFormat.JPEG, 85, out);
            return out.toByteArray();
        }

        static Poster parse(byte[] data) {
            if (data == null || data.length <= 8) return null;
            ByteBuffer header = ByteBuffer.wrap(data, 0, 8);
            int w = header.getInt(), h = header.getInt();
            Bitmap frame = BitmapFactory.decodeByteArray(data, 8, data.length - 8);
            return frame == null || w <= 0 || h <= 0 ? null : new Poster(frame, w, h);
        }
    }

    // Still frames by their source URL (~8 MB). Grabbing one costs a few hundred ms of
    // network and decoding, so they're also kept on disk.
    private static final LruCache<String, Poster> POSTERS = new LruCache<String, Poster>(8 * 1024 * 1024) {
        @Override
        protected int sizeOf(String key, Poster value) {
            return value.frame == null ? 1 : value.frame.getAllocationByteCount();
        }
    };

    /** The video's still frame: cached, or grabbed if [network] (else null). */
    private static Poster poster(Video video, boolean network) {
        Poster poster = POSTERS.get(video.posterUrl);
        if (poster != null) return poster;
        poster = Poster.parse(InlineCache.get("poster:" + video.posterUrl));
        if (poster != null) {
            POSTERS.put(video.posterUrl, poster);
            return poster;
        }
        if (!network) return null;
        poster = grabPoster(video);
        // A failed grab (black box) isn't kept: the next render tries again.
        if (poster.frame != null) {
            POSTERS.put(video.posterUrl, poster);
            InlineCache.put("poster:" + video.posterUrl, poster.serialize());
        }
        return poster;
    }

    /** Grabs the video's first frame (network), at most screen-wide. */
    private static Poster grabPoster(Video video) {
        Bitmap frame = null;
        int w = video.width, h = video.height;
        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
        try {
            Map<String, String> headers = new HashMap<>();
            headers.put("User-Agent", InlineImages.USER_AGENT);
            retriever.setDataSource(video.posterUrl, headers);
            frame = retriever.getFrameAtTime(0, MediaMetadataRetriever.OPTION_CLOSEST_SYNC);
            if (w <= 0 || h <= 0) {
                w = parseInt(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_VIDEO_WIDTH));
                h = parseInt(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_VIDEO_HEIGHT));
                String rotation = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_VIDEO_ROTATION);
                if ("90".equals(rotation) || "270".equals(rotation)) {
                    int t = w;
                    w = h;
                    h = t;
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "frame grab failed: " + video.posterUrl + " (" + t + ")");
        } finally {
            try {
                retriever.release();
            } catch (Throwable ignored) {
            }
        }
        if ((w <= 0 || h <= 0) && frame != null) {
            w = frame.getWidth();
            h = frame.getHeight();
        }
        if (w <= 0 || h <= 0) {
            w = 16;
            h = 9;
        }
        int maxW = InlineImages.targetWidth();
        if (frame != null && frame.getWidth() > maxW) {
            Bitmap scaled = Bitmap.createScaledBitmap(frame, maxW,
                    Math.max(1, Math.round(frame.getHeight() * (float) maxW / frame.getWidth())), true);
            if (scaled != frame) frame.recycle();
            frame = scaled;
        }
        return new Poster(frame, w, h);
    }

    /** The still frame, sized for display (black if there is none). */
    private static Drawable posterDrawable(Poster poster) {
        int[] out = displaySize(poster.width, poster.height);
        // The frame is shared between spans: each gets its own drawable, scaling it on draw.
        Drawable d = poster.frame != null
                ? new BitmapDrawable(Resources.getSystem(), poster.frame) : new ColorDrawable(0xFF000000);
        d.setBounds(0, 0, out[0], out[1]);
        return d;
    }

    /** Image sizing, but no taller than 90% of the screen (portrait videos). */
    static int[] displaySize(int w, int h) {
        int[] out = InlineImages.outSize(w, h);
        int maxH = Math.round(Resources.getSystem().getDisplayMetrics().heightPixels * 0.9f);
        if (out[1] > maxH) {
            out[0] = Math.max(1, Math.round(out[0] * (float) maxH / out[1]));
            out[1] = maxH;
        }
        return out;
    }

    private static int parseInt(String s) {
        try {
            return s == null ? 0 : Integer.parseInt(s);
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    // ---- the span ---------------------------------------------------------------------

    /**
     * Reserves the video's box in the text and draws its still frame (with a ▶ when it
     * isn't autoplaying). Records where it was last drawn, for the overlay.
     */
    static final class VideoSpan extends InlineImages.FitImageSpan {
        final Video video;
        final URLSpan link;
        // Main thread only.
        boolean drawn;
        float drawnX;
        int drawnY;
        // The video's last frame, briefly drawn in place of the first after its surface goes.
        Drawable snapshot;
        // Playback state to restore when a player is rebuilt (after rif's window was hidden,
        // e.g. the phone locked, or after a stall).
        Resume resume;

        VideoSpan(Drawable poster, Video video, URLSpan link) {
            super(poster);
            this.video = video;
            this.link = link;
        }

        @Override
        public void draw(Canvas canvas, CharSequence text, int start, int end, float x,
                         int top, int y, int bottom, Paint paint) {
            Drawable d = getDrawable();
            Rect b = d.getBounds();
            // Placement identical to DynamicDrawableSpan (ALIGN_BASELINE).
            int transY = bottom - b.bottom - paint.getFontMetricsInt().descent;
            canvas.save();
            canvas.translate(x, transY);
            if (snapshot != null) {
                snapshot.setBounds(b);
                snapshot.draw(canvas);
            } else {
                d.draw(canvas);
                if (!Settings.autoplayInlineVideos() && !PLAYERS.containsKey(this)) drawPlayIcon(canvas, b);
            }
            canvas.restore();
            if (!drawn || x != drawnX || transY != drawnY) {
                drawn = true;
                drawnX = x;
                drawnY = transY;
                InlineImages.MAIN.post(() -> positionOverlays(this));
            }
        }

        @Override
        boolean fitWidth(int maxW) {
            boolean changed = super.fitWidth(maxW);
            if (changed) InlineImages.MAIN.post(() -> positionOverlays(this));
            return changed;
        }
    }

    /** Where a video was, to continue there in a new player. */
    private static final class Resume {
        final int at;
        final boolean paused;
        final boolean looping;
        final boolean ended;

        Resume(int at, boolean paused, boolean looping, boolean ended) {
            this.at = at;
            this.paused = paused;
            this.looping = looping;
            this.ended = ended;
        }
    }

    private static final Paint SCRIM = new Paint(Paint.ANTI_ALIAS_FLAG);
    private static final Paint WHITE = new Paint(Paint.ANTI_ALIAS_FLAG);

    static {
        SCRIM.setColor(0x99000000);
        WHITE.setColor(0xFFFFFFFF);
    }

    private static float dp(float v) {
        return v * Resources.getSystem().getDisplayMetrics().density;
    }

    /** ▶ in a circle, centered in [box] (tap-to-play). */
    private static void drawPlayIcon(Canvas canvas, Rect box) {
        float r = dp(24);
        if (box.width() < 3 * r || box.height() < 3 * r) r = Math.min(box.width(), box.height()) / 3f;
        canvas.drawCircle(box.exactCenterX(), box.exactCenterY(), r, SCRIM);
        drawPlayGlyph(canvas, box.exactCenterX(), box.exactCenterY(), r * 0.45f);
    }

    private static void drawPlayGlyph(Canvas canvas, float cx, float cy, float s) {
        Path triangle = new Path();
        triangle.moveTo(cx - s * 0.6f, cy - s);
        triangle.lineTo(cx + s, cy);
        triangle.lineTo(cx - s * 0.6f, cy + s);
        triangle.close();
        canvas.drawPath(triangle, WHITE);
    }

    // ---- main thread: overlays, players, controls ---------------------------------------

    /** The views over one VideoSpan in one TextView: the video surface and its controls. */
    private static final class Overlay implements TextureView.SurfaceTextureListener {
        final WeakReference<TextView> textView;
        final FrameLayout box;
        final TextureView video;
        final Controls controls;
        final VideoSpan span;
        Surface surface;

        Overlay(TextView tv, VideoSpan span) {
            this.textView = new WeakReference<>(tv);
            this.span = span;
            Context ctx = tv.getContext();
            box = new FrameLayout(ctx);
            box.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            video = new VideoTexture(ctx, this);
            video.setOpaque(false); // the still frame shows through until the video renders
            video.setSurfaceTextureListener(this);
            controls = new Controls(ctx, this);
            box.addView(video, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            box.addView(controls, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        }

        @Override
        public void onSurfaceTextureAvailable(SurfaceTexture st, int width, int height) {
            surface = new Surface(st);
            if (Settings.autoplayInlineVideos() || controls.shown || span.resume != null) play(this, false);
        }

        @Override
        public void onSurfaceTextureSizeChanged(SurfaceTexture st, int width, int height) {
        }

        @Override
        public boolean onSurfaceTextureDestroyed(SurfaceTexture st) {
            Player player = PLAYERS.get(span);
            if (player != null && player.owner == this) {
                // The row may stay on screen a little longer (e.g. hiding a comment
                // animates it out): keep showing the frame it's on, not the first frame.
                if (player.rendering) snapshot(this);
                release(player);
            }
            controls.hide();
            if (surface != null) surface.release();
            surface = null;
            return true;
        }

        @Override
        public void onSurfaceTextureUpdated(SurfaceTexture st) {
        }
    }

    /**
     * The video surface. While rif's window is hidden (phone locked, another screen such as
     * rif's own player opened) its player is released, freeing the hardware decoder (which
     * Android may otherwise take back from a background app, leaving the player dead), and
     * rebuilt where it was on return.
     */
    private static final class VideoTexture extends TextureView {
        private final Overlay overlay;

        VideoTexture(Context ctx, Overlay overlay) {
            super(ctx);
            this.overlay = overlay;
        }

        @Override
        protected void onWindowVisibilityChanged(int visibility) {
            super.onWindowVisibilityChanged(visibility);
            if (visibility != VISIBLE) {
                suspend(overlay);
            } else if (overlay.span.resume != null && overlay.surface != null) {
                play(overlay, true);
            }
        }
    }

    /** A video's MediaPlayer (plus one for its sound's local copy once unmuted), and its overlay. */
    private static final class Player {
        final VideoSpan span;
        final MediaPlayer video;
        MediaPlayer audio;
        Overlay owner;
        boolean prepared;
        boolean audioPrepared;
        boolean audioLoading; // the sound file is being downloaded (see loadSound)
        boolean rendering;
        boolean paused;
        boolean muted = true;
        // Repeat toggle (on by default); ended = stopped on the last frame (repeat off).
        boolean looping = true;
        boolean ended;
        // Exact seeks are slow: one runs at a time, the latest request waits (drag-to-seek).
        boolean seeking;
        int seekTarget = -1;
        int queuedSeek = -1;
        boolean startAfterSeek;
        // Sound sync (see syncAudio): the last sound seek or start, so the stall after it isn't
        // mistaken for drift.
        boolean audioSeeking; // a sound seek hasn't reported completion yet
        long audioSeekAt; // uptime of the last sound seek or start
        int audioRef; // position the sound was asked to be at then
        boolean audioSettled; // the sound has advanced since, so its position can be trusted
        int audioNudge; // sound playback speed: 1 faster, -1 slower, 0 normal
        int lastSyncVideoPos = -1;
        // Drift readings since the last sound seek (judged by their median), and whether the
        // sound's position is reported coarsely.
        final int[] driftWindow = new int[SoundSync.WINDOW];
        int driftCount;
        int lastAudioPos = -1;
        long lastAudioAt;
        boolean audioCoarse;
        int audioLatency; // ms a sound seek takes to come back, measured (see syncAudio)
        long audioMoveAt; // uptime the sound position last changed
        boolean frozenTried; // already re-seeked a frozen sound once
        boolean nudgeOff; // speed nudging didn't work for this player
        long nudgeAt;
        int nudgeDrift;

        Player(VideoSpan span, MediaPlayer video, Overlay owner) {
            this.span = span;
            this.video = video;
            this.owner = owner;
        }

        boolean separateAudio() {
            return span.video.audioUrl != null;
        }

        int position() {
            if (seekTarget >= 0) return seekTarget;
            if (ended) return duration(); // MediaPlayer reports 0 once playback completes
            try {
                return prepared ? video.getCurrentPosition() : 0;
            } catch (Throwable t) {
                return 0;
            }
        }

        int duration() {
            try {
                return prepared ? Math.max(0, video.getDuration()) : 0;
            } catch (Throwable t) {
                return 0;
            }
        }
    }

    // Overlays per TextView (keys weak; values hold the TextView only weakly).
    private static final WeakHashMap<TextView, List<Overlay>> OVERLAYS = new WeakHashMap<>();
    // Players by span, oldest first; an entry exists exactly while its MediaPlayer is alive.
    private static final LinkedHashMap<VideoSpan, Player> PLAYERS = new LinkedHashMap<>();

    private static final View.OnLayoutChangeListener REPOSITION =
            (v, l, t, r, b, oldL, oldT, oldR, oldB) -> {
                List<Overlay> overlays = OVERLAYS.get(v);
                if (overlays == null) return;
                for (Overlay o : new ArrayList<>(overlays)) v.post(() -> position(o));
            };

    /** Syncs [tv]'s overlays with the video spans in its (new) text. Main thread. */
    static void attach(TextView tv) {
        try {
            List<VideoSpan> spans = new ArrayList<>();
            CharSequence text = tv.getText();
            if (Settings.inlineVideos() && text instanceof Spanned) {
                Collections.addAll(spans, ((Spanned) text).getSpans(0, text.length(), VideoSpan.class));
            }
            List<Overlay> overlays = OVERLAYS.get(tv);
            if (overlays == null) {
                if (spans.isEmpty()) return;
                overlays = new ArrayList<>();
                OVERLAYS.put(tv, overlays);
                tv.addOnLayoutChangeListener(REPOSITION);
            }

            // Drop overlays for videos no longer in this TextView (recycled to another comment).
            for (Overlay o : new ArrayList<>(overlays)) {
                if (spans.contains(o.span)) continue;
                overlays.remove(o);
                remove(o);
            }

            ViewParent parent = tv.getParent();
            if (parent instanceof FrameLayout) {
                FrameLayout container = (FrameLayout) parent;
                for (VideoSpan span : spans) {
                    boolean present = false;
                    for (Overlay o : overlays) present |= o.span == span;
                    if (present) continue;
                    Overlay overlay = new Overlay(tv, span);
                    Rect b = span.getDrawable().getBounds();
                    FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                            Math.max(1, b.width()), Math.max(1, b.height()), Gravity.TOP | Gravity.START);
                    // Just above the text, below anything rif layers over it (e.g. spoiler cover).
                    container.addView(overlay.box, container.indexOfChild(tv) + 1, lp);
                    overlays.add(overlay);
                    position(overlay);
                }
            } // else no room for an overlay: still frame only, taps open the link
            if (overlays.isEmpty()) {
                OVERLAYS.remove(tv);
                tv.removeOnLayoutChangeListener(REPOSITION);
            }
        } catch (Throwable t) {
            Log.w(TAG, "video attach failed", t);
        }
    }

    private static void remove(Overlay o) {
        o.controls.hide();
        ViewParent parent = o.box.getParent();
        if (parent instanceof ViewGroup) ((ViewGroup) parent).removeView(o.box);
    }

    private static void positionOverlays(VideoSpan span) {
        for (List<Overlay> overlays : OVERLAYS.values()) {
            for (Overlay o : overlays) if (o.span == span) position(o);
        }
    }

    /** Moves/sizes the overlay onto the span's last drawn box in its TextView. */
    private static void position(Overlay o) {
        TextView tv = o.textView.get();
        if (tv == null || !(o.box.getParent() instanceof View)) return;
        View container = (View) o.box.getParent();
        VideoSpan span = o.span;
        Rect b = span.getDrawable().getBounds();
        if (!span.drawn) {
            o.box.setTranslationX(-100000); // until the text is drawn: keep it off the text
            return;
        }
        o.box.setTranslationX(tv.getLeft() - container.getPaddingLeft()
                + tv.getTotalPaddingLeft() - tv.getScrollX() + span.drawnX);
        o.box.setTranslationY(tv.getTop() - container.getPaddingTop()
                + tv.getTotalPaddingTop() - tv.getScrollY() + span.drawnY);
        FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) o.box.getLayoutParams();
        if (lp.width != b.width() || lp.height != b.height()) {
            lp.width = Math.max(1, b.width());
            lp.height = Math.max(1, b.height());
            o.box.setLayoutParams(lp);
        }
    }

    /**
     * Starts (or takes over) the span's player, rendering into [overlay]. At the player
     * limit, does nothing unless [evict] (a tap), which stops the oldest other player.
     */
    private static void play(Overlay overlay, boolean evict) {
        VideoSpan span = overlay.span;
        if (overlay.surface == null) return;
        Player existing = PLAYERS.get(span);
        if (existing != null) {
            // Re-bound into a new row: keep playing, now into this view.
            existing.owner = overlay;
            existing.video.setSurface(overlay.surface);
            return;
        }
        if (PLAYERS.size() >= MAX_PLAYERS) {
            if (!evict) return;
            release(PLAYERS.values().iterator().next());
        }
        TextView tv = overlay.textView.get();
        if (tv == null) return;
        MediaPlayer mp = new MediaPlayer();
        Player player = new Player(span, mp, overlay);
        PLAYERS.put(span, player);
        Resume resume = span.resume;
        span.resume = null;
        if (resume != null) {
            player.paused = resume.paused || resume.ended;
            player.looping = resume.looping;
        }
        try {
            mp.setDataSource(tv.getContext(), Uri.parse(span.video.url), headers());
            mp.setAudioAttributes(MEDIA);
            mp.setSurface(overlay.surface);
            mp.setVolume(0f, 0f);
            // With a separate sound file, loop by hand so both restart together.
            mp.setLooping(player.looping && !player.separateAudio());
            mp.setOnPreparedListener(m -> {
                player.prepared = true;
                if (resume != null && resume.at > 0) {
                    // Start once the seek is done: a start() during an exact seek can be
                    // dropped, leaving the player frozen.
                    player.startAfterSeek = !player.paused;
                    seek(player, resume.at);
                } else if (!player.paused) {
                    m.start();
                }
                if (resume != null) player.ended = resume.ended;
                overlayChanged(player);
            });
            mp.setOnInfoListener((m, what, extra) -> {
                if (what == MediaPlayer.MEDIA_INFO_VIDEO_RENDERING_START) {
                    player.rendering = true;
                    clearSnapshot(span, player.owner);
                }
                return false;
            });
            mp.setOnSeekCompleteListener(m -> {
                if (PLAYERS.get(span) == player) seekCompleted(player);
            });
            mp.setOnCompletionListener(m -> {
                if (PLAYERS.get(span) != player) return;
                if (!player.looping) {
                    // Repeat off: stay on the last frame, paused (play starts over).
                    player.paused = true;
                    player.ended = true;
                    pauseAudio(player);
                    overlayChanged(player);
                    return;
                }
                seek(player, 0);
                if (!player.paused) {
                    m.start();
                    if (player.audio != null && player.audioPrepared && !player.muted) player.audio.start();
                }
            });
            mp.setOnErrorListener((m, what, extra) -> {
                Log.w(TAG, "playback error " + what + "/" + extra + ": " + span.video.url);
                release(player);
                return true;
            });
            mp.prepareAsync();
            invalidateText(overlay); // hides the ▶ now that it's playing
        } catch (Throwable t) {
            Log.w(TAG, "playback failed: " + span.video.url, t);
            release(player);
        }
    }

    private static Map<String, String> headers() {
        Map<String, String> headers = new HashMap<>();
        headers.put("User-Agent", InlineImages.USER_AGENT);
        return headers;
    }

    private static void release(Player player) {
        if (PLAYERS.get(player.span) == player) PLAYERS.remove(player.span);
        if (focusOwner == player) abandonFocus();
        releaseLater(player.video);
        if (player.audio != null) releaseLater(player.audio);
        player.audio = null;
        player.prepared = false;
        stopSyncIfIdle();
        overlayChanged(player);
        if (player.owner != null) invalidateText(player.owner);
    }

    /**
     * MediaPlayer.release() blocks 40-60 ms (codec teardown). On the main thread it runs as a
     * scrolled-out row detaches, dropping frames, and the list visibly jumps. One thread keeps
     * releases in order.
     */
    private static final ExecutorService RELEASER = Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "RifVideoRelease");
        t.setDaemon(true);
        return t;
    });

    private static void releaseLater(MediaPlayer mp) {
        // Callbacks still queued on the main thread must not reach our listeners
        // (the video's onPrepared would start() it).
        try {
            mp.setOnPreparedListener(null);
            mp.setOnInfoListener(null);
            mp.setOnSeekCompleteListener(null);
            mp.setOnCompletionListener(null);
            mp.setOnErrorListener(null);
            mp.setVolume(0f, 0f); // silent now, not when the release finishes
        } catch (Throwable ignored) {
        }
        RELEASER.execute(() -> {
            try {
                mp.release();
            } catch (Throwable ignored) {
            }
        });
    }

    /** Releases the overlay's player, remembering where it was (see VideoTexture). */
    private static void suspend(Overlay overlay) {
        Player player = PLAYERS.get(overlay.span);
        if (player == null || player.owner != overlay) return;
        // Coming back, a video that was playing with sound stays paused (muted ones resume).
        overlay.span.resume = new Resume(player.position(), player.paused || !player.muted,
                player.looping, player.ended);
        if (player.rendering) {
            // Scrolled out (the row is detaching; rif's window is still shown): the frame is
            // only seen briefly on a scroll back, until the player renders again, so take it
            // at half size. The full-size GPU readback costs 10-20 ms mid-scroll.
            boolean scrolledOut = overlay.video.getWindowVisibility() == View.VISIBLE;
            snapshot(overlay, false, scrolledOut);
        }
        release(player);
    }

    /** Rebuilds a stalled player where it was (see Controls' tick). */
    private static void recover(Overlay overlay, Player player) {
        Log.w(TAG, "player stalled; rebuilding: " + overlay.span.video.url);
        overlay.span.resume = new Resume(player.position(), false, player.looping, false);
        release(player);
        play(overlay, true);
    }

    private static void setPaused(Player player, boolean paused) {
        player.paused = paused;
        if (!player.prepared) return;
        if (!paused && player.ended) {
            player.ended = false;
            seek(player, 0); // play after the end starts over
        }
        try {
            if (paused) {
                player.video.pause();
                pauseAudio(player);
            } else {
                player.video.start();
                if (player.audio != null && player.audioPrepared && !player.muted) {
                    seekAudio(player, player.position() + player.audioLatency);
                    player.audio.start();
                    startSync();
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "pause/resume failed", t);
        }
    }

    /** Seeks to [ms] exactly (not just to a keyframe), sound included. */
    private static void seek(Player player, int ms) {
        if (!player.prepared) return;
        player.seekTarget = ms;
        if (player.seeking) {
            player.queuedSeek = ms;
            return;
        }
        startSeek(player, ms);
    }

    private static void setLooping(Player player, boolean looping) {
        player.looping = looping;
        try {
            if (player.prepared && !player.separateAudio()) player.video.setLooping(looping);
        } catch (Throwable t) {
            Log.w(TAG, "repeat toggle failed", t);
        }
        overlayChanged(player);
    }

    private static void startSeek(Player player, int ms) {
        player.ended = false; // a seek leaves the end: play continues from there
        player.seeking = true;
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                player.video.seekTo(ms, MediaPlayer.SEEK_CLOSEST);
            } else {
                player.video.seekTo(ms);
            }
            if (player.audio != null && player.audioPrepared) seekAudio(player, ms);
        } catch (Throwable t) {
            player.seeking = false;
            player.seekTarget = -1;
            Log.w(TAG, "seek failed", t);
        }
    }

    private static void seekCompleted(Player player) {
        player.seeking = false;
        if (player.queuedSeek >= 0) {
            int next = player.queuedSeek;
            player.queuedSeek = -1;
            startSeek(player, next);
        } else {
            player.seekTarget = -1;
            if (player.startAfterSeek) {
                player.startAfterSeek = false;
                if (!player.paused) setPaused(player, false);
            }
        }
    }

    /** Unmutes (starting the sound, with audio focus) or mutes the player. */
    private static void setMuted(Player player, boolean muted) {
        if (player.muted == muted) return;
        player.muted = muted;
        TextView tv = player.owner == null ? null : player.owner.textView.get();
        if (!muted) {
            // One video with sound at a time.
            if (focusOwner != null && focusOwner != player) setMuted(focusOwner, true);
            if (tv != null && !requestFocus(tv.getContext(), player)) {
                player.muted = true;
                return;
            }
        } else if (focusOwner == player) {
            abandonFocus();
        }
        try {
            if (!player.separateAudio()) {
                player.video.setVolume(muted ? 0f : 1f, muted ? 0f : 1f);
            } else if (muted) {
                pauseAudio(player);
            } else if (player.audio == null && tv != null) {
                loadSound(player, tv.getContext().getApplicationContext());
            } else if (player.audio != null && player.audioPrepared) {
                seekAudio(player, player.position() + player.audioLatency);
                if (!player.paused) {
                    player.audio.start();
                    startSync();
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "mute toggle failed", t);
        }
        overlayChanged(player);
    }

    /**
     * Gets the sound going for an unmuted player: from the local copy of its sound file (see
     * SoundCache) if there is one, else downloading it first (the player stays unmuted, the
     * sound arrives shortly). If the download fails, streams the sound instead.
     */
    private static void loadSound(Player player, Context ctx) {
        if (player.audioLoading) return;
        File dir = SoundCache.dir(ctx.getCacheDir());
        File local = dir == null ? null : SoundCache.cached(dir, player.span.video.audioUrl);
        if (local != null || dir == null) {
            startSound(player, ctx, local);
            return;
        }
        player.audioLoading = true;
        SoundCache.download(dir, player.span.video.audioUrl, InlineImages.USER_AGENT, (file, error) -> {
            if (file == null) Log.w(TAG, "sound download failed (" + error + "); streaming");
            InlineImages.MAIN.post(() -> {
                player.audioLoading = false;
                try {
                    // Muted meanwhile: the file is kept, the next unmute uses it.
                    if (PLAYERS.get(player.span) != player || player.muted || player.audio != null) return;
                    startSound(player, ctx, file);
                } catch (Throwable t) {
                    Log.w(TAG, "sound start failed", t);
                }
            });
        });
    }

    /** Creates and prepares the sound player, on [file] or (null) streaming the sound URL. */
    private static void startSound(Player player, Context ctx, File file) {
        try {
            MediaPlayer audio = new MediaPlayer();
            player.audio = audio;
            player.audioPrepared = false;
            if (file != null) {
                audio.setDataSource(file.getAbsolutePath());
            } else {
                audio.setDataSource(ctx, Uri.parse(player.span.video.audioUrl), headers());
            }
            audio.setAudioAttributes(MEDIA);
            audio.setOnPreparedListener(m -> {
                if (player.audio != m) return;
                player.audioPrepared = true;
                seekAudio(player, player.position() + player.audioLatency);
                if (!player.muted && !player.paused) {
                    m.start();
                    startSync();
                }
            });
            audio.setOnSeekCompleteListener(m -> {
                if (player.audio == m) player.audioSeeking = false;
            });
            audio.setOnErrorListener((m, what, extra) -> {
                Log.w(TAG, "sound error " + what + "/" + extra + ": " + player.span.video.audioUrl);
                return true;
            });
            audio.prepareAsync();
        } catch (Throwable t) {
            Log.w(TAG, "mute toggle failed", t);
        }
    }

    // ---- sound sync ------------------------------------------------------------------

    private static final long SYNC_MS = 300;
    private static Handler syncHandler;
    private static boolean syncScheduled;
    private static boolean nudgeFailed;

    private static final Runnable SYNC_TICK = new Runnable() {
        @Override
        public void run() {
            syncScheduled = false;
            try {
                boolean again = false;
                for (Player player : new ArrayList<>(PLAYERS.values())) {
                    if (!needsSync(player)) continue;
                    again = true;
                    syncAudio(player);
                }
                if (again) startSync();
            } catch (Throwable t) {
                Log.w(TAG, "sound sync failed", t);
            }
        }
    };

    private static boolean needsSync(Player player) {
        return player.audio != null && player.audioPrepared && !player.muted && !player.paused;
    }

    /** Starts the sound sync tick (its own, so it runs with the controls hidden). Idempotent. */
    private static void startSync() {
        if (syncScheduled) return;
        if (syncHandler == null) syncHandler = new Handler(Looper.getMainLooper());
        syncScheduled = true;
        syncHandler.postDelayed(SYNC_TICK, SYNC_MS);
    }

    /** Drops a pending tick once no player has sound playing. */
    private static void stopSyncIfIdle() {
        if (!syncScheduled || syncHandler == null) return;
        for (Player player : PLAYERS.values()) if (needsSync(player)) return;
        syncHandler.removeCallbacks(SYNC_TICK);
        syncScheduled = false;
    }

    /** Seeks the sound player, noting when, so the stall after it isn't judged as drift. */
    private static void seekAudio(Player player, int ms) {
        player.audioSeeking = true;
        player.audioSeekAt = SystemClock.uptimeMillis();
        player.audioRef = ms;
        player.audioSettled = false;
        player.driftCount = 0;
        player.lastAudioPos = -1;
        player.audioMoveAt = player.audioSeekAt;
        player.audio.seekTo(ms);
    }

    private static void pauseAudio(Player player) {
        if (player.audio == null || !player.audioPrepared || !player.audio.isPlaying()) return;
        setAudioSpeed(player, 0); // back to normal speed while it is playing (a paused one could restart)
        player.audio.pause();
    }

    /** Sound speed: 1 = 3% faster, -1 = 3% slower, 0 = normal. API 23+; a no-op below. */
    private static void setAudioSpeed(Player player, int nudge) {
        // Only while playing: setting the speed on a stopped player can start it on some versions.
        if (player.audio == null || player.audioNudge == nudge || !player.audio.isPlaying()) return;
        player.audioNudge = nudge;
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M || nudgeFailed) return;
        try {
            applySpeed(player.audio, nudge == 0 ? 1f : nudge > 0 ? SoundSync.FAST : SoundSync.SLOW);
        } catch (Throwable t) {
            nudgeFailed = true;
            Log.w(TAG, "sound speed change failed; sync will only re-seek", t);
        }
    }

    @android.annotation.TargetApi(Build.VERSION_CODES.M) // only called under an SDK_INT >= M check
    private static void applySpeed(MediaPlayer audio, float speed) {
        audio.setPlaybackParams(new PlaybackParams().setSpeed(speed));
    }

    /**
     * Keeps a separate sound player in step with the video (see {@link SoundSync}): small drift
     * is nudged away with the sound's speed, a really large one fixed with a seek, but never
     * while a sound seek is pending, soon after one, or before the sound has started moving
     * again. Seeking makes the sound player refill and stall, so judging it then would seek
     * again, and again.
     */
    private static void syncAudio(Player player) {
        if (!needsSync(player)) return;
        try {
            long now = SystemClock.uptimeMillis();
            int videoPos = player.position();
            boolean videoMoved = videoPos != player.lastSyncVideoPos;
            player.lastSyncVideoPos = videoPos;
            if (player.seeking || !videoMoved) return; // a buffering picture isn't drift
            if (player.audioSeeking && now - player.audioSeekAt < SoundSync.SEEK_PENDING_MAX_MS) return;
            int audioPos = player.audio.getCurrentPosition();
            if (!player.audioSettled) {
                boolean moved = player.audio.isPlaying() && audioPos - player.audioRef >= SoundSync.SETTLED_ADVANCE_MS;
                if (!moved && now - player.audioSeekAt < SoundSync.SETTLE_MAX_MS) return;
                if (moved) {
                    player.frozenTried = false; // playing again after a seek
                    // How long a sound seek takes to come back: later seeks aim that far ahead of
                    // the video, so the sound arrives in step instead of that far behind (which,
                    // on a slow device, would be over the limit again, and again).
                    int took = (int) Math.min(SoundSync.LATENCY_MAX_MS,
                            Math.max(0, now - player.audioSeekAt - SYNC_MS / 2));
                    // Smoothed from zero, so one slow seek never makes the lead overshoot.
                    player.audioLatency = (player.audioLatency + took) / 2;
                }
                player.audioSettled = true;
                player.audioMoveAt = now;
            }
            // A sound position that hasn't moved since the last tick is stalled (buffering or a
            // coarse clock): a seek wouldn't help, and would only restart the refill. Wait, and
            // if it stays frozen for good, try one seek and then leave it.
            if (audioPos == player.lastAudioPos) {
                if (!player.frozenTried && now - player.audioMoveAt > SoundSync.FROZEN_MS) {
                    player.frozenTried = true;
                    Log.i(TAG, "sound frozen at " + audioPos + " ms; one re-seek");
                    seekAudio(player, videoPos + player.audioLatency);
                }
                return;
            }
            player.audioMoveAt = now;
            // A position that doesn't advance like the clock (coarse steps, jumps) can't be
            // trusted reading by reading: widen the limit and don't nudge.
            if (player.lastAudioPos >= 0
                    && Math.abs((audioPos - player.lastAudioPos) - (now - player.lastAudioAt)) > SoundSync.COARSE_MS) {
                if (!player.audioCoarse) Log.i(TAG, "sound position is coarse; sync widened");
                player.audioCoarse = true;
            }
            player.lastAudioPos = audioPos;
            player.lastAudioAt = now;
            if (player.driftCount == player.driftWindow.length) {
                System.arraycopy(player.driftWindow, 1, player.driftWindow, 0, player.driftCount - 1);
                player.driftCount--;
            }
            player.driftWindow[player.driftCount++] = audioPos - videoPos;
            if (player.driftCount < SoundSync.MIN_SAMPLES) return;
            int drift = SoundSync.median(player.driftWindow, player.driftCount);
            // A nudge that isn't bringing the drift down is given up on for this player.
            if (player.audioNudge != 0 && now - player.nudgeAt > SoundSync.NUDGE_TRIAL_MS
                    && Math.abs(drift) > Math.abs(player.nudgeDrift) - SoundSync.NUDGE_PROGRESS_MS) {
                player.nudgeOff = true;
                setAudioSpeed(player, 0);
                Log.i(TAG, "sound speed nudge has no effect; off for this video");
            }
            boolean canNudge = Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && !nudgeFailed
                    && !player.nudgeOff && !player.audioCoarse && player.audio.isPlaying();
            switch (SoundSync.decide(drift, player.audioNudge, canNudge,
                    now - player.audioSeekAt < SoundSync.COOLDOWN_MS + 2L * player.audioLatency,
                    player.audioCoarse ? SoundSync.RESEEK_DRIFT_COARSE_MS : SoundSync.RESEEK_DRIFT_MS)) {
                case SoundSync.RESEEK:
                    Log.i(TAG, "sound re-seek: sound " + audioPos + " ms, video " + videoPos + " ms, drift "
                            + drift + " ms (median of " + player.driftCount + ")");
                    setAudioSpeed(player, 0);
                    seekAudio(player, videoPos + player.audioLatency);
                    break;
                case SoundSync.SPEED_UP:
                    setAudioSpeed(player, 1);
                    player.nudgeAt = now;
                    player.nudgeDrift = drift;
                    break;
                case SoundSync.SLOW_DOWN:
                    setAudioSpeed(player, -1);
                    player.nudgeAt = now;
                    player.nudgeDrift = drift;
                    break;
                case SoundSync.RESET_SPEED:
                    setAudioSpeed(player, 0);
                    break;
                default:
                    break;
            }
        } catch (Throwable t) {
            Log.w(TAG, "sound sync failed", t);
        }
    }

    // ---- audio focus ----------------------------------------------------------------

    private static final AudioAttributes MEDIA = new AudioAttributes.Builder()
            .setUsage(AudioAttributes.USAGE_MEDIA)
            .setContentType(AudioAttributes.CONTENT_TYPE_MOVIE)
            .build();
    private static Player focusOwner;
    private static Object focusRequest; // AudioFocusRequest (API 26+)

    private static final AudioManager.OnAudioFocusChangeListener FOCUS_LISTENER = change -> {
        // Another app took the sound (a call, music): go back to muted. Ignore "duck".
        if ((change == AudioManager.AUDIOFOCUS_LOSS || change == AudioManager.AUDIOFOCUS_LOSS_TRANSIENT)
                && focusOwner != null) {
            setMuted(focusOwner, true);
        }
    };

    private static AudioManager audioManager() {
        Context ctx = Settings.context();
        return ctx == null ? null : (AudioManager) ctx.getSystemService(Context.AUDIO_SERVICE);
    }

    private static boolean requestFocus(Context ctx, Player player) {
        AudioManager am = (AudioManager) ctx.getApplicationContext().getSystemService(Context.AUDIO_SERVICE);
        if (am == null) return false;
        int result;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            AudioFocusRequest request = new AudioFocusRequest.Builder(AudioManager.AUDIOFOCUS_GAIN)
                    .setAudioAttributes(MEDIA)
                    .setOnAudioFocusChangeListener(FOCUS_LISTENER)
                    .build();
            result = am.requestAudioFocus(request);
            if (result == AudioManager.AUDIOFOCUS_REQUEST_GRANTED) focusRequest = request;
        } else {
            result = am.requestAudioFocus(FOCUS_LISTENER, AudioManager.STREAM_MUSIC, AudioManager.AUDIOFOCUS_GAIN);
        }
        if (result != AudioManager.AUDIOFOCUS_REQUEST_GRANTED) return false;
        focusOwner = player;
        return true;
    }

    private static void abandonFocus() {
        focusOwner = null;
        AudioManager am = audioManager();
        if (am == null) return;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            if (focusRequest != null) am.abandonAudioFocusRequest((AudioFocusRequest) focusRequest);
            focusRequest = null;
        } else {
            am.abandonAudioFocus(FOCUS_LISTENER);
        }
    }

    // ---- snapshots ------------------------------------------------------------------

    /** Freezes the overlay's current frame into the span for a moment (see SNAPSHOT_MS). */
    private static void snapshot(Overlay overlay) {
        snapshot(overlay, true);
    }

    /** As above; [timed] false keeps it until the video renders again. */
    private static void snapshot(Overlay overlay, boolean timed) {
        snapshot(overlay, timed, false);
    }

    /** As above; [half] takes the frame at half size (cheaper, see suspend). */
    private static void snapshot(Overlay overlay, boolean timed, boolean half) {
        try {
            TextureView video = overlay.video;
            Bitmap frame = half && video.getWidth() > 1 && video.getHeight() > 1
                    ? video.getBitmap(video.getWidth() / 2, video.getHeight() / 2)
                    : video.getBitmap();
            if (frame == null) return;
            frame = cropToPicture(video, frame);
            VideoSpan span = overlay.span;
            Drawable snapshot = new BitmapDrawable(Resources.getSystem(), frame);
            span.snapshot = snapshot;
            invalidateText(overlay);
            if (timed) {
                InlineImages.MAIN.postDelayed(() -> {
                    if (span.snapshot == snapshot) clearSnapshot(span, overlay);
                }, SNAPSHOT_MS);
            }
        } catch (Throwable t) {
            Log.w(TAG, "snapshot failed", t);
        }
    }

    /**
     * getBitmap() copies the decoder's whole buffer, padding included, but the screen shows only
     * its crop. Phone decoders pad (e.g. 854 -> 864 rows), so the still frame came out squeezed
     * and the picture "stretched" when the video took over. Cut the frame to the crop, read from
     * the SurfaceTexture's transform matrix (vertical flip * crop scale/offset).
     */
    private static Bitmap cropToPicture(TextureView video, Bitmap frame) {
        SurfaceTexture st = video.getSurfaceTexture();
        if (st == null) return frame;
        float[] m = new float[16];
        st.getTransformMatrix(m);
        int[] r = VideoCrop.pictureRect(m, frame.getWidth(), frame.getHeight());
        if (r == null) return frame;
        Bitmap cropped = Bitmap.createBitmap(frame, r[0], r[1], r[2] - r[0], r[3] - r[1]);
        if (cropped != frame) frame.recycle();
        return cropped;
    }

    private static void clearSnapshot(VideoSpan span, Overlay overlay) {
        if (span.snapshot == null) return;
        span.snapshot = null;
        if (overlay != null) invalidateText(overlay);
    }

    private static void invalidateText(Overlay overlay) {
        TextView tv = overlay.textView.get();
        CharSequence text = tv == null ? null : tv.getText();
        if (!(text instanceof Spannable)) return;
        // Re-set the span so the TextView re-records it (redraws its still frame / ▶).
        Spannable sp = (Spannable) text;
        int start = sp.getSpanStart(overlay.span);
        if (start < 0) return;
        sp.setSpan(overlay.span, start, sp.getSpanEnd(overlay.span), sp.getSpanFlags(overlay.span));
        tv.invalidate();
    }

    private static void overlayChanged(Player player) {
        Overlay owner = player.owner;
        if (owner != null) owner.controls.refresh();
    }

    // ---- taps -------------------------------------------------------------------------

    /**
     * A tap on a video (its controls hidden): shows the controls, and starts the video if
     * it has no player yet (tap-to-play). A paused video stays paused: only the play
     * button resumes it, as in rif's player. Returns false if it has no overlay (the tap
     * then opens the link).
     */
    static boolean onTap(TextView tv, VideoSpan span) {
        List<Overlay> overlays = OVERLAYS.get(tv);
        if (overlays == null) return false;
        for (Overlay o : overlays) {
            if (o.span != span) continue;
            Player player = PLAYERS.get(span);
            if (player == null) play(o, true);
            o.controls.show();
            return true;
        }
        return false;
    }

    // ---- full screen hand-off ------------------------------------------------------

    private static final long HANDOFF_MS = 15_000;
    // ExoPlayer's Player.REPEAT_MODE_OFF / REPEAT_MODE_ALL.
    private static final int REPEAT_MODE_OFF = 0;
    private static final int REPEAT_MODE_ALL = 2;

    /** The inline player's state when full screen was tapped; each part is used once. */
    private static final class Handoff {
        final long at;
        final boolean sound;
        final boolean looping;
        final long until;
        boolean positionUsed, soundUsed, repeatUsed;

        Handoff(long at, boolean sound, boolean looping, long until) {
            this.at = at;
            this.sound = sound;
            this.looping = looping;
            this.until = until;
        }
    }

    private static Handoff handoff;

    private static Handoff liveHandoff() {
        Handoff h = handoff;
        if (h != null && SystemClock.uptimeMillis() > h.until) handoff = h = null;
        return h;
    }

    /**
     * Hook in rif's video player (free v1.k0 / Platinum w1.k0), where it seeks its new
     * ExoPlayer to its saved position: [rifPosition], or the inline player's position if
     * full screen was just opened from it.
     */
    public static long fullscreenPosition(long rifPosition) {
        try {
            Handoff h = liveHandoff();
            if (h == null || h.positionUsed) return rifPosition;
            h.positionUsed = true;
            return h.at;
        } catch (Throwable t) {
            return rifPosition;
        }
    }

    /** Hook where rif's player sets its repeat mode ([rifMode]): the inline repeat toggle. */
    public static int fullscreenRepeatMode(int rifMode) {
        try {
            Handoff h = liveHandoff();
            if (h == null || h.repeatUsed) return rifMode;
            h.repeatUsed = true;
            return h.looping ? REPEAT_MODE_ALL : REPEAT_MODE_OFF;
        } catch (Throwable t) {
            return rifMode;
        }
    }

    /** Hook where rif's player applies sound on/off ([rifSound]): the inline mute state. */
    public static boolean fullscreenSound(boolean rifSound) {
        try {
            Handoff h = liveHandoff();
            if (h == null || h.soundUsed) return rifSound;
            h.soundUsed = true;
            return h.sound;
        } catch (Throwable t) {
            return rifSound;
        }
    }

    /** Opens the video in rif's own player (via its link), pausing it inline. */
    private static void openFullscreen(Overlay overlay) {
        TextView tv = overlay.textView.get();
        if (tv == null) return;
        Player player = PLAYERS.get(overlay.span);
        if (player != null) {
            // rif's player takes over where the inline one is (see fullscreenPosition()...).
            handoff = new Handoff(player.ended ? 0 : player.position(), !player.muted,
                    player.looping, SystemClock.uptimeMillis() + HANDOFF_MS);
            setPaused(player, true);
            if (!player.muted) setMuted(player, true);
        }
        try {
            String url = playerUrl(overlay.span);
            if (url != null) {
                // rif opens video URLs in its player when they come in as a VIEW intent (as
                // its own link-tracking activity does), without the link sheet link.onClick
                // would show.
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
                intent.setComponent(new ComponentName(tv.getContext(), RIF_MAIN_ACTIVITY));
                tv.getContext().startActivity(intent);
                return;
            }
        } catch (Throwable t) {
            Log.w(TAG, "opening the player failed", t);
        }
        overlay.span.link.onClick(tv); // rif's usual handling of the link
    }

    /**
     * The URL rif's player opens for [span]'s video, null if there's none: the link itself
     * for Reddit videos, the resolved .mp4 for imgur (the link may be an album, or a .gifv).
     */
    static String playerUrl(VideoSpan span) {
        String url = span.link.getURL();
        if (url != null && (PLAYER_LINK.matcher(url).matches() || V_REDD_IT.matcher(url).matches())) {
            return url;
        }
        String mp4 = span.video == null ? null : span.video.url;
        if (mp4 != null && IMGUR_VIDEO.matcher(mp4).matches()) return mp4;
        if (url != null && IMGUR_VIDEO.matcher(url).matches()) return url;
        return null;
    }

    // ---- controls ---------------------------------------------------------------------

    /** One of rif's resources by name (0 if absent); names are stable across rif builds. */
    private static int rifResource(Context ctx, String name, String type) {
        return ctx.getResources().getIdentifier(name, type, ctx.getPackageName());
    }

    private static int rifColor(Context ctx, String name, int fallback) {
        int id = rifResource(ctx, name, "color");
        try {
            if (id == 0) return fallback;
            return Build.VERSION.SDK_INT >= 23 ? ctx.getResources().getColor(id, null)
                    : ctx.getResources().getColor(id);
        } catch (Throwable t) {
            return fallback;
        }
    }

    private static int rifDimen(Context ctx, String name, float fallbackDp) {
        int id = rifResource(ctx, name, "dimen");
        try {
            return id == 0 ? Math.round(dp(fallbackDp)) : ctx.getResources().getDimensionPixelSize(id);
        } catch (Throwable t) {
            return Math.round(dp(fallbackDp));
        }
    }

    private static String time(int ms) {
        int s = Math.max(0, ms / 1000);
        return s >= 3600
                ? String.format(Locale.US, "%d:%02d:%02d", s / 3600, s / 60 % 60, s % 60)
                : String.format(Locale.US, "%02d:%02d", s / 60, s % 60);
    }

    /**
     * Media controls over a video, built like rif's own video player (ExoPlayer's
     * PlayerControlView with rif's layout, icons and colors): a bar along the bottom with
     * play/pause and sound buttons, then position, seek bar, duration, and full screen
     * (where rif's player has settings). While hidden it's GONE, so touches reach the
     * TextView; shown, a tap on the video outside the bar hides it. Hides itself after a
     * few seconds of playback without interaction.
     */
    private static final class Controls extends FrameLayout {
        private final Overlay overlay;
        boolean shown;
        private final ImageButton playPause;
        private final ImageButton sound;
        private final ImageButton repeat;
        private final TextView position;
        private final TextView duration;
        private final TimeBar timeBar;
        private final int playIcon, pauseIcon, soundOnIcon, soundOffIcon, repeatOnIcon, repeatOffIcon;
        private int lastPosition = -1;
        private int stalledTicks;
        private final Runnable tick = new Runnable() {
            @Override
            public void run() {
                if (!shown) return;
                Player player = PLAYERS.get(overlay.span);
                if (player != null) watch(player);
                refresh();
                postDelayed(this, 250);
            }
        };

        /** Counts ticks a should-be-playing player doesn't advance; rebuilds it if stuck. */
        private void watch(Player player) {
            boolean shouldMove = !player.paused && !player.ended && !player.seeking;
            int position = player.position();
            if (shouldMove && position == lastPosition) {
                // An unprepared player gets longer (network).
                if (++stalledTicks >= (player.prepared ? STALL_TICKS : STALL_TICKS * 3)) {
                    stalledTicks = 0;
                    lastPosition = -1;
                    recover(overlay, player);
                }
            } else {
                stalledTicks = 0;
                lastPosition = position;
            }
        }

        Controls(Context ctx, Overlay overlay) {
            super(ctx);
            this.overlay = overlay;
            setVisibility(GONE);
            setOnClickListener(v -> hide()); // a tap on the video outside the bar

            playIcon = rifResource(ctx, "exo_controls_play", "drawable");
            repeatOnIcon = rifResource(ctx, "exo_controls_repeat_all", "drawable");
            repeatOffIcon = rifResource(ctx, "exo_controls_repeat_off", "drawable");
            pauseIcon = rifResource(ctx, "exo_controls_pause", "drawable");
            soundOnIcon = rifResource(ctx, "ic_volume_up_white_32dp", "drawable");
            soundOffIcon = rifResource(ctx, "ic_volume_off_white_32dp", "drawable");

            LinearLayout bar = new LinearLayout(ctx);
            bar.setOrientation(LinearLayout.VERTICAL);
            bar.setBackgroundColor(rifColor(ctx, "exoplayer_playback_controls_background", 0xCC000000));
            bar.setPadding(0, Math.round(dp(8)), 0, Math.round(dp(4)));
            bar.setClickable(true); // taps on the bar itself don't hide it

            int buttonW = rifDimen(ctx, "exo_media_button_width", 71);
            // A video narrowed by the width/height limits can be narrower than four
            // buttons at rif's width: shrink them evenly to fit.
            LinearLayout buttons = new LinearLayout(ctx) {
                @Override
                protected void onMeasure(int widthSpec, int heightSpec) {
                    int n = getChildCount();
                    int avail = MeasureSpec.getSize(widthSpec);
                    if (n > 0 && MeasureSpec.getMode(widthSpec) != MeasureSpec.UNSPECIFIED) {
                        int w = Math.max(1, Math.min(buttonW, avail / n));
                        for (int i = 0; i < n; i++) getChildAt(i).getLayoutParams().width = w;
                    }
                    super.onMeasure(widthSpec, heightSpec);
                }
            };
            buttons.setOrientation(LinearLayout.HORIZONTAL);
            buttons.setGravity(Gravity.CENTER);
            buttons.setPadding(0, Math.round(dp(4)), 0, 0);
            int buttonH = rifDimen(ctx, "exo_media_button_height", 52);
            // Same buttons and order as rif's player: previous (back to the start),
            // play/pause, repeat, sound.
            ImageButton previous = mediaButton(ctx, rifResource(ctx, "exo_controls_previous", "drawable"));
            previous.setOnClickListener(v -> {
                // As in rif's player: back to the start, and play again if it had ended
                // (a paused video stays paused).
                Player player = PLAYERS.get(overlay.span);
                if (player != null) {
                    boolean ended = player.ended;
                    seek(player, 0);
                    if (ended) setPaused(player, false);
                }
                interacted();
            });
            buttons.addView(previous, new LinearLayout.LayoutParams(buttonW, buttonH));
            playPause = mediaButton(ctx, pauseIcon);
            playPause.setBackground(null); // rif's play/pause and sound buttons show no ripple
            playPause.setOnClickListener(v -> {
                Player player = PLAYERS.get(overlay.span);
                if (player == null) play(overlay, true);
                else setPaused(player, !player.paused);
                interacted();
            });
            buttons.addView(playPause, new LinearLayout.LayoutParams(buttonW, buttonH));
            repeat = mediaButton(ctx, repeatOnIcon);
            repeat.setOnClickListener(v -> {
                Player player = PLAYERS.get(overlay.span);
                if (player != null) setLooping(player, !player.looping);
                interacted();
            });
            buttons.addView(repeat, new LinearLayout.LayoutParams(buttonW, buttonH));
            sound = mediaButton(ctx, soundOffIcon);
            sound.setBackground(null);
            sound.setOnClickListener(v -> {
                Player player = PLAYERS.get(overlay.span);
                if (player != null) setMuted(player, !player.muted);
                interacted();
            });
            // As in rif's player, a video without sound shows the muted button, faded and
            // disabled.
            if (!overlay.span.video.hasSound()) {
                sound.setEnabled(false);
                sound.setAlpha(0.3f);
            }
            buttons.addView(sound, new LinearLayout.LayoutParams(buttonW, buttonH));
            bar.addView(buttons, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

            // On a narrow video the two times and full screen button leave the seek bar
            // a sliver: drop the duration there.
            final int narrow = Math.round(dp(200));
            LinearLayout progress = new LinearLayout(ctx) {
                @Override
                protected void onMeasure(int widthSpec, int heightSpec) {
                    if (duration != null) {
                        int vis = MeasureSpec.getSize(widthSpec) < narrow ? GONE : VISIBLE;
                        if (duration.getVisibility() != vis) duration.setVisibility(vis);
                    }
                    super.onMeasure(widthSpec, heightSpec);
                }
            };
            progress.setOrientation(LinearLayout.HORIZONTAL);
            progress.setGravity(Gravity.CENTER_VERTICAL);
            progress.setPadding(Math.round(dp(10)), 0, Math.round(dp(4)), 0);
            int timeColor = rifColor(ctx, "exoplayer_playback_controls_timestamp", 0xFFBEBEBE);
            position = timeText(ctx, timeColor);
            progress.addView(position);
            timeBar = new TimeBar(ctx, this);
            progress.addView(timeBar, new LinearLayout.LayoutParams(0, Math.round(dp(26)), 1f));
            duration = timeText(ctx, timeColor);
            progress.addView(duration);
            ImageButton fullscreen = mediaButton(ctx, rifResource(ctx, "exo_ic_fullscreen_enter", "drawable"));
            int pad = Math.round(dp(8));
            fullscreen.setPadding(pad, pad, pad, pad);
            fullscreen.setScaleType(ImageView.ScaleType.FIT_CENTER);
            fullscreen.setOnClickListener(v -> {
                hide();
                openFullscreen(overlay);
            });
            int fullscreenSize = Math.round(dp(40));
            progress.addView(fullscreen, new LinearLayout.LayoutParams(fullscreenSize, fullscreenSize));
            bar.addView(progress, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

            addView(bar, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM));
        }

        private static ImageButton mediaButton(Context ctx, int icon) {
            ImageButton b = new ImageButton(ctx);
            if (icon != 0) b.setImageResource(icon);
            TypedValue ripple = new TypedValue();
            if (ctx.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, ripple, true)) {
                b.setBackgroundResource(ripple.resourceId);
            } else {
                b.setBackground(null);
            }
            return b;
        }

        private static TextView timeText(Context ctx, int color) {
            TextView t = new TextView(ctx);
            t.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            t.setTypeface(Typeface.DEFAULT_BOLD);
            t.setTextColor(color);
            t.setIncludeFontPadding(false);
            int pad = Math.round(dp(4));
            t.setPadding(pad, 0, pad, 0);
            return t;
        }

        /** Shown until the video is tapped again (no time-out), as in rif's player. */
        void show() {
            shown = true;
            setVisibility(VISIBLE);
            stalledTicks = 0;
            lastPosition = -1;
            refresh();
            removeCallbacks(tick);
            post(tick);
            updateContainer();
        }

        void hide() {
            shown = false;
            timeBar.dragging = false;
            removeCallbacks(tick);
            setVisibility(GONE);
            updateContainer();
        }

        void interacted() {
            refresh();
        }

        /**
         * rif's body frame (TextSelectionDelayFrameLayout) holds each touch back from its
         * children until it moves or a delay passes (to delay text selection), and lets the
         * list scroll meanwhile, so a drag on the seek bar would scroll the thread and reach
         * the bar late. Disabled, it passes touches straight through; so it's disabled while
         * any video in it shows its controls.
         */
        private void updateContainer() {
            ViewParent parent = overlay.box.getParent();
            if (!(parent instanceof ViewGroup)) return;
            ViewGroup container = (ViewGroup) parent;
            boolean anyShown = false;
            for (int i = 0; i < container.getChildCount(); i++) {
                View child = container.getChildAt(i);
                if (child instanceof FrameLayout && ((FrameLayout) child).getChildCount() == 2
                        && ((FrameLayout) child).getChildAt(1) instanceof Controls) {
                    anyShown |= ((Controls) ((FrameLayout) child).getChildAt(1)).shown;
                }
            }
            container.setEnabled(!anyShown);
        }

        /** Updates buttons, times and the seek bar from the player. */
        void refresh() {
            if (!shown) return;
            Player player = PLAYERS.get(overlay.span);
            boolean playing = player != null && !player.paused;
            int icon = playing ? pauseIcon : playIcon;
            if (icon != 0) playPause.setImageResource(icon);
            int soundIcon = player == null || player.muted ? soundOffIcon : soundOnIcon;
            if (soundIcon != 0) sound.setImageResource(soundIcon);
            // rif's player shows the muted icon in red (when there's sound to unmute).
            boolean redMute = soundIcon == soundOffIcon && overlay.span.video.hasSound();
            sound.setImageTintList(redMute ? ColorStateList.valueOf(0xFFFF0000) : null);
            int repeatIcon = player == null || player.looping ? repeatOnIcon : repeatOffIcon;
            if (repeatIcon != 0) repeat.setImageResource(repeatIcon);
            int total = player == null ? 0 : player.duration();
            int at = timeBar.dragging ? Math.round(timeBar.fraction * total)
                    : player == null ? 0 : player.position();
            position.setText(time(at));
            duration.setText(time(total));
            if (!timeBar.dragging) timeBar.fraction = total > 0 ? Math.min(1f, at / (float) total) : 0f;
            timeBar.invalidate();
        }

        /** Seeks to [fraction] of the video. */
        void seekTo(float fraction) {
            Player player = PLAYERS.get(overlay.span);
            if (player != null) seek(player, Math.round(fraction * player.duration()));
            refresh();
        }
    }

    /** ExoPlayer's DefaultTimeBar look (rif doesn't restyle it), with tap/drag-to-seek. */
    private static final class TimeBar extends View {
        private final Controls controls;
        private final Paint played = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint unplayed = new Paint(Paint.ANTI_ALIAS_FLAG);
        float fraction;
        boolean dragging;

        TimeBar(Context ctx, Controls controls) {
            super(ctx);
            this.controls = controls;
            played.setColor(0xFFFFFFFF);
            unplayed.setColor(0x33FFFFFF);
        }

        private float inset() {
            return dp(8); // room for the dragged scrubber at either end
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float left = inset(), right = getWidth() - inset(), cy = getHeight() / 2f, h = dp(4);
            float x = left + (right - left) * fraction;
            canvas.drawRect(left, cy - h / 2, right, cy + h / 2, unplayed);
            canvas.drawRect(left, cy - h / 2, x, cy + h / 2, played);
            canvas.drawCircle(x, cy, dp(dragging ? 8 : 6), played);
        }

        private float fractionAt(float x) {
            float left = inset(), right = getWidth() - inset();
            return Math.max(0f, Math.min(1f, (x - left) / Math.max(1f, right - left)));
        }

        @Override
        public boolean onTouchEvent(MotionEvent e) {
            switch (e.getActionMasked()) {
                // As in rif's player: dragging moves the bar and the position time while
                // the video keeps playing; the seek happens on release.
                case MotionEvent.ACTION_DOWN:
                    dragging = true;
                    getParent().requestDisallowInterceptTouchEvent(true);
                    fraction = fractionAt(e.getX());
                    controls.refresh();
                    return true;
                case MotionEvent.ACTION_MOVE:
                    fraction = fractionAt(e.getX());
                    controls.refresh();
                    return true;
                case MotionEvent.ACTION_UP:
                    fraction = fractionAt(e.getX());
                    controls.seekTo(fraction);
                    dragging = false;
                    controls.refresh();
                    return true;
                case MotionEvent.ACTION_CANCEL:
                    dragging = false;
                    controls.refresh();
                    return true;
            }
            return true;
        }
    }
}
