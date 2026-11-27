package app.jimaku.extension.subtitles;

/**
 * One subtitle line, in seconds from the start of the video. The text keeps the document's line
 * breaks.
 */
public final class Line {
    public final double start;
    public final double end;
    public final String text;

    public Line(double start, double end, String text) {
        this.start = start;
        this.end = end;
        this.text = text;
    }

    @Override
    public String toString() {
        return start + "-" + end + " " + text;
    }
}
