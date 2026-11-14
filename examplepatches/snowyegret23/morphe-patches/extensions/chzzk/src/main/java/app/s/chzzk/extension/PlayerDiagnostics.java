package app.s.chzzk.extension;

import android.content.Context;
import android.content.pm.PackageManager;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;

public final class PlayerDiagnostics extends View implements Runnable, View.OnLayoutChangeListener {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ArrayList<WeakReference<ViewGroup>> HOSTS = new ArrayList<>();
    private static final WeakHashMap<ViewGroup, WeakReference<PlayerDiagnostics>> VIEWS = new WeakHashMap<>();
    private static volatile boolean statistics;
    private static volatile int profile;
    private static final OnAttachStateChangeListener LIFECYCLE = new OnAttachStateChangeListener() {
        @Override public void onViewAttachedToWindow(View view) { attach((ViewGroup) view); }
        @Override public void onViewDetachedFromWindow(View view) { detach((ViewGroup) view); }
    };
    private final WeakReference<ViewGroup> host;
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final long[] values = new long[5];
    private final float density;
    private final float textSize;
    private String first = "";
    private String second = "";

    private PlayerDiagnostics(Context context, ViewGroup player) {
        super(context);
        host = new WeakReference<>(player);
        density = getResources().getDisplayMetrics().density;
        boolean television = context.getPackageManager().hasSystemFeature(PackageManager.FEATURE_LEANBACK);
        textSize = (television ? 14f : 12f) * getResources().getDisplayMetrics().scaledDensity;
        paint.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        paint.setStrokeJoin(Paint.Join.ROUND);
        setClickable(false);
        setFocusable(false);
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
    }

    public static void configure(boolean showStatistics, int playbackProfile) {
        statistics = showStatistics;
        profile = Math.max(0, Math.min(2, playbackProfile));
        MAIN.post(() -> {
            for (int i = HOSTS.size() - 1; i >= 0; i--) {
                ViewGroup player = HOSTS.get(i).get();
                if (player == null) HOSTS.remove(i);
                else refresh(player);
            }
        });
    }

    public static int profileMode() { return profile; }

    public static void attach(ViewGroup player) {
        String name = player.getClass().getName();
        if (!name.equals("com.navercorp.game.android.community.app.feature.overlayplayer.OverlayPlayerView")
            && !name.equals("com.navercorp.game.android.community.tv.feature.overlayplayer.OverlayPlayerView")) return;
        if (Looper.myLooper() != Looper.getMainLooper()) {
            MAIN.post(() -> attach(player));
            return;
        }
        boolean known = false;
        for (int i = HOSTS.size() - 1; i >= 0; i--) {
            ViewGroup existing = HOSTS.get(i).get();
            if (existing == null) HOSTS.remove(i);
            else if (existing == player) known = true;
        }
        if (!known) {
            HOSTS.add(new WeakReference<>(player));
            player.addOnAttachStateChangeListener(LIFECYCLE);
        }
        refresh(player);
    }

