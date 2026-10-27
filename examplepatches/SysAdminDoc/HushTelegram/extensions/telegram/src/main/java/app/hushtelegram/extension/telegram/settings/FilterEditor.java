/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.os.Build;
import android.preference.Preference;
import android.text.InputFilter;
import android.text.InputType;
import android.view.Gravity;
import android.view.View;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.util.List;
import java.util.function.BiFunction;
import java.util.function.Consumer;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.settings.StringSetting;
import app.hushtelegram.extension.telegram.misc.MessageFilters;

/**
 * The editor for one list of message filters: the list as text in a dialog, one filter a line.
 * Save checks every line first and keeps the dialog open on the first one that can't be used,
 * saying which and why, so what's saved is always a list the chat can use whole. The write is
 * done off the main thread, and the dialog closes once it has landed.
 *
 * <p>Below the list, Try runs a message the person types against the lines as they stand, saved or
 * not, and names the first line that would hide it. The message is never saved, logged or sent,
 * and closing the editor drops it.
 */
final class FilterEditor {
    static final String GROUPS = "action_message_filters_groups";
    static final String CHANNELS = "action_message_filters_channels";

    /** What Try runs on the list and the message, {@link #verdict} but for a test that needs it to break. */
    static volatile BiFunction<String, String, String> check = FilterEditor::verdict;

    private FilterEditor() {}

    /** What a list's row says under its title: how many filters it holds. */
    static String summary(StringSetting list) {
        int count = MessageFilters.lines(list.savedValue()).size();
        return count == 0 ? L10n.t("No filters yet.")
                : L10n.quantity(count, "%1$d filter.", "%1$d filters.", count);
    }

    /**
     * Why a list can't be saved, naming its first line that can't be used, or null when it can.
     * Lines count from one as the person sees them, blanks included.
     */
    @Nullable
    static String refusal(String typed) {
        String[] lines = typed.split("\r\n|\r|\n", -1);
        int filters = 0;
        long[] spent = new long[1];
        for (int i = 0; i < lines.length; i++) {
            String line = lines[i].trim();
            if (line.isEmpty()) continue;
            if (++filters > MessageFilters.MAX_FILTERS) {
                return L10n.f("A list holds up to %1$d filters.", MessageFilters.MAX_FILTERS);
            }
            MessageFilters.Problem problem = MessageFilters.problem(line, spent);
            if (problem == null) continue;
            switch (problem) {
                case TOO_LONG:
                    return L10n.f("Line %1$d is longer than %2$d characters.", i + 1, MessageFilters.MAX_FILTER_CHARS);
                case BROKEN:
                    return L10n.f("Line %1$d isn't a valid regex. Fix it or take off the slashes.", i + 1);
                default:
                    return L10n.f("Line %1$d may be slow on long messages. Try a simpler pattern.", i + 1);
            }
        }
        if (!MessageFilters.fits(MessageFilters.lines(typed))) {
            return L10n.t("This list is too long for a settings file. Remove a few lines.");
        }
        return null;
    }

    /**
     * What the lines typed so far would do to {@code sample} in a chat: the first one that would
     * hide it, read with the chat's own parser, flags and cut-offs, or why the list can't be tried,
     * in the words Save would use.
     */
    static String verdict(String typed, String sample) {
        if (sample.trim().isEmpty()) return L10n.t("Type a message to try the filters on.");
        String refused = refusal(typed);
        if (refused != null) return refused;
        List<String> lines = MessageFilters.lines(typed);
        if (lines.isEmpty()) return L10n.t("There are no filters to try yet.");
        int hit = MessageFilters.firstHiding(lines, sample);
        if (hit < 0) return L10n.t("No filter here would hide this message.");
        return L10n.f("Line %1$d would hide this message: %2$s", shownLine(typed, hit), L10n.isolate(lines.get(hit)));
    }

    /** The number the person sees beside the filter at {@code index}, blank lines counted. */
    private static int shownLine(String typed, int index) {
        String[] all = typed.split("\r\n|\r|\n", -1);
        for (int i = 0, filters = 0; i < all.length; i++) {
            if (all[i].trim().isEmpty()) continue;
            if (filters++ == index) return i + 1;
        }
        return index + 1;
    }

