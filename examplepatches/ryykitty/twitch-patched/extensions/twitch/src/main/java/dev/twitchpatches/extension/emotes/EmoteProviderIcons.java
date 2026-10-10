package dev.twitchpatches.extension.emotes;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.widget.ImageView;
import java.util.WeakHashMap;

final class EmoteProviderIcons {
    private static final String[] NAMES = {"bttv", "7tv", "ffz"};
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final WeakHashMap<ImageView, String> views = new WeakHashMap<>();
    private static final EmoteImages images = new EmoteImages(url -> MAIN.post(() -> {
        views.forEach((view, expected) -> {
            if (url.equals(expected) && view.isAttachedToWindow()) view.setImageDrawable(imagesDrawable(view, url));
        });
    }));

    private EmoteProviderIcons() { }

    static void bind(ImageView view, int provider) {
        String url = "https://cdn.betterttv.net/assets/logos/" + NAMES[provider] + "_logo.png";
        views.put(view, url);
        Drawable loaded = imagesDrawable(view, url);
        view.setImageDrawable(loaded == null ? new Label(NAMES[provider].toUpperCase(java.util.Locale.ROOT)) : loaded);
        images.request(new Emote(NAMES[provider], url, false, false));
    }

    private static Drawable imagesDrawable(ImageView view, String url) { return images.drawable(view.getResources(), url); }

    private static final class Label extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final String label;
        Label(String label) { this.label = label; paint.setColor(Color.GRAY); paint.setTextAlign(Paint.Align.CENTER); }
        @Override public void draw(Canvas canvas) {
            paint.setTextSize(getBounds().width() / 3f);
            canvas.drawText(label, getBounds().exactCenterX(), getBounds().exactCenterY() - (paint.ascent() + paint.descent()) / 2, paint);
        }
        @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
        @Override public void setColorFilter(ColorFilter filter) { paint.setColorFilter(filter); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
