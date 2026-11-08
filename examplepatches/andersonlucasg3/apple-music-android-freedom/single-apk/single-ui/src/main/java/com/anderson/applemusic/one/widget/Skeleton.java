package com.anderson.applemusic.one.widget;

import android.animation.ObjectAnimator;
import android.content.Context;
import android.view.View;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;

import com.anderson.applemusic.one.theme.Shapes;
import com.anderson.applemusic.one.theme.Tokens;

/**
 * Loading skeleton: the real layout's blocks painted in {@code #1C1C1E} with a slow alpha
 * pulse. It replaces the screen until the catalogue arrives, so the content never
 * "flashes" from empty to full.
 */
public final class Skeleton extends LinearLayout {

    private ObjectAnimator pulse;

    public Skeleton(Context context) {
        super(context);
        setOrientation(VERTICAL);
        setPadding(Tokens.dp(16), Tokens.dp(8), Tokens.dp(16), Tokens.dp(8));
    }

    public void start() {
        if (pulse != null) return;
        pulse = ObjectAnimator.ofFloat(this, "alpha", 0.45f, 0.95f);
        pulse.setDuration(900L);
        pulse.setRepeatMode(ObjectAnimator.REVERSE);
        pulse.setRepeatCount(ObjectAnimator.INFINITE);
        pulse.start();
    }

    public void stop() {
        if (pulse != null) {
            pulse.cancel();
            pulse = null;
            setAlpha(1f);
        }
    }

    private static View block(Context context, int widthPx, int heightPx, float radiusDp) {
        View view = new View(context);
        view.setBackground(Shapes.rounded(Tokens.SURFACE, radiusDp));
        view.setLayoutParams(new LinearLayout.LayoutParams(widthPx, heightPx));
        return view;
    }

    private static int textWidth() {
        return Math.round(Tokens.screenWidth() * (Tokens.wide() ? 0.22f : 0.5f));
    }

    private static int cardSize() {
        return Math.round(Tokens.screenWidth() * (Tokens.wide() ? 0.135f : 0.36f));
    }

    private void addShelfBlock(Context context) {
        LinearLayout.LayoutParams headerParams = new LinearLayout.LayoutParams(
                LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
        headerParams.topMargin = Tokens.dp(18);
        addView(block(context, textWidth(), Tokens.dp(24), 8f), headerParams);

        HorizontalScrollView scroll = new HorizontalScrollView(context);
        scroll.setHorizontalScrollBarEnabled(false);
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(HORIZONTAL);
        int size = cardSize();
        int count = Tokens.wide() ? 5 : 2;
        for (int i = 0; i < count; i++) {
            View card = block(context, size, size, Tokens.RADIUS_CARD);
            LinearLayout.LayoutParams cardParams = new LinearLayout.LayoutParams(size, size);
            cardParams.rightMargin = Tokens.dp(12);
            cardParams.topMargin = Tokens.dp(6);
            row.addView(card, cardParams);
        }
        scroll.addView(row);
        LinearLayout.LayoutParams scrollParams = new LinearLayout.LayoutParams(
                LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
        scrollParams.topMargin = Tokens.dp(4);
        addView(scroll, scrollParams);
    }

    /** Home shape: hero block plus two shelves. */
    public static Skeleton home(Context context) {
        Skeleton skeleton = new Skeleton(context);
        View hero = block(context, LayoutParams.MATCH_PARENT,
                Tokens.wide() ? Tokens.dp(280) : Tokens.dp(180), Tokens.RADIUS_CARD);
        skeleton.addView(hero);
        skeleton.addShelfBlock(context);
        skeleton.addShelfBlock(context);
        skeleton.start();
        return skeleton;
    }

    /** List shape: N rows, for Biblioteca/Rádio/Busca. */
    public static Skeleton rows(Context context, int count) {
        Skeleton skeleton = new Skeleton(context);
        for (int i = 0; i < count; i++) {
            View row = block(context, LayoutParams.MATCH_PARENT, Tokens.dp(68), Tokens.RADIUS_CONTROL);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    LayoutParams.MATCH_PARENT, Tokens.dp(68));
            params.bottomMargin = Tokens.dp(8);
            skeleton.addView(row, params);
        }
        skeleton.start();
        return skeleton;
    }
}
