/*
 * h19e8p Patches
 * Copyright (C) 2026 h19e8p
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version. See the LICENSE file.
 */

package app.morphe.extension.h19e8p;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * アプリの中の設定画面で変えた値を保存する。
 *
 * <p>設定画面で一度でも変えた項目だけがここに保存される。保存がなければ、各機能の初期値を使う。
 * 「初期値に戻す」で保存した値を消すと、また初期値に従う。
 */
public final class Prefs {
    /** X のアプリの中の shared_prefs/h19e8p_settings.xml に保存する。 */
    public static final String FILE = "h19e8p_settings";

    private static Context appContext;

    private Prefs() {
    }

    /** 起動時に一度だけ呼ぶ。設定画面からも呼ぶ (先に開かれた時のため)。 */
    public static void init(Context context) {
        if (appContext == null && context != null) appContext = context.getApplicationContext();
    }

    /** アプリ本体の Context。まだ分からなければ null。 */
    public static Context context() {
        return appContext;
    }

    private static SharedPreferences prefs() {
        Context context = appContext;
        return context == null ? null : context.getSharedPreferences(FILE, Context.MODE_PRIVATE);
    }

    /** 保存した値があればそれを、なければ初期値 (fallback) を返す。 */
    public static boolean bool(String key, boolean fallback) {
        try {
            SharedPreferences prefs = prefs();
            return prefs == null ? fallback : prefs.getBoolean(key, fallback);
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    public static void setBool(String key, boolean value) {
        SharedPreferences prefs = prefs();
        if (prefs != null) prefs.edit().putBoolean(key, value).apply();
    }

    /** 設定画面で変えた値をすべて消し、初期値に戻す。 */
    public static void clear() {
        SharedPreferences prefs = prefs();
        if (prefs != null) prefs.edit().clear().apply();
    }
}
