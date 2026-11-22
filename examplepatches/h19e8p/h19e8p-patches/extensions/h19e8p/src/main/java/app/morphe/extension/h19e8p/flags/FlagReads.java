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

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * X がフラグ (真偽値) を読むたびに、その名前と、X に返した値を受け取る。
 *
 * <p>パッチは X のフラグを読む処理の入口で {@link #onReadStart} を、値を返す直前で
 * {@link #onReadValue} を呼ぶ。返す直前の値なので、piko がフラグを書き換えていれば、
 * 書き換えた後の値になる。どちらもすべてのフラグの読み取りで動くので、できるだけ何もしない。
 */
public final class FlagReads {
    /** 覚えておくフラグの数の上限。X のフラグは数千なので、ふつうは届かない。 */
    private static final int MAX_FLAGS = 20_000;

    private static final ThreadLocal<String> reading = new ThreadLocal<>();
    /** 読まれたフラグと、最後に返した値。読まれた順に並ぶ。 */
    private static final Map<String, Boolean> values = new LinkedHashMap<>();
    /** 記録中に読まれたフラグと、その値。最初に読まれた順に並ぶ。 */
    private static final Map<String, Boolean> recorded = new LinkedHashMap<>();
    private static volatile boolean recording;

    private FlagReads() {
    }

    /** パッチが当たっているか。設定画面が項目を出すかどうかに使う。パッチが "true" に置き換える。 */
    private static String appliedMark() {
        return "flags:info:applied";
    }

    public static boolean isApplied() {
        return Boolean.parseBoolean(appliedMark());
    }

    /** 差し込み口: フラグを読む処理の入口。 */
    public static void onReadStart(String flag) {
        reading.set(flag);
    }

    /** 差し込み口: フラグを読む処理が値を返す直前。返す値はそのまま返す。 */
    public static boolean onReadValue(boolean value) {
        try {
            String flag = reading.get();
            if (flag == null) return value;
            reading.remove();
            synchronized (values) {
                if (values.size() < MAX_FLAGS || values.containsKey(flag)) values.put(flag, value);
                if (recording && !recorded.containsKey(flag)) recorded.put(flag, value);
            }
        } catch (Throwable ignored) {
            // X のフラグの読み取りを止めないよう、何があっても値はそのまま返す。
        }
        return value;
    }

    /** 最後に返した値。まだ読まれていなければ null。 */
    public static Boolean valueOf(String flag) {
        synchronized (values) {
            return values.get(flag);
        }
    }

    /** これまでに読まれたフラグの名前。 */
    public static List<String> known() {
        synchronized (values) {
            return new ArrayList<>(values.keySet());
        }
    }

    public static void startRecording() {
        synchronized (values) {
            recorded.clear();
        }
        recording = true;
    }

    public static void stopRecording() {
        recording = false;
    }

    public static int recordedCount() {
        synchronized (values) {
            return recorded.size();
        }
    }

    /** 記録中に読まれたフラグと、その時の値。 */
    public static Map<String, Boolean> recorded() {
        synchronized (values) {
            return new LinkedHashMap<>(recorded);
        }
    }

    /** 名前の一覧に対する、今の値。 */
    public static Map<String, Boolean> valuesOf(List<String> flags) {
        Map<String, Boolean> out = new HashMap<>();
        synchronized (values) {
            for (String flag : flags) out.put(flag, values.get(flag));
        }
        return out;
    }
}
