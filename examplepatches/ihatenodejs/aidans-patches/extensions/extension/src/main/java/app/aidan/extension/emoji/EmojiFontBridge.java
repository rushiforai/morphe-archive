/*
 * Special thanks to samuelngs for AppleColorEmoji-Linux.ttf, which is
 * used as the source for the Apple Color Emoji font asset.
 * 
 * Find their repo here: https://github.com/samuelngs/apple-emoji-ttf
 */

package app.aidan.extension.emoji;

import android.content.Context;
import android.graphics.Typeface;
import android.graphics.fonts.Font;
import android.graphics.fonts.FontFamily;
import android.os.Build;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Bridges custom Typeface resolution to include Apple Color Emoji as a custom fallback font.
 */
public final class EmojiFontBridge {
    private static final String EMOJI_ASSET_PATH = "fonts/AppleColorEmoji.ttf";
    private static volatile Context sAppContext = null;
    private static volatile FontFamily sEmojiFontFamily = null;
    private static final Object sLock = new Object();
    private static final ConcurrentHashMap<String, Typeface> sTypefaceCache = new ConcurrentHashMap<>();

    private EmojiFontBridge() {
    }

    private static void ensureEmojiFamily(Context context) {
        if (sAppContext == null && context != null) {
            sAppContext = context.getApplicationContext();
        }
        if (sEmojiFontFamily == null) {
            synchronized (sLock) {
                if (sEmojiFontFamily == null) {
                    Context ctx = context != null ? context : sAppContext;
                    if (ctx != null && Build.VERSION.SDK_INT >= 29) {
                        try {
                            Font emojiFont = new Font.Builder(ctx.getAssets(), EMOJI_ASSET_PATH).build();
                            sEmojiFontFamily = new FontFamily.Builder(emojiFont).build();
                        } catch (Throwable ignored) {
                            // If loading fails, fallback remains system default
                        }
                    }
                }
            }
        }
    }

    /**
     * Wraps a loaded resource Typeface (e.g. Nunito) with Apple Color Emoji as custom fallback.
     */
    /**
     * Wraps a loaded resource Typeface (defaults to R.font.nunito_variable 0x7f090000) with Apple Color Emoji.
     */
    public static Typeface wrapTypeface(Context context, Typeface baseTypeface) {
        int fontResId = 0;
        if (context != null) {
            try {
                fontResId = context.getResources().getIdentifier("nunito_variable", "font", context.getPackageName());
            } catch (Throwable ignored) {
            }
            if (fontResId == 0) {
                fontResId = 0x7f090000;
            }
        }
        return wrapTypeface(context, baseTypeface, fontResId);
    }

    /**
     * Wraps Typeface.DEFAULT with Apple Color Emoji fallback.
     */
    public static Typeface wrapDefaultTypeface(Typeface baseTypeface) {
        return wrapPlatformTypeface(baseTypeface, 400, false);
    }

    public static Typeface wrapTypeface(Context context, Typeface baseTypeface, int fontResId) {
        if (Build.VERSION.SDK_INT < 29 || context == null) {
            return baseTypeface;
        }

        try {
            ensureEmojiFamily(context);
            if (sEmojiFontFamily == null) {
                return baseTypeface;
            }

            String cacheKey = (baseTypeface != null ? System.identityHashCode(baseTypeface) : 0) + "_" + fontResId;
            Typeface cached = sTypefaceCache.get(cacheKey);
            if (cached != null) {
                return cached;
            }

            Typeface composite;
            if (fontResId != 0) {
                try {
                    Font textFont = new Font.Builder(context.getResources(), fontResId).build();
                    FontFamily textFamily = new FontFamily.Builder(textFont).build();
                    composite = new Typeface.CustomFallbackBuilder(textFamily)
                            .addCustomFallback(sEmojiFontFamily)
                            .setSystemFallback("sans-serif")
                            .build();
                } catch (Throwable t) {
                    composite = new Typeface.CustomFallbackBuilder(sEmojiFontFamily)
                            .setSystemFallback("sans-serif")
                            .build();
                }
            } else {
                composite = new Typeface.CustomFallbackBuilder(sEmojiFontFamily)
                        .setSystemFallback("sans-serif")
                        .build();
            }

            sTypefaceCache.put(cacheKey, composite);
            return composite;
        } catch (Throwable t) {
            return baseTypeface;
        }
    }

    /**
     * Wraps a platform/fallback Typeface with Apple Color Emoji.
     */
    public static Typeface wrapPlatformTypeface(Typeface baseTypeface, int weight, boolean italic) {
        if (Build.VERSION.SDK_INT < 29) {
            return baseTypeface;
        }

        try {
            ensureEmojiFamily(null);
            if (sEmojiFontFamily == null) {
                return baseTypeface;
            }

            String cacheKey = "platform_" + weight + "_" + italic;
            Typeface cached = sTypefaceCache.get(cacheKey);
            if (cached != null) {
                return cached;
            }

            Typeface baseComposite = sTypefaceCache.get("platform_base");
            if (baseComposite == null) {
                baseComposite = new Typeface.CustomFallbackBuilder(sEmojiFontFamily)
                        .setSystemFallback("sans-serif")
                        .build();
                sTypefaceCache.put("platform_base", baseComposite);
            }

            Typeface styled = Typeface.create(baseComposite, weight, italic);
            sTypefaceCache.put(cacheKey, styled);
            return styled;
        } catch (Throwable t) {
            return baseTypeface;
        }
    }
}
