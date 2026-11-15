package app.southstar21.extension.instagram.liquidglass;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.RecordingCanvas;
import android.graphics.RectF;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.RuntimeShader;
import android.graphics.Shader;
import android.os.Build;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;

/**
 * The iOS 26 selection "droplet", drawn in a view stacked above the tab bar.
 * <p>
 * At rest it's a soft capsule behind the selected tab. When pressed it swells within the pill
 * as clear glass; dragging glides it across the tabs (stretching with speed)
 * and releasing snaps it to the nearest tab and opens it. Plain taps, double taps and
 * long presses go to the real tab bar untouched.
 */
@SuppressLint({"NewApi", "ViewConstructor"})
final class LiquidGlassLens extends View {

    private static final String LENS_SHADER =
            "uniform shader content;\n" +
            "uniform float2 center;\n" +
            "uniform float2 halfSize;\n" +
            "uniform float radius;\n" +
            "uniform float mag;\n" +
            "uniform float bezel;\n" +
            "uniform float strength;\n" +
            "uniform float dark;\n" +
            "uniform float dispersion;\n" +
            "uniform half4 wash;\n" +   // rgb the glass is washed towards, by alpha

            "float sdRoundRect(float2 p, float2 b, float r) {\n" +
            "  float2 q = abs(p) - b + r;\n" +
            "  return length(max(q, 0.0)) + min(max(q.x, q.y), 0.0) - r;\n" +
            "}\n" +

            "half4 main(float2 coord) {\n" +
            "  float2 p = coord - center;\n" +
            "  float d = sdRoundRect(p, halfSize, radius);\n" +
            "  float coverage = clamp(0.5 - d, 0.0, 1.0);\n" +
            "  if (coverage <= 0.0) return half4(0.0);\n" +

            "  float e = 0.75;\n" +
            "  float2 n = float2(\n" +
            "    sdRoundRect(p + float2(e, 0.0), halfSize, radius) - sdRoundRect(p - float2(e, 0.0), halfSize, radius),\n" +
            "    sdRoundRect(p + float2(0.0, e), halfSize, radius) - sdRoundRect(p - float2(0.0, e), halfSize, radius));\n" +
            "  n = n / max(length(n), 1e-4);\n" +

            "  float t = clamp(1.0 + d / bezel, 0.0, 1.0);\n" +
            "  float bend = 1.0 - sqrt(max(1.0 - t * t, 0.0));\n" +
            // Bend the rim outwards like a thick convex droplet (mag scales the middle, 1 = none).
            "  float2 src = center + p / mag + n * bend * strength;\n" +
            // Red and blue split apart towards the rim, like the dispersion of thick glass.
            "  float2 fringe = n * bend * dispersion;\n" +

            "  half4 col;\n" +
            // Two taps per channel so a wide split reads as a smooth fringe, not a double image.
            "  col.r = 0.5 * (content.eval(src + fringe).r + content.eval(src + fringe * 0.5).r);\n" +
            "  col.g = content.eval(src).g;\n" +
            "  col.b = 0.5 * (content.eval(src - fringe).b + content.eval(src - fringe * 0.5).b);\n" +
            "  col.a = 1.0;\n" +

            "  col.rgb = mix(col.rgb, wash.rgb, wash.a);\n" +

            "  float2 light = normalize(float2(-0.45, -0.9));\n" +
            "  float spec = pow(max(dot(n, light), 0.0), 2.0) + 0.5 * pow(max(dot(n, -light), 0.0), 2.0);\n" +
            "  float rim = smoothstep(0.5, 1.0, t);\n" +
            "  col.rgb += half3(rim * spec * mix(0.65, 0.4, dark));\n" +
            // Darker lower inner edge gives the droplet some volume.
            "  float lower = smoothstep(0.0, halfSize.y, p.y) * rim;\n" +
            "  col.rgb -= half3(lower * 0.08);\n" +

            "  return clamp(col, 0.0, 1.0) * coverage;\n" +
            "}\n";

    /**
     * The southstar21 style drop: Kyant0/AndroidLiquidGlass's lens (Apache-2.0), refraction with
     * seven-tap dispersion as in its RoundedRectRefractionWithDispersion shader, then its
     * surface darkening, inner shadow and 45 degree highlight.
     */
    private static final String DROP_SHADER =
            "uniform shader content;\n" +
            "uniform float2 center;\n" +
            "uniform float2 halfSize;\n" +
            "uniform float radius;\n" +
            "uniform float mag;\n" +
            "uniform float band;\n" +                // refractionHeight
            "uniform float amount;\n" +              // refractionAmount: positive samples outside the edge, negative inside
            "uniform float chromaticAberration;\n" +
            "uniform float darken;\n" +
            "uniform float innerRadius;\n" +
            "uniform float innerAlpha;\n" +
            "uniform float highlightWidth;\n" +
            "uniform float highlight;\n" +

            "float sdRoundedRect(float2 coord, float2 halfSize, float radius) {\n" +
            "  float2 cornerCoord = abs(coord) - (halfSize - float2(radius));\n" +
            "  float outside = length(max(cornerCoord, 0.0)) - radius;\n" +
            "  float inside = min(max(cornerCoord.x, cornerCoord.y), 0.0);\n" +
            "  return outside + inside;\n" +
            "}\n" +

            // As Kyant's, but never zero length: on the drop's center row (coord.y == 0) Kyant's
            // normalizes a zero vector and sign(0) is 0, and the NaN drew a black line.
            "float2 gradSdRoundedRect(float2 coord, float2 halfSize, float radius) {\n" +
            "  float2 s = float2(coord.x < 0.0 ? -1.0 : 1.0, coord.y < 0.0 ? -1.0 : 1.0);\n" +
            "  float2 cornerCoord = abs(coord) - (halfSize - float2(radius));\n" +
            "  float2 outside = max(cornerCoord, 0.0);\n" +
            "  float len = length(outside);\n" +
            "  if ((cornerCoord.x >= 0.0 || cornerCoord.y >= 0.0) && len > 1e-4) {\n" +
            "    return s * (outside / len);\n" +
            "  }\n" +
            "  float gradX = step(cornerCoord.y, cornerCoord.x);\n" +
            "  return s * float2(gradX, 1.0 - gradX);\n" +
            "}\n" +

            "float circleMap(float x) {\n" +
            "  return 1.0 - sqrt(1.0 - x * x);\n" +
            "}\n" +

