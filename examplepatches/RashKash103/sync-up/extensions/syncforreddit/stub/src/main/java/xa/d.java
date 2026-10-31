package xa;

/**
 * The base of Sync's post and comment model. A class rather than an interface, so its methods
 * take invoke-virtual.
 *
 * <p>Compile only, and named as the app names it. Only what is read is declared.
 */
public abstract class d {
    /** @return What a row of a cursor over Sync's own store is about. */
    public static d z(android.database.Cursor from, int row) {
        throw new UnsupportedOperationException("Stub");
    }

    /** The id of the post this comment belongs to, with its type prefix. */
    public String j0() {
        throw new UnsupportedOperationException("Stub");
    }

    /** The id of the comment this one is a reply to, with its type prefix. */
    public String t0() {
        throw new UnsupportedOperationException("Stub");
    }

    /** The Reddit id of this comment or post, without its type prefix. */
    public String U() {
        throw new UnsupportedOperationException("Stub");
    }

    /** What kind of thing this is. A comment answers {@code 11}. */
    public int Y0() {
        throw new UnsupportedOperationException("Stub");
    }

    /**
     * A comment's text as it was written. What the app composes back into the written text
     * when it translates is built from this, so it is the markdown and not the rendering.
     */
    public String o() {
        throw new UnsupportedOperationException("Stub");
    }

    /** A post's text as it was written, for the same reason. */
    public String P0() {
        throw new UnsupportedOperationException("Stub");
    }

    /** A post's title, which is text a reader has to read whether or not there is a body. */
    public String b1() {
        throw new UnsupportedOperationException("Stub");
    }
}
