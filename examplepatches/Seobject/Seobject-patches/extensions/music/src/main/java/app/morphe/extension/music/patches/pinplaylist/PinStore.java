package app.morphe.extension.music.patches.pinplaylist;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

/**
 * Local storage for pinned playlist IDs. Pure SharedPreferences, no
 * dependency on any app-internal (obfuscated) classes, so this file should
 * compile and run unchanged across app versions.
 */
public final class PinStore {

    private static final String TAG = "PinMod";
    private static final String PREFS_NAME = "pin_mod_prefs";
    private static final String KEY_PINNED = "pinned_playlist_ids";
    private static final String KEY_PIN_ORDER = "pinned_playlist_order";
    private static final String KEY_LIBRARY_PERMUTATION =
            "library_permutation";
    private static final String KEY_LIBRARY_PERMUTATION_PINS =
            "library_permutation_pins";
    private static final String KEY_LIBRARY_PERMUTATION_ROW_TYPE =
            "library_permutation_row_type";
    private static final String KEY_LIBRARY_PLAYLIST_SLOTS =
            "library_playlist_slots";
    private static final String KEY_LIBRARY_NATIVE_STABLE_IDS =
            "library_native_stable_ids";
    private static final String KEY_FEATURE_STATE_INITIALIZED =
            "pin_feature_state_initialized";
    private static final String KEY_FEATURE_ENABLED_LAST_PROCESS =
            "pin_feature_enabled_last_process";
    private static final String KEY_SIGNATURE_PREFIX =
            "playlist_signature:";

    private static final Pattern PLAYLIST_ID_PATTERN =
            Pattern.compile(
                    "(?:OLAK5uy_[A-Za-z0-9_-]{8,}|"
                            + "PL[A-Za-z0-9_-]{30,}|"
                            + "LRSR[A-Za-z0-9_-]{8,})"
            );

    private static volatile Boolean cachedHasAnyPins;

    private PinStore() {}

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    public static boolean isSupportedPlaylistId(String playlistId) {
        return playlistId != null
                && ("LM".equals(playlistId)
                || PLAYLIST_ID_PATTERN.matcher(playlistId).matches());
    }

    /**
     * Synchronizes persisted pin data with the restart-required feature state.
     *
     * Returning to enabled after the feature was actually run disabled starts
     * a new pin session: old pinned IDs and chronology are removed. The first
     * run after installing this version only initializes the marker and keeps
     * the user's current pins.
     *
     * @return true when a disabled -> enabled transition cleared old pins.
     */
    public static synchronized boolean synchronizeFeatureState(
            Context context,
            boolean enabled
    ) {
        if (context == null) return false;

        SharedPreferences preferences = prefs(context);

        if (!preferences.getBoolean(
                KEY_FEATURE_STATE_INITIALIZED,
                false
        )) {
            preferences.edit()
                    .putBoolean(
                            KEY_FEATURE_STATE_INITIALIZED,
                            true
                    )
                    .putBoolean(
                            KEY_FEATURE_ENABLED_LAST_PROCESS,
                            enabled
                    )
                    .apply();
            return false;
        }

        boolean previouslyEnabled =
                preferences.getBoolean(
                        KEY_FEATURE_ENABLED_LAST_PROCESS,
                        enabled
                );

        boolean clearPins =
                enabled && !previouslyEnabled;

        SharedPreferences.Editor editor =
                preferences.edit()
                        .putBoolean(
                                KEY_FEATURE_ENABLED_LAST_PROCESS,
                                enabled
                        );

        if (clearPins) {
            editor.remove(KEY_PINNED)
                    .remove(KEY_PIN_ORDER)
                    .remove(KEY_LIBRARY_PERMUTATION)
                    .remove(KEY_LIBRARY_PERMUTATION_PINS)
                    .remove(KEY_LIBRARY_PERMUTATION_ROW_TYPE)
                    .remove(KEY_LIBRARY_PLAYLIST_SLOTS);
            cachedHasAnyPins = false;
        }

        editor.apply();

        Log.d(TAG, "synchronizeFeatureState"
                + " previousEnabled=" + previouslyEnabled
                + " enabled=" + enabled
                + " clearedPins=" + clearPins);

        return clearPins;
    }

    public static boolean hasAnyPins(Context context) {
        Boolean cached = cachedHasAnyPins;
        if (cached != null) return cached;

        return !getPinnedIds(context).isEmpty();
    }

