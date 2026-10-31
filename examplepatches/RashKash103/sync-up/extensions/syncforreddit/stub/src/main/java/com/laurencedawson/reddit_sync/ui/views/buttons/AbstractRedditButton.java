package com.laurencedawson.reddit_sync.ui.views.buttons;

import android.content.Context;
import android.util.AttributeSet;

import androidx.appcompat.widget.AppCompatImageButton;

/**
 * What every button in the row under a comment is. Each one sets its own picture and colour in
 * {@code c()}, which is where the app themes it, and this is subclassed so that a button added
 * to that row is themed with the rest of them rather than beside them.
 *
 * <p>Compile only, and named as the app names it.
 */
public class AbstractRedditButton extends AppCompatImageButton {
    public AbstractRedditButton(Context context, AttributeSet attributes) {
        super(context, attributes);
    }

    /** The colour a button is drawn in, which follows the theme. */
    protected int a() {
        throw new UnsupportedOperationException("Stub");
    }

    /** Where a button gives itself its background, its picture and its colour. */
    protected void c() {
        throw new UnsupportedOperationException("Stub");
    }
}
