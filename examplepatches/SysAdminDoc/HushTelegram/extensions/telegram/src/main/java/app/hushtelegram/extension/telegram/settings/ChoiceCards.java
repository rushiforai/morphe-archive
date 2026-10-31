/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushtelegram.extension.telegram.settings;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.text.SpannableStringBuilder;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.hushtelegram.extension.shared.L10n;

/**
 * A dialog's choices as inset cards, each with its name on top and what it does under it.
 *
 * <p>A card leaves getView() with its padding and its surface already on it, so the dialog's list
 * measures every row at the height it shows. Styling Android's own rows after the dialog was shown
 * (tried on 2026-09-26) reached rows the list had already measured without it: a 72 dp row cut the
 * second choice off at the normal text size, and at twice the size the buttons covered it.
 */
final class ChoiceCards extends BaseAdapter {
    private final ScreenColors colors;
    private final CharSequence[] names;
    private final CharSequence[] details;

    ChoiceCards(ScreenColors colors, CharSequence[] names, CharSequence[] details) {
        if (names.length != details.length) {
            throw new IllegalArgumentException(names.length + " choices and " + details.length + " details");
        }
        this.colors = colors;
        this.names = names.clone();
        this.details = details.clone();
    }

    @Override
    public int getCount() {
        return names.length;
    }

    /** A choice's name, and what it does on the line under it. */
    @Override
    public CharSequence getItem(int position) {
        return new SpannableStringBuilder(names[position]).append('\n').append(details[position]);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public boolean hasStableIds() {
        return true;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        Card card = convertView instanceof Card ? (Card) convertView : new Card(parent.getContext(), colors);
        card.name.setText(names[position]);
        card.detail.setText(details[position]);
        if (card.plain) card.plainBackground(colors, position + 1 == getCount());
        return card;
    }

    /** One choice on a card set in from the dialog's edges. */
    static final class Card extends LinearLayout {
        /** How far the card sits in from the list's sides, and from the next card. */
        static final int SIDE_INSET_DP = 16;
        static final int GAP_INSET_DP = 4;

        final TextView name;
        final TextView detail;
        /** Drawn in the plain look (#18): no card, a thin line between choices. */
        final boolean plain = ScreenColors.plainRows();

        Card(Context context, ScreenColors colors) {
            super(context);
            setOrientation(HORIZONTAL);
            setGravity(Gravity.CENTER_VERTICAL);
            int side = dp(context, SIDE_INSET_DP);
            int gap = dp(context, GAP_INSET_DP);
            if (plain) {
                plainBackground(colors, true);
            } else {
                GradientDrawable surface = new GradientDrawable();
                // The shared row surface, with its outline separating it from the dialog.
                surface.setColor(colors.card);
                surface.setStroke(dp(context, 1), colors.outline);
                surface.setCornerRadius(dp(context, ScreenColors.CARD_RADIUS));
                setBackground(new RippleDrawable(ColorStateList.valueOf(ScreenColors.half(colors.accent)),
                        new InsetDrawable(surface, side, gap, side, gap), null));
                // Set after the background, which puts its insets in as the padding.
                setPaddingRelative(side + dp(context, 16), gap + dp(context, 12),
                        side + dp(context, 16), gap + dp(context, 12));
                // 48 dp of card to tap at the least, at any text size.
                setMinimumHeight(2 * gap + dp(context, 48));
            }

            LinearLayout text = new LinearLayout(context);
            text.setOrientation(VERTICAL);
            addView(text, new LayoutParams(0, LayoutParams.WRAP_CONTENT, 1));

            name = new TextView(context);
            name.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
            name.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            name.setTextColor(colors.title);
            L10n.hyphenate(name);
            ScreenColors.Chevron chevron = new ScreenColors.Chevron(colors.summary, dp(context, 2));
            chevron.setBounds(0, 0, dp(context, 24), dp(context, 24));
            text.addView(name, new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));

            detail = new TextView(context);
            detail.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            detail.setTextColor(colors.summary);
            L10n.hyphenate(detail);
            LayoutParams under = new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
            under.topMargin = dp(context, 2);
            text.addView(detail, under);
            android.widget.ImageView arrow = new android.widget.ImageView(context);
            arrow.setImageDrawable(chevron);
            arrow.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            LayoutParams trailing = new LayoutParams(dp(context, 24), dp(context, 24));
            trailing.setMarginStart(dp(context, 8));
            addView(arrow, trailing);
            // A screen reader hears a button, and a double tap picks the choice through the list.
            setAccessibilityDelegate(new HushTelegramPreferenceFragment.RowSemantics(null, android.widget.Button.class));
        }

        /**
         * The dialog list's selector: nothing under a finger, which gets the card's own ripple, and
         * a ring around the card a keyboard or D-pad is on. Pressed comes first because a dialog's
         * list keeps focus in touch mode, so a tap reads focused too. The list draws it on top,
         * since the card's surface is opaque.
         */
        static Drawable focusRing(Context context, ScreenColors colors) {
            boolean plain = ScreenColors.plainRows();
            GradientDrawable ring = new GradientDrawable();
            ring.setColor(android.graphics.Color.TRANSPARENT);
            ring.setStroke(dp(context, 2), colors.accent);
            ring.setCornerRadius(plain ? 0 : dp(context, ScreenColors.CARD_RADIUS));
            int side = dp(context, plain ? 2 : SIDE_INSET_DP);
            int gap = dp(context, plain ? 2 : GAP_INSET_DP);
            StateListDrawable selector = new StateListDrawable();
            selector.addState(new int[]{android.R.attr.state_pressed}, new ColorDrawable(android.graphics.Color.TRANSPARENT));
            selector.addState(new int[]{android.R.attr.state_focused}, new InsetDrawable(ring, side, gap, side, gap));
            selector.addState(new int[]{}, new ColorDrawable(android.graphics.Color.TRANSPARENT));
            return selector;
        }

        /**
         * The plain look's background: the ripple over the whole choice, and a thin line under it
         * from where its text starts, unless it's the last one.
         */
        void plainBackground(ScreenColors colors, boolean last) {
            Context context = getContext();
            Drawable line = last ? new ColorDrawable(android.graphics.Color.TRANSPARENT)
                    : new ScreenColors.Divider(colors.outline, dp(context, 1), dp(context, 24));
            setBackground(new RippleDrawable(ColorStateList.valueOf(ScreenColors.half(colors.accent)), line,
                    new ColorDrawable(android.graphics.Color.WHITE)));
            // Set after the background, so a background's padding can't move the text.
            setPaddingRelative(dp(context, 24), dp(context, 14), dp(context, 24), dp(context, 14));
            setMinimumHeight(dp(context, 56));
        }

        private static int dp(Context context, int value) {
            return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                    context.getResources().getDisplayMetrics()));
        }
    }
}
