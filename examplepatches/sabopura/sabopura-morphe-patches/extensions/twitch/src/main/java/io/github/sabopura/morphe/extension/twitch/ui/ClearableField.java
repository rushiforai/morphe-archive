package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.Context;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

/** The house input: a rounded field with an icon before the text and a clear button once there is text. */
final class ClearableField extends LinearLayout {
    final EditText input;
    private final ImageView lead, clear;

    ClearableField(Context context, Ui ui, Icons.Kind icon, String hint) {
        super(context);
        setGravity(Gravity.CENTER_VERTICAL);
        setBackground(ui.field(context));
        setMinimumHeight(Ui.dp(context, 48));
        setPadding(Ui.dp(context, 14), 0, 0, 0);

        lead = ui.iconView(context, icon, ui.secondary, 18);
        lead.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        LayoutParams leadLp = new LayoutParams(Ui.dp(context, 18), Ui.dp(context, 18));
        leadLp.rightMargin = Ui.dp(context, 10);
        addView(lead, leadLp);

        input = new EditText(context);
        input.setSingleLine(true);
        input.setBackground(null);
        input.setHint(hint);
        input.setTextColor(ui.text);
        input.setHintTextColor(ui.secondary);
        input.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        input.setPadding(0, Ui.dp(context, 11), 0, Ui.dp(context, 11));
        input.setImportantForAutofill(View.IMPORTANT_FOR_AUTOFILL_NO);
        addView(input, new LayoutParams(0, LayoutParams.WRAP_CONTENT, 1));

        clear = ui.iconView(context, Icons.Kind.CLOSE, ui.secondary, 18);
        clear.setContentDescription(label("入力を消す", "Clear the text"));
        clear.setBackground(ui.pressable(context, 0, 24));
        clear.setVisibility(View.INVISIBLE);
        clear.setOnClickListener(v -> {
            input.setText("");
            input.requestFocus();
        });
        addView(clear, new LayoutParams(Ui.dp(context, 48), Ui.dp(context, 48)));

        input.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override
            public void afterTextChanged(Editable s) {
                clear.setVisibility(s.length() > 0 && input.isEnabled() ? View.VISIBLE : View.INVISIBLE);
            }
        });
    }

    String text() {
        return input.getText().toString();
    }

    /** Dims the contents rather than the row, whose own alpha the sheet animates as it opens. */
    @Override
    public void setEnabled(boolean enabled) {
        super.setEnabled(enabled);
        input.setEnabled(enabled);
        clear.setVisibility(enabled && input.length() > 0 ? View.VISIBLE : View.INVISIBLE);
        lead.setAlpha(enabled ? 1f : .5f);
        input.setAlpha(enabled ? 1f : .5f);
    }

    void showKeyboard() {
        input.requestFocus();
        InputMethodManager keyboard = (InputMethodManager) getContext().getSystemService(Context.INPUT_METHOD_SERVICE);
        if (keyboard != null) keyboard.showSoftInput(input, InputMethodManager.SHOW_IMPLICIT);
    }

    void hideKeyboard() {
        InputMethodManager keyboard = (InputMethodManager) getContext().getSystemService(Context.INPUT_METHOD_SERVICE);
        if (keyboard != null) keyboard.hideSoftInputFromWindow(input.getWindowToken(), 0);
    }
}
