package com.anderson.applemusic.one.theme;

import android.content.Context;
import android.graphics.Typeface;
import android.util.Log;
import android.widget.TextView;

/**
 * Inter (SIL OFL, see {@code assets/OFL.txt}) instead of SF Pro, which cannot be
 * redistributed. The TTFs are copied from {@code tv-app/src/main/res/font} into
 * {@code single-apk/single-ui/assets/fonts} and land in the APK under
 * {@code assets/one/fonts}, so the same four static weights the companions use are
 * loaded with {@link Typeface#createFromAsset} (no {@code R.font}, no AndroidX).
 *
 * <p>If the assets are absent (a CI run of an older packer, say) every weight falls
 * back to the platform sans-serif so the UI stays readable.
 */
public final class Inter {

    public static final int REGULAR = 400;
    public static final int MEDIUM = 500;
    public static final int SEMIBOLD = 600;
    public static final int BOLD = 700;

    private static final String TAG = "AppleMusicOne";
    private static final String DIR = "one/fonts/";

    private static Typeface regular;
    private static Typeface medium;
    private static Typeface semibold;
    private static Typeface bold;

    private Inter() {
    }

    public static void load(Context context) {
        regular = asset(context, "inter_regular.ttf");
        medium = asset(context, "inter_medium.ttf");
        semibold = asset(context, "inter_semibold.ttf");
        bold = asset(context, "inter_bold.ttf");
        Log.i(TAG, "Inter loaded: regular=" + (regular != null) + " semibold=" + (semibold != null));
    }

    private static Typeface asset(Context context, String file) {
        try {
            return Typeface.createFromAsset(context.getAssets(), DIR + file);
        } catch (Throwable t) {
            Log.w(TAG, "cannot load " + DIR + file + ": " + t);
            return null;
        }
    }

    public static Typeface of(int weight) {
        if (weight >= BOLD) return bold != null ? bold : Typeface.create(Typeface.SANS_SERIF, Typeface.BOLD);
        if (weight >= SEMIBOLD) {
            return semibold != null ? semibold : Typeface.create(Typeface.SANS_SERIF, Typeface.BOLD);
        }
        if (weight >= MEDIUM) {
            return medium != null ? medium : Typeface.create(Typeface.SANS_SERIF, Typeface.NORMAL);
        }
        return regular != null ? regular : Typeface.create(Typeface.SANS_SERIF, Typeface.NORMAL);
    }

    public static void style(TextView view, float sizeSp, int weight, int color) {
        view.setTextSize(sizeSp);
        view.setTextColor(color);
        view.setTypeface(of(weight));
        view.setIncludeFontPadding(false);
    }

    public static TextView text(Context context, CharSequence value, float sizeSp, int weight,
                                int color) {
        TextView view = new TextView(context);
        view.setText(value);
        style(view, sizeSp, weight, color);
        return view;
    }
}
