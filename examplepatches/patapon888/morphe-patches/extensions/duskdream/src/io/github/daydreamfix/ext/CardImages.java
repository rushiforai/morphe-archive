package io.github.daydreamfix.ext;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;

/**
 * Crops store images on the device. vr.home asks Google's image server to crop by adding a suffix to
 * the URL, which any other host ignores, so a square image would fill a 3:2 card and look stretched.
 * The crop travels in the URL fragment, which is never sent to the server.
 *
 * Contains no Xposed code, so the Morphe build can reuse it.
 */
final class CardImages {
    private static final String CROP = "#ddcrop=";
    private static final String LOGO_AREA = "#ddlogo=";
    /** How much of the crop a resized logo may fill. */
    private static final float LOGO_FILL = 0.8f;
    /** How far from the middle a logo may sit, as a fraction of the image. */
    private static final float CENTRE_TOLERANCE = 0.03f;

    private CardImages() {}

    static boolean isGoogleHosted(String url) {
        return url.contains("googleusercontent") || url.contains("ggpht.com");
    }

    static String withCrop(String url, RectF crop) {
        return crop == null ? url : mark(url, CROP, crop);
    }

    /** Keeps the whole image, for views that show a square image cut off by their own shape. */
    static String withLogoArea(String url, RectF visible) {
        return mark(url, LOGO_AREA, visible);
    }

    private static String mark(String url, String kind, RectF r) {
        int fragment = url.indexOf('#');
        String base = fragment < 0 ? url : url.substring(0, fragment);
        return base + kind + r.left + "," + r.top + "," + r.right + "," + r.bottom;
    }

    /** Returns the crop to give vr.home's image loader, or null if the URL carries none. */
    static RectF cropOf(String url) {
        if (url == null) return null;
        int at = url.lastIndexOf(CROP);
        if (at >= 0) return parse(url.substring(at + CROP.length()));
        at = url.lastIndexOf(LOGO_AREA);
        if (at >= 0) return new LogoArea(parse(url.substring(at + LOGO_AREA.length())));
        return null;
    }

    private static RectF parse(String value) {
        String[] v = value.split(",");
        return new RectF(Float.parseFloat(v[0]), Float.parseFloat(v[1]),
                Float.parseFloat(v[2]), Float.parseFloat(v[3]));
    }

    /** Crops nothing, and says where in the image a logo has to fit. */
    private static final class LogoArea extends RectF {
        final RectF visible;

        LogoArea(RectF visible) {
            super(0f, 0f, 1f, 1f);
            this.visible = visible;
        }
    }

    /**
     * Foreground art made for these cards is placed to suit the crop, but a plain app icon sits in
     * the middle of its image and would lose its edges. Returns the image with the logo resized to fit
     * the part that shows, or null if the image is not such a logo.
     */
    static Bitmap fitCentredLogo(Bitmap image, RectF crop) {
        if (crop == null || !image.hasAlpha()) return null;
        int w = image.getWidth();
        int h = image.getHeight();
        int[] pixels = new int[w * h];
        image.getPixels(pixels, 0, w, 0, 0, w, h);

        int left = w, top = h, right = -1, bottom = -1;
        for (int y = 0; y < h; y++) {
            for (int x = 0; x < w; x++) {
                if (pixels[y * w + x] >>> 24 == 0) continue;
                if (x < left) left = x;
                if (x > right) right = x;
                if (y < top) top = y;
                if (y > bottom) bottom = y;
            }
        }
        if (right < 0) return null;
        right++;
        bottom++;
        // Reaching every edge means a full picture with rounded corners, not a logo.
        if (left == 0 && top == 0 && right == w && bottom == h) return null;
        if (Math.abs(left + right - w) / 2f > w * CENTRE_TOLERANCE
                || Math.abs(top + bottom - h) / 2f > h * CENTRE_TOLERANCE) {
            return null;
        }

        int outW = Math.max(1, Math.round(crop.width() * w));
        int outH = Math.max(1, Math.round(crop.height() * h));
        RectF shown = crop instanceof LogoArea
                ? new RectF(((LogoArea) crop).visible.left * w, ((LogoArea) crop).visible.top * h,
                        ((LogoArea) crop).visible.right * w, ((LogoArea) crop).visible.bottom * h)
                : new RectF(0f, 0f, outW, outH);
        int logoW = right - left;
        int logoH = bottom - top;
        float scale = Math.min(1f,
                LOGO_FILL * Math.min(shown.width() / logoW, shown.height() / logoH));
        float drawW = logoW * scale;
        float drawH = logoH * scale;
        float drawX = shown.centerX() - drawW / 2f;
        float drawY = shown.centerY() - drawH / 2f;

        Bitmap out = Bitmap.createBitmap(outW, outH, Bitmap.Config.ARGB_8888);
        new Canvas(out).drawBitmap(image,
                new android.graphics.Rect(left, top, right, bottom),
                new RectF(drawX, drawY, drawX + drawW, drawY + drawH),
                new Paint(Paint.FILTER_BITMAP_FLAG | Paint.ANTI_ALIAS_FLAG));
        return out;
    }
}
