package app.saketh.extension.fonts;

import android.content.Context;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Build;
import android.text.method.PasswordTransformationMethod;
import android.view.View;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import app.saketh.extension.controls.PatchSettings;

public final class FontHooks {
    private static volatile Typeface appFont, readerFont;
    private static volatile boolean loaded;

    private FontHooks() {}

    private static File file(Context context, boolean reader) {
        return new File(context.getFilesDir(), reader ? "saketh_reader.font" : "saketh_app.font");
    }

    private static Typeface load(File file) {
        if (!file.isFile()) return null;
        try {
            return new Typeface.Builder(file).build();
        } catch (RuntimeException invalid) {
            android.util.Log.w("WebNovelPatches", "Saved font could not be loaded; using original font.");
            return null;
        }
    }

    private static void ensureLoaded(Context context) {
        if (loaded) return;
        synchronized (FontHooks.class) {
            if (loaded) return;
            appFont = load(file(context, false));
            readerFont = load(file(context, true));
            loaded = true;
        }
    }
    public static Typeface readerTypeface(Typeface original) {
        Context context = PatchSettings.context;
        return context == null ? original : readerTypeface(context, original);
    }

    public static Typeface uiTypeface(Typeface original) {
        Context context = PatchSettings.context;
        return context == null ? original : uiTypeface(context, original);
    }


    public static Typeface readerTypeface(Context context, Typeface original) {
        ensureLoaded(context);
        Typeface selected = readerFont;
        return selected == null ? original : selected;
    }

    public static Typeface readerFallbackTypeface(Context context) {
        return readerTypeface(context, Typeface.create("sans-serif", Typeface.NORMAL));
    }

    public static Typeface uiTypeface(Context context, Typeface original) {
        ensureLoaded(context);
        Typeface selected = appFont;
        if (selected == null) return original;
        if (original == null) return selected;
        return Build.VERSION.SDK_INT >= 28
                ? Typeface.create(selected, original.getWeight(), original.isItalic())
                : Typeface.create(selected, original.getStyle());
    }

    public static void apply(View view) {
        if (!(view instanceof TextView)) return;
        TextView text = (TextView) view;
        ensureLoaded(text.getContext());
        if (appFont == null) return;
        if (text.getTransformationMethod() instanceof PasswordTransformationMethod) return;
        CharSequence value = text.getText();
        for (int i = 0; i < value.length();) {
            int point = Character.codePointAt(value, i);
            if (Character.getType(point) == Character.PRIVATE_USE) return;
            i += Character.charCount(point);
        }
        Typeface face = uiTypeface(text.getContext(), text.getTypeface());
        if (face != text.getTypeface()) text.setTypeface(face);
    }

    public static boolean hasCustom(Context context, boolean reader) {
        ensureLoaded(context);
        return (reader ? readerFont : appFont) != null;
    }

    // The caller runs file/provider I/O off the UI thread. Only the final rename holds the cache lock.
    public static void importFont(Context context, Uri uri, boolean reader) throws IOException {
        if (!"content".equals(uri.getScheme())) throw new IOException("Choose a font through the file picker.");
        File target = file(context, reader);
        File pending = File.createTempFile("saketh-font-", ".tmp", context.getFilesDir());
        try {
            try (InputStream input = context.getContentResolver().openInputStream(uri);
                    FileOutputStream output = new FileOutputStream(pending)) {
                if (input == null) throw new IOException("Cannot read the selected file.");
                FontFile.copy(input, output);
                output.getFD().sync();
            }
            Typeface candidate = new Typeface.Builder(pending).build();
            if (candidate == null) throw new IOException("Android cannot load this font. Previous font kept.");
            ensureLoaded(context);
            synchronized (FontHooks.class) {
                Files.move(pending.toPath(), target.toPath(), StandardCopyOption.ATOMIC_MOVE,
                        StandardCopyOption.REPLACE_EXISTING);
                if (reader) readerFont = candidate;
                else appFont = candidate;
            }
        } catch (RuntimeException invalid) {
            throw new IOException("Cannot load the selected font. Previous font kept.", invalid);
        } finally {
            Files.deleteIfExists(pending.toPath());
        }
    }

    public static synchronized void reset(Context context, boolean reader) throws IOException {
        Files.deleteIfExists(file(context, reader).toPath());
        if (reader) readerFont = null;
        else appFont = null;
    }
}
