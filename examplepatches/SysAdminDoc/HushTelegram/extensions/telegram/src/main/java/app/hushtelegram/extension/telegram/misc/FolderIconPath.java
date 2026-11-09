/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

/**
 * Reads the path data of an SVG drawing (the {@code d} of a {@code path}) into drawing calls. It
 * knows the commands icon sets use: move, line, horizontal and vertical line, cubic curve,
 * smooth cubic curve, arc and close, each in both cases. Anything else is an error, so a bad
 * drawing is found by a test rather than drawn wrong.
 */
final class FolderIconPath {
    private FolderIconPath() {}

    /** Where the drawing calls go. */
    interface Sink {
        void moveTo(float x, float y);

        void lineTo(float x, float y);

        void cubicTo(float x1, float y1, float x2, float y2, float x, float y);

        void close();
    }

    /** Draws [data] into [sink], or throws {@link IllegalArgumentException} for data it can't read. */
    static void parse(String data, Sink sink) {
        Reader in = new Reader(data);
        float x = 0;
        float y = 0;
        float startX = 0;
        float startY = 0;
        // The second control point of the last cubic curve, which a smooth curve mirrors; NaN after anything else.
        float lastX = Float.NaN;
        float lastY = Float.NaN;
        char command = 0;
        boolean first = true;
        while (true) {
            in.skipSeparators();
            if (in.done()) break;
            char next = in.peek();
            if (Character.isLetter(next)) {
                command = next;
                in.advance();
                if (first && command != 'M' && command != 'm') throw new IllegalArgumentException("path doesn't start with a move");
                first = false;
                if (command == 'Z' || command == 'z') {
                    sink.close();
                    x = startX;
                    y = startY;
                    lastX = Float.NaN;
                    continue;
                }
            } else if (command == 0 || command == 'Z' || command == 'z') {
                throw new IllegalArgumentException("numbers without a command at " + in.position());
            }
            boolean relative = Character.isLowerCase(command);
            float baseX = relative ? x : 0;
            float baseY = relative ? y : 0;
            switch (Character.toUpperCase(command)) {
                case 'M': {
                    x = baseX + in.number();
                    y = baseY + in.number();
                    startX = x;
                    startY = y;
                    sink.moveTo(x, y);
                    // More pairs after a move are lines.
                    command = relative ? 'l' : 'L';
                    lastX = Float.NaN;
                    break;
                }
                case 'L': {
                    x = baseX + in.number();
                    y = baseY + in.number();
                    sink.lineTo(x, y);
                    lastX = Float.NaN;
                    break;
                }
                case 'H': {
                    x = baseX + in.number();
                    sink.lineTo(x, y);
                    lastX = Float.NaN;
                    break;
                }
                case 'V': {
                    y = baseY + in.number();
                    sink.lineTo(x, y);
                    lastX = Float.NaN;
                    break;
                }
                case 'C': {
                    float x1 = baseX + in.number();
                    float y1 = baseY + in.number();
                    float x2 = baseX + in.number();
                    float y2 = baseY + in.number();
                    x = baseX + in.number();
                    y = baseY + in.number();
                    sink.cubicTo(x1, y1, x2, y2, x, y);
                    lastX = x2;
                    lastY = y2;
                    break;
                }
                case 'S': {
                    float x1 = Float.isNaN(lastX) ? x : 2 * x - lastX;
                    float y1 = Float.isNaN(lastX) ? y : 2 * y - lastY;
                    float x2 = baseX + in.number();
                    float y2 = baseY + in.number();
                    x = baseX + in.number();
                    y = baseY + in.number();
                    sink.cubicTo(x1, y1, x2, y2, x, y);
                    lastX = x2;
                    lastY = y2;
                    break;
                }
                case 'A': {
                    float rx = in.number();
                    float ry = in.number();
                    float rotation = in.number();
                    boolean large = in.flag();
                    boolean sweep = in.flag();
                    float toX = baseX + in.number();
                    float toY = baseY + in.number();
                    arc(sink, x, y, rx, ry, rotation, large, sweep, toX, toY);
                    x = toX;
                    y = toY;
                    lastX = Float.NaN;
                    break;
                }
                default:
                    throw new IllegalArgumentException("unknown command " + command);
            }
        }
        if (first) throw new IllegalArgumentException("empty path");
    }

