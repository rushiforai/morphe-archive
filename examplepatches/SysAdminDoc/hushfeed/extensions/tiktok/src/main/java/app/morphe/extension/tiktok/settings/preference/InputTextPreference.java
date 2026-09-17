/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/377d4e15016296b45d809697f7f69bce74badd3a/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/settings/preference/InputTextPreference.java
 * Mirror, since GitHub blocks the original: https://gitlab.com/ReVanced/revanced-patches/-/blob/main/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/settings/preference/InputTextPreference.java
 */

package app.morphe.extension.tiktok.settings.preference;

import app.morphe.extension.tiktok.settings.L10n;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.preference.EditTextPreference;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.annotation.Nullable;

import app.morphe.extension.shared.settings.StringSetting;
import app.morphe.extension.shared.Utils;

@SuppressWarnings("deprecation")
public class InputTextPreference extends EditTextPreference {

    /**
     * Looks at what was typed and says what is wrong with it, or null when nothing is.
     *
     * <p>The message is shown as it is returned, so it is written for the reader and comes
     * from the translation table.
     */
    public interface Check {
        @Nullable
        String problem(String value);
    }

    @Nullable
    private Check check;

    /** The description, kept so the summary can be rebuilt when the value changes. */
    private final String baseSummary;

    /** How many characters of a value to show before truncating. */
    private static final int VALUE_DISPLAY_LIMIT = 60;

    public InputTextPreference(Context context, String title, String summary, StringSetting setting) {
        super(context);
        setTitle(title);
        // Already translated by withRestartNote, so not looked up a second time.
        baseSummary = TogglePreference.withRestartNote(context, summary, setting);
        setKey(setting.key);
        setText(setting.get());
        rebuildSummary();
    }

    /**
     * Puts the description and a trailing value line together.
     *
     * <p>The twenty text rows on the settings pages used to show only their description: the
     * only way to learn what was in them was to open the editor. A "Current: Empty" or
     * "Current: us" line underneath is the same thing the numeric rows already carry. A long
     * value (a list of blocked words, say) is cut to roughly sixty characters so it stays on
     * one line and the row stays a row rather than a paragraph.
     */
    private void rebuildSummary() {
        String value = getText();
        String shown;
        if (value == null || value.trim().isEmpty()) {
            shown = L10n.t(getContext(), "Empty");
        } else if (value.length() > VALUE_DISPLAY_LIMIT) {
            shown = value.substring(0, VALUE_DISPLAY_LIMIT).trim() + "…";
        } else {
            shown = value;
        }
        super.setSummary(baseSummary + "\n" + L10n.f(getContext(), "Current: %1$s", shown));
    }

    @Override
    public void setText(String text) {
        super.setText(text);
        // baseSummary is null during the super constructor's first setText call, before the
        // field is assigned. The constructor calls rebuildSummary afterwards.
        if (baseSummary != null) rebuildSummary();
    }

    /**
     * Refuses a value the field cannot use, while the dialog is still open and the reader is
     * still looking at it. Without this the value saves and goes wrong somewhere else: at the
     * next feed page, at the next save, or silently and never.
     */
    public InputTextPreference withCheck(Check check) {
        this.check = check;
        return this;
    }

    @Override
    public boolean callChangeListener(Object newValue) {
        if (check != null) {
            String problem = check.problem(newValue == null ? "" : newValue.toString());
            if (problem != null) {
                Utils.showToastLong(problem);
                return false;
            }
        }
        return super.callChangeListener(newValue);
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);

        app.morphe.extension.tiktok.Utils.setTitleAndSummaryColor(view);
    }

    @Override
    protected View onCreateDialogView() {
        Context context = getContext();
        LinearLayout dialogView = new LinearLayout(context);
        dialogView.setOrientation(LinearLayout.VERTICAL);
        int padding = SettingsUi.dp(context, 22);
        dialogView.setPadding(padding, padding, padding, SettingsUi.dp(context, 8));

        TextView title = SettingsUi.text(
                context,
                getTitle() == null ? "" : getTitle().toString(),
                20,
                SettingsUi.textPrimary(),
                android.graphics.Typeface.BOLD
        );
        SettingsUi.markDialogHeading(title);
        dialogView.addView(title, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        // The dialog shows only the description, not the "Current:" line that the row carries.
        // The editor below already shows the value, and repeating it above it would be two of
        // the same thing on one surface.
        if (baseSummary != null && !baseSummary.isEmpty()) {
            TextView summary = SettingsUi.text(
                    context,
                    baseSummary,
                    14,
                    SettingsUi.textSecondary(),
                    android.graphics.Typeface.NORMAL
            );
            // The summary scrolls and gives way, the box does not. A long summary at twice the
            // system text size used to take the whole dialog and squeeze the field it explains
            // down to nothing, which is the one part nobody can do without.
            android.widget.ScrollView scroller = new android.widget.ScrollView(context);
            scroller.setFillViewport(false);
            scroller.addView(summary, new android.widget.FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            ));
            LinearLayout.LayoutParams summaryParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f
            );
            summaryParams.setMargins(0, SettingsUi.dp(context, 14), 0, SettingsUi.dp(context, 10));
            dialogView.addView(scroller, summaryParams);
        }

        EditText editText = getEditText();
        ViewGroup parent = (ViewGroup) editText.getParent();
        if (parent != null) {
            parent.removeView(editText);
        }
        SettingsUi.styleEditText(editText);
        SettingsUi.labelEditor(title, editText);
        dialogView.addView(editText, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        return dialogView;
    }

    @Override
    protected void onPrepareDialogBuilder(AlertDialog.Builder builder) {
        builder.setPositiveButton(L10n.t(getContext(), "Save"), (dialog, which)
                -> this.onClick(dialog, DialogInterface.BUTTON_POSITIVE));
        builder.setNegativeButton(android.R.string.cancel, null);
    }

    @Override
    protected void showDialog(Bundle state) {
        super.showDialog(state);
        SettingsUi.styleFramedDialog(getDialog());
        // Rejecting a value used to close the dialog and then say why, so the reader reopened
        // the row and typed it again. Save now answers before it closes, and the answer sits
        // under the field rather than over the screen the dialog just left.
        SettingsUi.keepOpenOnInvalidInput(getDialog(), new SettingsUi.DialogCheck() {
            @Override public String problem() {
                return check == null
                        ? null
                        : check.problem(String.valueOf(getEditText().getText()));
            }

            @Override public void report(String problem) {
                SettingsUi.reportFieldError(getEditText(), problem);
            }

            @Override public boolean accept() {
                return saveTypedValue();
            }
        });
    }

    /**
     * What EditTextPreference.onDialogClosed(true) does, with the listener's answer kept rather
     * than thrown away, and reached from both the Save button and the platform's own dismiss.
     */
    private boolean saveTypedValue() {
        String typed = String.valueOf(getEditText().getText());
        if (!callChangeListener(typed)) return false;
        setText(typed);
        return true;
    }

    @Override
    protected void onDialogClosed(boolean positiveResult) {
        if (positiveResult) saveTypedValue();
    }

    @Override
    public void setTitle(CharSequence title) {
        super.setTitle(L10n.t(getContext(), title));
    }

    @Override
    public void setSummary(CharSequence summary) {
        super.setSummary(L10n.t(getContext(), summary));
    }
}
