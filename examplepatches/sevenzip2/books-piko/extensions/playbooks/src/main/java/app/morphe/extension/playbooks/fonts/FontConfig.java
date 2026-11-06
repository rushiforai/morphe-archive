package app.morphe.extension.playbooks.fonts;

import java.util.EnumSet;
import java.util.Locale;
import java.util.Set;

/** Immutable snapshot of the font settings, used by the request interceptor. */
public final class FontConfig {
    /** The reader's default family. "serif" and the publisher default fall back to it. */
    static final String DEFAULT_FAMILY_FILE_PREFIX = "literata";

    public final boolean replaceAllFamilies;
    public final boolean forceOverPublisherFonts;
    public final boolean keepMonospace;
    /** Draw bold text with a text stroke instead of relying on the WebView to synthesize it. */
    public final boolean strokeBold;
    /** Faces with a font file. Contains at least REGULAR when the custom font is active. */
    public final Set<FontVariant> availableVariants;

    public FontConfig(boolean replaceAllFamilies, boolean forceOverPublisherFonts, boolean keepMonospace,
                      boolean strokeBold, Set<FontVariant> availableVariants) {
        this.replaceAllFamilies = replaceAllFamilies;
        this.forceOverPublisherFonts = forceOverPublisherFonts;
        this.keepMonospace = keepMonospace;
        this.strokeBold = strokeBold;
        this.availableVariants = availableVariants.isEmpty()
                ? EnumSet.noneOf(FontVariant.class)
                : EnumSet.copyOf(availableVariants);
    }

    /** Whether the bundled reader font file belongs to a family that is replaced. */
    public boolean replaces(String readerFontFileName) {
        return replaceAllFamilies
                || readerFontFileName.toLowerCase(Locale.ROOT).startsWith(DEFAULT_FAMILY_FILE_PREFIX);
    }

    /** Cache key of everything that changes the rewritten compiled.js. */
    String signature() {
        return replaceAllFamilies + "|" + forceOverPublisherFonts + "|" + keepMonospace + "|" + strokeBold
                + "|" + availableVariants;
    }
}
