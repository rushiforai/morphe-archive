package com.waze.gw;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.opengl.GLES20;
import android.opengl.GLUtils;
import android.os.SystemClock;
import android.util.Log;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;

/**
 * Phone-speed + speed-limit overlay drawn into Waze's Android Auto EGL surface immediately
 * before swap.
 *
 * Android Auto gives Waze one map Surface, so the overlay shares only the AA renderer's current
 * GL context.  Its speed frame is published by the already-stable phone updateSpeedometer hook;
 * it never mutates AA's ProviderPosition, installs another GPS listener, or touches Waze's
 * projected location pipeline.
 */
public final class AaSpeedo {
    private static final String TAG = "WazeGW";
    private static final String PREFS = "waze_hud_gw";

    /** One volatile publication gives the GL thread a consistent surface/layout snapshot. */
    private static final class SurfaceState {
        final int width;
        final int height;
        final int dpi;
        final int generation;
        final Rect stable;
        final Rect visible;

        SurfaceState(int width, int height, int dpi, int generation, Rect stable, Rect visible) {
            this.width = width;
            this.height = height;
            this.dpi = dpi;
            this.generation = generation;
            this.stable = stable == null ? null : new Rect(stable);
            this.visible = visible == null ? null : new Rect(visible);
        }
    }

    private static volatile SurfaceState surface =
            new SurfaceState(0, 0, 160, 0, null, null);
    /** elapsedRealtime of the last Android Auto surface teardown (0 = never). */
    private static volatile long surfaceDestroyedAtMs;
    private static volatile Context appContext;
    private static volatile SharedPreferences sharedPreferences;
    // GL-thread-only state.
    private static int seenGeneration = -1;
    private static int program;
    private static int texture;
    private static int aPosition = -1;
    private static int aTexCoord = -1;
    private static int uTexture = -1;
    private static int uAlpha = -1;
    private static int textureWidth;
    private static int textureHeight;
    // Upcoming-alert list texture (GL thread only).
    private static final long RAIL_REBUILD_MS = 400L;
    private static int railTexture;
    // Text-only badge; bitmap changes only with the distance band, GL names stay context-local.
    private static Bitmap followingBitmap;
    private static int followingTexture;
    private static int followingMetres;
    // What sits under the speedometer this frame: nothing, the advisory chip, or the xADAS gauge.
    private static final int BLOCK_NONE = 0, BLOCK_CHIP = 1, BLOCK_GAUGE = 2;
    private static final float GAUGE_WIDTH = 0.8f;   // of the speedometer width; the gauge is square
    private static final int GAUGE_PX = 256;
    private static final long GAUGE_PULSE_MS = 700L;
    private static final int GAUGE_PULSE_STEPS = 8;
    private static int followingBlock;
    private static XadasGapPolicy.State gapGauge = XadasGapPolicy.State.HIDDEN;
    private static GapGaugeDrawer gaugeDrawer;
    private static int railTextureWidth;
    private static int railTextureHeight;
    private static String railSignature = "";
    private static long railBuiltMs;
    // Over-speed red edge (GL thread only). The texture is a small transparent-centre bitmap that
    // GL_LINEAR stretches over the safe area; level eases in/out and pulses while over the limit.
    private static final long EDGE_FADE_MS = 300L;
    private static final long EDGE_PULSE_MS = 1100L;
    private static int edgeTexture;
    private static int edgeTextureWidth;
    private static int edgeTextureHeight;
    private static int edgeBuiltDpi;
    private static int edgeBuiltProfile = -1;
    // Profiles for "aa_overspeed_edge_level": 0 light, 1 medium (default), 2 strong.
    private static final int EDGE_LIGHT = 0;
    private static final int EDGE_MEDIUM = 1;
    private static final int EDGE_STRONG = 2;
    private static final float[] EDGE_THICKNESS_DP = {22f, 32f, 46f};
    private static final int[] EDGE_PEAK_ALPHA = {0x70, 0xB0, 0xF0};
    private static final float[] EDGE_PULSE_DEPTH = {0.18f, 0.25f, 0.32f};
    private static float edgeLevel;
    private static long edgeLastFrameMs;
    private static int lastSpeed = Integer.MIN_VALUE;
    private static int lastLimit = Integer.MIN_VALUE;
    private static int lastMinimum = Integer.MIN_VALUE;
    private static int lastSize = Integer.MIN_VALUE;
    private static int lastDpi = Integer.MIN_VALUE;
    private static int lastLayoutStyle = Integer.MIN_VALUE;
    private static boolean lastAverageZone;
    private static boolean lastSquareSign;
    private static boolean lastSpeedSignBold;
    private static String lastUnits = "";
    private static long lastErrorLogMs;
    private static volatile Rect lastDrawRect = new Rect();
    /** Bounds used by drag. Safe area for corner modes, full Surface for free mode. */
    private static volatile Rect lastDragBounds = new Rect();
    private static volatile long dragArmedUntilMs;
    private static volatile int draggedLeft = Integer.MIN_VALUE;
    private static volatile int draggedTop = Integer.MIN_VALUE;
    private static volatile boolean draggedLandscape;
    private static final FloatBuffer VERTICES = ByteBuffer.allocateDirect(16 * 4)
            .order(ByteOrder.nativeOrder()).asFloatBuffer();

    private AaSpeedo() { }

    /** Called from the Android Auto Surface callback before the renderer attaches. */
    public static synchronized void onSurface(int width, int height, int dpi) {
        SurfaceState old = surface;
        surface = new SurfaceState(
                Math.max(0, width),
                Math.max(0, height),
                dpi > 0 ? dpi : 160,
                old.generation + 1,
                old.stable,
                old.visible);
    }

    public static synchronized void onSurfaceDestroyed() {
        SurfaceState old = surface;
        surface = new SurfaceState(0, 0, old.dpi, old.generation + 1, null, null);
        surfaceDestroyedAtMs = SystemClock.elapsedRealtime();
        dragArmedUntilMs = 0L;
        draggedLeft = draggedTop = Integer.MIN_VALUE;
    }

    /** AA only exposes click coordinates, so a tap on the overlay arms a short drag session. */
    public static void onClick(float x, float y) {
        Rect hit = new Rect(lastDrawRect);
        if (!prefBool("aa_float_speedo", false)
                || prefInt("aa_fs_position", 1) != 4
                || !hit.contains(Math.round(x), Math.round(y))) {
            dragArmedUntilMs = 0L;
            return;
        }
        dragArmedUntilMs = SystemClock.elapsedRealtime() + 8000L;
        draggedLeft = hit.left;
        draggedTop = hit.top;
        draggedLandscape = surface.width > surface.height;
        Log.i(TAG, "AA speedo drag armed");
    }

    /** Move the armed overlay using SurfaceCallback scroll deltas without hijacking map pans. */
    public static void onScroll(float distanceX, float distanceY) {
        if (SystemClock.elapsedRealtime() > dragArmedUntilMs) return;
        Rect dragBounds = new Rect(lastDragBounds);
        Rect draw = new Rect(lastDrawRect);
        if (dragBounds.isEmpty() || draw.isEmpty()
                || prefInt("aa_fs_position", 1) != 4) return;
        int width = draw.width();
        int height = draw.height();
        int left = clamp(Math.round(draggedLeft - distanceX), dragBounds.left,
                Math.max(dragBounds.left, dragBounds.right - width));
        int top = clamp(Math.round(draggedTop - distanceY), dragBounds.top,
                Math.max(dragBounds.top, dragBounds.bottom - height));
        draggedLeft = left;
        draggedTop = top;
        lastDrawRect = new Rect(left, top, left + width, top + height);
        saveDragPosition(left, top, width, height, dragBounds, draggedLandscape);
        dragArmedUntilMs = SystemClock.elapsedRealtime() + 3000L;
    }

    /** Prevent phone-only viewport changes from leaking into an active Android Auto canvas. */
    static boolean isSurfaceActive() {
        SurfaceState state = surface;
        return state.width > 0 && state.height > 0;
    }

