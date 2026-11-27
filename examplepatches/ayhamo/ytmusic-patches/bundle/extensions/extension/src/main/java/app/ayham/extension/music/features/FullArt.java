package app.ayham.extension.music.features;

import android.app.Activity;
import android.graphics.BlendMode;
import android.graphics.LinearGradient;
import android.graphics.RenderEffect;
import android.graphics.Shader;
import android.os.Build;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;

/**
 * BitChord's "Fullscreen cover art" on the BitChord screen, laid out as Metrolist's fullscreen
 * style. YT's own art (its pager container, with the animated cover inside it) is pinned to the
 * very top and zoomed so its height is 60% of the screen's (1 to 1.6 times the width, sides
 * cropped); its edge fades out where ArtBleed's blur starts, over the bleed drawn below it. An
 * animated cover instead fills the zone down to Metrolist's seam (by the artist line) and fades
 * out from above the title to it. While nothing plays for a second (and no
 * animated cover shows) it morphs back into the card, as BitChord's banner does. The card is
 * BitChord's too: screen width less a 30dp gutter each side, at most 560dp, and 0.86 of that while
 * paused (springing at once, no hold). Portrait and song mode only. Everything set on YT's view is given back: collapse, a sheet, switch off.
 */
final class FullArt {
    private static final String TAG = "AyhamFullArt";
    private static final long MORPH_MS = 420, PAUSE_MS = 1000;

    /** 0 = YT's card, 1 = the banner. */
    private static float t;
    private static long lastFrame, lastPos = -2, movedAt, barReadAt, wokeAt;
    private static String lastBar;
    private static View art, top, layer;
    /** YT's own translationX/Y, scaleX/Y, pivotX/Y of its art; translationZ of its top bar. */
    private static float[] yt;
    /** What we set last: {translationX, translationY, scale}; a different value is YT's own change. */
    private static final float[] ours = new float[3];
    private static boolean oursSet;
    private static final int[] loc = new int[2];
    private static boolean pivotWasSet;
    private static float topZ, layerZ;
    private static float fadeFor = -1;
    private static int fadeH;
    private static boolean logged;
    private static int lastState = -1;
    /**
     * YT's swipe between songs hides its thumbnail for a few frames and slides its card: our layout
     * stays and YT's card is hidden meanwhile (the backdrop holds the old art), then the new art fades
     * in once its backdrop is ready. Longer than this is not a swipe: YT's art is given back.
     */
    private static final long SWIPE_HOLD_MS = 700, REVEAL_MS = 300, REVEAL_WAIT_MS = 1000;
    private static long swipeAt, revealAt, hidAt;
    private static float ytAlpha = 1f;
    private static boolean hiding, sawGap, gapThisHide;
    /** YT 9.30's art pager under the card we move: empty but for its swipe's sliding cards, kept transparent. */
    private static View pagerHidden;
    private static float pagerAlpha = 1f;

    private FullArt() {
    }

    static boolean on() {
        return "1".equals(Features.props().getProperty("fullArt"));
    }

    /** smootherStep, BitChord's fade curve */
    static float smoother(float x) {
        x = Math.max(0f, Math.min(1f, x));
        return x * x * x * (x * (x * 6 - 15) + 10);
    }

    private static float radius;
    /** YT's video surfaces we hid: unused for a song, but their hole in the window shows black through the fade. */
    private static final java.util.List<View> holes = new java.util.ArrayList<>();

    private static void hideHoles(View v) {
        if (v instanceof android.view.SurfaceView && v.getVisibility() == View.VISIBLE) {
            v.setVisibility(View.INVISIBLE);
            holes.add(v);
        } else if (v instanceof android.view.ViewGroup) {
            android.view.ViewGroup g = (android.view.ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) hideHoles(g.getChildAt(i));
        }
    }

    private static boolean inside(View v, View group) {
        for (Object p = v.getParent(); p instanceof View; p = ((View) p).getParent()) if (p == group) return true;
        return false;
    }

