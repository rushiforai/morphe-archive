package dev.rikunode.settings;

import android.content.Context;
import android.content.Intent;
import android.util.Log;

/** Uses the Preference API retained in Hatena Bookmark 5.80. */
public final class HoshioriSettingsBridge {
    private static final String TAG = "HoshioriSettings";
    private HoshioriSettingsBridge() {}

    public static void attach(Object fragment) {
        try {
            Context context = (Context) fragment.getClass().getMethod("requireContext").invoke(fragment);
            Class<?> preference = Class.forName("androidx.preference.Preference");
            Object row = preference.getConstructor(Context.class).newInstance(context);
            // R8 removed Preference.setKey(String) in the target APK.
            // This non-persistent navigation row needs no preference key.
            preference.getMethod("setTitle", CharSequence.class).invoke(row, "Hoshiori");
            preference.getMethod("setSummary", CharSequence.class).invoke(row, "非公式パッチの設定");
            preference.getMethod("setIntent", Intent.class).invoke(row,
                    new Intent(context, HoshioriSettingsActivity.class));
            // The stock application category has key "category_application".
            Object category = fragment.getClass().getMethod("findPreference", CharSequence.class)
                    .invoke(fragment, "category_application");
            Class<?> group = Class.forName("androidx.preference.PreferenceGroup");
            if (!group.isInstance(category)) {
                Log.e(TAG, "Application preference category is unavailable");
                return;
            }
            // The original XML uses app:iconSpaceReserved="false" on all its rows.
            java.lang.reflect.Field iconSpace = preference.getDeclaredField("mIconSpaceReserved");
            iconSpace.setAccessible(true);
            iconSpace.setBoolean(row, false);
            if (!Boolean.TRUE.equals(group.getMethod("addPreference", preference).invoke(category, row))) {
                Log.e(TAG, "Application category rejected Hoshiori entry");
                return;
            }
            Log.i(TAG, "Hoshiori preference added");
        } catch (ReflectiveOperationException | RuntimeException failure) {
            Log.e(TAG, "Could not add Hoshiori preference", failure);
        }
    }
}
