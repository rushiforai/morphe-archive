package app.aidan.extension.adobescan;

import android.content.Context;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import java.lang.reflect.Method;
import java.util.Locale;

/** Resolves Adobe font resources to the device's configured system typeface. */
public final class SystemFontBridge {
    private SystemFontBridge() {
    }

    public static Typeface getSystemTypeface(Context context, int resourceId, int style, final Object callback) {
        int weight = 400;
        boolean bold = false;
        boolean italic = false;

        if (context != null && resourceId != 0) {
            try {
                String entryName = context.getResources().getResourceEntryName(resourceId).toLowerCase(Locale.ROOT);
                italic = entryName.contains("italic");
                if (entryName.contains("bold")) {
                    bold = true;
                    weight = 700;
                } else if (entryName.contains("medium")) {
                    weight = 500;
                } else if (entryName.contains("light")) {
                    weight = 300;
                }
            } catch (Exception ignored) {
                // Resource IDs outside the app package do not have a usable entry name.
            }
        }

        if ((style & Typeface.BOLD) != 0) {
            bold = true;
            weight = Math.max(weight, 700);
        }
        if ((style & Typeface.ITALIC) != 0) {
            italic = true;
        }

        final Typeface typeface;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            typeface = Typeface.create(Typeface.DEFAULT, weight, italic);
        } else {
            int legacyStyle = Typeface.NORMAL;
            if (bold) {
                legacyStyle |= Typeface.BOLD;
            }
            if (italic) {
                legacyStyle |= Typeface.ITALIC;
            }
            typeface = Typeface.create(Typeface.DEFAULT, legacyStyle);
        }

        if (callback != null) {
            new Handler(Looper.getMainLooper()).post(new Runnable() {
                @Override
                public void run() {
                    try {
                        Method method = callback.getClass().getDeclaredMethod("c", Typeface.class);
                        method.setAccessible(true);
                        method.invoke(callback, typeface);
                    } catch (Exception ignored) {
                        // Font callbacks are optional and may use a different obfuscated method name.
                    }
                }
            });
        }

        return typeface;
    }
}
