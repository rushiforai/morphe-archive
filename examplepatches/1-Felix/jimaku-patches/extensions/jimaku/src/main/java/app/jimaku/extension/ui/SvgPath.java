package app.jimaku.extension.ui;

/**
 * Reads SVG path data, the form the extension's icons are kept in, into moves, lines, curves and
 * closes. Arcs become cubic curves. Plain Java, so the JVM tests can check it without Android.
 */
public final class SvgPath {
    /** Where a path goes. All coordinates are absolute. */
    public interface Sink {
        void moveTo(float x, float y);

        void lineTo(float x, float y);

        void quadTo(float x1, float y1, float x, float y);

        void cubicTo(float x1, float y1, float x2, float y2, float x, float y);

        void close();
    }

    private final String data;
    private int at;

    private SvgPath(String data) {
        this.data = data;
    }

    /** Sends {@code data} to {@code sink}. Throws IllegalArgumentException on data it can't read. */
    public static void parse(String data, Sink sink) {
        new SvgPath(data).run(sink);
    }

    private void run(Sink sink) {
        float x = 0, y = 0, startX = 0, startY = 0;
        // The last control point, for S and T, and which kind of curve set it.
        float controlX = 0, controlY = 0;
        char previous = ' ';
        char command = ' ';
        while (true) {
            skipSeparators();
            if (at >= data.length()) return;
            char c = data.charAt(at);
            if (Character.isLetter(c)) {
                command = c;
                at++;
            } else if (command == ' ') {
                throw new IllegalArgumentException("Path data starts without a command at " + at);
            }
            boolean relative = Character.isLowerCase(command);
            float baseX = relative ? x : 0, baseY = relative ? y : 0;
            switch (Character.toUpperCase(command)) {
                case 'M' -> {
                    x = baseX + number();
                    y = baseY + number();
                    startX = x;
                    startY = y;
                    sink.moveTo(x, y);
                    // Pairs after a move are lines.
                    command = relative ? 'l' : 'L';
                }
                case 'L' -> {
                    x = baseX + number();
                    y = baseY + number();
                    sink.lineTo(x, y);
                }
                case 'H' -> {
                    x = baseX + number();
                    sink.lineTo(x, y);
                }
                case 'V' -> {
                    y = baseY + number();
                    sink.lineTo(x, y);
                }
                case 'C' -> {
                    float x1 = baseX + number(), y1 = baseY + number();
                    float x2 = baseX + number(), y2 = baseY + number();
                    x = baseX + number();
                    y = baseY + number();
                    sink.cubicTo(x1, y1, x2, y2, x, y);
                    controlX = x2;
                    controlY = y2;
                }
                case 'S' -> {
                    boolean follows = "CcSs".indexOf(previous) >= 0;
                    float x1 = follows ? 2 * x - controlX : x, y1 = follows ? 2 * y - controlY : y;
                    float x2 = baseX + number(), y2 = baseY + number();
                    x = baseX + number();
                    y = baseY + number();
                    sink.cubicTo(x1, y1, x2, y2, x, y);
                    controlX = x2;
                    controlY = y2;
                }
                case 'Q' -> {
                    float x1 = baseX + number(), y1 = baseY + number();
                    x = baseX + number();
                    y = baseY + number();
                    sink.quadTo(x1, y1, x, y);
                    controlX = x1;
                    controlY = y1;
                }
                case 'T' -> {
                    boolean follows = "QqTt".indexOf(previous) >= 0;
                    float x1 = follows ? 2 * x - controlX : x, y1 = follows ? 2 * y - controlY : y;
                    x = baseX + number();
                    y = baseY + number();
                    sink.quadTo(x1, y1, x, y);
                    controlX = x1;
                    controlY = y1;
                }
                case 'A' -> {
                    float rx = number(), ry = number(), rotation = number();
                    boolean large = flag(), sweep = flag();
                    float endX = baseX + number(), endY = baseY + number();
                    arc(sink, x, y, rx, ry, rotation, large, sweep, endX, endY);
                    x = endX;
                    y = endY;
                }
                case 'Z' -> {
                    sink.close();
                    x = startX;
                    y = startY;
                }
                default -> throw new IllegalArgumentException("Unknown path command " + command + " at " + at);
            }
            previous = command;
        }
    }

    private void skipSeparators() {
        while (at < data.length()) {
            char c = data.charAt(at);
            if (c != ' ' && c != ',' && c != '\n' && c != '\t' && c != '\r') return;
            at++;
        }
    }

