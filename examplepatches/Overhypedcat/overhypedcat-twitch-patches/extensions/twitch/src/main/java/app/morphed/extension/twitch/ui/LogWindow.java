package app.morphed.extension.twitch.ui;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.os.Build;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.lang.ref.WeakReference;

import app.morphed.extension.twitch.App;
import app.morphed.extension.twitch.patches.DebugLog;

/**
 * Debug mode's live log: a medium window over the app (not full screen, so the stream stays in view), moved by
 * dragging its top bar, folded to that bar with one button and closed with the other (the log file goes on).
 */
public final class LogWindow {
    private static final int MAX_LINES = 400;
    private static WeakReference<View> shown = new WeakReference<>(null);
    private static float savedX = Float.NaN, savedY = Float.NaN;
    private static boolean folded;
    /** Lines waiting to be shown: added in one go a few times a second, not a layout per line. */
    private static final StringBuilder WAITING = new StringBuilder();
    private static boolean flushQueued;
    private static final DebugLog.LineListener LISTENER = raw -> {
        String line = Readable.of(raw);
        if (line == null) return; // routine and fine: in the file only
        synchronized (WAITING) {
            WAITING.append(WAITING.length() == 0 ? "" : "\n").append(line);
            if (flushQueued) return;
            flushQueued = true;
        }
        App.MAIN.postDelayed(LogWindow::flushWaiting, 250);
    };

    private static void flushWaiting() {
        String lines;
        synchronized (WAITING) {
            lines = WAITING.toString();
            WAITING.setLength(0);
            flushQueued = false;
        }
        if (!lines.isEmpty()) append(lines);
    }
    private static TextView text;
    private static ScrollView scroll;

    private LogWindow() {
    }

    /** Shows the window on this screen (once Debug mode is on). */
    public static void show(Activity activity) {
        if (activity == null || activity.isFinishing()) return;
        if (Build.VERSION.SDK_INT >= 24 && activity.isInPictureInPictureMode()) return; // too small to read
        View current = shown.get();
        ViewGroup root = (ViewGroup) activity.getWindow().getDecorView();
        if (current != null && current.getParent() == root) return;
        hide();
        View window = build(activity);
        root.addView(window);
        shown = new WeakReference<>(window);
        DebugLog.removeListener(LISTENER);
        synchronized (WAITING) { // the new window starts from the latest lines: what waited is in them
            WAITING.setLength(0);
        }
        DebugLog.addListener(LISTENER);
    }

    public static void hide() {
        View current = shown.get();
        if (current != null && current.getParent() instanceof ViewGroup) ((ViewGroup) current.getParent()).removeView(current);
        shown = new WeakReference<>(null);
        DebugLog.removeListener(LISTENER);
        text = null;
        scroll = null;
    }

    private static final int[] COVER_AT = new int[2];

    /** Whether the log window, as shown, covers this point on the screen. */
    static boolean covers(float screenX, float screenY) {
        View window = shown.get();
        if (window == null || !window.isAttachedToWindow() || window.getVisibility() != View.VISIBLE) return false;
        window.getLocationOnScreen(COVER_AT);
        return screenX >= COVER_AT[0] && screenX < COVER_AT[0] + window.getWidth()
                && screenY >= COVER_AT[1] && screenY < COVER_AT[1] + window.getHeight();
    }

    private static void append(String line) {
        TextView view = text;
        if (view == null) return;
        boolean atEnd = scroll == null || scroll.getChildAt(0) == null
                || scroll.getScrollY() + scroll.getHeight() >= scroll.getChildAt(0).getHeight() - 24;
        view.append(view.length() == 0 ? line : "\n" + line);
        if (view.getLineCount() > MAX_LINES + 50) { // keep it light: the file has everything
            CharSequence all = view.getText();
            int cut = 0;
            for (int i = 0; i < 50 && cut >= 0; i++) cut = TextUtils.indexOf(all, '\n', cut + 1);
            if (cut > 0) view.setText(all.subSequence(cut + 1, all.length()));
        }
        ScrollView target = scroll; // (the window may be gone by the time this runs)
        if (atEnd && target != null) target.post(() -> target.fullScroll(View.FOCUS_DOWN));
    }

