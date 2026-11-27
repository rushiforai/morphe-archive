package app.template.extension.zalo.appearance;

import android.app.Activity;
import android.app.Fragment;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.provider.OpenableColumns;
import android.text.TextPaint;
import android.widget.Toast;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Locale;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.buglog.Patch;
import app.template.extension.zalo.settings.NezumiPrefs;
import app.template.extension.zalo.settings.RestartPrompt;

public final class CustomFont extends Fragment {
    /** Pref key of the selected font file; also the option's key in {@link RestartPrompt}. */
    public static final String FONT = "custom_font";
    private static final String TAG = "CustomFont";
    private static final int PICK_FONT = 1042;
    private static Typeface cachedFont;
    private static String cachedPath;
    private static final Typeface[] cachedStyles = new Typeface[16];
    private static final WeakHashMap<TextPaint, Typeface> chatPaintFonts = new WeakHashMap<>();
    private Runnable onChanged;

    public static Typeface getTypeface(Context context, int fontStyle) {
        if (context == null) return null;
        String path = NezumiPrefs.of(context).getString(FONT, null);
        if (path == null) return null;
        synchronized (CustomFont.class) {
            if (!path.equals(cachedPath)) {
                try {
                    cachedFont = Typeface.createFromFile(new File(context.getFilesDir(), path));
                } catch (RuntimeException failure) {
                    NezumiLog.swallowedOnce(Patch.CUSTOM_FONT, TAG, "custom font file failed to load", failure);
                    cachedFont = null;
                }
                cachedPath = path;
                for (int index = 0; index < cachedStyles.length; index++) cachedStyles[index] = null;
            }
            if (cachedFont == null) return null;
            int styleIndex = fontStyle >= 0 && fontStyle < cachedStyles.length ? fontStyle : 0;
            if (cachedStyles[styleIndex] == null) cachedStyles[styleIndex] = styled(cachedFont, fontStyle);
            return cachedStyles[styleIndex];
        }
    }

