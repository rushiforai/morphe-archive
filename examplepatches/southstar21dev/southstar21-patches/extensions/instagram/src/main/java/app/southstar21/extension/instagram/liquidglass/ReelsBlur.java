package app.southstar21.extension.instagram.liquidglass;

import android.annotation.SuppressLint;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RecordingCanvas;
import android.graphics.Rect;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.WeakHashMap;

/**
 * iOS 26's Reels look: each reel runs down behind the floating bar, and the strip of it under
 * the caption, behind the bar, is a frosted copy of its own video. The strip belongs to the
 * reel, not the screen, so it slides away with the reel while scrolling and the next reel comes
 * in sharp.
 * <p>
 * Each page's video layout gets a {@link Strip} in its overlay: drawn over the video but under
 * all of Instagram's UI (caption, buttons, seek bar, legibility gradient), so it can't cover any
 * of it, and moving with the page. It re-records the video each frame; Instagram's gradient then
 * darkens strip and page alike, so the two meet without a seam. The caption, the button column
 * and the seek bar are lifted together, just as far as it takes for them to end above the strip.
 * <p>
 * Needs the TextureView player (Blur videos): a SurfaceView is a layer of its own that can't be
 * recorded.
 */
@SuppressLint("NewApi")
final class ReelsBlur {
    private static final String PKG = "com.instagram.android";
    private static final long RESCAN_MS = 500;
    /** Over this much at its top the strip eases from sharp to fully frosted. */
    private static final float FEATHER_DP = 56f;
    /** Light to strong, each fading in a little further down the feather (see EdgeBlurView). */
    private static final float[] RADII_DP = {3f, 9f, 22f};
    private static final float[][] RAMPS = {{0f, 0.45f}, {0.2f, 0.75f}, {0.45f, 1f}};
    /** Recorded above the strip so the top of the blur averages real video, not a clamped row. */
    private static final float PAD_DP = 40f;

    private final View root;
    private final float density;
    private final int pagerId, videoId, containerId, infoId, scrubberId;
    /** How soft the band behind the status bar goes while it holds still through a swipe. */
    private static final float BAND_BLUR_DP = 14f;
    /** The last part of a swipe (of a page's height) over which the band comes into focus on the arriving reel. */
    private static final float BAND_SETTLE = 0.3f;
    /** How often the band's picture is copied while a reel rests (for the next swipe to hold). */
    private static final long BAND_SNAPSHOT_MS = 250;
    /** Portrait videos needing up to this much zoom to fill the screen are zoomed (wider ones keep their bars). */
    private static final float MAX_FILL_SCALE = 1.4f;
    /** As above, when they only fill the page below the status bar (Full screen off). */
    private static final float MAX_PAGE_FILL_SCALE = 1.25f;
    /** Videos at least this tall for their width (9:16 is 1.78) count as portrait. */
    private static final float PORTRAIT_RATIO = 1.6f;

    private WeakReference<ViewGroup> pager;
    private long lastScan;
    private final WeakHashMap<View, Strip> strips = new WeakHashMap<>();
    /** The video behind the status bar, and the container whose overlay holds it. */
    private TopBand topBand;
    private WeakReference<View> topHost;
    /** Views scrolled to lift what they hold above the strip, put back when the effect stops. */
    private final WeakHashMap<View, Boolean> lifted = new WeakHashMap<>();
    /** Seek bar hosts moved up above the strip, put back when the effect stops. */
    private final WeakHashMap<View, Boolean> shifted = new WeakHashMap<>();
    /** Video containers zoomed to fill their page, put back when the effect stops. */
    private final WeakHashMap<View, Boolean> filled = new WeakHashMap<>();
    /** Per video layer: the scale and offset last written, and Instagram's own (see instagramsTransform). */
    private final WeakHashMap<View, float[]> transforms = new WeakHashMap<>();
    private static final int WRITTEN_SCALE = 0, WRITTEN_TY = 1, BASE_SCALE = 2, BASE_TY = 3;
    /** How far Instagram shrinks the reel before the zoom has wholly handed over to it. */
    private static final float HANDOFF_SCALE = 0.15f;
    /** The backdrop around the small reel: how soft, how much smaller it's recorded, and how much darker. */
    private static final float BACKDROP_BLUR_DP = 40f;
    private static final float BACKDROP_DOWNSCALE = 4f;
    private static final int BACKDROP_TINT = 0x38000000;
    /** More copies than this (a reel shrunk to almost nothing) and the backdrop stays black. */
    private static final int MAX_TILES = 36;
    /**
     * The card a reel shrinks into above a sheet Instagram doesn't shrink it for (see card), made
     * to match the one Instagram makes above the comments: its gaps to the status bar and to the
     * sheet, its shape (width to height), how far the sheet must come up (of the reel's height)
     * before it is cut down to that shape all the way, and its corners.
     */
    private static final float CARD_TOP_DP = 4f, CARD_BOTTOM_DP = 9f;
    private static final float CARD_RATIO = 4f / 3f;
    private static final float CARD_CUT_SPAN = 0.45f;
    private static final float CARD_RADIUS_DP = 15f;
    private final float[] cardGeometry = new float[4];
    /** The Reels header, and the sheet dimmer kept off (see fadeForSheet). */
    private WeakReference<View> headerView, fadedDimmer, scrimView, fadedScrim;
    /** The reel's UI and the header, faded while the reel is small (see fadeReelUi). */
    private final WeakHashMap<View, Boolean> faded = new WeakHashMap<>();
    /** How far the reel showing has shrunk, last frame (see smallReel). */
    private float smallBy;
    /** Layers shaped as a card, with the outline each had before. */
    private final WeakHashMap<View, CardOutline> cardOutlines = new WeakHashMap<>();
    /** The blurred reel around the small one above a sheet, the video layout it's the background of, and its band. */
    private SheetBackdrop backdrop;
    private WeakReference<View> backdropVideo;
    private SheetBand sheetBand;
    private WeakReference<View> sheetBandHost;
    private final int[] location = new int[2];
    private final int[] other = new int[2];
    private final Rect visible = new Rect();
    private boolean active;
    private boolean wasOn;
    /** Until then (uptime ms) the pager is looked for every frame: Reels just came up. */
    private long searchUntil;
    private static final long EAGER_SEARCH_MS = 1500;

    ReelsBlur(View root, float density) {
        this.root = root;
        this.density = density;
        android.content.res.Resources res = root.getResources();
        pagerId = res.getIdentifier("clips_viewer_view_pager", "id", PKG);
        videoId = res.getIdentifier("clips_viewer_video_layout", "id", PKG);
        containerId = res.getIdentifier("clips_video_container", "id", PKG);
        infoId = res.getIdentifier("clips_media_info_component", "id", PKG);
        scrubberId = res.getIdentifier("scrubber", "id", PKG);
    }

    /**
     * How far the reel showing has shrunk above a sheet (0: not at all, 1: wholly), for the bar to
     * fade with the reel's own UI, as on iOS.
     */
    float smallReel() {
        return smallBy;
    }

    /** Whether the ids it needs exist in this Instagram build. */
    boolean usable() {
        return pagerId != 0 && videoId != 0 && infoId != 0 && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S;
    }

