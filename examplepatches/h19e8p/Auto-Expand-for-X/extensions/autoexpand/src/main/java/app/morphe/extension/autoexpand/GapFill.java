/*
 * Auto Expand for X
 * Copyright (C) 2026 h19e8p
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version. See the LICENSE file.
 */

package app.morphe.extension.autoexpand;

import android.database.Cursor;
import android.os.SystemClock;
import android.util.Log;

import java.lang.ref.WeakReference;
import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * タイムラインを読み込んだ時点で、ギャップ (「ポストをさらに表示」) の中身を取得する。
 * スクロールして行き着く前に、ボタンを押す必要がなくなる。
 *
 * <p>ギャップは、まだ取得していないポストのカーソルを持つ DB の行である。行が一覧の
 * 項目になるのは画面に近づいてからで、それでは遅い。ただ、読み込み処理は裏のスレッドで
 * 全行の種別を一度ずつ読むので、そこでギャップの位置が分かる。一覧に行が渡された時に
 * ギャップの項目だけを組み立て、そのカーソルを一覧自身の取得の経路 (ギャップをタップした
 * 時と同じもの) で要求する。
 *
 * <p>これらの型の名前はアプリの中で難読化されているので、パッチが埋め込む。アプリ自体の
 * ほかには何にも頼らないので、同じアプリにほかのパッチのバンドルと一緒に入れられる。
 */
public final class GapFill {
    private static final String TAG = "AutoExpand";

    /** アプリがギャップの項目にする行の種別。 */
    private static final int GAP_ROW_TYPE = 14;

    /**
     * 1回の要求で入るのは 40 件なので、長いギャップには何回も要る。続けて行うのは
     * この回数までにして、何日も開いていなかったタイムラインが要求をまとめて送らない
     * ようにする。
     */
    private static final int MAX_FETCHES_IN_A_ROW = 5;

    /** しばらく取得が無ければ連続の数え方を終え、次の一覧から数え直す。 */
    private static final long RUN_RESET_MS = 120_000L;

    /**
     * ギャップを埋めると次のギャップが現れるので、何週間ぶりのギャップは何百回も追いかける
     * ことになる。1つの一覧はこの回数で止める。再起動した時など、アプリが一覧を作り直せば
     * 数え直す。
     */
    private static final int MAX_FETCHES_PER_LIST = 30;

    /** 結果が届かない取得は、この時間がたてば次のギャップを待たせない。 */
    private static final long PENDING_TIMEOUT_MS = 20_000L;

    /** 同じカーソルはこの時間内に二度要求しない。失敗し続けるカーソルを繰り返し要求しないため。 */
    private static final long REQUESTED_TTL_MS = 5 * 60_000L;

    private static final int[] NO_GAPS = new int[0];

    /** カーソルごとのギャップの位置。読み込みのスレッドで書き、メインスレッドで読む。 */
    private static final Map<Object, int[]> gapRows = Collections.synchronizedMap(new WeakHashMap<>());
    private static final ThreadLocal<RowScan> scans = new ThreadLocal<>();

