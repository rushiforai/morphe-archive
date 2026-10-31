package com.laurencedawson.reddit_sync.ui.views.core;

import android.content.Context;
import android.widget.LinearLayout;

/**
 * A row in Sync's bottom sheet menus. Only the members the extension needs are declared.
 * The method names are Sync's own, obfuscated ones; the backing fields they assign
 * (mTitle, mIcon) kept their names, which is how they were identified.
 */
public class MaterialRow extends LinearLayout {
    public MaterialRow(Context context) {
        super(context);
    }

    /** Sets the row icon from a drawable resource. */
    public void d(int drawableResource) {
        throw new UnsupportedOperationException("Stub");
    }

    /** Sets the row title. */
    public void k(CharSequence title) {
        throw new UnsupportedOperationException("Stub");
    }
}