            "half4 main(float2 coord) {\n" +
            "  float2 c = coord - center;\n" +
            "  float sd = sdRoundedRect(c, halfSize, radius);\n" +
            "  float coverage = clamp(0.5 - sd, 0.0, 1.0);\n" +
            "  if (coverage <= 0.0) return half4(0.0);\n" +
            "  float2 base = center + c / mag;\n" +
            "  float gradRadius = min(radius * 1.5, min(halfSize.x, halfSize.y));\n" +
            "  float2 grad = normalize(gradSdRoundedRect(c, halfSize, gradRadius));\n" +

            "  half4 color = half4(0.0);\n" +
            "  if (-sd >= band) {\n" +
            "    color = content.eval(base);\n" +
            "  } else {\n" +
            "    float d = circleMap(1.0 - -min(sd, 0.0) / band) * amount;\n" +
            "    float2 refracted = base + d * grad;\n" +
            "    float intensity = chromaticAberration * ((c.x * c.y) / (halfSize.x * halfSize.y));\n" +
            "    float2 dispersed = d * grad * intensity;\n" +
            "    half4 red = content.eval(refracted + dispersed);\n" +
            "    color.r += red.r / 3.5; color.a += red.a / 7.0;\n" +
            "    half4 orange = content.eval(refracted + dispersed * (2.0 / 3.0));\n" +
            "    color.r += orange.r / 3.5; color.g += orange.g / 7.0; color.a += orange.a / 7.0;\n" +
            "    half4 yellow = content.eval(refracted + dispersed * (1.0 / 3.0));\n" +
            "    color.r += yellow.r / 3.5; color.g += yellow.g / 3.5; color.a += yellow.a / 7.0;\n" +
            "    half4 green = content.eval(refracted);\n" +
            "    color.g += green.g / 3.5; color.a += green.a / 7.0;\n" +
            "    half4 cyan = content.eval(refracted - dispersed * (1.0 / 3.0));\n" +
            "    color.g += cyan.g / 3.5; color.b += cyan.b / 3.0; color.a += cyan.a / 7.0;\n" +
            "    half4 blue = content.eval(refracted - dispersed * (2.0 / 3.0));\n" +
            "    color.b += blue.b / 3.0; color.a += blue.a / 7.0;\n" +
            "    half4 purple = content.eval(refracted - dispersed);\n" +
            "    color.r += purple.r / 7.0; color.b += purple.b / 3.0; color.a += purple.a / 7.0;\n" +
            "  }\n" +

            // Surface: a touch of black over the glass.
            "  color.rgb = mix(color.rgb, half3(0.0), darken);\n" +
            // Inner shadow, darkest at the edge.
            "  float inner = 1.0 - smoothstep(0.0, max(innerRadius, 1.0), -sd);\n" +
            "  color.rgb *= 1.0 - innerAlpha * inner;\n" +
            // Highlight: white, brightest where the edge faces 45 degrees (top left, bottom right).
            "  float lit = abs(dot(gradSdRoundedRect(c, halfSize, gradRadius), float2(0.70710678)));\n" +
            "  float rim = 1.0 - smoothstep(0.0, max(highlightWidth, 1.0), -sd);\n" +
            "  color.rgb += half3(highlight * lit * rim);\n" +

            "  return clamp(color, 0.0, 1.0) * coverage;\n" +
            "}\n";

    private final ViewGroup bar;
    private final LiquidGlassDrawable glass;
    private final NavbarStyle.Source styleSource;
    private final float density;
    /**
     * How much taller this view is than the bar, half above it and half below, so a swollen
     * drop poking out of the bar is drawn in full whatever the parent clips.
     */
    final int extraTop;
    private final int touchSlop;

    private final Spring x = new Spring(420f, 0.68f, 0.3f);
    private final Spring width = new Spring(520f, 0.75f, 0.002f);
    private final Spring press = new Spring(560f, 0.62f, 0.002f);
    /** 0 = full bar, 1 = shrunk while scrolling. */
    private final Spring minimize = new Spring(260f, 0.86f, 0.002f);
    private float appliedMinimize = -1f;
    /** iOS style: 1 while a finger is on the bar, for its zoom and liquid glass. */
    private final Spring hold = new Spring(300f, 0.6f, 0.002f);
    /** iOS style: how far the bar follows a drag past its ends, in px; springs back with a wobble. */
    private final Spring rubber = new Spring(380f, 0.55f, 0.3f);
    private float appliedSwell = 1f, appliedLean = 0f;
    private long lastFrame;

    // region Southstar21 style state (after Kyant0/AndroidLiquidGlass's LiquidBottomTabs, Apache-2.0)

    /** How long a released press waits for Instagram to select something before going back. */
    // Instagram can take a few hundred ms to switch tabs (it builds the new screen first). With
    // a shorter wait the selection gave up, went back, then forward again once the switch came.
    private static final long RETURN_GRACE_NS = 700_000_000L;

    /** Whether the southstar21 style is on, read once per frame in {@link #sync()}. */
    private boolean southstar21;
    private boolean styleApplied;
    /** The drop's own jelly swell, underdamped so it wobbles a little. */
    private final Spring dropScaleX = new Spring(250f, 0.6f, 0.001f);
    private final Spring dropScaleY = new Spring(250f, 0.7f, 0.001f);
    /** Drag velocity (bar widths per second / 10), smoothed: squashes and stretches the drop. */
    private final Spring squash = new Spring(300f, 0.5f, 0.0005f);
    /** How far the finger dragged, in px: the bar leans up to 4dp that way. */
    private final Spring lean = new Spring(300f, 1f, 0.5f);
    /** The glow lighting the bar from under a press on the selection. */
    private final Spring glow = new Spring(300f, 0.5f, 0.002f);
    /** Deflate once the drop has (nearly) arrived where it's going. */
    private boolean settleOnArrival;
    /** A tab chosen by dragging, opened once the drop has nearly arrived on it. */
    private View pendingClick;
    /** When a released press goes back to the selected tab if nothing was selected; 0 = never. */
    private long returnAt;
    /** Drop position minus finger position at the start of a press: drags move it relatively. */
    private float dragAnchor;
    private float dragLastX;
    /** The tab under the drop's center, for a tick each time it crosses onto another one. */
    private View overTab;

    // endregion

    /** Set when this view accepted a touch-down, read by {@link TouchRouter}. */
    boolean claimedDown;
    private boolean tracking;
    private boolean dragging;
    private View lastSelected;
    private View dragTarget;
    /** The tab a press landed on, to tell a tap on another tab from one on the selected tab. */
    private View pressedTab;

    private final RectF pill = new RectF();
    private final RectF lens = new RectF();
    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint rim = new Paint(Paint.ANTI_ALIAS_FLAG);

