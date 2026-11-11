package e.e.a;

/** Video-relative percent rectangles; overlapping rectangles form a union. */
public final class TapRegions141 {
    static final int ALL = 0, EDGES = 1, VERTICAL_EDGES = 2, CENTER = 3, CUSTOM = 4;
    static final int LEFT = 0, RIGHT = 1, TOP = 2, BOTTOM = 3;
    static final int LIMIT = 3;
    private static final String[] MODES = {"all", "edges", "top-bottom", "center"};

    final int mode;
    final int[][] ranges;

    private TapRegions141(int mode, int[][] ranges) {
        this.mode = mode;
        this.ranges = ranges;
    }

    static TapRegions141 preset(int mode) {
        if (mode == EDGES) return new TapRegions141(mode, new int[][]{{0, 15, 0, 100}, {85, 100, 0, 100}});
        if (mode == VERTICAL_EDGES) return new TapRegions141(mode, new int[][]{{0, 100, 0, 15}, {0, 100, 85, 100}});
        if (mode == CENTER) return new TapRegions141(mode, new int[][]{{30, 70, 0, 100}});
        return new TapRegions141(ALL, new int[][]{{0, 100, 0, 100}});
    }

    static TapRegions141 custom(int[][] ranges) {
        if (ranges.length < 1 || ranges.length > LIMIT) return preset(ALL);
        int[][] copy = new int[ranges.length][];
        for (int i = 0; i < ranges.length; i++) {
            int[] r = ranges[i];
            if (r.length != 4 || r[LEFT] < 0 || r[RIGHT] > 100 || r[LEFT] >= r[RIGHT]
                    || r[TOP] < 0 || r[BOTTOM] > 100 || r[TOP] >= r[BOTTOM]) return preset(ALL);
            copy[i] = r.clone();
        }
        return new TapRegions141(CUSTOM, copy);
    }

    static TapRegions141 parse(String value) {
        if (value == null || value.length() > 56) return preset(ALL);
        for (int i = 0; i < MODES.length; i++) if (MODES[i].equals(value)) return preset(i);
        boolean legacy = value.startsWith("custom:");
        if (!legacy && !value.startsWith("rects:")) return preset(ALL);
        String[] items = value.substring(legacy ? 7 : 6).split(",", -1);
        if (items.length > LIMIT) return preset(ALL);
        int[][] result = new int[items.length][4];
        for (int i = 0; i < items.length; i++) {
            String[] parts = items[i].split("-", -1);
            if (parts.length != (legacy ? 2 : 4)) return preset(ALL);
            for (int j = 0; j < parts.length; j++) {
                if (!parts[j].matches("[0-9]{1,3}")) return preset(ALL);
                result[i][j] = Integer.parseInt(parts[j]);
            }
            if (legacy) result[i][BOTTOM] = 100;
        }
        return custom(result);
    }

    String encode() {
        if (mode != CUSTOM) return MODES[mode];
        StringBuilder value = new StringBuilder("rects:");
        for (int i = 0; i < ranges.length; i++) {
            if (i > 0) value.append(',');
            int[] r = ranges[i];
            value.append(r[LEFT]).append('-').append(r[RIGHT]).append('-')
                    .append(r[TOP]).append('-').append(r[BOTTOM]);
        }
        return value.toString();
    }

    boolean contains(float x, float y, float width, float height, float minimumSize) {
        if (!(width > 0 && height > 0 && x >= 0 && x <= width && y >= 0 && y <= height)) return false;
        for (int[] r : ranges) {
            if (within(x, width, r[LEFT], r[RIGHT], minimumSize)
                    && within(y, height, r[TOP], r[BOTTOM], minimumSize)) return true;
        }
        return false;
    }

    private static boolean within(float value, float span, int from, int to, float minSize) {
        float min = Math.min(minSize, span * .25f);
        float start = span * from / 100f;
        float end = span * to / 100f;
        if (end - start < min) {
            start = Math.max(0, Math.min(span - min, (start + end - min) / 2));
            end = start + min;
        }
        return value >= start && value <= end;
    }
}
