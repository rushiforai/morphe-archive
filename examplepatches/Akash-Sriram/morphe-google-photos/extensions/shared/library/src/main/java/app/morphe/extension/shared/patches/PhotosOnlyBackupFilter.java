package app.morphe.extension.shared.patches;

import android.content.Context;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * "Upload photos only" filter for automatic backup.
 * <p>
 * Google Photos has no setting to back up photos without also backing up videos:
 * the master backup toggle uploads everything in the selected device folders.
 * When this filter is enabled (Morphe Settings -&gt; Backup &amp; Storage -&gt;
 * "Upload photos only"), the backup queue query built by the app
 * (Luiz.g, the same builder the DCIM &amp; backup control patch hooks) gets an
 * additional media-type exclusion appended to its WHERE clause, so video items
 * are never selected for automatic upload. Photos keep flowing through the
 * exact same query, so every existing user preference (master backup toggle,
 * per-folder backup toggles, backup quality / spoof profile) is respected
 * unchanged. Manual backup of a single item does not use this queue query and
 * is not affected.
 * <p>
 * Media type values in the local media tables (enum Laahw, verified against
 * Google Photos 7.99.0.1007655401): UNKNOWN = 0, IMAGE = 1, VIDEO = 2,
 * PHOTOSPHERE = 3, ANIMATION = 4. Only VIDEO (2) is excluded; photospheres and
 * animations are photos and still upload.
 */
public final class PhotosOnlyBackupFilter {

    public static final String PREF_KEY_PHOTOS_ONLY = "morphe_upload_photos_only";
    private static final String PREFS_NAME = "morphe_settings";

    private static final int MEDIA_TYPE_VIDEO = 2;

    private static volatile Boolean cachedEnabled = null;

    /**
     * The media-type column for the table mapping whose queue query is
     * currently being built on this thread. Set at the entry of the query
     * builder and consumed (and cleared) at its return, so concurrent or
     * sequential queries for different tables never mix columns.
     */
    private static final ThreadLocal<String> currentTypeColumn = new ThreadLocal<>();

    private PhotosOnlyBackupFilter() {}

    public static boolean isEnabled() {
        Boolean cached = cachedEnabled;
        if (cached != null) return cached;
        try {
            Context ctx = Utils.getContextOrNull();
            if (ctx != null) {
                boolean value = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                        .getBoolean(PREF_KEY_PHOTOS_ONLY, false);
                cachedEnabled = value;
                return value;
            }
        } catch (Throwable ignored) {}
        return false;
    }

    public static void setEnabled(Context context, boolean enabled) {
        cachedEnabled = enabled;
        if (context != null) {
            try {
                context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                        .edit()
                        .putBoolean(PREF_KEY_PHOTOS_ONLY, enabled)
                        .commit();
            } catch (Throwable t) {
                Logger.printException(() -> "Error saving upload photos only setting", t);
            }
        }
    }

    /**
     * Called at the entry of the backup queue WHERE-clause builder with the
     * query's table mapping (a Lujd enum value: LOCAL_MEDIA,
     * LOCAL_PRIVATE_MEDIA or LOCKED_FOLDER).
     */
    public static void onBackupQueryStart(Object tableMapping) {
        try {
            if (!isEnabled()) {
                currentTypeColumn.remove();
                return;
            }
            String column = typeColumnFor(tableMapping);
            if (column != null) {
                currentTypeColumn.set(column);
            } else {
                currentTypeColumn.remove();
            }
        } catch (Throwable ignored) {
            currentTypeColumn.remove();
        }
    }

    /**
     * Called with the finished WHERE clause just before the query builder
     * returns it. When the toggle is on, appends the video exclusion for the
     * media table this query targets; otherwise returns the clause unchanged.
     */
    public static String applyPhotosOnlyFilter(String whereClause) {
        try {
            String column = currentTypeColumn.get();
            currentTypeColumn.remove();
            if (whereClause == null || column == null || !isEnabled()) {
                return whereClause;
            }
            Logger.printInfo(() -> "Upload photos only: excluding videos from backup queue query");
            return whereClause + " AND " + column + " != " + MEDIA_TYPE_VIDEO;
        } catch (Throwable ignored) {
            return whereClause;
        }
    }

    private static String typeColumnFor(Object tableMapping) {
        if (tableMapping instanceof Enum) {
            switch (((Enum<?>) tableMapping).name()) {
                case "LOCAL_MEDIA":
                    return "local_media.type";
                case "LOCAL_PRIVATE_MEDIA":
                    return "local_private_media.type";
                case "LOCKED_FOLDER":
                    return "account_local_locked_media.type";
                default:
                    return null;
            }
        }
        return null;
    }
}
