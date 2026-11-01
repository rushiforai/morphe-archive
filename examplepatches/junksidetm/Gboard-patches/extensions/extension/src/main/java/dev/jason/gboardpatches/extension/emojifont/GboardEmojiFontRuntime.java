package dev.jason.gboardpatches.extension.emojifont;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.net.Uri;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.concurrent.atomic.AtomicReference;

public final class GboardEmojiFontRuntime {
    private static final String TAG = "GboardEmojiFont";
    private static final int PRIMARY_LABEL_VIEW_ID = 0x7f0b0651;

    private static final AtomicReference<Typeface> CACHED_TYPEFACE = new AtomicReference<Typeface>(null);
    private static volatile boolean cacheInitialized = false;

    private GboardEmojiFontRuntime() {
    }

    private static File findSystemTextFont() {
        for (String path : new String[]{
                "/system/fonts/Roboto-Regular.ttf",
                "/system/fonts/NotoSans-Regular.ttf",
                "/system/fonts/GoogleSans-Regular.ttf",
                "/system/fonts/DroidSans.ttf"
        }) {
            File file = new File(path);
            if (file.exists() && file.canRead()) {
                return file;
            }
        }
        return null;
    }

    public static Typeface loadTypefaceFromFile(File fontFile) {
        if (fontFile == null || !fontFile.exists() || fontFile.length() == 0) {
            return null;
        }
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.Q) {
            try {
                android.graphics.fonts.Font customFont =
                        new android.graphics.fonts.Font.Builder(fontFile).build();
                android.graphics.fonts.FontFamily customFamily =
                        new android.graphics.fonts.FontFamily.Builder(customFont).build();

                File sysFontFile = findSystemTextFont();
                if (sysFontFile != null) {
                    try {
                        android.graphics.fonts.Font sysTextFont =
                                new android.graphics.fonts.Font.Builder(sysFontFile).build();
                        android.graphics.fonts.FontFamily sysTextFamily =
                                new android.graphics.fonts.FontFamily.Builder(sysTextFont).build();
                        return new Typeface.CustomFallbackBuilder(sysTextFamily)
                                .addCustomFallback(customFamily)
                                .setSystemFallback("sans-serif")
                                .build();
                    } catch (Throwable t) {
                        Log.w(TAG, "CustomFallbackBuilder with system text family failed, using emoji family as base: " + t.getMessage());
                    }
                }

                return new Typeface.CustomFallbackBuilder(customFamily)
                        .setSystemFallback("sans-serif")
                        .build();
            } catch (Throwable t) {
                Log.w(TAG, "CustomFallbackBuilder failed, falling back to createFromFile: " + t.getMessage());
            }
        }
        try {
            return Typeface.createFromFile(fontFile);
        } catch (Throwable t) {
            Log.w(TAG, "Typeface.createFromFile failed: " + t.getMessage());
            return null;
        }
    }

    public static Typeface getCustomEmojiTypefaceOrNull(Context context) {
        if (context == null) return null;
        if (cacheInitialized) {
            return CACHED_TYPEFACE.get();
        }
        synchronized (CACHED_TYPEFACE) {
            if (cacheInitialized) {
                return CACHED_TYPEFACE.get();
            }
            Typeface loaded = null;
            try {
                SharedPreferences prefs = GboardEmojiFontSettings.preferences(context);
                if (GboardEmojiFontSettings.readEnabled(prefs)) {
                    File fontFile = GboardEmojiFontSettings.getFontFile(context);
                    if (fontFile != null && fontFile.exists() && fontFile.length() > 0) {
                        loaded = loadTypefaceFromFile(fontFile);
                    }
                }
            } catch (Throwable throwable) {
                Log.w(TAG, "Failed to load custom emoji typeface", throwable);
            }
            CACHED_TYPEFACE.set(loaded);
            cacheInitialized = true;
            return loaded;
        }
    }

    public static void invalidateCache() {
        synchronized (CACHED_TYPEFACE) {
            CACHED_TYPEFACE.set(null);
            cacheInitialized = false;
        }
    }

    public static boolean saveCustomEmojiFont(Context context, byte[] data, String fontName) {
        if (context == null || data == null || data.length == 0) {
            return false;
        }
        try {
            File fontFile = GboardEmojiFontSettings.getFontFile(context);
            if (fontFile == null) return false;

            File parent = fontFile.getParentFile();
            if (parent != null && !parent.exists()) {
                parent.mkdirs();
            }

            File tempFile = new File(fontFile.getAbsolutePath() + ".tmp");
            FileOutputStream fos = new FileOutputStream(tempFile);
            try {
                fos.write(data);
                fos.flush();
            } finally {
                fos.close();
            }

            // Verify font validity via Typeface loader with SFNT header fallback
            boolean valid = false;
            try {
                Typeface testTypeface = loadTypefaceFromFile(tempFile);
                if (testTypeface != null) {
                    valid = true;
                }
            } catch (Throwable t) {
                Log.w(TAG, "Typeface validation check encountered non-fatal error: " + t.getMessage());
            }

            if (!valid) {
                valid = isValidFontData(data);
            }

            if (!valid) {
                tempFile.delete();
                return false;
            }

            if (fontFile.exists()) {
                fontFile.delete();
            }
            if (!tempFile.renameTo(fontFile)) {
                tempFile.delete();
                return false;
            }

            SharedPreferences prefs = GboardEmojiFontSettings.preferences(context);
            GboardEmojiFontSettings.writeSettings(prefs, true, fontName, data.length);
            invalidateCache();
            return true;
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to save custom emoji font", throwable);
            return false;
        }
    }

    public static boolean saveCustomEmojiFontFromUri(Context context, Uri uri, String fontName) {
        if (context == null || uri == null) {
            return false;
        }
        try {
            File fontFile = GboardEmojiFontSettings.getFontFile(context);
            if (fontFile == null) return false;

            File parent = fontFile.getParentFile();
            if (parent != null && !parent.exists()) {
                parent.mkdirs();
            }

            File tempFile = new File(fontFile.getAbsolutePath() + ".tmp");
            try (InputStream in = context.getContentResolver().openInputStream(uri);
                 FileOutputStream fos = new FileOutputStream(tempFile)) {
                if (in == null) return false;
                byte[] buffer = new byte[65536];
                int len;
                while ((len = in.read(buffer)) != -1) {
                    fos.write(buffer, 0, len);
                }
                fos.flush();
            }

            boolean valid = false;
            try {
                Typeface testTypeface = loadTypefaceFromFile(tempFile);
                if (testTypeface != null) {
                    valid = true;
                }
            } catch (Throwable t) {
                Log.w(TAG, "Typeface validation check encountered non-fatal error: " + t.getMessage());
            }

            if (!valid) {
                valid = isValidFontFile(tempFile);
            }

            if (!valid) {
                tempFile.delete();
                return false;
            }

            if (fontFile.exists()) {
                fontFile.delete();
            }
            if (!tempFile.renameTo(fontFile)) {
                tempFile.delete();
                return false;
            }

            SharedPreferences prefs = GboardEmojiFontSettings.preferences(context);
            GboardEmojiFontSettings.writeSettings(prefs, true, fontName, fontFile.length());
            invalidateCache();
            return true;
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to stream custom emoji font from URI", throwable);
            return false;
        }
    }

    private static boolean isValidFontFile(File file) {
        if (file == null || !file.exists() || file.length() < 12) return false;
        try (FileInputStream fis = new FileInputStream(file)) {
            byte[] header = new byte[12];
            int read = fis.read(header);
            if (read < 12) return false;
            return isValidFontData(header);
        } catch (Throwable t) {
            return false;
        }
    }

    private static boolean isValidFontData(byte[] data) {
        if (data == null || data.length < 12) return false;
        int tag = ((data[0] & 0xFF) << 24)
                | ((data[1] & 0xFF) << 16)
                | ((data[2] & 0xFF) << 8)
                | (data[3] & 0xFF);
        return tag == 0x00010000 // TrueType
                || tag == 0x4F54544F // 'OTTO' OpenType
                || tag == 0x74727565 // 'true'
                || tag == 0x74797031 // 'typ1'
                || tag == 0x774F4646; // 'wOFF'
    }

    public static boolean deleteCustomEmojiFont(Context context) {
        if (context == null) return false;
        try {
            File fontFile = GboardEmojiFontSettings.getFontFile(context);
            if (fontFile != null && fontFile.exists()) {
                fontFile.delete();
            }
            SharedPreferences prefs = GboardEmojiFontSettings.preferences(context);
            GboardEmojiFontSettings.writeSettings(prefs, false, "", 0L);
            invalidateCache();
            return true;
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to delete custom emoji font", throwable);
            return false;
        }
    }

    public static void applyToTextView(TextView textView) {
        if (textView == null) return;
        try {
            Typeface custom = getCustomEmojiTypefaceOrNull(textView.getContext());
            if (custom != null) {
                textView.setTypeface(custom);
                textView.invalidate();
                textView.requestLayout();
            }
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to apply custom emoji typeface to TextView", throwable);
        }
    }

    public static void applyToPaint(Paint paint, Context context) {
        if (paint == null || context == null) return;
        try {
            Typeface custom = getCustomEmojiTypefaceOrNull(context);
            if (custom != null) {
                paint.setTypeface(custom);
            }
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to apply custom emoji typeface to Paint", throwable);
        }
    }

    public static void afterSoftKeyBound(Object receiver, Object metadata) {
        if (!(receiver instanceof View)) return;
        View root = (View) receiver;
        try {
            Typeface custom = getCustomEmojiTypefaceOrNull(root.getContext());
            if (custom == null) return;

            boolean isKeyEmoji = isMetadataEmoji(metadata);
            applyToViewTree(root, custom, isKeyEmoji);
            root.post(() -> {
                try {
                    applyToViewTree(root, custom, isKeyEmoji);
                } catch (Throwable ignored) {
                }
            });
        } catch (Throwable throwable) {
            // Never disrupt keyboard key binding
        }
    }

    public static boolean isMetadataEmoji(Object metadata) {
        if (metadata == null) return false;
        if (metadata instanceof CharSequence) {
            return isEmojiOrSymbol((CharSequence) metadata);
        }
        try {
            Class<?> clazz = metadata.getClass();
            // 1. Inspect label arrays (field 'g' in Gboard SoftKeyDef: CharSequence[] g)
            for (java.lang.reflect.Field f : clazz.getDeclaredFields()) {
                if (f.getType().isArray() && CharSequence.class.isAssignableFrom(f.getType().getComponentType())) {
                    f.setAccessible(true);
                    Object array = f.get(metadata);
                    if (array instanceof CharSequence[] labels) {
                        for (CharSequence cs : labels) {
                            if (isEmojiOrSymbol(cs)) return true;
                        }
                    }
                }
            }
            // 2. Inspect ActionDef array fields (e.g. field 'f')
            for (java.lang.reflect.Field f : clazz.getDeclaredFields()) {
                if (f.getType().isArray() && f.getType().getComponentType().getName().contains("ActionDef")) {
                    f.setAccessible(true);
                    Object actionsObj = f.get(metadata);
                    if (actionsObj instanceof Object[] actions) {
                        for (Object action : actions) {
                            if (action == null) continue;
                            for (java.lang.reflect.Field af : action.getClass().getDeclaredFields()) {
                                af.setAccessible(true);
                                Object val = af.get(action);
                                if (val instanceof CharSequence && isEmojiOrSymbol((CharSequence) val)) {
                                    return true;
                                }
                            }
                        }
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static void applyToViewTree(View view, Typeface typeface, boolean forceEmojiKey) {
        if (view == null || typeface == null) return;
        if (view instanceof TextView) {
            TextView tv = (TextView) view;
            CharSequence text = tv.getText();
            // If the view displays normal text words without any emoji (e.g. "English (US)", "Space", "Enter"),
            // never override its typeface to prevent word separation or font collisions.
            if (hasAlphanumericWords(text) && !containsEmoji(text)) {
                return;
            }
            if (forceEmojiKey) {
                tv.setTypeface(typeface);
            } else {
                CharSequence desc = tv.getContentDescription();
                if (containsEmoji(text) || isEmojiOrSymbol(text) || isEmojiOrSymbol(desc)) {
                    tv.setTypeface(typeface);
                }
            }
        } else if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup vg = (android.view.ViewGroup) view;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                applyToViewTree(vg.getChildAt(i), typeface, forceEmojiKey);
            }
        }
    }

    public static boolean hasAlphanumericWords(CharSequence text) {
        if (text == null || text.length() == 0) return false;
        int length = text.length();
        int letterOrDigitCount = 0;
        for (int i = 0; i < length; ) {
            int codePoint = Character.codePointAt(text, i);
            i += Character.charCount(codePoint);
            if (Character.isLetterOrDigit(codePoint)) {
                letterOrDigitCount++;
                if (letterOrDigitCount >= 2) {
                    return true;
                }
            }
        }
        return false;
    }

    public static boolean containsEmoji(CharSequence text) {
        if (text == null || text.length() == 0) return false;
        int length = text.length();
        for (int i = 0; i < length; ) {
            int codePoint = Character.codePointAt(text, i);
            i += Character.charCount(codePoint);
            if (isGenuineEmojiCodePoint(codePoint)) {
                return true;
            }
        }
        return false;
    }

    private static boolean isGenuineEmojiCodePoint(int codePoint) {
        if (codePoint >= 0x1F000 && codePoint <= 0x1FAFF) return true; // Emoticons, Pictographs, Symbols, Transport
        if (codePoint >= 0x2600 && codePoint <= 0x27BF) return true;   // Misc Symbols, Dingbats
        if (codePoint >= 0x2B50 && codePoint <= 0x2B55) return true;   // Stars, circles
        if (codePoint >= 0xFE00 && codePoint <= 0xFE0F) return true;   // Variation Selectors
        if (codePoint >= 0xE0020 && codePoint <= 0xE007F) return true; // Tag characters (flags)
        if (codePoint == 0x200D) return true;                          // Zero-width joiner
        return false;
    }

    public static boolean isEmojiOrSymbol(CharSequence text) {
        if (text == null || text.length() == 0) return false;
        int length = text.length();
        for (int i = 0; i < length; ) {
            int codePoint = Character.codePointAt(text, i);
            i += Character.charCount(codePoint);
            if (isEmojiCodePoint(codePoint)) {
                return true;
            }
        }
        return false;
    }

    private static boolean isEmojiCodePoint(int codePoint) {
        if (codePoint >= 0x1F000 && codePoint <= 0x1FAFF) return true; // Emoticons, Pictographs, Symbols, Transport
        if (codePoint >= 0x2600 && codePoint <= 0x27BF) return true;   // Misc Symbols, Dingbats
        if (codePoint >= 0x2300 && codePoint <= 0x23FF) return true;   // Misc Technical
        if (codePoint >= 0x2B00 && codePoint <= 0x2BFF) return true;   // Misc Symbols and Arrows
        if (codePoint >= 0x2190 && codePoint <= 0x21FF) return true;   // Arrows
        if (codePoint >= 0x2900 && codePoint <= 0x297F) return true;   // Supplemental Arrows B
        if (codePoint >= 0x3200 && codePoint <= 0x32FF) return true;   // Enclosed CJK
        if (codePoint >= 0xFE00 && codePoint <= 0xFE0F) return true;   // Variation Selectors
        if (codePoint >= 0xE0020 && codePoint <= 0xE007F) return true; // Tag characters (flags)
        if (codePoint == 0x200D) return true;                          // Zero-width joiner
        int type = Character.getType(codePoint);
        return type == Character.OTHER_SYMBOL || type == Character.SURROGATE || type == Character.MODIFIER_SYMBOL;
    }
}
