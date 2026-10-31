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
            "  float2 fringe = n * bend * strength * 0.08;\n" +

            "  half4 col;\n" +
            "  col.r = content.eval(src + fringe).r;\n" +
            "  col.g = content.eval(src).g;\n" +
            "  col.b = content.eval(src - fringe).b;\n" +
            "  col.a = 1.0;\n" +

            "  col.rgb = mix(col.rgb, half3(mix(1.0, 0.85, dark)), mix(0.32, 0.16, dark));\n" +

            "  float2 light = normalize(float2(-0.45, -0.9));\n" +
            "  float spec = pow(max(dot(n, light), 0.0), 2.0) + 0.5 * pow(max(dot(n, -light), 0.0), 2.0);\n" +
            "  float rim = smoothstep(0.5, 1.0, t);\n" +
            "  col.rgb += half3(rim * spec * mix(0.65, 0.4, dark));\n" +
            // Darker lower inner edge gives the droplet some volume.
            "  float lower = smoothstep(0.0, halfSize.y, p.y) * rim;\n" +
            "  col.rgb -= half3(lower * 0.08);\n" +

            "  return clamp(col, 0.0, 1.0) * coverage;\n" +
            "}\n";

    private final ViewGroup bar;
    private final LiquidGlassDrawable glass;
    private final float density;
    /** Extra height above the bar; zero now that the lens stays inside the pill. */
    final int extraTop;
    private final int touchSlop;

    private final Spring x = new Spring(420f, 0.68f, 0.3f);
    private final Spring width = new Spring(520f, 0.75f, 0.002f);
    private final Spring press = new Spring(560f, 0.62f, 0.002f);
    /** 0 = full bar, 1 = shrunk while scrolling. */
    private final Spring minimize = new Spring(260f, 0.86f, 0.002f);
    private float appliedMinimize = -1f;
    private long lastFrame;

    /** Set when this view accepted a touch-down, read by {@link TouchRouter}. */
    boolean claimedDown;
    private boolean tracking;
    private boolean dragging;
    private View lastSelected;
    private View dragTarget;

    private final RectF pill = new RectF();
    private final RectF lens = new RectF();
    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint rim = new Paint(Paint.ANTI_ALIAS_FLAG);

    private RenderNode scene;
    private RenderNode clip;
    private RuntimeShader shader;

    LiquidGlassLens(Context context, ViewGroup bar, LiquidGlassDrawable glass, float density) {
        super(context);
        this.bar = bar;
        this.glass = glass;
        this.density = density;
        this.extraTop = 0;
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
        press.target = 1f;
        x.target = clampX(localX);
        startAnimating();
    }

    /** Whether a move to {@code localX} should turn the gesture into a lens drag. */
    boolean shouldStartDrag(float downLocalX, float localX) {
        return Math.abs(localX - downLocalX) > touchSlop;
    }

    void dragTo(float localX) {
        dragging = true;
        x.target = clampX(localX);
        View target = tabAt(localX);
        // A light tick each time the droplet crosses into another tab.
        if (dragTarget != null && target != dragTarget && LiquidGlassNavBarPatch.HAPTICS.get()) {
            performHapticFeedback(Build.VERSION.SDK_INT >= 34
                    ? HapticFeedbackConstants.SEGMENT_FREQUENT_TICK
                    : HapticFeedbackConstants.CLOCK_TICK);
        }
        dragTarget = target;
        startAnimating();
    }

    /** Finger lifted after a drag: snap onto the nearest tab and open it. */
    void endDrag(float localX) {
        View target = dragTarget != null ? dragTarget : tabAt(localX);
        release();
        if (target != null) {
            x.target = centerOf(target);
            if (LiquidGlassNavBarPatch.HAPTICS.get()) {
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
        press.target = 0f;
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
        float target = dy < 0 && LiquidGlassNavBarPatch.SHRINK_ON_SCROLL.get() ? 1f : 0f;
        if (minimize.target == target) return;
        minimize.target = target;
        startAnimating();
    }

    void expand() {
        if (minimize.target == 0f) return;
        minimize.target = 0f;
        startAnimating();
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

    private float clampX(float value) {
        float half = currentRestWidth() * 0.5f;
        return Math.max(pill.left + half, Math.min(pill.right - half, value));
    }

    // endregion

    // region Layout sync

    /** Called by the controller every pre-draw to follow the bar around. */
    void sync() {
        if (getVisibility() != bar.getVisibility()) setVisibility(bar.getVisibility());
        float ty = bar.getTranslationY();
        if (getTranslationY() != ty) setTranslationY(ty);
        if (getAlpha() != bar.getAlpha()) setAlpha(bar.getAlpha());

        View selected = selectedTab();
        if (selected != lastSelected && lastSelected != null) expand();
        applyMinimize(selected);
        if (selected != lastSelected) {
            if (lastSelected == null || selected == null) {
                if (selected != null) x.snap(centerOf(selected));
            } else if (!dragging) {
                x.target = centerOf(selected);
                // Short pop while sliding to a tab chosen some other way (e.g. swipe paging).
                if (!tracking) press.kick(2.5f);
            }
            lastSelected = selected;
            startAnimating();
        } else if (selected != null && !tracking && (!isAnimating() || !minimize.isAtRest())) {
            float c = centerOf(selected);
            if (Math.abs(x.value - c) > 0.5f) x.snap(c);
        }
        invalidate();
    }

    /**
     * Scales the whole bar down around its bottom center while content scrolls, like iOS
     * Instagram: the pill and all five tabs shrink together and stay tappable.
     */
    private void applyMinimize(View selected) {
        float m = Math.max(0f, Math.min(1f, minimize.value));
        if (m == appliedMinimize && selected == lastSelected) return;
        appliedMinimize = m;

        glass.setMinimize(m);
        bar.invalidateOutline();

        RectF full = glass.getFullPill();
        float scale = glass.currentScale();
        for (int i = 0; i < bar.getChildCount(); i++) {
            View child = bar.getChildAt(i);
            // Shared pivot so the tabs keep their spacing relative to the shrinking pill.
            child.setPivotX(full.centerX() - child.getLeft());
            child.setPivotY(full.bottom - child.getTop());
            child.setScaleX(scale);
            child.setScaleY(scale);
        }
    }

    private View selectedTab() {
        for (int i = 0; i < bar.getChildCount(); i++) {
            View child = bar.getChildAt(i);
            if (child.getVisibility() != GONE && (child.isSelected() || child.isActivated())) return child;
        }
        return null;
    }

    private void updatePill() {
        RectF p = glass.getPill();
        float dx = bar.getLeft() - getLeft();
        float dy = bar.getTop() - getTop();
        pill.set(p.left + dx, p.top + dy, p.right + dx, p.bottom + dy);
    }

    private float currentRestWidth() {
        View ref = lastSelected != null ? lastSelected : (bar.getChildCount() > 0 ? bar.getChildAt(0) : null);
        float tab = ref != null ? ref.getWidth() * ref.getScaleX() : pill.height();
        return Math.min(tab + 6 * density, pill.width());
    }

    // endregion

    // region Animation

    private boolean isAnimating() {
        return !x.isAtRest() || !press.isAtRest() || !width.isAtRest() || !minimize.isAtRest();
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
        // Stretch along the direction of travel, like a droplet being dragged.
        width.target = 1f + Math.min(Math.abs(x.velocity) / (pill.width() * 2.2f), 0.45f);
        width.step(dt);
        if (isAnimating() || tracking) postInvalidateOnAnimation();
    }

    // endregion

    // region Drawing

    @Override
    protected void onDraw(Canvas canvas) {
        if (bar.getVisibility() != VISIBLE || lastSelected == null && !tracking) return;
        updatePill();
        if (pill.isEmpty()) return;
        step();

        float p = Math.max(0f, press.value);
        // iOS Instagram's indicator stays capsule sized: it only swells a touch while moving.
        float scale = glass.currentScale();
        float inset = 3 * density * scale;
        float maxW = pill.width() - 2 * inset;
        float maxH = pill.height() - 2 * inset;
        float restW = currentRestWidth();
        float restH = pill.height() - 2 * inset;
        float pressedW = restW * 1.05f;

        float stretch = width.value;
        float grow = Math.min(p, 1f);
        float w = Math.min(lerp(restW, pressedW, grow) * stretch, maxW);
        float h = Math.min(lerp(restH, maxH, grow) / (float) Math.sqrt(stretch), maxH);
        float cx = Math.max(pill.left + inset + w / 2f, Math.min(pill.right - inset - w / 2f, x.value));
        float cy = pill.centerY();
        lens.set(cx - w / 2f, cy - h / 2f, cx + w / 2f, cy + h / 2f);
        float r = h / 2f;

        boolean dark = glass.isDark();

        // Grey resting capsule (~10% black, ~16% white on dark), fading into clear glass while moving.
        float restAlpha = 1f - Math.min(1f, p * 1.6f);
        if (restAlpha > 0f) {
            int a = Math.round((dark ? 0x2A : 0x1A) * restAlpha);
            fill.setColor(dark ? Color.argb(a, 0xFF, 0xFF, 0xFF) : Color.argb(a, 0, 0, 0));
            canvas.drawRoundRect(lens, r, r, fill);
        }

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

    /** Records everything up to and including the tab bar under the lens, then draws it as glass. */
    private void drawLens(Canvas canvas, float r, float p, boolean dark) {
        if (!(bar.getParent() instanceof ViewGroup)) return;
        ViewGroup parent = (ViewGroup) bar.getParent();
        int barIndex = parent.indexOfChild(bar);
        if (barIndex < 0) return;

        float strength = 6f * density * p;
        int pad = Math.round(strength + 4 * density);
        int w = Math.round(lens.width()) + 2 * pad;
        int h = Math.round(lens.height()) + 2 * pad;
        if (w <= 0 || h <= 0) return;

        if (scene == null) {
            scene = new RenderNode("LiquidGlassLensScene");
            clip = new RenderNode("LiquidGlassLensClip");
            shader = new RuntimeShader(LENS_SHADER);
        }

        float originX = getLeft() + lens.left - pad;
        float originY = getTop() + getTranslationY() + lens.top - pad;

        scene.setPosition(0, 0, w, h);
        RecordingCanvas rc = scene.beginRecording(w, h);
        try {
            rc.drawColor(dark ? Color.BLACK : Color.WHITE);
            rc.translate(-originX, -originY);
            for (int i = 0; i <= barIndex; i++) {
                View child = parent.getChildAt(i);
                if (child.getVisibility() != VISIBLE || child.getAlpha() == 0f) continue;
                int save = rc.save();
                rc.translate(child.getLeft() + child.getTranslationX(), child.getTop() + child.getTranslationY());
                child.draw(rc);
                rc.restoreToCount(save);
            }
        } finally {
            scene.endRecording();
        }

        shader.setFloatUniform("center", w / 2f, h / 2f);
        shader.setFloatUniform("halfSize", lens.width() / 2f, lens.height() / 2f);
        shader.setFloatUniform("radius", r);
        // No magnification: iOS Instagram's indicator doesn't zoom like the App Store's.
        shader.setFloatUniform("mag", 1f);
        shader.setFloatUniform("bezel", Math.min(r, 16f * density));
        shader.setFloatUniform("strength", strength);
        shader.setFloatUniform("dark", dark ? 1f : 0f);
        scene.setRenderEffect(RenderEffect.createRuntimeShaderEffect(shader, "content"));

        int lw = Math.round(lens.width());
        int lh = Math.round(lens.height());
        clip.setPosition(0, 0, lw, lh);
        Outline outline = new Outline();
        outline.setRoundRect(0, 0, lw, lh, r);
        clip.setOutline(outline);
        clip.setClipToOutline(true);
        clip.setAlpha(Math.min(1f, p * 1.4f));
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
        final float stiffness;
        final float damping;
        final float epsilon;
        float value, velocity, target;

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
