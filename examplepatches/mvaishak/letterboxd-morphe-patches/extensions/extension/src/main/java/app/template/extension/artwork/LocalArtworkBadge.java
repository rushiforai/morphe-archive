package app.template.extension.artwork;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.widget.Button;

import app.template.extension.settings.AccentPresets;
import app.template.extension.settings.Prefs;

/** A trailing label on the native action row when the action saves artwork on this device. */
final class LocalArtworkBadge extends Drawable {
    private static final String LABEL = "LOCAL";

    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final int accent;
    private final float density;
    private int alpha = 255;

    private LocalArtworkBadge(Context context) {
        density = context.getResources().getDisplayMetrics().density;
        accent = 0xFF000000 | AccentPresets.previewColor(context,
                Prefs.getString(Prefs.KEY_THEME_ACCENT, AccentPresets.defaultAccent(context)),
                Prefs.getString(Prefs.KEY_THEME_ACCENT_HEX, ""));
        paint.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        paint.setTextSize(Math.max(10 * density, 10 * context.getResources().getDisplayMetrics().scaledDensity));
        paint.setTextAlign(Paint.Align.CENTER);
        setBounds(0, 0, (int) Math.ceil(paint.measureText(LABEL) + 14 * density),
                (int) Math.ceil(Math.max(20 * density, paint.getFontSpacing() + 6 * density)));
    }

    static void mark(Button button) {
        Drawable[] icons = button.getCompoundDrawablesRelative();
        button.setCompoundDrawablesRelative(icons[0], icons[1], new LocalArtworkBadge(button.getContext()), icons[3]);
        button.setContentDescription(button.getText() + ", local artwork");
    }

    @Override
    public void draw(Canvas canvas) {
        Rect bounds = getBounds();
        float radius = bounds.height() / 2f;
        float inset = density / 2;
        paint.setColor(accent);
        paint.setStyle(Paint.Style.FILL);
        paint.setAlpha(alpha * 28 / 255);
        canvas.drawRoundRect(bounds.left, bounds.top, bounds.right, bounds.bottom, radius, radius, paint);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(density);
        paint.setAlpha(alpha * 145 / 255);
        canvas.drawRoundRect(bounds.left + inset, bounds.top + inset, bounds.right - inset, bounds.bottom - inset,
                radius, radius, paint);
        paint.setStyle(Paint.Style.FILL);
        paint.setAlpha(alpha);
        canvas.drawText(LABEL, bounds.exactCenterX(),
                bounds.exactCenterY() - (paint.ascent() + paint.descent()) / 2, paint);
    }

    @Override
    public void setAlpha(int alpha) {
        this.alpha = alpha;
        invalidateSelf();
    }

    @Override
    public void setColorFilter(ColorFilter colorFilter) {
        paint.setColorFilter(colorFilter);
        invalidateSelf();
    }

    @Override
    public int getOpacity() {
        return PixelFormat.TRANSLUCENT;
    }
}
