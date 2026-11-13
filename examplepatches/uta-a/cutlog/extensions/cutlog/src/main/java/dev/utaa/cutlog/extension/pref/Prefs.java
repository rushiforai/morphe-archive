package dev.utaa.cutlog.extension.pref;

import android.content.Context;
import android.content.SharedPreferences;
import dev.utaa.cutlog.extension.editor.FilterPreset;

/** cutlog 専用の設定。setlog 本体の設定ファイルとは分ける。 */
public final class Prefs {
    private static final String FILE = "cutlog";
    private static final String LAST_FILTER = "last_filter";
    private static final String RECORD_SECONDS = "record_seconds";
    private static final String FEATURE_PREFIX = "feature_";

    /** 撮影する長さの選択肢（秒）。先頭は公式と同じ長さ。 */
    public static final int[] RECORD_SECONDS_CHOICES = {2, 3, 5, 10, 15};

    private Prefs() {}

    public static FilterPreset lastFilter(Context context) {
        String name = prefs(context).getString(LAST_FILTER, FilterPreset.NONE.name());
        try {
            return FilterPreset.valueOf(name);
        } catch (IllegalArgumentException e) {
            return FilterPreset.NONE;
        }
    }

    public static void setLastFilter(Context context, FilterPreset filter) {
        prefs(context).edit().putString(LAST_FILTER, filter.name()).apply();
    }

    public static int recordSeconds(Context context) {
        int seconds = prefs(context).getInt(RECORD_SECONDS, RECORD_SECONDS_CHOICES[0]);
        for (int choice : RECORD_SECONDS_CHOICES) {
            if (choice == seconds) {
                return seconds;
            }
        }
        return RECORD_SECONDS_CHOICES[0];
    }

    public static void setRecordSeconds(Context context, int seconds) {
        prefs(context).edit().putInt(RECORD_SECONDS, seconds).apply();
    }

    /** 機能の ON/OFF。初期値はすべて ON（パッチを当てた時点で使うつもりの機能のため）。 */
    public static boolean isEnabled(Context context, Feature feature) {
        return prefs(context).getBoolean(FEATURE_PREFIX + feature.key, true);
    }

    public static void setEnabled(Context context, Feature feature, boolean enabled) {
        prefs(context).edit().putBoolean(FEATURE_PREFIX + feature.key, enabled).apply();
    }

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(FILE, Context.MODE_PRIVATE);
    }
}
