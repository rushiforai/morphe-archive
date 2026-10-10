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

import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.os.Handler;
import android.os.Looper;
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
import java.util.LinkedHashSet;
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
 * 項目1つにつき1回、その先頭の行の種別を読むので、そこでギャップの位置 (何番目の項目か)
 * が分かる。一覧に行が渡された時に
 * ギャップの項目だけを組み立て、そのカーソルを一覧自身の取得の経路 (ギャップをタップした
 * 時と同じもの) で要求する。
 *
 * <p>取得の結果はカーソルごとに覚え、{@link AutoExpandCursor} はそれを見て、行を畳むか
 * 自動でタップするかを決める。上限に達して取得しなかったギャップや、この取得が働かない
 * 画面のギャップ、取得しても何も入らなかったギャップは、画面に来た時に自動タップが拾う。
 *
 * <p>カーソルがポストを返すのは1回だけだが、アプリはギャップとカーソルを残したままにする。
 * 使い終わったカーソルはアプリの設定ファイルに保存し、アプリを起動し直した後も、要求も
 * タップもしない。
 *
 * <p>これらの型の名前はアプリの中で難読化されているので、パッチが埋め込む。アプリ自体の
 * ほかには何にも頼らないので、同じアプリにほかのパッチのバンドルと一緒に入れられる。
 */
public final class GapFill {
    private static final String TAG = "AutoExpand";

    /** アプリがギャップの項目にする行の種別。 */
    private static final int GAP_ROW_TYPE = 14;

    // ギャップのカーソルの状態。AutoExpandCursor が、行を畳むかタップするかを決めるのに使う。

    /** この取得が扱っていない。 */
    static final int GAP_NEW = 0;
    /** この取得が要求し、結果を待っている。 */
    static final int GAP_FETCHING = 1;
    /** この取得が要求したが、何も入らなかった。 */
    static final int GAP_EMPTY = 2;
    /** 使い終わった。ポストが入ったか、タップしても何も入らなかった。 */
    static final int GAP_USED = 3;

    /**
     * ギャップを埋めると次のギャップが現れるので、何週間ぶりのギャップは何百回も追いかける
     * ことになる。1つの一覧はこの回数で止める。再起動した時など、アプリが一覧を作り直せば
     * 数え直す。要求をまとめて送らないための1分あたりの上限は、自動タップと分け合う
     * ({@link AutoExpandCursor#requestWaitMs})。
     */
    private static final int MAX_FETCHES_PER_LIST = 30;

    /** 結果が届かない取得は、この時間がたてば、何も入らなかったものとして自動タップに回す。 */
    private static final long PENDING_TIMEOUT_MS = 20_000L;

    /** 使い終わったカーソルを保存する、アプリの設定ファイル (shared_prefs/autoexpand.xml) とその項目。 */
    private static final String PREFS_NAME = "autoexpand";
    private static final String PREF_USED_KEYS = "usedKeys";
    /** 保存するのは、最近使い終わったこの件数まで。 */
    private static final int MAX_USED_KEYS = 500;

    private static final int[] NO_GAPS = new int[0];

    /**
     * ポストの詳細 (返信の画面) の一覧。ここのギャップは返信の続きで、読み込むとギャップの行が
     * 消え、そこに返信が入る。タイムラインのギャップは、読み込んだ後も行が残る。
     */
    private static final String POST_DETAILS_PACKAGE = "com.twitter.tweetdetail.";

    /**
     * 一覧の画面の名前。クラスの名前はアプリの中で短く変えられているが、パッケージの名前は
     * 残っているので、それで見分ける。パッケージ、短い名前、[Screen] の行に書く名前の順。
     */
    private static final String[][] SCREENS = {
            { "com.twitter.app.home.", "Home", "the Home timeline" },
            { "com.twitter.channels.", "List", "a List timeline" },
            { "com.twitter.app.profiles.", "Profile", "a Profile timeline" },
            { POST_DETAILS_PACKAGE, "Post details", "Post details" },
            { "com.twitter.android.search.", "Search", "Search results" },
            { "com.twitter.android.explore.", "Explore", "Explore" },
            { "com.twitter.communities.", "Communities", "Communities" },
    };

    private static final Handler main = new Handler(Looper.getMainLooper());

