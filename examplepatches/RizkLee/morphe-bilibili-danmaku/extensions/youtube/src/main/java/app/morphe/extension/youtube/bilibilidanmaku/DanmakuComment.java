package app.morphe.extension.youtube.bilibilidanmaku;

/** A Bilibili comment at an absolute Bilibili timeline position (milliseconds). */
final class DanmakuComment implements Comparable<DanmakuComment> {
    final long timeMs;
    final int mode;
    final int color;
    final int fontSize;
    final String text;

    DanmakuComment(long timeMs, int mode, int color, int fontSize, String text) {
        this.timeMs = timeMs;
        this.mode = mode;
        this.color = color & 0xffffff;
        this.fontSize = fontSize;
        this.text = text;
    }

    @Override public int compareTo(DanmakuComment other) {
        return Long.compare(timeMs, other.timeMs);
    }
}
