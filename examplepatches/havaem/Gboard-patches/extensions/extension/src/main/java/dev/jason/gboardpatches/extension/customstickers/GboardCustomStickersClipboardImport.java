package dev.jason.gboardpatches.extension.customstickers;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.Log;
import android.util.SparseArray;
import android.view.Gravity;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.PopupWindow;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/** Saves image clips selected in the clipboard's edit mode into a Custom Stickers pack. */
public final class GboardCustomStickersClipboardImport {
    private static final String TAG = "GboardStickerClipImport";

    /** Localized texts, resolved by the caller in the settings language. */
    public static final class Texts {
        final String noImages;
        final String newPack;
        final String defaultPackName;
        final String added;
        final String failed;

        /** {@code added} takes the count and the pack name; {@code failed} takes the count. */
        public Texts(String noImages, String newPack, String defaultPackName, String added,
                String failed) {
            this.noImages = noImages;
            this.newPack = newPack;
            this.defaultPackName = defaultPackName;
            this.added = added;
            this.failed = failed;
        }
    }

    private final Field adapter, selection;
    private final Method text, uri;

    public GboardCustomStickersClipboardImport(ClassLoader loader)
            throws ReflectiveOperationException {
        Class<?> keyboard = Class.forName(
                "com.google.android.apps.inputmethod.libs.clipboard.ClipboardKeyboard", false, loader);
        Class<?> adapterClass = Class.forName("fqn", false, loader);
        Class<?> clip = Class.forName("fpk", false, loader);
        adapter = field(keyboard, "c", adapterClass);
        selection = field(adapterClass, "g", SparseArray.class);
        text = method(clip, "i");
        uri = method(clip, "j");
    }

    /** Image clips have no text and a content URI. */
    public List<String> selectedImages(Object keyboard) throws ReflectiveOperationException {
        List<String> result = new ArrayList<>();
        Object list = adapter.get(keyboard);
        Object value = list == null ? null : selection.get(list);
        if (!(value instanceof SparseArray<?> selected)) return result;
        for (int i = 0; i < selected.size(); i++) {
            Object clip = selected.valueAt(i);
            if (clip == null || !TextUtils.isEmpty((String) text.invoke(clip))) continue;
            String location = (String) uri.invoke(clip);
            if (!TextUtils.isEmpty(location)) result.add(location);
        }
        return result;
    }

    /** Shows the pack chooser under {@code anchor}, or a hint when no image is selected. */
    public void show(View anchor, List<String> images, Texts texts) {
        Context context = anchor.getContext();
        if (images.isEmpty()) {
            Toast.makeText(context, texts.noImages, Toast.LENGTH_SHORT).show();
            return;
        }
        float density = context.getResources().getDisplayMetrics().density;
        LinearLayout list = new LinearLayout(context);
        list.setOrientation(LinearLayout.VERTICAL);
        ScrollView scroll = new ScrollView(context);
        scroll.addView(list);
        PopupWindow popup = new PopupWindow(scroll, Math.round(240 * density),
                LinearLayout.LayoutParams.WRAP_CONTENT, false);
        // Not focusable: a focusable popup would take input focus from the IME window.
        popup.setOutsideTouchable(true);
        for (GboardCustomStickersStore.Pack pack : GboardCustomStickersStore.load(context)) {
            list.addView(row(context, density, pack.name, () -> {
                popup.dismiss();
                save(context, images, pack.id, null, texts);
            }));
        }
        list.addView(row(context, density, "+ " + texts.newPack, () -> {
            popup.dismiss();
            save(context, images, null, texts.defaultPackName, texts);
        }));
        GradientDrawable background = new GradientDrawable();
        TypedArray colors = context.obtainStyledAttributes(
                new int[] { android.R.attr.colorBackground });
        try { background.setColor(colors.getColor(0, Color.DKGRAY)); }
        finally { colors.recycle(); }
        background.setCornerRadius(8 * density);
        popup.setBackgroundDrawable(background);
        popup.setElevation(6 * density);
        popup.setInputMethodMode(PopupWindow.INPUT_METHOD_NOT_NEEDED);
        popup.showAsDropDown(anchor, 0, 0, Gravity.END);
    }

    private static View row(Context context, float density, String label, Runnable action) {
        TextView row = new TextView(context);
        row.setText(label);
        row.setSingleLine(true);
        row.setEllipsize(TextUtils.TruncateAt.END);
        row.setTextSize(16);
        TypedArray colors = context.obtainStyledAttributes(
                new int[] { android.R.attr.textColorPrimary });
        try { row.setTextColor(colors.getColorStateList(0)); }
        finally { colors.recycle(); }
        int padding = Math.round(16 * density);
        row.setPadding(padding, padding * 3 / 4, padding, padding * 3 / 4);
        row.setOnClickListener(view -> action.run());
        return row;
    }

    /** Reads and encodes off the UI thread; Gboard's favorites store is touched on the UI thread. */
    private static void save(Context context, List<String> images, String packId, String newName,
            Texts texts) {
        Context app = context.getApplicationContext() != null
                ? context.getApplicationContext() : context;
        Handler main = new Handler(Looper.getMainLooper());
        new Thread(() -> {
            int added = 0;
            String target = packId;
            String name = null;
            try {
                if (target == null) {
                    GboardCustomStickersStore.Pack pack =
                            GboardCustomStickersStore.createPack(app, newName);
                    target = pack.id;
                    String created = target;
                    main.post(() -> GboardCustomStickersRuntime.setShownInKeyboard(app, created, true));
                }
                GboardCustomStickersStore.Pack pack = GboardCustomStickersStore.findPack(app, target);
                name = pack == null ? "" : pack.name;
                for (String image : images) {
                    try {
                        GboardCustomStickersStore.addSticker(app, target, read(app, image));
                        added++;
                    } catch (IOException | RuntimeException failure) {
                        Log.w(TAG, "Failed to add clipboard image as sticker", failure);
                    }
                }
            } catch (Throwable failure) {
                Log.w(TAG, "Failed to save clipboard images as stickers", failure);
            }
            int ok = added;
            int failed = images.size() - added;
            String packName = name;
            main.post(() -> Toast.makeText(app, failed == 0
                    ? String.format(texts.added, ok, packName)
                    : String.format(texts.failed, failed), Toast.LENGTH_SHORT).show());
        }, "GboardStickerClipImport").start();
    }

    private static byte[] read(Context context, String location) throws IOException {
        try (InputStream input = context.getContentResolver().openInputStream(Uri.parse(location))) {
            if (input == null) throw new IOException("Clip image unavailable");
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            byte[] buffer = new byte[16 * 1024];
            int total = 0;
            for (int count; (count = input.read(buffer)) != -1; ) {
                total += count;
                if (total > GboardCustomStickersStore.MAX_IMPORT_BYTES) {
                    throw new IOException("Clip image too large");
                }
                output.write(buffer, 0, count);
            }
            return output.toByteArray();
        }
    }

    private static Field field(Class<?> owner, String name, Class<?> type)
            throws NoSuchFieldException {
        Field value = owner.getDeclaredField(name);
        if (value.getType() != type) throw new NoSuchFieldException(owner.getName() + "." + name);
        value.setAccessible(true);
        return value;
    }

    private static Method method(Class<?> owner, String name) throws NoSuchMethodException {
        Method value = owner.getDeclaredMethod(name);
        if (value.getReturnType() != String.class) {
            throw new NoSuchMethodException(owner.getName() + "." + name);
        }
        value.setAccessible(true);
        return value;
    }
}