    /**
     * Once a frame.
     *
     * @param on        Reels is the page showing, with the bar over it
     * @param stripTop  where the strip starts, in window coordinates (just above the pill)
     */
    void onPreDraw(boolean on, int stripTop) {
        if (on && !wasOn) searchUntil = SystemClock.uptimeMillis() + EAGER_SEARCH_MS;
        wasOn = on;
        ViewGroup pager = on ? pager() : null;
        if (pager == null || pager.getChildCount() == 0 || !(pager.getChildAt(0) instanceof ViewGroup)) {
            stop();
            return;
        }
        active = true;
        boolean fullScreen = LiquidGlassNavBarPatch.REELS_FULL_SCREEN.get();
        pager.getLocationInWindow(location);
        int height = location[1] + pager.getHeight() - stripTop;
        if (height <= 0) {
            stop();
            return;
        }
        int pagerLeft = location[0];
        int pagerTop = location[1];
        // Where the pages rest. Pulling down on the first reel (to refresh) slides the whole pager
        // down under Instagram's spinner; measured from there, the zoom grew for a taller screen
        // and the status bar's band reached down into the gap. The pager's container stays put.
        if (pager.getParent() instanceof View) {
            ((View) pager.getParent()).getLocationInWindow(other);
            pagerTop = Math.min(pagerTop, other[1]);
        }
        // The pages are the RecyclerView's children (ViewPager2's only child).
        ViewGroup list = (ViewGroup) pager.getChildAt(0);
        int sheetTop = sheetTop();
        View shrunk = null;
        float shrunkBy = 0f;
        for (int i = 0; i < list.getChildCount(); i++) {
            View page = list.getChildAt(i);
            if (!(page instanceof ViewGroup)) continue;
            View video = page.findViewById(videoId);
            float pageShrunkBy = 0f;
            if (video != null) {
                Strip strip = strips.get(video);
                if (strip == null) {
                    strip = new Strip();
                    strips.put(video, strip);
                    video.getOverlay().add(strip);
                }
                float handoff = fill(video, page, pagerTop, fullScreen, cardSheetTop(sheetTop));
                pageShrunkBy = handoff;
                if (handoff > 0f) {
                    // The sheet covers the bottom of the page, and the strip would only frost
                    // the backdrop there.
                    strip.hide();
                    if (handoff > shrunkBy) {
                        shrunk = video;
                        shrunkBy = handoff;
                    }
                } else {
                    strip.update(page, video, height);
                }
            }
            lift(page, page.getHeight() - height);
            fadeReelUi(page, pageShrunkBy);
        }
        updateSheetBackdrop(pager, shrunk, shrunkBy);
        fadeForSheet(shrunkBy, sheetTop >= 0);
        smallBy = shrunkBy;
        // While Instagram shows the reel small above a sheet, the screen above the sheet is the
        // backdrop's, behind the clock too.
        if (fullScreen && shrunk == null) {
            updateTopBand(pager, list, pagerLeft, pagerTop);
        } else if (topBand != null) {
            topBand.hide();
        }
    }

    /**
     * Fills the screen around the small reel Instagram shows above an open sheet (see
     * {@link SheetBackdrop}), or takes the backdrop away when there is none.
     *
     * @param video   the video layout of the reel Instagram is shrinking, or null
     * @param handoff how far Instagram has taken the reel over from the zoom (0 to 1)
     */
    private void updateSheetBackdrop(ViewGroup pager, View video, float handoff) {
        View current = backdropVideo != null ? backdropVideo.get() : null;
        if (current != null && current != video && current.getBackground() == backdrop) {
            current.setBackground(null);
        }
        if (video == null) {
            backdropVideo = null;
            if (sheetBand != null) sheetBand.hide();
            return;
        }
        if (backdrop == null) backdrop = new SheetBackdrop();
        if (video.getBackground() != backdrop) {
            // Only take the place of nothing: never drop a background Instagram put there.
            if (video.getBackground() != null) return;
            video.setBackground(backdrop);
        }
        backdropVideo = new WeakReference<>(video);
        backdrop.update(video, handoff);

        View old = sheetBandHost != null ? sheetBandHost.get() : null;
        View host = old != null && old.isAttachedToWindow() ? old : bandHost(pager);
        if (host == null) return;
        if (sheetBand == null) sheetBand = new SheetBand();
        if (old != host) {
            if (old != null) old.getOverlay().remove(sheetBand);
            host.getOverlay().add(sheetBand);
            sheetBandHost = new WeakReference<>(host);
        }
        pager.getLocationInWindow(location);
        sheetBand.update(host, video, location[1]);
    }

    /**
     * As on iOS, the reel's own UI (caption, buttons, seek bar) and the Reels header go as the reel
     * starts to shrink, and come back as it grows to full size again. Instagram starts shrinking
     * it a moment before the sheet shows, and lets it grow back after the sheet has gone, so they
     * stood over the small reel, then over the backdrop.
     *
     * @param page the reel's page
     * @param by   how far it has shrunk (0 to 1)
     */
    private void fadeReelUi(View page, float by) {
        View info = infoId != 0 ? page.findViewById(infoId) : null;
        View infoHost = info != null && info.getParent() instanceof View && info.getParent() != page
                ? (View) info.getParent() : null;
        View scrubber = scrubberId != 0 ? page.findViewById(scrubberId) : null;
        View scrubberHost = scrubber != null ? pageLevel(scrubber, page) : null;
        fade(infoHost, by);
        fade(scrubberHost, by);
    }

    /** Fades {@code view} out by {@code by}, keeping it to put back (see {@link #faded}). */
    private void fade(View view, float by) {
        if (view == null) return;
        if (by <= 0f && !faded.containsKey(view)) return;
        float alpha = 1f - by;
        if (view.getAlpha() != alpha) view.setAlpha(alpha);
        if (by > 0f) faded.put(view, Boolean.TRUE);
        else faded.remove(view);
    }

    /**
     * The header goes with the reel's own UI while the reel is small. And a sheet over a reel gets
     * no dimmer: above the comments Instagram leaves the screen undimmed around the small reel, but
     * other sheets (sharing) it dims, and it fades the dimmer in as the sheet starts up, before the
     * sheet is high enough for the card: the reel darkened for a moment, then lit up again as the
     * card formed. The dimmer stays off until it's out of sight: the sheet goes a frame or two
     * before its dimmer does, and a dimmer put back then flashed the screen dark.
     *
     * @param shrunkBy  how far the reel has shrunk (0 to 1)
     * @param sheetOpen whether a sheet is showing over the reel
     */
    private void fadeForSheet(float shrunkBy, boolean sheetOpen) {
        View header = shrunkBy > 0f || faded.containsKey(headerView != null ? headerView.get() : null) ? header() : null;
        fade(header, shrunkBy);
        if (sheetOpen) {
            View dimmer = dimmer();
            if (dimmer != null) {
                if (dimmer.getAlpha() != 0f) dimmer.setAlpha(0f);
                fadedDimmer = new WeakReference<>(dimmer);
            }
            View scrim = statusScrim();
            if (scrim != null) {
                if (scrim.getAlpha() != 0f) scrim.setAlpha(0f);
                fadedScrim = new WeakReference<>(scrim);
            }
            return;
        }
        View dimmer = fadedDimmer != null ? fadedDimmer.get() : null;
        if (dimmer != null && dimmer.isShown()) return;
        if (dimmer != null) dimmer.setAlpha(1f);
        fadedDimmer = null;
        // The status bar's dim goes with the sheet's, so it can't flash dark either.
        View scrim = fadedScrim != null ? fadedScrim.get() : null;
        if (scrim != null) scrim.setAlpha(1f);
        fadedScrim = null;
    }

