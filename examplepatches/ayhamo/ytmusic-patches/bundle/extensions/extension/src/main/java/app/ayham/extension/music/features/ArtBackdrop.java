package app.ayham.extension.music.features;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import java.lang.ref.WeakReference;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * What the BitChord screen's background view draws under YT's art, as BitChord's own player does
 * (ArtworkMeshBackdrop): no blur and no reflection, ArtMesh's tiny colour map of the cover stretched
 * over the whole screen, YT's art fading into it over its lowest 42% (FullArt). An animated cover
 * gets the same mesh from one of its frames every 3 s, its seam at the clip's bottom. Songs
 * crossfade. Without a cover image (none found) the view falls back to its colour mesh.
 */
final class ArtBackdrop {
    private static final String TAG = "AyhamBleed";
    private static final Handler main = new Handler(Looper.getMainLooper());
    private static final ExecutorService worker = Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "ayham-bleed");
        t.setPriority(Thread.MIN_PRIORITY + 1);
        return t;
    });
    /** A song change: the old art stays up through YT's swipe, then crossfades to the new one. */
    static final long CROSSFADE_MS = 350;
    private static final long CHECK_MS = 100;
    /** BLURRED_ARTWORK_SCRIM_ALPHA; the mirrored tall clip's 24dp blur (ClipFrameBleed) and the full-screen 48dp one (FullscreenBackdropBlurRadius). */
    private static final int SCRIM = 0;
    /** BitChord's MESH_REFRESH_MS: a clip's mesh is made again from its frame this often. */
    private static final long CLIP_MESH_MS = 3000;
    /** BitChord's HERO_FADE_FRACTION: the art's lowest 42% fades into the mesh. */
    static final float FADE_FRACTION = 0.42f;
    private static long clipMeshAt;
    private static final float CLIP_BLUR_DP = 24, CLIP_SCALE = 8, BACKDROP_BLUR_DP = 48, BACKDROP_SCALE = 16;
    /** The live backdrop's own thread: one frame at a time, frames that come while it works are skipped. */
    private static final ExecutorService liveWorker = Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "ayham-live-backdrop");
        t.setPriority(Thread.NORM_PRIORITY - 1);
        return t;
    });
    private static volatile boolean liveBusy;
    private static long liveCount, liveMs, liveLogAt;

    private static final class Layer {
        int tone, width, detailTop, softTop, glare;
        Bitmap preview, detail, soft, mesh;
        /** The square cover it was made from: drawn in the banner's place while YT's card is hidden (a song swipe). */
        Bitmap cover;
        int previewH;
        long shownAt, fullAt;
    }

    private static Layer cur, old;
    private static Bitmap clipNow, clipOld;
    private static long clipAt, checkAt;
    /** The clip's backdrop after its clip ended, fading out over the art below. */
    private static Bitmap held, sharp, heldSharp;
    private static long heldSince, heldFrom, sharpAt;
    private static boolean wasClip;
    private static int generation;
    private static WeakReference<Drawable> lastDrawable = new WeakReference<>(null);
    private static Bitmap lastBitmap;
    private static int builtW, builtH;
    private static WeakReference<View> host = new WeakReference<>(null);
    private static final Paint paint = new Paint(Paint.FILTER_BITMAP_FLAG);
    private static final Paint fill = new Paint();
    private static Paint grain, coverMask;
    private static int coverMaskFor;
    private static final RectF dst = new RectF();

    private ArtBackdrop() {
    }

    /** Each frame of the BitChord screen: a new cover image starts a new bleed; a shown clip gets a fresh backdrop now and then. */
    static void tick(Activity a, View decor, View view) {
        host = new WeakReference<>(view);
        long now = SystemClock.uptimeMillis();
        int W = decor.getWidth(), H = decor.getHeight();
        // a sharp frame of the clip now and then: held in its place while YT's card is hidden for a swipe
        if (FullArt.clipMode() && !FullArt.hiding() && held == null && now - sharpAt > 500) {
            sharpAt = now;
            int[] sz = AnimatedCover.sampleSize(360);
            Bitmap f = AnimatedCover.frame(sz[0], sz[1]);
            if (f != null) sharp = f;
        }
        density = a.getResources().getDisplayMetrics().density;
        screenW = W;
        screenH = H;
        if (now < checkAt) return;
        checkAt = now + CHECK_MS;
        View thumb = decor.findViewById(PlayerScreen.id(a, "player_thumbnail"));
        if (thumb == null || !(thumb.getParent() instanceof ViewGroup) || W == 0 || H == 0) return;
        // the top shown image over the art: YT's, or the song cover laid over it
        ViewGroup group = (ViewGroup) thumb.getParent();
        Drawable d = null;
        for (int i = group.getChildCount() - 1; i >= 0 && d == null; i--) {
            View c = group.getChildAt(i);
            if (c instanceof ImageView && c.isShown() && c.getAlpha() > 0.5f) d = top(((ImageView) c).getDrawable());
        }
        if (d == null) return;
        Bitmap bmp = d instanceof BitmapDrawable ? ((BitmapDrawable) d).getBitmap() : null;
        if (d == lastDrawable.get() && bmp == lastBitmap && W == builtW && H == builtH) return;
        Bitmap cover = copy(d, bmp);
        if (cover == null) return; // drawn as nothing yet: tried again soon
        lastDrawable = new WeakReference<>(d);
        lastBitmap = bmp;
        builtW = W;
        builtH = H;
        build(cover, W, H);
    }

    /** A transition (YT crossfades its art) or layer list: the image on top. */
    private static Drawable top(Drawable d) {
        while (d instanceof LayerDrawable && ((LayerDrawable) d).getNumberOfLayers() > 0) {
            LayerDrawable l = (LayerDrawable) d;
            d = l.getDrawable(l.getNumberOfLayers() - 1);
        }
        return d;
    }

    /** The image as a software bitmap, centre square (YT's card is square), at most 1200px. */
    private static Bitmap copy(Drawable d, Bitmap bmp) {
        try {
            Bitmap src;
            if (bmp != null) {
                src = bmp.getConfig() == Bitmap.Config.HARDWARE ? bmp.copy(Bitmap.Config.ARGB_8888, false) : bmp;
            } else {
                int w = d.getIntrinsicWidth(), h = d.getIntrinsicHeight();
                if (w <= 0 || h <= 0) return null;
                float k = Math.min(1f, 1200f / Math.max(w, h));
                w = Math.max(1, Math.round(w * k));
                h = Math.max(1, Math.round(h * k));
                src = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
                Rect was = d.copyBounds();
                d.setBounds(0, 0, w, h);
                try {
                    d.draw(new Canvas(src));
                } finally {
                    d.setBounds(was);
                }
            }
            if (src == null || src.getWidth() < 32 || src.getHeight() < 32) return null;
            int side = Math.min(src.getWidth(), src.getHeight());
            Bitmap sq = Bitmap.createBitmap(src, (src.getWidth() - side) / 2, (src.getHeight() - side) / 2, side, side);
            if (side > 1200) sq = Bitmap.createScaledBitmap(sq, 1200, 1200, true);
            // a square software bitmap comes back as YT's own one, which YT may recycle under us
            if (sq == bmp) sq = sq.copy(Bitmap.Config.ARGB_8888, false);
            return sq;
        } catch (Throwable t) {
            Log.w(TAG, "cover copy failed (" + d.getClass().getName() + ")", t);
            return null;
        }
    }

    private static void build(Bitmap cover, int W, int H) {
        int gen = ++generation;
        int width = ArtBleed.containerWidth(W, H, 1f);
        worker.execute(() -> {
            try {
                long t0 = SystemClock.uptimeMillis();
                int[] small = pixels(Bitmap.createScaledBitmap(cover, 128, 128, true));
                Layer l = new Layer();
                l.width = width;
                l.detailTop = Math.round(width * (1 - FADE_FRACTION));
                l.cover = cover;
                // the seam: the banner's bottom (it starts at the top of the screen)
                l.mesh = Bitmap.createBitmap(ArtMesh.mesh(small, 128, 128, Math.min(1f, width / (float) H)),
                        ArtMesh.TEX, ArtMesh.TEX, Bitmap.Config.ARGB_8888);
                l.tone = l.mesh.getPixel(ArtMesh.TEX / 2, ArtMesh.TEX - 1);
                l.glare = ArtMesh.glare(small);
                long took = SystemClock.uptimeMillis() - t0;
                main.post(() -> {
                    if (gen != generation) return;
                    if (cur != null) old = cur;
                    l.shownAt = l.fullAt = SystemClock.uptimeMillis();
                    cur = l;
                    redraw();
                    Log.i(TAG, "mesh ready in " + took + " ms for " + W + "x" + H + " (banner " + width + "px)");
                });
            } catch (Throwable t) {
                Log.w(TAG, "mesh failed", t);
            }
        });
    }

    private static int[] pixels(Bitmap b) {
        int[] px = new int[b.getWidth() * b.getHeight()];
        b.getPixels(px, 0, b.getWidth(), 0, 0, b.getWidth(), b.getHeight());
        return px;
    }

    private static float density = 1;
    private static int screenW, screenH;

    /**
     * Each clip frame (48 px on its longest side), as Metrolist draws it behind the player: a tall
     * cover's frame mirrored at the seam with a 24dp blur (ClipFrameBleed); anything else the frame
     * centre-cropped to the whole screen with a 48dp blur (FullscreenBlurredBackdropCanvas). Made
     * small on its own thread; a frame that comes while one is made is skipped.
     */
    /** Whether live() would take a frame now: the clip's frames are read off the GPU only then. */
    static boolean wantsFrame() {
        return !liveBusy && held == null && !FullArt.hiding() && screenW != 0
                && (clipNow == null || SystemClock.uptimeMillis() - clipMeshAt >= CLIP_MESH_MS);
    }

    static void live(int[] frame, int fw, int fh, boolean tall) {
        if (liveBusy || held != null || FullArt.hiding() || screenW == 0) return;
        long at = SystemClock.uptimeMillis();
        if (clipNow != null && at - clipMeshAt < CLIP_MESH_MS) return;
        clipMeshAt = at;
        liveBusy = true;
        final int W = screenW, H = screenH;
        final float seam = tall ? FullArt.seam() : Math.min(1f, ArtBleed.containerWidth(W, H, 1f) / (float) H);
        final int gen = clipGen;
        liveWorker.execute(() -> {
            try {
                long t0 = SystemClock.uptimeMillis();
                int w = ArtMesh.TEX, h = ArtMesh.TEX;
                Bitmap b = Bitmap.createBitmap(ArtMesh.mesh(frame, fw, fh, seam), w, h, Bitmap.Config.ARGB_8888);
                long took = SystemClock.uptimeMillis() - t0;
                main.post(() -> {
                    liveBusy = false;
                    if (gen != clipGen || !FullArt.clipMode()) return;
                    // each new mesh fades in over the one before
                    clipOld = clipNow;
                    clipAt = SystemClock.uptimeMillis();
                    clipNow = b;
                    long now = SystemClock.uptimeMillis();
                    liveCount++;
                    liveMs += took;
                    if (now - liveLogAt > 10_000) {
                        Log.i(TAG, "live backdrop: " + liveCount + " frames, " + (liveMs / Math.max(1, liveCount)) + " ms each ("
                                + (tall ? "tall clip" : "clip") + " mesh, " + w + "x" + h + ")");
                        liveLogAt = now;
                        liveCount = liveMs = 0;
                    }
                    redraw();
                });
            } catch (Throwable t) {
                main.post(() -> liveBusy = false);
                Log.w(TAG, "live backdrop failed", t);
            }
        });
    }

    /** Bumped when a clip ends, so a frame still being made for it is dropped. */
    private static int clipGen;

    /** When the latest art's backdrop was first shown (uptime ms), 0 before any. */
    static long readySince() {
        return cur == null ? 0 : cur.shownAt;
    }

    static void redraw() {
        View v = host.get();
        if (v != null) v.invalidate();
    }

    private static float ramp(long since, long now) {
        return since == 0 ? 0f : Math.min(1f, (now - since) / (float) CROSSFADE_MS);
    }

    /**
     * Draws the backdrop for the banner at bannerTop (view px), e = how far the banner is up.
     * False when there is nothing to draw yet (the view then draws its colour mesh).
     */
    /** The extra black the player puts over this backdrop (ArtMesh.glare of the cover). */
    static int glare() {
        Layer l = cur;
        return l == null ? 0 : l.glare;
    }

    static boolean draw(Canvas c, View v, int bannerTop, float e) {
        long now = SystemClock.uptimeMillis();
        boolean clip = FullArt.clipMode();
        // a clip that shows up mid swipe is YT's old video under the new song for a moment: not a clip yet
        if (FullArt.hiding() && !wasClip) clip = false;
        if (wasClip && !clip && clipNow != null) {
            // the clip ended (a song change): its backdrop fades out over the art below
            if (held == null) {
                held = clipNow;
                heldSharp = FullArt.hiding() ? sharp : null;
                heldSince = now;
                heldFrom = 0;
            }
            sharp = null;
            clipNow = clipOld = null;
            clipGen++;
        }
        wasClip = clip;
        if (clip && clipNow != null) {
            float t = ramp(clipAt, now);
            if (clipOld != null && t < 1f) {
                bitmapOver(c, clipOld, v, 255);
            } else if (clipOld == null && t < 1f) {
                // cover to clip (or clip to clip): fades in over what was there, never through black
                if (held != null) bitmapOver(c, held, v, 255);
                else if (cur != null) layers(c, v, bannerTop, e, now);
            }
            bitmapOver(c, clipNow, v, Math.round(255 * t));
            c.drawColor(SCRIM << 24);
            // the clip view fades out during a swipe: its last sharp frame stays in its place, not the blur
            if (FullArt.hiding() && sharp != null) sharpOver(c, v, bannerTop, 1f, sharp);
            if (t < 1f) v.postInvalidateOnAnimation();
            else held = null;
            return true;
        }
        if (held != null) {
            // the clip ended: its backdrop fades out over the art below (the cover, drawn in YT's place
            // while its card is hidden), which crossfades on to the next song's as usual
            // held until the next song's bleed is there (at most 1.5 s), then one crossfade to it
            boolean next = cur != null && cur.shownAt >= heldSince;
            if (heldFrom == 0 && (next || now - heldSince > 1500)) heldFrom = now;
            float t = heldFrom == 0 ? 0f : ramp(heldFrom, now);
            if (next) {
                old = null;
                layer(c, v, cur, 1f, bannerTop, e, now);
            } else if (heldFrom != 0 && cur != null) layers(c, v, bannerTop, e, now);
            paint.setAlpha(Math.round(255 * (1 - t)));
            dst.set(0, 0, v.getWidth(), v.getHeight());
            c.drawBitmap(held, null, dst, paint);
            c.drawColor(Math.round(SCRIM * (1 - t)) << 24);
            if (heldSharp != null) sharpOver(c, v, bannerTop, 1 - t, heldSharp);
            if (t >= 1f) {
                held = heldSharp = null;
                heldFrom = 0;
            }
            v.postInvalidateOnAnimation();
            return true;
        }
        if (cur == null) return false;
        if (layers(c, v, bannerTop, e, now)) v.postInvalidateOnAnimation();
        return true;
    }

    /** The bleeds: the old one under the new while it fades in. True while still changing. */
    private static boolean layers(Canvas c, View v, int bannerTop, float e, long now) {
        boolean more = false;
        float t = ramp(cur.shownAt, now);
        if (old != null && t < 1f) more |= layer(c, v, old, 1f, bannerTop, e, now);
        else old = null;
        more |= layer(c, v, cur, old == null ? 1f : t, bannerTop, e, now);
        return more || t < 1f || FullArt.hiding();
    }

    /** The clip's last sharp frame where the clip was drawn, fading out above Metrolist's seam as the clip does. */
    private static void sharpOver(Canvas c, View v, int bannerTop, float a, Bitmap bmp) {
        float side = FullArt.bannerSide();
        if (side <= 0 || a <= 0f) return;
        int H = v.getHeight();
        float left = (v.getWidth() - side) / 2f, y0 = bannerTop + FullArt.fadeStart() * H, y1 = bannerTop + FullArt.seam() * H;
        int save = c.saveLayerAlpha(0, bannerTop, v.getWidth(), y1, Math.round(255 * a));
        paint.setAlpha(255);
        // where the clip was drawn (Metrolist's place for it), inside the banner
        RectF r = AnimatedCover.videoRect(v.getWidth(), H);
        if (r == null) dst.set(left, bannerTop, left + side, bannerTop + side);
        else dst.set(r.left, bannerTop + r.top, r.right, bannerTop + r.bottom);
        c.save();
        c.clipRect(left, bannerTop, left + side, bannerTop + side);
        c.drawBitmap(bmp, null, dst, paint);
        c.restore();
        Paint m = new Paint();
        m.setShader(new LinearGradient(0, y0, 0, Math.max(y0 + 1, y1), 0xFF000000, 0x00000000, Shader.TileMode.CLAMP));
        m.setXfermode(new android.graphics.PorterDuffXfermode(android.graphics.PorterDuff.Mode.DST_IN));
        c.drawRect(0, bannerTop, v.getWidth(), y1, m);
        c.restoreToCount(save);
    }

    private static void bitmapOver(Canvas c, Bitmap b, View v, int alpha) {
        paint.setAlpha(alpha);
        dst.set(0, 0, v.getWidth(), v.getHeight());
        c.drawBitmap(b, null, dst, paint);
    }

    /** One song's bleed at alpha a; true while its full version is still fading in. */
    private static boolean layer(Canvas c, View v, Layer l, float a, int bannerTop, float e, long now) {
        float left = (v.getWidth() - l.width) / 2f;
        float pa = ramp(l.shownAt, now), fa = 1f;
        if (l.mesh != null) {
            paint.setAlpha(Math.round(255 * a));
            dst.set(0, 0, v.getWidth(), v.getHeight());
            c.drawBitmap(l.mesh, null, dst, paint);
        }
        if (FullArt.hiding() && e > 0f && l.cover != null) {
            // YT's card is hidden for its swipe: the cover in its place, fading into the bleed as YT's does
            int side = l.width, cut = side;
            int save = c.saveLayerAlpha(left, bannerTop, left + side, bannerTop + cut, Math.round(255 * a * e));
            paint.setAlpha(255);
            dst.set(left, bannerTop, left + side, bannerTop + side);
            c.drawBitmap(l.cover, null, dst, paint);
            if (coverMask == null || coverMaskFor != l.detailTop + bannerTop * 7919) {
                coverMaskFor = l.detailTop + bannerTop * 7919;
                int n = 17;
                int[] colors = new int[n];
                float[] stops = new float[n];
                for (int i = 0; i < n; i++) {
                    stops[i] = i / (float) (n - 1);
                    colors[i] = (Math.round((1f - FullArt.smoother(stops[i])) * 255) << 24);
                }
                coverMask = new Paint();
                coverMask.setShader(new LinearGradient(0, bannerTop + l.detailTop, 0, bannerTop + cut, colors, stops, Shader.TileMode.CLAMP));
                coverMask.setXfermode(new android.graphics.PorterDuffXfermode(android.graphics.PorterDuff.Mode.DST_IN));
            }
            c.drawRect(left, bannerTop, left + side, bannerTop + cut, coverMask);
            c.restoreToCount(save);
        }
        return pa < 1f;
    }
}
