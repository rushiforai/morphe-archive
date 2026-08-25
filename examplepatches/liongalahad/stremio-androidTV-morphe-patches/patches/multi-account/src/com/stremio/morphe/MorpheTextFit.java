package com.stremio.morphe;

import android.text.TextUtils;
import android.util.TypedValue;
import android.widget.TextView;

/** Fits one-line account labels without changing the stored account name. */
public final class MorpheTextFit {
    private static final float MIN_TEXT_SP = 10f;
    private static final float SIZE_STEP_SP = 0.5f;

    private MorpheTextFit() {}

    public static void apply(TextView view, String value, float maximumSp, int availableWidthPx) {
        String text = value == null ? "" : value;
        boolean fits = false;
        for (float sizeSp = maximumSp; sizeSp >= MIN_TEXT_SP; sizeSp -= SIZE_STEP_SP) {
            view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sizeSp);
            if (view.getPaint().measureText(text) <= availableWidthPx) {
                fits = true;
                break;
            }
        }

        if (fits) {
            view.setText(text);
            return;
        }

        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, MIN_TEXT_SP);
        view.setText(TextUtils.ellipsize(text, view.getPaint(), availableWidthPx,
                TextUtils.TruncateAt.END));
    }
}