    /**
     * Instagram's strip over the status bar: a plain view as tall as the status bar, last in its
     * root layout, so over everything. Clear above the comments, but other sheets (sharing) dim it
     * with their dimmer, which left a dark band over the backdrop behind the clock.
     */
    private View statusScrim() {
        View cached = scrimView != null ? scrimView.get() : null;
        if (cached != null && cached.isAttachedToWindow()) return cached;
        scrimView = null;
        View content = root.findViewById(android.R.id.content);
        if (!(content instanceof ViewGroup)) return null;
        // It sits beside Instagram's root layout in the content view (or, in another build, in it).
        View scrim = statusScrimIn((ViewGroup) content);
        if (scrim == null && ((ViewGroup) content).getChildCount() > 0
                && ((ViewGroup) content).getChildAt(0) instanceof ViewGroup) {
            scrim = statusScrimIn((ViewGroup) ((ViewGroup) content).getChildAt(0));
        }
        if (scrim != null) scrimView = new WeakReference<>(scrim);
        return scrim;
    }

    private View statusScrimIn(ViewGroup g) {
        int statusBar = statusBarHeight();
        for (int i = g.getChildCount() - 1; i >= 0; i--) {
            View v = g.getChildAt(i);
            if (v.getClass() == View.class && v.getTop() == 0 && v.getWidth() == g.getWidth()
                    && v.getHeight() > 0 && Math.abs(v.getHeight() - statusBar) <= 2) {
                return v;
            }
        }
        return null;
    }

    private int statusBarHeight() {
        android.view.WindowInsets insets = root.getRootWindowInsets();
        return insets != null ? insets.getInsets(android.view.WindowInsets.Type.statusBars()).top : -1;
    }

    /** Instagram's Reels header (the tabs and buttons above the reels), if it's showing. */
    private View header() {
        View header = headerView != null ? headerView.get() : null;
        if (header == null || !header.isAttachedToWindow()) {
            int id = root.getResources().getIdentifier("clips_viewer_action_bar", "id", PKG);
            header = id != 0 ? root.findViewById(id) : null;
            headerView = header != null ? new WeakReference<>(header) : null;
        }
        return header != null && header.isShown() ? header : null;
    }

    /** The open sheet's dimmer, beside it under the sheet's container. */
    private View dimmer() {
        View panel = sheetPanel != null ? sheetPanel.get() : null;
        if (panel == null || !(panel.getParent() instanceof View)) return null;
        int id = root.getResources().getIdentifier("background_dimmer", "id", PKG);
        return id != 0 ? ((View) panel.getParent()).findViewById(id) : null;
    }

    /** The first container above the pager that reaches the top of the screen, for the bands. */
    private View bandHost(ViewGroup pager) {
        for (ViewParent p = pager.getParent(); p instanceof View; p = p.getParent()) {
            View v = (View) p;
            v.getLocationInWindow(other);
            if (other[1] <= 0) return v;
        }
        return null;
    }

    /** Puts the band over the strip of screen above the pages (see {@link TopBand}). */
    private void updateTopBand(ViewGroup pager, ViewGroup list, int pagerLeft, int pagerTop) {
        View host = topHost != null ? topHost.get() : null;
        if (host == null || !host.isAttachedToWindow()) {
            host = bandHost(pager);
            if (host == null) return;
            if (topBand == null) topBand = new TopBand();
            View old = topHost != null ? topHost.get() : null;
            if (old != null) old.getOverlay().remove(topBand);
            host.getOverlay().add(topBand);
            topHost = new WeakReference<>(host);
        }
        if (pagerTop <= 0) {
            topBand.hide();
            return;
        }
        topBand.update(host, list, pagerLeft, pagerTop, pager.getWidth());
    }

    /**
     * Full screen, as on iOS: Instagram fits a 9:16 reel into the page, which now runs on behind
     * the bar, so it got black bars above and below. Zoom it to fill the whole screen instead, from
     * behind the status bar down to the bottom edge, cropping its sides, as iOS does. The page
     * starts below the status bar and clips there; {@link TopBand} shows the part above it.
     * <p>
     * Every layer of the video layout is zoomed, not just the player: Instagram moves its one
     * player to the incoming reel mid-scroll and shows a thumbnail in the outgoing one, which
     * would otherwise bring its black bars back (into the strip, too).
     *
     * Full screen off, it fills the page only, below the status bar, zoomed from its middle.
     * <p>
     * Opening the comments (or another sheet) over a reel, Instagram shrinks it into the space
     * above the sheet, rounded and cropped, as iOS does: it scales and moves the same video
     * container, frame by frame as the sheet comes up. The zoom used to overwrite that every
     * frame, leaving a cropped, oversized reel with black above it. Now what Instagram sets is
     * read back each frame (whatever differs from what was written last is Instagram's), and the
     * zoom hands over to it as the reel starts to shrink, and takes back over as it grows again.
     * <p>
     * Other sheets (sharing) Instagram opens over the full size reel, only dimmed. There the reel
     * is shrunk the same way here: a card above the sheet (see {@link #card}).
     *
     * @param pagerTop where the pages rest, in window coordinates (the status bar's bottom)
     * @param sheetTop where an open sheet's top shows, in window coordinates, or -1 with none
     * @return how far the small reel has taken over from the zoom (0: not at all, 1: wholly)
     */
    private float fill(View video, View page, int pagerTop, boolean fullScreen, int sheetTop) {
        if (!(video instanceof ViewGroup)) return 0f;
        ViewGroup layout = (ViewGroup) video;
        int pageH = page.getHeight();
        // Where the video layout sits in the page (the same however far the page has scrolled).
        video.getLocationInWindow(location);
        page.getLocationInWindow(other);
        int layoutTop = location[1] - other[1];
        int layoutY = location[1];
        boolean resting = Math.abs(other[1] - pagerTop) <= 1;
        int screenH = pageH + (fullScreen ? Math.max(0, pagerTop) : 0);
        float maxScale = fullScreen ? MAX_FILL_SCALE : MAX_PAGE_FILL_SCALE;

        float handoff = 0f;
        View container = null;
        for (int i = 0; i < layout.getChildCount(); i++) {
            View layer = layout.getChildAt(i);
            float[] own = instagramsTransform(layer);
            if (layer.getId() == containerId) {
                container = layer;
                if (own[BASE_SCALE] < 1f) handoff = smooth(Math.min(1f, (1f - own[BASE_SCALE]) / HANDOFF_SCALE));
            }
        }
        // Instagram leaves this sheet's reel full size: shrink it into a card of its own.
        int cardTop = pagerTop + Math.round(CARD_TOP_DP * density);
        int room = sheetTop - Math.round(CARD_BOTTOM_DP * density) - cardTop;
        boolean card = handoff == 0f && sheetTop >= 0 && resting && container != null
                && container.getHeight() > 0 && room < container.getHeight();
        if (card) {
            card(container, room, cardTop - layoutY, cardGeometry);
            handoff = smooth(Math.min(1f, (1f - cardGeometry[0]) / HANDOFF_SCALE));
            if (handoff == 0f) card = false;
        }
        for (int i = 0; i < layout.getChildCount(); i++) {
            View layer = layout.getChildAt(i);
            int w = layer.getWidth();
            int h = layer.getHeight();
            float scale = 1f;
            float ty = 0f;
            if (layer.getVisibility() != View.GONE && w > 0 && h > 0 && h / (float) w >= PORTRAIT_RATIO) {
                float want = screenH / (float) h;
                if (want >= 1f && want <= maxScale) {
                    scale = want;
                    // Zoomed from its top, which then goes to the top of the screen (or the page).
                    ty = -(fullScreen ? pagerTop : 0) - (layoutTop + layer.getTop());
                }
            }
            float[] own = transforms.get(layer);
            if (card && w > 0 && h > 0) {
                card(layer, room, cardTop - layoutY, cardGeometry);
                scale += (cardGeometry[0] - scale) * handoff;
                ty += (cardGeometry[1] - ty) * handoff;
                cardOutline(layer, cardGeometry[2], cardGeometry[3]);
            } else {
                dropCardOutline(layer);
                if (handoff > 0f && own != null) {
                    scale += (own[BASE_SCALE] - scale) * handoff;
                    ty += (own[BASE_TY] - ty) * handoff;
                }
            }
            // Instagram's own shrink works from the same pivot: its top, in the middle.
            if (layer.getScaleX() != scale || layer.getScaleY() != scale || layer.getPivotY() != 0f) {
                layer.setPivotX(w / 2f);
                layer.setPivotY(0f);
                layer.setScaleX(scale);
                layer.setScaleY(scale);
            }
            if (layer.getTranslationY() != ty) layer.setTranslationY(ty);
            if (own != null) {
                own[WRITTEN_SCALE] = scale;
                own[WRITTEN_TY] = ty;
            }
            if (scale != 1f || ty != 0f) filled.put(layer, Boolean.TRUE);
        }
        return handoff;
    }

