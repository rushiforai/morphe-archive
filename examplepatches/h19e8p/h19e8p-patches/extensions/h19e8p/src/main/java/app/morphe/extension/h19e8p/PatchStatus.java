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

import java.util.ArrayList;
import java.util.List;

/**
 * 当てたパッチと、h19e8p Patches の版。設定画面の「情報」に出す。
 *
 * <p>各メソッドの文字 ("status:...") は、パッチを当てる時にパッチが本当の値に置き換える。
 * 当たっていないパッチの分は置き換えられないので、当たっていないと分かる。
 */
public final class PatchStatus {
    private PatchStatus() {
    }

    /** 1つのパッチ: 表示する名前と、当たっているか。 */
    public static final class Item {
        public final String name;
        public final boolean applied;

        Item(String name, boolean applied) {
            this.name = name;
            this.applied = applied;
        }
    }

    /** h19e8p Patches の版。設定のパッチが置き換える。 */
    private static String versionMark() {
        return "status:version";
    }

    public static String version() {
        String version = versionMark();
        return version.startsWith("status:") ? "?" : version;
    }

    /** アプリ (X) のバージョン。 */
    public static String appVersion(Context context) {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
        } catch (Throwable ex) {
            return "?";
        }
    }

    // パッチごとの印。パッチが当たると "true" になる。
    private static String autoExpand() { return "status:autoExpand"; }
    private static String flagTools() { return "status:flagTools"; }
    private static String composerUndo() { return "status:composerUndo"; }

    /** すべてのパッチと、当たっているか。 */
    public static List<Item> items() {
        List<Item> items = new ArrayList<>();
        items.add(new Item(Text.of("「ポストをさらに表示」を自動で開く", "Auto expand hidden posts"), applied(autoExpand())));
        items.add(new Item(Text.of("投稿画面の元に戻す・やり直す", "Undo and redo in the composer"), applied(composerUndo())));
        items.add(new Item(Text.of("フラグを探す道具", "Feature flag tools"), applied(flagTools())));
        return items;
    }

    private static boolean applied(String mark) {
        return "true".equals(mark);
    }
}