    public static void detach(ViewGroup player) {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            MAIN.post(() -> detach(player));
            return;
        }
        remove(player);
        player.removeOnAttachStateChangeListener(LIFECYCLE);
        for (int i = HOSTS.size() - 1; i >= 0; i--) {
            ViewGroup existing = HOSTS.get(i).get();
            if (existing == null || existing == player) HOSTS.remove(i);
        }
    }

    private static void remove(ViewGroup player) {
        WeakReference<PlayerDiagnostics> reference = VIEWS.remove(player);
        PlayerDiagnostics view = reference == null ? null : reference.get();
        if (view == null) return;
        view.removeCallbacks(view);
        player.removeOnLayoutChangeListener(view);
        player.getOverlay().remove(view);
    }

    private static void refresh(ViewGroup player) {
        if (!statistics || !player.isAttachedToWindow()) {
            remove(player);
            return;
        }
        WeakReference<PlayerDiagnostics> reference = VIEWS.get(player);
        PlayerDiagnostics view = reference == null ? null : reference.get();
        if (view == null) {
            view = new PlayerDiagnostics(player.getContext(), player);
            VIEWS.put(player, new WeakReference<>(view));
            player.addOnLayoutChangeListener(view);
            player.getOverlay().add(view);
        }
        view.layout(0, 0, player.getWidth(), player.getHeight());
        view.run();
        view.invalidate();
    }

    // Replaced with validated native DEX calls when the APK is patched.
    public static boolean sample(ViewGroup player, long[] values) { return false; }
    public static Object applyProfile(Object source, Object stream, Object params) { return params; }
    public static void applyLowLatency(Object params, int mode) {}

    public static boolean profileAllowed(Map<?, ?> extras) {
        if (extras == null) return false;
        return !Boolean.TRUE.equals(extras.get("extra_ad"))
            && !"LIVE_REWIND".equals(extras.get("prism.media.key_extras_live_media_type"));
    }

    public static int[] bufferProfile(int mode, int minimum, int maximum, int startup, int recovery) {
        if (mode == 0 || minimum < 0 || maximum < minimum || startup < 0 || recovery < 0) return null;
        if (mode == 1) {
            startup = Math.max(1000, Math.min(startup, 1500));
            recovery = Math.max(1000, Math.min(recovery, 2500));
            minimum = Math.max(Math.max(startup, recovery), Math.min(minimum, 15000));
        } else {
            startup = Math.max(startup, 2500);
            recovery = Math.max(recovery, 5000);
            minimum = Math.max(Math.max(startup, recovery), Math.max(minimum, 25000));
            maximum = Math.max(maximum, 45000);
        }
        return new int[] {minimum, Math.max(minimum, maximum), startup, recovery};
    }

    // The max/min order matches the native LowLatencyLiveConfiguration constructor.
    public static long targetOffset(int mode, long original, long maximum, long minimum) {
        long unset = Long.MIN_VALUE + 1;
        if ((mode != 1 && mode != 2) || original < 0
            || (minimum < 0 && minimum != unset) || (maximum < 0 && maximum != unset)
            || (minimum >= 0 && maximum >= 0 && minimum > maximum)
            || (minimum >= 0 && original < minimum) || (maximum >= 0 && original > maximum)) return original;
        long target = mode == 1 ? Math.min(original, 3000) : Math.max(original, 6000);
        if (minimum >= 0) target = Math.max(target, minimum);
        if (maximum >= 0) target = Math.min(target, maximum);
        return target;
    }

    @Override public void onLayoutChange(View view, int left, int top, int right, int bottom,
        int oldLeft, int oldTop, int oldRight, int oldBottom) {
        layout(0, 0, right - left, bottom - top);
        invalidate();
    }

    @Override protected void onDetachedFromWindow() {
        removeCallbacks(this);
        super.onDetachedFromWindow();
    }

    @Override protected void onWindowVisibilityChanged(int visibility) {
        super.onWindowVisibilityChanged(visibility);
        if (visibility == VISIBLE && host != null) run();
        else removeCallbacks(this);
    }

    @Override protected void onVisibilityChanged(View changedView, int visibility) {
        super.onVisibilityChanged(changedView, visibility);
        if (visibility == VISIBLE && host != null) run();
        else removeCallbacks(this);
    }

    @Override public void run() {
        removeCallbacks(this);
        ViewGroup player = host.get();
        if (!statistics || player == null || !isAttachedToWindow() || !player.isShown()
            || getWindowVisibility() != VISIBLE) return;
        String nextFirst = "";
        String nextSecond = "";
        try {
            if (sample(player, values)) {
                nextFirst = (values[3] > 0 && values[4] > 0 ? values[3] + "×" + values[4] : "오디오")
                    + "  재생 " + position(values[0]);
                nextSecond = "버퍼 " + seconds(values[1], values[0])
                    + " · 라이브 끝까지 " + seconds(values[2], values[0]);
            }
        } catch (RuntimeException | LinkageError ignored) {
        }
        if (!first.equals(nextFirst) || !second.equals(nextSecond)) {
            first = nextFirst;
            second = nextSecond;
            invalidate();
        }
        postDelayed(this, 1000);
    }

    private static String position(long millis) {
        if (millis < 0) return "—";
        long seconds = millis / 1000;
        return String.format(Locale.KOREA, "%d:%02d:%02d", seconds / 3600, seconds / 60 % 60, seconds % 60);
    }

    private static String seconds(long end, long current) {
        if (current < 0 || end <= 0 || end == Long.MAX_VALUE || end < current) return "—";
        return String.format(Locale.KOREA, "%.1f초", (end - current) / 1000.0);
    }

    @Override protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (first.isEmpty() || getWidth() <= 0 || getHeight() <= 0) return;
        float margin = Math.min(getWidth(), getHeight()) * 0.03f;
        float padding = 6 * density;
        paint.setTextSize(textSize);
        float width = Math.max(paint.measureText(first), paint.measureText(second));
        float available = getWidth() - 2 * (margin + padding);
        if (available <= 0 || width <= 0) return;
        paint.setTextSize(textSize * Math.min(1f, available / width));
        width = Math.max(paint.measureText(first), paint.measureText(second));
        float line = paint.descent() - paint.ascent() + 3 * density;
        float bottom = getHeight() - margin;
        float top = Math.max(margin, bottom - 2 * line - 2 * padding);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(0xb8000000);
        canvas.drawRoundRect(margin, top, margin + width + 2 * padding, bottom, 4 * density, 4 * density, paint);
        float baseline = top + padding - paint.ascent();
        int outline = ChzzkSettings.number("statistics_outline_width", 0);
        if (outline > 0) {
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(outline);
            paint.setColor(ChzzkSettings.number("statistics_outline_color", 0) | 0xff000000);
            canvas.drawText(first, margin + padding, baseline, paint);
            canvas.drawText(second, margin + padding, baseline + line, paint);
        }
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(0xfff0f0f0);
        canvas.drawText(first, margin + padding, baseline, paint);
        canvas.drawText(second, margin + padding, baseline + line, paint);
    }
}
