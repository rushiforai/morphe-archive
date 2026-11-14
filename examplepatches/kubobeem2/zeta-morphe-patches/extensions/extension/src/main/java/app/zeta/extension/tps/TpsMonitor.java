package app.zeta.extension.tps;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.util.concurrent.CopyOnWriteArrayList;

/**
 * LLMのストリーミング応答における t/s (Tokens per Second) をリアルタイム計測するクラス。
 */
public class TpsMonitor {
    private static final String TAG = "ZetaTpsMonitor";
    private static final TpsMonitor INSTANCE = new TpsMonitor();

    private final Handler mainHandler = new Handler(Looper.getMainLooper());
    private final CopyOnWriteArrayList<TpsListener> listeners = new CopyOnWriteArrayList<>();

    private volatile boolean isStreaming = false;
    private long streamStartTimeMs = 0;
    private long lastChunkTimeMs = 0;
    private int totalEstimatedTokens = 0;
    private float currentInstantTps = 0.0f;
    private float averageTps = 0.0f;

    public interface TpsListener {
        void onTpsUpdate(float instantTps, float avgTps, int totalTokens, float elapsedSec);
        void onStreamStart();
        void onStreamEnd(float finalAvgTps, int totalTokens, float totalSec);
    }

    public static TpsMonitor getInstance() {
        return INSTANCE;
    }

    public void init() {
        Log.i(TAG, "TpsMonitor initialized");
    }

    public void registerListener(TpsListener listener) {
        if (!listeners.contains(listener)) {
            listeners.add(listener);
        }
    }

    public void unregisterListener(TpsListener listener) {
        listeners.remove(listener);
    }

    /**
     * ストリーミング開始フック
     */
    public synchronized void onStreamStart() {
        isStreaming = true;
        streamStartTimeMs = System.currentTimeMillis();
        lastChunkTimeMs = streamStartTimeMs;
        totalEstimatedTokens = 0;
        currentInstantTps = 0.0f;
        averageTps = 0.0f;

        mainHandler.post(() -> {
            for (TpsListener listener : listeners) {
                listener.onStreamStart();
            }
        });
    }

    /**
     * ストリーミングチャンク（テキストまたはトークン差分）到着フック
     * @param chunkText 受信したテキストチャンク
     */
    public synchronized void onChunkReceived(String chunkText) {
        if (chunkText == null || chunkText.isEmpty()) return;

        if (!isStreaming) {
            onStreamStart();
        }

        long now = System.currentTimeMillis();
        int deltaTokens = estimateTokenCount(chunkText);
        totalEstimatedTokens += deltaTokens;

        long deltaMs = now - lastChunkTimeMs;
        if (deltaMs > 20) { // 20ms以上の差分があれば瞬間速度を算出
            currentInstantTps = (deltaTokens / (float) deltaMs) * 1000f;
            lastChunkTimeMs = now;
        }

        long totalElapsedMs = now - streamStartTimeMs;
        if (totalElapsedMs > 0) {
            averageTps = (totalEstimatedTokens / (float) totalElapsedMs) * 1000f;
        }

        final float instant = currentInstantTps;
        final float avg = averageTps;
        final int tokens = totalEstimatedTokens;
        final float elapsedSec = totalElapsedMs / 1000f;

        mainHandler.post(() -> {
            for (TpsListener listener : listeners) {
                listener.onTpsUpdate(instant, avg, tokens, elapsedSec);
            }
        });
    }

    /**
     * ストリーミング完了フック
     */
    public synchronized void onStreamEnd() {
        if (!isStreaming) return;
        isStreaming = false;

        long totalElapsedMs = System.currentTimeMillis() - streamStartTimeMs;
        float totalSec = totalElapsedMs / 1000f;
        if (totalSec > 0) {
            averageTps = totalEstimatedTokens / totalSec;
        }

        final float finalAvg = averageTps;
        final int tokens = totalEstimatedTokens;
        final float sec = totalSec;

        Log.i(TAG, String.format("Stream finished: %d tokens, %.2f sec, avg %.1f t/s", tokens, sec, finalAvg));

        mainHandler.post(() -> {
            for (TpsListener listener : listeners) {
                listener.onStreamEnd(finalAvg, tokens, sec);
            }
        });
    }

    /**
     * 日本語・英語混じりテキストのトークン数概算
     * 一般的なBPEモデル（cl100kやLlama系）の目安:
     * - 英単語/スペース: 約 0.75単語 = 1トークン (1文字約0.25〜0.33トークン)
     * - CJK文字 (漢字・ひらがな・カタカナ・ハングル): 1文字あたり約 1.0 〜 1.5 トークン
     */
    public static int estimateTokenCount(String text) {
        if (text == null || text.isEmpty()) return 0;

        int tokens = 0;
        int len = text.length();

        for (int i = 0; i < len; i++) {
            char c = text.charAt(i);
            Character.UnicodeBlock block = Character.UnicodeBlock.of(c);

            if (block == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS ||
                block == Character.UnicodeBlock.HIRAGANA ||
                block == Character.UnicodeBlock.KATAKANA ||
                block == Character.UnicodeBlock.HANGUL_SYLLABLES ||
                block == Character.UnicodeBlock.HANGUL_JAMO) {
                // CJK / ハングル文字: 1文字あたり約1.3トークンと仮定
                tokens += 2;
            } else if (Character.isWhitespace(c)) {
                tokens += 1;
            } else {
                tokens += 1;
            }
        }

        // 単純計算の補正 (英字密集時の過大計上を抑える)
        int estimated = Math.max(1, tokens / 2);
        return estimated;
    }

    public boolean isStreaming() {
        return isStreaming;
    }

    public float getAverageTps() {
        return averageTps;
    }

    public int getTotalEstimatedTokens() {
        return totalEstimatedTokens;
    }
}
