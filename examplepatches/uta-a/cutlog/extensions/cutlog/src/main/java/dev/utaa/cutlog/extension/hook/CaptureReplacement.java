package dev.utaa.cutlog.extension.hook;

/** 差し替え後の動画のメタデータ。パッチが smali から直接読む。 */
public final class CaptureReplacement {
    public final long durationMs;
    public final int width;
    public final int height;
    public final boolean hasAudio;

    public CaptureReplacement(long durationMs, int width, int height, boolean hasAudio) {
        this.durationMs = durationMs;
        this.width = width;
        this.height = height;
        this.hasAudio = hasAudio;
    }

    @Override
    public String toString() {
        return width + "x" + height + ", " + durationMs + "ms, audio=" + hasAudio;
    }
}
