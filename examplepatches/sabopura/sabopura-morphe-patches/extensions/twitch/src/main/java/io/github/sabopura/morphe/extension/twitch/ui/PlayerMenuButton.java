package io.github.sabopura.morphe.extension.twitch.ui;

import android.animation.ValueAnimator;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.animation.DecelerateInterpolator;
import android.widget.PopupWindow;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.chat.ChatSettings;
import io.github.sabopura.morphe.extension.twitch.chat.ViewCustomization;
import io.github.sabopura.morphe.extension.twitch.danmaku.DanmakuSettings;
import io.github.sabopura.morphe.extension.twitch.danmaku.TwitchDanmaku;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

/**
 * The one button the Twitch patches add to the player controls. Tap opens the player menu;
 * long press switches danmaku on or off (or opens the settings when danmaku is not patched).
 * The icon is drawn in code and morphs, with the slash drawn in, only when danmaku changes.
 */
@SuppressWarnings("unused")
public final class PlayerMenuButton extends View {
    private static final String HINT_SHOWN = "hint_player_button_shown";
    private static final int MORPH_MS = 180;
    private static final int HINT_MS = 8000;

    private final Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF bubble = new RectF();
    private final Path tail = new Path();
    private float off;
    private boolean lastOn;
    private ValueAnimator morph;
    private ViewTreeObserver.OnGlobalLayoutListener controlsListener;
    private PopupWindow hint;

    public PlayerMenuButton(Context context) {
        super(context);
        init();
    }