    @SuppressLint("ClickableViewAccessibility")
    private static View build(Activity activity) {
        Context context = activity;
        Theme theme = new Theme(context);
        DisplayMetrics metrics = context.getResources().getDisplayMetrics();
        float density = metrics.density;
        int width = widthFor(metrics.widthPixels, density);
        int[] height = {heightFor(metrics.heightPixels, density)}; // (unfolded; follows the screen's size)

        LinearLayout panel = new LinearLayout(context);
        panel.setOrientation(LinearLayout.VERTICAL);
        panel.setBackground(new Squircle(0xEB141417, theme.dpf(16)).border(0x33FFFFFF, theme.dpf(1)));
        panel.setClipToOutline(true);
        panel.setElevation(theme.dpf(12));

        LinearLayout bar = new LinearLayout(context);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setPadding(theme.dp(14), theme.dp(4), theme.dp(4), theme.dp(4));
        TextView title = new TextView(context);
        title.setText("Debug mode");
        title.setTextColor(0xFFEFEFF1);
        title.setTextSize(13);
        title.setTypeface(TwitchFonts.semiBold(context));
        bar.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        IconButton fold = new IconButton(context, theme, IconButton.FOLD);
        IconButton close = new IconButton(context, theme, IconButton.CLOSE);
        fold.setContentDescription("Fold the log");
        close.setContentDescription("Close the log window, logging goes on");
        bar.addView(fold);
        bar.addView(close);
        panel.addView(bar);

        ScrollView scrollView = new ScrollView(context);
        TextView lines = new TextView(context);
        lines.setTextSize(12);
        lines.setTypeface(TwitchFonts.regular(context));
        lines.setLineSpacing(0, 1.15f);
        lines.setTextColor(0xFFDADADF);
        lines.setTextIsSelectable(false); // selectable text re-measures everything on each change
        lines.setPadding(theme.dp(12), 0, theme.dp(12), theme.dp(10));
        StringBuilder start = new StringBuilder();
        for (String raw : DebugLog.recent()) {
            String line = Readable.of(raw);
            if (line != null) start.append(start.length() == 0 ? "" : "\n").append(line);
        }
        lines.setText(start);
        scrollView.addView(lines);
        panel.addView(scrollView, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        scrollView.setVisibility(folded ? View.GONE : View.VISIBLE);
        scrollView.post(() -> scrollView.fullScroll(View.FOCUS_DOWN));
        text = lines;
        scroll = scrollView;

        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(width, folded ? ViewGroup.LayoutParams.WRAP_CONTENT : height[0]);
        panel.setLayoutParams(params);
        float x = Float.isNaN(savedX) ? metrics.widthPixels - width - theme.dp(12) : savedX;
        float y = Float.isNaN(savedY) ? metrics.heightPixels - height[0] - theme.dp(96) : savedY;
        panel.setX(x);
        // On the screen whatever its size now (turned to landscape, the full-screen player): kept inside it.
        root(activity).addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
            @Override
            public void onLayoutChange(View v, int l, int t, int r, int b, int ol, int ot, int or, int ob) {
                if (panel.getParent() == null) {
                    v.removeOnLayoutChangeListener(this);
                    return;
                }
                if (r - l == or - ol && b - t == ob - ot) return;
                // Sized afresh from the screen as it is now (turned around, split, resized), then kept inside it.
                int newWidth = widthFor(r - l, density);
                height[0] = heightFor(b - t, density);
                panel.post(() -> {
                    ViewGroup.LayoutParams lp = panel.getLayoutParams();
                    lp.width = newWidth;
                    if (!folded) lp.height = height[0];
                    panel.setLayoutParams(lp);
                    keepInside(panel);
                });
            }
        });
        panel.post(() -> keepInside(panel));
        panel.setY(y);

        fold.setOnClickListener(v -> {
            folded = !folded;
            scrollView.setVisibility(folded ? View.GONE : View.VISIBLE);
            ViewGroup.LayoutParams lp = panel.getLayoutParams();
            lp.height = folded ? ViewGroup.LayoutParams.WRAP_CONTENT : height[0];
            panel.setLayoutParams(lp);
            fold.setShape(folded ? IconButton.UNFOLD : IconButton.FOLD);
        });
        fold.setShape(folded ? IconButton.UNFOLD : IconButton.FOLD);
        close.setOnClickListener(v -> DebugMode.closeWindow(activity));

