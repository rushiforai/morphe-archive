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

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.Toast;

import java.io.File;
import java.io.FileOutputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayDeque;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * タイムラインのギャップ (「ポストをさらに表示」) を扱う。
 *
 * <p>ギャップの中身は、タイムラインを読み込んだ時点で {@link GapFill} が裏で取得する。
 * アプリは、カーソルがもうポストを返さなくなってもギャップの行を残すので、裏の取得が
 * 動いている時は、押しても何も起きない行を残さずに畳む。
 *
 * <p>裏の取得が使えない時 (名前を解決できない版や、「自動タップだけ」のオプションの時) は、
 * ギャップの行が一覧に加わった時点で、画面に落ち着くのを待たずにタップする。勢いよく
 * スクロールして通り過ぎても押し逃さないためである。行を畳むのは、タップで読み込みが
 * 始まったのを確かめてからにする。何も起きなかったタップで、その先のポストを隠さない
 * ためである。その後は、読み込むたびにポストが増えている間 (一覧の件数で分かる) は、
 * 同じギャップをタップし続ける。
 *
 * <p>一覧はスクロールに合わせて、行を別のギャップに使い回す。前とは別のギャップの
 * カーソルでバインドされた行は、表示に戻してやり直す。同じカーソルでバインドされた行や、
 * バインドされずに戻ってきた行は、それまでの状態を引き継ぐ。
 *
 * <p>ギャップのラベルは、コンストラクタで読むレイアウトの属性から付き、ラベルを設定する
 * メソッドはサーバーから送られたラベルの時しか呼ばれない。そのため、ギャップが現れた時を
 * それでは知ることができない。ギャップを調べるのは、画面に付いた時と、バインドのたびである。
 *
 * <p>設定画面は無い。動作は、パッチを当てる時のオプションで決める。
 */
public final class AutoExpandCursor {
    private static final String TAG = "AutoExpand";

    /** Download の下に、専用のフォルダを作る。 */
    private static final String LOG_DIR = "AutoExpand";
    private static final String LOG_FILE_STEM = "AutoExpand-Log";
    private static final String LOG_FILE = LOG_FILE_STEM + ".txt";
    /**
     * ファイルがこの大きさになったら、前のログとして残して新しいファイルに書き始める。
     * 端末をどれだけ長く使っても、ログは2つのファイルに収まり、上限に達する直前の
     * 記録も読める。
     */
    private static final long LOG_FILE_LIMIT_BYTES = 1024 * 1024;
    /** X を入れ直すたびに別のファイルを使う。この数の名前まで試す。 */
    private static final int LOG_FILE_NAMES = 10;

    /** 1回のタップで入るのは 40 件まで。長いギャップは、この回数まで追いかける。 */
    private static final int MAX_TAPS_PER_GAP = 5;

    /** ギャップ全体での上限。ギャップだらけのタイムラインで、要求をまとめて送らないため。 */
    private static final int MAX_TAPS_PER_MINUTE = 10;
    private static final long TAP_WINDOW_MS = 60_000L;

    /** 勢いよくスクロールすると複数のギャップが一瞬で通り過ぎるので、別のギャップへのタップはこの間隔まで詰める。 */
    private static final long TAP_MIN_INTERVAL_MS = 300L;

    /** バインダーはクリックの処理を行のほかの部分より少し遅れて設定するので、無ければ待つ。 */
    private static final long[] LISTENER_RETRY_MS = { 16L, 50L, 150L, 400L };

    /** タップの後、ポストが届いたかを、この間隔でこの回数まで確かめる。 */
    private static final long LOAD_CHECK_INTERVAL_MS = 1_000L;
    private static final int LOAD_CHECKS = 6;

    /** 次のタップの時にまだ読み込み中なら、この時間だけ遅らせる。 */
    private static final long LOADING_RETRY_MS = 500L;

    /** 同じメッセージは、この時間内に二度出さない。行がバインドし直されるたびに繰り返さないため。 */
    private static final long TOAST_REPEAT_MS = 2_000L;

    private static final Handler main = new Handler(Looper.getMainLooper());

