package app.southstar21.extension.youtubemusic.settings;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.OvershootInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.southstar21.extension.youtubemusic.YouTubeMusicHooks;

/**
 * Shown once, the first time YouTube Music opens with the patches: the screen dims around a
 * glowing spotlight on the settings button, and a card under it, pointing up at the button,
 * thanks the user, shows where the settings are and explains that the glass starts out
 * lightweight, with full Liquid Glass a switch away in the settings.
 */
public final class WelcomeBanner {
    private static final int ACCENT = 0xFF0095F6;
    private static final int PURPLE = 0xFF5E5CE6;
    private static final int CARD = 0xFF1C1C1E;
    private static final int TEXT_PRIMARY = 0xFFF5F5F5;
    private static final int TEXT_SECONDARY = 0xFF98989F;
    /** How long after the app opens the welcome waits, so YouTube Music's first screen has settled. */
    private static final long DELAY_MS = 1500;

    private static boolean scheduled;

    private final Activity activity;
    private final View button;
    private final float density;
    private Dialog dialog;

    private WelcomeBanner(Activity activity, View button) {
        this.activity = activity;
        this.button = button;
        this.density = activity.getResources().getDisplayMetrics().density;
    }

    /** Shows the welcome a moment from now, if it never showed. Call when the main screen is up. */
    public static void maybeShow(Activity activity) {
        if (scheduled || Settings.welcomeShown()) return;
        scheduled = true;
        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            try {
                View button = SettingsButton.current();
                // Not now if the settings button isn't on screen (the player is open, another
                // screen is up): the next time the app comes to the front.
                if (activity.isFinishing() || !activity.hasWindowFocus() || button == null
                        || !button.isShown() || button.getWidth() == 0 || Settings.welcomeShown()) {
                    scheduled = false;
                    return;
                }
                new WelcomeBanner(activity, button).show();
            } catch (Throwable t) {
                Log.e(YouTubeMusicHooks.TAG, "Welcome failed", t);
            }
        }, DELAY_MS);
    }

    private void show() {
        Settings.setWelcomeShown();
        dialog = new Dialog(activity, android.R.style.Theme_Translucent_NoTitleBar);
        Spotlight root = new Spotlight(activity);
        dialog.setContentView(root);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            window.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            // Over the status bar too, so the spotlight lines up with the button on screen.
            window.addFlags(WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS);
            window.setWindowAnimations(0);
        }
        dialog.setCancelable(true);
        dialog.show();
    }

    private void dismiss(boolean openSettings) {
        if (dialog == null || !dialog.isShowing()) return;
        View root = dialog.findViewById(android.R.id.content);
        Runnable close = () -> {
            try {
                dialog.dismiss();
            } catch (Throwable ignored) {
                // The activity went away.
            }
            if (openSettings) SettingsMenu.show(activity);
        };
        if (root == null) {
            close.run();
            return;
        }
        root.animate().alpha(0f).setDuration(180).withEndAction(close).start();
    }

    /** The dimmed screen with a hole and a pulsing ring around the button, and the card. */
    private final class Spotlight extends FrameLayout {
        private final Paint dim = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint ring = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint glow = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint arrow = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path hole = new Path();
        private final Path tip = new Path();
        private final int[] here = new int[2];
        private final int[] there = new int[2];
        private final LinearLayout card;
        private float cx, cy, radius;
        /** 0..1, how far the dim has faded in; and the ring's pulse, 0..1 repeating. */
        private float shown, pulse;
        private ValueAnimator pulser;

        Spotlight(Context context) {
            super(context);
            setWillNotDraw(false);
            dim.setColor(0xC7000000);
            ring.setStyle(Paint.Style.STROKE);
            ring.setColor(Color.WHITE);
            glow.setStyle(Paint.Style.STROKE);
            arrow.setColor(CARD);
            card = buildCard();
            card.setAlpha(0f);
            addView(card, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }

        @Override
        protected void onAttachedToWindow() {
            super.onAttachedToWindow();
            ValueAnimator in = ValueAnimator.ofFloat(0f, 1f).setDuration(260);
            in.setInterpolator(new DecelerateInterpolator());
            in.addUpdateListener(a -> {
                shown = (float) a.getAnimatedValue();
                invalidate();
            });
            in.start();
            pulser = ValueAnimator.ofFloat(0f, 1f).setDuration(1600);
            pulser.setRepeatCount(ValueAnimator.INFINITE);
            pulser.addUpdateListener(a -> {
                pulse = (float) a.getAnimatedValue();
                invalidate((int) (cx - radius * 2), (int) (cy - radius * 2),
                        (int) (cx + radius * 2), (int) (cy + radius * 2));
            });
            pulser.start();
        }

        @Override
        protected void onDetachedFromWindow() {
            super.onDetachedFromWindow();
            if (pulser != null) pulser.cancel();
        }

        @Override
        protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
            // The button's place in this window.
            getLocationOnScreen(here);
            button.getLocationOnScreen(there);
            cx = there[0] - here[0] + button.getWidth() / 2f;
            cy = there[1] - here[1] + button.getHeight() / 2f;
            radius = Math.max(button.getWidth(), button.getHeight()) / 2f + 2 * density;

            // The card hangs under the button, with room for the arrow.
            int side = dp(16);
            int cardTop = Math.round(cy + radius + dp(14));
            int width = Math.min(right - left - 2 * side, dp(420));
            int cardLeft = (right - left - width) / 2;
            card.measure(MeasureSpec.makeMeasureSpec(width, MeasureSpec.EXACTLY),
                    MeasureSpec.makeMeasureSpec(bottom - top, MeasureSpec.AT_MOST));
            card.layout(cardLeft, cardTop, cardLeft + width, cardTop + card.getMeasuredHeight());

            float ax = Math.max(cardLeft + dp(28), Math.min(cardLeft + width - dp(28), cx));
            tip.reset();
            tip.moveTo(ax - dp(11), cardTop + 1);
            tip.lineTo(ax, cardTop - dp(10));
            tip.lineTo(ax + dp(11), cardTop + 1);
            tip.close();

            if (changed && card.getAlpha() == 0f) {
                // Grows out of the button.
                card.setPivotX(ax - cardLeft);
                card.setPivotY(0);
                card.setScaleX(0.86f);
                card.setScaleY(0.86f);
                card.setTranslationY(-dp(8));
                card.animate().alpha(1f).scaleX(1f).scaleY(1f).translationY(0f).setStartDelay(120)
                        .setDuration(420).setInterpolator(new OvershootInterpolator(1.1f)).start();
            }
        }

        @Override
        protected void onDraw(Canvas canvas) {
            hole.reset();
            hole.setFillType(Path.FillType.EVEN_ODD);
            hole.addRect(0, 0, getWidth(), getHeight(), Path.Direction.CW);
            hole.addCircle(cx, cy, radius, Path.Direction.CW);
            dim.setAlpha(Math.round(0xC7 * shown));
            canvas.drawPath(hole, dim);

            // A soft glow spreading out from the button, and a crisp ring on its edge.
            float spread = radius + pulse * dp(14);
            glow.setStrokeWidth(dp(3));
            glow.setColor(Color.argb(Math.round(150 * (1f - pulse) * shown), 0xFF, 0xFF, 0xFF));
            canvas.drawCircle(cx, cy, spread, glow);
            ring.setStrokeWidth(1.5f * density);
            ring.setAlpha(Math.round(230 * shown));
            canvas.drawCircle(cx, cy, radius, ring);

            arrow.setAlpha(Math.round(255 * card.getAlpha()));
            canvas.drawPath(tip, arrow);
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            // A tap on the button in the spotlight opens the settings; the rest of the dim
            // keeps the welcome up until it's answered.
            if (event.getActionMasked() == MotionEvent.ACTION_UP) {
                float dx = event.getX() - cx, dy = event.getY() - cy;
                if (dx * dx + dy * dy <= radius * radius) dismiss(true);
            }
            return true;
        }
    }

    private LinearLayout buildCard() {
        LinearLayout card = new LinearLayout(activity);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(20), dp(22), dp(20), dp(16));
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(CARD);
        shape.setCornerRadius(dp(24));
        card.setBackground(shape);
        card.setElevation(dp(12));
        card.setClickable(true);

        ImageView logo = new ImageView(activity);
        logo.setImageDrawable(new Logo(true));
        logo.setScaleType(ImageView.ScaleType.FIT_CENTER);
        logo.setContentDescription("southstar21.dev");
        card.addView(logo, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(22)));

        TextView title = text("Thanks for installing my patches!", 21, TEXT_PRIMARY, true);
        title.setGravity(Gravity.CENTER);
        title.setPadding(0, dp(16), 0, 0);
        card.addView(title);
        TextView subtitle = text("Here's two things you should know:", 14, TEXT_SECONDARY, false);
        subtitle.setGravity(Gravity.CENTER);
        subtitle.setPadding(0, dp(6), 0, dp(6));
        card.addView(subtitle);

        card.addView(feature(new SlidersTile(ACCENT, density), "Your settings live up here",
                "Tap the sliders button in the top bar any time to change how the patches look."));
        card.addView(feature(Icons.tile(Icons.Glyph.GLASS, PURPLE, density), "Lightweight glass is on",
                "Lightweight glass mode is for older or slower devices to ensure better experience for "
                        + "all users. If you want real liquid glass, switch it on in the settings. Enjoy!"));

        TextView open = text("Open settings", 16, Color.WHITE, true);
        open.setGravity(Gravity.CENTER);
        open.setMinHeight(dp(48));
        GradientDrawable pill = new GradientDrawable();
        pill.setColor(ACCENT);
        pill.setCornerRadius(dp(24));
        open.setBackground(new RippleDrawable(ColorStateList.valueOf(0x40FFFFFF), pill, null));
        open.setOnClickListener(v -> dismiss(true));
        LinearLayout.LayoutParams openLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        openLp.topMargin = dp(18);
        card.addView(open, openLp);

        TextView later = text("Got it", 16, ACCENT, false);
        later.setGravity(Gravity.CENTER);
        later.setMinHeight(dp(44));
        GradientDrawable mask = new GradientDrawable();
        mask.setColor(Color.WHITE);
        mask.setCornerRadius(dp(22));
        later.setBackground(new RippleDrawable(ColorStateList.valueOf(0x33FFFFFF), null, mask));
        later.setOnClickListener(v -> dismiss(false));
        LinearLayout.LayoutParams laterLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        laterLp.topMargin = dp(6);
        card.addView(later, laterLp);
        return card;
    }

    /** A row: an icon tile, a title and a short explanation. */
    private View feature(Drawable icon, String title, String body) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setPadding(0, dp(12), 0, 0);
        ImageView tile = new ImageView(activity);
        tile.setImageDrawable(icon);
        LinearLayout.LayoutParams tileLp = new LinearLayout.LayoutParams(dp(36), dp(36));
        tileLp.topMargin = dp(2);
        row.addView(tile, tileLp);

        LinearLayout labels = new LinearLayout(activity);
        labels.setOrientation(LinearLayout.VERTICAL);
        labels.addView(text(title, 16, TEXT_PRIMARY, true));
        TextView text = text(body, 14, TEXT_SECONDARY, false);
        text.setLineSpacing(0, 1.15f);
        text.setPadding(0, dp(2), 0, 0);
        labels.addView(text);
        LinearLayout.LayoutParams labelsLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        labelsLp.leftMargin = dp(14);
        row.addView(labels, labelsLp);
        return row;
    }

    private TextView text(String value, int sp, int color, boolean bold) {
        TextView view = new TextView(activity);
        view.setText(value);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        view.setTextColor(color);
        if (bold) view.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        return view;
    }

    private int dp(int value) {
        return Math.round(value * density);
    }

    /** The settings button's sliders on a rounded tile, like the menu's icon tiles. */
    private static final class SlidersTile extends Drawable {
        private final int color;
        private final float density;
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint line = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();

        SlidersTile(int color, float density) {
            this.color = color;
            this.density = density;
            line.setStyle(Paint.Style.STROKE);
            line.setStrokeCap(Paint.Cap.ROUND);
            line.setColor(Color.WHITE);
        }

        @Override
        public void draw(Canvas canvas) {
            float s = Math.min(getBounds().width(), getBounds().height());
            rect.set(getBounds().left, getBounds().top, getBounds().left + s, getBounds().top + s);
            fill.setShader(new LinearGradient(0, rect.top, 0, rect.bottom,
                    lighten(color), color, Shader.TileMode.CLAMP));
            canvas.drawRoundRect(rect, s * 0.26f, s * 0.26f, fill);

            float size = s * 0.56f;
            float left = rect.centerX() - size / 2f, top = rect.centerY() - size / 2f;
            float r = s * 0.065f;
            line.setStrokeWidth(Math.max(1.5f, s * 0.06f));
            float[] rows = {0.2f, 0.5f, 0.8f};
            float[] knobs = {0.68f, 0.32f, 0.58f};
            for (int i = 0; i < rows.length; i++) {
                float y = top + size * rows[i];
                float kx = left + size * knobs[i];
                canvas.drawLine(left, y, kx - r, y, line);
                canvas.drawLine(kx + r, y, left + size, y, line);
                canvas.drawCircle(kx, y, r, line);
            }
        }

        private static int lighten(int color) {
            int r = (color >> 16) & 0xFF, g = (color >> 8) & 0xFF, b = color & 0xFF;
            return Color.rgb(r + (255 - r) * 30 / 100, g + (255 - g) * 30 / 100, b + (255 - b) * 30 / 100);
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
}