    /**
     * The card a reel shrinks into above a sheet Instagram leaves it full size under, as Instagram
     * shrinks it above the comments: cut down to 3:4 (more of it the smaller it gets), fitted into
     * the room between the status bar and the sheet, in the middle, its corners rounded.
     *
     * @param room how tall it can be, from {@code top}
     * @param top  where its top goes, in the video layout's coordinates
     * @param out  its scale, its translation, how much is cut off its top and bottom and its
     *             corners' radius (both in its own pixels)
     */
    private void card(View layer, int room, int top, float[] out) {
        float w = layer.getWidth();
        float h = layer.getHeight();
        float cut = Math.max(0f, h - w * CARD_RATIO) / 2f;
        float q = Math.max(0f, Math.min(1f, (1f - room / h) / CARD_CUT_SPAN));
        float crop = cut * q;
        float scale = Math.max(0.05f, Math.min(1f, room / (h - 2f * crop)));
        out[0] = scale;
        // Scaled from its top: the cut-off top goes above `top`.
        out[1] = top - layer.getTop() - crop * scale;
        out[2] = crop;
        out[3] = CARD_RADIUS_DP * density * q / scale;
    }

    private void cardOutline(View layer, float crop, float radius) {
        CardOutline card = cardOutlines.get(layer);
        if (card == null) {
            card = new CardOutline(layer.getOutlineProvider(), layer.getClipToOutline());
            cardOutlines.put(layer, card);
        }
        if (layer.getOutlineProvider() != card) layer.setOutlineProvider(card);
        if (!layer.getClipToOutline()) layer.setClipToOutline(true);
        if (card.crop != crop || card.radius != radius) {
            card.crop = crop;
            card.radius = radius;
            layer.invalidateOutline();
        }
    }

    /** Gives a layer back the outline it had before it was a card, unless Instagram set another since. */
    private void dropCardOutline(View layer) {
        CardOutline card = cardOutlines.remove(layer);
        if (card == null || layer.getOutlineProvider() != card) return;
        layer.setOutlineProvider(card.original);
        layer.setClipToOutline(card.clip);
    }

    /** A card's shape: its layer with {@code crop} off the top and bottom, rounded. */
    private static final class CardOutline extends android.view.ViewOutlineProvider {
        final android.view.ViewOutlineProvider original;
        final boolean clip;
        float crop, radius;

        CardOutline(android.view.ViewOutlineProvider original, boolean clip) {
            this.original = original;
            this.clip = clip;
        }

        @Override
        public void getOutline(View view, android.graphics.Outline outline) {
            outline.setRoundRect(0, Math.round(crop), view.getWidth(), Math.round(view.getHeight() - crop), radius);
        }
    }

    private WeakReference<View> sheetPanel, sheetView;
    /** Where the open sheet first came to rest (-1 until it has), and how long it has held still. */
    private int restTop = -1, lastSheetTop = -1, stillFrames;
    /** Frames a sheet must hold still to count as having come to rest. */
    private static final int REST_FRAMES = 3;

    /**
     * The sheet top a card is sized for: the sheet's own, but never above where it first came to
     * rest. Pulled up from there, the sheet goes over the card, as the comments sheet goes over
     * the reel Instagram shrinks, instead of shrinking it further; pulled down, the card grows.
     */
    private int cardSheetTop(int sheetTop) {
        if (sheetTop < 0) {
            restTop = -1;
            lastSheetTop = -1;
            stillFrames = 0;
            return sheetTop;
        }
        if (restTop < 0) {
            stillFrames = sheetTop == lastSheetTop ? stillFrames + 1 : 0;
            if (stillFrames >= REST_FRAMES) restTop = sheetTop;
        }
        lastSheetTop = sheetTop;
        return restTop >= 0 ? Math.max(sheetTop, restTop) : sheetTop;
    }

    /** Where the top of an open bottom sheet shows, in window coordinates, or -1 with none open. */
    private int sheetTop() {
        View panel = sheetPanel != null ? sheetPanel.get() : null;
        if (panel == null || !panel.isAttachedToWindow()) {
            int id = root.getResources().getIdentifier("layout_container_bottom_sheet", "id", PKG);
            panel = id != 0 ? root.findViewById(id) : null;
            sheetPanel = panel != null ? new WeakReference<>(panel) : null;
        }
        if (!(panel instanceof ViewGroup) || !panel.isShown() || ((ViewGroup) panel).getChildCount() == 0) {
            sheetView = null;
            return -1;
        }
        View sheet = ((ViewGroup) panel).getChildAt(0);
        if (!sheet.isShown() || sheet.getHeight() == 0) {
            sheetView = null;
            return -1;
        }
        // A sheet's first frame shows it laid out at the top, not yet moved down out of sight to
        // slide up from there: taken as a sheet pulled all the way up, it made a card for a frame.
        if (sheetView == null || sheetView.get() != sheet) {
            sheetView = new WeakReference<>(sheet);
            return -1;
        }
        sheet.getLocationInWindow(other);
        return other[1];
    }

    /**
     * The scale and offset Instagram itself wants on {@code layer}, kept up to date: a value that
     * differs from what {@link #fill} wrote last was set by Instagram since.
     */
    private float[] instagramsTransform(View layer) {
        float[] own = transforms.get(layer);
        if (own == null) {
            own = new float[]{Float.NaN, Float.NaN, 1f, 0f};
            transforms.put(layer, own);
        }
        float scale = layer.getScaleX();
        float ty = layer.getTranslationY();
        if (scale != own[WRITTEN_SCALE] || ty != own[WRITTEN_TY]) {
            // Only a shrink is Instagram's to keep (the zoom never goes below 1); anything else
            // it sets, the zoom overrides as it always has.
            boolean shrink = scale < 1f;
            own[BASE_SCALE] = shrink ? scale : 1f;
            own[BASE_TY] = shrink ? ty : 0f;
        }
        return own;
    }

