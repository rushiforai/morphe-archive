/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.composer;

import android.content.Context;
import android.widget.AutoCompleteTextView;

import org.robolectric.RuntimeEnvironment;

/** Asks the hook the way Facebook's text box does, with a stand-in for the box. */
public final class TagSuggestionsForTests {
    private TagSuggestionsForTests() {
    }

    /**
     * A text box whose list of people can be made to look open, as Facebook's box overrides
     * dismissDropDown too. It counts the closes, and never needs a window.
     */
    public static final class Box extends AutoCompleteTextView {
        public boolean open;
        public int closes;
        public RuntimeException failure;

        public Box(Context context) {
            super(context);
        }

        @Override
        public boolean isPopupShowing() {
            if (failure != null) throw failure;
            return open;
        }

        @Override
        public void dismissDropDown() {
            closes++;
            open = false;
        }
    }

    public static Box box() {
        return new Box(RuntimeEnvironment.getApplication());
    }

    /**
     * A word without @, with Facebook's flag off, the way post and comment boxes ask. True when the
     * hook skipped the lookup, which is the switch changing what Facebook would have done.
     */
    public static boolean skipsAPlainWord() {
        return TagSuggestions.skipsWordWithoutAt(false, null);
    }

    /** The same question with a list of people still open from an earlier @. True when it was closed. */
    public static boolean closesAListLeftOpen() {
        Box box = box();
        box.open = true;
        TagSuggestions.skipsWordWithoutAt(false, box);
        return box.closes > 0;
    }
}