    public static Set<String> getPinnedIds(Context context) {
        SharedPreferences preferences = prefs(context);
        Set<String> storedValues = preferences.getStringSet(
                KEY_PINNED,
                new HashSet<>()
        );

        HashSet<String> validStored = new HashSet<>();
        boolean removedInvalidValue = false;

        if (storedValues != null) {
            for (String value : storedValues) {
                if (isSupportedPlaylistId(value)) {
                    validStored.add(value);
                } else if (value != null && !value.isEmpty()) {
                    removedInvalidValue = true;
                }
            }
        }

        LinkedHashSet<String> ordered =
                new LinkedHashSet<>();
        String serialized =
                preferences.getString(KEY_PIN_ORDER, "");

        if (serialized != null && !serialized.isEmpty()) {
            String[] values = serialized.split("\n", -1);

            for (String value : values) {
                if (isSupportedPlaylistId(value)
                        && validStored.contains(value)) {
                    ordered.add(value);
                } else if (!value.isEmpty()) {
                    removedInvalidValue = true;
                }
            }
        }

        // Migration for pins created before ordered persistence existed.
        for (String value : validStored) {
            ordered.add(value);
        }

        String cleanedOrder =
                serializeOrder(ordered);

        if (removedInvalidValue
                || !cleanedOrder.equals(serialized)
                || !validStored.equals(storedValues)) {
            preferences.edit()
                    .putStringSet(
                            KEY_PINNED,
                            new HashSet<>(ordered)
                    )
                    .putString(
                            KEY_PIN_ORDER,
                            cleanedOrder
                    )
                    .apply();

            if (removedInvalidValue) {
                Log.d(TAG, "Removed unsupported playlist IDs"
                        + " from persisted pin state");
            }
        }

        cachedHasAnyPins = !ordered.isEmpty();
        return ordered;
    }

    public static boolean isPinned(Context context, String playlistId) {
        if (!isSupportedPlaylistId(playlistId)) {
            return false;
        }
        return getPinnedIds(context).contains(playlistId);
    }

    public static void setPinned(Context context, String playlistId, boolean pinned) {
        if (!isSupportedPlaylistId(playlistId)) {
            Log.d(TAG, "Ignoring unsupported playlist ID");
            return;
        }

        LinkedHashSet<String> updated =
                new LinkedHashSet<>(getPinnedIds(context));

        if (pinned) {
            // Existing pins keep their position; a newly pinned playlist is
            // appended after all playlists pinned earlier.
            updated.add(playlistId);
        } else {
            updated.remove(playlistId);
        }

        prefs(context).edit()
                .putStringSet(KEY_PINNED, new HashSet<>(updated))
                .putString(KEY_PIN_ORDER, serializeOrder(updated))
                .remove(KEY_LIBRARY_PERMUTATION)
                .remove(KEY_LIBRARY_PERMUTATION_PINS)
                .remove(KEY_LIBRARY_PERMUTATION_ROW_TYPE)
                .remove(KEY_LIBRARY_PLAYLIST_SLOTS)
                .apply();

        cachedHasAnyPins = !updated.isEmpty();
    }

    public static void setPlaylistSignature(
            Context context,
            String playlistId,
            String signature
    ) {
        if (context == null
                || !isSupportedPlaylistId(playlistId)
                || signature == null
                || signature.isEmpty()) {
            return;
        }

        SharedPreferences preferences = prefs(context);
        SharedPreferences.Editor editor = preferences.edit();

        /* A visible row signature can identify only one playlist. */
        for (Map.Entry<String, ?> entry :
                preferences.getAll().entrySet()) {
            String key = entry.getKey();
            Object value = entry.getValue();

            if (key != null
                    && key.startsWith(KEY_SIGNATURE_PREFIX)
                    && !key.equals(KEY_SIGNATURE_PREFIX + playlistId)
                    && signature.equals(value)) {
                editor.remove(key);
            }
        }

        editor.putString(
                KEY_SIGNATURE_PREFIX + playlistId,
                signature
        ).apply();
    }

    public static Map<String, String> getPlaylistSignatures(
            Context context
    ) {
        LinkedHashMap<String, String> result =
                new LinkedHashMap<>();

        if (context == null) return result;

        Map<String, ?> all = prefs(context).getAll();

        for (Map.Entry<String, ?> entry : all.entrySet()) {
            String key = entry.getKey();
            Object value = entry.getValue();

            if (key == null
                    || !key.startsWith(KEY_SIGNATURE_PREFIX)
                    || !(value instanceof String)) {
                continue;
            }

            String playlistId =
                    key.substring(KEY_SIGNATURE_PREFIX.length());
            String signature = (String) value;

            if (isSupportedPlaylistId(playlistId)
                    && !signature.isEmpty()) {
                result.put(playlistId, signature);
            }
        }

        return result;
    }