    /** CardView's corner radius (androidx, reached by reflection: the extension does not link it). */
    private static java.lang.reflect.Method getRadius, setRadius;
    private static Class<?> radiusFor;
    private static float radiusSet = -1;

    private static float radius(View v) {
        try {
            if (radiusFor != v.getClass()) {
                radiusFor = v.getClass();
                getRadius = v.getClass().getMethod("getRadius");
                setRadius = v.getClass().getMethod("setRadius", float.class);
            }
            radiusSet = -1;
            return (Float) getRadius.invoke(v);
        } catch (Throwable t) {
            getRadius = setRadius = null;
            return 0f;
        }
    }

    private static void setRadius(View v, float r) {
        if (setRadius == null || r == radiusSet) return;
        try {
            setRadius.invoke(v, r);
            radiusSet = r;
        } catch (Throwable ignored) {
        }
    }

    /** The biggest shown, near-square view inside the art pager: YT's art card when its id is not in this layout. */
    static View squarest(View v, int pagerWidth) {
        View best = null;
        if (v.isShown() && v.getWidth() >= pagerWidth * 0.6f && Math.abs(v.getWidth() - v.getHeight()) < v.getWidth() * 0.05f) best = v;
        if (v instanceof android.view.ViewGroup) {
            android.view.ViewGroup g = (android.view.ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) {
                View c = squarest(g.getChildAt(i), pagerWidth);
                // the outermost square is the card; a square inside it (the image) moves with it
                if (c != null && (best == null || c.getWidth() > best.getWidth())) best = c;
            }
        }
        return best;
    }

    /**
     * Playing = YT's position moved in the last second: our captured player's position, or YT's own
     * time bar (a custom view whose accessibility text holds the position; only compared, so its
     * language does not matter). No button texts: those are translated.
     */
    private static boolean playing(View bar, long now) {
        long pos = app.ayham.extension.music.automix.Automix.positionMs();
        if (pos != lastPos) {
            if (lastPos != -2 && pos >= 0) movedAt = now;
            lastPos = pos;
        }
        if (bar != null && now - barReadAt >= 250) {
            barReadAt = now;
            String d = null;
            if (bar instanceof android.widget.SeekBar) d = String.valueOf(((android.widget.SeekBar) bar).getProgress());
            else {
                android.view.accessibility.AccessibilityNodeInfo n = bar.createAccessibilityNodeInfo();
                if (n.getContentDescription() != null) d = n.getContentDescription().toString();
                else if (n.getRangeInfo() != null) d = String.valueOf(n.getRangeInfo().getCurrent());
            }
            if (d != null && !d.equals(lastBar)) {
                if (lastBar != null) movedAt = now;
                lastBar = d;
            }
        }
        return now - movedAt < PAUSE_MS;
    }

    /** YT's views by id, found once per view (tick runs on every frame). */
    private static final java.util.Map<String, java.lang.ref.WeakReference<View>> found = new java.util.HashMap<>();

    static View view(Activity a, View root, String name) {
        java.lang.ref.WeakReference<View> r = found.get(name);
        View v = r == null ? null : r.get();
        if (v != null && v.isAttachedToWindow() && v.getRootView() == root.getRootView()) return v;
        v = root.findViewById(PlayerScreen.id(a, name));
        found.put(name, new java.lang.ref.WeakReference<>(v));
        return v;
    }

    /** BitChord's card: a 30dp gutter each side, at most 560dp wide; 0.86 of it while paused. */
    private static final float GUTTER_DP = 30, MAX_DP = 560, IDLE = 0.86f;
    /** BitChord's paused shrink: spring(DampingRatioLowBouncy, StiffnessLow). */
    private static final float STIFF = 200f, DAMP = 2 * 0.75f * (float) Math.sqrt(200f);
    private static float k = 1f, kv;
    private static boolean kFresh = true;
    /** Where the art is drawn this frame (the mesh seam): the banner or the shrunk card. */
    private static int drawn;
    /** BitChord's heroT easing. */
    private static final android.view.animation.PathInterpolator FAST_OUT_SLOW_IN =
            new android.view.animation.PathInterpolator(0.4f, 0f, 0.2f, 1f);

