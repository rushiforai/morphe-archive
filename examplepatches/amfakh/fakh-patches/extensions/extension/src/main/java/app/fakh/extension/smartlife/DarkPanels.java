package app.fakh.extension.smartlife;

import android.app.Activity;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;


/**
 * Finishes Android's force dark on the React Native device panels. Force dark turns solid colors and text dark or
 * light, but a large picture behind a section (a gradient image, a ring drawn with react-native-svg) can stay light, so
 * the text Android made light on top of it disappears. Each large picture that is mostly light gets its lightness
 * flipped with its hues kept, and force dark leaves it alone. Its switch in Settings turns all of it off.
 */
public final class DarkPanels {
    /** A picture is large when it is at least this share of the screen's width; device photos and icons are smaller. */
    private static final float LARGE = 0.4f;
    /** Mean lightness above which a picture counts as light, from 0 to 1. */
    private static final float LIGHT = 0.6f;
    /** How often the panel is walked for new pictures, as React Native adds and loads them over time. */
    private static final long WALK_MS = 300;
    /** How long after the panel opens it is also walked on a timer. */
    private static final long SETTLE_MS = 5000;
    /** The side of the small bitmap a picture is drawn into to measure it. */
    private static final int SAMPLE = 24;
    /** A view id no resource uses, as the tag of a picture already measured. */
    private static final int TAG = 0x7ffad401;
    private static final String TEXT = "com.facebook.react.views.text.ReactTextView";
    private static final String[] PICTURES = {"com.facebook.react.views.image.ReactImageView", "com.horcrux.svg.SvgView"};

    private DarkPanels() {
    }

    /**
     * Injected at the start of the panel activity's {@code onCreate}.
     *
     * @param activity the device panel
     */
    public static void install(Activity activity) {
        if ((activity.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                != Configuration.UI_MODE_NIGHT_YES) return;
        View decor = activity.getWindow().getDecorView();
        if (!Switches.darkPanels(activity)) {
            // The theme allows force dark for every panel; this turns it off for everything the panel draws.
            decor.setForceDarkAllowed(false);
            return;
        }
        long[] last = {0};
        decor.getViewTreeObserver().addOnPreDrawListener(() -> {
            long now = SystemClock.uptimeMillis();
            if (now - last[0] >= WALK_MS) {
                last[0] = now;
                walk(decor, decor, decor.getWidth() * LARGE);
            }
            return true;
        });
        // A picture often finishes loading after the last frame was drawn, and no frame follows until the panel is
        // touched, so for a few seconds the panel is also walked on a timer.
        long start = SystemClock.uptimeMillis();
        decor.postDelayed(new Runnable() {
            @Override
            public void run() {
                walk(decor, decor, decor.getWidth() * LARGE);
                if (SystemClock.uptimeMillis() - start < SETTLE_MS) decor.postDelayed(this, WALK_MS);
            }
        }, WALK_MS);
    }

    /**
     * Darkens every large light picture under {@code view} that has not been measured yet and has text over it: the
     * backdrop of a section. A device photo has no text over it and keeps its colors.
     */
    private static void walk(View view, View decor, float large) {
        if (view.getWidth() >= large && view.getHeight() > 0 && isPicture(view) && view.getTag(TAG) == null) {
            float lightness = lightness(view);
            // A picture still loading draws nothing; it is measured again on a later walk.
            if (lightness >= 0) {
                view.setTag(TAG, Boolean.TRUE);
                if (lightness > LIGHT && textOver(view, decor)) darken(view);
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) walk(group.getChildAt(i), decor, large);
        }
    }

    /** Whether a shown React Native text under {@code root} has its middle inside {@code picture} on the screen. */
    private static boolean textOver(View picture, View root) {
        int[] at = new int[2];
        picture.getLocationOnScreen(at);
        Rect area = new Rect(at[0], at[1], at[0] + picture.getWidth(), at[1] + picture.getHeight());
        return textIn(root, area, at);
    }

    /** Whether {@code view} or a view under it is shown React Native text whose middle lies in {@code area}. */
    private static boolean textIn(View view, Rect area, int[] at) {
        if (view.getVisibility() != View.VISIBLE) return false;
        if (TEXT.equals(view.getClass().getName()) && view.getWidth() > 0) {
            view.getLocationOnScreen(at);
            if (area.contains(at[0] + view.getWidth() / 2, at[1] + view.getHeight() / 2)) return true;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                if (textIn(group.getChildAt(i), area, at)) return true;
            }
        }
        return false;
    }

    /** Whether {@code view} is a React Native image or an SVG drawing. */
    private static boolean isPicture(View view) {
        String name = view.getClass().getName();
        for (String picture : PICTURES) {
            if (picture.equals(name)) return true;
        }
        return false;
    }

    /**
     * The mean lightness of what {@code view} draws in its own colors, before force dark, from 0 to 1, or -1 when it
     * draws nearly nothing yet.
     */
    private static float lightness(View view) {
        Bitmap sample = Bitmap.createBitmap(SAMPLE, SAMPLE, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(sample);
        canvas.scale(SAMPLE / (float) view.getWidth(), SAMPLE / (float) view.getHeight());
        view.draw(canvas);
        float sum = 0;
        float weight = 0;
        for (int y = 0; y < SAMPLE; y++) {
            for (int x = 0; x < SAMPLE; x++) {
                int pixel = sample.getPixel(x, y);
                float alpha = Color.alpha(pixel) / 255f;
                sum += alpha * (0.2126f * Color.red(pixel) + 0.7152f * Color.green(pixel) + 0.0722f * Color.blue(pixel)) / 255f;
                weight += alpha;
            }
        }
        sample.recycle();
        return weight < SAMPLE * SAMPLE * 0.2f ? -1 : sum / weight;
    }

    /**
     * Flips the lightness of {@code view} and keeps its hues: inverted, then turned half way round the color wheel,
     * so white becomes black and the panel's green stays green. Force dark is kept off it so it isn't flipped twice.
     */
    private static void darken(View view) {
        ColorMatrix invert = new ColorMatrix(new float[] {
                -1, 0, 0, 0, 255,
                0, -1, 0, 0, 255,
                0, 0, -1, 0, 255,
                0, 0, 0, 1, 0,
        });
        ColorMatrix halfTurn = new ColorMatrix(new float[] {
                -0.574f, 1.430f, 0.144f, 0, 0,
                0.426f, 0.430f, 0.144f, 0, 0,
                0.426f, 1.430f, -0.856f, 0, 0,
                0, 0, 0, 1, 0,
        });
        ColorMatrix flip = new ColorMatrix();
        flip.setConcat(halfTurn, invert);
        Paint paint = new Paint();
        paint.setColorFilter(new ColorMatrixColorFilter(flip));
        view.setForceDarkAllowed(false);
        view.setLayerType(View.LAYER_TYPE_HARDWARE, paint);
    }
}
