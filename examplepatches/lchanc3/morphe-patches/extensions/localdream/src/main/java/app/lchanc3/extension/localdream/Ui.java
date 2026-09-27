package app.lchanc3.extension.localdream;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.util.TypedValue;
import android.view.Gravity;
import android.widget.ImageView;
import android.widget.TextView;

/**
 * Colors, icons and buttons for the batch screen, made without the app's
 * resources: they are renamed in every build, and the screen is plain views
 * while the app is Compose. The colors follow the app's own theme settings:
 * the wallpaper's colors when it uses dynamic color, its preset otherwise.
 */
final class Ui {

    final Context context;
    final boolean night;

    final int background;
    final int surfaceContainer;
    final int surfaceContainerHigh;
    final int onSurface;
    final int onSurfaceVariant;
    final int outline;
    final int outlineVariant;
    final int primary;
    final int onPrimary;
    final int primaryContainer;
    final int onPrimaryContainer;
    final int secondaryContainer;
    final int onSecondaryContainer;
    final int error;
    final int errorContainer;
    final int onErrorContainer;

    Ui(Context context) {
        this.context = context;

        // The app's own theme settings, which can differ from the phone's.
        SharedPreferences theme = context.getSharedPreferences("theme_prefs", Context.MODE_PRIVATE);
        String darkMode = theme.getString("dark_mode", "SYSTEM");
        if ("DARK".equals(darkMode)) {
            night = true;
        } else if ("LIGHT".equals(darkMode)) {
            night = false;
        } else {
            night = (context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        }
        boolean dynamic = Build.VERSION.SDK_INT >= 31 && theme.getBoolean("dynamic_color", true);

        int[] scheme;
        if (dynamic && Build.VERSION.SDK_INT >= 34) {
            scheme = night ? new int[]{
                color(android.R.color.system_background_dark),
                color(android.R.color.system_surface_container_dark),
                color(android.R.color.system_surface_container_high_dark),
                color(android.R.color.system_on_surface_dark),
                color(android.R.color.system_on_surface_variant_dark),
                color(android.R.color.system_outline_dark),
                color(android.R.color.system_outline_variant_dark),
                color(android.R.color.system_primary_dark),
                color(android.R.color.system_on_primary_dark),
                color(android.R.color.system_primary_container_dark),
                color(android.R.color.system_on_primary_container_dark),
                color(android.R.color.system_secondary_container_dark),
                color(android.R.color.system_on_secondary_container_dark),
                color(android.R.color.system_error_dark),
                color(android.R.color.system_error_container_dark),
                color(android.R.color.system_on_error_container_dark),
            } : new int[]{
                color(android.R.color.system_background_light),
                color(android.R.color.system_surface_container_light),
                color(android.R.color.system_surface_container_high_light),
                color(android.R.color.system_on_surface_light),
                color(android.R.color.system_on_surface_variant_light),
                color(android.R.color.system_outline_light),
                color(android.R.color.system_outline_variant_light),
                color(android.R.color.system_primary_light),
                color(android.R.color.system_on_primary_light),
                color(android.R.color.system_primary_container_light),
                color(android.R.color.system_on_primary_container_light),
                color(android.R.color.system_secondary_container_light),
                color(android.R.color.system_on_secondary_container_light),
                color(android.R.color.system_error_light),
                color(android.R.color.system_error_container_light),
                color(android.R.color.system_on_error_container_light),
            };
        } else if (dynamic) {
            // Android 12 and 13 have the wallpaper's tonal palettes but not the
            // roles picked out of them; these are the tones Material 3 picks.
            int[] errors = presetScheme("TANGERINE", night);
            scheme = new int[]{
                color(night ? android.R.color.system_neutral1_900 : android.R.color.system_neutral1_10),
                color(night ? android.R.color.system_neutral1_800 : android.R.color.system_neutral1_50),
                color(night ? android.R.color.system_neutral2_800 : android.R.color.system_neutral2_100),
                color(night ? android.R.color.system_neutral1_100 : android.R.color.system_neutral1_900),
                color(night ? android.R.color.system_neutral2_200 : android.R.color.system_neutral2_700),
                color(night ? android.R.color.system_neutral2_400 : android.R.color.system_neutral2_500),
                color(night ? android.R.color.system_neutral2_700 : android.R.color.system_neutral2_200),
                color(night ? android.R.color.system_accent1_200 : android.R.color.system_accent1_600),
                color(night ? android.R.color.system_accent1_800 : android.R.color.system_accent1_0),
                color(night ? android.R.color.system_accent1_700 : android.R.color.system_accent1_100),
                color(night ? android.R.color.system_accent1_100 : android.R.color.system_accent1_900),
                color(night ? android.R.color.system_accent2_700 : android.R.color.system_accent2_100),
                color(night ? android.R.color.system_accent2_100 : android.R.color.system_accent2_900),
                errors[13], errors[14], errors[15],
            };
        } else {
            scheme = presetScheme(theme.getString("preset", "TANGERINE"), night);
        }

        background = scheme[0];
        surfaceContainer = scheme[1];
        surfaceContainerHigh = scheme[2];
        onSurface = scheme[3];
        onSurfaceVariant = scheme[4];
        outline = scheme[5];
        outlineVariant = scheme[6];
        primary = scheme[7];
        onPrimary = scheme[8];
        primaryContainer = scheme[9];
        onPrimaryContainer = scheme[10];
        secondaryContainer = scheme[11];
        onSecondaryContainer = scheme[12];
        error = scheme[13];
        errorContainer = scheme[14];
        onErrorContainer = scheme[15];
    }

    /**
     * The app's preset color schemes, for when dynamic color is off: background,
     * surfaceContainer, surfaceContainerHigh, onSurface, onSurfaceVariant,
     * outline, outlineVariant, primary, onPrimary, primaryContainer,
     * onPrimaryContainer, secondaryContainer, onSecondaryContainer, error,
     * errorContainer, onErrorContainer.
     */
    private static final Object[] PRESETS = {
        "TANGERINE_LIGHT", new int[]{0xFFFFF8F6, 0xFFFCEAE5, 0xFFF7E4E0, 0xFF231917, 0xFF53433F, 0xFF85736E, 0xFFD8C2BC, 0xFF8F4C38, 0xFFFFFFFF, 0xFFFFDBD1, 0xFF723523, 0xFFFFDBD1, 0xFF5D4037, 0xFFBA1A1A, 0xFFFFDAD6, 0xFF93000A},
        "TANGERINE_DARK", new int[]{0xFF1A110F, 0xFF271D1B, 0xFF322825, 0xFFF1DFDA, 0xFFD8C2BC, 0xFFA08C87, 0xFF53433F, 0xFFFFB5A0, 0xFF561F0F, 0xFF723523, 0xFFFFDBD1, 0xFF5D4037, 0xFFFFDBD1, 0xFFFFB4AB, 0xFF93000A, 0xFFFFDAD6},
        "FOREST_LIGHT", new int[]{0xFFF9FAEF, 0xFFEEEFE3, 0xFFE8E9DE, 0xFF1A1C16, 0xFF44483D, 0xFF75796C, 0xFFC5C8BA, 0xFF4C662B, 0xFFFFFFFF, 0xFFCDEDA3, 0xFF354E16, 0xFFDCE7C8, 0xFF404A33, 0xFFBA1A1A, 0xFFFFDAD6, 0xFF93000A},
        "FOREST_DARK", new int[]{0xFF12140E, 0xFF1E201A, 0xFF282B24, 0xFFE2E3D8, 0xFFC5C8BA, 0xFF8F9285, 0xFF44483D, 0xFFB1D18A, 0xFF1F3701, 0xFF354E16, 0xFFCDEDA3, 0xFF404A33, 0xFFDCE7C8, 0xFFFFB4AB, 0xFF93000A, 0xFFFFDAD6},
        "OCEAN_LIGHT", new int[]{0xFFF9F9FF, 0xFFEDEDF4, 0xFFE7E8EE, 0xFF191C20, 0xFF44474E, 0xFF74777F, 0xFFC4C6D0, 0xFF415F91, 0xFFFFFFFF, 0xFFD6E3FF, 0xFF284777, 0xFFDAE2F9, 0xFF3E4759, 0xFFBA1A1A, 0xFFFFDAD6, 0xFF93000A},
        "OCEAN_DARK", new int[]{0xFF111318, 0xFF1D2024, 0xFF282A2F, 0xFFE2E2E9, 0xFFC4C6D0, 0xFF8E9099, 0xFF44474E, 0xFFAAC7FF, 0xFF0A305F, 0xFF284777, 0xFFD6E3FF, 0xFF3E4759, 0xFFDAE2F9, 0xFFFFB4AB, 0xFF93000A, 0xFFFFDAD6},
        "AMBER_LIGHT", new int[]{0xFFFFF9EE, 0xFFF4EDDF, 0xFFEEE8DA, 0xFF1E1B13, 0xFF4B4739, 0xFF7C7767, 0xFFCDC6B4, 0xFF6D5E0F, 0xFFFFFFFF, 0xFFF8E287, 0xFF534600, 0xFFEEE2BC, 0xFF4E472A, 0xFFBA1A1A, 0xFFFFDAD6, 0xFF93000A},
        "AMBER_DARK", new int[]{0xFF15130B, 0xFF222017, 0xFF2D2A21, 0xFFE8E2D4, 0xFFCDC6B4, 0xFF969080, 0xFF4B4739, 0xFFDBC66E, 0xFF3A3000, 0xFF534600, 0xFFF8E287, 0xFF4E472A, 0xFFEEE2BC, 0xFFFFB4AB, 0xFF93000A, 0xFFFFDAD6}
    };

    private static int[] presetScheme(String preset, boolean night) {
        String key = preset + (night ? "_DARK" : "_LIGHT");
        for (int i = 0; i < PRESETS.length; i += 2) {
            if (PRESETS[i].equals(key)) return (int[]) PRESETS[i + 1];
        }
        return presetScheme("TANGERINE", night);
    }

    private int color(int res) {
        return context.getColor(res);
    }

    int dp(float value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    static int withAlpha(int color, float alpha) {
        return (Math.round(alpha * 255) << 24) | (color & 0x00FFFFFF);
    }

    // ---------------------------------------------------------------- shapes

    GradientDrawable rounded(int color, float radiusDp) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(color);
        drawable.setCornerRadius(dp(radiusDp));
        return drawable;
    }

    GradientDrawable outlined(int strokeColor, float strokeDp, float radiusDp) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(0);
        drawable.setStroke(dp(strokeDp), strokeColor);
        drawable.setCornerRadius(dp(radiusDp));
        return drawable;
    }