        float[] grab = new float[2];
        bar.setOnTouchListener((v, event) -> {
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    grab[0] = event.getRawX() - panel.getX();
                    grab[1] = event.getRawY() - panel.getY();
                    return true;
                case MotionEvent.ACTION_MOVE:
                    View parent = (View) panel.getParent();
                    float maxX = parent == null ? metrics.widthPixels : parent.getWidth() - panel.getWidth();
                    float maxY = parent == null ? metrics.heightPixels : parent.getHeight() - panel.getHeight();
                    savedX = Math.max(0, Math.min(event.getRawX() - grab[0], maxX));
                    savedY = Math.max(0, Math.min(event.getRawY() - grab[1], maxY));
                    panel.setX(savedX);
                    panel.setY(savedY);
                    return true;
                default:
                    return true;
            }
        });
        return panel;
    }

    /** Two thirds of the screen's width (at least 300 dp), leaving a margin. */
    static int widthFor(int screenWidth, float density) {
        int margin = Math.round(24 * density), least = Math.round(300 * density);
        return Math.max(0, Math.min(screenWidth - margin, Math.max(least, (int) (screenWidth * 0.66f))));
    }

    /** A third of the screen's height (at least 200 dp), never more than the screen. */
    static int heightFor(int screenHeight, float density) {
        return Math.min(screenHeight, Math.max(Math.round(200 * density), (int) (screenHeight * 0.32f)));
    }

    private static ViewGroup root(Activity activity) {
        return (ViewGroup) activity.getWindow().getDecorView();
    }

    /** Moves the window back inside its parent (and shrinks it to fit when the screen got smaller). */
    private static void keepInside(View panel) {
        View parent = (View) panel.getParent();
        if (parent == null || parent.getWidth() == 0) return;
        ViewGroup.LayoutParams params = panel.getLayoutParams();
        if (params.width > parent.getWidth()) {
            params.width = parent.getWidth();
            panel.setLayoutParams(params);
        }
        if (params.height > 0 && params.height > parent.getHeight()) {
            params.height = parent.getHeight();
            panel.setLayoutParams(params);
        }
        float maxX = Math.max(0, parent.getWidth() - Math.min(panel.getWidth() > 0 ? panel.getWidth() : params.width, parent.getWidth()));
        float maxY = Math.max(0, parent.getHeight() - Math.min(panel.getHeight() > 0 ? panel.getHeight() : Math.max(params.height, 0), parent.getHeight()));
        panel.setX(Math.max(0, Math.min(panel.getX(), maxX)));
        panel.setY(Math.max(0, Math.min(panel.getY(), maxY)));
    }

    /** A small round button with a drawn icon (no image assets): fold, unfold or close. */
    static final class IconButton extends View {
        static final int FOLD = 0, UNFOLD = 1, CLOSE = 2;
        private final Theme theme;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint pressed = new Paint(Paint.ANTI_ALIAS_FLAG);
        private int shape;
        private final android.graphics.Path highlight = new android.graphics.Path();

        IconButton(Context context, Theme theme, int shape) {
            super(context);
            this.theme = theme;
            this.shape = shape;
            paint.setColor(0xFFEFEFF1);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(theme.dpf(1.8f));
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
            pressed.setColor(0x26FFFFFF);
            setClickable(true);
            setFocusable(true);
        }

        void setShape(int value) {
            shape = value;
            invalidate();
        }

        @Override
        protected void onMeasure(int w, int h) {
            setMeasuredDimension(theme.dp(40), theme.dp(40));
        }

        @Override
        protected void drawableStateChanged() {
            super.drawableStateChanged();
            invalidate();
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float cx = getWidth() / 2f, cy = getHeight() / 2f, r = theme.dpf(6);
            if (isPressed()) {
                Squircle.path(new android.graphics.RectF(cx - theme.dpf(16), cy - theme.dpf(16), cx + theme.dpf(16),
                        cy + theme.dpf(16)), theme.dpf(10), highlight);
                canvas.drawPath(highlight, pressed);
            }
            if (shape == CLOSE) {
                canvas.drawLine(cx - r, cy - r, cx + r, cy + r, paint);
                canvas.drawLine(cx - r, cy + r, cx + r, cy - r, paint);
            } else {
                float dir = shape == FOLD ? -1 : 1; // chevron up folds, down unfolds
                float tip = cy + dir * r * 0.55f, base = cy - dir * r * 0.55f;
                canvas.drawLine(cx - r, base, cx, tip, paint);
                canvas.drawLine(cx, tip, cx + r, base, paint);
            }
        }
    }
}