    private RenderNode scene;
    private RenderNode clip;
    private RuntimeShader shader;
    private RuntimeShader dropShader;
    private boolean dropShaderFailed;

    LiquidGlassLens(Context context, ViewGroup bar, LiquidGlassDrawable glass, float density,
                    NavbarStyle.Source styleSource) {
        super(context);
        this.styleSource = styleSource;
        this.bar = bar;
        this.glass = glass;
        this.density = density;
        this.extraTop = Math.round(32 * density);
        this.touchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        setWillNotDraw(false);
        rim.setStyle(Paint.Style.STROKE);
        rim.setStrokeWidth(Math.max(1f, 0.8f * density));
    }

    // region Touch

    /**
     * The lens is never the touch target: it only notes that a down landed on the pill with
     * nothing covering it, then lets the event fall through to Instagram's real tab buttons.
     * {@link TouchRouter} drives the rest through the methods below.
     */
    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (event.getActionMasked() == MotionEvent.ACTION_DOWN) {
            updatePill();
            claimedDown = pill.contains(event.getX(), event.getY());
        }
        return false;
    }

    /** Finger down on the pill: pop the lens towards it. */
    void beginPress(float localX) {
        tracking = true;
        dragging = false;
        dragTarget = null;
        pressedTab = tabAt(localX);
        returnAt = 0;
        press.target = 1f;
        if (southstar21) {
            // The drop glides onto the pressed tab and swells there; a drag then moves it by
            // as much as the finger moves, not to where the finger is.
            View tab = tabAt(localX);
            x.target = tab != null ? centerOf(tab) : clampX(localX);
            dragAnchor = x.target - localX;
            dragLastX = localX;
            settleOnArrival = false;
            pendingClick = null;
            returnAt = 0;
            setDropScale(style().dropScale);
            // The glass lights up when the selection itself is pressed.
            glow.target = tab != null && tab == lastSelected ? 1f : 0f;
        } else {
            x.target = clampX(localX);
        }
        startAnimating();
    }

    /** Whether a move to {@code localX} should turn the gesture into a lens drag. */
    boolean shouldStartDrag(float downLocalX, float localX) {
        return Math.abs(localX - downLocalX) > touchSlop;
    }

    void dragTo(float localX) {
        dragging = true;
        if (southstar21) {
            x.target = clampX(dragAnchor + localX);
            lean.snap(lean.value + localX - dragLastX);
            dragLastX = localX;
            // Crossing ticks come from step(), for every move of the drop.
            startAnimating();
            return;
        }
        dragX = localX;
        followFinger();
        View target = tabAt(localX);
        // A light tick each time the droplet crosses into another tab.
        if (dragTarget != null && target != dragTarget && style().haptics) {
            performHapticFeedback(Build.VERSION.SDK_INT >= 34
                    ? HapticFeedbackConstants.SEGMENT_FREQUENT_TICK
                    : HapticFeedbackConstants.CLOCK_TICK);
        }
        dragTarget = target;
        startAnimating();
    }

    /** Finger lifted after a drag: snap onto the nearest tab and open it. */
    void endDrag(float localX) {
        if (southstar21) {
            // Snap to the tab nearest the drop and open it once the drop has nearly arrived, so
            // Instagram's page switch doesn't stutter the drop on its way. The last crossing
            // tick is the landing; no extra confirm.
            View target = tabAt(x.target);
            release();
            if (target != null) {
                x.target = centerOf(target);
                pendingClick = target;
                returnAt = 0;
            }
            return;
        }
        View target = dragTarget != null ? dragTarget : tabAt(localX);
        release();
        if (target != null) {
            x.target = centerOf(target);
            // Instagram is about to select it: wait for that rather than heading back.
            returnAt = target == lastSelected ? 0 : System.nanoTime() + RETURN_GRACE_NS;
            if (style().haptics) {
                performHapticFeedback(Build.VERSION.SDK_INT >= Build.VERSION_CODES.R
                        ? HapticFeedbackConstants.CONFIRM
                        : HapticFeedbackConstants.VIRTUAL_KEY);
            }
            target.performClick();
        }
    }

    /** Tap finished or gesture cancelled: Instagram handles the tap, the lens settles back. */
    void release() {
        tracking = false;
        dragging = false;
        if (southstar21) {
            // Stays swollen until it arrives, then deflates (see step()). If the press didn't
            // select anything, it goes back after a short grace, which a tap's selection beats.
            settleOnArrival = true;
            glow.target = 0f;
            lean.target = 0f;
            if (lastSelected != null && Math.abs(x.target - centerOf(lastSelected)) > 0.5f) {
                returnAt = System.nanoTime() + RETURN_GRACE_NS;
            }
            startAnimating();
            return;
        }
        press.target = 0f;
        // The bar springs back from a rubber band pull, with a little wobble.
        rubber.target = 0f;
        // A tap on another tab: Instagram is about to select it, so stay put and let sync()
        // glide there when it does; go back only if nothing was selected after a while (a long
        // press, a cancel). Otherwise glide back from under the finger to the selected tab.
        if (lastSelected != null) {
            if (pressedTab != null && pressedTab != lastSelected) {
                returnAt = System.nanoTime() + RETURN_GRACE_NS;
            } else {
                x.target = centerOf(lastSelected);
            }
        }
        startAnimating();
    }

    boolean isDragging() {
        return dragging;
    }

    /**
     * Content was scrolled by a finger moving {@code dy} px (negative = content scrolls down).
     * Like iOS Instagram, scrolling down shrinks the bar and scrolling back up restores it.
     */
    void onContentScroll(float dy) {
        float target = dy < 0 && style().shrinkOnScroll ? 1f : 0f;
        if (minimize.target == target) return;
        minimize.target = target;
        startAnimating();
    }

    void expand() {
        if (minimize.target == 0f) return;
        minimize.target = 0f;
        startAnimating();
    }

    /** This view's x of the center of the {@code index}th visible tab, or NaN if there's none. */
    float tabCenterX(int index) {
        int n = 0;
        for (int i = 0; i < bar.getChildCount(); i++) {
            View child = bar.getChildAt(i);
            if (child.getVisibility() != VISIBLE) continue;
            if (n++ == index) return centerOf(child);
        }
        return Float.NaN;
    }

    private View tabAt(float lensX) {
        float bx = lensX + getLeft() - bar.getLeft();
        View best = null;
        float bestDist = Float.MAX_VALUE;
        for (int i = 0; i < bar.getChildCount(); i++) {
            View child = bar.getChildAt(i);
            if (child.getVisibility() != VISIBLE) continue;
            float dist = Math.abs(barCenterOf(child) - bx);
            if (dist < bestDist) {
                bestDist = dist;
                best = child;
            }
        }
        return best;
    }

    private float centerOf(View tab) {
        return barCenterOf(tab) + bar.getLeft() - getLeft();
    }

    /** Horizontal center of a tab in the bar's coordinates, including its shrink transform. */
    private static float barCenterOf(View tab) {
        return tab.getLeft() + tab.getPivotX() + (tab.getWidth() / 2f - tab.getPivotX()) * tab.getScaleX()
                + tab.getTranslationX();
    }

    /** iOS style: where the finger is during a drag, in this view's x. */
    private float dragX;

    /**
     * iOS style, during a drag: puts the capsule under the finger, kept inside the bar, and pulls
     * the bar after a finger past its ends, like iOS's rubber band. Runs on every move and every
     * frame: the bar keeps sliding between moves, and the capsule must slide with it rather
     * than stay where the bar was (it looked pulled the other way).
     */
    private void followFinger() {
        float clamped = clampX(dragX);
        // The clamp already includes the bar's current offset; add it back to get how far
        // past the bar's resting end the finger is.
        rubber.target = rubberBand(dragX - clamped + appliedLean);
        // Glides there on its spring, even on a fast swipe; applyMinimize() carries it along
        // as the bar itself moves.
        x.target = clamped;
    }

    /**
     * iOS's rubber band: how far the bar moves for a finger {@code overshoot} px past its end.
     * About 14dp at 50dp past, never more than 28dp.
     */
    private float rubberBand(float overshoot) {
        float limit = 28f * density;
        float o = Math.abs(overshoot);
        if (o < 0.5f) return 0f;
        return Math.signum(overshoot) * limit * (1f - 1f / (o * 0.55f / limit + 1f));
    }

    private float clampX(float value) {
        float half = currentRestWidth() * 0.5f;
        return Math.max(pill.left + half, Math.min(pill.right - half, value));
    }

    // endregion

    // region Layout sync

    /** Called by the controller every pre-draw to follow the bar around. */
    void sync() {
        applyStyle(style().southstar21);
        if (getVisibility() != bar.getVisibility()) setVisibility(bar.getVisibility());
        // Centered on the bar, however the parent lays the taller view out.
        float ty = bar.getTranslationY() + bar.getTop() - extraTop / 2f - getTop();
        if (getTranslationY() != ty) setTranslationY(ty);
        if (getAlpha() != bar.getAlpha()) setAlpha(bar.getAlpha());

        View selected = selectedTab();
        // While Instagram switches tabs there can be a frame with none selected. Keep the lens
        // where it is instead of hiding it and then snapping it onto the new tab.
        if (selected == null && lastSelected != null && lastSelected.getParent() == bar
                && lastSelected.getVisibility() != GONE) {
            selected = lastSelected;
        }
        if (selected != lastSelected && lastSelected != null) expand();
        applyMinimize(selected);
        if (southstar21) glass.setGlow(glow.value, x.value + getLeft() - bar.getLeft());
        if (selected != lastSelected) {
            if (lastSelected == null || selected == null) {
                if (selected != null) x.snap(centerOf(selected));
            } else if (!dragging) {
                float c = centerOf(selected);
                x.target = c;
                returnAt = 0;
                if (southstar21) {
                    // The drop swells, travels and deflates on
                    // arrival. Not again if a tap already brought it there.
                    if (!tracking && Math.abs(x.value - c) > settleDistance()) {
                        press.target = 1f;
                        setDropScale(style().dropScale);
                        settleOnArrival = true;
                    }
                } else if (!tracking) {
                    // Short pop while sliding to a tab chosen some other way (e.g. swipe paging).
                    press.kick(2.5f);
                }
            }
            lastSelected = selected;
            startAnimating();
        } else if (selected != null && !tracking && returnAt == 0 && !(southstar21 && pendingClick != null)) {
            // (In the southstar21 style a released drop waits on the tab it went to, for the
            // click it's about to send or for Instagram to select it, before following again.)
            // Follow the tab when the bar moves under it (layout, shrinking while scrolling).
            // A settled lens stays locked to the tab; one still gliding is only retargeted, so
            // it never jumps mid-animation.
            float c = centerOf(selected);
            boolean settled = Math.abs(x.value - x.target) < 2 * density;
            if (settled) {
                if (Math.abs(x.value - c) > 0.5f) x.snap(c);
            } else if (Math.abs(x.target - c) > 0.5f) {
                x.target = c;
                startAnimating();
            }
        }
        invalidate();
    }

    /**
     * Scales the whole bar down around its bottom center while content scrolls, like iOS
     * Instagram: the pill and all five tabs shrink together and stay tappable.
     */
    private void applyMinimize(View selected) {
        float m = Math.max(0f, Math.min(1f, minimize.value));
        float swell = 1f;
        float leanPx = 0f;
        if (southstar21) {
            // While the drop is pressed the bar shrinks back by 20dp across, so the drop stands
            // out from it, and leans up to 4dp with a drag.
            float width = Math.max(1f, glass.getFullPill().width());
            swell = 1f - 20f * density / width * Math.max(0f, Math.min(1f, press.value));
            float f = Math.max(-1f, Math.min(1f, lean.value / width));
            float a = Math.abs(f);
            leanPx = 4f * density * Math.signum(f) * (1f - (1f - a) * (1f - a));
            glass.setLiquid(0f);
        } else {
            // iOS: while a finger is down the bar zooms in a little (10dp across) and its glass
            // turns more liquid (see LiquidGlassDrawable.setLiquid).
            float width = Math.max(1f, glass.getFullPill().width());
            float h = Math.max(0f, hold.value);
            swell = 1f + 10f * density / width * h;
            glass.setLiquid(Math.min(1.2f, h));
            leanPx = Math.round(rubber.value * 2f) / 2f;
            // The capsule rides along with the bar: shift it by exactly as much as the bar
            // moves, so it neither lags behind the bar nor has to jump to catch up.
            if (leanPx != appliedLean) x.value += leanPx - appliedLean;
        }
        boolean transformed = swell != 1f || leanPx != 0f || appliedSwell != 1f || appliedLean != 0f;
        if (m == appliedMinimize && swell == appliedSwell && leanPx == appliedLean && selected == lastSelected) {
            return;
        }
        appliedMinimize = m;
        appliedSwell = swell;
        appliedLean = leanPx;

        glass.setMinimize(m);
        glass.setPaneTransform(swell, leanPx);
        bar.invalidateOutline();

        RectF full = glass.getFullPill();
        float scale = glass.currentScale();
        // The swell is around the shrunk pill's center, half its height above the shared pivot.
        float swellDy = full.height() * scale / 2f * (swell - 1f);
        for (int i = 0; i < bar.getChildCount(); i++) {
            View child = bar.getChildAt(i);
            // Shared pivot so the tabs keep their spacing relative to the shrinking pill.
            child.setPivotX(full.centerX() - child.getLeft());
            child.setPivotY(full.bottom - child.getTop());
            child.setScaleX(scale * swell);
            child.setScaleY(scale * swell);
            // Only touch the tabs' translation while the southstar21 style moves them.
            if (transformed) {
                child.setTranslationX(leanPx);
                child.setTranslationY(swellDy);
            }
        }
    }

    /** Switches the springs between the iOS style and the southstar21 style. */
    private void applyStyle(boolean on) {
        if (styleApplied && on == southstar21) return;
        styleApplied = true;
        southstar21 = on;
        // The drop moves on a stiff, critically damped spring; the iOS one overshoots a little.
        x.tune(on ? 1000f : 420f, on ? 1f : 0.68f);
        press.tune(on ? 1000f : 560f, on ? 1f : 0.62f);
        minimize.tune(on ? 420f : 260f, 0.86f);
        dropScaleX.snap(1f);
        dropScaleY.snap(1f);
        squash.snap(0f);
        lean.snap(0f);
        glow.snap(0f);
        settleOnArrival = false;
        pendingClick = null;
        returnAt = 0;
        overTab = null;
        if (!on) press.target = tracking ? 1f : 0f;
        glass.setGlow(0f, 0f);
        glass.setSouthstar21(on);
        startAnimating();
    }

    private void setDropScale(float scale) {
        dropScaleX.target = scale;
        dropScaleY.target = scale;
    }

    /** Distance between the first and last tab centers. */
    private float tabRange() {
        float min = Float.MAX_VALUE, max = -Float.MAX_VALUE;
        for (int i = 0; i < bar.getChildCount(); i++) {
            View child = bar.getChildAt(i);
            if (child.getVisibility() != VISIBLE) continue;
            float c = barCenterOf(child);
            min = Math.min(min, c);
            max = Math.max(max, c);
        }
        return max > min ? max - min : Math.max(1f, pill.width());
    }

    private int visibleTabCount() {
        int n = 0;
        for (int i = 0; i < bar.getChildCount(); i++) {
            if (bar.getChildAt(i).getVisibility() == VISIBLE) n++;
        }
        return n;
    }

    /** How close counts as arrived: within 2.5% of the bar's range. */
    private float settleDistance() {
        return Math.max(density, 0.025f * tabRange());
    }

    /**
     * The selected tab. Right after a tap Instagram can briefly mark both the old and the new
     * tab selected, so prefer the one that wasn't selected before.
     */
    private View selectedTab() {
        View previous = null;
        for (int i = 0; i < bar.getChildCount(); i++) {
            View child = bar.getChildAt(i);
            if (child.getVisibility() == GONE || !(child.isSelected() || child.isActivated())) continue;
            if (child != lastSelected) return child;
            previous = child;
        }
        return previous;
    }

    private void updatePill() {
        RectF p = glass.getPill();
        float dx = bar.getLeft() - getLeft();
        float dy = bar.getTop() + bar.getTranslationY() - getTop() - getTranslationY();
        pill.set(p.left + dx, p.top + dy, p.right + dx, p.bottom + dy);
    }

    private float currentRestWidth() {
        View ref = lastSelected != null ? lastSelected : (bar.getChildCount() > 0 ? bar.getChildAt(0) : null);
        float tab = ref != null ? ref.getWidth() * ref.getScaleX() : pill.height();
        // iOS Instagram's selected capsule is about 10dp wider than its tab.
        return Math.min(tab + style().selectionWidthDp * density, pill.width());
    }

    // endregion

    // region Animation

    private boolean isAnimating() {
        return returnAt != 0 || !x.isAtRest() || !press.isAtRest() || !width.isAtRest() || !minimize.isAtRest() || !hold.isAtRest()
                || !rubber.isAtRest()
                || southstar21 && (!dropScaleX.isAtRest() || !dropScaleY.isAtRest() || !squash.isAtRest()
                || !lean.isAtRest() || !glow.isAtRest() || settleOnArrival || pendingClick != null || returnAt != 0);
    }

    private void startAnimating() {
        lastFrame = 0;
        postInvalidateOnAnimation();
    }

    private void step() {
        long now = System.nanoTime();
        float dt = lastFrame == 0 ? 1f / 120f : Math.min((now - lastFrame) / 1e9f, 1f / 30f);
        lastFrame = now;
        x.step(dt);
        press.step(dt);
        minimize.step(dt);
        // iOS: the bar's zoom and liquid glass follow the finger, softly and a little springy.
        hold.target = tracking && !southstar21 ? 1f : 0f;
        hold.step(dt);
        rubber.step(dt);
        if (dragging && !southstar21) followFinger();
        if (!southstar21 && returnAt != 0 && now >= returnAt) {
            // Nothing got selected: back to the selected tab.
            returnAt = 0;
            if (!tracking && lastSelected != null) x.target = centerOf(lastSelected);
        }
        if (southstar21) stepSouthstar21(dt, now);
        // Stretch along the direction of travel, like a droplet being dragged.
        width.target = 1f + Math.min(Math.abs(x.velocity) / (pill.width() * 2.2f), 0.45f);
        width.step(dt);
        if (isAnimating() || tracking) postInvalidateOnAnimation();
    }

    private void stepSouthstar21(float dt, long now) {
        float range = tabRange();
        // Only a drag stretches the drop; glides and taps move it without.
        squash.target = dragging ? x.velocity / range / 10f : 0f;
        squash.step(dt);
        dropScaleX.step(dt);
        dropScaleY.step(dt);
        lean.step(dt);
        glow.step(dt);

        float distance = Math.abs(x.value - x.target);
        if (pendingClick != null) {
            int tabs = Math.max(2, visibleTabCount());
            if (distance < 0.2f * range / (tabs - 1)) {
                View target = pendingClick;
                pendingClick = null;
                // Keep waiting until Instagram selects it, or the selected tab (still the old one
                // for a few hundred ms) pulls the drop back before the switch brings it forward.
                if (target != lastSelected) returnAt = now + RETURN_GRACE_NS;
                post(target::performClick);
            }
        }
        if (returnAt != 0 && now >= returnAt) {
            returnAt = 0;
            if (!tracking && lastSelected != null) {
                // Nothing got selected: swell, glide back and deflate there.
                x.target = centerOf(lastSelected);
                press.target = 1f;
                setDropScale(style().dropScale);
                settleOnArrival = true;
                distance = Math.abs(x.value - x.target);
            }
        }
        // Deflates on arrival, also while waiting for Instagram to select the tab (a return
        // trip swells it again).
        if (settleOnArrival && !tracking && distance < settleDistance()) {
            settleOnArrival = false;
            press.target = 0f;
            setDropScale(1f);
            squash.target = 0f;
        }

        // A tick each time the drop's center crosses onto another tab, dragged or gliding.
        View over = tabAt(x.value);
        if (overTab != null && over != null && over != overTab && style().haptics) {
            performHapticFeedback(Build.VERSION.SDK_INT >= 34
                    ? HapticFeedbackConstants.SEGMENT_FREQUENT_TICK
                    : HapticFeedbackConstants.CLOCK_TICK);
        }
        overTab = over;
    }

    // endregion

    // region Drawing

    @Override
    protected void onDraw(Canvas canvas) {
        if (bar.getVisibility() != VISIBLE || lastSelected == null && !tracking) return;
        updatePill();
        if (pill.isEmpty()) return;
        step();
        if (southstar21) {
            drawDrop(canvas);
            return;
        }

        float p = Math.max(0f, press.value);
        // iOS Instagram's indicator stays capsule sized: it only swells a touch while moving.
        float scale = glass.currentScale();
        // iOS Instagram's capsule sits ~4.5dp inside the bar.
        float inset = style().selectionInsetDp * density * scale;
        float maxW = pill.width() - 2 * inset;
        float maxH = pill.height() - 2 * inset;
        float restW = currentRestWidth();
        float restH = pill.height() - 2 * inset;
        float pressedW = restW * 1.05f;

        // Stock iOS keeps the capsule's size and shape while it moves (it only scales with the
        // bar, which zooms in a little while pressed). With "Glass while dragging" it swells a
        // touch and stretches with speed, like a droplet.
        boolean droplet = style().glassWhileDragging;
        float stretch = droplet ? width.value : 1f;
        float grow = droplet ? Math.min(p, 1f) : 0f;
        float w = Math.min(lerp(restW, pressedW, grow) * stretch, maxW);
        float h = Math.min(lerp(restH, maxH, grow) / (float) Math.sqrt(stretch), maxH);
        float cx = Math.max(pill.left + inset + w / 2f, Math.min(pill.right - inset - w / 2f, x.value));
        float cy = pill.centerY();
        lens.set(cx - w / 2f, cy - h / 2f, cx + w / 2f, cy + h / 2f);
        float r = h / 2f * style().roundness;

        boolean dark = glass.isDark();

        // Grey resting capsule (16% black, 21% white on dark), fading into clear glass while moving.
        // Stock iOS keeps the plain grey capsule while it's pressed and dragged. Only with
        // "Glass while dragging" on does it fade into clear glass with a rim and fringes.
        boolean glassy = style().glassWhileDragging;
        float restAlpha = glassy ? 1f - Math.min(1f, p * 1.6f) : 1f;
        if (restAlpha > 0f) {
            if (style().glassyPill) {
                drawGlassyCapsule(canvas, r, dark, restAlpha);
            } else {
                // iOS Instagram: white 21% on dark, black 16% on light.
                int a = shadeAlpha(dark, restAlpha);
                fill.setColor(dark ? Color.argb(a, 0xFF, 0xFF, 0xFF) : Color.argb(a, 0, 0, 0));
                canvas.drawRoundRect(lens, r, r, fill);
            }
        }

        if (!glassy) return;
        if (p > 0.02f && canvas.isHardwareAccelerated() && Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            drawLens(canvas, r, p, dark);
        } else if (p > 0.02f) {
            fill.setColor(dark ? Color.argb(Math.round(0x40 * p), 0xFF, 0xFF, 0xFF)
                    : Color.argb(Math.round(0xB0 * p), 0xFF, 0xFF, 0xFF));
            canvas.drawRoundRect(lens, r, r, fill);
        }

        if (p > 0.02f) {
            rim.setShader(new LinearGradient(lens.left, lens.top, lens.left + lens.width() * 0.4f, lens.bottom,
                    new int[]{Color.argb(Math.round(0xE0 * p), 0xFF, 0xFF, 0xFF),
                            Color.argb(Math.round(0x10 * p), 0xFF, 0xFF, 0xFF),
                            Color.argb(Math.round(0x50 * p), 0xFF, 0xFF, 0xFF)},
                    new float[]{0f, 0.55f, 1f}, Shader.TileMode.CLAMP));
            canvas.drawRoundRect(lens, r, r, rim);
        }
    }

    private final Paint dropShadow = new Paint(Paint.ANTI_ALIAS_FLAG);

    /**
     * The southstar21 style selection: a flat grey pill at rest that, pressed,
     * becomes a drop of clear glass about 1.4 times its size, poking out of the bar, magnifying
     * the tab under it with a strong bend and colored fringes, and squashing as it's dragged.
     */
    private void drawDrop(Canvas canvas) {
        float p = Math.max(0f, Math.min(1f, press.value));
        float inset = style().selectionInsetDp * density * glass.currentScale();
        float restW = currentRestWidth();
        float restH = pill.height() - 2 * inset;
        // As in Kyant's LiquidBottomTabs: wider and flatter one way, narrower and taller
        // the other, from the drag velocity.
        float v = squash.value;
        float sx = dropScaleX.value / (1f - clamp(v * 0.75f, -0.2f, 0.2f));
        float sy = dropScaleY.value * (1f - clamp(v * 0.25f, -0.2f, 0.2f));
        float w = restW * sx;
        float h = restH * sy;
        float cx = x.value;
        float cy = pill.centerY();
        lens.set(cx - w / 2f, cy - h / 2f, cx + w / 2f, cy + h / 2f);
        float r = Math.min(w, h) / 2f * style().roundness;
        boolean dark = glass.isDark();

        if (p > 0.02f) {
            // A soft shadow under the lifted drop.
            dropShadow.setColor(Color.argb(Math.round(0x08 * p), 0, 0, 0));
            dropShadow.setShadowLayer(8f * density, 0f, 4f * density, Color.argb(Math.round(0x30 * p), 0, 0, 0));
            canvas.drawRoundRect(lens, r, r, dropShadow);
        }

        // At rest the selection is flat; nothing below runs until it opens.
        boolean open = p > 0.02f;
        // Fades in within a few frames of opening, then the sides stay fully 3D while it's open.
        float openAlpha = Math.min(1f, p * 3f);
        boolean shaded = canvas.isHardwareAccelerated() && Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU
                && !dropShaderFailed;
        if (open && shaded) {
            // Full-strength 3D sides the whole time it's open, at the drop's current size. The
            // middle magnifies up to 1.2x and darkens a touch (5%) as it swells.
            drawKyantDrop(canvas, r, p, dark, (dropScaleX.value + dropScaleY.value) / 2f, openAlpha);
        } else if (open) {
            fill.setColor(dark ? Color.argb(Math.round(0x40 * p), 0xFF, 0xFF, 0xFF)
                    : Color.argb(Math.round(0xB0 * p), 0xFF, 0xFF, 0xFF));
            canvas.drawRoundRect(lens, r, r, fill);
        }

        // At rest: iOS Instagram's grey selection (white 21% on dark, black 16% on light),
        // fading out over the glass as it opens.
        float rest = 1f - p;
        if (rest > 0.001f) {
            if (style().glassyPill) {
                drawGlassyCapsule(canvas, r, dark, rest);
            } else {
                int a = shadeAlpha(dark, rest);
                fill.setColor(dark ? Color.argb(a, 0xFF, 0xFF, 0xFF) : Color.argb(a, 0, 0, 0));
                canvas.drawRoundRect(lens, r, r, fill);
            }
        }

        // With the shader, Kyant's highlight is drawn inside it; otherwise a lit rim stroke.
        if (!open || shaded && !dropShaderFailed) return;
        rim.setShader(new LinearGradient(lens.left, lens.top, lens.left + lens.width() * 0.4f, lens.bottom,
                new int[]{Color.argb(Math.round(0xE0 * openAlpha), 0xFF, 0xFF, 0xFF),
                        Color.argb(Math.round(0x10 * openAlpha), 0xFF, 0xFF, 0xFF),
                        Color.argb(Math.round(0x50 * openAlpha), 0xFF, 0xFF, 0xFF)},
                new float[]{0f, 0.55f, 1f}, Shader.TileMode.CLAMP));
        canvas.drawRoundRect(lens, r, r, rim);
    }

    /**
     * The resting capsule's alpha: iOS Instagram's white 21% on dark or black 16% on light,
     * scaled by the Selection shade setting and by {@code fade}.
     */
    private int shadeAlpha(boolean dark, float fade) {
        float a = (dark ? 0x36 : 0x29) * style().selectionShade * fade;
        return Math.max(0, Math.min(255, Math.round(a)));
    }

    /** The customizable values for this bar right now. */
    private NavbarStyle style() {
        return styleSource.get();
    }

    private static float clamp(float v, float min, float max) {
        return Math.max(min, Math.min(max, v));
    }

    private final Paint glassyShadow = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint glassyBody = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint glassyGloss = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint glassyRim = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF gloss = new RectF();

    /**
     * The resting pill as a small piece of glass: a soft shadow under it, a body lit from above,
     * a gloss band over the upper half and a bright rim along the top edge.
     */
    private void drawGlassyCapsule(Canvas canvas, float r, boolean dark, float alpha) {
        // Shadow, slightly below the pill.
        glassyShadow.setColor(Color.argb(Math.round((dark ? 0x30 : 0x12) * alpha), 0, 0, 0));
        glassyShadow.setShadowLayer(4f * density, 0f, 1.5f * density,
                Color.argb(Math.round((dark ? 0x60 : 0x30) * alpha), 0, 0, 0));
        canvas.drawRoundRect(lens, r, r, glassyShadow);

        // Body: lighter at the top, a little darker at the bottom.
        int top = dark ? Color.argb(Math.round(0x48 * alpha), 0xFF, 0xFF, 0xFF)
                : Color.argb(Math.round(0x70 * alpha), 0xFF, 0xFF, 0xFF);
        int bottom = dark ? Color.argb(Math.round(0x14 * alpha), 0xFF, 0xFF, 0xFF)
                : Color.argb(Math.round(0x22 * alpha), 0, 0, 0);
        glassyBody.setShader(new LinearGradient(0, lens.top, 0, lens.bottom, top, bottom, Shader.TileMode.CLAMP));
        canvas.drawRoundRect(lens, r, r, glassyBody);

        // Gloss over the upper half.
        float inset = Math.min(r * 0.45f, 6f * density);
        gloss.set(lens.left + inset, lens.top + 1.5f * density, lens.right - inset, lens.centerY());
        float gr = gloss.height() / 2f;
        glassyGloss.setShader(new LinearGradient(0, gloss.top, 0, gloss.bottom,
                Color.argb(Math.round((dark ? 0x38 : 0x60) * alpha), 0xFF, 0xFF, 0xFF),
                Color.argb(0, 0xFF, 0xFF, 0xFF), Shader.TileMode.CLAMP));
        canvas.drawRoundRect(gloss, gr, gr, glassyGloss);

        // Rim: bright along the top, faint in the middle, a soft glint at the bottom.
        glassyRim.setStyle(Paint.Style.STROKE);
        glassyRim.setStrokeWidth(Math.max(1f, 1f * density));
        glassyRim.setShader(new LinearGradient(0, lens.top, 0, lens.bottom,
                new int[]{Color.argb(Math.round((dark ? 0x90 : 0xE0) * alpha), 0xFF, 0xFF, 0xFF),
                        Color.argb(Math.round(0x10 * alpha), 0xFF, 0xFF, 0xFF),
                        Color.argb(Math.round((dark ? 0x40 : 0x70) * alpha), 0xFF, 0xFF, 0xFF)},
                new float[]{0f, 0.55f, 1f}, Shader.TileMode.CLAMP));
        float half = glassyRim.getStrokeWidth() / 2f;
        gloss.set(lens.left + half, lens.top + half, lens.right - half, lens.bottom - half);
        canvas.drawRoundRect(gloss, r - half, r - half, glassyRim);
    }

    /** Records everything up to and including the tab bar under the lens, then draws it as glass. */
    private void drawLens(Canvas canvas, float r, float p, boolean dark) {
        // iOS style: no magnification (iOS Instagram's indicator doesn't zoom like the App
        // Store's), a thin outward bend, the glass washed towards white and a red/blue split
        // of up to 5dp along the rim.
        float strength = 6f * density * p;
        float dispersion = 5f * density * p * style().edgeColors;
        if (shader == null) shader = new RuntimeShader(LENS_SHADER);
        shader.setFloatUniform("mag", 1f);
        shader.setFloatUniform("bezel", Math.max(1f, Math.min(r, 16f * density)));
        shader.setFloatUniform("strength", strength);
        shader.setFloatUniform("wash", dark ? 0.85f : 1f, dark ? 0.85f : 1f, dark ? 0.85f : 1f, dark ? 0.16f : 0.32f);
        shader.setFloatUniform("dispersion", dispersion);
        shader.setFloatUniform("dark", dark ? 1f : 0f);
        drawThroughShader(canvas, r, dark, shader, Math.round(strength + dispersion + 4 * density),
                Math.min(1f, p * 1.4f));
    }

    /**
     * The southstar21 style drop, with Kyant0/AndroidLiquidGlass's lens, inner shadow and
     * highlight. Kyant computes them at the drop's resting size and then scales the drop up, so
     * the rim and its pull grow with the drop: {@code scale}.
     */
    private void drawKyantDrop(Canvas canvas, float r, float p, boolean dark, float scale, float alpha) {
        float ca = style().edgeColors * 2f;
        float amount = 14f * density * scale;
        if (dropShader == null) {
            try {
                dropShader = new RuntimeShader(DROP_SHADER);
            } catch (RuntimeException e) {
                // A shader the GPU driver rejects must not take Instagram down: plain fill instead.
                dropShaderFailed = true;
                android.util.Log.e(LiquidGlassNavBarPatch.TAG, "Drop shader failed", e);
                return;
            }
        }
        // As on iOS: no magnification. The drop is clear glass over what's really beneath it,
        // the page and the bar itself (see drawThroughShader).
        dropShader.setFloatUniform("mag", 1f);
        dropShader.setFloatUniform("band", 10f * density * scale);
        // Positive: the rim bends in what's just outside the drop, so where the drop sticks out
        // past the bar, the bar's edge curves into its rim with the page beyond it, in rainbow
        // fringes; over the bar, the bar itself shows through unchanged.
        dropShader.setFloatUniform("amount", amount);
        dropShader.setFloatUniform("chromaticAberration", ca);
        dropShader.setFloatUniform("darken", 0f);
        dropShader.setFloatUniform("innerRadius", (3f + 5f * p) * density * scale);
        dropShader.setFloatUniform("innerAlpha", 0.15f * alpha);
        dropShader.setFloatUniform("highlightWidth", 1.5f * density * scale);
        dropShader.setFloatUniform("highlight", 0.5f * alpha);
        drawThroughShader(canvas, r, dark, dropShader, Math.round(amount * (1f + ca) + 4 * density), alpha);
    }

    /**
     * Records everything up to and including the tab bar around {@link #lens}, with {@code pad}
     * px to spare for samples outside it, and draws it through {@code effect} clipped to the lens.
     * Sets the {@code center}, {@code halfSize} and {@code radius} uniforms.
     */
    private void drawThroughShader(Canvas canvas, float r, boolean dark, RuntimeShader effect, int pad, float alpha) {
        if (!(bar.getParent() instanceof ViewGroup)) return;
        ViewGroup parent = (ViewGroup) bar.getParent();
        int barIndex = parent.indexOfChild(bar);
        if (barIndex < 0) return;

        int w = Math.round(lens.width()) + 2 * pad;
        int h = Math.round(lens.height()) + 2 * pad;
        if (w <= 0 || h <= 0) return;

        if (scene == null) {
            scene = new RenderNode("LiquidGlassLensScene");
            scene.setUseCompositingLayer(true, null);
            clip = new RenderNode("LiquidGlassLensClip");
        }

        float originX = getLeft() + lens.left - pad;
        float originY = getTop() + getTranslationY() + lens.top - pad;

        scene.setPosition(0, 0, w, h);
        RecordingCanvas rc = scene.beginRecording(w, h);
        try {
            rc.translate(-originX, -originY);
            for (int i = 0; i <= barIndex; i++) {
                View child = parent.getChildAt(i);
                if (child.getVisibility() != VISIBLE || child.getAlpha() == 0f) continue;
                int save = rc.save();
                rc.translate(child.getLeft() + child.getTranslationX(), child.getTop() + child.getTranslationY());
                child.draw(rc);
                rc.restoreToCount(save);
            }
            // Videos under the bar are holes in the recording: fill them, then the base.
            SurfaceSnapshots snapshots = glass.snapshots();
            if (snapshots != null) snapshots.draw(rc);
            rc.drawColor(dark ? Color.BLACK : Color.WHITE, android.graphics.PorterDuff.Mode.DST_OVER);
        } finally {
            scene.endRecording();
        }

        effect.setFloatUniform("center", w / 2f, h / 2f);
        effect.setFloatUniform("halfSize", lens.width() / 2f, lens.height() / 2f);
        effect.setFloatUniform("radius", r);
        scene.setRenderEffect(RenderEffect.createRuntimeShaderEffect(effect, "content"));

        int lw = Math.round(lens.width());
        int lh = Math.round(lens.height());
        clip.setPosition(0, 0, lw, lh);
        Outline outline = new Outline();
        outline.setRoundRect(0, 0, lw, lh, r);
        clip.setOutline(outline);
        clip.setClipToOutline(true);
        clip.setAlpha(alpha);
        RecordingCanvas cc = clip.beginRecording();
        try {
            cc.translate(-pad, -pad);
            cc.drawRenderNode(scene);
        } finally {
            clip.endRecording();
        }

        int save = canvas.save();
        canvas.translate(lens.left, lens.top);
        canvas.drawRenderNode(clip);
        canvas.restoreToCount(save);
    }

    private static float lerp(float a, float b, float t) {
        return a + (b - a) * t;
    }

    // endregion

    /** Damped spring, integrated with small fixed sub-steps for stability. */
    private static final class Spring {
        float stiffness;
        float damping;
        final float epsilon;
        float value, velocity, target;

        /** Switches to another stiffness and damping ratio, keeping the current motion. */
        void tune(float stiffness, float dampingRatio) {
            this.stiffness = stiffness;
            this.damping = 2f * dampingRatio * (float) Math.sqrt(stiffness);
        }

        Spring(float stiffness, float dampingRatio, float epsilon) {
            this.stiffness = stiffness;
            this.epsilon = epsilon;
            this.damping = 2f * dampingRatio * (float) Math.sqrt(stiffness);
        }

        void step(float dt) {
            float remaining = dt;
            while (remaining > 0f) {
                float h = Math.min(remaining, 1f / 240f);
                float force = -stiffness * (value - target) - damping * velocity;
                velocity += force * h;
                value += velocity * h;
                remaining -= h;
            }
            if (isAtRest()) {
                value = target;
                velocity = 0f;
            }
        }

        void snap(float v) {
            value = target = v;
            velocity = 0f;
        }

        void kick(float v) {
            velocity += v;
        }

        boolean isAtRest() {
            return Math.abs(velocity) < epsilon * 10f && Math.abs(value - target) < epsilon;
        }
    }
}
