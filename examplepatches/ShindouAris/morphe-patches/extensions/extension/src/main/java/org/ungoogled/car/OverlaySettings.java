package org.ungoogled.car;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * The Waze Mod overlay on Android Auto: whether it shows, where, and how big. Set on the phone, in Customization
 * (org.ungoogled.ui.CustomizationActivity), and read live by the car screen in the same process.
 */
public final class OverlaySettings implements SharedPreferences.OnSharedPreferenceChangeListener {
    private static final String PREFERENCES = "ungoogled_car_overlay";
    private static final String ENABLED = "enabled", POSITION = "position", SCALE = "scale", STYLE = "style";
    private static final String XADAS = "xadas";

    /** Whether the distance to the vehicle ahead from xADAS Pro shows too. */
    public static boolean xadas(Context context) {
        return preferences(context).getBoolean(XADAS, true);
    }

    public static void setXadas(Context context, boolean on) {
        preferences(context).edit().putBoolean(XADAS, on).apply();
    }

    /** Left, beside Maps' column of buttons and under its search bar or turn card. */
    public static final int LEFT = 0;
    /** Top right corner of Maps' part of the screen. */
    public static final int TOP_RIGHT = 1;
    public static final String[] POSITION_LABELS = {"Left, beside Maps' buttons", "Top right"};
    /** Percent, as Waze Mod's own Android Auto speedometer allows. */
    public static final int[] SCALES = {60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180};

    /** Waze Mod's speedometer presets: the speed as a small badge, as a dial, or not shown. */
    public static final int STYLE_BADGE = 2, STYLE_DIAL = 3, STYLE_SIGNS = 4;
    public static final int[] STYLES = {STYLE_DIAL, STYLE_BADGE, STYLE_SIGNS};
    public static final String[] STYLE_LABELS = {"Speed dial beside the sign", "Small speed badge on the sign", "Signs only"};

    public static int style(Context context) {
        int style = preferences(context).getInt(STYLE, STYLE_DIAL);
        return style == STYLE_BADGE || style == STYLE_SIGNS ? style : STYLE_DIAL;
    }

    public static void setStyle(Context context, int style) {
        preferences(context).edit().putInt(STYLE, style).apply();
    }

    private static SharedPreferences preferences(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
    }

    public static boolean enabled(Context context) {
        return preferences(context).getBoolean(ENABLED, true);
    }

    public static void setEnabled(Context context, boolean enabled) {
        preferences(context).edit().putBoolean(ENABLED, enabled).apply();
    }

    public static int position(Context context) {
        int position = preferences(context).getInt(POSITION, LEFT);
        return position == TOP_RIGHT ? TOP_RIGHT : LEFT;
    }

    public static void setPosition(Context context, int position) {
        preferences(context).edit().putInt(POSITION, position).apply();
    }

    public static int scale(Context context) {
        return Math.max(SCALES[0], Math.min(SCALES[SCALES.length - 1], preferences(context).getInt(SCALE, 100)));
    }

    public static void setScale(Context context, int scale) {
        preferences(context).edit().putInt(SCALE, scale).apply();
    }

    // What the overlay draws with, kept up to date.
    private final Context context;
    private final Runnable onChange;
    volatile boolean enabled;
    volatile int position;
    volatile int scale;
    volatile int style;
    volatile boolean xadas;

    /** Follows the settings; [onChange] runs when they change. */
    OverlaySettings(Context context, Runnable onChange) {
        this.context = context.getApplicationContext();
        this.onChange = onChange;
        read();
        preferences(this.context).registerOnSharedPreferenceChangeListener(this);
    }

    void close() {
        preferences(context).unregisterOnSharedPreferenceChangeListener(this);
    }

    private void read() {
        enabled = enabled(context);
        position = position(context);
        scale = scale(context);
        style = style(context);
        xadas = xadas(context);
    }

    @Override
    public void onSharedPreferenceChanged(SharedPreferences preferences, String key) {
        read();
        onChange.run();
    }
}