    public static Typeface forMessageModule(Context context, Typeface original) {
        Typeface font = getTypeface(context, 0);
        if (font == null) return original;
        if (original == null) return font;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            return Typeface.create(font, original.getWeight(), original.isItalic());
        }
        return Typeface.create(font, original.getStyle());
    }

    public static void diagnoseRichItem(Context context, Typeface original, Typeface requested, Typeface actual) {
        boolean selected = context != null && NezumiPrefs.of(context).contains(FONT);
        boolean loaded = getTypeface(context, 0) != null;
        NezumiLog.i(Patch.CUSTOM_FONT, TAG, "rich-item selected=" + selected + " loaded=" + loaded
                + " changed=" + (requested != original) + " applied=" + (actual == requested));
    }

    public static Typeface forZinstantText(Context context, boolean hasCachedFont, Typeface original) {
        if (hasCachedFont) return original;
        return forMessageModule(context, original);
    }

    public static void forChatPaint(Context context, TextPaint paint) {
        if (paint == null) return;
        Typeface font = getTypeface(context, 0);
        if (font == null) return;
        Typeface current = paint.getTypeface();
        synchronized (chatPaintFonts) {
            if (current == font || current == chatPaintFonts.get(paint)) return;
        }
        if (current != null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            font = Typeface.create(font, current.getWeight(), current.isItalic());
        } else if (current != null) {
            font = Typeface.create(font, current.getStyle());
        }
        if (current != font) {
            paint.setTypeface(font);
            synchronized (chatPaintFonts) {
                chatPaintFonts.put(paint, font);
            }
        }
    }

    private static Typeface styled(Typeface font, int fontStyle) {
        int weight;
        switch (fontStyle) {
            case 1: weight = 100; break;
            case 3: weight = 300; break;
            case 7:
            case 11: weight = 500; break;
            case 9: weight = 700; break;
            case 12: weight = 900; break;
            case 13: weight = 600; break;
            case 14: weight = 800; break;
            case 15: weight = 200; break;
            default: weight = 400;
        }
        boolean italic = fontStyle == 6;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) return Typeface.create(font, weight, italic);
        return Typeface.create(font, (weight >= 600 ? Typeface.BOLD : Typeface.NORMAL)
                | (italic ? Typeface.ITALIC : Typeface.NORMAL));
    }

    public static boolean isSelected(Context context) {
        return NezumiPrefs.of(context).contains(FONT);
    }

    /**
     * Starts tracking the font for {@link RestartPrompt}: Zalo's font gate and the text caches are
     * set up once per process, so a different font needs a restart. Safe to call more than once.
     */
    public static void trackForRestart(Context context) {
        if (context != null) RestartPrompt.track(FONT, NezumiPrefs.of(context).getString(FONT, null));
    }

    public static void enableSelectedFont(Context context, AtomicBoolean fontEnabled) {
        trackForRestart(context);
        if (context != null && fontEnabled != null && isSelected(context)) {
            fontEnabled.set(true);
            if (context.getApplicationContext() instanceof android.app.Application) {
                NativeFontObserver.register((android.app.Application) context.getApplicationContext());
            }
        }
    }

    public static void reset(Context context) {
        SharedPreferences prefs = NezumiPrefs.of(context);
        String previous = prefs.getString(FONT, null);
        prefs.edit().remove(FONT).apply();
        RestartPrompt.changed(FONT, null);
        synchronized (CustomFont.class) {
            cachedFont = null;
            cachedPath = null;
            for (int index = 0; index < cachedStyles.length; index++) cachedStyles[index] = null;
        }
        synchronized (chatPaintFonts) {
            chatPaintFonts.clear();
        }
        if (previous != null) new File(context.getFilesDir(), previous).delete();
    }

    public static boolean pick(Context context, Runnable onChanged) {
        while (context instanceof ContextWrapper && !(context instanceof Activity)) {
            context = ((ContextWrapper) context).getBaseContext();
        }
        if (!(context instanceof Activity)) return false;
        Activity activity = (Activity) context;
        CustomFont fragment = new CustomFont();
        fragment.onChanged = onChanged;
        activity.getFragmentManager().beginTransaction().add(fragment, TAG).commit();
        return true;
    }

    @Override public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (savedInstanceState != null) return;
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.setType("*/*");
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        try {
            startActivityForResult(intent, PICK_FONT);
        } catch (ActivityNotFoundException failure) {
            NezumiLog.w(Patch.CUSTOM_FONT, TAG, "no document picker for fonts", failure);
            Toast.makeText(getActivity(), "Cannot open font picker.", Toast.LENGTH_SHORT).show();
            getFragmentManager().beginTransaction().remove(this).commit();
        }
    }

    @Override public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != PICK_FONT) return;
        if (resultCode == Activity.RESULT_OK && data != null && data.getData() != null) {
            try {
                save(getActivity(), data.getData());
                if (onChanged != null) onChanged.run();
            } catch (Exception failure) {
                NezumiLog.w(Patch.CUSTOM_FONT, TAG, "font import failed", failure);
                Toast.makeText(getActivity(), "Could not load this font.", Toast.LENGTH_SHORT).show();
            }
        }
        getFragmentManager().beginTransaction().remove(this).commit();
    }

    private static void save(Context context, Uri uri) throws Exception {
        try (Cursor cursor = context.getContentResolver().query(uri,
                new String[] { OpenableColumns.DISPLAY_NAME }, null, null, null)) {
            if (cursor == null || !cursor.moveToFirst()) throw new IllegalArgumentException("Missing font name");
            String name = cursor.getString(0);
            if (name == null || !(name.toLowerCase(Locale.ROOT).endsWith(".ttf")
                    || name.toLowerCase(Locale.ROOT).endsWith(".otf"))) {
                throw new IllegalArgumentException("Unsupported font type");
            }
        }
        File file = File.createTempFile("nezumi-font-", ".tmp", context.getFilesDir());
        try {
            try (InputStream input = context.getContentResolver().openInputStream(uri);
                 FileOutputStream output = new FileOutputStream(file)) {
                if (input == null) throw new IllegalArgumentException("Empty font document");
                byte[] buffer = new byte[8192];
                long size = 0;
                int count;
                while ((count = input.read(buffer)) != -1) {
                    size += count;
                    if (size > 20 * 1024 * 1024) throw new IllegalArgumentException("Font too large");
                    output.write(buffer, 0, count);
                }
            }
            Typeface.createFromFile(file);
            SharedPreferences prefs = NezumiPrefs.of(context);
            String previous = prefs.getString(FONT, null);
            if (!prefs.edit().putString(FONT, file.getName()).commit()) throw new IllegalStateException("Font not saved");
            RestartPrompt.changed(FONT, file.getName());
            synchronized (CustomFont.class) {
                cachedFont = null;
                cachedPath = null;
                for (int index = 0; index < cachedStyles.length; index++) cachedStyles[index] = null;
            }
            synchronized (chatPaintFonts) {
                chatPaintFonts.clear();
            }
            if (previous != null) new File(context.getFilesDir(), previous).delete();
        } catch (Exception exception) {
            file.delete();
            throw exception;
        }
    }
}