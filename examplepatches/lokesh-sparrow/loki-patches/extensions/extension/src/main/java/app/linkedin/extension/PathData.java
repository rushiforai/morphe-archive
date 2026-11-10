/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

/**
 * Draws the settings screen's Material icons from their SVG path data, so no image resources are
 * needed. Supports the subset of the SVG path grammar Material icons use: M L H V C S Z, in both
 * absolute and relative form. Kept free of Android types so it can be exercised on a desktop JVM.
 */
final class PathData {

    /** Receives the drawing commands in path order; coordinates are in the 24x24 icon viewport. */
    interface Sink {
        void moveTo(float x, float y);

        void lineTo(float x, float y);

        void cubicTo(float x1, float y1, float x2, float y2, float x, float y);

        void close();
    }

    private PathData() {
    }

    /**
     * Walks the path data and replays it into {@code sink}. A malformed string throws
     * IllegalArgumentException; callers only pass their own built-in icon data.
     */
    static void parse(String data, Sink sink) {
        Reader reader = new Reader(data);
        // Data may start with coordinates only; those belong to a moveto by SVG rules.
        char verb = 'M';
        float x = 0, y = 0, startX = 0, startY = 0, controlX = 0, controlY = 0;
        boolean afterCubic = false;

        while (reader.hasMore()) {
            if (reader.atCommand()) verb = reader.takeCommand();
            boolean relative = Character.isLowerCase(verb);

            switch (Character.toUpperCase(verb)) {
                case 'M':
                    x = reader.coordinate(relative, x);
                    y = reader.coordinate(relative, y);
                    sink.moveTo(x, y);
                    startX = x;
                    startY = y;
                    // Any further coordinate pairs after a moveto are line tos.
                    verb = relative ? 'l' : 'L';
                    afterCubic = false;
                    break;
                case 'L':
                    x = reader.coordinate(relative, x);
                    y = reader.coordinate(relative, y);
                    sink.lineTo(x, y);
                    afterCubic = false;
                    break;
                case 'H':
                    x = reader.coordinate(relative, x);
                    sink.lineTo(x, y);
                    afterCubic = false;
                    break;
                case 'V':
                    y = reader.coordinate(relative, y);
                    sink.lineTo(x, y);
                    afterCubic = false;
                    break;
                case 'C': {
                    float x1 = reader.coordinate(relative, x);
                    float y1 = reader.coordinate(relative, y);
                    float x2 = reader.coordinate(relative, x);
                    float y2 = reader.coordinate(relative, y);
                    float endX = reader.coordinate(relative, x);
                    float endY = reader.coordinate(relative, y);
                    sink.cubicTo(x1, y1, x2, y2, endX, endY);
                    controlX = x2;
                    controlY = y2;
                    x = endX;
                    y = endY;
                    afterCubic = true;
                    break;
                }
                case 'S': {
                    // The first control point mirrors the previous cubic's second one.
                    float x1 = afterCubic ? 2 * x - controlX : x;
                    float y1 = afterCubic ? 2 * y - controlY : y;
                    float x2 = reader.coordinate(relative, x);
                    float y2 = reader.coordinate(relative, y);
                    float endX = reader.coordinate(relative, x);
                    float endY = reader.coordinate(relative, y);
                    sink.cubicTo(x1, y1, x2, y2, endX, endY);
                    controlX = x2;
                    controlY = y2;
                    x = endX;
                    y = endY;
                    afterCubic = true;
                    break;
                }
                case 'Z':
                    sink.close();
                    x = startX;
                    y = startY;
                    afterCubic = false;
                    // A close consumes no arguments, so a number here means broken data.
                    if (reader.hasMore() && !reader.atCommand()) {
                        throw new IllegalArgumentException("Bad path: " + data);
                    }
                    break;
                default:
                    throw new IllegalArgumentException("Unsupported path command " + verb);
            }
        }
    }

    /** Splits the path string into commands and numbers, treating commas as separators. */
    private static final class Reader {
        private final String data;
        private int index;

        Reader(String data) {
            this.data = data;
        }

        private void skipPadding() {
            while (index < data.length() && (data.charAt(index) == ',' || Character.isWhitespace(data.charAt(index)))) {
                index++;
            }
        }

        boolean hasMore() {
            skipPadding();
            return index < data.length();
        }

        /** Whether the next token is a command letter rather than a number. */
        boolean atCommand() {
            skipPadding();
            return index < data.length() && Character.isLetter(data.charAt(index));
        }

        char takeCommand() {
            skipPadding();
            return data.charAt(index++);
        }

        /** The next number, plus {@code base} when the command is relative. */
        float coordinate(boolean relative, float base) {
            float value = number();
            return value + (relative ? base : 0);
        }

        private float number() {
            skipPadding();
            int from = index;
            if (index < data.length() && (data.charAt(index) == '-' || data.charAt(index) == '+')) index++;
            boolean seenDot = false;
            while (index < data.length()) {
                char c = data.charAt(index);
                if (Character.isDigit(c)) {
                    index++;
                } else if (c == '.' && !seenDot) {
                    seenDot = true;
                    index++;
                } else {
                    break;
                }
            }
            if (from == index) throw new IllegalArgumentException("Expected number at " + from + " in: " + data);
            return Float.parseFloat(data.substring(from, index));
        }
    }
}
