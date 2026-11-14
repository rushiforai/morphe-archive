package com.google.android.material.badge;

/**
 * The count drawn over a navigation item, which is how Sync shows unread messages on its inbox.
 *
 * <p>Material keeps the package and the class name but none of the members, and the names below
 * are the minifier's. They are declared in the order Sync itself calls them, and what each one
 * is for was read off the call it makes rather than guessed from the letter: Sync's own badge is
 * built by {@code MessageCountHelper}, and anything of ours that stands in for it calls these
 * with the same values so that a badge that has moved looks like the one that moved.
 *
 * <p>Compile only.
 */
public class BadgeDrawable {
    /** {@code setVisible(boolean)}. */
    public void L(boolean visible) {
        throw new UnsupportedOperationException("Stub");
    }

    /** {@code setMaxCharacterCount(int)}. Sync asks for three, so a four figure count elides. */
    public void E(int count) {
        throw new UnsupportedOperationException("Stub");
    }

    /** {@code setHorizontalOffset(int)}, in pixels. */
    public void I(int offset) {
        throw new UnsupportedOperationException("Stub");
    }

    /** {@code setVerticalOffset(int)}, in pixels. */
    public void B(int offset) {
        throw new UnsupportedOperationException("Stub");
    }

    /** {@code setNumber(int)}. What is drawn in the badge. */
    public void F(int number) {
        throw new UnsupportedOperationException("Stub");
    }

    /** {@code setBackgroundColor(int)}. */
    public void z(int color) {
        throw new UnsupportedOperationException("Stub");
    }

    /** {@code setBadgeTextColor(int)}. */
    public void A(int color) {
        throw new UnsupportedOperationException("Stub");
    }
}