    private static float smooth(float t) {
        return t * t * (3f - 2f * t);
    }

    /**
     * Lifts the caption block (the host of the caption, the button column and any row Instagram
     * adds under them) and the seek bar together, by just enough for the lowest of them to end at
     * {@code stripTop} (page coordinates). Instagram lays some reels out with room to spare (a
     * "Not interested" row, no seek bar), so a fixed lift would push those far too high.
     * <p>
     * The hosts are scrolled, not translated: Litho animates rows (expanding the description)
     * by their position relative to the LithoView, which counts the ancestors' translation but
     * not their scroll. A translated host left the animated rows pushed back down by the lift,
     * out of the host's bounds and out of sight.
     */
    private void lift(View page, int stripTop) {
        page.getLocationInWindow(other);
        int lowest = Integer.MIN_VALUE;

        View info = infoId != 0 ? page.findViewById(infoId) : null;
        View infoHost = info != null && info.getParent() instanceof View && info.getParent() != page
                ? (View) info.getParent() : null;
        if (infoHost != null) {
            int bottom = contentBottom(infoHost);
            if (bottom != Integer.MIN_VALUE) {
                // A view's own scroll doesn't move it, only what it holds.
                infoHost.getLocationInWindow(location);
                lowest = location[1] - other[1] + bottom;
            }
        }

        View scrubber = scrubberId != 0 ? page.findViewById(scrubberId) : null;
        View scrubberHost = scrubber != null ? pageLevel(scrubber, page) : null;
        if (scrubberHost != null && scrubber.isShown() && scrubber.getHeight() > 0) {
            // From the layout, not from where it shows. Coming back to Reels, Litho moves the seek
            // bar's frame back to the page bottom (see undoLithoOffset), where the host's lift no
            // longer moves it. Measured on screen, each frame's lift then read as the bar still
            // being that much too low, and the lift grew by as much every frame, scrolling the
            // caption and the buttons thousands of pixels out of sight.
            lowest = Math.max(lowest, layoutBottom(scrubber, page));
        }

        // Nothing can end below the page, so a lift past this would only push things away.
        int max = Math.max(0, page.getHeight() - stripTop);
        int by = lowest == Integer.MIN_VALUE ? 0 : Math.min(max, Math.max(0, lowest - stripTop));
        if (infoHost != null) {
            if (infoHost.getScrollY() != by) infoHost.setScrollY(by);
            lifted.put(infoHost, Boolean.TRUE);
        }
        // The seek bar sits in frames barely taller than itself (scrolling them would clip it,
        // and touches would miss it), so its page-sized host is moved instead.
        if (scrubberHost != null) {
            if (scrubberHost.getTranslationY() != -by) scrubberHost.setTranslationY(-by);
            shifted.put(scrubberHost, Boolean.TRUE);
            undoLithoOffset(scrubber, scrubberHost, by);
        }
    }

    /**
     * Instagram briefly lays the page out shorter on every tab switch, so coming back to Reels
     * Litho animates the seek bar's frame to its new place. Litho places animated views by their
     * ancestors' getY(), which counts the host's lift, so the frame ends its move translated down
     * by exactly the lift: the seek bar sits back at the page bottom, behind the strip and the
     * bar. Undo that leftover. A frame Litho is still animating only matches it at the very end.
     */
    private static void undoLithoOffset(View scrubber, View host, int by) {
        if (by == 0) return;
        for (View v = scrubber; v != host && v.getParent() instanceof View; v = (View) v.getParent()) {
            if (v.getTranslationY() != 0f && Math.abs(v.getTranslationY() - by) <= 2f) v.setTranslationY(0f);
        }
    }

    /**
     * The ancestor of {@code view} sitting in a page-sized container (or the page), which can be
     * moved up without being clipped. Null if there is none.
     */
    private static View pageLevel(View view, View page) {
        View v = view;
        while (v.getParent() instanceof View && v.getParent() != page) {
            View parent = (View) v.getParent();
            if (parent.getHeight() >= page.getHeight()) return v;
            v = parent;
        }
        return v.getParent() == page ? v : null;
    }

    /**
     * Where {@code view} ends in {@code page}'s coordinates going by layout alone, leaving out
     * every translation and scroll on the way (the lift's own included).
     */
    private static int layoutBottom(View view, View page) {
        int y = view.getHeight();
        for (View v = view; v != page && v.getParent() instanceof View; v = (View) v.getParent()) {
            y += v.getTop();
        }
        return y;
    }

    /**
     * The bottom of what {@code host} shows, in its own coordinates: its lowest visible child
     * with a size (Litho keeps empty spacers at the bottom).
     */
    private static int contentBottom(View host) {
        if (!(host instanceof ViewGroup)) return host.getHeight();
        ViewGroup g = (ViewGroup) host;
        int bottom = Integer.MIN_VALUE;
        for (int i = 0; i < g.getChildCount(); i++) {
            View c = g.getChildAt(i);
            if (c.getVisibility() != View.VISIBLE || c.getHeight() == 0 || c.getWidth() == 0) continue;
            bottom = Math.max(bottom, c.getBottom());
        }
        return bottom;
    }

    private void stop() {
        smallBy = 0f;
        if (!active) return;
        active = false;
        for (View v : lifted.keySet()) {
            if (v != null) v.setScrollY(0);
        }
        lifted.clear();
        for (View v : shifted.keySet()) {
            if (v != null) v.setTranslationY(0f);
        }
        shifted.clear();
        for (View v : filled.keySet()) {
            if (v != null) {
                // A reel Instagram has shrunk above a sheet goes back to how Instagram has it.
                float[] own = transforms.get(v);
                boolean shrunk = own != null && own[BASE_SCALE] < 1f;
                v.setScaleX(shrunk ? own[BASE_SCALE] : 1f);
                v.setScaleY(shrunk ? own[BASE_SCALE] : 1f);
                v.setTranslationY(shrunk ? own[BASE_TY] : 0f);
            }
        }
        filled.clear();
        transforms.clear();
        for (View v : new ArrayList<>(cardOutlines.keySet())) {
            if (v != null) dropCardOutline(v);
        }
        cardOutlines.clear();
        fadeForSheet(0f, false);
        for (View v : faded.keySet()) {
            if (v != null) v.setAlpha(1f);
        }
        faded.clear();
        View shrunk = backdropVideo != null ? backdropVideo.get() : null;
        if (shrunk != null && shrunk.getBackground() == backdrop) shrunk.setBackground(null);
        backdropVideo = null;
        if (sheetBand != null) sheetBand.hide();
        for (Strip strip : strips.values()) {
            if (strip != null) strip.hide();
        }
        if (topBand != null) topBand.hide();
    }

