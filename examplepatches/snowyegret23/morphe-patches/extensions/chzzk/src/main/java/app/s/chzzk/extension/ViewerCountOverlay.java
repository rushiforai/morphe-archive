package app.s.chzzk.extension;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import java.lang.ref.WeakReference;
import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.WeakHashMap;

/** Displays the native live-status count without making additional network requests. */
public final class ViewerCountOverlay extends View implements Runnable {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final LinkedHashMap<String, Sample> COUNTS = new LinkedHashMap<>();
    private static final WeakHashMap<ViewGroup, WeakReference<ViewerCountOverlay>> PLAYERS = new WeakHashMap<>();
    private static final ArrayList<WeakReference<ViewerCountOverlay>> VIEWS = new ArrayList<>();
    private static final long MAX_AGE_MS = 90_000L;
    private static final DateTimeFormatter OPEN_DATE = DateTimeFormatter.ofPattern("uuuu-MM-dd HH:mm:ss", Locale.ROOT);
    private final WeakReference<ViewGroup> player;
    private final boolean preview;
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final NumberFormat numbers = NumberFormat.getIntegerInstance(Locale.KOREA);
    private String label = "";
    private int revision = -1;
    private int corner;
    private int color;
    private int outlineColor;
    private int opacity;
    private int margin;
    private float textSize;
    private float outlineWidth;

    private static final class Sample {
        final int count;
        final long started;
        final long time = SystemClock.elapsedRealtime();
        Sample(int count, long started) { this.count = count; this.started = started; }
    }

    private ViewerCountOverlay(Context context, ViewGroup player, boolean preview) {
        super(context);
        this.player = new WeakReference<>(player);
        this.preview = preview;
        setClickable(false);
        setFocusable(false);
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        paint.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        paint.setStrokeJoin(Paint.Join.ROUND);
        VIEWS.add(new WeakReference<>(this));
    }

    // Replaced with version-checked DEX bridges when the APK is patched.
    public static void capture(Object detail, Object status) {}
    public static String currentChannel(ViewGroup player) { return null; }

    public static void attach(ViewGroup player) {
        WeakReference<ViewerCountOverlay> reference = PLAYERS.get(player);
        ViewerCountOverlay overlay = reference == null ? null : reference.get();
        if (overlay == null) {
            overlay = new ViewerCountOverlay(player.getContext(), player, false);
            PLAYERS.put(player, new WeakReference<>(overlay));
            final ViewerCountOverlay view = overlay;
            player.addOnLayoutChangeListener((host, left, top, right, bottom, ol, ot, or, ob) -> {
                view.layout(0, 0, right - left, bottom - top);
                view.invalidate();
            });
            // ViewOverlay draws above the video and never takes player touches or layout space.
            player.getOverlay().add(overlay);
        }
        overlay.layout(0, 0, player.getWidth(), player.getHeight());
        overlay.run();
    }

    static View preview(Context context) {
        return new ViewerCountOverlay(context, null, true);
    }

    public static void update(String channel, int count) {
        if (channel == null || channel.isEmpty()) return;
        synchronized (COUNTS) {
            Sample previous = COUNTS.remove(channel);
            long started = previous == null ? 0 : previous.started;
            if (count >= 0 || started > 0) COUNTS.put(channel, new Sample(count, started));
            while (COUNTS.size() > 8) COUNTS.remove(COUNTS.keySet().iterator().next());
        }
        refreshAll();
    }

    public static void updateLive(String channel, String status, String openDate) {
        long started = 0;
        if ("OPEN".equals(status) && openDate != null && !openDate.isEmpty()) {
            try {
                started = LocalDateTime.parse(openDate, OPEN_DATE).atZone(ZoneId.of("Asia/Seoul")).toInstant().toEpochMilli();
            } catch (DateTimeParseException ignored) {
            }
        }
        synchronized (COUNTS) {
            Sample previous = COUNTS.remove(channel);
            int count = "OPEN".equals(status) && previous != null ? previous.count : -1;
            if (count >= 0 || started > 0) COUNTS.put(channel, new Sample(count, started));
            while (COUNTS.size() > 8) COUNTS.remove(COUNTS.keySet().iterator().next());
        }
    }

