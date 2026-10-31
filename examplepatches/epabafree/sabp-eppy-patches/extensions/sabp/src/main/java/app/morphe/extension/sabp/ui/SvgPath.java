package app.morphe.extension.sabp.ui;

import android.graphics.Path;

/**
 * Minimal SVG path-data parser (M L H V C S Q T Z, absolute and relative). Enough for Material
 * Symbols, which use no arcs. Unknown commands end parsing (the icon draws what was read).
 */
final class SvgPath {
    private final String s;
    private int i;

    private SvgPath(String s) {
        this.s = s;
    }

    static Path parse(String d) {
        return new SvgPath(d).run();
    }

    private Path run() {
        Path p = new Path();
        float x = 0, y = 0, sx = 0, sy = 0, cx = 0, cy = 0; // current, subpath start, last control
        char cmd = 0, prev = 0;
        while (true) {
            skipSeparators();
            if (i >= s.length()) break;
            char ch = s.charAt(i);
            if (Character.isLetter(ch)) {
                cmd = ch;
                i++;
            } else if (cmd == 0) {
                break;
            }
            boolean rel = Character.isLowerCase(cmd);
            switch (Character.toUpperCase(cmd)) {
                case 'M': {
                    float nx = num(), ny = num();
                    if (rel) { nx += x; ny += y; }
                    p.moveTo(nx, ny);
                    x = sx = nx;
                    y = sy = ny;
                    cmd = rel ? 'l' : 'L'; // following pairs are line-tos
                    cx = x; cy = y;
                    break;
                }
                case 'L': {
                    float nx = num(), ny = num();
                    if (rel) { nx += x; ny += y; }
                    p.lineTo(nx, ny);
                    x = nx; y = ny; cx = x; cy = y;
                    break;
                }
                case 'H': {
                    float nx = num();
                    if (rel) nx += x;
                    p.lineTo(nx, y);
                    x = nx; cx = x; cy = y;
                    break;
                }
                case 'V': {
                    float ny = num();
                    if (rel) ny += y;
                    p.lineTo(x, ny);
                    y = ny; cx = x; cy = y;
                    break;
                }
                case 'C': {
                    float x1 = num(), y1 = num(), x2 = num(), y2 = num(), nx = num(), ny = num();
                    if (rel) { x1 += x; y1 += y; x2 += x; y2 += y; nx += x; ny += y; }
                    p.cubicTo(x1, y1, x2, y2, nx, ny);
                    cx = x2; cy = y2; x = nx; y = ny;
                    break;
                }
                case 'S': {
                    float x2 = num(), y2 = num(), nx = num(), ny = num();
                    if (rel) { x2 += x; y2 += y; nx += x; ny += y; }
                    char pu = Character.toUpperCase(prev);
                    float x1 = pu == 'C' || pu == 'S' ? 2 * x - cx : x;
                    float y1 = pu == 'C' || pu == 'S' ? 2 * y - cy : y;
                    p.cubicTo(x1, y1, x2, y2, nx, ny);
                    cx = x2; cy = y2; x = nx; y = ny;
                    break;
                }
                case 'Q': {
                    float x1 = num(), y1 = num(), nx = num(), ny = num();
                    if (rel) { x1 += x; y1 += y; nx += x; ny += y; }
                    p.quadTo(x1, y1, nx, ny);
                    cx = x1; cy = y1; x = nx; y = ny;
                    break;
                }
                case 'T': {
                    float nx = num(), ny = num();
                    if (rel) { nx += x; ny += y; }
                    char pu = Character.toUpperCase(prev);
                    float x1 = pu == 'Q' || pu == 'T' ? 2 * x - cx : x;
                    float y1 = pu == 'Q' || pu == 'T' ? 2 * y - cy : y;
                    p.quadTo(x1, y1, nx, ny);
                    cx = x1; cy = y1; x = nx; y = ny;
                    break;
                }
                case 'Z':
                    p.close();
                    x = sx; y = sy; cx = x; cy = y;
                    break;
                default:
                    return p;
            }
            prev = cmd;
        }
        return p;
    }

    private void skipSeparators() {
        while (i < s.length()) {
            char ch = s.charAt(i);
            if (ch == ' ' || ch == ',' || ch == '\n' || ch == '\t' || ch == '\r') i++;
            else break;
        }
    }

    private float num() {
        skipSeparators();
        int start = i;
        if (i < s.length() && (s.charAt(i) == '-' || s.charAt(i) == '+')) i++;
        boolean dot = false, exp = false;
        while (i < s.length()) {
            char ch = s.charAt(i);
            if (Character.isDigit(ch)) {
                i++;
            } else if (ch == '.' && !dot && !exp) {
                dot = true;
                i++;
            } else if ((ch == 'e' || ch == 'E') && !exp) {
                exp = true;
                i++;
                if (i < s.length() && (s.charAt(i) == '-' || s.charAt(i) == '+')) i++;
            } else {
                break;
            }
        }
        if (start == i) throw new IllegalArgumentException("number expected at " + i);
        return Float.parseFloat(s.substring(start, i));
    }
}
