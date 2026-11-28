package com.waze.gw;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.RectF;
import android.view.View;

/**
 * Compact GPS-quality indicator shared by Settings, Bubble and HUD.
 *
 * Shows one GPS artwork at a time. A valid fix uses assets/wz_ui_icon/gps.png while a stale or
 * missing fix uses assets/wz_ui_icon/gps_signal_loss.png. The view owns no location listener; it
 * only renders Gateway's already-published fix.
 */
public final class GpsSignalView extends View {
    private static final int[] LEVEL_COLORS = {
            0xFF737B88, // no/stale fix
            0xFFFF5964, // very weak
            0xFFFFC247, // weak
            0xFF37D5FF, // good
            0xFF45E6B1  // excellent
    };

    private final Paint iconPaint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
    private final RectF target = new RectF();
    private Bitmap fixIcon;
    private Bitmap lossIcon;
    private int level;

    public GpsSignalView(Context context) {
        super(context);
        loadIcon(context);
        setLevel(0);
    }

    private void loadIcon(Context context) {
        fixIcon = loadAsset(context, "wz_ui_icon/gps.png");
        lossIcon = loadAsset(context, "wz_ui_icon/gps_signal_loss.png");
    }

    private static Bitmap loadAsset(Context context, String path) {
        java.io.InputStream stream = null;
        try {
            stream = context.getAssets().open(path);
            return BitmapFactory.decodeStream(stream);
        } catch (Throwable ignored) {
            return null;
        } finally {
            if (stream != null) try { stream.close(); } catch (Throwable ignored) { }
        }
    }

    public void setLevel(int value) {
        int next = Math.max(0, Math.min(4, value));
        if (next == level && iconPaint.getColorFilter() != null) return;
        level = next;
        int color = LEVEL_COLORS[level];
        iconPaint.setColorFilter(new PorterDuffColorFilter(color, PorterDuff.Mode.SRC_IN));
        setContentDescription(level == 0
                ? I18n.tr("ui.no_gps_signal") : I18n.f("ui.gps_quality_0_out_of_4", level));
        invalidate();
    }

    public int getLevel() {
        return level;
    }

    public static int colorForLevel(int value) {
        return LEVEL_COLORS[Math.max(0, Math.min(4, value))];
    }

    @Override protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        float w = getWidth();
        float h = getHeight();
        if (w <= 0f || h <= 0f) return;

        Bitmap artwork = level == 0 ? lossIcon : fixIcon;
        if (artwork == null) artwork = level == 0 ? fixIcon : lossIcon;
        if (artwork == null) return;

        float scale = Math.min(w / artwork.getWidth(), h / artwork.getHeight());
        float drawWidth = artwork.getWidth() * scale;
        float drawHeight = artwork.getHeight() * scale;
        float left = (w - drawWidth) * 0.5f;
        float top = (h - drawHeight) * 0.5f;
        target.set(left, top, left + drawWidth, top + drawHeight);
        canvas.drawBitmap(artwork, null, target, iconPaint);
    }
}