    /**
     * The card's box in px: the screen less the gutters, at most 560dp, times YT's own scale of its
     * art; no taller than the room left above the column, and never under half the screen.
     */
    static float cardBox(float screenW, float density, float ytScale, float room) {
        float box = Math.min(screenW - 2 * GUTTER_DP * density, MAX_DP * density) * ytScale;
        return Math.max(screenW * 0.5f, Math.min(box, room));
    }

    /**
     * One frame of the pause spring, in 4 ms steps: {k, velocity} after dtMs. Settles exactly on
     * the target once close, so the frames stop.
     */
    static float[] spring(float k, float v, float target, float dtMs) {
        for (float left = dtMs / 1000f; left > 1e-6f; left -= 0.004f) {
            float h = Math.min(0.004f, left);
            v += (-STIFF * (k - target) - DAMP * v) * h;
            k += v * h;
        }
        if (Math.abs(k - target) < 0.0005f && Math.abs(v) < 0.005f) return new float[]{target, 0f};
        return new float[]{k, v};
    }

    /** Where the banner would end as a square (its stats line sits there). */
    private static int squareEnd;
    /** The banner's side now, px: eases between the cover's zoom and an animated cover's zone. */
    private static float bannerS;
    private static boolean clipMode;
    /** Metrolist's fade bounds (PlayerScreen.kt fullscreenTransitionBounds), fractions of the screen's height from the page's top. */
    private static float fadeStart = 0.58f, seam = 0.66f;
    static final float TITLE_OFFSET = 0.08f, MIN_FADE_SPAN = 0.18f;

    /**
     * Metrolist's bounds from the title's top and the artist's bottom (px from the page's top), set
     * from the layout after each frame; a change draws the next one.
     */
    static void bounds(float titleTop, float artistBottom, float height, View decor) {
        float start = Math.max(0f, Math.min(0.85f, (titleTop - height * TITLE_OFFSET) / height));
        float end = Math.max(start, Math.min(1f, Math.max(artistBottom / height, start + MIN_FADE_SPAN)));
        float fs = Math.max(0f, Math.min(0.75f, start));
        float sm = Math.max(0f, Math.min(0.85f, Math.max(end, fs + 0.06f)));
        if (Math.abs(fs - fadeStart) * height < 1 && Math.abs(sm - seam) * height < 1) return;
        fadeStart = fs;
        seam = sm;
        decor.postInvalidateOnAnimation();
    }

    static boolean clipMode() {
        return clipMode;
    }

    private static int screenW, screenH, pageTopNow;

    /** Where the player page starts on the screen (px), as of the last frame. */
    static int pageTop() {
        return pageTopNow;
    }

    /**
     * The seam: Metrolist's from the title, or under a tall cover's 3:4 box (its canvasTall
     * seam, clamped to 0.3..0.85).
     */
    static float seam() {
        if (AnimatedCover.tallClip() && screenH > 0)
            return Math.max(0.3f, Math.min(0.85f, screenW * 4f / 3f / screenH));
        return seam;
    }

    /** The fade's start: the same span above a tall cover's seam as above the title's. */
    static float fadeStart() {
        if (AnimatedCover.tallClip() && screenH > 0) return seam() - (seam - fadeStart);
        return fadeStart;
    }

    /** The banner's side now, px (0 before the first frame). */
    static float bannerSide() {
        return bannerS;
    }

    static int squareBottom() {
        return squareEnd;
    }

    /** The art's drawn bottom this frame (apply returns the layout's, which never moves). */
    static int drawnBottom() {
        return drawn;
    }