    /** 1つのギャップへのタップの状態。メインスレッドでしか触らない。 */
    private static final class TapState {
        int taps;
        /** 最後にタップした時の一覧の件数。ポストが入ったかを見分けるため。 */
        int countAtTap = -1;
        /** タップを予約している。 */
        boolean pending;
        /** タップした後で、ポストが届くのを待っている。 */
        boolean checking;
        /** 最後のタップで読み込みが始まった。ギャップのスピナーで分かる。 */
        boolean started;
        boolean hidden;
        boolean done;
        /** 行が画面から外れた時刻と、上に外れたかどうか。 */
        long detachedAt;
        boolean leftAbove;
        WeakReference<ViewParent> list;
    }

    /** メインスレッドでしか触らない。キーを弱い参照にして、使い回し終わった部品を解放できるようにする。 */
    private static final Map<View, Boolean> gapLoading = new WeakHashMap<>();
    private static final Map<View, TapState> tapStates = new WeakHashMap<>();
    private static final Map<View, Integer> rowHeights = new WeakHashMap<>();
    private static final ArrayDeque<Long> recentTaps = new ArrayDeque<>();
    private static final Map<Class<?>, Method[]> countMethods = new HashMap<>();
    private static final Map<Class<?>, Boolean> listClasses = new HashMap<>();
    /** 各行が最後にバインドされたカーソル。カーソルは値で比べられる。 */
    private static final Map<View, Object> boundCursors = new WeakHashMap<>();
    /**
     * この版でスピナーのフックが動いている。無い時は読み込みの開始が見えないので、
     * ポストが届いたことで代わりにする。
     */
    private static boolean spinnerSeen;
    /** この版でバインドのフックが動いている。行が別のギャップに使い回されたことが分かる。 */
    private static boolean bindSeen;
    private static long lastTapAt;
    private static boolean tapLimitRecorded;
    private static boolean gapHiddenRecorded;
    private static String lastToast;
    private static long lastToastAt;

    /** アプリ本体。トーストはこれを使って出す。 */
    private static volatile Context appContext;

    /** バインドはメインスレッドで起きるので、ファイルへの書き込みは別のスレッドに回す。 */
    private static final ExecutorService writer = Executors.newSingleThreadExecutor();
    /** このインストールが書き込むログのファイル (見つかってから)。書き込みのスレッドでしか触らない。 */
    private static File logFile;
    private static boolean logUnavailable;

    private AutoExpandCursor() {
    }

    // パッチのオプション。パッチを当てる時に埋め込まれる。R8 は定数どうしの比較を畳み込んで
    // しまうので、値として使うだけで、定数として比較はしない。

    private static String hideGapsOption() {
        return "autoexpand:opt:hideGaps";
    }

    private static String logToFileOption() {
        return "autoexpand:opt:logToFile";
    }

    private static String showToastsOption() {
        return "autoexpand:opt:showToasts";
    }

    private static String tapOnlyOption() {
        return "autoexpand:opt:tapOnly";
    }

    private static boolean hideGaps() {
        return Boolean.parseBoolean(hideGapsOption());
    }

    private static boolean logToFile() {
        return Boolean.parseBoolean(logToFileOption());
    }

    private static boolean showToasts() {
        return Boolean.parseBoolean(showToastsOption());
    }

    /** 裏の取得を使わず、ギャップは常にタップで開く。 */
    static boolean tapOnly() {
        return Boolean.parseBoolean(tapOnlyOption());
    }

    /**
     * Application.onCreate から呼ばれる。起動ごとに1行記録するので、ログのファイルが無い
     * のか、フックが一度も動いていないのかを見分けられる。
     */
    public static void onAppStart(Object application) {
        try {
            if (application instanceof Context) appContext = (Context) application;
            if (!logToFile()) return;
            // onCreate の最初に動くので、アプリの起動が終わるのを待つ。
            main.post(() -> {
                try {
                    String version = "?";
                    if (application instanceof Context) {
                        Context context = (Context) application;
                        version = context.getPackageManager()
                                .getPackageInfo(context.getPackageName(), 0).versionName;
                    }
                    record("app start standalone x=" + version + " hide=" + hideGaps()
                            + " fill=" + GapFill.status());
                } catch (Throwable ex) {
                    Log.e(TAG, "app start record failed", ex);
                }
            });
        } catch (Throwable ignored) {
        }
    }

