package app.wordfeudwordfinder.extension.ui;

/**
 * Decisions on pixels sampled from Wordfeud's own screen (see {@link ScreenSampler}). No android.* imports so it
 * stays JVM-testable.
 *
 * <p>Under: Flutter draws the board and its menus into one surface, so the button cannot sit between them. It is
 * made to look as if it lies under them instead: a pixel column of Wordfeud's screen just right of the button (the
 * page background, #D0D5DB light / #343B45 dark) is classified row by row. The scrim of a menu or dialog is
 * measured on the app bar (no menu comes there) and dims the button by the same amount; a row that is not the
 * background darkened by exactly that scrim (a menu sheet) covers the button, which is cut off from that row down.
 *
 * <p>Board: Wordfeud has a "dark board" option in light mode, so the board colours are classified from a pixel row
 * through the board (empty squares and grid gaps of either palette).
 *
 * <p>Elsewhere: without a scrim, a pixel row through the rack below the button must show rack tiles; otherwise
 * another page (chat, move history) lies over the game, which Wordfeud does not always report as a route, and the
 * button is hidden. The board may lie under the button (zoomed in); the rack is always there on the game screen.
 */
public final class ScreenShade {
    // Stateful only for the app bar baseline (see scrim()); everything else is static.
    /** Page background behind the button, light and dark theme. */
    public static final int PAGE_LIGHT = 0xD0D5DB;
    public static final int PAGE_DARK = 0x343B45;
    /** Max per-channel distance for a pixel to count as the (darkened) background. */
    static final int SCALED_TOLERANCE = 10;
    /** Max per-channel distance for a pixel to count as a board colour. */
    static final int TOLERANCE = 14;
    static final int MIN_VOTES = 6;

    private static final int[] LIGHT_BOARD = {0xC6D1D7, 0xACC0C7};
    private static final int[] DARK_BOARD = {0x2A2D32, 0x171A1F};

    /** Below this brightness (0..255) the app bar is too dark to measure a scrim on. */
    static final double MIN_BAR = 12;

    /** Without a scrim of at least this strength nothing is cut: Wordfeud's menus always come with a scrim. */
    static final double NO_SCRIM = 0.97;
    /** Share of the rack row that must be tile colour (one of seven tiles is about 14%). */
    static final double RACK_SHARE = 0.08;

    /**
     * How the button should look: per pixel column the rows [0, rows[x]) are shown (null: all), multiplied by
     * {@code factor} (1 = untouched).
     */
    public static final class Cover {
        /** Shown rows of the most covered column. */
        public final int visibleRows;
        /** Shown rows per pixel column of the button, or null when no column is cut. */
        public final int[] columnRows;
        public final float factor;
        /** Not on the game screen (another page lies over it, e.g. chat or move history): fully hidden. */
        public final boolean elsewhere;

        Cover(int visibleRows, float factor) {
            this(visibleRows, factor, false);
        }

        Cover(int visibleRows, float factor, boolean elsewhere) {
            this.visibleRows = visibleRows;
            this.columnRows = null;
            this.factor = factor;
            this.elsewhere = elsewhere;
        }

        Cover(int[] columnRows, int rows, float factor) {
            int min = Integer.MAX_VALUE;
            for (int r : columnRows) min = Math.min(min, r);
            boolean cut = min < rows;
            this.visibleRows = cut ? min : Integer.MAX_VALUE;
            this.columnRows = cut ? columnRows : null;
            this.factor = factor;
            this.elsewhere = false;
        }

        /** Shown rows of pixel column {@code x}. */
        public int rowsAt(int x) {
            if (columnRows == null) return visibleRows;
            if (columnRows.length == 0) return Integer.MAX_VALUE;
            return columnRows[Math.max(0, Math.min(columnRows.length - 1, x))];
        }

        public boolean untouched(int rows) {
            return visibleRows >= rows && factor >= 0.98f;
        }

        public boolean sameLook(Cover o) {
            return o != null && elsewhere == o.elsewhere && visibleRows == o.visibleRows && Math.abs(factor - o.factor) < 0.01f
                    && java.util.Arrays.equals(columnRows, o.columnRows);
        }
    }

    /**
     * Scrim strength (0..1 multiplier) from the app bar, where no menu ever comes: the sample against the brightest
     * app bar value seen on this screen. Call {@link #resetScrim()} for another game or theme.
     */
    private double brightestBar = -1;

    public void resetScrim() {
        brightestBar = -1;
    }

    public double scrim(int barRgb) {
        double b = brightness(barRgb & 0xFFFFFF);
        if (b > brightestBar) brightestBar = b;
        if (brightestBar < MIN_BAR) return 1.0;
        return Math.min(1.0, b / brightestBar);
    }