    static void refreshAll() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            MAIN.post(ViewerCountOverlay::refreshAll);
            return;
        }
        for (int i = VIEWS.size() - 1; i >= 0; i--) {
            ViewerCountOverlay view = VIEWS.get(i).get();
            if (view == null) VIEWS.remove(i);
            else view.run();
        }
    }

    @Override protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        run();
    }

    @Override protected void onDetachedFromWindow() {
        removeCallbacks(this);
        super.onDetachedFromWindow();
    }

    @Override protected void onWindowVisibilityChanged(int visibility) {
        super.onWindowVisibilityChanged(visibility);
        if (visibility == VISIBLE) run();
        else removeCallbacks(this);
    }

    @Override public void run() {
        removeCallbacks(this);
        if (!isAttachedToWindow() || getWindowVisibility() != VISIBLE) return;
        int nextRevision = ChzzkSettings.settingsRevision();
        if (revision != nextRevision) {
            revision = nextRevision;
            corner = ChzzkSettings.number("viewer_corner", 1);
            color = ChzzkSettings.number("viewer_color", 0xffffff) | 0xff000000;
            outlineColor = ChzzkSettings.number("viewer_outline_color", 0) | 0xff000000;
            textSize = 16f * getResources().getDisplayMetrics().scaledDensity
                * ChzzkSettings.number("viewer_size", 100) / 100f;
            outlineWidth = ChzzkSettings.number("viewer_outline_width", 2);
            opacity = Math.round(255f * ChzzkSettings.number("viewer_opacity", 90) / 100f);
            margin = ChzzkSettings.number("viewer_margin", 3);
            invalidate();
        }
        boolean showCount = ChzzkSettings.enabledByDefault("viewer_count");
        boolean showTime = ChzzkSettings.enabled("viewer_broadcast_time");
        boolean enabled = showCount || showTime;
        int next = preview ? 12345 : -1;
        long started = preview ? System.currentTimeMillis() - 24_350_000L : 0;
        ViewGroup host = player.get();
        if (!preview && enabled && host != null && host.isShown()) {
            String channel = currentChannel(host);
            synchronized (COUNTS) {
                Sample sample = COUNTS.get(channel);
                if (sample != null && SystemClock.elapsedRealtime() - sample.time <= MAX_AGE_MS) {
                    next = sample.count;
                    started = sample.started;
                }
            }
        }
        String nextLabel = showCount && next >= 0
            ? (ChzzkSettings.enabledByDefault("viewer_count_label") ? "시청자 " : "") + numbers.format(next) + "명" : "";
        if (showTime && started > 0) {
            long seconds = Math.max(0, System.currentTimeMillis() - started) / 1000;
            nextLabel += (nextLabel.isEmpty() ? "" : " · ")
                + (ChzzkSettings.enabledByDefault("viewer_broadcast_time_label") ? "방송 " : "")
                + String.format(Locale.KOREA, "%02d:%02d:%02d", seconds / 3600, seconds / 60 % 60, seconds % 60);
        }
        if (!label.equals(nextLabel)) {
            label = nextLabel;
            invalidate();
        }
        // Only checks the current player/channel locally. Counts arrive via the native status poll.
        if (!preview && enabled && host != null) postDelayed(this, 1000);
    }

    @Override protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (label.isEmpty() || opacity == 0 || getWidth() <= 0 || getHeight() <= 0) return;
        float inset = Math.min(getWidth(), getHeight()) * margin / 100f + outlineWidth / 2f + 1f;
        float available = getWidth() - 2f * inset;
        if (available <= 0) return;
        paint.setTextSize(textSize);
        float width = paint.measureText(label);
        float height = paint.descent() - paint.ascent();
        float scale = Math.min(1f, Math.min(available / width, (getHeight() - 2f * inset) / height));
        if (scale <= 0) return;
        paint.setTextSize(textSize * scale);
        width = paint.measureText(label);
        float x = corner == 1 || corner == 3 ? getWidth() - inset - width : inset;
        float y = corner >= 2 ? getHeight() - inset - paint.descent() : inset - paint.ascent();
        if (outlineWidth > 0) {
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(outlineWidth);
            paint.setColor(outlineColor);
            paint.setAlpha(opacity);
            canvas.drawText(label, x, y, paint);
        }
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(color);
        paint.setAlpha(opacity);
        canvas.drawText(label, x, y, paint);
    }
}