    /**
     * ギャップのコンストラクタの最後で呼ばれる。部品は使い回されて複数のギャップに使われる
     * ので、部品がある間はずっと見張る。
     */
    public static void onGapCreated(Object gapView) {
        try {
            if (!(gapView instanceof View)) return;
            // 起動時のフックを入れる onCreate が見つからなかった場合に備える。
            if (appContext == null) appContext = ((View) gapView).getContext().getApplicationContext();
            record("gap created");
            ((View) gapView).addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                @Override
                public void onViewAttachedToWindow(View view) {
                    onGapAttached(view);
                }

                @Override
                public void onViewDetachedFromWindow(View view) {
                    onGapDetached(view);
                }
            });
        } catch (Throwable ex) {
            record("gap create failed: " + ex);
            Log.e(TAG, "gap create failed", ex);
        }
    }

    /**
     * ラベルを設定するメソッドから呼ばれる。バインダーがこれを使うのは、サーバーから
     * 送られたラベルの時だけである。
     */
    public static void onGapShown(Object gapView) {
        if (gapView instanceof View) onGapEvent((View) gapView, "label");
    }

    /**
     * バインダーがギャップのスピナーを出したり消したりするたびに呼ばれる。バインドのたび、
     * タップで読み込みが始まった時、その読み込みが終わった時に呼ばれる。
     */
    public static void onGapSpinner(Object gapView, boolean loading) {
        try {
            if (!(gapView instanceof View)) return;
            View view = (View) gapView;
            onMain(() -> {
                spinnerSeen = true;
                gapLoading.put(view, loading);
                if (loading) onLoadStarted(view);
                onGapEvent(view, loading ? "loading" : "idle");
            });
        } catch (Throwable ex) {
            Log.e(TAG, "gap spinner failed", ex);
        }
    }

    /**
     * バインダーがギャップの行をバインドする時に、スピナーを設定する前に、そのギャップの
     * カーソルと一緒に呼ばれる。前と別のカーソルでバインドされた行は、別のギャップである。
     */
    public static void onGapBound(Object gapView, Object cursor) {
        try {
            if (!(gapView instanceof View) || cursor == null) return;
            View view = (View) gapView;
            onMain(() -> {
                bindSeen = true;
                Object previous = boundCursors.put(view, cursor);
                if (previous != null && !previous.equals(cursor)) onGapRebound(view);
            });
        } catch (Throwable ex) {
            Log.e(TAG, "gap bind failed", ex);
        }
    }

    private static void onGapAttached(View view) {
        onMain(() -> {
            TapState state = tapStates.get(view);
            if (state != null && !bindSeen && state.done && state.detachedAt != 0) {
                // バインドのフックが無いと使い回された行を見分けられないので、終わった
                // ギャップが戻ってきたら、別のギャップかもしれないとしてやり直す。
                onGapRebound(view);
            } else if (state != null) {
                state.detachedAt = 0;
            }
            onGapEvent(view, "attach");
        });
    }

    /**
     * それまでの状態は、前に入っていたギャップのものである。今のギャップへのタップが
     * 効いたと分かるまで、行を表示に戻してやり直す。
     */
    private static void onGapRebound(View view) {
        TapState state = tapStates.remove(view);
        if (state == null) return;
        record("gap row reused after " + state.taps + " tap(s)" + (state.hidden ? ", shown again" : ""));
        if (state.hidden && !GapFill.isReady()) showRow(view);
    }

    private static void onGapDetached(View view) {
        onMain(() -> {
            TapState state = tapStates.get(view);
            if (state == null) return;
            state.detachedAt = SystemClock.uptimeMillis();
            state.leftAbove = rowOf(view).getBottom() <= 0;
        });
    }

    private static void onGapEvent(View view, String source) {
        onMain(() -> {
            try {
                if (GapFill.isReady()) {
                    hideFilledGap(view);
                } else {
                    considerTap(view, source);
                }
            } catch (Throwable ex) {
                record("gap failed: " + ex);
                Log.e(TAG, "gap failed", ex);
            }
        });
    }

    /**
     * 裏でポストを取得している時は、行を押しても何も起きないので、タップせずに消す。
     */
    private static void hideFilledGap(View view) {
        if (!hideGaps() || !collapseRow(view)) return;
        if (!gapHiddenRecorded) {
            record("gap hidden: the background fill has the posts");
            gapHiddenRecorded = true;
        }
        toast("「ポストをさらに表示」を隠しました", "Hid \"Show more posts\"");
    }

    // 自動タップ (裏の取得が使えない時)。

    private static void considerTap(View view, String source) {
        TapState state = tapStates.get(view);
        if (state == null) {
            state = new TapState();
            tapStates.put(view, state);
        }
        // 済んだタップの後の確認は、そのタップ自身の確認の処理が行う。
        if (state.done || state.pending || state.checking) return;
        if (!view.isAttachedToWindow() || isLoading(view)) return;
        if (state.taps == 0) record("gap seen via=" + source + " screen=" + screenOf(view));
        // バインダーは、同じバインドの中で、スピナーの後にクリックの処理を設定する。
        scheduleTap(view, state, 0, 0);
    }

    private static void scheduleTap(View view, TapState state, long delayMs, int attempt) {
        state.pending = true;
        main.postDelayed(() -> tryTap(view, state, attempt), delayMs);
    }

    private static void tryTap(View view, TapState state, int attempt) {
        state.pending = false;
        try {
            if (tapStates.get(view) != state || state.done || GapFill.isReady()) return;
            // スクロールして画面から外れた。戻ってきたら、またこのギャップを扱う。
            if (!view.isAttachedToWindow()) return;
            if (isLoading(view)) {
                scheduleTap(view, state, LOADING_RETRY_MS, attempt);
                return;
            }
            if (state.taps >= MAX_TAPS_PER_GAP) {
                state.done = true;
                record("gap followed to the limit of " + MAX_TAPS_PER_GAP + " taps");
                return;
            }

            long now = SystemClock.uptimeMillis();
            while (!recentTaps.isEmpty() && now - recentTaps.peekFirst() > TAP_WINDOW_MS) recentTaps.pollFirst();
            if (recentTaps.size() >= MAX_TAPS_PER_MINUTE) {
                if (!tapLimitRecorded) record("taps paused: " + MAX_TAPS_PER_MINUTE + " in the last minute");
                tapLimitRecorded = true;
                // あきらめずに、いちばん古いタップが1分の枠から外れた時にやり直す。画面に
                // 止まったままのギャップは、バインドが起きず、ほかにきっかけが無いため。
                scheduleTap(view, state, recentTaps.peekFirst() + TAP_WINDOW_MS - now + 1, attempt);
                return;
            }
            tapLimitRecorded = false;
            long sinceTap = now - lastTapAt;
            if (sinceTap < TAP_MIN_INTERVAL_MS) {
                scheduleTap(view, state, TAP_MIN_INTERVAL_MS - sinceTap, attempt);
                return;
            }
            // クリックの処理が無いと、タップしても何も起きない。
            if (!view.hasOnClickListeners()) {
                if (attempt < LISTENER_RETRY_MS.length) {
                    scheduleTap(view, state, LISTENER_RETRY_MS[attempt], attempt + 1);
                } else {
                    state.done = true;
                    record("gap skipped: no click listener");
                }
                return;
            }

            ViewParent list = rowOf(view).getParent();
            if (list != null) state.list = new WeakReference<>(list);
            state.countAtTap = itemCount(state.list);
            state.taps++;
            state.checking = true;
            state.started = false;
            lastTapAt = now;
            recentTaps.addLast(now);
            boolean clicked = view.performClick();
            record("gap tap " + state.taps + "/" + MAX_TAPS_PER_GAP + " performed=" + clicked
                    + " items=" + state.countAtTap);
            main.postDelayed(() -> checkLoad(view, state, 1), LOAD_CHECK_INTERVAL_MS);
        } catch (Throwable ex) {
            // タップするとポストを読み込むが、一覧は並べ直しの途中だとそれを受け付けない。
            state.checking = false;
            record("gap tap threw: " + ex);
        }
    }

    /** タップで読み込みが始まれば、タップは効いている。行を消しても、その先のポストは失われない。 */
    private static void onLoadStarted(View view) {
        TapState state = tapStates.get(view);
        if (state == null || !state.checking) return;
        state.started = true;
        hideTappedGap(view, state);
    }

    private static void hideTappedGap(View view, TapState state) {
        if (!hideGaps() || state.hidden || !collapseRow(view)) return;
        state.hidden = true;
        record("gap hidden after its tap took effect");
        toast("「ポストをさらに表示」を隠しました", "Hid \"Show more posts\"");
    }

    private static void checkLoad(View view, TapState state, int check) {
        try {
            if (tapStates.get(view) != state) return;
            if (spinnerSeen && !state.started) {
                // タップで何も始まらなかったので、手でタップできるように行を残す。その間に
                // 増えた項目は、一覧の末尾の読み込みなど、別の所から来たものである。
                state.checking = false;
                state.done = true;
                record("gap tap started no load");
                return;
            }
            // 一覧は先頭や末尾でも増えるので、このギャップ自身の読み込み中に件数が増えても、
            // このギャップの成果とは言えない。バインダーは、行がバインドされている間は、
            // 画面の中でも外でも、スピナーを最新の状態に保つ。
            int count = itemCount(state.list);
            if (!isLoading(view) && count >= 0 && state.countAtTap >= 0 && count > state.countAtTap) {
                record("gap tap brought " + (count - state.countAtTap) + " items ("
                        + state.countAtTap + " -> " + count + ")");
                state.checking = false;
                // スピナーのフックが無い時は、ポストが届いたことでタップが効いたと分かる。
                hideTappedGap(view, state);
                toastAdded(view, state);
                // ギャップの一部だけが埋まると、残りは同じ行の先に残るので、もう一度タップする。
                if (!state.done) considerTap(view, "more");
                return;
            }
            if (check < LOAD_CHECKS) {
                main.postDelayed(() -> checkLoad(view, state, check + 1), LOAD_CHECK_INTERVAL_MS);
                return;
            }
            state.checking = false;
            state.done = true;
            record("gap tap brought nothing new" + (count < 0 ? " (item count unavailable)" : ""));
        } catch (Throwable ex) {
            state.checking = false;
            state.done = true;
            record("gap check failed: " + ex);
        }
    }

    /**
     * ポストはギャップのあった場所に入る。勢いよくスクロールした後だと、それは読んでいる
     * 位置より上なので、メッセージでそう伝える。件数は出さない。一覧の件数には広告などの
     * 行や、その間に一覧が読み込んだほかの分も含まれるため。
     */
    private static void toastAdded(View view, TapState state) {
        boolean above = view.isAttachedToWindow() ? rowOf(view).getBottom() <= 0
                : state.detachedAt != 0 && state.leftAbove;
        if (above) {
            toast("上にポストを追加しました", "Added posts above");
        } else {
            toast("非表示のポストを読み込みました", "Loaded hidden posts");
        }
    }

    private static boolean isLoading(View view) {
        return Boolean.TRUE.equals(gapLoading.get(view));
    }

    /**
     * 一覧の項目の数。読み取れなければ -1。一覧の名前はアプリの中で短く変えられているので、
     * アダプターと件数は形で探す。引数なしで抽象クラスを返すメソッドと、そのクラスにある、
     * 引数なしで int を返す抽象メソッドの組である。
     */
    private static int itemCount(WeakReference<ViewParent> reference) {
        ViewParent list = reference == null ? null : reference.get();
        if (list == null) return -1;
        try {
            Method[] methods = countMethodsOf(list.getClass());
            if (methods == null) return -1;
            Object adapter = methods[0].invoke(list);
            if (adapter == null) return -1;
            Object count = methods[1].invoke(adapter);
            return count instanceof Integer ? (Integer) count : -1;
        } catch (Throwable ex) {
            return -1;
        }
    }

    private static Method[] countMethodsOf(Class<?> listClass) {
        if (countMethods.containsKey(listClass)) return countMethods.get(listClass);
        Method[] found = null;
        for (Class<?> c = listClass; c != null && c != ViewGroup.class && found == null; c = c.getSuperclass()) {
            for (Method method : c.getDeclaredMethods()) {
                if (method.getParameterTypes().length != 0) continue;
                Class<?> type = method.getReturnType();
                if (type.isInterface() || !Modifier.isAbstract(type.getModifiers())) continue;
                Method count = abstractIntGetter(type);
                if (count == null) continue;
                method.setAccessible(true);
                count.setAccessible(true);
                found = new Method[] { method, count };
                break;
            }
        }
        countMethods.put(listClass, found);
        record("list item count " + (found == null ? "unavailable" : "via " + found[0].getName()
                + "()." + found[1].getName() + "()") + " on " + listClass.getName());
        return found;
    }

    private static Method abstractIntGetter(Class<?> type) {
        for (Method method : type.getDeclaredMethods()) {
            if (method.getParameterTypes().length == 0 && method.getReturnType() == int.class
                    && Modifier.isAbstract(method.getModifiers())) {
                return method;
            }
        }
        return null;
    }

    // 行を畳む処理。

    /**
     * ギャップが入っている行を畳む。元に戻せるように、行の高さを控えておく。
     *
     * @return 今この呼び出しで行を畳んだかどうか。
     */
    private static boolean collapseRow(View view) {
        try {
            View row = rowOf(view);
            ViewGroup.LayoutParams params = row.getLayoutParams();
            if (params == null) return false;
            if (row.getVisibility() == View.GONE && params.height == 0) return false;
            if (!rowHeights.containsKey(row)) rowHeights.put(row, params.height);
            params.height = 0;
            row.setVisibility(View.GONE);
            row.setLayoutParams(params);
            return true;
        } catch (Throwable ex) {
            Log.e(TAG, "could not hide the gap", ex);
            return false;
        }
    }

    private static void showRow(View view) {
        try {
            View row = rowOf(view);
            Integer height = rowHeights.remove(row);
            if (height == null) return;
            ViewGroup.LayoutParams params = row.getLayoutParams();
            if (params != null) {
                params.height = height;
                row.setLayoutParams(params);
            }
            row.setVisibility(View.VISIBLE);
        } catch (Throwable ex) {
            Log.e(TAG, "could not show the gap", ex);
        }
    }

    /**
     * 一覧が並べる単位の部品。ギャップが場所を取らないようにするには、これを畳む必要がある。
     * ギャップは行そのものではなく、行の中に入っている。
     */
    private static View rowOf(View gapView) {
        View view = gapView;
        for (int depth = 0; depth < 4; depth++) {
            ViewParent parent = view.getParent();
            if (!(parent instanceof ViewGroup)) break;
            if (isList(parent)) return view;
            view = (ViewGroup) parent;
        }
        return gapView;
    }

    /** 一覧の部品か、アプリがどんな名前を付けていても、その子クラスであるかどうか。 */
    private static boolean isList(ViewParent parent) {
        Class<?> type = parent.getClass();
        Boolean known = listClasses.get(type);
        if (known != null) return known;
        boolean list = false;
        for (Class<?> c = type; c != null && c != ViewGroup.class; c = c.getSuperclass()) {
            if (c.getName().endsWith("RecyclerView")) {
                list = true;
                break;
            }
        }
        listClasses.put(type, list);
        return list;
    }

    private static void onMain(Runnable action) {
        if (Looper.myLooper() == Looper.getMainLooper()) action.run();
        else main.post(action);
    }

    /**
     * トーストのオプションがオンの時に、今起きたことを知らせる。翻訳に使う文字列の
     * リソースが無いので、端末の言語で文言を選ぶ。
     */
    static void toast(String japanese, String english) {
        if (showToasts()) showToast(japanese, english);
    }

    /** トーストのオプションに関係なくメッセージを出す。使う人が知っておくべきことに使う。 */
    private static void showToast(String japanese, String english) {
        onMain(() -> {
            try {
                Context context = appContext;
                if (context == null) return;
                String text = "ja".equals(Locale.getDefault().getLanguage()) ? japanese : english;
                long now = SystemClock.uptimeMillis();
                if (text.equals(lastToast) && now - lastToastAt < TOAST_REPEAT_MS) return;
                lastToast = text;
                lastToastAt = now;
                Toast.makeText(context, text, Toast.LENGTH_SHORT).show();
            } catch (Throwable ex) {
                Log.e(TAG, "toast failed", ex);
            }
        });
    }

    /**
     * 部品が載っている画面 (Activity)。ホームのタイムラインか、リストや検索かが分かる。
     */
    private static String screenOf(View view) {
        if (view == null) return "?";
        Context context = view.getContext();
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return context.getClass().getSimpleName();
            context = ((ContextWrapper) context).getBaseContext();
        }
        return context == null ? "?" : context.getClass().getSimpleName();
    }

    /**
     * logcat に出し、ログのオプションがオンなら Download/AutoExpand/AutoExpand-Log.txt にも書く。
     * logcat は古いものから消える仕組みで、X が数分で埋めてしまうので、何日か後に見つかった
     * ギャップの調査には使えない。
     */
    static void record(String message) {
        Log.i(TAG, message);
        if (!logToFile()) return;
        final long at = System.currentTimeMillis();
        writer.execute(() -> {
            try {
                String stamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US).format(new Date(at));
                writeLog(stamp, message);
            } catch (Throwable ex) {
                Log.e(TAG, "log write failed", ex);
            }
        });
    }

    /**
     * Android では、Download の下のファイルに書き込めるのは、それを作ったアプリだけで、
     * 入れ直したアプリは別のアプリとして扱われる。前のインストールが残したログや、上限に
     * 達したのに脇へよけられないログは使わず、次の番号の名前に移って、その先頭にそのことを
     * 書く。書き込みが気付かれないまま失敗し続けないためである。書き込みのスレッドでしか
     * 動かない。
     */
    private static void writeLog(String stamp, String message) {
        if (logUnavailable) return;
        String line = stamp + " " + message + "\n";
        if (logFile != null && append(logFile, line)) return;

        File dir = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS), LOG_DIR);
        if (!dir.exists()) dir.mkdirs();
        for (int n = 1; n <= LOG_FILE_NAMES; n++) {
            File file = new File(dir, n == 1 ? LOG_FILE : LOG_FILE_STEM + "-" + n + ".txt");
            String first = n == 1 ? line
                    : stamp + " log continues here: the files before it cannot be written to,"
                            + " as happens once X is installed again\n" + line;
            if (append(file, first)) {
                logFile = file;
                return;
            }
        }
        logUnavailable = true;
        Log.e(TAG, "no log file in " + dir + " can be written");
        showToast("診断ログを書き込めません（Download/AutoExpand）",
                "Cannot write the log (Download/AutoExpand)");
    }

    private static boolean append(File file, String text) {
        if (file.length() >= LOG_FILE_LIMIT_BYTES) {
            // 途中で切り詰めることはしない。脇へよけられない満杯のファイルは丸ごと残し、
            // ログは次の名前に移る。
            File previous = setAside(file);
            if (previous == null) return false;
            text = "--- the log started over at " + (LOG_FILE_LIMIT_BYTES / (1024 * 1024))
                    + " MB; the part before was kept as " + previous.getName() + " ---\n" + text;
        }
        try (FileOutputStream out = new FileOutputStream(file, true)) {
            out.write(text.getBytes(StandardCharsets.UTF_8));
            return true;
        } catch (Throwable ex) {
            return false;
        }
    }

    /**
     * 満杯のログの名前を ".old" の付いた名前に変える。前に残していたものとは入れ替える。
     *
     * @return 前のログ。名前を変えられなければ null。
     */
    private static File setAside(File file) {
        String name = file.getName();
        int dot = name.lastIndexOf('.');
        File previous = new File(file.getParentFile(), name.substring(0, dot) + ".old" + name.substring(dot));
        // 前のインストールが残したものは消せず、その場合は名前の変更も失敗する。
        if (previous.exists()) previous.delete();
        return file.renameTo(previous) ? previous : null;
    }
}