    /**
     * Lays YT's art out for this frame as BitChord's card (or its banner) and returns where the
     * card's box ends: the column below starts there and stays put while the banner comes and goes
     * and the card shrinks on pause. maxBottom is as far down as the box may reach; pageTop is where
     * the player page starts on the screen (0, or lower while it is dragged): the banner's top.
     */
    static int apply(Activity a, View decor, View pager, int maxBottom, int pageTop) {
        long now = SystemClock.uptimeMillis();
        // YT 9.30 draws the art card as its own layer over the (empty) pager; older layouts keep it inside
        View card = view(a, decor, "watch_fragment_container");
        if (card == null || card.getWidth() == 0 || !card.isShown()) card = pager.findViewById(PlayerScreen.id(a, "player_thumbnail"));
        if (card == null || card.getWidth() == 0 || !card.isShown()) card = squarest(pager, pager.getWidth());
        View move = card != null && !inside(card, pager) ? card : pager;
        boolean square = card != null && card.getWidth() > 0 && Math.abs(card.getWidth() - card.getHeight()) < card.getWidth() * 0.05f;
        // song mode: YT shows the album art; a music video keeps its surface, never faded or hidden
        View thumb = view(a, decor, "player_thumbnail");
        boolean song = thumb != null && thumb.isShown();
        boolean portrait = decor.getHeight() > decor.getWidth();
        if (decorRef == null || decorRef.get() != decor) decorRef = new java.lang.ref.WeakReference<>(decor);
        // YT's media session says play/pause the moment it happens; the position check (the art's
        // first way) only stands in while the session is not found
        Boolean session = PlayerScreen.playingFor(a, PAUSE_MS);
        boolean playing = session != null ? session : playing(view(a, decor, "time_bar"), now);
        Boolean sessionNow = PlayerScreen.playingFor(a, 0);
        boolean playingNow = sessionNow != null ? sessionNow : playing;
        boolean on = on(), clip = AnimatedCover.clipShowing();
        boolean own = portrait && square && song;
        boolean want = on && own && (playing || clip);
        int state = (on ? 1 : 0) | (portrait ? 2 : 0) | (square ? 4 : 0) | (playing ? 8 : 0) | (clip ? 16 : 0) | (song ? 32 : 0) | (playingNow ? 64 : 0);
        if (state != lastState) {
            // logged on change only: this runs on every frame
            lastState = state;
            Log.i(TAG, (want ? "banner: " : "card: ") + "on=" + on + " portrait=" + portrait + " square=" + square + " song=" + song
                    + " playing=" + playing + " now=" + playingNow + " clip=" + clip
                    + " (card " + (card == null ? "none" : card.getWidth() + "x" + card.getHeight()) + ")");
        }

        // the swipe between songs: same card, its thumbnail hidden for a moment. It starts a frame or
        // two earlier, when YT scales the card for its slide (YT never scales it otherwise)
        boolean candidate = art != null && art == move && on && portrait && square;
        boolean gap = candidate && !song;
        boolean ytMoves = candidate && song && oursSet && Math.abs(move.getScaleX() - ours[2]) > 0.001f;
        boolean swipe = gap || candidate && (swipeAt == 0 ? ytMoves : !sawGap && now - swipeAt < 150);
        if (swipe) {
            if (swipeAt == 0) {
                swipeAt = now;
                sawGap = false;
                if (!hiding) {
                    ytAlpha = move.getAlpha();
                    hidAt = now;
                    gapThisHide = false;
                }
                hiding = true;
                revealAt = 0;
                Log.i(TAG, "song swipe: YT's card hidden, our art held (" + (gap ? "thumbnail hidden" : "YT scales its card") + ")");
                ArtBackdrop.redraw();
            }
            if (gap) sawGap = gapThisHide = true;
            if (now - swipeAt < SWIPE_HOLD_MS) {
                if (move.getAlpha() != 0f) move.setAlpha(0f);
                decor.postInvalidateOnAnimation();
                return drawnBox;
            }
        }
        if (!swipe && swipeAt != 0) {
            swipeAt = 0;
            revealAt = now;
            // YT scaled its card but no song change followed: shown again at once
            if (!gapThisHide) hidAt = -1;
        }
        if (art != null && (art != move || !own)) giveBack(); // another view, or a video: give back at once
        if (!own) {
            // YT's own layout: where its art ends
            View end = card != null ? card : pager;
            end.getLocationOnScreen(loc);
            drawn = Math.round(loc[1] + end.getHeight() * end.getScaleY());
            return drawn;
        }
        if (move != pager && pagerHidden != pager) {
            if (pagerHidden != null) pagerHidden.setAlpha(pagerAlpha);
            pagerHidden = pager;
            pagerAlpha = pager.getAlpha();
            pager.setAlpha(0f);
        } else if (move != pager && pager.getAlpha() != 0f) pager.setAlpha(0f);
        float dt = lastFrame == 0 ? 16 : Math.min(50, now - lastFrame);
        lastFrame = now;
        float target = want ? 1f : 0f;
        if (t != target) t = target > t ? Math.min(1f, t + dt / MORPH_MS) : Math.max(0f, t - dt / MORPH_MS);
        // the paused card shrinks at once (no hold), springing; a song with a clip never shrinks
        float kTarget = playingNow || clip ? 1f : IDLE;
        if (kFresh) {
            k = kTarget;
            kv = 0;
            kFresh = false;
        } else if (k != kTarget || kv != 0) {
            float[] next = spring(k, kv, kTarget, dt);
            k = next[0];
            kv = next[1];
        }
        if (t != target || k != kTarget) decor.postInvalidateOnAnimation();
        else if (session == null && want && now - wokeAt > 250) {
            // nothing else may draw once the song pauses: wake up when the pause would count
            wokeAt = now;
            decor.postInvalidateDelayed(PAUSE_MS + 50);
        }

        if (art == null) {
            art = move;
            yt = new float[]{move.getTranslationX(), move.getTranslationY(), move.getScaleX(), move.getScaleY(), move.getPivotX(), move.getPivotY()};
            pivotWasSet = Build.VERSION.SDK_INT < 28 || move.isPivotSet();
            oursSet = false;
            top = view(a, decor, "player_top_section");
            if (top != null) {
                topZ = top.getTranslationZ();
                // YT's top bar (collapse, song/video, cast, menu) stays above the banner
                top.setTranslationZ(topZ + 100f);
                // Z orders only siblings: the bar's own layer must sit above the card (a CardView, raised
                // by its elevation) too, or the grown card takes the bar's taps (the song/video toggle)
                layer = top;
                while (layer.getParent() instanceof View && layer.getParent() != move.getParent()) layer = (View) layer.getParent();
                if (layer != top && layer.getParent() == move.getParent() && layer.getZ() <= move.getZ()) {
                    layerZ = layer.getTranslationZ();
                    layer.setTranslationZ(layerZ + move.getZ() - layer.getZ() + 1f);
                } else layer = null;
            }
            fadeFor = -1;
            radius = radius(move);
            holes.clear();
            hideHoles(move);
        }
        if (oursSet) {
            // YT moved or scaled its art itself since our last frame: that is its own value now
            if (Math.abs(move.getTranslationX() - ours[0]) > 0.5f) yt[0] = move.getTranslationX();
            if (Math.abs(move.getTranslationY() - ours[1]) > 0.5f) yt[1] = move.getTranslationY();
            if (Math.abs(move.getScaleX() - ours[2]) > 0.001f) {
                yt[2] = move.getScaleX();
                yt[3] = move.getScaleY();
            }
        }
        float e = FAST_OUT_SLOW_IN.getInterpolation(t);
        // where YT draws its art (our transform taken out: YT's translation, and its scale around its pivot)
        ((View) move.getParent()).getLocationOnScreen(loc);
        float baseX = loc[0] + move.getLeft(), baseY = loc[1] + move.getTop();
        float natX = baseX + yt[0] + yt[4] * (1 - yt[2]), natY = baseY + yt[1] + yt[5] * (1 - yt[3]);
        // where the card sits inside the moved view (0 when the card is the moved view)
        float offX = 0, offY = 0;
        for (View v = card; v != move && v != null; v = (View) v.getParent()) {
            if (!(v.getParent() instanceof View)) break;
            View parent = (View) v.getParent();
            // a pager's pages sit side by side, scrolled into place
            offX += v.getLeft() + v.getTranslationX() - parent.getScrollX();
            offY += v.getTop() + v.getTranslationY() - parent.getScrollY();
        }
        // BitChord's box: centred where YT centres its card, from YT's card top, sized by the gutter
        // and the max width (and by the room the column below needs)
        float dens = decor.getResources().getDisplayMetrics().density;
        float ytW = yt[2] * card.getWidth(), ytLeft = natX + yt[2] * offX, ytTop = natY + yt[3] * offY;
        float box = cardBox(decor.getWidth(), dens, yt[2], maxBottom - ytTop);
        float boxLeft = ytLeft + (ytW - box) / 2;
        // the card in the box, k of its size, around its centre
        float cw = box * k;
        float sc = cw / card.getWidth();
        float cardLeft = boxLeft + (box - cw) / 2, cardTop = ytTop + (box - cw) / 2;
        // ...and the banner, from the page's top, centred: the cover zoomed to 60% of the height, or an
        // animated cover filling the zone above the seam (a square card: the larger side wins)
        int W = decor.getWidth(), H = decor.getHeight();
        squareEnd = Math.round(pageTop + W);
        clipMode = clip;
        screenW = W;
        screenH = H;
        pageTopNow = pageTop;
        // a full-height clip (a Spotify canvas, a music video's loop) fills the whole player, unfaded;
        // only Apple's tall 3:4 cover stops at the seam and fades into the colours below
        boolean fullClip = clip && !AnimatedCover.tallClip();
        float wantS = fullClip ? Math.max(W, H - pageTop) : clip ? Math.max(W, seam() * H) : ArtBleed.containerWidth(W, H, 1f);
        if (bannerS == 0) bannerS = wantS;
        else if (bannerS != wantS) {
            bannerS += (wantS - bannerS) * Math.min(1f, dt / 120f);
            if (Math.abs(wantS - bannerS) < 0.5f) bannerS = wantS;
            else decor.postInvalidateOnAnimation();
        }
        float big = bannerS / card.getWidth();
        float s = sc + e * (big - sc);
        float cardX = (1 - e) * cardLeft + e * (W - bannerS) / 2f, cardY = (1 - e) * cardTop + e * pageTop;
        float x = cardX - s * offX, y = cardY - s * offY;
        move.setPivotX(0);
        move.setPivotY(0);
        move.setScaleX(s);
        move.setScaleY(s);
        move.setTranslationX(x - baseX);
        move.setTranslationY(y - baseY);
        ours[0] = x - baseX;
        ours[1] = y - baseY;
        ours[2] = s;
        oursSet = true;
        // YT's layouts around the card clip it to their own bounds (about 60% of the screen): opened up
        // while a full-height clip shows, so it reaches the bottom instead of the backdrop showing there
        if (fullClip && e > 0f) unclip(move, decor);
        else restoreClip();
        if (fullClip) fade(move, offY, card.getHeight(), 0f, 0f, 1f, false); // no mask: the clip to the bottom
        else if (clip) fade(move, offY, card.getHeight(), e, fadeStart() * H / bannerS, seam() * H / bannerS, false);
        else {
            // BitChord: the art's lowest 42% dissolves into the mesh on a smootherstep
            fade(move, offY, card.getHeight(), e, 1f - ArtBackdrop.FADE_FRACTION, 1f, true);
        }
        if (radius > 0) setRadius(move, radius * (1 - e)); // the banner runs edge to edge, square
        if (!logged && (t == 1f || t == 0f)) {
            logged = true;
            Log.i(TAG, "card box " + Math.round(box) + "px at " + Math.round(boxLeft) + "," + Math.round(ytTop)
                    + " (YT's " + Math.round(ytW) + "px), banner x" + big + " to the width " + decor.getWidth());
        }
        drawn = Math.round(cardY + s * card.getHeight());
        if (hiding && swipeAt == 0) {
            // the new art fades in once its backdrop has crossfaded to it (or after a wait), never as a pop:
            // YT's card replays its own old-to-new fade, so it comes in only once ours shows the new cover
            long since = ArtBackdrop.readySince();
            long from = hidAt < 0 ? now - REVEAL_MS : since >= hidAt ? Math.max(since + ArtBackdrop.CROSSFADE_MS, revealAt) : now - revealAt > REVEAL_WAIT_MS ? revealAt + REVEAL_WAIT_MS : 0;
            float k2 = from == 0 ? 0f : Math.min(1f, (now - from) / (float) REVEAL_MS);
            move.setAlpha(ytAlpha * k2);
            if (k2 >= 1f) {
                hiding = false;
                ArtBackdrop.redraw();
                Log.i(TAG, "song swipe: new art shown " + (now - revealAt) + " ms after the swipe");
            } else decor.postInvalidateOnAnimation();
        }
        drawnBox = Math.round(ytTop + box);
        return drawnBox;
    }