    /** An arc between two points as cubic curves of a quarter turn or less (SVG 1.1, appendix F.6). */
    private static void arc(Sink sink, float x0, float y0, float rxIn, float ryIn, float rotation,
                            boolean large, boolean sweep, float x, float y) {
        if (x0 == x && y0 == y) return;
        double rx = Math.abs(rxIn);
        double ry = Math.abs(ryIn);
        if (rx == 0 || ry == 0) {
            sink.lineTo(x, y);
            return;
        }
        double phi = Math.toRadians(rotation % 360);
        double cos = Math.cos(phi);
        double sin = Math.sin(phi);
        double dx = (x0 - x) / 2.0;
        double dy = (y0 - y) / 2.0;
        double x1 = cos * dx + sin * dy;
        double y1 = -sin * dx + cos * dy;
        double scale = x1 * x1 / (rx * rx) + y1 * y1 / (ry * ry);
        if (scale > 1) {
            double root = Math.sqrt(scale);
            rx *= root;
            ry *= root;
        }
        double rx2 = rx * rx;
        double ry2 = ry * ry;
        double numerator = rx2 * ry2 - rx2 * y1 * y1 - ry2 * x1 * x1;
        double denominator = rx2 * y1 * y1 + ry2 * x1 * x1;
        double coefficient = (large == sweep ? -1 : 1) * Math.sqrt(Math.max(0, numerator / denominator));
        double cxp = coefficient * rx * y1 / ry;
        double cyp = -coefficient * ry * x1 / rx;
        double cx = cos * cxp - sin * cyp + (x0 + x) / 2.0;
        double cy = sin * cxp + cos * cyp + (y0 + y) / 2.0;
        double start = Math.atan2((y1 - cyp) / ry, (x1 - cxp) / rx);
        double end = Math.atan2((-y1 - cyp) / ry, (-x1 - cxp) / rx);
        double sweepAngle = end - start;
        if (!sweep && sweepAngle > 0) sweepAngle -= 2 * Math.PI;
        else if (sweep && sweepAngle < 0) sweepAngle += 2 * Math.PI;
        int pieces = (int) Math.ceil(Math.abs(sweepAngle) / (Math.PI / 2) - 1e-9);
        double delta = sweepAngle / pieces;
        double t = 4.0 / 3.0 * Math.tan(delta / 4);
        for (int i = 0; i < pieces; i++) {
            double a1 = start + i * delta;
            double a2 = a1 + delta;
            double c1x = Math.cos(a1) - t * Math.sin(a1);
            double c1y = Math.sin(a1) + t * Math.cos(a1);
            double c2x = Math.cos(a2) + t * Math.sin(a2);
            double c2y = Math.sin(a2) - t * Math.cos(a2);
            double ex = Math.cos(a2);
            double ey = Math.sin(a2);
            sink.cubicTo(
                    (float) (cx + rx * cos * c1x - ry * sin * c1y), (float) (cy + rx * sin * c1x + ry * cos * c1y),
                    (float) (cx + rx * cos * c2x - ry * sin * c2y), (float) (cy + rx * sin * c2x + ry * cos * c2y),
                    i == pieces - 1 ? x : (float) (cx + rx * cos * ex - ry * sin * ey),
                    i == pieces - 1 ? y : (float) (cy + rx * sin * ex + ry * cos * ey));
        }
    }

    /** Reads numbers and flags the way path data writes them: separators optional wherever a number or flag can't run on. */
    private static final class Reader {
        private final String text;
        private int at;

        Reader(String text) {
            this.text = text;
        }

        boolean done() {
            return at >= text.length();
        }

        char peek() {
            return text.charAt(at);
        }

        void advance() {
            at++;
        }

        int position() {
            return at;
        }

        void skipSeparators() {
            while (at < text.length() && (Character.isWhitespace(text.charAt(at)) || text.charAt(at) == ',')) at++;
        }

        /** An arc flag: one character, 0 or 1, which may run straight into the next number. */
        boolean flag() {
            skipSeparators();
            if (done()) throw new IllegalArgumentException("flag missing at " + at);
            char c = text.charAt(at++);
            if (c != '0' && c != '1') throw new IllegalArgumentException("bad flag at " + (at - 1));
            return c == '1';
        }

        float number() {
            skipSeparators();
            int begin = at;
            if (at < text.length() && (text.charAt(at) == '-' || text.charAt(at) == '+')) at++;
            boolean dot = false;
            boolean digits = false;
            while (at < text.length()) {
                char c = text.charAt(at);
                if (c >= '0' && c <= '9') {
                    digits = true;
                } else if (c == '.' && !dot) {
                    dot = true;
                } else if ((c == 'e' || c == 'E') && digits) {
                    at++;
                    if (at < text.length() && (text.charAt(at) == '-' || text.charAt(at) == '+')) at++;
                    while (at < text.length() && Character.isDigit(text.charAt(at))) at++;
                    break;
                } else {
                    break;
                }
                at++;
            }
            if (!digits) throw new IllegalArgumentException("number expected at " + begin);
            return Float.parseFloat(text.substring(begin, at));
        }
    }
}
