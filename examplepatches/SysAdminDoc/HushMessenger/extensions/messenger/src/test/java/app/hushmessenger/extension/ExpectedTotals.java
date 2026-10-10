package app.hushmessenger.extension;

/**
 * Settings-wide totals the tests check, kept in one place so a new control changes one line. They're set by hand on
 * purpose: a control that drops out has to show up here as a failing test.
 */
final class ExpectedTotals {
    static final int CONTROLS = 38;
    /** Copy setup for the default test install: one line per control plus its fixed header and status lines. */
    static final int SETUP_LINES = CONTROLS + 11;
    /** The same report with two recorded hook errors under its Hook errors heading. */
    static final int SETUP_LINES_WITH_ERRORS = SETUP_LINES + 3;

    /** The search status line when {@code visible} controls match. */
    static String shown(int visible) {
        return visible + " of " + CONTROLS + " installed controls";
    }

    private ExpectedTotals() {}
}