    private float number() {
        skipSeparators();
        int start = at;
        if (at < data.length() && (data.charAt(at) == '-' || data.charAt(at) == '+')) at++;
        boolean dot = false, digits = false;
        while (at < data.length()) {
            char c = data.charAt(at);
            if (c >= '0' && c <= '9') {
                digits = true;
                at++;
            } else if (c == '.' && !dot) {
                dot = true;
                at++;
            } else {
                break;
            }
        }
        if (at < data.length() && (data.charAt(at) == 'e' || data.charAt(at) == 'E')) {
            at++;
            if (at < data.length() && (data.charAt(at) == '-' || data.charAt(at) == '+')) at++;
            while (at < data.length() && Character.isDigit(data.charAt(at))) at++;
        }
        if (!digits) throw new IllegalArgumentException("Expected a number at " + start + " in path data");
        return Float.parseFloat(data.substring(start, at));
    }

    /** An arc's flag: a single 0 or 1, which SVG lets stand without a separator. */
    private boolean flag() {
        skipSeparators();
        if (at >= data.length()) throw new IllegalArgumentException("Expected an arc flag at " + at);
        char c = data.charAt(at++);
        if (c != '0' && c != '1') throw new IllegalArgumentException("Expected an arc flag at " + (at - 1));
        return c == '1';
    }

    /** SVG's endpoint arc as cubic curves of at most a quarter turn each (SVG 1.1, appendix F.6). */
    private static void arc(Sink sink, float x1, float y1, float rx, float ry, float rotationDegrees,
                            boolean large, boolean sweep, float x2, float y2) {
        if (x1 == x2 && y1 == y2) return;
        rx = Math.abs(rx);
        ry = Math.abs(ry);
        if (rx == 0 || ry == 0) {
            sink.lineTo(x2, y2);
            return;
        }
        double phi = Math.toRadians(rotationDegrees);
        double cos = Math.cos(phi), sin = Math.sin(phi);
        double dx = (x1 - x2) / 2.0, dy = (y1 - y2) / 2.0;
        double x1p = cos * dx + sin * dy, y1p = -sin * dx + cos * dy;
        double lambda = (x1p * x1p) / (rx * rx) + (y1p * y1p) / (ry * ry);
        double rxd = rx, ryd = ry;
        if (lambda > 1) {
            rxd *= Math.sqrt(lambda);
            ryd *= Math.sqrt(lambda);
        }
        double num = rxd * rxd * ryd * ryd - rxd * rxd * y1p * y1p - ryd * ryd * x1p * x1p;
        double den = rxd * rxd * y1p * y1p + ryd * ryd * x1p * x1p;
        double coefficient = Math.sqrt(Math.max(0, num / den)) * (large == sweep ? -1 : 1);
        double cxp = coefficient * rxd * y1p / ryd, cyp = -coefficient * ryd * x1p / rxd;
        double cx = cos * cxp - sin * cyp + (x1 + x2) / 2.0, cy = sin * cxp + cos * cyp + (y1 + y2) / 2.0;
        double start = angle(1, 0, (x1p - cxp) / rxd, (y1p - cyp) / ryd);
        double delta = angle((x1p - cxp) / rxd, (y1p - cyp) / ryd, (-x1p - cxp) / rxd, (-y1p - cyp) / ryd);
        if (!sweep && delta > 0) delta -= 2 * Math.PI;
        else if (sweep && delta < 0) delta += 2 * Math.PI;

        int segments = (int) Math.ceil(Math.abs(delta) / (Math.PI / 2) - 1e-9);
        double step = delta / segments;
        double k = 4.0 / 3.0 * Math.tan(step / 4);
        double theta = start;
        for (int i = 0; i < segments; i++) {
            double c1 = Math.cos(theta), s1 = Math.sin(theta);
            double c2 = Math.cos(theta + step), s2 = Math.sin(theta + step);
            double[] p1 = point(cx, cy, rxd, ryd, cos, sin, c1 - k * s1, s1 + k * c1);
            double[] p2 = point(cx, cy, rxd, ryd, cos, sin, c2 + k * s2, s2 - k * c2);
            double[] p = i == segments - 1 ? new double[]{x2, y2} : point(cx, cy, rxd, ryd, cos, sin, c2, s2);
            sink.cubicTo((float) p1[0], (float) p1[1], (float) p2[0], (float) p2[1], (float) p[0], (float) p[1]);
            theta += step;
        }
    }

    private static double[] point(double cx, double cy, double rx, double ry, double cos, double sin, double u, double v) {
        return new double[]{cx + rx * u * cos - ry * v * sin, cy + rx * u * sin + ry * v * cos};
    }

    private static double angle(double ux, double uy, double vx, double vy) {
        return Math.atan2(ux * vy - uy * vx, ux * vx + uy * vy);
    }
}
