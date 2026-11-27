package app.jimaku.extension.menu;

import java.util.Collections;
import java.util.List;

/** Other languages: every language still to make, by name. */
public final class OtherPanel {
    /** Names the mode and what a language costs, once for the whole list. */
    public final String caption;
    public final List<LanguageRow> rows;

    OtherPanel(String caption, List<LanguageRow> rows) {
        this.caption = caption;
        this.rows = Collections.unmodifiableList(rows);
    }
}
