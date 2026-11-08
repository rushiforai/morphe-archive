package com.anderson.applemusic.one.widget;

import android.content.Context;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;

import com.anderson.applemusic.one.theme.Tokens;

/**
 * Horizontal shelf: section header, then a scrollable row of square cards. The row is
 * clipped-free so the focused card can scale 1.05 without being cut by the scroll view.
 */
public final class ShelfView extends LinearLayout {

    private final SectionHeader header;
    private final LinearLayout cards;

    public ShelfView(Context context, String title) {
        this(context, title, 0);
    }

    public ShelfView(Context context, String title, int icon) {
        super(context);
        setOrientation(VERTICAL);

        header = new SectionHeader(context, title, icon);
        addView(header);

        HorizontalScrollView scroll = new HorizontalScrollView(context);
        scroll.setHorizontalScrollBarEnabled(false);
        scroll.setClipChildren(false);
        scroll.setClipToPadding(false);
        cards = new LinearLayout(context);
        cards.setOrientation(HORIZONTAL);
        cards.setClipChildren(false);
        cards.setClipToPadding(false);
        cards.setPadding(0, Tokens.dp(4), 0, Tokens.dp(12));
        scroll.addView(cards, new HorizontalScrollView.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        LinearLayout.LayoutParams scrollParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        scrollParams.topMargin = Tokens.dp(8);
        addView(scroll, scrollParams);
    }

    public LinearLayout cards() {
        return cards;
    }

    public void setItemCount(int count) {
        header.setCount(count);
    }

    public void addCard(View card) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                card.getLayoutParams() != null
                        ? card.getLayoutParams().width : ViewGroup.LayoutParams.WRAP_CONTENT,
                card.getLayoutParams() != null
                        ? card.getLayoutParams().height : ViewGroup.LayoutParams.WRAP_CONTENT);
        params.rightMargin = Tokens.dp(12);
        cards.addView(card, params);
    }

    /** Explicit D-pad chain: left/right inside the row, down to the mini player. */
    public void linkFocus(int downId) {
        final View downTarget = downId == View.NO_ID ? null : getRootView().findViewById(downId);
        int count = cards.getChildCount();
        for (int i = 0; i < count; i++) {
            View child = cards.getChildAt(i);
            child.setId(View.generateViewId());
            if (i > 0) child.setNextFocusLeftId(cards.getChildAt(i - 1).getId());
            if (i < count - 1) child.setNextFocusRightId(cards.getChildAt(i + 1).getId());
            if (downId != View.NO_ID) child.setNextFocusDownId(downId);
            if (downTarget != null) {
                // Some TV focus searches ignore nextFocusDown when the target lives in an
                // overlay; consume DOWN here and move focus explicitly.
                child.setOnKeyListener(new View.OnKeyListener() {
                    @Override
                    public boolean onKey(View v, int keyCode, KeyEvent event) {
                        if (event.getAction() == KeyEvent.ACTION_DOWN
                                && keyCode == KeyEvent.KEYCODE_DPAD_DOWN
                                && downTarget.isShown() && downTarget.isFocusable()) {
                            downTarget.requestFocus();
                            return true;
                        }
                        return false;
                    }
                });
            }
        }
    }
}