    /** Opens the editor over the settings page. The row's summary follows what's saved. */
    static AlertDialog open(Activity activity, Preference row, StringSetting list, String title) {
        EditText field = new EditText(HushTelegramPreferenceFragment.themed(activity));
        field.setId(android.R.id.edit);
        field.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE
                | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        field.setSingleLine(false);
        field.setMinLines(4);
        field.setMaxLines(12);
        field.setGravity(Gravity.TOP | Gravity.START);
        field.setHint(L10n.t("One filter a line"));
        field.setText(list.savedValue());
        EditorForm form = new EditorForm(field.getContext(), L10n.t("Text on a line matches wherever it appears in a message. A line in slashes, like "
                + "/crypto|airdrop/, is a regular expression. Case doesn't matter.") + " "
                + L10n.t("Try a message below to see which line would hide it. It isn't saved anywhere."));
        form.add(field, L10n.t("One filter a line"));

        // The sample stays out of the keyboard's learning, autofill, content capture and the screen's
        // saved state, so nothing of it outlives the dialog.
        EditText sample = new EditText(field.getContext());
        sample.setId(android.R.id.input);
        sample.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE
                | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        sample.setImeOptions(EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING);
        sample.setImportantForAutofill(View.IMPORTANT_FOR_AUTOFILL_NO);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            sample.setImportantForContentCapture(View.IMPORTANT_FOR_CONTENT_CAPTURE_NO);
        }
        sample.setSaveEnabled(false);
        sample.setFilters(new InputFilter[]{new InputFilter.LengthFilter(MessageFilters.MAX_TEXT)});
        sample.setSingleLine(false);
        sample.setMinLines(2);
        sample.setMaxLines(6);
        sample.setGravity(Gravity.TOP | Gravity.START);
        sample.setHint(L10n.t("Paste or type a message"));
        form.add(sample, L10n.t("Try a message"));
        TextView answer = form.answer();

        AlertDialog dialog = new AlertDialog.Builder(HushTelegramPreferenceFragment.themed(activity))
                .setTitle(title)
                .setView(form)
                .setPositiveButton(L10n.t("Save"), null)
                .setNeutralButton(L10n.t("Try"), null)
                .setNegativeButton(L10n.t("Cancel"), null)
                .show();
        ScreenColors.dialog(dialog);
        // The keyboard makes room rather than covering Save and Cancel.
        if (dialog.getWindow() != null) dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        // Set after show, so neither one closes the dialog on its own.
        Button tryIt = dialog.getButton(AlertDialog.BUTTON_NEUTRAL);
        tryIt.setOnClickListener(v -> {
            // A click can still reach the button while it waits, from a program or some accessibility paths.
            if (!tryIt.isEnabled()) return;
            String typed = field.getText().toString();
            String message = sample.getText().toString();
            // Tried off the main thread, since a full list against a long message can take a moment.
            // An answer for texts that have changed since, or for a dialog that's gone, isn't shown.
            Consumer<String> show = said -> {
                if (!dialog.isShowing() || !typed.equals(field.getText().toString())
                        || !message.equals(sample.getText().toString())) {
                    return;
                }
                answer.setText(said);
                answer.setVisibility(View.VISIBLE);
            };
            // One try at a time, so taps can't stack heavy checks on the shared workers. When they
            // have no room, the check isn't run here instead: on the main thread it could freeze
            // the screen.
            tryIt.setEnabled(false);
            boolean queued = Utils.runOnBackgroundThread(() -> {
                String said = null;
                try {
                    said = check.apply(typed, message);
                } catch (RuntimeException failure) {
                    Logger.printException(() -> "Could not try the filters", failure);
                } finally {
                    // A check that broke still gives Try back and says so, rather than leaving no answer.
                    String answered = said != null ? said : L10n.t("Couldn't try it now. Try again in a moment.");
                    Utils.runOnMainThread(() -> {
                        tryIt.setEnabled(true);
                        show.accept(answered);
                    });
                }
            });
            if (!queued) {
                tryIt.setEnabled(true);
                show.accept(L10n.t("Couldn't try it now. Try again in a moment."));
            }
        });
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            String typed = field.getText().toString();
            String refused = refusal(typed);
            if (refused != null) {
                form.refuse(field, refused);
                Utils.showToastLong(refused);
                return;
            }
            List<String> lines = MessageFilters.lines(typed);
            HushTelegramPreferenceFragment.save(dialog, () -> list.saveCommitted(MessageFilters.join(lines)), landed -> {
                if (!landed) {
                    Logger.printInfo(() -> "Message filters not saved: " + list.key);
                    String reason = L10n.t("Couldn't save the filters. Try again in a moment.");
                    form.refuse(field, reason);
                    Utils.showToastLong(reason);
                    return;
                }
                row.setSummary(summary(list));
                Utils.showToastShort(L10n.t("Filters saved."));
                dialog.dismiss();
            });
        });
        return dialog;
    }
}