    /** 取得中のカーソルの記録はバインダーが持っている。ギャップのスピナーはこれを見て出る。 */
    private static final Set<Object> binders =
            Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));

    // ここから下は、メインスレッドでしか触らない。
    private static final Map<Object, Run> runs = new WeakHashMap<>();
    private static final Map<String, Long> requested = new HashMap<>();
    /**
     * ポストを取り込み終えたカーソル。カーソルがポストを返すのは1回だけで、もう一度要求
     * しても何も返らない。それでもアプリは、ギャップとカーソルを残したままにする。
     */
    private static final Set<String> filled = new HashSet<>();
    private static final Map<Class<?>, Field[]> cursorFields = new HashMap<>();
    private static final Map<Class<?>, Field> channelFields = new HashMap<>();
    private static final Set<String> recordedOnce = new HashSet<>();
    private static Names names;
    private static String unavailable;

    private GapFill() {
    }

    private static final class Names {
        Constructor<?> fetch;
        Class<?> gapItem;
        Field gapItemCursor;
        Field cursorKey;
        Class<?> channel;
        Method emit;
        Field binderChannel;
        Field binderRepository;
        Field repositoryInFlight;
        Constructor<?> inFlightKey;
        Method itemAt;
        Method size;
    }

    private static final class RowScan {
        final WeakReference<Object> cursor;
        int position;
        int[] gaps = NO_GAPS;

        RowScan(Object cursor) {
            this.cursor = new WeakReference<>(cursor);
        }
    }

    /** 1つの一覧に対して続けて行った取得。 */
    private static final class Run {
        int fetches;
        int total;
        long lastFetchAt;
        String pendingKey;
        boolean limitRecorded;
        boolean stopped;
        /** 前回の一覧の様子。変わった時だけ記録するため。 */
        String lastState;
        /** 最後に取得したカーソルと、その時の行数。何か入ったかを見分けるため。 */
        String lastFetchKey;
        int rowsAtFetch = -1;
    }

    // パッチがアプリの中の名前に置き換える仮の文字列。R8 は定数どうしの比較を畳み込んで
    // しまうので、名前として使うだけで、比較には使わない。

    private static String fetchClassName() {
        return "autoexpand:gap:fetchClass";
    }

    private static String cursorClassName() {
        return "autoexpand:gap:cursorClass";
    }

    private static String gapItemClassName() {
        return "autoexpand:gap:gapItemClass";
    }

    private static String gapItemCursorFieldName() {
        return "autoexpand:gap:gapItemCursorField";
    }

    private static String cursorKeyFieldName() {
        return "autoexpand:gap:cursorKeyField";
    }

    private static String channelClassName() {
        return "autoexpand:gap:channelClass";
    }

    private static String emitClassName() {
        return "autoexpand:gap:emitClass";
    }

    private static String emitMethodName() {
        return "autoexpand:gap:emitMethod";
    }

    private static String binderClassName() {
        return "autoexpand:gap:binderClass";
    }

    private static String binderChannelFieldName() {
        return "autoexpand:gap:binderChannelField";
    }

    private static String binderRepositoryFieldName() {
        return "autoexpand:gap:binderRepositoryField";
    }

    private static String repositoryClassName() {
        return "autoexpand:gap:repositoryClass";
    }

    private static String repositoryInFlightFieldName() {
        return "autoexpand:gap:repositoryInFlightField";
    }

    private static String inFlightKeyClassName() {
        return "autoexpand:gap:inFlightKeyClass";
    }

    private static String itemsClassName() {
        return "autoexpand:gap:itemsClass";
    }

    private static String itemAtMethodName() {
        return "autoexpand:gap:itemAtMethod";
    }

    private static String sizeMethodName() {
        return "autoexpand:gap:sizeMethod";
    }

    /**
     * 読み込み処理がタイムラインのカーソルの行を読み始めた時に呼ばれる。
     */
    public static void onRowsStart(Object cursor) {
        try {
            scans.set(new RowScan(cursor));
            // 読み直したカーソルは、前に報告したギャップを忘れる。
            gapRows.put(cursor, NO_GAPS);
        } catch (Throwable ex) {
            scans.remove();
        }
    }

    /**
     * 読み込み処理が行を読むたびに、その行の種別が行の順に渡される。すべてのタイムラインの
     * 読み込みのすべての行で動くので、できるだけ何もしない。
     */
    public static void onRowType(int type) {
        RowScan scan = scans.get();
        if (scan == null) return;
        // 位置は読み返さずに数えているので、すべての行がここを通る必要がある。
        int position = scan.position++;
        if (type != GAP_ROW_TYPE) return;
        Object cursor = scan.cursor.get();
        if (cursor == null) return;
        int[] gaps = Arrays.copyOf(scan.gaps, scan.gaps.length + 1);
        gaps[gaps.length - 1] = position;
        scan.gaps = gaps;
        gapRows.put(cursor, gaps);
    }

    /**
     * ギャップのバインダーが作られた時に呼ばれる。
     */
    public static void onBinderCreated(Object binder) {
        if (binder != null) binders.add(binder);
    }

    /**
     * 一覧に新しい項目が渡されるたびに、メインスレッドで呼ばれる。
     */
    public static void onItems(Object list, Object items) {
        try {
            if (list == null || items == null || AutoExpandCursor.tapOnly()) return;
            int[] gaps = gapsOf(items);
            // フックした読み込み処理が読んだタイムラインではない。
            if (gaps == null) return;
            recordOnce("watching:" + list.getClass().getName(), "fill watching " + list.getClass().getName());
            if (gaps.length == 0) return;

            Names n = names();
            if (n != null) fill(n, list, items, gaps);
        } catch (Throwable ex) {
            AutoExpandCursor.record("fill failed: " + ex);
            Log.e(TAG, "GapFill: fill failed", ex);
        }
    }

    /**
     * 起動時のログ用。名前を解決できない版なら、ギャップが出るのを待たずにすぐ分かる。
     */
    static String status() {
        if (AutoExpandCursor.tapOnly()) return "tap only";
        return names() != null ? "ready" : "unavailable";
    }

    /**
     * ギャップをここで取得するか (アプリの名前を解決できている必要がある)、タップに任せるか。
     * 最初の取得を待たずにここで名前を解決するので、どの画面で先にギャップが出たかによって
     * 答えが変わることはない。
     */
    static boolean isReady() {
        return !AutoExpandCursor.tapOnly() && names() != null;
    }

    private static void fill(Names n, Object list, Object items, int[] gaps) throws ReflectiveOperationException {
        int size = (Integer) n.size.invoke(items);
        List<Object> cursors = new ArrayList<>(gaps.length);
        List<String> keys = new ArrayList<>(gaps.length);
        for (int position : gaps) {
            if (position >= size) continue;
            Object item = n.itemAt.invoke(items, position);
            if (!n.gapItem.isInstance(item)) {
                // 位置は行を数えて出しているので、合わないのはこの版で数え方がずれているということ。
                recordOnce("mismatch", "fill skipped: row " + position + " is "
                        + (item == null ? "null" : item.getClass().getName()));
                continue;
            }
            Object cursor = n.gapItemCursor.get(item);
            Object key = cursor == null ? null : n.cursorKey.get(cursor);
            if (!(key instanceof String)) continue;
            cursors.add(cursor);
            keys.add((String) key);
        }
        if (keys.isEmpty()) return;

        long now = SystemClock.uptimeMillis();
        Run run = runs.get(list);
        if (run == null) {
            run = new Run();
            runs.put(list, run);
        }
        if (now - run.lastFetchAt > RUN_RESET_MS) {
            run.fetches = 0;
            run.limitRecorded = false;
        }

        // 取得で実際にポストが入ったかは行数の変化に表れるので、変わるたびに様子を記録する。
        String state = "rows=" + size + " gaps=" + Arrays.toString(gaps) + " keys=" + shortKeys(keys);
        if (!state.equals(run.lastState)) {
            AutoExpandCursor.record("fill check " + state);
            run.lastState = state;
        }

        // 行が増えたのは、前回の取得が届いたということ。そのカーソルはもう一度要求しても
        // 何も返らないので使い終わりとし、すぐに次のギャップへ進める。
        if (run.lastFetchKey != null && run.rowsAtFetch >= 0 && size > run.rowsAtFetch) {
            AutoExpandCursor.record("fill progress rows " + run.rowsAtFetch + " -> " + size
                    + " key=" + shortKey(run.lastFetchKey));
            filled.add(run.lastFetchKey);
            run.pendingKey = null;
            run.lastFetchKey = null;
            run.rowsAtFetch = -1;
        }

        // 取得は1つずつ行う。届くと一覧がまた渡されるので、次のギャップはその時に取る。
        if (run.pendingKey != null) {
            if (keys.contains(run.pendingKey) && now - run.lastFetchAt < PENDING_TIMEOUT_MS) return;
            // 届いたのに何も変わらなかったので、そのカーソルは終わり。
            if (run.rowsAtFetch >= 0 && size <= run.rowsAtFetch) {
                AutoExpandCursor.record("fill no progress key=" + shortKey(run.pendingKey) + " rows=" + size);
                run.lastFetchKey = null;
                run.rowsAtFetch = -1;
            }
            run.pendingKey = null;
        }

        forgetOldRequests(now);
        int next = -1;
        for (int i = 0; i < keys.size(); i++) {
            String key = keys.get(i);
            if (!requested.containsKey(key) && !filled.contains(key)) {
                next = i;
                break;
            }
        }
        if (next < 0) return;

        if (run.total >= MAX_FETCHES_PER_LIST) {
            if (!run.stopped) {
                AutoExpandCursor.record("fill stopped for this list after " + run.total + " fetches");
                run.stopped = true;
            }
            return;
        }
        if (run.fetches >= MAX_FETCHES_IN_A_ROW) {
            if (!run.limitRecorded) {
                AutoExpandCursor.record("fill paused after " + MAX_FETCHES_IN_A_ROW + " fetches, "
                        + keys.size() + " gap(s) left");
                run.limitRecorded = true;
            }
            return;
        }

        Object channel = channelOf(n, list);
        if (channel == null) {
            recordOnce("channel:" + list.getClass().getName(),
                    "fill skipped: no fetch channel on " + list.getClass().getName());
            return;
        }

        String key = keys.get(next);
        n.emit.invoke(channel, n.fetch.newInstance(cursors.get(next)));
        boolean spinner = markInFlight(n, channel, key);

        run.fetches++;
        run.total++;
        run.lastFetchAt = now;
        run.pendingKey = key;
        run.lastFetchKey = key;
        run.rowsAtFetch = size;
        requested.put(key, now);

        AutoExpandCursor.record("fill requested gap " + (next + 1) + "/" + keys.size()
                + " (" + run.fetches + "/" + MAX_FETCHES_IN_A_ROW + ", " + run.total + " total) key=" + shortKey(key)
                + " spinner=" + spinner + " list=" + list.getClass().getName());
        // 毎回同じ文言にして、続けて取得した時にトーストが並ばず、1つにまとまるようにする。
        AutoExpandCursor.toast("非表示のポストを裏で取得しました", "Loaded hidden posts in the background");
    }

    /**
     * これらの項目の元になったカーソルについて報告されたギャップの位置。フックした
     * 読み込み処理が読んでいないカーソルなら null。
     */
    private static int[] gapsOf(Object items) throws IllegalAccessException {
        for (Field field : cursorFieldsOf(items.getClass())) {
            Object cursor = field.get(items);
            if (cursor == null) continue;
            int[] gaps = gapRows.get(cursor);
            if (gaps != null) return gaps;
        }
        return null;
    }

    private static Field[] cursorFieldsOf(Class<?> type) {
        Field[] fields = cursorFields.get(type);
        if (fields != null) return fields;

        List<Field> found = new ArrayList<>();
        for (Class<?> c = type; c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field field : c.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                if (Cursor.class.isAssignableFrom(field.getType())) found.add(accessible(field));
            }
        }
        fields = found.toArray(new Field[0]);
        cursorFields.put(type, fields);
        return fields;
    }

    private static Object channelOf(Names n, Object list) throws IllegalAccessException {
        Class<?> type = list.getClass();
        Field field;
        if (channelFields.containsKey(type)) {
            field = channelFields.get(type);
        } else {
            field = null;
            for (Class<?> c = type; c != null && field == null; c = c.getSuperclass()) {
                for (Field candidate : c.getDeclaredFields()) {
                    if (!Modifier.isStatic(candidate.getModifiers()) && candidate.getType() == n.channel) {
                        field = accessible(candidate);
                        break;
                    }
                }
            }
            channelFields.put(type, field);
        }
        return field == null ? null : field.get(list);
    }

    /**
     * タップした時と同じように、カーソルを取得中として記録する。取得中にギャップまで
     * スクロールするとスピナーが出て、そこをタップしても二重には要求しない。
     */
    private static boolean markInFlight(Names n, Object channel, String key) {
        try {
            synchronized (binders) {
                for (Object binder : binders) {
                    if (n.binderChannel.get(binder) != channel) continue;
                    Object repository = n.binderRepository.get(binder);
                    if (repository == null) continue;
                    @SuppressWarnings("unchecked")
                    Set<Object> inFlight = (Set<Object>) n.repositoryInFlight.get(repository);
                    if (inFlight == null) continue;
                    inFlight.add(n.inFlightKey.newInstance(key));
                    return true;
                }
            }
        } catch (Throwable ex) {
            Log.e(TAG, "GapFill: could not mark the fetch", ex);
        }
        return false;
    }

    /** カーソルは長く、中身を読んでも意味が無いので、短い代わりの値で記録する。 */
    private static String shortKey(String key) {
        return Integer.toHexString(key.hashCode());
    }

    private static String shortKeys(List<String> keys) {
        StringBuilder text = new StringBuilder();
        for (String key : keys) {
            if (text.length() > 0) text.append(',');
            text.append(shortKey(key));
        }
        return text.toString();
    }

    private static void forgetOldRequests(long now) {
        Iterator<Long> times = requested.values().iterator();
        while (times.hasNext()) {
            if (now - times.next() > REQUESTED_TTL_MS) times.remove();
        }
    }

    private static Names names() {
        if (names != null || unavailable != null) return names;
        try {
            ClassLoader loader = GapFill.class.getClassLoader();
            Names n = new Names();

            Class<?> cursor = Class.forName(cursorClassName(), false, loader);
            n.fetch = accessible(Class.forName(fetchClassName(), false, loader).getDeclaredConstructor(cursor));
            n.gapItem = Class.forName(gapItemClassName(), false, loader);
            n.gapItemCursor = accessible(n.gapItem.getDeclaredField(gapItemCursorFieldName()));
            n.cursorKey = accessible(cursor.getDeclaredField(cursorKeyFieldName()));

            n.channel = Class.forName(channelClassName(), false, loader);
            n.emit = Class.forName(emitClassName(), false, loader).getMethod(emitMethodName(), Object.class);

            Class<?> binder = Class.forName(binderClassName(), false, loader);
            n.binderChannel = accessible(binder.getDeclaredField(binderChannelFieldName()));
            n.binderRepository = accessible(binder.getDeclaredField(binderRepositoryFieldName()));
            Class<?> repository = Class.forName(repositoryClassName(), false, loader);
            n.repositoryInFlight = accessible(repository.getDeclaredField(repositoryInFlightFieldName()));
            n.inFlightKey = accessible(
                    Class.forName(inFlightKeyClassName(), false, loader).getDeclaredConstructor(String.class));

            Class<?> items = Class.forName(itemsClassName(), false, loader);
            n.itemAt = accessible(items.getDeclaredMethod(itemAtMethodName(), int.class));
            n.size = accessible(items.getDeclaredMethod(sizeMethodName()));

            names = n;
        } catch (Throwable ex) {
            // 置き換えられなかった仮の文字列も、存在しないクラスやメンバーとしてここに来る。
            unavailable = String.valueOf(ex);
            AutoExpandCursor.record("fill unavailable: " + ex);
            Log.e(TAG, "GapFill: names unavailable", ex);
            AutoExpandCursor.toast(
                    "この版の X では裏の取得が使えないため、ボタンを自動でタップします",
                    "Background loading is not available on this version of X, so the button is tapped instead");
        }
        return names;
    }

    private static <T extends AccessibleObject> T accessible(T member) {
        member.setAccessible(true);
        return member;
    }

    private static void recordOnce(String key, String message) {
        if (recordedOnce.add(key)) AutoExpandCursor.record(message);
    }
}
