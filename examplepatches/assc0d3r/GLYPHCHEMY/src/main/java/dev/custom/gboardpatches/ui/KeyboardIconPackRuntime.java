package dev.custom.gboardpatches.ui;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 * Loads WMKeyboard-compatible raster icon packs imported through the Theme Builder.
 *
 * Packs live in the app's own files directory, so no storage permission is needed on any
 * Android version. The importer writes the chosen pack to {@link #ACTIVE_PACK_FILE} and the
 * original file name to {@link #ACTIVE_NAME_FILE}; if the pack is absent the first
 * *.wmicons.zip in the directory is used instead.
 */
public final class KeyboardIconPackRuntime {

    public static final String PACK_DIR = "iconpacks";
    public static final String ACTIVE_PACK_FILE = "active.wmicons.zip";
    public static final String ACTIVE_NAME_FILE = "active.name";

    private static final Map<String, Bitmap> CACHE = new HashMap<String, Bitmap>();
    private static boolean loaded = false;
    private static String activePackName = null;

    private KeyboardIconPackRuntime() {
    }

    /** Called from Gboard's preference-group init hook; icon packs need no preference wiring. */
    public static void initializePreferences(Object preferenceGroup) {
    }

    public static File packDirectory(Context context) {
        return new File(context.getFilesDir(), PACK_DIR);
    }

    public static File activePackFile(Context context) {
        return new File(packDirectory(context), ACTIVE_PACK_FILE);
    }

    /** Drops the cached bitmaps so a newly imported pack takes effect immediately. */
    public static synchronized void reload() {
        CACHE.clear();
        loaded = false;
        activePackName = null;
    }

    public static synchronized int iconCount(Context context) {
        ensureLoaded(context);
        return CACHE.size();
    }

    public static synchronized String activePackName(Context context) {
        ensureLoaded(context);
        return activePackName;
    }

    public static void applyIcon(final View keyView, Object softKeyDef) {
        try {
            if (keyView == null) {
                return;
            }
            final Context context = keyView.getContext();
            if (context == null) {
                return;
            }
            // The hook runs at the start of the key's render method, which sets the stock icon
            // afterwards, so the pack icon is applied once that pass has finished.
            keyView.post(new Runnable() {
                @Override
                public void run() {
                    applyIconNow(keyView, context);
                }
            });
        } catch (Throwable ignored) {
        }
    }

    private static void applyIconNow(View keyView, Context context) {
        try {
            ensureLoaded(context);
            if (CACHE.isEmpty()) {
                return;
            }
            int id = keyView.getId();
            if (id == View.NO_ID) {
                return;
            }
            String entryName;
            try {
                entryName = keyView.getResources().getResourceEntryName(id);
            } catch (Throwable ignored) {
                return;
            }
            String slot = mapResourceToSlot(entryName);
            if (slot == null) {
                return;
            }
            Bitmap bitmap = CACHE.get(slot);
            if (bitmap == null) {
                return;
            }
            ImageView icon = findIconView(keyView);
            if (icon == null) {
                return;
            }
            icon.setImageDrawable(new BitmapDrawable(keyView.getResources(), bitmap));
        } catch (Throwable ignored) {
        }
    }

    private static synchronized void ensureLoaded(Context context) {
        if (loaded) {
            return;
        }
        loaded = true;
        try {
            File dir = packDirectory(context);
            if (!dir.isDirectory()) {
                return;
            }
            File pack = new File(dir, ACTIVE_PACK_FILE);
            if (!pack.isFile()) {
                pack = firstPackIn(dir);
            }
            if (pack == null) {
                return;
            }
            activePackName = readActiveName(context, pack);
            ZipInputStream stream = new ZipInputStream(new FileInputStream(pack));
            try {
                ZipEntry entry = stream.getNextEntry();
                while (entry != null) {
                    String name = entry.getName();
                    if (name.startsWith("icons/") && name.endsWith(".png")) {
                        String slot = name.substring("icons/".length(), name.length() - 4);
                        Bitmap bitmap = BitmapFactory.decodeStream(stream);
                        if (bitmap != null) {
                            CACHE.put(slot, bitmap);
                        }
                    }
                    entry = stream.getNextEntry();
                }
            } finally {
                stream.close();
            }
        } catch (Throwable ignored) {
        }
    }

    private static String readActiveName(Context context, File pack) {
        try {
            File nameFile = new File(packDirectory(context), ACTIVE_NAME_FILE);
            if (!nameFile.isFile()) {
                return pack.getName();
            }
            FileInputStream in = new FileInputStream(nameFile);
            try {
                byte[] buffer = new byte[(int) nameFile.length()];
                int read = in.read(buffer);
                if (read > 0) {
                    return new String(buffer, 0, read, "UTF-8").trim();
                }
            } finally {
                in.close();
            }
        } catch (Throwable ignored) {
        }
        return pack.getName();
    }

    private static File firstPackIn(File dir) {
        File[] candidates = dir.listFiles();
        if (candidates == null) {
            return null;
        }
        for (int i = 0; i < candidates.length; i++) {
            String name = candidates[i].getName();
            if (candidates[i].isFile()
                && (name.endsWith(".wmicons.zip") || name.endsWith(".wmicons"))) {
                return candidates[i];
            }
        }
        return null;
    }

    private static String mapResourceToSlot(String entryName) {
        if ("key_pos_del".equals(entryName)) return "key.backspace";
        if ("key_pos_ime_action".equals(entryName)) return "key.enter";
        if ("key_pos_shift".equals(entryName) || "key_pos_shift_right".equals(entryName)) return "key.shift";
        if ("key_pos_caps".equals(entryName)) return "key.shift_lock";
        if ("key_pos_qwerty_globe".equals(entryName)) return "key.globe";
        if ("key_pos_switch_to_smiley".equals(entryName)) return "key.emoji";
        if ("key_pos_clipboard_icons".equals(entryName)) return "tool.clipboard";
        if ("key_pos_header_voice".equals(entryName)) return "tool.voice";
        return null;
    }

    private static ImageView findIconView(View view) {
        if (view instanceof ImageView) {
            return (ImageView) view;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                ImageView found = findIconView(group.getChildAt(i));
                if (found != null) {
                    return found;
                }
            }
        }
        return null;
    }
}
