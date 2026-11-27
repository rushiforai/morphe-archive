package app.jimaku.extension.menu;

/** One language row of the menu: what it reads, and what a press on it does. */
public final class LanguageRow {
    /** What a row asks in place before a press does anything: the question, and what its ✓ is called. */
    public static final class Ask {
        public final String question;
        public final String yes;

        Ask(String question, String yes) {
            this.question = question;
            this.yes = yes;
        }
    }

    /** What pressing a row, or its question's ✓, does. */
    public enum Press { SHOW, HIDE, START, STOP, BUY, BUSY }

    public final String lang;
    public final Version version;
    /** The language in its own name. */
    public final String name;
    /** Beside the name: nothing where they are made, their step while they are, otherwise what making them costs. */
    public final String value;
    /** On screen, or being made. */
    public final boolean checked;
    /** The question a press asks first, or null. */
    public final Ask ask;
    public final Press press;

    LanguageRow(Subtitle subtitle, String name, String value, boolean checked, Ask ask, Press press) {
        this.lang = subtitle.lang;
        this.version = subtitle.version;
        this.name = name;
        this.value = value;
        this.checked = checked;
        this.ask = ask;
        this.press = press;
    }

    public Subtitle subtitle() {
        return new Subtitle(lang, version);
    }

    @Override
    public String toString() {
        return name + " " + version.id() + (value.isEmpty() ? "" : ": " + value) + (checked ? " ✓" : "") + " " + press;
    }
}
