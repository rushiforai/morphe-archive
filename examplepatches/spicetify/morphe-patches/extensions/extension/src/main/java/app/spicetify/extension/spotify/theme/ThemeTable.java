package app.spicetify.extension.spotify.theme;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.loader.ResourcesLoader;
import android.content.res.loader.ResourcesProvider;
import android.os.Build;
import android.os.ParcelFileDescriptor;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * Lays a theme over Spotify's resources from Android 11. A {@link ColorTable} holds the theme's value
 * for each mapped color under the running Spotify's own resource IDs, and one shared
 * {@link ResourcesLoader} lays it over Spotify's resources. A loader's value wins over Spotify's in the
 * same configuration, and every mapped color has only the default one.
 */
@TargetApi(Build.VERSION_CODES.R)
final class ThemeTable {
    private static final String FILE = "spicetify_theme.arsc";
    private static final ResourcesLoader LOADER = new ResourcesLoader();
    private static ResourcesProvider provider;

    private ThemeTable() {}

    /** Adds the shared loader to {@code resources}; adding it again is ignored. */
    static void applyTo(Resources resources) {
        resources.addLoaders(LOADER);
    }

    /** Lays these color values, by resource name, over Spotify's; none restores Spotify's own. */
    static void load(Context context, Map<String, Integer> values) throws IOException {
        Map<Integer, Integer> colors = new TreeMap<>();
        for (Map.Entry<String, Integer> value : values.entrySet()) {
            int id = context.getResources().getIdentifier(value.getKey(), "color", context.getPackageName());
            if (id != 0) colors.put(id, value.getValue());
        }
        loadIds(context, colors);
    }

    /** Lays these color values, by resource ID, over Spotify's; none restores Spotify's own. */
    static synchronized void loadIds(Context context, Map<Integer, Integer> colors) throws IOException {
        ResourcesProvider previous = provider;
        if (colors.isEmpty()) {
            LOADER.clearProviders();
            provider = null;
            // Spotify's own colors need no table.
            delete(context);
        } else {
            // Type names go by type ID, so the ones before the colors' type only hold its place.
            List<String> types = new ArrayList<>();
            for (int type = 1; type < ((colors.keySet().iterator().next() >>> 16) & 0xFF); type++) types.add("type" + type);
            types.add("color");
            // Written to a temporary file and renamed, so the file a provider holds open never changes.
            File file = new File(context.getNoBackupFilesDir(), FILE);
            File tmp = new File(file.getPath() + ".tmp");
            try (FileOutputStream output = new FileOutputStream(tmp)) {
                output.write(ColorTable.build(context.getPackageName(), types, colors));
            }
            if (!tmp.renameTo(file)) throw new IOException("Could not replace " + file);
            try (ParcelFileDescriptor table = ParcelFileDescriptor.open(file, ParcelFileDescriptor.MODE_READ_ONLY)) {
                provider = ResourcesProvider.loadFromTable(table, null);
            }
            LOADER.setProviders(Collections.singletonList(provider));
        }
        if (previous != null) previous.close();
    }

    /** Deletes the table file. A provider that still has it open keeps reading it. */
    static void delete(Context context) {
        new File(context.getNoBackupFilesDir(), FILE).delete();
    }
}
