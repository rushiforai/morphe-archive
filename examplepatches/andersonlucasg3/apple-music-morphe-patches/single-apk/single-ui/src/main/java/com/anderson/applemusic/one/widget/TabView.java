package com.anderson.applemusic.one.widget;

import android.content.Context;
import android.view.Gravity;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.anderson.applemusic.one.theme.Inter;
import com.anderson.applemusic.one.theme.Shapes;
import com.anderson.applemusic.one.theme.Tokens;

/**
 * App-bar tab (Início / Rádio / Biblioteca): Inter 15 with an accent indicator under the
 * selected one, the car-app pattern. Focus adds a soft surface pill on TV.
 *
 * <p>The label width is measured explicitly and pinned: inside a horizontally scrolling
 * row the platform otherwise re-measures the single-line label with the row's leftover
 * width, which clipped longer titles ("Biblioteca"). Pinning keeps the full word.
 */
public final class TabView extends LinearLayout {

    private final TextView label;
    private final View indicator;

    public TabView(Context context, String text) {
        super(context);
        setOrientation(VERTICAL);
        setGravity(Gravity.CENTER);
        setPadding(Tokens.dp(12), Tokens.dp(6), Tokens.dp(12), Tokens.dp(2));
        setMinimumHeight(Tokens.dp(44));

        label = Inter.text(context, text, 15f, Inter.MEDIUM, Tokens.TEXT_DIM);
        label.setSingleLine(true);
        int textWidth = (int) Math.ceil(label.getPaint().measureText(text));
        int labelWidth = textWidth + Tokens.dp(2);
        label.setLayoutParams(new LinearLayout.LayoutParams(labelWidth,
                LayoutParams.WRAP_CONTENT));
        addView(label);
        setMinimumWidth(labelWidth + Tokens.dp(24));

        indicator = new View(context);
        indicator.setBackground(Shapes.rounded(Tokens.ACCENT, 2f));
        LinearLayout.LayoutParams indicatorParams =
                new LinearLayout.LayoutParams(Tokens.dp(22), Tokens.dp(3));
        indicatorParams.topMargin = Tokens.dp(5);
        addView(indicator, indicatorParams);

        Focus.attach(this, 10f, 0x00000000, Tokens.SURFACE, null);
    }

    public void setSelected(boolean selected) {
        label.setTextColor(selected ? Tokens.TEXT : Tokens.TEXT_DIM);
        label.setTypeface(Inter.of(selected ? Inter.SEMIBOLD : Inter.MEDIUM));
        indicator.setVisibility(selected ? View.VISIBLE : View.INVISIBLE);
    }
}
