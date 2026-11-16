package app.onlynazril.extension.tiktok.ui;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.text.InputType;
import android.view.Gravity;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;
import android.widget.LinearLayout;

/**
 * A text field, built through a small builder.
 *
 * The look is the one the screen already had: the outlined pill, hairline border, dim hint. What
 * changed is that the shape is drawn alone, without the button's ripple, so pressing a field does
 * not flash like pressing a button. The builder keeps the four fields (search, pattern, number,
 * range) on one code path, so a later palette change lands everywhere at once.
 */
public final class TextField {
    private TextField() {}

    public static Builder create(Context context) {
        return new Builder(context);
    }

    /** Fluent setup; only the values a caller needs are set. */
    public static final class Builder {
        private final Context context;
        private String hint;
        private String text;
        private int inputType =
                InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS;
        private int imeOptions = EditorInfo.IME_ACTION_DONE;
        private int widthDp = -1;
        private int heightDp = 44;
        private int horizontalPaddingDp = Tokens.SPACE_2;
        private boolean centered = true;

        Builder(Context context) {
            this.context = context;
        }

        public Builder hint(String value) {
            hint = value;
            return this;
        }

        public Builder text(String value) {
            text = value;
            return this;
        }

        public Builder inputType(int type) {
            inputType = type;
            return this;
        }

        public Builder imeOptions(int options) {
            imeOptions = options;
            return this;
        }

        /** A fixed width in dp; the default fills the row. */
        public Builder widthDp(int dp) {
            widthDp = dp;
            return this;
        }

        public Builder heightDp(int dp) {
            heightDp = dp;
            return this;
        }

        public Builder horizontalPaddingDp(int dp) {
            horizontalPaddingDp = dp;
            return this;
        }

        /** Left-aligned text; the default centres it in the pill. */
        public Builder alignStart() {
            centered = false;
            return this;
        }

        public EditText build() {
            EditText field = new EditText(context);
            field.setHint(hint);
            if (text != null) field.setText(text);
            field.setTextSize(Tokens.ACTION_SP);
            field.setTextColor(Tokens.TEXT_PRIMARY);
            field.setHintTextColor(Tokens.TEXT_DISABLED);
            field.setTypeface(Fonts.face(false));
            field.setSingleLine(true);
            field.setGravity(centered
                    ? Gravity.CENTER
                    : Gravity.CENTER_VERTICAL | Gravity.START);
            field.setInputType(inputType);
            field.setImeOptions(imeOptions);
            field.setPadding(
                    Tokens.dp(context, horizontalPaddingDp), 0,
                    Tokens.dp(context, horizontalPaddingDp), 0);
            field.setBackground(outline(context));
            field.setLayoutParams(new LinearLayout.LayoutParams(
                    widthDp > 0
                            ? Tokens.dp(context, widthDp)
                            : LinearLayout.LayoutParams.MATCH_PARENT,
                    Tokens.dp(context, heightDp)));
            return field;
        }
    }

    /** The pill without a ripple: a background, not a pressable control. */
    private static Drawable outline(Context context) {
        GradientDrawable shape = new GradientDrawable();
        shape.setShape(GradientDrawable.RECTANGLE);
        shape.setCornerRadius(Tokens.dp(context, 1000));
        shape.setColor(Tokens.PANEL);
        shape.setStroke(Tokens.dp(context, 1), Tokens.HAIRLINE);
        return shape;
    }
}
