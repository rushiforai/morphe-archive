/*
 * h19e8p Patches
 * Copyright (C) 2026 h19e8p
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version. See the LICENSE file.
 */

package app.morphe.extension.h19e8p.flags;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * piko のフラグの一覧を読み書きする。
 *
 * <p>piko は一覧を、X のアプリの中の shared_prefs/piko_settings.xml の misc_feature_flags に
 * 「名前:true,名前:false,」の形で保存し、X の起動時に読み込む。そのため、ここで追加した
 * フラグは X を再起動すると効く。piko の保存の形が変わるとここも直す必要がある。
 */
public final class PikoFlags {
    private static final String PIKO_PREFS = "piko_settings";
    private static final String KEY_FLAGS = "misc_feature_flags";
    /** piko が覚えている、X が読んだフラグの名前の一覧 (候補探しに使う)。 */
    private static final String KEY_FLAGS_SEARCH = "misc_feature_flags_search";
    /**
     * piko の設定の状態。piko は X の起動時に load() を呼び、「Hook feature flag」が当たっていれば
     * その中で featureFlagsEnabled を true にする。piko の拡張は、ほかのパッチだけを当てた時も
     * 丸ごと入るので、クラスがあるかどうかでは判定できない。
     */
    private static final String PIKO_SETTINGS_STATUS = "app.morphe.extension.twitter.settings.SettingsStatus";
    private static final String PIKO_FLAGS_ENABLED = "featureFlagsEnabled";

    private PikoFlags() {
    }

    /** piko の「Hook feature flag」が当たっているか。 */
    public static boolean available() {
        try {
            Class<?> status = Class.forName(PIKO_SETTINGS_STATUS, true, PikoFlags.class.getClassLoader());
            return status.getField(PIKO_FLAGS_ENABLED).getBoolean(null);
        } catch (Throwable ex) {
            return false;
        }
    }

    private static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PIKO_PREFS, Context.MODE_PRIVATE);
    }

    /** piko の一覧にあるフラグと、その値。 */
    public static Map<String, Boolean> read(Context context) {
        Map<String, Boolean> flags = new LinkedHashMap<>();
        String saved = prefs(context).getString(KEY_FLAGS, "");
        if (saved == null) return flags;
        for (String item : saved.split(",")) {
            int colon = item.lastIndexOf(':');
            if (colon <= 0) continue;
            flags.put(item.substring(0, colon), Boolean.valueOf(item.substring(colon + 1)));
        }
        return flags;
    }

    /**
     * フラグを piko の一覧に入れる。既にあるものは値を書き換える。
     *
     * @return 新しく入れた数と、値を書き換えた数。
     */
    public static int[] put(Context context, Collection<String> names, boolean value) {
        Map<String, Boolean> flags = read(context);
        int added = 0;
        int changed = 0;
        for (String name : names) {
            Boolean old = flags.get(name);
            if (old == null) {
                added++;
            } else if (old != value) {
                changed++;
            }
            flags.put(name, value);
        }
        StringBuilder out = new StringBuilder();
        for (Map.Entry<String, Boolean> entry : flags.entrySet()) {
            out.append(entry.getKey()).append(':').append(entry.getValue()).append(',');
        }
        prefs(context).edit().putString(KEY_FLAGS, out.toString()).apply();
        return new int[]{added, changed};
    }

    /** piko が覚えている、X が読んだフラグの名前。 */
    public static List<String> searchList(Context context) {
        List<String> names = new ArrayList<>();
        String saved = prefs(context).getString(KEY_FLAGS_SEARCH, "");
        if (saved == null) return names;
        for (String name : saved.split(",")) {
            if (!name.isEmpty()) names.add(name);
        }
        return names;
    }
}
