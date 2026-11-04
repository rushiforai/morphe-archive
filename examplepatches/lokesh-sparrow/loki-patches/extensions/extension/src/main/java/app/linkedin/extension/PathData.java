package app.linkedin.extension;

/**
 * Minimal SVG path data parser for Material icons: M L H V C S Z, absolute and relative.
 * Plain Java (no Android types) so it can be tested off device.
 */
final class PathData {

    interface Sink {
        void moveTo(float x, float y);

        void lineTo(float x, float y);

        void cubicTo(float x1, float y1, float x2, float y2, float x, float y);

        void close();
    }

    private PathData() {
    }

    static void parse(String data, Sink path) {
        Tokenizer t = new Tokenizer(data);
        char command = 'M';
        float x = 0, y = 0, startX = 0, startY = 0, lastCtrlX = 0, lastCtrlY = 0;
        boolean lastWasCubic = false;

        while (t.hasMore()) {
            if (t.peekCommand()) command = t.nextCommand();
            boolean rel = Character.isLowerCase(command);
            switch (Character.toUpperCase(command)) {
                case 'M': {
                    float nx = t.number() + (rel ? x : 0), ny = t.number() + (rel ? y : 0);
                    path.moveTo(nx, ny);
                    x = startX = nx;
                    y = startY = ny;
                    // Further pairs after a moveto are implicit linetos.
                    command = rel ? 'l' : 'L';
                    lastWasCubic = false;
                    break;
                }
                case 'L':
                    x = t.number() + (rel ? x : 0);
                    y = t.number() + (rel ? y : 0);
                    path.lineTo(x, y);
                    lastWasCubic = false;
                    break;
                case 'H':
                    x = t.number() + (rel ? x : 0);
                    path.lineTo(x, y);
                    lastWasCubic = false;
                    break;
                case 'V':
                    y = t.number() + (rel ? y : 0);
                    path.lineTo(x, y);
                    lastWasCubic = false;
                    break;
                case 'C': {
                    float x1 = t.number() + (rel ? x : 0), y1 = t.number() + (rel ? y : 0);
                    float x2 = t.number() + (rel ? x : 0), y2 = t.number() + (rel ? y : 0);
                    float ex = t.number() + (rel ? x : 0), ey = t.number() + (rel ? y : 0);
                    path.cubicTo(x1, y1, x2, y2, ex, ey);
                    lastCtrlX = x2;
                    lastCtrlY = y2;
                    x = ex;
                    y = ey;
                    lastWasCubic = true;
                    break;
                }
                case 'S': {
                    float x1 = lastWasCubic ? 2 * x - lastCtrlX : x;
                    float y1 = lastWasCubic ? 2 * y - lastCtrlY : y;
                    float x2 = t.number() + (rel ? x : 0), y2 = t.number() + (rel ? y : 0);
                    float ex = t.number() + (rel ? x : 0), ey = t.number() + (rel ? y : 0);
                    path.cubicTo(x1, y1, x2, y2, ex, ey);
                    lastCtrlX = x2;
                    lastCtrlY = y2;
                    x = ex;
                    y = ey;
                    lastWasCubic = true;
                    break;
                }
                case 'Z':
                    path.close();
                    x = startX;
                    y = startY;
                    lastWasCubic = false;
                    // Z takes no arguments; the next token must be a command.
                    if (t.hasMore() && !t.peekCommand()) throw new IllegalArgumentException("Bad path: " + data);
                    break;
                default:
                    throw new IllegalArgumentException("Unsupported path command " + command);
            }
        }
    }

    private static final class Tokenizer {
        private final String s;
        private int i;

        Tokenizer(String s) {
            this.s = s;
        }

        private void skipSeparators() {
            while (i < s.length() && (s.charAt(i) == ',' || Character.isWhitespace(s.charAt(i)))) i++;
        }

        boolean hasMore() {
            skipSeparators();
            return i < s.length();
        }

        boolean peekCommand() {
            skipSeparators();
            return i < s.length() && Character.isLetter(s.charAt(i));
        }

        char nextCommand() {
            skipSeparators();
            return s.charAt(i++);
        }

        float number() {
            skipSeparators();
            int start = i;
            if (i < s.length() && (s.charAt(i) == '-' || s.charAt(i) == '+')) i++;
            boolean dot = false;
            while (i < s.length()) {
                char c = s.charAt(i);
                if (Character.isDigit(c)) {
                    i++;
                } else if (c == '.' && !dot) {
                    dot = true;
                    i++;
                } else {
                    break;
                }
            }
            if (start == i) throw new IllegalArgumentException("Expected number at " + start + " in: " + s);
            return Float.parseFloat(s.substring(start, i));
        }
    }
}
