package da;

/**
 * The sheet Sync shows while it translates a post or a comment. It works the text out, asks for
 * a translation, writes what comes back where the app reads its text from, and closes itself.
 *
 * <p>Only the asking is replaced; everything else it does is what should happen. These are the
 * two ways back into it.
 *
 * <p>Compile only, and named as the app names it.
 */
public class d extends s9.f {
    /** Where a translation goes: the language it came from, and the text. */
    public static void x4(d sheet, String fromLanguage, String translated) {
        throw new UnsupportedOperationException("Stub");
    }

    /** Where a failure goes, which the sheet says and then closes. */
    public static void v4(d sheet, String said) {
        throw new UnsupportedOperationException("Stub");
    }
}
