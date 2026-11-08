package com.anderson.applemusic.one.widget;

import android.content.Context;
import android.view.Gravity;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.anderson.applemusic.one.theme.Inter;
import com.anderson.applemusic.one.theme.Tokens;

/**
 * Shelf/section header: 24 sp Inter 600 title plus a dim item count, the counterpart of
 * the companions' {@code ShelfHeader}.
 */
public final class SectionHeader extends LinearLayout {

    private final TextView count;

    public SectionHeader(Context context, String title) {
        this(context, title, 0);
    }

    /** Section title with an optional category glyph before it (Biblioteca). */
    public SectionHeader(Context context, String title, int icon) {
        super(context);
        setOrientation(HORIZONTAL);
        setGravity(Gravity.CENTER_VERTICAL);

        if (icon != 0) {
            IconView glyph = new IconView(context, icon, Tokens.TEXT_DIM);
            LinearLayout.LayoutParams glyphParams =
                    new LinearLayout.LayoutParams(Tokens.dp(21), Tokens.dp(21));
            glyphParams.rightMargin = Tokens.dp(9);
            glyphParams.topMargin = Tokens.dp(2);
            addView(glyph, glyphParams);
        }
        TextView label = Inter.text(context, title, Tokens.SECTION, Inter.BOLD, Tokens.TEXT);
        addView(label);
        count = Inter.text(context, "", 13f, Inter.REGULAR, Tokens.TEXT_DIM);
        LinearLayout.LayoutParams countParams = new LinearLayout.LayoutParams(
                LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
        countParams.leftMargin = Tokens.dp(10);
        addView(count, countParams);
    }

    public void setCount(int value) {
        count.setText(value > 0 ? String.valueOf(value) : "");
    }
}
