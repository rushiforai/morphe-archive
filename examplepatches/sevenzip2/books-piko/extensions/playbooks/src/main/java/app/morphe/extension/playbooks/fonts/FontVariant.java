package app.morphe.extension.playbooks.fonts;

import java.util.Locale;

/** Faces a reader font family can declare with @font-face. */
public enum FontVariant {
    REGULAR("regular"),
    BOLD("bold"),
    ITALIC("italic"),
    BOLD_ITALIC("bold_italic");

    public final String key;

    FontVariant(String key) {
        this.key = key;
    }

    /** Variant of a bundled reader font file name, e.g. "literata-bold-italic.otf". */
    public static FontVariant ofFileName(String fileName) {
        String lower = fileName.toLowerCase(Locale.ROOT);
        boolean bold = lower.contains("bold");
        boolean italic = lower.contains("italic");
        if (bold && italic) return BOLD_ITALIC;
        if (bold) return BOLD;
        if (italic) return ITALIC;
        return REGULAR;
    }
}
