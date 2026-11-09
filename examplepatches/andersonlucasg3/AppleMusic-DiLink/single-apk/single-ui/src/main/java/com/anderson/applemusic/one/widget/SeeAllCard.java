package com.anderson.applemusic.one.widget;

import android.content.Context;
import android.view.Gravity;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.anderson.applemusic.one.theme.Inter;
import com.anderson.applemusic.one.theme.Shapes;
import com.anderson.applemusic.one.theme.Tokens;

/**
 * "Ver tudo" card that ends a shelf: dark surface, title, item count and a chevron.
 * Same footprint as the cover cards so the row keeps its rhythm.
 */
public final class SeeAllCard extends FrameLayout {

    public SeeAllCard(Context context, int itemCount, int sizePx) {
        super(context);
        setBackground(Shapes.rounded(Tokens.SURFACE, Tokens.RADIUS_CARD));
        Shapes.clip(this, Tokens.RADIUS_CARD);

        LinearLayout column = new LinearLayout(context);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setGravity(Gravity.CENTER);
        column.setPadding(Tokens.dp(16), Tokens.dp(16), Tokens.dp(16), Tokens.dp(16));

        TextView label = Inter.text(context, "Ver tudo", 16f, Inter.SEMIBOLD, Tokens.TEXT);
        column.addView(label);

        TextView count = Inter.text(context, itemCount > 0 ? itemCount + " itens" : "",
                Tokens.CAPTION, Inter.REGULAR, Tokens.TEXT_DIM);
        LinearLayout.LayoutParams countParams = new LinearLayout.LayoutParams(
                LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
        countParams.topMargin = Tokens.dp(4);
        column.addView(count, countParams);

        IconView chevron = new IconView(context, Icons.CHEVRON_RIGHT, Tokens.ACCENT);
        LinearLayout.LayoutParams chevronParams =
                new LinearLayout.LayoutParams(Tokens.dp(20), Tokens.dp(20));
        chevronParams.topMargin = Tokens.dp(12);
        column.addView(chevron, chevronParams);

        addView(column, new FrameLayout.LayoutParams(
                LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));

        Focus.attach(this, Tokens.RADIUS_CARD, Tokens.SURFACE, Tokens.SURFACE_HOVER, null);
        Focus.rippleOnTop(this, Tokens.RADIUS_CARD);
        setLayoutParams(new LinearLayout.LayoutParams(sizePx, sizePx));
        setContentDescription(itemCount > 0 ? "Ver tudo, " + itemCount + " itens" : "Ver tudo");
    }
}
