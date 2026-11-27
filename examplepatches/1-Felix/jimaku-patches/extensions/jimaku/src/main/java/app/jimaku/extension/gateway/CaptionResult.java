package app.jimaku.extension.gateway;

import java.util.List;

import app.jimaku.extension.subtitles.Line;

/** A Standard job's lines, and the captions they were made from where the gateway sends them. */
public final class CaptionResult {
    public final List<Line> lines;
    /** The source track's language, or null where the answer has no original. */
    public final String originalLang;
    public final List<Line> originalLines;

    public CaptionResult(List<Line> lines, String originalLang, List<Line> originalLines) {
        this.lines = lines;
        this.originalLang = originalLang;
        this.originalLines = originalLines;
    }
}
