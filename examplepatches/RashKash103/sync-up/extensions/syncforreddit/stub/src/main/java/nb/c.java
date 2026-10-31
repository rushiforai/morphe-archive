package nb;

/**
 * The span Sync draws a picture with, at the size it is given, fetching the picture itself.
 *
 * <p>This is what Sync uses where it wants the picture and nothing else — the marker beside a
 * translated line is drawn with one, and so is a Reddit preview whose address carries its size.
 * Its sibling draws a card instead: a small picture with the address beside it.
 *
 * <p>The size is settled when one is made and never changes, so it has to be the shape the
 * picture actually is.
 *
 * <p>Compile only, and named as the app names it. Only the constructor used is declared.
 */
public class c {
    public c(String link, int width, int height) {
        throw new UnsupportedOperationException("Stub");
    }

    /** @return How wide it draws. The height it keeps to itself. */
    public int e() {
        throw new UnsupportedOperationException("Stub");
    }
}
