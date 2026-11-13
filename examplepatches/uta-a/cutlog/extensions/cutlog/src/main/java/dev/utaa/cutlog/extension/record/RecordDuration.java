package dev.utaa.cutlog.extension.record;

import android.content.Context;
import android.view.View;
import dev.utaa.cutlog.extension.editor.DurationButton;
import dev.utaa.cutlog.extension.hook.CaptureInterceptor;
import dev.utaa.cutlog.extension.pref.Feature;
import dev.utaa.cutlog.extension.pref.Prefs;

/**
 * 撮影する長さの選択。パッチが本体の録画設定（{@code CollectionCameraConfig.recordDurationMs}、公式は 2000ms）
 * を読む箇所すべての直後に {@link #recordDurationMs} を挟み、選んだ長さに置き換える。
 *
 * <p>本体はシャッターを押すと録画を始めてすぐ停止を要求し、この長さに達するまで録り続ける。
 * 停止要求から一定時間で強制的に止める予備のタイマー（公式は 2000ms 固定）も {@link #stopFallbackDelayMs} で延ばす。
 */
public final class RecordDuration {
    /** 公式の録画設定。これ以外の値（タイムラプス等）は置き換えない。 */
    private static final long OFFICIAL_RECORD_MS = 2000L;
    /** 予備のタイマーは、録画が自然に止まるより少し後に鳴らす。 */
    private static final long FALLBACK_MARGIN_MS = 1000L;

    /** 録画が止まらなかった場合でも、撮影ボタン類を使えなくするのはこの時間まで。 */
    private static final long BUSY_MARGIN_MS = 3000L;

    /** 録画を始めた時刻（elapsedRealtime）。録画していなければ 0。 */
    private static long recordingStartedAt;
    /** 録画を始めたときに選んでいた長さ。録画中に長さを変えても、この録画には影響させない。 */
    private static long recordingDurationMs = OFFICIAL_RECORD_MS;

    private RecordDuration() {}

    /** カメラのバックエンドが録画を始めるときに呼ばれる。 */
    public static void onRecordingStarted() {
        recordingDurationMs = selectedMs();
        recordingStartedAt = android.os.SystemClock.elapsedRealtime();
    }

    /** 録画結果が届いた、または撮影をやめたときに呼ばれる。 */
    public static void onRecordingFinished() {
        recordingStartedAt = 0;
    }

    /**
     * 録画中か。録画中に別の画面を開くと本体が録画を中断・破棄するため、cutlog のボタンはこの間使えなくする。
     * 録画の終わりを取りこぼした場合に備え、録画の長さ＋余裕を過ぎたら録画中とみなさない。
     */
    public static boolean isRecording() {
        if (recordingStartedAt == 0) {
            return false;
        }
        long elapsed = android.os.SystemClock.elapsedRealtime() - recordingStartedAt;
        return elapsed < recordingDurationMs + BUSY_MARGIN_MS;
    }

    /**
     * 選んでいる長さ（ミリ秒）。まだ Activity を見ていない、このパッチが当たっていない、または設定で OFF なら
     * 公式の長さ。
     */
    public static long selectedMs() {
        Context context = CaptureInterceptor.appContextOrNull();
        if (context == null || !Feature.RECORD_DURATION.isAvailable()
                || !Prefs.isEnabled(context, Feature.RECORD_DURATION)) {
            return OFFICIAL_RECORD_MS;
        }
        return Prefs.recordSeconds(context) * 1000L;
    }

    /** 本体が録画設定の長さを読んだ直後に呼ばれる。 */
    public static long recordDurationMs(long official) {
        if (official != OFFICIAL_RECORD_MS) {
            return official;
        }
        // 録画中は、録画を始めたときの長さで読み続ける（途中で設定を変えても録画と表示がずれないように）。
        return isRecording() ? recordingDurationMs : selectedMs();
    }

    /** 本体の予備の停止タイマーを仕掛ける直前に呼ばれる。 */
    public static long stopFallbackDelayMs(long official) {
        return Math.max(official, recordDurationMs(OFFICIAL_RECORD_MS) + FALLBACK_MARGIN_MS);
    }

    /** 撮影画面の View ができたときに呼ばれる。長さを選ぶボタンを足す。 */
    public static void onCameraViewCreated(View view) {
        Feature.RECORD_DURATION.markAvailable();
        try {
            DurationButton.attach(view);
        } catch (RuntimeException e) {
            android.util.Log.w(CaptureInterceptor.TAG, "Cannot add the duration button.", e);
        }
    }
}