    /** The Reels tab's pager, found again when Instagram replaces it. */
    private ViewGroup pager() {
        ViewGroup cached = pager != null ? pager.get() : null;
        if (cached != null && cached.isShown()) return cached;
        long now = SystemClock.uptimeMillis();
        // Right after Reels comes up the pager may not be laid out yet: look again next frame,
        // or the reel shows letterboxed for a moment before it fills the page.
        if (now >= searchUntil && now - lastScan < RESCAN_MS) return null;
        lastScan = now;
        List<View> found = new ArrayList<>();
        collect(root, found);
        for (View v : found) {
            if (v instanceof ViewGroup && v.isShown() && v.getHeight() > 0) {
                pager = new WeakReference<>((ViewGroup) v);
                return (ViewGroup) v;
            }
        }
        pager = null;
        return null;
    }

    private void collect(View view, List<View> out) {
        if (view.getVisibility() != View.VISIBLE) return;
        if (view.getId() == pagerId) {
            out.add(view);
            return;
        }
        if (view instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) view;
            for (int i = 0; i < g.getChildCount(); i++) collect(g.getChildAt(i), out);
        }
    }

    /** A page's frosted bottom strip, drawn in its video layout's overlay. */
    private final class Strip extends Drawable {
        private final RenderNode backdrop = new RenderNode("ReelsBlurBackdrop");
        private final RenderNode[] levels = new RenderNode[RADII_DP.length];
        private final Paint[] masks = new Paint[RADII_DP.length];
        private final Paint tint = new Paint();
        private WeakReference<View> video;
        private int maskFor = -1;
        private final int pad = Math.round(PAD_DP * density);

        Strip() {
            for (int i = 0; i < levels.length; i++) {
                levels[i] = new RenderNode("ReelsBlurLevel" + i);
                float r = RADII_DP[i] * density;
                levels[i].setRenderEffect(RenderEffect.createBlurEffect(r, r, Shader.TileMode.CLAMP));
                masks[i] = new Paint();
                masks[i].setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_IN));
            }
        }

        void update(View page, View video, int height) {
            this.video = new WeakReference<>(video);
            // The page's bottom `height`, in the video layout's coordinates.
            video.getLocationInWindow(location);
            page.getLocationInWindow(other);
            int bottom = other[1] + page.getHeight() - location[1];
            int top = bottom - height;
            Rect b = getBounds();
            if (b.left != 0 || b.top != top || b.right != video.getWidth() || b.bottom != bottom) {
                setBounds(0, top, video.getWidth(), bottom);
            }
            // The video changes every frame without the page knowing: record it again.
            if (video != null && page.getGlobalVisibleRect(visible)) invalidateSelf();
        }

        void hide() {
            video = null;
            setBounds(0, 0, 0, 0);
        }

        @Override
        public void draw(Canvas canvas) {
            View video = this.video != null ? this.video.get() : null;
            Rect b = getBounds();
            int w = b.width();
            int h = b.height();
            if (video == null || w <= 0 || h <= 0 || !canvas.isHardwareAccelerated()) return;
            updateMasks(h);

            // The video layout, in the strip's coordinates, from `pad` above the strip down.
            int rh = h + pad;
            backdrop.setPosition(0, 0, w, rh);
            RecordingCanvas rc = backdrop.beginRecording(w, rh);
            try {
                rc.drawColor(Color.BLACK);
                rc.translate(0, -(b.top - pad));
                drawVideoLayers(rc, video);
            } finally {
                backdrop.endRecording();
            }

            int save = canvas.save();
            canvas.translate(b.left, b.top);
            canvas.clipRect(0, 0, w, h);
            for (int i = 0; i < levels.length; i++) {
                RenderNode level = levels[i];
                level.setPosition(0, 0, w, rh);
                RecordingCanvas lc = level.beginRecording(w, rh);
                try {
                    lc.drawRenderNode(backdrop);
                } finally {
                    level.endRecording();
                }
                int layer = canvas.saveLayer(0, 0, w, h, null);
                canvas.translate(0, -pad);
                canvas.drawRenderNode(level);
                canvas.translate(0, pad);
                canvas.drawRect(0, 0, w, h, masks[i]);
                canvas.restoreToCount(layer);
            }
            canvas.drawRect(0, 0, w, h, tint);
            canvas.restoreToCount(save);
        }

        private void updateMasks(int h) {
            if (h == maskFor) return;
            maskFor = h;
            float feather = Math.min(h * 0.6f, FEATHER_DP * density) / h;
            for (int i = 0; i < masks.length; i++) {
                masks[i].setShader(eased(h, RAMPS[i][0] * feather, RAMPS[i][1] * feather, 0, 0xFF));
            }
            // iOS greys the strip a little, more towards the bottom edge.
            tint.setShader(new LinearGradient(0, 0, 0, h,
                    new int[]{0, 0x18000000, 0x38000000},
                    new float[]{0f, feather, 1f}, Shader.TileMode.CLAMP));
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /**
     * The video behind the status bar. The pages start below it and clip there (Instagram hides
     * its header by sliding it out of the page, so they must keep clipping), so the zoomed video's
     * top is drawn again here, sharp, in the overlay of the first container that reaches the top
     * of the screen: the video of the page right under it, where it is on screen. Darkened a little, as Instagram's
     * gradient under its header darkens the page below it.
     */
    private final class TopBand extends Drawable {
        private final Paint tint = new Paint();
        private final int[] at = new int[2];
        private WeakReference<ViewGroup> list;
        private int tintFor = -1;
        /** The band's left edge and its bottom (the pages' top), in window coordinates. */
        private int originX, seam;
        /** How far a zoomed reel's video reaches above its page (the status bar's height). */
        private int ext;
        private WeakReference<View> host;
        private final RenderNode live = new RenderNode("ReelsTopBand");
        private final RenderNode held = new RenderNode("ReelsTopBandHeld");
        /**
         * What the band showed at rest, copied every {@link #BAND_SNAPSHOT_MS}: a swipe holds it
         * (blurred) instead of showing the reels sliding past, and it dissolves into the reel
         * that settles. Two bitmaps, so a copy in flight never tears the one shown.
         */
        private android.graphics.Bitmap snapshot, spare;
        private boolean copying;
        private long copiedAt;
        private final Rect copyRect = new Rect();
        private final android.os.Handler handler = new android.os.Handler(android.os.Looper.getMainLooper());
        private final Paint bitmapPaint = new Paint(Paint.FILTER_BITMAP_FLAG);

        void update(View host, ViewGroup list, int pagerLeft, int pagerTop, int width) {
            this.list = new WeakReference<>(list);
            this.host = new WeakReference<>(host);
            host.getLocationInWindow(at);
            int left = pagerLeft - at[0];
            Rect b = getBounds();
            int bottom = pagerTop - at[1];
            if (b.left != left || b.top != -at[1] || b.right != left + width || b.bottom != bottom) {
                setBounds(left, -at[1], left + width, bottom);
            }
            originX = pagerLeft;
            seam = pagerTop;
            ext = pagerTop + at[1];
            invalidateSelf();
        }

        void hide() {
            list = null;
            setBounds(0, 0, 0, 0);
        }

        @Override
        public void draw(Canvas canvas) {
            ViewGroup list = this.list != null ? this.list.get() : null;
            Rect b = getBounds();
            int w = b.width();
            int h = b.height();
            if (list == null || w <= 0 || h <= 0 || !canvas.isHardwareAccelerated()) return;
            if (tintFor != ext) {
                tintFor = ext;
                tint.setShader(new LinearGradient(0, ext, 0, 0, 0x4A000000, 0x60000000, Shader.TileMode.CLAMP));
            }
            int save = canvas.save();
            canvas.translate(b.left, b.top);
            canvas.clipRect(0, 0, w, h);
            // From here on, window coordinates (x from the band's left edge).
            canvas.translate(0, -(seam - ext));

            // The reel nearest to resting under the band: the one showing, or the one a swipe is
            // bringing in. It is drawn where it will rest, not where it is: the band shows where
            // the swipe is heading, never the reels sliding past.
            View target = null;
            int dist = Integer.MAX_VALUE;
            for (int i = 0; i < list.getChildCount(); i++) {
                View page = list.getChildAt(i);
                if (page.getVisibility() != View.VISIBLE) continue;
                page.getLocationInWindow(at);
                int d = Math.abs(at[1] - seam);
                if (d < dist) {
                    dist = d;
                    target = page;
                }
            }
            live.setPosition(0, 0, w, ext);
            RecordingCanvas rc = live.beginRecording(w, ext);
            try {
                rc.translate(0, -(seam - ext));
                rc.drawColor(Color.BLACK);
                if (target != null) {
                    target.getLocationInWindow(at);
                    rc.translate(0, seam - at[1]);
                    drawPage(rc, target);
                }
            } finally {
                live.endRecording();
            }

            // Hold and settle. Live, the band showed the reels sliding past the status bar, a run
            // of colors from two videos flicking by in a strip of their own. Now a swipe holds the
            // band on what it showed at rest (copied every so often, blurred), and over the last
            // stretch of the swipe the arriving reel comes into focus, tied to the swipe itself:
            // fully there as it lands, with nothing held after.
            int pageH = target != null ? target.getHeight() : 0;
            float p = target == null || pageH == 0 ? 0f
                    : Math.max(0f, Math.min(1f, 1f - dist / (BAND_SETTLE * pageH)));
            boolean atRest = target != null && dist <= 1;
            float e = p * p * (3f - 2f * p);

            int bandSave = canvas.save();
            canvas.translate(0, seam - ext);
            canvas.clipRect(0, 0, w, ext);
            if (atRest || snapshot == null) {
                live.setRenderEffect(null);
                canvas.drawRenderNode(live);
                canvas.drawRect(0, 0, w, ext, tint);
                if (atRest) maybeCopy(w);
            } else {
                float r = (1f - e) * BAND_BLUR_DP * density;
                live.setRenderEffect(r >= 0.5f ? RenderEffect.createBlurEffect(r, r, Shader.TileMode.CLAMP) : null);
                canvas.drawRenderNode(live);
                canvas.drawRect(0, 0, w, ext, tint);
                // The snapshot already has the tint in it.
                if (e < 1f) {
                    recordHeld(w);
                    int layer = canvas.saveLayerAlpha(0, 0, w, ext, Math.round(255 * (1f - e)));
                    canvas.drawRenderNode(held);
                    canvas.restoreToCount(layer);
                }
            }
            canvas.restoreToCount(bandSave);

            canvas.restoreToCount(save);
        }

        /** The held snapshot, stretched over the band and blurred. */
        private void recordHeld(int w) {
            held.setPosition(0, 0, w, ext);
            float r = BAND_BLUR_DP * density;
            held.setRenderEffect(RenderEffect.createBlurEffect(r, r, Shader.TileMode.CLAMP));
            RecordingCanvas rc = held.beginRecording(w, ext);
            try {
                rc.drawBitmap(snapshot, null, new Rect(0, 0, w, ext), bitmapPaint);
            } finally {
                held.endRecording();
            }
        }

        /** Copies what the band shows now (at rest) into {@link #spare}, then swaps it in. */
        private void maybeCopy(int w) {
            long now = SystemClock.uptimeMillis();
            if (copying || now - copiedAt < BAND_SNAPSHOT_MS || ext <= 0) return;
            View host = this.host != null ? this.host.get() : null;
            android.view.Window window = host != null ? BackdropSampler.windowOf(host.getContext()) : null;
            if (window == null || !host.isAttachedToWindow()) return;
            int bw = Math.max(1, w / 4), bh = Math.max(1, ext / 4);
            if (spare == null || spare.getWidth() != bw || spare.getHeight() != bh) {
                spare = android.graphics.Bitmap.createBitmap(bw, bh, android.graphics.Bitmap.Config.ARGB_8888);
            }
            copyRect.set(originX, seam - ext, originX + w, seam);
            copiedAt = now;
            copying = true;
            final android.graphics.Bitmap target = spare;
            try {
                android.view.PixelCopy.request(window, copyRect, target, result -> {
                    copying = false;
                    if (result != android.view.PixelCopy.SUCCESS) return;
                    spare = snapshot;
                    snapshot = target;
                }, handler);
            } catch (Throwable t) {
                copying = false;
            }
        }

        /** {@code page}'s video where it is on screen, from its zoomed top down (window coordinates). */
        private void drawPage(Canvas canvas, View page) {
            View video = page != null && videoId != 0 ? page.findViewById(videoId) : null;
            if (video == null) return;
            int save = canvas.save();
            page.getLocationInWindow(at);
            canvas.clipRect(at[0] - originX, at[1] - seam, at[0] - originX + page.getWidth(), at[1] + page.getHeight());
            video.getLocationInWindow(at);
            canvas.translate(at[0] - originX, at[1]);
            drawVideoLayers(canvas, video);
            canvas.restoreToCount(save);
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /**
     * Behind the small reel Instagram shows above an open sheet, where it leaves black: the reel
     * itself, mirrored out from each of its edges and blurred, as if it ran on past them. The
     * background of the reel's video layout, so it lies under the reel and all of Instagram's UI
     * (the mute button beside it); the page clips it where the page starts, and {@link SheetBand}
     * draws it again behind the status bar. Recorded in window coordinates, at a fraction of the
     * size: it is blurred anyway.
     */
    private final class SheetBackdrop extends Drawable {
        final RenderNode node = new RenderNode("ReelsSheetBackdrop");
        private final Paint tint = new Paint();
        private final android.graphics.Outline outline = new android.graphics.Outline();
        private final Rect clip = new Rect();
        private final Rect outlineRect = new Rect();
        private final int[] at = new int[2];
        /** The reel as it shows, in window coordinates. */
        final android.graphics.RectF reel = new android.graphics.RectF();
        /** The video layout's place in the window, and the size of the window. */
        int ox, oy, width, height;
        private WeakReference<View> video;
        private float alpha;
        private float blurFor = -1f;

        SheetBackdrop() {
            tint.setColor(BACKDROP_TINT);
        }

        void update(View video, float handoff) {
            this.video = new WeakReference<>(video);
            alpha = handoff;
            // The video changes every frame without the layout knowing: record it again.
            invalidateSelf();
        }

        @Override
        public void draw(Canvas canvas) {
            View video = this.video != null ? this.video.get() : null;
            if (video == null || !canvas.isHardwareAccelerated() || !measure(video)) return;
            record(video);
            int save = canvas.save();
            canvas.translate(-ox, -oy);
            paint(canvas);
            canvas.restoreToCount(save);
        }

        /** Draws the backdrop over the window, onto a canvas in window coordinates. */
        void paint(Canvas canvas) {
            int save = alpha < 1f
                    ? canvas.saveLayerAlpha(0, 0, width, height, Math.round(255 * alpha))
                    : canvas.save();
            canvas.save();
            canvas.scale(BACKDROP_DOWNSCALE, BACKDROP_DOWNSCALE);
            canvas.drawRenderNode(node);
            canvas.restore();
            canvas.drawRect(0, 0, width, height, tint);
            canvas.restoreToCount(save);
        }

        /** Where the reel shows: its container's place and transform, cut to Instagram's rounded clip. */
        private boolean measure(View video) {
            View c = containerId != 0 ? video.findViewById(containerId) : null;
            if (c == null || c.getParent() != video || c.getWidth() == 0 || c.getHeight() == 0) return false;
            video.getLocationInWindow(at);
            ox = at[0];
            oy = at[1];
            View rootView = video.getRootView();
            width = rootView.getWidth();
            height = rootView.getHeight();
            clip.set(0, 0, c.getWidth(), c.getHeight());
            if (c.getClipToOutline() && c.getOutlineProvider() != null) {
                outline.setEmpty();
                c.getOutlineProvider().getOutline(c, outline);
                if (outline.getRect(outlineRect) && !outlineRect.isEmpty()) clip.set(outlineRect);
            }
            float px = c.getPivotX(), py = c.getPivotY();
            float x0 = ox + c.getLeft() + c.getTranslationX() + px;
            float y0 = oy + c.getTop() + c.getTranslationY() + py;
            reel.set(x0 + (clip.left - px) * c.getScaleX(), y0 + (clip.top - py) * c.getScaleY(),
                    x0 + (clip.right - px) * c.getScaleX(), y0 + (clip.bottom - py) * c.getScaleY());
            return reel.width() >= 32 && reel.height() >= 32 && width > 0 && height > 0;
        }

        /**
         * The reel tiled over the window from where it is, each copy flipped against the one next
         * to it, so every edge of the reel runs on into its own mirror image.
         */
        private void record(View video) {
            int nw = (int) Math.ceil(width / BACKDROP_DOWNSCALE);
            int nh = (int) Math.ceil(height / BACKDROP_DOWNSCALE);
            node.setPosition(0, 0, nw, nh);
            float r = BACKDROP_BLUR_DP * density / BACKDROP_DOWNSCALE;
            if (r != blurFor) {
                blurFor = r;
                node.setRenderEffect(RenderEffect.createBlurEffect(r, r, Shader.TileMode.CLAMP));
            }
            float rw = reel.width();
            float rh = reel.height();
            int ix0 = (int) Math.floor(-reel.left / rw);
            int ix1 = (int) Math.floor((width - reel.left) / rw);
            int iy0 = (int) Math.floor(-reel.top / rh);
            int iy1 = (int) Math.floor((height - reel.top) / rh);
            RecordingCanvas rc = node.beginRecording(nw, nh);
            try {
                rc.scale(1f / BACKDROP_DOWNSCALE, 1f / BACKDROP_DOWNSCALE);
                rc.drawColor(Color.BLACK);
                if ((ix1 - ix0 + 1) * (iy1 - iy0 + 1) > MAX_TILES) return;
                for (int iy = iy0; iy <= iy1; iy++) {
                    for (int ix = ix0; ix <= ix1; ix++) {
                        float l = reel.left + ix * rw;
                        float t = reel.top + iy * rh;
                        int save = rc.save();
                        rc.clipRect(l, t, l + rw, t + rh);
                        rc.translate(l, t);
                        rc.scale((ix & 1) != 0 ? -1f : 1f, (iy & 1) != 0 ? -1f : 1f, rw / 2f, rh / 2f);
                        rc.translate(ox - reel.left, oy - reel.top);
                        drawVideoLayers(rc, video);
                        rc.restoreToCount(save);
                    }
                }
            } finally {
                node.endRecording();
            }
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /**
     * The {@link SheetBackdrop} behind the status bar, above the pages, in the overlay of the first
     * container reaching the top of the screen (the pages clip below the status bar). The reel
     * itself is drawn here too where it still reaches up behind the status bar, early in its
     * shrink.
     */
    private final class SheetBand extends Drawable {
        private final int[] at = new int[2];
        private WeakReference<View> video;

        /** @param pagerTop the pages' top (the status bar's bottom), in window coordinates */
        void update(View host, View video, int pagerTop) {
            this.video = new WeakReference<>(video);
            host.getLocationInWindow(at);
            int w = host.getRootView().getWidth();
            Rect b = getBounds();
            if (b.left != -at[0] || b.top != -at[1] || b.right != w - at[0] || b.bottom != pagerTop - at[1]) {
                setBounds(-at[0], -at[1], w - at[0], pagerTop - at[1]);
            }
            invalidateSelf();
        }

        void hide() {
            video = null;
            setBounds(0, 0, 0, 0);
        }

        @Override
        public void draw(Canvas canvas) {
            View video = this.video != null ? this.video.get() : null;
            Rect b = getBounds();
            if (video == null || backdrop == null || b.isEmpty() || !canvas.isHardwareAccelerated()) return;
            int save = canvas.save();
            canvas.clipRect(b);
            // From here on, window coordinates.
            canvas.translate(b.left, b.top);
            backdrop.paint(canvas);
            canvas.clipRect(backdrop.reel);
            canvas.translate(backdrop.ox, backdrop.oy);
            drawVideoLayers(canvas, video);
            canvas.restoreToCount(save);
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /**
     * The video layout's layers (player, thumbnails), each placed and zoomed by hand: drawn
     * through the layout itself, the outgoing reel's zoom went missing mid-scroll and the
     * strip blurred the black bar below the unzoomed video.
     */
    private static void drawVideoLayers(Canvas canvas, View video) {
        if (!(video instanceof ViewGroup)) {
            video.draw(canvas);
            return;
        }
        ViewGroup layout = (ViewGroup) video;
        for (int i = 0; i < layout.getChildCount(); i++) {
            View layer = layout.getChildAt(i);
            if (layer.getVisibility() != View.VISIBLE || layer.getAlpha() == 0f) continue;
            int save = canvas.save();
            canvas.translate(layer.getLeft() + layer.getTranslationX(), layer.getTop() + layer.getTranslationY());
            canvas.scale(layer.getScaleX(), layer.getScaleY(), layer.getPivotX(), layer.getPivotY());
            layer.draw(canvas);
            canvas.restoreToCount(save);
        }
    }

    private static final int EASE_STOPS = 13;

    /** Black at {@code a0} above {@code start} (fractions of {@code h}), easing to {@code a1} at {@code end}. */
    private static LinearGradient eased(int h, float start, float end, int a0, int a1) {
        int[] colors = new int[EASE_STOPS + 2];
        float[] stops = new float[EASE_STOPS + 2];
        colors[0] = a0 << 24;
        stops[0] = 0f;
        for (int k = 0; k < EASE_STOPS; k++) {
            float t = k / (float) (EASE_STOPS - 1);
            stops[k + 1] = Math.max(stops[k], start + (end - start) * t);
            float s = t * t * t * (t * (t * 6f - 15f) + 10f);
            colors[k + 1] = Math.round(a0 + (a1 - a0) * s) << 24;
        }
        stops[EASE_STOPS + 1] = 1f;
        colors[EASE_STOPS + 1] = a1 << 24;
        return new LinearGradient(0, 0, 0, h, colors, stops, Shader.TileMode.CLAMP);
    }
}
