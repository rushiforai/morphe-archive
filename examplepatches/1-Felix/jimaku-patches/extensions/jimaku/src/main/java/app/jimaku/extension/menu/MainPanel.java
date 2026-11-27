package app.jimaku.extension.menu;

import java.util.Collections;
import java.util.List;

/** The menu's main sheet: the Premium switch, the languages under it, and what is below them. */
public final class MainPanel {
    public final boolean signedIn;
    /** The Premium switch: on or off. Signed out it is off. */
    public final boolean premium;
    /** Beside the switch: the minutes or "Standard, free"; signed out, nothing. */
    public final String value;
    public final List<LanguageRow> rows;
    /** Whether Other languages has anything to list. */
    public final boolean other;
    /** The one line in place of the languages where there is nothing to list or make, or null. */
    public final String note;
    /** Whether Original caption has something to show. */
    public final boolean original;

    MainPanel(boolean signedIn, boolean premium, String value, List<LanguageRow> rows, boolean other, String note, boolean original) {
        this.signedIn = signedIn;
        this.premium = premium;
        this.value = value;
        this.rows = Collections.unmodifiableList(rows);
        this.other = other;
        this.note = note;
        this.original = original;
    }
}