    /** True when the Android Auto surface went away within the last {@code windowMs}. */
    static boolean surfaceEndedWithin(long windowMs) {
        long at = surfaceDestroyedAtMs;
        return at > 0 && !isSurfaceActive() && SystemClock.elapsedRealtime() - at <= windowMs;
    }

    public static synchronized void onStableArea(Rect area) {
        SurfaceState old = surface;
        surface = new SurfaceState(old.width, old.height, old.dpi, old.generation,
                area, old.visible);
    }

    public static synchronized void onVisibleArea(Rect area) {
        SurfaceState old = surface;
        surface = new SurfaceState(old.width, old.height, old.dpi, old.generation,
                old.stable, area);
    }

    private static native boolean nativeMarkSurface(android.view.Surface surface);

    /**
     * Waze 5.27 renders the AA map natively (Godot) and swaps without Java. The Surface it is about to hand to the
     * native renderer is reported to libwazegw, which then calls {@link #draw()} right before that surface's swap.
     */
    public static void markSurface(android.view.Surface surface) {
        try {
            System.loadLibrary("wazegw");
            Log.i(TAG, "AA surface marked for the native overlay hook: " + nativeMarkSurface(surface));
        } catch (Throwable error) {
            Log.w(TAG, "AA native overlay hook unavailable", error);
        }
    }

    /** Called by libwazegw on the render thread, after the map frame and right before the AA surface swap. */
    public static void draw() {
        try {
            final SurfaceState state = surface;
            final int width = state.width;
            final int height = state.height;
            final int dpi = state.dpi;
            boolean speedoOn = prefBool("aa_float_speedo", false);
            boolean railOn = prefBool("aa_alert_rail", false);
            boolean edgeOn = prefBool("aa_overspeed_edge", false);
            // The measured xADAS gauge replaces the advisory chip while it is showing, as on the phone.
            gapGauge = speedoOn && Gateway.xadasSurfaceEnabled("xadas_aa")
                    ? Gateway.xadasGapState() : XadasGapPolicy.State.HIDDEN;
            int recommendedMetres = gapGauge.visible || !speedoOn ? 0 : Gateway.followingDistanceMetres();
            followingBlock = gapGauge.visible ? BLOCK_GAUGE : recommendedMetres > 0 ? BLOCK_CHIP : BLOCK_NONE;
            if (width <= 0 || height <= 0 || !Gateway.modEnabled()
                    || (!speedoOn && !railOn && !edgeOn)) {
                return;
            }

            if (seenGeneration != state.generation) {
                // GL names belong to the old EGL context. Do not delete them from the new context.
                seenGeneration = state.generation;
                program = 0;
                texture = 0;
                railTexture = 0;
                followingTexture = followingMetres = 0;
                railSignature = "";
                edgeTexture = 0;
                edgeTextureWidth = edgeTextureHeight = 0;
                edgeBuiltProfile = -1;
                aPosition = aTexCoord = uTexture = uAlpha = -1;
                invalidateTexture();
            }

            if (!ensureProgram()) return;
            // Independent overlays: each has its own switch, texture and error handling.
            lastDrawRect = new Rect();
            if (speedoOn) drawSpeedoOverlay(state, width, height, dpi);
            if (railOn) drawAlertRailOverlay(state, width, height, dpi);
            // Last, so the pulse sits over the map but the signs stay readable on top of it.
            if (edgeOn) drawOverspeedEdge(state, width, height, dpi);
            if (speedoOn && followingBlock == BLOCK_GAUGE) drawGapGauge(state, gapGauge);
            else if (speedoOn && recommendedMetres > 0) drawFollowingDistance(state, recommendedMetres);
        } catch (Throwable error) {
            logDrawError("AA overlay draw failed", error);
        }
    }

