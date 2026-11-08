package com.anderson.applemusic.one.widget;

import android.content.Context;
import android.view.Gravity;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.anderson.applemusic.one.theme.Inter;
import com.anderson.applemusic.one.theme.Tokens;

/**
 * Empty/error/offline state: icon, title, explanation and an optional action. Used by
 * Home, Biblioteca, Rádio, Busca and Atualizações so every failure looks deliberate
 * instead of leaving the canvas blank.
 */
public final class EmptyState extends LinearLayout {

    private final LinearLayout actions;

    public EmptyState(Context context, int icon, String title, String message) {
        super(context);
        setOrientation(VERTICAL);
        setGravity(Gravity.CENTER);
        setPadding(Tokens.dp(24), Tokens.dp(40), Tokens.dp(24), Tokens.dp(40));

        IconView iconView = new IconView(context, icon, Tokens.TEXT_DIM);
        iconView.setAlpha(0.65f);
        addView(iconView, new LinearLayout.LayoutParams(Tokens.dp(44), Tokens.dp(44)));

        TextView titleView = Inter.text(context, title, 18f, Inter.SEMIBOLD, Tokens.TEXT);
        titleView.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(
                LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
        titleParams.topMargin = Tokens.dp(16);
        addView(titleView, titleParams);

        TextView messageView = Inter.text(context, message, 14f, Inter.REGULAR, Tokens.TEXT_DIM);
        messageView.setGravity(Gravity.CENTER);
        messageView.setLineSpacing(Tokens.dp(3), 1f);
        LinearLayout.LayoutParams messageParams = new LinearLayout.LayoutParams(
                LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
        messageParams.topMargin = Tokens.dp(8);
        addView(messageView, messageParams);

        actions = new LinearLayout(context);
        actions.setOrientation(HORIZONTAL);
        actions.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams actionParams = new LinearLayout.LayoutParams(
                LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
        actionParams.topMargin = Tokens.dp(20);
        addView(actions, actionParams);
    }

    public void addAction(View button) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
        params.leftMargin = Tokens.dp(6);
        params.rightMargin = Tokens.dp(6);
        actions.addView(button, params);
    }
}
