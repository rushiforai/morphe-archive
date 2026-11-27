package app.syncit.extension;

import android.text.SpannableString;
import android.text.Spanned;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * Moves the score line out of a post's description and into its own view at the bottom of the
 * smaller card, leaving the author line and the flair between it and the title.
 *
 * <p>Sync builds the author line and the score line as one piece of text, so the layout cannot
 * place the score under the flair by itself. The score keeps the spans it was drawn with, which
 * includes the score colour.
 *
 * @noinspection unused
 */
public final class CardScoreReorder {
    private static final String SCORE_TAG = "syncit_card_score";

    private CardScoreReorder() {}

    /**
     * Called after a post description has been drawn.
     *
     * @param description The description view, holding the author line and possibly a score line.
     */
    public static void split(TextView description) {
        if (description == null || !(description.getParent() instanceof ViewGroup)) {
            return;
        }

        TextView scoreView = findScoreView((ViewGroup) description.getParent());
        if (scoreView == null) {
            // Not the layout this patch rearranges.
            return;
        }

        CharSequence text = description.getText();
        if (!(text instanceof Spanned)) {
            hide(description, scoreView);
            return;
        }

        Spanned full = (Spanned) text;
        String plain = full.toString();
        int newline = plain.lastIndexOf('\n');
        if (newline < 0 || newline + 1 >= plain.length()) {
            // No score line on this post, or it was turned off.
            hide(description, scoreView);
            return;
        }

        int start = newline + 1;
        int end = plain.length();

        SpannableString score = new SpannableString(full.subSequence(start, end));
        for (Object span : full.getSpans(start, end, Object.class)) {
            int spanStart = Math.max(0, full.getSpanStart(span) - start);
            int spanEnd = Math.min(score.length(), full.getSpanEnd(span) - start);
            if (spanEnd <= spanStart) {
                continue;
            }
            try {
                score.setSpan(span, spanStart, spanEnd, full.getSpanFlags(span));
            } catch (Throwable ignored) {
                // A span this container cannot hold is dropped; the rest still draws.
            }
        }

        // Keep the author line, and everything standing over it, in the description.
        description.setText(full.subSequence(0, newline));

        scoreView.setTextSize(TypedValue.COMPLEX_UNIT_PX, description.getTextSize());
        scoreView.setTypeface(description.getTypeface());
        scoreView.setTextColor(description.getCurrentTextColor());
        scoreView.setPadding(
                description.getPaddingLeft(), 0, description.getPaddingRight(), 0);
        scoreView.setText(score);
        scoreView.setVisibility(View.VISIBLE);

        fillHeight(description, scoreView);
    }

    /**
     * Stretches the text block over the whole row, so the title sits at the top and the score at
     * the bottom. The author line and the flair take an equal share of the space between them.
     */
    private static void fillHeight(TextView description, TextView scoreView) {
        if (!(description.getParent() instanceof LinearLayout)) {
            return;
        }

        LinearLayout wrapper = (LinearLayout) description.getParent();
        View row = (View) wrapper.getParent();
        if (row == null) {
            return;
        }

        int scoreIndex = wrapper.indexOfChild(scoreView);
        if (scoreIndex <= 0) {
            return;
        }
        View flair = wrapper.getChildAt(scoreIndex - 1);

        agree(description, true);
        agree(flair, true);
        agree(scoreView, false);

        wrapper.setGravity(Gravity.TOP);

        // Measure the row from the content first, then pin the text block to that height.
        ViewGroup.LayoutParams wrapperParams = wrapper.getLayoutParams();
        wrapperParams.height = ViewGroup.LayoutParams.WRAP_CONTENT;
        wrapper.setLayoutParams(wrapperParams);

        row.post(() -> {
            int height = row.getHeight();
            if (height <= 0) {
                return;
            }
            ViewGroup.LayoutParams params = wrapper.getLayoutParams();
            if (params.height != height) {
                params.height = height;
                wrapper.setLayoutParams(params);
            }
        });
    }

    /** Gives a middle line a share of the leftover height, or none. */
    private static void agree(View view, boolean weighted) {
        if (!(view.getLayoutParams() instanceof LinearLayout.LayoutParams)) {
            return;
        }
        LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) view.getLayoutParams();
        params.height = ViewGroup.LayoutParams.WRAP_CONTENT;
        params.weight = weighted ? 1f : 0f;
        view.setLayoutParams(params);
        if (view instanceof TextView) {
            ((TextView) view).setGravity(weighted ? Gravity.CENTER_VERTICAL : Gravity.TOP);
        }
    }

    private static TextView findScoreView(ViewGroup parent) {
        for (int i = 0; i < parent.getChildCount(); i++) {
            View child = parent.getChildAt(i);
            if (child instanceof TextView && SCORE_TAG.equals(String.valueOf(child.getTag()))) {
                return (TextView) child;
            }
        }
        return null;
    }

    private static void hide(TextView description, TextView scoreView) {
        scoreView.setText("");
        scoreView.setVisibility(View.GONE);
        releaseHeight(description, scoreView);
    }

    /** Returns the row to its content height when there is no score line to anchor at the bottom. */
    private static void releaseHeight(TextView description, TextView scoreView) {
        if (!(description.getParent() instanceof LinearLayout)) {
            return;
        }

        LinearLayout wrapper = (LinearLayout) description.getParent();
        int scoreIndex = wrapper.indexOfChild(scoreView);
        if (scoreIndex <= 0) {
            return;
        }

        agree(description, false);
        agree(wrapper.getChildAt(scoreIndex - 1), false);
        agree(scoreView, false);
        wrapper.setGravity(Gravity.CENTER_VERTICAL);

        ViewGroup.LayoutParams params = wrapper.getLayoutParams();
        params.height = ViewGroup.LayoutParams.WRAP_CONTENT;
        wrapper.setLayoutParams(params);
    }
}