    /** Rounded advisory block belonging to the AA speedometer. */
    private static void drawFollowingDistance(SurfaceState state, int metres) {
        final boolean tooClose = Gateway.gapTooClose();
        final int key = metres * 2 + (tooClose ? 1 : 0);
        try {
            if (followingBitmap == null || followingMetres != key) {
                if (followingBitmap == null || followingBitmap.getWidth() != 240) {
                    followingBitmap = Bitmap.createBitmap(240, 80, Bitmap.Config.ARGB_8888);
                }
                followingBitmap.eraseColor(0);
                Canvas canvas = new Canvas(followingBitmap);
                Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.SUBPIXEL_TEXT_FLAG);
                paint.setColor(tooClose ? 0xE6C62828 : 0xE61B1F29);
                canvas.drawRoundRect(new RectF(0, 0, 240, 80), 20f, 20f, paint);
                paint.setColor(Color.WHITE);
                paint.setTextSize(56f);
                paint.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
                paint.setTextAlign(Paint.Align.CENTER);
                paint.setShadowLayer(3f, 0f, 1f, Color.BLACK);
                Paint.FontMetrics metrics = paint.getFontMetrics();
                String imperialGap = Units.imperialDistance(metres, true);
                canvas.drawText(imperialGap != null ? imperialGap : metres + "M", 120f, 40f - (metrics.ascent + metrics.descent) / 2f, paint);
            }
            if (!uploadFollowingTexture(key)) return;
            Rect safe = safeArea(state);
            float density = Math.max(0.75f, state.dpi / 160f);
            int margin = Math.max(6, Math.round(12f * density));
            int reserve = Gateway.hudNavigating
                    ? clamp(Math.round(132f * density), lastDrawRect.height() + margin,
                            Math.max(lastDrawRect.height() + margin, Math.round(state.height * 0.32f)))
                    : 0;
            Rect badge = followingDistanceBounds(lastDrawRect, safe,
                    new Rect(0, 0, state.width, state.height), margin, reserve,
                    clamp(prefInt("aa_fs_position", 1), 0, 4));
            if (badge.isEmpty()) return;
            drawTexture(followingTexture, state.width, state.height,
                    badge.left, badge.top, badge.width(), badge.height());
        } catch (Throwable error) {
            logDrawError("AA recommended following-distance draw failed", error);
        }
    }

    /** Uploads {@link #followingBitmap} into {@link #followingTexture} when {@code key} changed. */
    private static boolean uploadFollowingTexture(int key) {
        if (followingTexture != 0 && followingMetres == key) return true;
        int[] active = new int[1];
        int[] binding = new int[1];
        GLES20.glGetIntegerv(GLES20.GL_ACTIVE_TEXTURE, active, 0);
        GLES20.glActiveTexture(GLES20.GL_TEXTURE0);
        GLES20.glGetIntegerv(GLES20.GL_TEXTURE_BINDING_2D, binding, 0);
        try {
            if (followingTexture == 0) {
                int[] ids = new int[1];
                GLES20.glGenTextures(1, ids, 0);
                followingTexture = ids[0];
            }
            if (followingTexture == 0) return false;
            GLES20.glBindTexture(GLES20.GL_TEXTURE_2D, followingTexture);
            GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_MIN_FILTER, GLES20.GL_LINEAR);
            GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_MAG_FILTER, GLES20.GL_LINEAR);
            GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_WRAP_S, GLES20.GL_CLAMP_TO_EDGE);
            GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_WRAP_T, GLES20.GL_CLAMP_TO_EDGE);
            GLUtils.texImage2D(GLES20.GL_TEXTURE_2D, 0, followingBitmap, 0);
            followingMetres = key;
            return true;
        } finally {
            GLES20.glBindTexture(GLES20.GL_TEXTURE_2D, binding[0]);
            GLES20.glActiveTexture(active[0]);
        }
    }

    /** The xADAS distance gauge under the AA speedometer; same drawing as the phone widget. */
    private static void drawGapGauge(SurfaceState state, XadasGapPolicy.State gap) {
        try {
            float pulse = 1f;
            int phase = 0;
            if (gap.alert) {
                phase = (int) ((SystemClock.uptimeMillis() % GAUGE_PULSE_MS) * GAUGE_PULSE_STEPS
                        / GAUGE_PULSE_MS);
                pulse = 0.5f + 0.5f * (float) Math.sin(2.0 * Math.PI * phase / GAUGE_PULSE_STEPS);
            }
            // Negative keys never collide with the chip's positive ones; the pulse is quantised so
            // the texture is re-uploaded only a few times a second while "too close".
            int mix = (gap.metres * 31 + gap.safeMetres) * 31 + (gap.alert ? phase + 1 : 0);
            int key = -(1 + (mix & 0x3fffffff));
            if (followingBitmap == null || followingBitmap.getWidth() != GAUGE_PX
                    || followingMetres != key) {
                if (followingBitmap == null || followingBitmap.getWidth() != GAUGE_PX) {
                    followingBitmap = Bitmap.createBitmap(GAUGE_PX, GAUGE_PX, Bitmap.Config.ARGB_8888);
                }
                followingBitmap.eraseColor(0);
                if (gaugeDrawer == null) gaugeDrawer = new GapGaugeDrawer(ModTypeface.gauge(context()));
                gaugeDrawer.draw(new Canvas(followingBitmap), GAUGE_PX, gap, pulse, false);
            }
            if (!uploadFollowingTexture(key)) return;
            Rect safe = safeArea(state);
            float density = Math.max(0.75f, state.dpi / 160f);
            int margin = Math.max(6, Math.round(12f * density));
            int reserve = Gateway.hudNavigating
                    ? clamp(Math.round(132f * density), lastDrawRect.height() + margin,
                            Math.max(lastDrawRect.height() + margin, Math.round(state.height * 0.32f)))
                    : 0;
            Rect box = followingBounds(lastDrawRect, safe, new Rect(0, 0, state.width, state.height),
                    margin, reserve, clamp(prefInt("aa_fs_position", 1), 0, 4), GAUGE_WIDTH, 1f);
            if (box.isEmpty()) return;
            drawTexture(followingTexture, state.width, state.height,
                    box.left, box.top, box.width(), box.height());
        } catch (Throwable error) {
            logDrawError("AA following-distance gauge draw failed", error);
        }
    }

    static Rect followingDistanceBounds(Rect speedo, Rect safe, Rect viewport,
            int gap, int reserve, int position) {
        return followingBounds(speedo, safe, viewport, gap, reserve, position, 0.6f, 1f / 3f);
    }

    /** Block of {@code widthFactor} x speedo width and {@code heightPerWidth} aspect below the speedo. */
    static Rect followingBounds(Rect speedo, Rect safe, Rect viewport,
            int gap, int reserve, int position, float widthFactor, float heightPerWidth) {
        if (speedo.isEmpty()) return new Rect();
        // Mirror speedometer policy: free uses Surface; bottom-left may bypass route-card inset.
        boolean bottom = position == 0 || position == 2;
        boolean physicalLeft = position == 0 && safe.left <= Math.round(viewport.width() * 0.55f);
        Rect bounds = position == 4 ? viewport
                : new Rect(physicalLeft ? viewport.left : safe.left, safe.top,
                        physicalLeft ? viewport.right : safe.right, safe.bottom);
        reserve = bottom ? reserve : 0;
        int w = Math.max(1, Math.round(speedo.width() * widthFactor));
        int h = Math.max(1, Math.round(w * heightPerWidth));
        int left = speedo.left + (speedo.width() - w) / 2;
        int top = speedo.bottom + gap;
        if (left < bounds.left || left + w > bounds.right || top < bounds.top
                || top + h > bounds.bottom - (position == 4 ? 0 : gap) - reserve
                || left < viewport.left || left + w > viewport.right
                || top < viewport.top || top + h > viewport.bottom) return new Rect();
        return new Rect(left, top, left + w, top + h);
    }

    private static void drawSpeedoOverlay(SurfaceState state, int width, int height, int dpi) {
        try {
            Rect bounds = new Rect(0, 0, width, height);
            Rect safe = safeArea(state);
            float density = Math.max(0.75f, dpi / 160f);
            int margin = Math.max(6, Math.round(12f * density));
            int size = clamp(prefInt("aa_fs_size", 100), 60, 180);
            int layoutStyle = clampLayoutStyle(prefInt("aa_fs_layout", 3));
            int position = clamp(prefInt("aa_fs_position", 1), 0, 4);
            boolean free = position == 4;
            Gateway.AaSpeedSnapshot phone = Gateway.aaPhoneSpeedSnapshot();
            long phoneAge = phone.elapsedRealtimeMs <= 0L ? Long.MAX_VALUE
                    : Math.max(0L, SystemClock.elapsedRealtime() - phone.elapsedRealtimeMs);
            boolean phoneFresh = phoneAge <= 8000L;
            int speed = phoneFresh && phone.speed >= 0
                    ? phone.speed : Math.max(0, Gateway.hudSpeed);
            int limit = phoneFresh && phone.limit >= 0 ? phone.limit : Gateway.hudLimit;
            String units = phoneFresh && phone.units != null && !phone.units.isEmpty()
                    ? phone.units : Gateway.hudUnits;
            int minimum = Gateway.minimumSpeedLimit;
            if (minimum < 10 || minimum > 160) minimum = -1;
            boolean averageZone = Gateway.avgZone;
            boolean speedSignBold = prefBool("aa_speed_sign_bold", true);
            boolean squareSign = LimitSign.square();

            if (texture == 0 || speed != lastSpeed || limit != lastLimit || squareSign != lastSquareSign
                    || minimum != lastMinimum || !same(units, lastUnits)
                    || size != lastSize || dpi != lastDpi || averageZone != lastAverageZone
                    || speedSignBold != lastSpeedSignBold
                    || layoutStyle != lastLayoutStyle) {
                if (!rebuildTexture(speed, units, limit, minimum, size, dpi, averageZone,
                        speedSignBold, layoutStyle, squareSign)) return;
                lastSquareSign = squareSign;
                lastSpeed = speed;
                lastLimit = limit;
                lastMinimum = minimum;
                lastUnits = units == null ? "" : units;
                lastSize = size;
                lastDpi = dpi;
                lastAverageZone = averageZone;
                lastSpeedSignBold = speedSignBold;
                lastLayoutStyle = layoutStyle;
            }

            // Free mode deliberately ignores AA stable/visible areas. It only keeps the overlay
            // inside the physical renderer Surface so the user may drag over host-reserved zones.
            Rect placementBounds = free ? bounds : safe;
            int availableWidth = Math.max(1, placementBounds.width() - margin * 2);
            int availableHeight = Math.max(1, placementBounds.height() - margin * 2);
            float fit = Math.min(1f, Math.min(availableWidth / (float) textureWidth,
                    availableHeight / (float) textureHeight));
            int drawWidth = Math.max(1, Math.round(textureWidth * fit));
            int drawHeight = Math.max(1, Math.round(textureHeight * fit));
            int distanceExtra = followingBlock == BLOCK_GAUGE
                    ? margin + Math.max(1, Math.round(drawWidth * GAUGE_WIDTH))
                    : followingBlock == BLOCK_CHIP
                            ? margin + Math.max(1, Math.round(drawWidth * 0.2f)) : 0;

            Rect stable = bounded(state.stable, bounds);
            Rect visible = bounded(state.visible, bounds);
            Rect anchor = valid(stable) ? stable : safe;

            // Restore the original AA placement contract: both axes are derived from the
            // intersection of SurfaceCallback stable/visible areas and clamped to that rectangle.
            int minLeft = clamp(placementBounds.left, 0, Math.max(0, width - drawWidth));
            int minTop = clamp(placementBounds.top, 0, Math.max(0, height - drawHeight));
            int maxLeft = clamp(placementBounds.right - drawWidth, minLeft,
                    Math.max(minLeft, width - drawWidth));
            int maxTop = clamp(placementBounds.bottom - drawHeight - distanceExtra, minTop,
                    Math.max(minTop, height - drawHeight));
            // 0 bottom-left, 1 top-left (legacy/default), 2 bottom-right, 3 top-right,
            // 4 free. Corner modes honor AA safe area; free mode uses the entire Surface.
            // Every corner is derived from AA's stable/visible intersection, never from the
            // physical Surface edge, so host chrome and cut-outs remain protected.
            boolean right = position == 2 || position == 3;
            boolean bottom = position == 0 || position == 2;
            int left = clamp(right ? placementBounds.right - margin - drawWidth
                            : placementBounds.left + margin,
                    minLeft, maxLeft);
            int top = clamp(bottom ? placementBounds.bottom - margin - drawHeight - distanceExtra
                            : placementBounds.top + margin,
                    minTop, maxTop);

            if (bottom && !free) {
                // On several DHU/head-unit layouts both stableArea and visibleArea are already
                // cropped to the right edge of the route card. There is then no rectangle delta
                // from which to infer the obstruction. Bottom-corner mode therefore anchors to
                // the renderer surface itself and reserves the native route-card height while
                // navigation is active. This guarantees vertical avoidance instead of sideways
                // drift. The Waze renderer surface excludes the AA system rail/media pane.
                int routeCardClearance = Gateway.hudNavigating
                        ? clamp(Math.round(132f * density), drawHeight + margin,
                                Math.max(drawHeight + margin, Math.round(height * 0.32f)))
                        : 0;
                // Left corners need the renderer edge because the route card crops both host
                // rectangles. Right corners are different: a split-screen media pane keeps the
                // Surface width but reduces safe.right, so anchor there to remain inside Waze.
                // A very large left inset means Waze itself is the right-hand dashboard pane,
                // not merely being cropped by its own route card. In that layout the physical
                // renderer edge belongs to another app, so pull the requested left corner into
                // Waze at safe.left. Moderate insets are route-card occlusion and still use the
                // true left edge plus vertical avoidance.
                boolean wazeIsRightPane = safe.left > Math.round(width * 0.55f);
                left = right ? safe.right - margin - drawWidth
                        : (wazeIsRightPane ? safe.left + margin : margin);
                top = safe.bottom - margin - drawHeight - distanceExtra - routeCardClearance;
                int leftBound = right || wazeIsRightPane ? safe.left : 0;
                int rightBound = right || wazeIsRightPane ? safe.right : width;
                left = clamp(left, leftBound, Math.max(leftBound, rightBound - drawWidth));
                top = clamp(top, safe.top + margin,
                        Math.max(safe.top + margin, safe.bottom - drawHeight));
            }
            boolean landscape = width > height;
            String suffix = landscape ? "_land" : "_port";
            int savedX = free ? prefInt("aa_fs_drag_x" + suffix, -1) : -1;
            int savedY = free ? prefInt("aa_fs_drag_y" + suffix, -1) : -1;
            if (free && savedX >= 0 && savedY >= 0) {
                left = minLeft + Math.round((maxLeft - minLeft) * savedX / 10000f);
                top = minTop + Math.round((maxTop - minTop) * savedY / 10000f);
                left = clamp(left, minLeft, maxLeft);
                top = clamp(top, minTop, maxTop);
            }
            if (free && draggedLeft != Integer.MIN_VALUE && draggedLandscape == landscape
                    && SystemClock.elapsedRealtime() <= dragArmedUntilMs) {
                left = clamp(draggedLeft, minLeft, maxLeft);
                top = clamp(draggedTop, minTop, maxTop);
            }
            lastDragBounds = new Rect(minLeft, minTop,
                    maxLeft + drawWidth, maxTop + drawHeight);
            lastDrawRect = new Rect(left, top, left + drawWidth, top + drawHeight);
            drawTexture(texture, width, height, left, top, drawWidth, drawHeight);
        } catch (Throwable error) {
            // Never let an optional overlay break Waze's renderer; rate-limit diagnostics.
            long now = SystemClock.elapsedRealtime();
            if (now - lastErrorLogMs >= 10000) {
                lastErrorLogMs = now;
                Log.w(TAG, "AA speedo draw failed", error);
            }
        }
    }

    /**
     * The phone's V1 upcoming-alert list as a second texture, on the right (or left) edge. The
     * bitmap is rebuilt when the list changes, at most every RAIL_REBUILD_MS, so the per-frame cost
     * is one textured quad.
     */
    private static void drawAlertRailOverlay(SurfaceState state, int width, int height, int dpi) {
        try {
            int sizePercent = clamp(prefInt("aa_rail_size", 100), 60, 180);
            int count = clamp(prefInt("aa_rail_count", 3), 1, 3);
            boolean distanceStyle = prefInt("aa_rail_style", 0) == 1;   // phone's V2; 0 = V1 list
            java.util.List<AaAlertRail.Entry> entries = distanceStyle
                    ? AaDistanceRail.entries(count) : AaAlertRail.entries(count);
            if (entries.isEmpty()) return;
            int ambient = AmbientTheme.color(prefs());
            String signature = distanceStyle
                    ? AaDistanceRail.signature(entries, sizePercent, dpi, ambient)
                    : AaAlertRail.signature(entries, sizePercent, dpi);
            long now = SystemClock.elapsedRealtime();
            boolean stale = railTexture == 0 || !signature.equals(railSignature);
            if (stale && (railTexture == 0 || now - railBuiltMs >= RAIL_REBUILD_MS)) {
                Bitmap bitmap = distanceStyle
                        ? AaDistanceRail.render(context(), entries, sizePercent, dpi, ambient)
                        : AaAlertRail.render(context(), entries, sizePercent, dpi);
                if (bitmap == null || !uploadRailTexture(bitmap)) return;
                railSignature = signature;
                railBuiltMs = now;
            }
            if (railTexture == 0 || railTextureWidth <= 0 || railTextureHeight <= 0) return;

            float density = Math.max(0.75f, dpi / 160f);
            int margin = Math.max(6, Math.round(12f * density));
            Rect safe = safeArea(state);
            boolean leftEdge = prefInt("aa_rail_position", 0) == 1;
            // While navigating, keep clear of Waze's route card along the bottom. That card sits at
            // the bottom-left of a wide screen, so a right-edge rail only has to clear the recenter
            // button; reserving the whole card height there shrank the rail (the size setting did
            // nothing once the rail no longer fit) on small head units.
            float reserveDp = !leftEdge && width > height ? 72f : 132f;
            int bottomReserve = Gateway.hudNavigating
                    ? Math.min(Math.round(reserveDp * density), Math.round(height * 0.32f)) : 0;
            int availableWidth = Math.max(1, safe.width() - margin * 2);
            int availableHeight = Math.max(1, safe.height() - bottomReserve - margin * 2);
            float fit = Math.min(1f, Math.min(availableWidth / (float) railTextureWidth,
                    availableHeight / (float) railTextureHeight));
            int drawWidth = Math.max(1, Math.round(railTextureWidth * fit));
            int drawHeight = Math.max(1, Math.round(railTextureHeight * fit));
            int left = leftEdge ? safe.left + margin : safe.right - margin - drawWidth;
            int top = safe.top + margin + (availableHeight - drawHeight) / 2;
            left = clamp(left, 0, Math.max(0, width - drawWidth));
            top = clamp(top, 0, Math.max(0, height - drawHeight));
            drawTexture(railTexture, width, height, left, top, drawWidth, drawHeight);
        } catch (Throwable error) {
            logDrawError("AA alert rail draw failed", error);
        }
    }

    /**
     * Red glow along the edges of the map Surface while the phone speed is over the limit. It fades
     * in and out and pulses; nothing is drawn (and no texture is touched) once the level is zero.
     */
    private static void drawOverspeedEdge(SurfaceState state, int width, int height, int dpi) {
        try {
            long now = SystemClock.elapsedRealtime();
            long dt = edgeLastFrameMs == 0L ? 0L : Math.min(200L, Math.max(0L, now - edgeLastFrameMs));
            edgeLastFrameMs = now;
            float step = dt / (float) EDGE_FADE_MS;
            edgeLevel = overspeedNow()
                    ? Math.min(1f, edgeLevel + step) : Math.max(0f, edgeLevel - step);
            if (edgeLevel <= 0f) return;

            // Whole Surface, not the safe area: the map runs edge to edge behind the host chrome, so
            // a safe-area frame would float inside the map with a hard outer edge.
            Rect area = new Rect(0, 0, width, height);
            int profile = clamp(prefInt("aa_overspeed_edge_level", EDGE_MEDIUM), EDGE_LIGHT, EDGE_STRONG);
            if (edgeTexture == 0 || edgeTextureWidth != Math.max(16, area.width() / 4)
                    || edgeTextureHeight != Math.max(16, area.height() / 4)
                    || edgeBuiltDpi != dpi || edgeBuiltProfile != profile) {
                Bitmap bitmap = renderEdgeBitmap(area.width(), area.height(), dpi, profile);
                if (bitmap == null || !uploadEdgeTexture(bitmap)) return;
                edgeBuiltDpi = dpi;
                edgeBuiltProfile = profile;
            }
            double phase = (now % EDGE_PULSE_MS) / (double) EDGE_PULSE_MS * Math.PI * 2d;
            float depth = EDGE_PULSE_DEPTH[profile];
            float pulse = (1f - depth) + depth * (float) Math.sin(phase);
            drawTexture(edgeTexture, width, height, area.left, area.top,
                    area.width(), area.height(), edgeLevel * pulse);
        } catch (Throwable error) {
            logDrawError("AA overspeed edge draw failed", error);
        }
    }

    /** Same speed/limit source as the speedo: the fresh phone snapshot, else the HUD values. */
    private static boolean overspeedNow() {
        Gateway.AaSpeedSnapshot phone = Gateway.aaPhoneSpeedSnapshot();
        long age = phone.elapsedRealtimeMs <= 0L ? Long.MAX_VALUE
                : Math.max(0L, SystemClock.elapsedRealtime() - phone.elapsedRealtimeMs);
        boolean fresh = age <= 8000L;
        int speed = fresh && phone.speed >= 0 ? phone.speed : Math.max(0, Gateway.hudSpeed);
        int limit = fresh && phone.limit >= 0 ? phone.limit : Gateway.hudLimit;
        return limit >= 10 && speed > limit;
    }

    /**
     * A quarter-resolution bitmap: transparent centre, red falling off quadratically from each
     * edge over ~38dp. GL_LINEAR scales it to the whole Surface, which also softens the falloff.
     */
    private static Bitmap renderEdgeBitmap(int areaWidth, int areaHeight, int dpi, int profile) {
        int w = Math.max(16, areaWidth / 4);
        int h = Math.max(16, areaHeight / 4);
        float density = Math.max(0.75f, dpi / 160f);
        float thickness = Math.max(8f, EDGE_THICKNESS_DP[profile] * density / 4f);
        int peak = EDGE_PEAK_ALPHA[profile];
        int[] pixels = new int[w * h];
        for (int y = 0; y < h; y++) {
            for (int x = 0; x < w; x++) {
                float d = Math.min(Math.min(x, w - 1 - x), Math.min(y, h - 1 - y));
                float a = 1f - d / thickness;
                if (a <= 0f) continue;
                a *= a;
                pixels[y * w + x] = (Math.round(a * peak) << 24) | 0x00FF2D2D;
            }
        }
        Bitmap bitmap = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
        bitmap.setPixels(pixels, 0, w, 0, 0, w, h);
        return bitmap;
    }

    private static boolean uploadEdgeTexture(Bitmap bitmap) {
        if (edgeTexture == 0) {
            int[] ids = new int[1];
            GLES20.glGenTextures(1, ids, 0);
            edgeTexture = ids[0];
        }
        if (edgeTexture == 0) {
            bitmap.recycle();
            return false;
        }
        int[] oldActive = new int[1];
        int[] oldBinding = new int[1];
        GLES20.glGetIntegerv(GLES20.GL_ACTIVE_TEXTURE, oldActive, 0);
        GLES20.glActiveTexture(GLES20.GL_TEXTURE0);
        GLES20.glGetIntegerv(GLES20.GL_TEXTURE_BINDING_2D, oldBinding, 0);
        GLES20.glBindTexture(GLES20.GL_TEXTURE_2D, edgeTexture);
        GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_MIN_FILTER, GLES20.GL_LINEAR);
        GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_MAG_FILTER, GLES20.GL_LINEAR);
        GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_WRAP_S, GLES20.GL_CLAMP_TO_EDGE);
        GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_WRAP_T, GLES20.GL_CLAMP_TO_EDGE);
        GLUtils.texImage2D(GLES20.GL_TEXTURE_2D, 0, bitmap, 0);
        GLES20.glBindTexture(GLES20.GL_TEXTURE_2D, oldBinding[0]);
        GLES20.glActiveTexture(oldActive[0]);
        edgeTextureWidth = bitmap.getWidth();
        edgeTextureHeight = bitmap.getHeight();
        bitmap.recycle();
        return true;
    }

    private static boolean uploadRailTexture(Bitmap bitmap) {
        if (railTexture == 0) {
            int[] ids = new int[1];
            GLES20.glGenTextures(1, ids, 0);
            railTexture = ids[0];
        }
        if (railTexture == 0) {
            bitmap.recycle();
            return false;
        }
        int[] oldActive = new int[1];
        int[] oldBinding = new int[1];
        GLES20.glGetIntegerv(GLES20.GL_ACTIVE_TEXTURE, oldActive, 0);
        GLES20.glActiveTexture(GLES20.GL_TEXTURE0);
        GLES20.glGetIntegerv(GLES20.GL_TEXTURE_BINDING_2D, oldBinding, 0);
        GLES20.glBindTexture(GLES20.GL_TEXTURE_2D, railTexture);
        GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_MIN_FILTER, GLES20.GL_LINEAR);
        GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_MAG_FILTER, GLES20.GL_LINEAR);
        GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_WRAP_S, GLES20.GL_CLAMP_TO_EDGE);
        GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_WRAP_T, GLES20.GL_CLAMP_TO_EDGE);
        GLUtils.texImage2D(GLES20.GL_TEXTURE_2D, 0, bitmap, 0);
        GLES20.glBindTexture(GLES20.GL_TEXTURE_2D, oldBinding[0]);
        GLES20.glActiveTexture(oldActive[0]);
        railTextureWidth = bitmap.getWidth();
        railTextureHeight = bitmap.getHeight();
        bitmap.recycle();
        return true;
    }

    /** Never let an optional overlay break Waze's renderer; rate-limit diagnostics. */
    private static void logDrawError(String message, Throwable error) {
        long now = SystemClock.elapsedRealtime();
        if (now - lastErrorLogMs >= 10000) {
            lastErrorLogMs = now;
            Log.w(TAG, message, error);
        }
    }

    private static Rect safeArea(SurfaceState state) {
        Rect bounds = new Rect(0, 0, state.width, state.height);
        Rect stable = bounded(state.stable, bounds);
        Rect visible = bounded(state.visible, bounds);
        Rect out = new Rect(bounds);

        if (valid(stable)) out.intersect(stable);
        if (valid(visible)) {
            Rect intersection = new Rect(out);
            if (intersection.intersect(visible) && !intersection.isEmpty()) {
                out = intersection;
            } else {
                // Prefer a valid host visible rectangle over drawing below AA template chrome.
                out = new Rect(visible);
            }
        }
        if (out.isEmpty() && valid(stable)) out = new Rect(stable);
        if (out.isEmpty()) out = new Rect(bounds);
        if (!out.intersect(bounds) || out.isEmpty()) out = new Rect(bounds);
        return out;
    }

    private static Rect bounded(Rect source, Rect bounds) {
        if (!valid(source)) return null;
        Rect copy = new Rect(source);
        return copy.intersect(bounds) && !copy.isEmpty() ? copy : null;
    }

    private static boolean valid(Rect rect) {
        return rect != null && !rect.isEmpty() && rect.width() > 0 && rect.height() > 0;
    }

    private static boolean rebuildTexture(int speed, String units, int limit, int minimum,
                                          int size, int dpi,
                                          boolean averageZone, boolean speedSignBold,
                                          int layoutStyle, boolean squareSign) {
        float density = Math.max(0.75f, dpi / 160f);
        int diameter = Math.max(48, Math.round(88f * density * size / 100f));
        int minimumDiameter = Math.max(30, Math.round(diameter * 0.60f));
        int minimumLeft = Math.round(diameter * (layoutStyle == 2 ? 0.62f : 0.58f));
        int minimumTop = Math.round(diameter * (layoutStyle == 2 ? 0.66f : 0.54f));
        int signWidth = minimum >= 10 ? Math.max(diameter, minimumLeft + minimumDiameter) : diameter;
        int signHeight = minimum >= 10 ? Math.max(diameter, minimumTop + minimumDiameter) : diameter;

        // AA exposes FloatSpeedo presets 2, 3 and 4 only. Preset 3 is the existing two-dial
        // composition and remains the default. Preset 2 uses a compact current-speed badge;
        // preset 4 intentionally omits current speed and leaves only the road signs.
        int currentLeft = layoutStyle == 2
                ? Math.round(diameter * 0.76f) : Math.round(diameter * 1.08f);
        int currentTop = 0;
        int currentDiameter = layoutStyle == 2
                ? Math.max(30, Math.round(diameter * 0.60f)) : diameter;
        boolean showCurrent = layoutStyle != 4;
        int clusterWidth = showCurrent
                ? Math.max(signWidth, currentLeft + currentDiameter) : signWidth;
        int clusterHeight = showCurrent
                ? Math.max(signHeight, currentTop + currentDiameter) : signHeight;

        Bitmap average = null;
        if (averageZone) average = Signs.pin(context(), "no_passing_in");
        int gap = Math.max(3, Math.round(6f * density * size / 100f));
        int width = clusterWidth + (average == null ? 0 : gap + diameter);
        int height = Math.max(clusterHeight, average == null ? 0 : diameter);

        Bitmap bitmap = Bitmap.createBitmap(Math.max(1, width), Math.max(1, height),
                Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);
        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.SUBPIXEL_TEXT_FLAG);

        // Maximum-speed sign: solid red disc with an inset white face. No shadow.
        float radius = diameter / 2f;
        if (squareSign) {
            // US style: white rounded square with the number centred.
            LimitSign.drawFace(canvas, 0f, 0f, diameter);
            drawCenteredSpeedText(canvas, paint, limit >= 10 ? String.valueOf(limit) : "--",
                    radius, diameter * LimitSign.NUMBER_CENTER, diameter * 0.5f, Color.BLACK, speedSignBold);
        } else {
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(0xFFE6261F);
            canvas.drawCircle(radius, radius, radius, paint);
            paint.setColor(Color.WHITE);
            canvas.drawCircle(radius, radius, radius * 0.79f, paint);
            drawCenteredSpeedText(canvas, paint, limit >= 10 ? String.valueOf(limit) : "--",
                    radius, radius, diameter * 0.43f, Color.BLACK, speedSignBold);
        }

        if (layoutStyle == 2) {
            drawCurrentSpeedBadge(canvas, paint, speed, limit,
                    currentLeft, currentTop, currentDiameter);
        } else if (layoutStyle == 3) {
            drawCurrentSpeedDial(canvas, paint, speed, units, limit,
                    currentLeft, currentTop, currentDiameter);
        }

        if (minimum >= 10) {
            float minRadius = minimumDiameter / 2f;
            float cx = minimumLeft + minRadius;
            float cy = minimumTop + minRadius;
            paint.setColor(0xFF0B4FB3);
            canvas.drawCircle(cx, cy, minRadius, paint);
            drawCenteredDigits(canvas, paint, String.valueOf(minimum), cx, cy,
                    minimumDiameter * 0.44f, Color.WHITE);
        }

        if (average != null) {
            Rect src = new Rect(0, 0, average.getWidth(), average.getHeight());
            RectF dst = new RectF(clusterWidth + gap, 0,
                    clusterWidth + gap + diameter, diameter);
            canvas.drawBitmap(average, src, dst, paint);
        }

        if (texture == 0) {
            int[] ids = new int[1];
            GLES20.glGenTextures(1, ids, 0);
            texture = ids[0];
        }
        if (texture == 0) {
            bitmap.recycle();
            return false;
        }

        int[] oldActive = new int[1];
        int[] oldBinding = new int[1];
        GLES20.glGetIntegerv(GLES20.GL_ACTIVE_TEXTURE, oldActive, 0);
        GLES20.glActiveTexture(GLES20.GL_TEXTURE0);
        GLES20.glGetIntegerv(GLES20.GL_TEXTURE_BINDING_2D, oldBinding, 0);
        GLES20.glBindTexture(GLES20.GL_TEXTURE_2D, texture);
        GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_MIN_FILTER, GLES20.GL_LINEAR);
        GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_MAG_FILTER, GLES20.GL_LINEAR);
        GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_WRAP_S, GLES20.GL_CLAMP_TO_EDGE);
        GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_WRAP_T, GLES20.GL_CLAMP_TO_EDGE);
        GLUtils.texImage2D(GLES20.GL_TEXTURE_2D, 0, bitmap, 0);
        GLES20.glBindTexture(GLES20.GL_TEXTURE_2D, oldBinding[0]);
        GLES20.glActiveTexture(oldActive[0]);

        textureWidth = bitmap.getWidth();
        textureHeight = bitmap.getHeight();
        bitmap.recycle();
        return true;
    }

    /** FloatSpeedo preset 2: a small pale badge with a dashed blue outline. */
    private static void drawCurrentSpeedBadge(Canvas canvas, Paint paint, int speed, int limit,
                                              int left, int top, int diameter) {
        float cx = left + diameter / 2f;
        float cy = top + diameter / 2f;
        float radius = diameter / 2f;
        boolean overspeed = limit >= 10 && speed > limit;

        paint.setShader(null);
        paint.setPathEffect(null);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(0xFFE1E5E9);
        canvas.drawCircle(cx, cy, radius, paint);

        float stroke = Math.max(2f, diameter * 0.035f);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(stroke);
        paint.setStrokeCap(Paint.Cap.BUTT);
        paint.setPathEffect(new android.graphics.DashPathEffect(
                new float[]{Math.max(3f, diameter * 0.10f), Math.max(2f, diameter * 0.06f)}, 0f));
        paint.setColor(overspeed ? 0xFFFF3B30 : 0xFF168DE2);
        canvas.drawCircle(cx, cy, radius - stroke / 2f, paint);
        paint.setPathEffect(null);
        paint.setStyle(Paint.Style.FILL);
        paint.setStrokeWidth(0f);

        drawCenteredDigits(canvas, paint, speed >= 0 ? String.valueOf(speed) : "--",
                cx, cy, diameter * 0.43f, overspeed ? 0xFFFF3B30 : 0xFF17191D);
    }

    /** Dark current-speed dial fed by the corrected phone GPS snapshot. */
    private static void drawCurrentSpeedDial(Canvas canvas, Paint paint, int speed, String units,
                                             int limit, int left, int top, int diameter) {
        float cx = left + diameter / 2f;
        float cy = top + diameter / 2f;
        float radius = diameter / 2f;
        boolean overspeed = limit >= 10 && speed > limit;

        paint.setShader(null);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(0xFF171A22);
        canvas.drawCircle(cx, cy, radius, paint);

        float stroke = Math.max(3f, diameter * 0.075f);
        RectF arc = new RectF(left + stroke / 2f, top + stroke / 2f,
                left + diameter - stroke / 2f, top + diameter - stroke / 2f);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(stroke);
        paint.setStrokeCap(Paint.Cap.ROUND);
        paint.setColor(0xFF303642);
        canvas.drawArc(arc, 135f, 270f, false, paint);

        float max = limit >= 10 ? limit : 160f;
        float progress = Math.max(0f, Math.min(1f, speed / max));
        if (progress > 0f) {
            paint.setColor(overspeed ? 0xFFFF3B30 : 0xFF16D8E8);
            canvas.drawArc(arc, 135f, 270f * progress, false, paint);
        }
        paint.setStrokeCap(Paint.Cap.BUTT);
        paint.setStyle(Paint.Style.FILL);
        paint.setStrokeWidth(0f);

        String value = speed >= 0 ? String.valueOf(speed) : "--";
        drawCenteredDigits(canvas, paint, value, cx, cy - diameter * 0.08f,
                diameter * 0.38f, overspeed ? 0xFFFF6259 : Color.WHITE);
        drawCenteredText(canvas, paint, displayUnits(units), cx, cy + diameter * 0.29f,
                diameter * 0.12f, overspeed ? 0xFFFF6259 : 0xFFD8DADF, false);
    }

    private static String displayUnits(String units) {
        if (units == null) return "Km/h";
        String lower = units.toLowerCase(java.util.Locale.US);
        return lower.contains("mph") || lower.contains("mi/h") ? "mph" : "Km/h";
    }

    private static boolean same(String first, String second) {
        return first == null ? second == null || second.isEmpty() : first.equals(second);
    }

    private static int clampLayoutStyle(int style) {
        return style == 2 || style == 4 ? style : 3;
    }

    private static void drawCenteredText(Canvas canvas, Paint paint, String text,
                                         float cx, float cy, float textSize, int color) {
        drawCenteredText(canvas, paint, text, cx, cy, textSize, color, true);
    }

    private static void drawCenteredText(Canvas canvas, Paint paint, String text,
                                         float cx, float cy, float textSize, int color,
                                         boolean bold) {
        paint.setColor(color);
        paint.setTextSize(textSize);
        paint.setTypeface(bold
                ? android.graphics.Typeface.DEFAULT_BOLD
                : android.graphics.Typeface.DEFAULT);
        paint.setTextAlign(Paint.Align.CENTER);
        paint.setStyle(bold ? Paint.Style.FILL_AND_STROKE : Paint.Style.FILL);
        paint.setStrokeWidth(bold ? textSize * 0.035f : 0f);
        Paint.FontMetrics metrics = paint.getFontMetrics();
        canvas.drawText(text, cx, cy - (metrics.ascent + metrics.descent) / 2f, paint);
        paint.setStyle(Paint.Style.FILL);
        paint.setStrokeWidth(0f);
    }

    /**
     * Current-speed and minimum-limit numerals use the same JetBrains Mono Bold as the distance
     * gauge. The face is wide (0.6 em per digit), so three digits are drawn smaller to stay inside
     * the circle.
     */
    private static void drawCenteredDigits(Canvas canvas, Paint paint, String text,
                                           float cx, float cy, float textSize, int color) {
        paint.setColor(color);
        paint.setTextSize(text.length() >= 3 ? textSize * 0.78f : textSize);
        paint.setTypeface(ModTypeface.gauge(context()));
        paint.setTextScaleX(1f);
        paint.setTextAlign(Paint.Align.CENTER);
        paint.setStyle(Paint.Style.FILL);
        paint.setStrokeWidth(0f);
        Paint.FontMetrics metrics = paint.getFontMetrics();
        canvas.drawText(text, cx, cy - (metrics.ascent + metrics.descent) / 2f, paint);
    }

    /** Speed-sign numerals use the bundled condensed road-sign face on every renderer. */
    private static void drawCenteredSpeedText(Canvas canvas, Paint paint, String text,
                                              float cx, float cy, float textSize, int color,
                                              boolean bold) {
        android.graphics.Typeface custom = ModTypeface.speed(context());
        paint.setColor(color);
        paint.setTextSize(textSize);
        paint.setTypeface(custom != null ? custom
                : (bold ? android.graphics.Typeface.DEFAULT_BOLD
                        : android.graphics.Typeface.DEFAULT));
        paint.setTextScaleX(custom != null ? 1.16f : 1f);
        paint.setTextAlign(Paint.Align.CENTER);
        paint.setStyle(bold ? Paint.Style.FILL_AND_STROKE : Paint.Style.FILL);
        paint.setStrokeWidth(bold ? textSize * 0.035f : 0f);
        Paint.FontMetrics metrics = paint.getFontMetrics();
        canvas.drawText(text, cx, cy - (metrics.ascent + metrics.descent) / 2f, paint);
        paint.setStyle(Paint.Style.FILL);
        paint.setStrokeWidth(0f);
        paint.setTextScaleX(1f);
    }

    private static void drawTexture(int textureId, int width, int height, int left, int top,
                                    int drawWidth, int drawHeight) {
        drawTexture(textureId, width, height, left, top, drawWidth, drawHeight, 1f);
    }

    private static void drawTexture(int textureId, int width, int height, int left, int top,
                                    int drawWidth, int drawHeight, float alpha) {
        float l = -1f + 2f * left / width;
        float r = -1f + 2f * (left + drawWidth) / width;
        float t = 1f - 2f * top / height;
        float b = 1f - 2f * (top + drawHeight) / height;
        float[] data = {
                l, t, 0f, 0f,
                l, b, 0f, 1f,
                r, t, 1f, 0f,
                r, b, 1f, 1f
        };
        VERTICES.clear();
        VERTICES.put(data).position(0);

        int[] oldProgram = new int[1];
        int[] oldActive = new int[1];
        int[] oldTexture = new int[1];
        int[] oldArrayBuffer = new int[1];
        int[] oldViewport = new int[4];
        int[] blendSrcRgb = new int[1];
        int[] blendDstRgb = new int[1];
        int[] blendSrcAlpha = new int[1];
        int[] blendDstAlpha = new int[1];
        int[] posEnabled = new int[1];
        int[] texEnabled = new int[1];
        GLES20.glGetIntegerv(GLES20.GL_CURRENT_PROGRAM, oldProgram, 0);
        GLES20.glGetIntegerv(GLES20.GL_ACTIVE_TEXTURE, oldActive, 0);
        GLES20.glActiveTexture(GLES20.GL_TEXTURE0);
        GLES20.glGetIntegerv(GLES20.GL_TEXTURE_BINDING_2D, oldTexture, 0);
        GLES20.glGetIntegerv(GLES20.GL_ARRAY_BUFFER_BINDING, oldArrayBuffer, 0);
        GLES20.glGetIntegerv(GLES20.GL_VIEWPORT, oldViewport, 0);
        GLES20.glGetIntegerv(GLES20.GL_BLEND_SRC_RGB, blendSrcRgb, 0);
        GLES20.glGetIntegerv(GLES20.GL_BLEND_DST_RGB, blendDstRgb, 0);
        GLES20.glGetIntegerv(GLES20.GL_BLEND_SRC_ALPHA, blendSrcAlpha, 0);
        GLES20.glGetIntegerv(GLES20.GL_BLEND_DST_ALPHA, blendDstAlpha, 0);
        GLES20.glGetVertexAttribiv(aPosition, GLES20.GL_VERTEX_ATTRIB_ARRAY_ENABLED, posEnabled, 0);
        GLES20.glGetVertexAttribiv(aTexCoord, GLES20.GL_VERTEX_ATTRIB_ARRAY_ENABLED, texEnabled, 0);
        if (posEnabled[0] != 0 || texEnabled[0] != 0) {
            // An enabled slot owns live pointer/buffer state that GLES20 cannot fully query.
            // Skip this optional frame instead of corrupting Waze's following geometry pass.
            GLES20.glActiveTexture(oldActive[0]);
            return;
        }
        boolean blend = GLES20.glIsEnabled(GLES20.GL_BLEND);
        boolean depth = GLES20.glIsEnabled(GLES20.GL_DEPTH_TEST);
        boolean stencil = GLES20.glIsEnabled(GLES20.GL_STENCIL_TEST);
        boolean scissor = GLES20.glIsEnabled(GLES20.GL_SCISSOR_TEST);
        boolean cull = GLES20.glIsEnabled(GLES20.GL_CULL_FACE);

        GLES20.glDisable(GLES20.GL_DEPTH_TEST);
        GLES20.glDisable(GLES20.GL_STENCIL_TEST);
        GLES20.glDisable(GLES20.GL_SCISSOR_TEST);
        GLES20.glDisable(GLES20.GL_CULL_FACE);
        GLES20.glEnable(GLES20.GL_BLEND);
        GLES20.glBlendFunc(GLES20.GL_ONE, GLES20.GL_ONE_MINUS_SRC_ALPHA);
        // Waze may leave a map sub-viewport active immediately before swap. Our NDC
        // coordinates are based on the full Android Auto SurfaceContainer, so drawing
        // into that inherited viewport makes the overlay appear enlarged, shifted and
        // clipped on some head units. Use the full surface only for this draw, then
        // restore Waze's viewport together with the rest of its GL state.
        GLES20.glViewport(0, 0, width, height);
        GLES20.glUseProgram(program);
        GLES20.glBindBuffer(GLES20.GL_ARRAY_BUFFER, 0);
        GLES20.glBindTexture(GLES20.GL_TEXTURE_2D, textureId);
        GLES20.glUniform1i(uTexture, 0);
        GLES20.glUniform1f(uAlpha, alpha);
        VERTICES.position(0);
        GLES20.glEnableVertexAttribArray(aPosition);
        GLES20.glVertexAttribPointer(aPosition, 2, GLES20.GL_FLOAT, false, 16, VERTICES);
        VERTICES.position(2);
        GLES20.glEnableVertexAttribArray(aTexCoord);
        GLES20.glVertexAttribPointer(aTexCoord, 2, GLES20.GL_FLOAT, false, 16, VERTICES);
        GLES20.glDrawArrays(GLES20.GL_TRIANGLE_STRIP, 0, 4);

        if (posEnabled[0] == 0) GLES20.glDisableVertexAttribArray(aPosition);
        if (texEnabled[0] == 0) GLES20.glDisableVertexAttribArray(aTexCoord);
        GLES20.glBindBuffer(GLES20.GL_ARRAY_BUFFER, oldArrayBuffer[0]);
        GLES20.glBindTexture(GLES20.GL_TEXTURE_2D, oldTexture[0]);
        GLES20.glActiveTexture(oldActive[0]);
        GLES20.glUseProgram(oldProgram[0]);
        GLES20.glViewport(oldViewport[0], oldViewport[1], oldViewport[2], oldViewport[3]);
        GLES20.glBlendFuncSeparate(blendSrcRgb[0], blendDstRgb[0],
                blendSrcAlpha[0], blendDstAlpha[0]);
        restore(GLES20.GL_BLEND, blend);
        restore(GLES20.GL_DEPTH_TEST, depth);
        restore(GLES20.GL_STENCIL_TEST, stencil);
        restore(GLES20.GL_SCISSOR_TEST, scissor);
        restore(GLES20.GL_CULL_FACE, cull);
    }

    private static boolean ensureProgram() {
        if (program != 0) return true;
        String vertex = "attribute vec2 aPosition;attribute vec2 aTexCoord;"
                + "varying vec2 vTexCoord;void main(){vTexCoord=aTexCoord;"
                + "gl_Position=vec4(aPosition,0.0,1.0);}";
        String fragment = "precision mediump float;varying vec2 vTexCoord;"
                + "uniform sampler2D uTexture;uniform float uAlpha;void main(){gl_FragColor="
                + "texture2D(uTexture,vTexCoord)*uAlpha;}";
        int vertexShader = compileShader(GLES20.GL_VERTEX_SHADER, vertex);
        int fragmentShader = compileShader(GLES20.GL_FRAGMENT_SHADER, fragment);
        if (vertexShader == 0 || fragmentShader == 0) return false;
        int candidate = GLES20.glCreateProgram();
        GLES20.glAttachShader(candidate, vertexShader);
        GLES20.glAttachShader(candidate, fragmentShader);
        // Never let the linker assign the overlay to Waze's commonly-used low attribute slots.
        // Pointer state cannot be queried/restored portably on GLES 2, so reserve the last two
        // hardware slots and fail closed at draw time if the native renderer is using either.
        int[] maxAttributes = new int[1];
        GLES20.glGetIntegerv(GLES20.GL_MAX_VERTEX_ATTRIBS, maxAttributes, 0);
        if (maxAttributes[0] < 2) {
            GLES20.glDeleteShader(vertexShader);
            GLES20.glDeleteShader(fragmentShader);
            GLES20.glDeleteProgram(candidate);
            return false;
        }
        int positionIndex = maxAttributes[0] - 2;
        int textureIndex = maxAttributes[0] - 1;
        GLES20.glBindAttribLocation(candidate, positionIndex, "aPosition");
        GLES20.glBindAttribLocation(candidate, textureIndex, "aTexCoord");
        GLES20.glLinkProgram(candidate);
        int[] ok = new int[1];
        GLES20.glGetProgramiv(candidate, GLES20.GL_LINK_STATUS, ok, 0);
        GLES20.glDeleteShader(vertexShader);
        GLES20.glDeleteShader(fragmentShader);
        if (ok[0] == 0) {
            GLES20.glDeleteProgram(candidate);
            return false;
        }
        program = candidate;
        aPosition = GLES20.glGetAttribLocation(program, "aPosition");
        aTexCoord = GLES20.glGetAttribLocation(program, "aTexCoord");
        uTexture = GLES20.glGetUniformLocation(program, "uTexture");
        uAlpha = GLES20.glGetUniformLocation(program, "uAlpha");
        return aPosition == positionIndex && aTexCoord == textureIndex && uTexture >= 0
                && uAlpha >= 0;
    }

    private static int compileShader(int type, String source) {
        int shader = GLES20.glCreateShader(type);
        GLES20.glShaderSource(shader, source);
        GLES20.glCompileShader(shader);
        int[] ok = new int[1];
        GLES20.glGetShaderiv(shader, GLES20.GL_COMPILE_STATUS, ok, 0);
        if (ok[0] == 0) {
            GLES20.glDeleteShader(shader);
            return 0;
        }
        return shader;
    }

    private static void invalidateTexture() {
        textureWidth = textureHeight = 0;
        lastSpeed = lastLimit = lastMinimum = lastSize = lastDpi = Integer.MIN_VALUE;
        lastLayoutStyle = Integer.MIN_VALUE;
        lastUnits = "";
        lastAverageZone = false;
    }

    private static void restore(int cap, boolean enabled) {
        if (enabled) GLES20.glEnable(cap); else GLES20.glDisable(cap);
    }

    private static Context context() {
        Context cached = appContext;
        if (cached != null) return cached;
        try {
            cached = (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke((Object) null);
            if (cached != null) appContext = cached.getApplicationContext();
            return appContext;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static SharedPreferences prefs() {
        SharedPreferences cached = sharedPreferences;
        if (cached != null) return cached;
        Context current = context();
        if (current != null) {
            sharedPreferences = current.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        }
        return sharedPreferences;
    }

    private static int prefInt(String key, int fallback) {
        SharedPreferences preferences = prefs();
        return preferences == null ? fallback : preferences.getInt(key, fallback);
    }

    private static boolean prefBool(String key, boolean fallback) {
        SharedPreferences preferences = prefs();
        return preferences == null ? fallback : preferences.getBoolean(key, fallback);
    }

    private static void saveDragPosition(int left, int top, int width, int height,
                                         Rect safe, boolean landscape) {
        SharedPreferences preferences = prefs();
        if (preferences == null) return;
        int maxLeft = Math.max(safe.left, safe.right - width);
        int maxTop = Math.max(safe.top, safe.bottom - height);
        int x = maxLeft == safe.left ? 0
                : Math.round((left - safe.left) * 10000f / (maxLeft - safe.left));
        int y = maxTop == safe.top ? 0
                : Math.round((top - safe.top) * 10000f / (maxTop - safe.top));
        String suffix = landscape ? "_land" : "_port";
        preferences.edit().putInt("aa_fs_drag_x" + suffix, clamp(x, 0, 10000))
                .putInt("aa_fs_drag_y" + suffix, clamp(y, 0, 10000)).apply();
    }

    private static int clamp(int value, int min, int max) {
        return Math.max(min, Math.min(max, value));
    }
}