    /**
     * Classifies the column beside the button (one pixel per button row, top to bottom): a row that is the page
     * background {@code base} darkened by exactly the scrim {@code s} is free, anything else covers the button from
     * that row down. (A darkened-background test alone is not enough: the dark theme's menu sheet #2C3137 is close
     * to #343B45 at 82%.) Null when nothing is known.
     */
    public static Cover analyse(int[] column, int base, double s) {
        if (column == null || column.length == 0) return null;
        float factor = (float) Math.max(0.0, Math.min(1.0, s));
        for (int i = 0; i < column.length; i++) {
            if (!scaledFrom(column[i] & 0xFFFFFF, base, s)) return new Cover(i, factor);
        }
        return new Cover(column.length, factor);
    }

    /**
     * Like {@link #analyse} for the whole area under the button ({@code w} x {@code h} pixels, row-major), column by
     * column, so the button is cut along the real edge of a menu, rounded corners included. Columns are classified
     * every {@code step} pixels; the ones in between take the value of the nearest classified one. Without a scrim
     * nothing is cut (the area under the button may hold other things on some screens, never a menu without scrim).
     */
    public static Cover analyseArea(int[] px, int w, int h, int base, double s, int step) {
        return analyseArea(px, w, h, base, s, step, null);
    }

    /**
     * As {@link #analyseArea(int[], int, int, int, double, int)}, and without a scrim also checks {@code rackRow}, a
     * pixel row through the rack below the button: the game screen always shows the rack tiles there (also with
     * the board zoomed in), other pages over the game (chat, move history) do not. Null skips the check.
     */
    public static Cover analyseArea(int[] px, int w, int h, int base, double s, int step, int[] rackRow) {
        if (px == null || w <= 0 || h <= 0 || px.length < w * h) return null;
        float factor = (float) Math.max(0.0, Math.min(1.0, s));
        step = Math.max(1, step);
        if (s >= NO_SCRIM) {
            if (rackRow != null && !rackVisible(rackRow)) return new Cover(0, 1f, true);
            return new Cover(Integer.MAX_VALUE, factor);
        }
        int[] rows = new int[w];
        int[] sampled = new int[(w - 1) / step + 1];
        for (int i = 0; i < sampled.length; i++) {
            int x = Math.min(w - 1, i * step);
            int y = 0;
            while (y < h && scaledFrom(px[y * w + x] & 0xFFFFFF, base, s)) y++;
            sampled[i] = y;
        }
        for (int x = 0; x < w; x++) rows[x] = sampled[Math.min(sampled.length - 1, Math.round(x / (float) step))];
        return new Cover(rows, h, factor);
    }

    /** Whether a pixel row shows rack tiles: at least {@link #RACK_SHARE} of it in the warm cream tile colour. */
    public static boolean rackVisible(int[] row) {
        if (row == null || row.length == 0) return false;
        int tiles = 0;
        for (int p : row) if (tileColour(p & 0xFFFFFF)) tiles++;
        return tiles >= row.length * RACK_SHARE;
    }

    /**
     * Wordfeud's tile face: bright, nearly grey but warm (#F1EEE9, #FFF8F0). Cool whites (text, #EDF2F6) and the
     * light rack bar (#DEE3E7) have more blue than red and do not count.
     */
    static boolean tileColour(int p) {
        int r = (p >> 16) & 0xFF;
        int g = (p >> 8) & 0xFF;
        int b = p & 0xFF;
        return brightness(p) >= 205 && r - b >= 4 && r - b <= 48 && Math.abs(r - g) <= 16;
    }

    private static boolean scaledFrom(int p, int base, double r) {
        for (int shift = 0; shift <= 16; shift += 8) {
            double expect = ((base >> shift) & 0xFF) * r;
            if (Math.abs(((p >> shift) & 0xFF) - expect) > SCALED_TOLERANCE) return false;
        }
        return true;
    }

    static double brightness(int rgb) {
        int r = (rgb >> 16) & 0xFF;
        int g = (rgb >> 8) & 0xFF;
        int bl = rgb & 0xFF;
        return 0.299 * r + 0.587 * g + 0.114 * bl;
    }

    /** TRUE dark board, FALSE light board, null undecided (no board under the samples, or covered). */
    public static Boolean boardDark(int[] pixels) {
        if (pixels == null) return null;
        int dark = 0;
        int light = 0;
        for (int p : pixels) {
            if (matches(p, DARK_BOARD)) dark++;
            else if (matches(p, LIGHT_BOARD)) light++;
        }
        if (dark >= MIN_VOTES && dark > 2 * light) return Boolean.TRUE;
        if (light >= MIN_VOTES && light > 2 * dark) return Boolean.FALSE;
        return null;
    }

    private static boolean matches(int p, int[] palette) {
        for (int c : palette) {
            if (Math.abs(((p >> 16) & 0xFF) - ((c >> 16) & 0xFF)) <= TOLERANCE
                    && Math.abs(((p >> 8) & 0xFF) - ((c >> 8) & 0xFF)) <= TOLERANCE
                    && Math.abs((p & 0xFF) - (c & 0xFF)) <= TOLERANCE) {
                return true;
            }
        }
        return false;
    }
}
