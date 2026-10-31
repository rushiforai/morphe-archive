package oc;

/**
 * Sync's builder for the styled one line headers it draws above and below a comment. Text is
 * appended to it in the order it appears.
 *
 * <p>Compile only, and named as the app names it: the patch refers to this class by the same
 * descriptor, so the name is not ours to choose.
 */
public class c {
    /** Appends text to the line being built. */
    public void b(CharSequence text) {
        throw new UnsupportedOperationException("Stub");
    }

    /** Appends text carrying spans, which is how Sync colours the parts of a header. */
    public void c(String text, Object[] spans) {
        throw new UnsupportedOperationException("Stub");
    }

    /**
     * Drops every span standing over the text, keeping the text itself, and releases the image
     * loads any of them were waiting on.
     */
    public void p() {
        throw new UnsupportedOperationException("Stub");
    }
}