    private static long fadeKey;
    private static int drawnBox;

    /**
     * The card fades out from u0 to u1 (fractions of its height: smootherStep for the bleed's
     * crossfade, linear for Metrolist's animated cover mask), as much as the morph is done.
     */
    private static void fade(View v, float top, float h, float e, float u0, float u1, boolean smooth) {
        if (Build.VERSION.SDK_INT < 31) return;
        if (e == 0f) {
            // the card: no mask at all (an opaque one still costs an offscreen pass every frame)
            if (fadeFor != 0f) v.setRenderEffect(null);
            fadeFor = 0f;
            return;
        }
        u0 = Math.max(0f, Math.min(1f, u0));
        u1 = Math.max(u0 + 0.001f, Math.min(1.001f, u1));
        // a bright cover's banner is shaded as the backdrop below it (ArtMesh.glare): half at the top,
        // all of it where it fades out (white status bar, controls and title stayed white on white);
        // Apple's tall clip too (Fortnight's is the white sleeve moving)
        int g = ArtBackdrop.glare();
        long key = Math.round(u0 * 4000) * 10000L + Math.round(u1 * 4000) + (smooth ? 1L << 40 : 0) + ((long) g << 41);
        boolean same = key == fadeKey && fadeH == v.getHeight();
        if (same && Math.abs(e - fadeFor) < 0.02f && e != 1f && e != 0f) return;
        if (same && e == fadeFor) return;
        fadeFor = e;
        fadeH = v.getHeight();
        fadeKey = key;
        int n = smooth ? 17 : 2;
        int[] colors = new int[n];
        float[] stops = new float[n];
        for (int i = 0; i < n; i++) {
            float u = i / (float) (n - 1);
            stops[i] = u;
            float alpha = 1f - e * (smooth ? smoother(u) : u);
            colors[i] = (Math.round(alpha * 255) << 24) | 0xFFFFFF;
        }
        // opaque above u0, faded (as far as e) below u1: the gradient clamps its end colours
        float y0 = top + h * u0, y1 = top + h * u1;
        Shader mask = new LinearGradient(0, y0, 0, y1, colors, stops, Shader.TileMode.CLAMP);
        RenderEffect art = RenderEffect.createOffsetEffect(0, 0);
        int ge = Math.round(g * e);
        if (ge > 0) {
            Shader shade = new LinearGradient(0, top, 0, y1, (ge / 2) << 24, ge << 24, Shader.TileMode.CLAMP);
            art = RenderEffect.createBlendModeEffect(art, RenderEffect.createShaderEffect(shade), BlendMode.SRC_ATOP);
        }
        v.setRenderEffect(RenderEffect.createBlendModeEffect(art, RenderEffect.createShaderEffect(mask), BlendMode.DST_IN));
    }