    public static void setLibraryPermutation(
            Context context,
            Set<String> pinOrder,
            int[] permutation,
            String rowType,
            Iterable<Integer> playlistSlots,
            Iterable<Long> nativeStableIds
    ) {
        if (context == null
                || pinOrder == null
                || permutation == null
                || permutation.length == 0
                || rowType == null
                || rowType.isEmpty()
                || playlistSlots == null
                || nativeStableIds == null) {
            return;
        }

        StringBuilder serialized = new StringBuilder();
        for (int value : permutation) {
            if (serialized.length() > 0) serialized.append(',');
            serialized.append(value);
        }

        StringBuilder serializedSlots = new StringBuilder();
        for (Integer value : playlistSlots) {
            if (value == null || value < 0) continue;
            if (serializedSlots.length() > 0) {
                serializedSlots.append(',');
            }
            serializedSlots.append(value);
        }

        String serializedNativeStableIds =
                serializeLongs(nativeStableIds);
        if (serializedNativeStableIds.isEmpty()) return;

        prefs(context).edit()
                .putString(
                        KEY_LIBRARY_PERMUTATION,
                        serialized.toString()
                )
                .putString(
                        KEY_LIBRARY_PERMUTATION_PINS,
                        serializeOrder(pinOrder)
                )
                .putString(
                        KEY_LIBRARY_PERMUTATION_ROW_TYPE,
                        rowType
                )
                .putString(
                        KEY_LIBRARY_PLAYLIST_SLOTS,
                        serializedSlots.toString()
                )
                .putString(
                        KEY_LIBRARY_NATIVE_STABLE_IDS,
                        serializedNativeStableIds
                )
                .apply();
    }

    public static String getLibraryPermutationRowType(Context context) {
        return context == null
                ? ""
                : prefs(context).getString(
                KEY_LIBRARY_PERMUTATION_ROW_TYPE,
                ""
        );
    }

    public static int[] getLibraryPlaylistSlots(Context context) {
        if (context == null) return null;

        String serialized = prefs(context).getString(
                KEY_LIBRARY_PLAYLIST_SLOTS,
                ""
        );
        if (serialized == null || serialized.isEmpty()) return null;

        String[] values = serialized.split(",", -1);
        int[] result = new int[values.length];
        try {
            for (int index = 0; index < values.length; index++) {
                result[index] = Integer.parseInt(values[index]);
            }
        } catch (NumberFormatException ignored) {
            return null;
        }
        return result;
    }

    public static int[] getLibraryPermutation(
            Context context,
            Set<String> pinOrder,
            int expectedSize,
            Iterable<Long> nativeStableIds
    ) {
        if (context == null
                || pinOrder == null
                || expectedSize <= 0
                || nativeStableIds == null) {
            return null;
        }

        SharedPreferences preferences = prefs(context);
        String currentNativeStableIds = serializeLongs(nativeStableIds);
        if (currentNativeStableIds.isEmpty()
                || !currentNativeStableIds.equals(
                preferences.getString(
                        KEY_LIBRARY_NATIVE_STABLE_IDS,
                        ""
                ))) {
            return null;
        }

        if (!serializeOrder(pinOrder).equals(
                preferences.getString(
                        KEY_LIBRARY_PERMUTATION_PINS,
                        ""
                ))) {
            return null;
        }

        String serialized = preferences.getString(
                KEY_LIBRARY_PERMUTATION,
                ""
        );
        if (serialized == null || serialized.isEmpty()) return null;

        String[] values = serialized.split(",", -1);
        if (values.length != expectedSize) return null;

        int[] result = new int[expectedSize];
        boolean[] seen = new boolean[expectedSize];
        try {
            for (int index = 0; index < values.length; index++) {
                int value = Integer.parseInt(values[index]);
                if (value < 0 || value >= expectedSize || seen[value]) {
                    return null;
                }
                seen[value] = true;
                result[index] = value;
            }
        } catch (NumberFormatException ignored) {
            return null;
        }

        return result;
    }

    private static String serializeLongs(Iterable<Long> values) {
        StringBuilder builder = new StringBuilder();

        for (Long value : values) {
            if (value == null) return "";
            if (builder.length() > 0) builder.append(',');
            builder.append(value);
        }

        return builder.toString();
    }

    /** Flips the pinned state for a playlist ID and returns the NEW state. */
    public static boolean togglePinned(
            Context context,
            String playlistId
    ) {
        if (!isSupportedPlaylistId(playlistId)) {
            Log.d(TAG, "togglePinned() ignored unsupported playlist ID");
            return false;
        }

        boolean newState =
                !isPinned(context, playlistId);
        setPinned(
                context,
                playlistId,
                newState
        );
        return newState;
    }

    private static String serializeOrder(Set<String> ordered) {
        StringBuilder builder = new StringBuilder();

        for (String value : ordered) {
            if (value == null || value.isEmpty()) continue;
            if (builder.length() > 0) builder.append('\n');
            builder.append(value);
        }

        return builder.toString();
    }
}
