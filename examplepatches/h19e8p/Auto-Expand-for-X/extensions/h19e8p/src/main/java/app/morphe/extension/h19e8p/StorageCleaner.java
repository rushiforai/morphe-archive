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
import android.webkit.WebStorage;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * 新しい X の「すべてのストレージを削除」と同じく、キャッシュした画像や動画、通信のデータ、
 * ウェブのデータを消す。ログインや設定、下書き (アプリのデータベースと shared_prefs) は消さない。
 */
public final class StorageCleaner {
    private StorageCleaner() {
    }

    /** 消す対象のフォルダ。 */
    private static List<File> targets(Context context) {
        List<File> dirs = new ArrayList<>();
        dirs.add(context.getCacheDir());
        File external = context.getExternalCacheDir();
        if (external != null) dirs.add(external);
        // WebView のキャッシュ。WebView の保存データ (localStorage など) は WebStorage で消す。Cookie は消さない。
        File webCache = new File(context.getDataDir(), "app_webview/Default/HTTP Cache");
        if (webCache.exists()) dirs.add(webCache);
        return dirs;
    }

    /** 消す対象の合計の大きさ (バイト)。 */
    public static long size(Context context) {
        long total = 0;
        for (File dir : targets(context)) total += sizeOf(dir);
        return total;
    }

    /** 中身を消す。フォルダそのものは残す。裏のスレッドで呼ぶ (少し待つため)。 */
    public static void clear(Context context) {
        for (File dir : targets(context)) clearContents(dir);
        try {
            WebStorage.getInstance().deleteAllData();
            // deleteAllData は WebView の中で後から消す。直後に X を終了すると消え切らないので、少し待つ。
            Thread.sleep(1000);
        } catch (Throwable ignored) {
            // WebView がまだ使われていない時など。
        }
    }

    public static String format(long bytes) {
        if (bytes >= 1024L * 1024 * 1024) return String.format(Locale.US, "%.1f GB", bytes / 1024.0 / 1024 / 1024);
        if (bytes >= 1024L * 1024) return String.format(Locale.US, "%.1f MB", bytes / 1024.0 / 1024);
        return String.format(Locale.US, "%.0f KB", bytes / 1024.0);
    }

    private static long sizeOf(File file) {
        if (file == null || !file.exists()) return 0;
        if (file.isFile()) return file.length();
        long total = 0;
        File[] children = file.listFiles();
        if (children != null) for (File child : children) total += sizeOf(child);
        return total;
    }

    private static void clearContents(File dir) {
        File[] children = dir == null ? null : dir.listFiles();
        if (children == null) return;
        for (File child : children) delete(child);
    }

    private static void delete(File file) {
        File[] children = file.listFiles();
        if (children != null) for (File child : children) delete(child);
        file.delete();
    }
}