    Drawable ripple(Drawable content, int contentColor, float radiusDp) {
        return new RippleDrawable(
            ColorStateList.valueOf(withAlpha(contentColor, 0.12f)),
            content,
            content != null ? null : rounded(0xFFFFFFFF, radiusDp));
    }

    // ---------------------------------------------------------------- text

    TextView text(float sizeSp, int color, boolean medium) {
        TextView view = new TextView(context);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sizeSp);
        view.setTextColor(color);
        if (medium) view.setTypeface(android.graphics.Typeface.create("sans-serif-medium", android.graphics.Typeface.NORMAL));
        return view;
    }

    /** A Material 3 button: filled in [container], or a text button when [container] is 0. */
    TextView button(String label, int container, int content) {
        TextView view = text(14, content, true);
        view.setText(label);
        view.setGravity(Gravity.CENTER);
        view.setMinHeight(dp(40));
        view.setPadding(dp(container == 0 ? 12 : 24), 0, dp(container == 0 ? 12 : 24), 0);
        view.setBackground(ripple(container == 0 ? null : rounded(container, 20), content, 20));
        view.setClickable(true);
        view.setFocusable(true);
        return view;
    }

    /** A round tonal icon button. */
    ImageView iconButton(int icon, int container, int content) {
        ImageView view = new ImageView(context);
        view.setImageDrawable(new Icon(icon, content, dp(2)));
        view.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        view.setPadding(dp(12), dp(12), dp(12), dp(12));
        view.setBackground(ripple(container == 0 ? null : rounded(container, 24), content, 24));
        view.setClickable(true);
        view.setFocusable(true);
        return view;
    }

    static void setEnabled(android.view.View view, boolean enabled) {
        view.setEnabled(enabled);
        view.setAlpha(enabled ? 1f : 0.38f);
    }

    // ---------------------------------------------------------------- icons

    static final int ICON_BACK = 0;
    static final int ICON_PREVIOUS = 1;
    static final int ICON_NEXT = 2;
    static final int ICON_SAVE = 3;
    static final int ICON_COMPARE = 4;
    static final int ICON_CHECK = 5;
    static final int ICON_ERROR = 6;

    /** Outlined 24dp icons, drawn with lines instead of from the app's renamed resources. */
    static final class Icon extends Drawable {
        private final int icon;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final int size;

        Icon(int icon, int color, int strokeWidth) {
            this.icon = icon;
            paint.setColor(color);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(strokeWidth);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
            size = strokeWidth * 12;
        }

        @Override
        public int getIntrinsicWidth() {
            return size;
        }

        @Override
        public int getIntrinsicHeight() {
            return size;
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            float unit = Math.min(bounds.width(), bounds.height()) / 24f;
            canvas.save();
            canvas.translate(bounds.exactCenterX() - 12 * unit, bounds.exactCenterY() - 12 * unit);
            canvas.scale(unit, unit);
            float stroke = paint.getStrokeWidth();
            paint.setStrokeWidth(stroke / unit);
            path.reset();
            switch (icon) {
                case ICON_BACK:
                    path.moveTo(19, 12); path.lineTo(5, 12);
                    path.moveTo(11, 6); path.lineTo(5, 12); path.lineTo(11, 18);
                    break;
                case ICON_PREVIOUS:
                    path.moveTo(15, 6); path.lineTo(9, 12); path.lineTo(15, 18);
                    break;
                case ICON_NEXT:
                    path.moveTo(9, 6); path.lineTo(15, 12); path.lineTo(9, 18);
                    break;
                case ICON_SAVE:
                    path.moveTo(12, 4); path.lineTo(12, 15);
                    path.moveTo(7, 10); path.lineTo(12, 15); path.lineTo(17, 10);
                    path.moveTo(5, 16); path.lineTo(5, 19); path.lineTo(19, 19); path.lineTo(19, 16);
                    break;
                case ICON_COMPARE:
                    path.addRoundRect(4, 5, 20, 19, 2, 2, Path.Direction.CW);
                    path.moveTo(12, 3); path.lineTo(12, 21);
                    path.moveTo(5, 17); path.lineTo(9, 12); path.lineTo(12, 15);
                    break;
                case ICON_CHECK:
                    path.moveTo(5, 12.5f); path.lineTo(10, 17); path.lineTo(19, 7.5f);
                    break;
                case ICON_ERROR:
                    path.moveTo(12, 6); path.lineTo(12, 13.5f);
                    path.moveTo(12, 17.5f); path.lineTo(12, 18);
                    break;
                default:
                    break;
            }
            canvas.drawPath(path, paint);
            paint.setStrokeWidth(stroke);
            canvas.restore();
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
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
}
