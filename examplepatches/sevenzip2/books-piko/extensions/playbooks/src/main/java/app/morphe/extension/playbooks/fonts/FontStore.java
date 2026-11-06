package app.morphe.extension.playbooks.fonts;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.AssetManager;
import android.util.Log;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.EnumSet;

/**
 * Custom font files and settings. Fonts live in the app's private files directory, so they
 * survive app updates (re-patching) but not clearing the app data.
 */
public final class FontStore {
    static final String TAG = "BooksPiko";

    /** Optional font embedded at patch time (see the "Bundled font file" patch option). */
    static final String BUNDLED_REGULAR_ASSET = "piko_fonts/bundled_regular";

    private static final String PREFERENCES = "books_piko_font";
    private static final String KEY_ENABLED = "enabled";
    private static final String KEY_REPLACE_ALL = "replace_all_families";
    private static final String KEY_FORCE = "force_over_publisher_fonts";
    private static final String KEY_KEEP_MONOSPACE = "keep_monospace";
    private static final String KEY_STROKE_BOLD = "stroke_bold";
    private static final String KEY_NAME_PREFIX = "name_";

    private static volatile FontStore instance;

    private final Context context;
    private final SharedPreferences preferences;
    private final File directory;
    private Boolean hasBundledFont;

    private FontStore(Context context) {
        this.context = context;
        this.preferences = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
        this.directory = new File(context.getFilesDir(), "books_piko_fonts");
    }

    public static FontStore get(Context context) {
        FontStore store = instance;
        if (store == null) {
            synchronized (FontStore.class) {
                store = instance;
                if (store == null) {
                    Context application = context.getApplicationContext();
                    store = new FontStore(application != null ? application : context);
                    instance = store;
                }
            }
        }
        return store;
    }

    // region Settings

    public boolean isEnabled() {
        return preferences.getBoolean(KEY_ENABLED, true);
    }

    public void setEnabled(boolean value) {
        preferences.edit().putBoolean(KEY_ENABLED, value).apply();
    }

    public boolean replaceAllFamilies() {
        return preferences.getBoolean(KEY_REPLACE_ALL, true);
    }

    public void setReplaceAllFamilies(boolean value) {
        preferences.edit().putBoolean(KEY_REPLACE_ALL, value).apply();
    }

    public boolean forceOverPublisherFonts() {
        return preferences.getBoolean(KEY_FORCE, true);
    }

    public void setForceOverPublisherFonts(boolean value) {
        preferences.edit().putBoolean(KEY_FORCE, value).apply();
    }

    public boolean keepMonospace() {
        return preferences.getBoolean(KEY_KEEP_MONOSPACE, true);
    }

    public void setKeepMonospace(boolean value) {
        preferences.edit().putBoolean(KEY_KEEP_MONOSPACE, value).apply();
    }

    public boolean strokeBold() {
        return preferences.getBoolean(KEY_STROKE_BOLD, true);
    }

    public void setStrokeBold(boolean value) {
        preferences.edit().putBoolean(KEY_STROKE_BOLD, value).apply();
    }

    // endregion

    // region Font files

    public File file(FontVariant variant) {
        return new File(directory, variant.key + ".font");
    }

    public boolean has(FontVariant variant) {
        if (file(variant).isFile()) return true;
        return variant == FontVariant.REGULAR && hasBundledFont();
    }

    public boolean hasPickedFont(FontVariant variant) {
        return file(variant).isFile();
    }

    /** Display name of the picked file, or null. */
    public String displayName(FontVariant variant) {
        if (hasPickedFont(variant)) return preferences.getString(KEY_NAME_PREFIX + variant.key, variant.key);
        if (variant == FontVariant.REGULAR && hasBundledFont()) return "(bundled)";
        return null;
    }

    /** True when reader fonts should currently be replaced. */
    public boolean isActive() {
        return isEnabled() && has(FontVariant.REGULAR);
    }

    public FontConfig config() {
        EnumSet<FontVariant> available = EnumSet.noneOf(FontVariant.class);
        for (FontVariant variant : FontVariant.values()) {
            if (has(variant)) available.add(variant);
        }
        return new FontConfig(replaceAllFamilies(), forceOverPublisherFonts(), keepMonospace(), strokeBold(), available);
    }

    /** Opens the face to serve for [variant], falling back to the regular face. */
    public InputStream open(FontVariant variant) throws IOException {
        File file = file(variant);
        if (!file.isFile()) file = file(FontVariant.REGULAR);
        if (file.isFile()) return new BufferedInputStream(new FileInputStream(file));
        return context.getAssets().open(BUNDLED_REGULAR_ASSET, AssetManager.ACCESS_STREAMING);
    }

    /** Stores a font. The data must already be validated with {@link FontFiles#detectMimeType}. */
    public void save(FontVariant variant, InputStream input, String displayName) throws IOException {
        if (!directory.isDirectory() && !directory.mkdirs()) {
            throw new IOException("Cannot create " + directory);
        }

        File target = file(variant);
        File temporary = new File(directory, variant.key + ".tmp");
        OutputStream output = new FileOutputStream(temporary);
        try {
            byte[] buffer = new byte[64 * 1024];
            int read;
            while ((read = input.read(buffer)) != -1) {
                output.write(buffer, 0, read);
            }
        } finally {
            output.close();
        }

        if (!temporary.renameTo(target)) {
            temporary.delete();
            throw new IOException("Cannot write " + target);
        }

        preferences.edit().putString(KEY_NAME_PREFIX + variant.key, displayName).apply();
        ReaderFontPatch.invalidateCache();
    }

    public void delete(FontVariant variant) {
        if (file(variant).delete()) {
            Log.i(TAG, "Deleted custom font " + variant.key);
        }
        preferences.edit().remove(KEY_NAME_PREFIX + variant.key).apply();
        ReaderFontPatch.invalidateCache();
    }

    private boolean hasBundledFont() {
        Boolean bundled = hasBundledFont;
        if (bundled == null) {
            try {
                context.getAssets().open(BUNDLED_REGULAR_ASSET).close();
                bundled = true;
            } catch (IOException e) {
                bundled = false;
            }
            hasBundledFont = bundled;
        }
        return bundled;
    }

    // endregion
}
