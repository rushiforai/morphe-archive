package app.voidhack.extension.applemusic;

import android.animation.ValueAnimator;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.util.Log;
import android.view.Choreographer;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.TextView;

import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;

final class GlassController implements View.OnAttachStateChangeListener,
        ViewTreeObserver.OnPreDrawListener, Choreographer.FrameCallback {
    final ViewGroup navigation;
    final GlassDrawable material;
    final GlassLensDrawable lens;
    final GlassTouch touch;
    final GlassSurfaceMotion surfaceMotion;
    final GlassSpring position = new GlassSpring(520f, 0.78f, 0.15f);
    final GlassSpring width = new GlassSpring(520f, 0.85f, 0.15f);
    final GlassSpring pressure = new GlassSpring(400f, 0.72f, 0.001f);
    final GlassSpring shape = new GlassSpring(360f, 0.38f, 0.001f);
    private final Set<View> boundItems = Collections.newSetFromMap(new IdentityHashMap<>());
    private ViewTreeObserver observer;
    ViewGroup menu;
    private float selectedCenter = Float.NaN;
    private float selectedWidth;
    private boolean colorsApplied;
    private boolean tintAvailable = true;
    private boolean framePosted;
    private long previousFrame;

    GlassController(ViewGroup navigation, LiquidGlass.Backdrop backdrop) {
        this.navigation = navigation;
        material = new GlassDrawable(navigation, backdrop);
        surfaceMotion = new GlassSurfaceMotion(navigation, material);
        lens = new GlassLensDrawable(this);
        touch = new GlassTouch(this);
        navigation.setOnTouchListener(touch);
    }

    void attach() {
        if (observer != null) return;
        observer = navigation.getViewTreeObserver();
        observer.addOnPreDrawListener(this);
        if (navigation.getParent() instanceof ViewGroup) {
            ((ViewGroup) navigation.getParent()).getOverlay().add(lens);
        }
        onPreDraw();
    }

    @Override public void onViewAttachedToWindow(View view) { attach(); }

    @Override public void onViewDetachedFromWindow(View view) {
        if (observer != null && observer.isAlive()) observer.removeOnPreDrawListener(this);
        observer = null;
        if (navigation.getParent() instanceof ViewGroup) {
            ((ViewGroup) navigation.getParent()).getOverlay().remove(lens);
        }
        Choreographer.getInstance().removeFrameCallback(this);
        framePosted = false;
        previousFrame = 0;
        touch.cancel();
        pressure.snap(0f);
        surfaceMotion.stop();
        shape.snap(0f);
        publishMotion();
        if (material.backdrop != null) material.backdrop.release();
    }

    View selectedItem() {
        if (menu == null) return null;
        for (int i = 0; i < menu.getChildCount(); i++) {
            View item = menu.getChildAt(i);
            if (item.isSelected() && item.getVisibility() == View.VISIBLE) return item;
        }
        return null;
    }

    @Override public boolean onPreDraw() {
        if (navigation.getChildCount() == 0 || !(navigation.getChildAt(0) instanceof ViewGroup)) return true;
        ViewGroup currentMenu = (ViewGroup) navigation.getChildAt(0);
        if (menu != currentMenu) {
            boundItems.clear();
            menu = currentMenu;
            menu.setMotionEventSplittingEnabled(false);
            menu.setOnTouchListener(touch);
        }
        TextView inactiveLabel = null;
        boolean hovering = navigation.isHovered() || menu.isHovered();
        for (int i = 0; i < menu.getChildCount(); i++) {
            View item = menu.getChildAt(i);
            if (item.getVisibility() != View.VISIBLE) continue;
            hovering |= item.isHovered();
            if (boundItems.add(item)) item.setOnTouchListener(touch);
            if (!item.isSelected() && inactiveLabel == null) inactiveLabel = visibleLabel(item);
        }
        surfaceMotion.hover(hovering);
        View selected = selectedItem();
        if (selected != null) {
            boolean dark = inactiveLabel == null ? material.dark
                    : Color.luminance(inactiveLabel.getCurrentTextColor()) > 0.5f;
            TextView active = visibleLabel(selected);
            if (!colorsApplied || material.dark != dark || (tintAvailable && active != null
                    && active.getCurrentTextColor() != activeColor())) {
                material.dark = dark;
                applyColors();
                invalidate();
            }
            if (!touch.active()) moveTo(selected, material.selectionWidth > 0f);
        }
        if (navigation.getParent() instanceof ViewGroup) {
            ViewGroup parent = (ViewGroup) navigation.getParent();
            lens.setBounds(0, 0, parent.getWidth(), parent.getHeight());
        }
        return true;
    }

    private static TextView visibleLabel(View view) {
        if (view.getVisibility() != View.VISIBLE) return null;
        if (view instanceof TextView) return (TextView) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                TextView label = visibleLabel(group.getChildAt(i));
                if (label != null) return label;
            }
        }
        return null;
    }

    private void applyColors() {
        if (tintAvailable) {
            int active = activeColor();
            ColorStateList colors = new ColorStateList(
                    new int[][]{{android.R.attr.state_checked}, {android.R.attr.state_selected}, {}},
                    new int[]{active, active, material.dark ? 0xfff5f5f7 : 0xff161618});
            try {
                navigation.getClass().getMethod("setItemIconTintList", ColorStateList.class).invoke(navigation, colors);
                navigation.getClass().getMethod("setItemTextColor", ColorStateList.class).invoke(navigation, colors);
            } catch (ReflectiveOperationException exception) {
                tintAvailable = false;
                Log.w(LiquidGlass.TAG, "Keeping native tab tint: navigation API unavailable", exception);
            }
        }
        colorsApplied = true;
    }

    private int activeColor() {
        if (material.backdrop != null && (touch.active() || material.press > 0.001f)) {
            return material.dark ? 0xfff5f5f7 : 0xff161618;
        }
        return material.dark ? LiquidGlass.ACTIVE_DARK : LiquidGlass.ACTIVE_LIGHT;
    }

    void moveTo(View item, boolean animate) {
        float center = menu.getLeft() + item.getLeft() + item.getWidth() / 2f;
        if (center == selectedCenter && item.getWidth() == selectedWidth) return;
        selectedCenter = center;
        selectedWidth = item.getWidth();
        position.target = center;
        width.target = selectedWidth;
        if (!animate) {
            position.snap(center);
            width.snap(selectedWidth);
            publishMotion();
        }
        scheduleFrame();
    }

    void press(View item) {
        moveTo(item, true);
        pressure.target = 1f;
        scheduleFrame();
    }

    void drag(float localX, float speed) {
        float half = material.selectionWidth * 0.625f;
        float constrained = Math.max(half, Math.min(navigation.getWidth() - half, localX));
        float overshoot = localX - constrained;
        position.target = constrained + Math.signum(overshoot) * material.density * 4f
                * (1f - (float) Math.exp(-Math.abs(overshoot) / (material.density * 20f)));
        float deformation = Math.min(0.14f, Math.abs(speed) / (material.density * 12000f));
        if (Math.abs(overshoot) > material.density) {
            if (shape.target >= 0f) shape.velocity -= Math.min(3f, Math.abs(speed) / (material.density * 1000f));
            deformation = -0.12f;
        }
        shape.target = deformation;
        selectedCenter = Float.NaN;
        scheduleFrame();
    }

    void release(float speed) {
        pressure.target = 0f;
        surfaceMotion.release();
        shape.target = 0f;
        shape.velocity -= Math.min(2.8f, Math.abs(speed) / (material.density * 1500f));
        selectedCenter = Float.NaN;
        View selected = selectedItem();
        if (selected != null) moveTo(selected, true);
        scheduleFrame();
    }

    private void scheduleFrame() {
        if (!ValueAnimator.areAnimatorsEnabled()) {
            position.snap(position.target);
            width.snap(width.target);
            pressure.snap(pressure.target);
            shape.snap(0f);
            publishMotion();
        } else if (!framePosted && navigation.isAttachedToWindow()) {
            framePosted = true;
            Choreographer.getInstance().postFrameCallback(this);
        }
    }

    @Override public void doFrame(long frameTimeNanos) {
        framePosted = false;
        float dt = previousFrame == 0 ? 1f / 120f : Math.min(0.032f, (frameTimeNanos - previousFrame) / 1_000_000_000f);
        previousFrame = frameTimeNanos;
        boolean moving = position.advance(dt);
        moving |= width.advance(dt);
        moving |= pressure.advance(dt);
        moving |= shape.advance(dt);
        publishMotion();
        if (moving) scheduleFrame();
        else previousFrame = 0;
    }

    private void publishMotion() {
        material.center = position.value;
        material.selectionWidth = width.value;
        material.press = Math.max(0f, Math.min(1f, pressure.value));
        material.deformation = Math.max(-0.16f, Math.min(0.16f, shape.value));
        invalidate();
    }

    private void invalidate() {
        material.invalidateSelf();
        lens.invalidateSelf();
    }
}