    /** YT's layouts we stopped clipping the card (each was clipping before). */
    private static final java.util.List<java.lang.ref.WeakReference<ViewGroup>> unclipped = new java.util.ArrayList<>();

    private static void unclip(View v, View decor) {
        if (!unclipped.isEmpty()) return;
        for (android.view.ViewParent p = v.getParent(); p instanceof ViewGroup && p != decor; p = p.getParent()) {
            ViewGroup g = (ViewGroup) p;
            if (g.getClipChildren()) {
                g.setClipChildren(false);
                unclipped.add(new java.lang.ref.WeakReference<>(g));
            }
        }
        if (!unclipped.isEmpty()) Log.i(TAG, "full-height clip: " + unclipped.size() + " of YT's layouts no longer clip the art");
    }

    private static void restoreClip() {
        if (unclipped.isEmpty()) return;
        for (java.lang.ref.WeakReference<ViewGroup> r : unclipped) {
            ViewGroup g = r.get();
            if (g != null) g.setClipChildren(true);
        }
        unclipped.clear();
    }

    /** YT's art and top bar as YT had them; a value YT changed since (a drag, a sheet) stays YT's. */
    static void giveBack() {
        restoreClip();
        if (pagerHidden != null) {
            pagerHidden.setAlpha(pagerAlpha);
            pagerHidden = null;
        }
        if (art != null && hiding) art.setAlpha(ytAlpha);
        hiding = false;
        swipeAt = 0;
        if (art != null && yt != null) {
            // each value on its own: YT re-sets the card's translation on its layouts, never our scale
            boolean tx = !oursSet || Math.abs(art.getTranslationX() - ours[0]) <= 0.5f;
            boolean ty = !oursSet || Math.abs(art.getTranslationY() - ours[1]) <= 0.5f;
            boolean sc = !oursSet || Math.abs(art.getScaleX() - ours[2]) <= 0.001f;
            boolean mine = tx && ty && sc;
            if (tx) art.setTranslationX(yt[0]);
            if (ty) art.setTranslationY(yt[1]);
            if (sc) {
                art.setScaleX(yt[2]);
                art.setScaleY(yt[3]);
            }
            if (pivotWasSet) {
                art.setPivotX(yt[4]);
                art.setPivotY(yt[5]);
            } else art.resetPivot(); // YT's default pivot, which follows the view's size
            if (Build.VERSION.SDK_INT >= 31) art.setRenderEffect(null);
            if (radius > 0) {
                radiusSet = -1;
                setRadius(art, radius);
            }
            // only the surfaces still hidden as we left them
            for (View h : holes) if (h.getVisibility() == View.INVISIBLE) h.setVisibility(View.VISIBLE);
            if (top != null) top.setTranslationZ(topZ);
            if (layer != null) layer.setTranslationZ(layerZ);
            Log.i(TAG, "YT's art given back" + (mine ? "" : " (YT had moved it: its place kept)"));
        }
        art = null;
        top = null;
        layer = null;
        yt = null;
        oursSet = false;
        radius = 0f;
        holes.clear();
        t = 0f;
        kFresh = true;
        fadeFor = -1;
        fadeKey = 0;
        bannerS = 0;
        logged = false;
    }

    private static java.lang.ref.WeakReference<View> decorRef;

    /** YT played or paused: a frame now (the banner rises at once), and one when the pause has held. */
    static void wake() {
        View d = decorRef == null ? null : decorRef.get();
        if (d == null) return;
        d.postInvalidateOnAnimation();
        d.postInvalidateDelayed(PAUSE_MS + 30);
    }

    /** YT's card is hidden for a song swipe (the backdrop draws the cover in its place). */
    static boolean hiding() {
        return hiding;
    }

    /** How far the banner is: 0 = YT's card, 1 = fully up. */
    static float progress() {
        return FAST_OUT_SLOW_IN.getInterpolation(t);
    }

    /** The banner is up (or on its way): the column below is laid out for it. */
    static boolean shown() {
        return t > 0f;
    }
}
