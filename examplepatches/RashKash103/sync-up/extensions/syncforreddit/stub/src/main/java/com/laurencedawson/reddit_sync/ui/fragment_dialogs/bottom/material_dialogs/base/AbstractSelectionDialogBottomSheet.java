package com.laurencedawson.reddit_sync.ui.fragment_dialogs.bottom.material_dialogs.base;

/**
 * A sheet that offers a list of things to do. A comment's own menu is one of these.
 *
 * <p>Compile only, and named as the app names it.
 */
public class AbstractSelectionDialogBottomSheet {
    /** Adds an entry, and hands it back so it can be told apart when it is tapped. */
    public h t4(h entry) {
        throw new UnsupportedOperationException("Stub");
    }

    /** Closes the sheet, as every entry of Sync's own does once it has done what it does. */
    public void x3() {
        throw new UnsupportedOperationException("Stub");
    }

    /** One entry: a picture and what it says. */
    public static class h {
        public h(int picture, String says) {
            throw new UnsupportedOperationException("Stub");
        }

        /** @return What the entry says, which is how ours is told from the app's own. */
        public String b() {
            throw new UnsupportedOperationException("Stub");
        }
    }
}