    /** カーソルごとのギャップの位置。読み込みのスレッドで書き、メインスレッドで読む。 */
    private static final Map<Object, int[]> gapRows = Collections.synchronizedMap(new WeakHashMap<>());
    private static final ThreadLocal<RowScan> scans = new ThreadLocal<>();

    /** 取得中のカーソルの記録はバインダーが持っている。ギャップのスピナーはこれを見て出る。 */
    private static final Set<Object> binders =
            Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));

    // ここから下は、メインスレッドでしか触らない。
    private static final Map<Object, Run> runs = new WeakHashMap<>();
    /** この取得が要求したカーソルと、自動タップが読み込んだカーソル。どちらも、この取得からは二度と要求しない。 */
    private static final Set<String> requested = new HashSet<>();
    /** この取得が要求し、結果を待っているカーソル。 */
    private static final Set<String> fetching = new HashSet<>();
    /** 取得中なのに、バインダーがまだ無くて記録できなかったカーソルと、その一覧の経路・要求した時刻。 */
    private static final Map<String, Waiting> fetchChannels = new HashMap<>();

    /**
     * 後からの記録は、要求からこの時間までにする。取得はふつう1〜2秒で終わり、終わった後に
     * 記録するとスピナーが出たまま残るため。
     */
    private static final long LATE_MARK_MS = 5_000L;

    private static final class Waiting {
        final WeakReference<Object> channel;
        final long at;

        Waiting(Object channel, long at) {
            this.channel = new WeakReference<>(channel);
            this.at = at;
        }
    }
    /** この取得が要求したが、何も入らなかったカーソル。 */
    private static final Set<String> empty = new HashSet<>();
    /**
     * 使い終わったカーソルのハッシュ値。古いものから並ぶ。カーソルがポストを返すのは1回だけで、
     * もう一度要求しても何も返らない。それでもアプリは、ギャップとカーソルを残したままにする。
     */
    private static final Set<String> usedKeys = new LinkedHashSet<>();
    private static boolean usedKeysLoaded;
    /** カーソルごとの、最後に見た一覧の短い名前。自動タップの記録に使う。 */
    private static final Map<String, String> keyScreens = new HashMap<>();
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
        int total;
        long lastFetchAt;
        boolean stopped;
        /** 要求の上限が空くのを待って、見直しを予約している。 */
        boolean retryPending;
        /** 前回の一覧の様子。変わった時だけ記録するため。 */
        String lastState;
        /** この一覧で要求したカーソル。ポストの詳細では、読み込み済みはこの一覧の中でだけ覚える。 */
        final Set<String> requestedHere = new HashSet<>();
        /**
         * 結果を待っているカーソルと、要求した時の項目の数、その下の次のギャップのカーソル、
         * 2つのギャップの間の項目の数。
         */
        String pendingKey;
        int rowsAtFetch;
        String nextKeyAtFetch;
        int spanAtFetch;
        /** 最後に渡された項目。結果が届かないまま時間がたった時などに、見直すのに使う。 */
        WeakReference<Object> lastItems;
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
     * 読み込み処理が項目1つ分の行を読むたびに、その先頭の行の種別が順に渡される。同じ
     * まとまりに属す続きの行は、読み込み処理が先読みして飛ばすので、ここには来ない。
     * すべてのタイムラインの読み込みの、すべての項目で動くので、できるだけ何もしない。
     */
    public static void onRowType(int type) {
        RowScan scan = scans.get();
        if (scan == null) return;
        // 位置は読み返さずに数えているので、すべての項目がここを通る必要がある。
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
        if (binder == null) return;
        binders.add(binder);
        // 取得中のカーソルの経路は、メインスレッドでしか触らない。
        if (Looper.myLooper() == Looper.getMainLooper()) {
            markLate(binder);
        } else {
            main.post(() -> markLate(binder));
        }
    }

    /**
     * 一覧に新しい項目が渡されるたびに、メインスレッドで呼ばれる。
     */
    public static void onItems(Object list, Object items) {
        try {
            if (list == null || items == null || !AutoExpandCursor.backgroundFetch()) return;
            int[] gaps = gapsOf(items);
            // フックした読み込み処理が読んだタイムラインではない。
            if (gaps == null) return;
            String type = list.getClass().getName();
            String[] screen = screenOf(type);
            recordOnce("watching:" + type, screen == null
                    ? "[Screen] Watching " + type + " (" + hostOf(list) + ")"
                    : "[Screen] Watching " + screen[2] + " (" + type + ", " + hostOf(list) + ")");
            // ギャップが無くなった一覧でも、結果を待っている取得があれば、その判断を付ける。
            Run run = runs.get(list);
            if (gaps.length == 0 && (run == null || run.pendingKey == null)) return;

            Names n = names();
            if (n != null) fill(n, list, items, gaps);
        } catch (Throwable ex) {
            AutoExpandCursor.record("[Error] Background loading failed: " + ex);
            Log.e(TAG, "GapFill: fill failed", ex);
        }
    }

    /**
     * 一覧を載せている画面の手がかり。一覧が持つ Fragment のクラスの名前と、表示中の Activity の
     * 名前である。名前の分からない一覧が、どの画面のものかを記録から調べるために使う。
     */
    private static String hostOf(Object list) {
        String fragment = null;
        for (Class<?> c = list.getClass(); c != null && c != Object.class && fragment == null; c = c.getSuperclass()) {
            for (Field field : c.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || !field.getType().getSimpleName().endsWith("Fragment")) {
                    continue;
                }
                try {
                    Object value = accessible(field).get(list);
                    if (value != null) {
                        fragment = value.getClass().getName();
                        break;
                    }
                } catch (Throwable ignored) {
                }
            }
        }
        return "fragment " + (fragment == null ? "?" : fragment) + ", activity " + AutoExpandCursor.currentActivity();
    }

    /** 一覧のクラスの名前から、画面の名前を引く。分からなければ null。 */
    private static String[] screenOf(String type) {
        for (String[] screen : SCREENS) {
            if (type.startsWith(screen[0])) return screen;
        }
        return null;
    }

    /** 記録に書く、そのカーソルを最後に見た一覧の短い名前。分からなければ null。 */
    static String screenOfKey(String key) {
        return key == null ? null : keyScreens.get(key);
    }

    /** 記録に書く、ボタンの呼び名。カーソルから作った値で、今までの記録と同じ値になる。 */
    static String tag(String key) {
        return key == null ? "#?" : "#" + shortKey(key);
    }

    /**
     * 起動時のログ用。名前を解決できない版なら、ギャップが出るのを待たずにすぐ分かる。
     */
    static String status() {
        if (!AutoExpandCursor.backgroundFetch()) return "tap only";
        return names() != null ? "ready" : "unavailable";
    }

    /**
     * ギャップをここで取得するか (アプリの名前を解決できている必要がある)、タップに任せるか。
     * 最初の取得を待たずにここで名前を解決するので、どの画面で先にギャップが出たかによって
     * 答えが変わることはない。
     */
    static boolean isReady() {
        return AutoExpandCursor.backgroundFetch() && names() != null;
    }

    /**
     * ギャップのカーソルから、カーソルを見分けるキーを取り出す。名前を解決できない版では null。
     * 裏で読み込まない時も、使い終わったカーソルを見分けるのに使う。
     */
    static String keyOf(Object cursor) {
        if (cursor == null) return null;
        Names n = names();
        if (n == null) return null;
        try {
            Object key = n.cursorKey.get(cursor);
            return key instanceof String ? (String) key : null;
        } catch (Throwable ex) {
            return null;
        }
    }

    /** カーソルの状態。キーが分からなければ GAP_NEW。 */
    static int stateOf(String key) {
        if (key == null) return GAP_NEW;
        if (isUsed(key)) return GAP_USED;
        if (fetching.contains(key)) return GAP_FETCHING;
        if (empty.contains(key)) return GAP_EMPTY;
        return GAP_NEW;
    }

    /** 自動タップがこのカーソルを読み込む。この取得からは要求しない。 */
    static void onTapped(String key) {
        if (key != null) requested.add(key);
    }

    private static void fill(Names n, Object list, Object items, int[] gaps) throws ReflectiveOperationException {
        int size = (Integer) n.size.invoke(items);
        List<Object> cursors = new ArrayList<>(gaps.length);
        List<String> keys = new ArrayList<>(gaps.length);
        List<Integer> positions = new ArrayList<>(gaps.length);
        for (int position : gaps) {
            if (position >= size) continue;
            Object item = n.itemAt.invoke(items, position);
            if (!n.gapItem.isInstance(item)) {
                // 位置は項目を数えて出しているので、合わないのはこの版で数え方がずれているということ。
                String found = item == null ? "null" : item.getClass().getName();
                recordOnce("mismatch", "[List] Item " + (position + 1) + " is not a button (" + found
                        + "). Counting is off on this version, so it is not loaded in the background");
                continue;
            }
            Object cursor = n.gapItemCursor.get(item);
            Object key = cursor == null ? null : n.cursorKey.get(cursor);
            if (!(key instanceof String)) continue;
            cursors.add(cursor);
            keys.add((String) key);
            positions.add(position);
        }
        Run run = runs.get(list);
        // ギャップが無くなった一覧でも、結果を待っている取得があれば判断を付ける。
        if (keys.isEmpty() && (run == null || run.pendingKey == null)) return;

        long now = SystemClock.uptimeMillis();
        if (run == null) {
            run = new Run();
            runs.put(list, run);
        }
        run.lastItems = new WeakReference<>(items);

        String type = list.getClass().getName();
        String[] screen = screenOf(type);
        String screenName = screen == null ? type : screen[1];
        for (String key : keys) keyScreens.put(key, screenName);

        // 取得で実際にポストが入ったかはボタンの位置の変化に表れるので、変わるたびに様子を記録する。
        String state = size + " " + positions + " " + keys;
        if (!state.equals(run.lastState) && !keys.isEmpty()) {
            StringBuilder buttons = new StringBuilder();
            for (int i = 0; i < keys.size(); i++) {
                if (i > 0) buttons.append(", ");
                buttons.append(tag(keys.get(i))).append(" at ").append(positions.get(i) + 1);
            }
            AutoExpandCursor.record("[List] " + screenName + ": " + keys.size() + " button(s) in " + size + " items ("
                    + buttons + ")");
        }
        run.lastState = state;

        // ポストの詳細は、開くたびに会話を取り直すので、前に読み込んだ返信の続きのボタンも、同じ
        // カーソルで、また読み込める状態で現れる。読み込み済みは、その画面の中でだけ覚える。
        boolean replies = type.startsWith(POST_DETAILS_PACKAGE);

        // 取得は1つずつ行う。結果が届くと一覧がまた渡されるので、次のギャップはその時に取る。
        if (run.pendingKey != null && !settle(run, keys, positions, size, now, replies)) return;
        if (keys.isEmpty()) return;

        int next = -1;
        for (int i = 0; i < keys.size(); i++) {
            String key = keys.get(i);
            // 一覧の最後の行のカーソルは、ギャップではなく続きを読み込むためのものと見て、
            // 裏では取らない。本物のギャップなら、画面に来た時に自動タップが拾う。
            if (positions.get(i) == size - 1) continue;
            boolean done = replies ? run.requestedHere.contains(key) : requested.contains(key) || isUsed(key);
            if (!done) {
                next = i;
                break;
            }
        }
        if (next < 0) return;

        if (run.total >= MAX_FETCHES_PER_LIST) {
            if (!run.stopped) {
                AutoExpandCursor.record("[Limit] Stopped loading in the background on " + screenName + " after "
                        + run.total + " times. The remaining buttons are tapped when they come on screen");
                run.stopped = true;
            }
            return;
        }
        long wait = AutoExpandCursor.requestWaitMs(now);
        if (wait > 0) {
            // 枠が空いたら、一覧が渡されなくても続ける。
            if (!run.retryPending) {
                run.retryPending = true;
                WeakReference<Object> listRef = new WeakReference<>(list);
                main.postDelayed(() -> onRequestSlot(listRef), wait);
            }
            return;
        }

        Object channel = channelOf(n, list);
        if (channel == null) {
            recordOnce("channel:" + type,
                    "[Background] Cannot load in the background on " + screenName + " (no fetch channel on " + type + ")");
            return;
        }

        String key = keys.get(next);
        n.emit.invoke(channel, n.fetch.newInstance(cursors.get(next)));
        AutoExpandCursor.recordRequest(now);
        boolean spinner = markInFlight(n, channel, key);

        run.total++;
        run.lastFetchAt = now;
        run.pendingKey = key;
        run.rowsAtFetch = size;
        run.nextKeyAtFetch = next + 1 < keys.size() ? keys.get(next + 1) : null;
        run.spanAtFetch = span(keys, positions, size, next, run.nextKeyAtFetch);
        if (replies) {
            run.requestedHere.add(key);
        } else {
            requested.add(key);
        }
        fetching.add(key);

        AutoExpandCursor.record("[Background] Loading button " + tag(key) + " on " + screenName + " (" + run.total
                + "/" + MAX_FETCHES_PER_LIST + " for this timeline, in-progress mark: "
                + (spinner ? "set" : "set when the button view is created") + ")");
        AutoExpandCursor.debug("fill requested " + tag(key) + " spinner=" + spinner + " list=" + type);
        // 毎回同じ文言にして、続けて取得した時にトーストが並ばず、1つにまとまるようにする。
        AutoExpandCursor.toast("非表示のポストを裏で取得しました", "Loaded hidden posts in the background");
        // 画面に出ている行は、この時点で畳み、待っているタップは取りやめる。
        AutoExpandCursor.onGapKeyChanged(key);

        WeakReference<Object> listRef = new WeakReference<>(list);
        main.postDelayed(() -> onPendingTimeout(listRef, key), PENDING_TIMEOUT_MS + 100L);
    }

    /**
     * 結果を待っている取得について、ポストが入ったかを判断する。
     *
     * @param replies ポストの詳細の一覧。返信の続きのボタンは、読み込むと行が消えて、そこに返信が
     *                入る。また、画面を開き直すと、また読み込める状態で現れるので、記録には残さない。
     * @return 判断が付いた。まだ待つ時は false。
     */
    private static boolean settle(Run run, List<String> keys, List<Integer> positions, int size, long now,
            boolean replies) {
        String key = run.pendingKey;
        int index = keys.indexOf(key);
        if (index < 0) {
            if (!replies) {
                // タイムラインでは、読み込んだ後もギャップの行は残る。消えたのは別のタブに切り替わった
                // 時などで、比べられないので、何も入らなかったとみなす。
                settleEmpty(run, key, "the button left the list");
                return true;
            }
            // 返信の続きは、ギャップの行が先に消え、少し後に返信が入る。消えた行の分を差し引いても
            // 項目が元の数以上なら、返信が入った。それまでは待つ。
            if (size >= run.rowsAtFetch) {
                settleAdded(run, key, run.rowsAtFetch + " -> " + size + " items in the list; the button was replaced by them",
                        false);
                return true;
            }
            if (now - run.lastFetchAt < PENDING_TIMEOUT_MS) return false;
            settleEmpty(run, key, "the button left the list and nothing came in " + PENDING_TIMEOUT_MS / 1000 + " s");
            return true;
        }
        // 取得したポストは、ギャップとその下の次のギャップの間に入る。一覧の先頭に新しいポストが
        // 入っても、一覧が 400 件ほどで後ろから切られても、この間は広がらない。
        int spanNow = span(keys, positions, size, index, run.nextKeyAtFetch);
        // 間を次のボタンまでで測ったか (でなければ一覧の最後まで)。記録の文言に使う。
        boolean until = run.nextKeyAtFetch != null && keys.indexOf(run.nextKeyAtFetch) > index;
        String where = until ? "to the next button" : "to the end of the list";
        if (spanNow > run.spanAtFetch) {
            settleAdded(run, key, run.spanAtFetch + " -> " + spanNow + " items " + where, !replies);
            return true;
        }
        if (now - run.lastFetchAt < PENDING_TIMEOUT_MS) return false;
        settleEmpty(run, key, "still " + spanNow + " items " + where + " after " + PENDING_TIMEOUT_MS / 1000 + " s");
        return true;
    }

    /**
     * 取得でポストが入った。タイムラインのカーソルはもう一度要求しても何も返らないので、使い終わり
     * として記録する。
     *
     * @param remember 使い終わりとして記録するか。ポストの詳細の返信の続きは記録しない。
     */
    private static void settleAdded(Run run, String key, String detail, boolean remember) {
        AutoExpandCursor.record("[Background] " + tag(key) + ": posts added (" + detail + ")");
        fetching.remove(key);
        fetchChannels.remove(key);
        run.pendingKey = null;
        if (remember) markUsed(key);
    }

    /**
     * ギャップから、その下の次のギャップまでの項目の数。取得したポストはこの間に入る。下に
     * ギャップが無い時や、次のギャップが一覧の後ろから切られた時は、一覧の最後までの数で代える。
     */
    private static int span(List<String> keys, List<Integer> positions, int size, int index, String nextKey) {
        int nextIndex = nextKey == null ? -1 : keys.indexOf(nextKey);
        int end = nextIndex > index ? positions.get(nextIndex) : size;
        return end - positions.get(index);
    }

    /** 取得で何も入らなかった。画面に来た時の自動タップに任せる。 */
    private static void settleEmpty(Run run, String key, String why) {
        AutoExpandCursor.record("[Background] " + tag(key) + ": nothing added (" + why
                + ") -> it will be tapped when it comes on screen");
        fetching.remove(key);
        fetchChannels.remove(key);
        empty.add(key);
        if (run != null && key.equals(run.pendingKey)) run.pendingKey = null;
        AutoExpandCursor.onGapKeyChanged(key);
    }

    /**
     * 取得から時間がたった。結果を受けて一覧が渡されなかった時も、ここで判断を付け、
     * 次のギャップに進む。
     */
    private static void onPendingTimeout(WeakReference<Object> listRef, String key) {
        try {
            Object list = listRef.get();
            Run run = list == null ? null : runs.get(list);
            if (run == null) {
                // 一覧ごと無くなった。
                if (fetching.contains(key)) settleEmpty(null, key, "the list was closed");
                return;
            }
            if (!key.equals(run.pendingKey)) return;
            Object items = run.lastItems == null ? null : run.lastItems.get();
            if (items != null) onItems(list, items);
            // 項目からギャップを読めなかった時も、待つのはここまでにする。
            if (key.equals(run.pendingKey)) settleEmpty(run, key, "gave up after " + PENDING_TIMEOUT_MS / 1000 + " s");
        } catch (Throwable ex) {
            AutoExpandCursor.record("[Error] Checking the background load failed: " + ex);
            Log.e(TAG, "GapFill: timeout check failed", ex);
        }
    }

    /** 要求の上限が空いた。一覧を見直して、次のギャップを取りに行く。 */
    private static void onRequestSlot(WeakReference<Object> listRef) {
        try {
            Object list = listRef.get();
            Run run = list == null ? null : runs.get(list);
            if (run == null) return;
            run.retryPending = false;
            Object items = run.lastItems == null ? null : run.lastItems.get();
            if (items != null) onItems(list, items);
        } catch (Throwable ex) {
            AutoExpandCursor.record("[Error] Resuming the background load failed: " + ex);
            Log.e(TAG, "GapFill: retry failed", ex);
        }
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
     *
     * <p>記録はバインダーが持っているが、アプリはバインダーを、その一覧で初めてギャップの行を
     * 出す時に作る。タイムラインを開いた直後の取得ではまだ無いことが多いので、その時は経路を
     * 覚えておき、バインダーが作られた時に記録する ({@link #markLate})。
     */
    private static boolean markInFlight(Names n, Object channel, String key) {
        try {
            synchronized (binders) {
                for (Object binder : binders) {
                    if (n.binderChannel.get(binder) == channel && mark(n, binder, key)) return true;
                }
            }
        } catch (Throwable ex) {
            Log.e(TAG, "GapFill: could not mark the fetch", ex);
        }
        fetchChannels.put(key, new Waiting(channel, SystemClock.uptimeMillis()));
        return false;
    }

    /**
     * バインダーが後から作られた。同じ一覧で取得中のカーソルを、そのバインダーの記録に足す。
     * バインダーは、この後すぐにギャップの行をバインドし、そこでスピナーを出す。
     */
    private static void markLate(Object binder) {
        try {
            if (fetchChannels.isEmpty()) return;
            Names n = names();
            if (n == null) return;
            Object channel = n.binderChannel.get(binder);
            long now = SystemClock.uptimeMillis();
            Iterator<Map.Entry<String, Waiting>> entries = fetchChannels.entrySet().iterator();
            while (entries.hasNext()) {
                Map.Entry<String, Waiting> entry = entries.next();
                Object waiting = entry.getValue().channel.get();
                if (waiting == null || now - entry.getValue().at > LATE_MARK_MS) {
                    entries.remove();
                } else if (waiting == channel && mark(n, binder, entry.getKey())) {
                    entries.remove();
                    AutoExpandCursor.debug("in-flight mark added late " + tag(entry.getKey()));
                }
            }
        } catch (Throwable ex) {
            Log.e(TAG, "GapFill: could not mark the fetch late", ex);
        }
    }

    private static boolean mark(Names n, Object binder, String key) throws ReflectiveOperationException {
        Object repository = n.binderRepository.get(binder);
        if (repository == null) return false;
        @SuppressWarnings("unchecked")
        Set<Object> inFlight = (Set<Object>) n.repositoryInFlight.get(repository);
        if (inFlight == null) return false;
        inFlight.add(n.inFlightKey.newInstance(key));
        return true;
    }

    // 使い終わったカーソルの記録。

    /** 使い終わったカーソルとして覚え、アプリの設定ファイルに保存する。 */
    static void markUsed(String key) {
        if (key == null) return;
        loadUsedKeys();
        if (!usedKeys.add(hash(key))) return;
        Iterator<String> oldest = usedKeys.iterator();
        while (usedKeys.size() > MAX_USED_KEYS) {
            oldest.next();
            oldest.remove();
        }
        AutoExpandCursor.record("[Record] " + tag(key) + " marked as loaded (" + usedKeys.size() + " recorded)");
        SharedPreferences prefs = prefs();
        if (prefs != null) prefs.edit().putString(PREF_USED_KEYS, String.join(",", usedKeys)).apply();
    }

    private static boolean isUsed(String key) {
        loadUsedKeys();
        return usedKeys.contains(hash(key));
    }

    /** 保存してある記録を、最初に要る時に一度だけ読む。 */
    private static void loadUsedKeys() {
        if (usedKeysLoaded) return;
        SharedPreferences prefs = prefs();
        // アプリの Context がまだ無い。次の機会に読む。
        if (prefs == null) return;
        usedKeysLoaded = true;
        Set<String> saved = new LinkedHashSet<>();
        for (String hash : prefs.getString(PREF_USED_KEYS, "").split(",")) {
            if (!hash.isEmpty()) saved.add(hash);
        }
        AutoExpandCursor.record("[Record] Read the record of loaded buttons (" + saved.size() + ")");
        // 読む前に使い終わったものは、保存してあったものより新しい。
        saved.addAll(usedKeys);
        usedKeys.clear();
        usedKeys.addAll(saved);
    }

    /** アプリの設定ファイル (shared_prefs/autoexpand.xml)。アプリの Context がまだ無ければ null。 */
    static SharedPreferences prefs() {
        Context context = AutoExpandCursor.context();
        return context == null ? null : context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    /**
     * カーソルは長いので、64 ビットのハッシュ値 (FNV-1a) にして保存する。保存する件数では、
     * 別のカーソルと同じ値になることは、まず無い。
     */
    private static String hash(String key) {
        long hash = 0xcbf29ce484222325L;
        for (int i = 0; i < key.length(); i++) {
            hash ^= key.charAt(i);
            hash *= 0x100000001b3L;
        }
        return Long.toHexString(hash);
    }

    /**
     * カーソルは長く、中身を読んでも意味が無いので、短い代わりの値で記録する。前の版の記録と
     * 突き合わせられるように、作り方は変えない。
     */
    private static String shortKey(String key) {
        return Integer.toHexString(key.hashCode());
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
            AutoExpandCursor.record("[Background] The names needed to tell buttons apart are missing on this version of X. "
                    + "Only automatic taps are used (" + ex + ")");
            Log.e(TAG, "GapFill: names unavailable", ex);
            // 裏で読み込まない設定の時は、裏の取得を使わないので知らせない。
            if (AutoExpandCursor.backgroundFetch()) {
                AutoExpandCursor.toast(
                        "この版の X では裏の取得が使えないため、ボタンを自動でタップします",
                        "Background loading is not available on this version of X, so the button is tapped instead");
            }
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