    public PlayerMenuButton(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public PlayerMenuButton(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    private void init() {
        Text.use(getContext());
        float density = getResources().getDisplayMetrics().density;
        stroke.setStyle(Paint.Style.STROKE);
        stroke.setStrokeWidth(2f * density);
        stroke.setStrokeCap(Paint.Cap.ROUND);
        stroke.setStrokeJoin(Paint.Join.ROUND);
        stroke.setColor(Color.WHITE);
        fill.setColor(Color.WHITE);
        setClickable(true);
        setFocusable(true);
        TypedValue ripple = new TypedValue();
        if (getContext().getTheme().resolveAttribute(
                android.R.attr.selectableItemBackgroundBorderless, ripple, true)) {
            setBackgroundResource(ripple.resourceId);
        }
        setOnClickListener(v -> {
            try {
                dismissHint(true);
                PlayerMenu.show(getContext());
            } catch (RuntimeException | LinkageError e) {
                Diagnostics.note("ui.player-button-tap", e);
            }
        });
        setOnLongClickListener(v -> {
            performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
            try {
                dismissHint(true);
                if (Features.danmaku()) toggleDanmaku();
                else SettingsScreen.show(getContext());
            } catch (RuntimeException | LinkageError e) {
                Diagnostics.note("ui.player-button-hold", e);
            }
            return true;
        });
        lastOn = danmakuOn();
        off = lastOn ? 0 : 1;
        describe();
    }

    /** Also read while Twitch inflates its player controls, where a throw would keep any stream from opening. */
    private boolean danmakuOn() {
        try {
            return Features.danmaku() && DanmakuSettings.get(getContext()).enabled;
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("ui.player-button-danmaku", e);
            return false;
        }
    }

    private void describe() {
        String base = label("プレイヤーメニュー", "Player menu");
        if (Features.danmaku()) {
            base += label(danmakuOn() ? "（弾幕オン。長押しで切替）" : "（弾幕オフ。長押しで切替）",
                    danmakuOn() ? " (danmaku on; long-press to switch)" : " (danmaku off; long-press to switch)");
        }
        setContentDescription(base);
    }

    private void toggleDanmaku() {
        Context context = getContext();
        boolean enabled = !DanmakuSettings.get(context).enabled;
        DanmakuSettings.setEnabled(context, enabled);
        TwitchDanmaku.settingsChanged();
        describe();
        morphIfChanged();
        Notice.show(context, enabled ? label("弾幕: オン", "Danmaku on") : label("弾幕: オフ", "Danmaku off"));
    }

    private void morphIfChanged() {
        boolean on = danmakuOn();
        if (on == lastOn) return;
        lastOn = on;
        float from = off, to = on ? 0 : 1;
        if (morph != null) morph.cancel();
        morph = ValueAnimator.ofFloat(from, to);
        morph.setDuration(MORPH_MS);
        morph.setInterpolator(new DecelerateInterpolator());
        morph.addUpdateListener(a -> {
            off = (float) a.getAnimatedValue();
            invalidate();
        });
        morph.start();
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        try {
            Notice.rememberPlayer(this);
            // Visibility options need the player's view tree; it exists once this button does.
            if (Features.any(Feature.DECLUTTER, Feature.NAV_POSITION, Feature.LANDSCAPE_CHAT))
                ViewCustomization.observe(getRootView());
            describe();
            lastOn = danmakuOn();
            off = lastOn ? 0 : 1;
            invalidate();
            followControls();
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("ui.player-button-attach", e);
        }
    }

    @Override
    protected void onDetachedFromWindow() {
        if (controlsListener != null) getViewTreeObserver().removeOnGlobalLayoutListener(controlsListener);
        controlsListener = null;
        if (morph != null) morph.cancel();
        dismissHint(false);
        super.onDetachedFromWindow();
    }

    /**
     * Twitch shows and hides its player buttons one by one. This button follows Twitch's own
     * settings (gear) button, so it never stays on screen after the controls fade.
     */
    private void followControls() {
        if (controlsListener != null || !(getParent() instanceof View)) return;
        View parent = (View) getParent();
        int id = TwitchRes.id(getContext(), "settings_button", "id");
        View gear = id == 0 ? null : parent.findViewById(id);
        if (gear == null) return; // Outside Twitch's player, for example in the test harness.
        controlsListener = () -> {
            int wanted = gear.getVisibility() == VISIBLE ? VISIBLE : GONE;
            if (getVisibility() != wanted) setVisibility(wanted);
        };
        getViewTreeObserver().addOnGlobalLayoutListener(controlsListener);
        controlsListener.onGlobalLayout();
    }

    /** The first time the button is on screen, a small pointer says what it is. */
    @Override
    public void onVisibilityAggregated(boolean isVisible) {
        super.onVisibilityAggregated(isVisible);
        // This button comes and goes with Twitch's player controls.
        TwitchDanmaku.controlsShown(this, isVisible);
        if (!isVisible) {
            dismissHint(false);
            return;
        }
        if (getWidth() == 0 || hint != null) return;
        try {
            SharedPreferences prefs = ChatSettings.preferences(getContext());
            if (prefs.getBoolean(HINT_SHOWN, false)) return;
            post(() -> showHint(prefs));
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("ui.player-button-hint", e);
        }
    }

    private void showHint(SharedPreferences prefs) {
        if (hint != null || !isShown() || getWindowToken() == null) return;
        HintBubble content = new HintBubble(getContext(), label(
                "吹き出しのボタンで、パッチのメニューと設定を開けます",
                "This button opens the patch menu and settings"));
        PopupWindow popup = new PopupWindow(content, content.bubbleWidth, content.bubbleHeight, false);
        popup.setClippingEnabled(true);
        popup.setOutsideTouchable(true);
        popup.setTouchable(true);
        popup.setFocusable(false);
        popup.setOnDismissListener(() -> {
            if (hint == popup) hint = null;
        });
        content.setOnClickListener(v -> dismissHint(true));
        popup.setTouchInterceptor((v, event) -> {
            dismissHint(true);
            return false;
        });
        int[] at = new int[2];
        getLocationInWindow(at);
        int x = at[0] + getWidth() / 2 - content.bubbleWidth + content.tipOffset();
        int y = at[1] + getHeight();
        popup.showAtLocation(this, Gravity.NO_GRAVITY, Math.max(0, x), y);
        hint = popup;
        postDelayed(hintTimeout, HINT_MS);
    }

    private final Runnable hintTimeout = () -> dismissHint(true);

    private void dismissHint(boolean seen) {
        PopupWindow current = hint;
        hint = null;
        removeCallbacks(hintTimeout);
        if (current != null && current.isShowing()) current.dismiss();
        if (seen) ChatSettings.preferences(getContext()).edit().putBoolean(HINT_SHOWN, true).apply();
    }

    @Override
    public void onWindowFocusChanged(boolean hasWindowFocus) {
        super.onWindowFocusChanged(hasWindowFocus);
        // The menu or settings may have switched danmaku while they had focus.
        if (hasWindowFocus) {
            describe();
            morphIfChanged();
        }
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        float density = getResources().getDisplayMetrics().density;
        float cx = getWidth() / 2f, cy = getHeight() / 2f;
        float half = Math.min(11f * density, Math.min(getWidth(), getHeight()) * 0.36f);

        // Speech bubble with a tail at the lower left.
        bubble.set(cx - half, cy - half * 0.82f, cx + half, cy + half * 0.58f);
        float radius = half * 0.32f;
        canvas.drawRoundRect(bubble, radius, radius, stroke);
        tail.reset();
        tail.moveTo(cx - half * 0.42f, bubble.bottom);
        tail.lineTo(cx - half * 0.6f, cy + half);
        tail.lineTo(cx - half * 0.08f, bubble.bottom);
        canvas.drawPath(tail, stroke);

        if (!Features.danmaku()) {
            // Chat settings only: three dots.
            float r = 1.1f * density;
            for (int i = -1; i <= 1; i++) canvas.drawCircle(cx + i * half * 0.45f, bubble.centerY(), r, fill);
            return;
        }
        // Two flowing comment lines shrink and fade as the slash is drawn across them.
        stroke.setAlpha(Math.round(255 - 135 * off));
        float shrink = 1 - off * .35f;
        float y1 = bubble.top + bubble.height() * 0.36f, y2 = bubble.top + bubble.height() * 0.68f;
        canvas.drawLine(cx - half * 0.2f, y1, cx + half * 0.6f * shrink, y1, stroke);
        canvas.drawLine(cx - half * 0.6f, y2, cx + half * 0.25f * shrink, y2, stroke);
        stroke.setAlpha(255);
        if (off > 0) {
            float startX = cx - half, startY = cy + half * 0.9f;
            canvas.drawLine(startX, startY, startX + 2 * half * off, startY - 1.8f * half * off, stroke);
        }
    }

    /** The one-time pointer, drawn in code: a rounded bubble with an arrow towards the button. */
    private static final class HintBubble extends View {
        final int bubbleWidth, bubbleHeight;
        private final TextPaint text = new TextPaint(Paint.ANTI_ALIAS_FLAG);
        private final Paint box = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();
        private final Path arrow = new Path();
        private final StaticLayout layout;
        private final float density;

        HintBubble(Context context, String message) {
            super(context);
            density = context.getResources().getDisplayMetrics().density;
            text.setColor(0xFFEFEFF1);
            text.setTextSize(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 14,
                    context.getResources().getDisplayMetrics()));
            // Twitch's deeper purple: the light text on it stays above 4.5:1, which the lighter one was not.
            box.setColor(0xFF772CE8);
            int maxWidth = Math.round(220 * density);
            layout = StaticLayout.Builder.obtain(message, 0, message.length(), text, maxWidth)
                    .setAlignment(Layout.Alignment.ALIGN_NORMAL).build();
            float width = 0;
            for (int i = 0; i < layout.getLineCount(); i++) width = Math.max(width, layout.getLineWidth(i));
            bubbleWidth = Math.round(width + 28 * density);
            bubbleHeight = layout.getHeight() + Math.round(32 * density);
            setContentDescription(message);
        }

        int tipOffset() {
            return Math.round(22 * density);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float top = 8 * density;
            rect.set(0, top, getWidth(), getHeight());
            canvas.drawRoundRect(rect, 12 * density, 12 * density, box);
            arrow.reset();
            float tip = getWidth() - tipOffset();
            arrow.moveTo(tip - 8 * density, top);
            arrow.lineTo(tip, 0);
            arrow.lineTo(tip + 8 * density, top);
            arrow.close();
            canvas.drawPath(arrow, box);
            canvas.save();
            canvas.translate(14 * density, top + 12 * density);
            layout.draw(canvas);
            canvas.restore();
        }
    }
}
