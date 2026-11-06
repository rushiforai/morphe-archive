/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.settings;

import android.content.Context;
import android.os.Build;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.EnumMap;
import java.util.EnumSet;
import java.util.Map;
import java.util.Set;

import app.hushtumblr.extension.shared.L10n;
import app.hushtumblr.extension.shared.settings.BooleanSetting;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.tumblr.timeline.PostRules.WordField;
import app.hushtumblr.extension.tumblr.timeline.WordPreview;

/**
 * The "Try it on a post" part of both word editors: a field for each part of a post the word
 * filter can read, and a line saying what the filter makes of what's typed there. It reads the
 * list in the editor as it stands, saved or not, the other list as saved, and the Match switches
 * as saved. While HushTumblr is paused it gives the word filter's answer for when it's back on,
 * and adds that the word filter hides nothing until then.
 *
 * <p>The example is never saved: its fields keep no state across a rebuild, the keyboard is asked
 * not to learn from them, autofill skips them, and nothing reads them but {@link WordPreview}.
 * Closing the editor drops them.
 */
final class WordPreviewSection {
    /** Tags on the result line, so a test can find it. */
    static final String RESULT_TAG = "hushtumblr_word_preview_result";
    static final String CLEAR_TAG = "hushtumblr_word_preview_clear";

    private WordPreviewSection() {
    }

    /** The Match switch that selects [field]. */
    static BooleanSetting switchFor(WordField field) {
        switch (field) {
            case CURRENT_TEXT: return Settings.WORDS_CURRENT_TEXT;
            case REBLOG_TRAIL: return Settings.WORDS_REBLOG_TRAIL;
            case TAGS: return Settings.WORDS_TAGS;
            default: return Settings.WORDS_SUMMARY;
        }
    }

    /** That switch's row title, which names it in the note under a field it leaves out. */
    private static String switchTitle(WordField field) {
        switch (field) {
            case CURRENT_TEXT: return L10n.t("Match current post text");
            case REBLOG_TRAIL: return L10n.t("Match reblog trail text");
            case TAGS: return L10n.t("Match current post tags");
            default: return L10n.t("Match post summaries");
        }
    }

    /** The field's label, which the result line names it by too. */
    static String label(WordField field) {
        switch (field) {
            case CURRENT_TEXT: return L10n.t("Post text");
            case REBLOG_TRAIL: return L10n.t("Reblog trail text");
            case TAGS: return L10n.t("Tags");
            default: return L10n.t("Summary");
        }
    }

    /**
     * The section under the editor whose list is in [list]. [editingAllowed] says which list that
     * is: Allowed words, with the words to hide as saved, or Words to hide, with the allowed words
     * as saved.
     */
    static View build(Context context, boolean editingAllowed, EditText list) {
        float density = context.getResources().getDisplayMetrics().density;
        LinearLayout section = new LinearLayout(context);
        section.setOrientation(LinearLayout.VERTICAL);
        section.setPaddingRelative(0, Math.round(20 * density), 0, 0);
        section.setImportantForAutofill(View.IMPORTANT_FOR_AUTOFILL_NO_EXCLUDE_DESCENDANTS);
        TextView heading = text(context, L10n.t("Try it on a post"), 14, ScreenColors.DEFAULT.heading);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) heading.setAccessibilityHeading(true);
        section.addView(heading);
        TextView note = text(context, L10n.t("Nothing you type here is saved."), 14, ScreenColors.DEFAULT.summary);
        note.setPaddingRelative(0, Math.round(4 * density), 0, 0);
        section.addView(note);
        Set<WordField> selected = EnumSet.noneOf(WordField.class);
        Map<WordField, EditText> inputs = new EnumMap<>(WordField.class);
        for (WordField field : WordField.values()) {
            boolean on = switchFor(field).savedValue();
            if (on) selected.add(field);
            TextView label = text(context, label(field), 13, ScreenColors.DEFAULT.heading);
            label.setPaddingRelative(0, Math.round(12 * density), 0, Math.round(4 * density));
            EditText input = new EditText(context);
            input.setId(View.generateViewId());
            // Nothing typed here is kept for a rebuild, the way a draft list is.
            input.setSaveEnabled(false);
            // Every field wraps, so its hint and a long example show whole at a large text size.
            input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE);
            input.setImeOptions(EditorInfo.IME_FLAG_NO_FULLSCREEN | EditorInfo.IME_FLAG_NO_EXTRACT_UI
                    | EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING);
            ScreenColors.DEFAULT.paintField(input);
            input.setEnabled(on);
            if (on && field == WordField.TAGS) input.setHint(L10n.t("Split tags with commas"));
            label.setLabelFor(input.getId());
            section.addView(label);
            section.addView(input, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            if (!on) {
                // A line under the field rather than its hint, which a field that's off draws faint.
                TextView off = text(context, L10n.f("Not matched while %1$s is off", switchTitle(field)), 13,
                        ScreenColors.DEFAULT.summary);
                off.setPaddingRelative(0, Math.round(4 * density), 0, 0);
                section.addView(off);
            }
            inputs.put(field, input);
        }
        TextView result = text(context, "", 14, ScreenColors.DEFAULT.summary);
        result.setTag(RESULT_TAG);
        result.setPaddingRelative(0, Math.round(12 * density), 0, 0);
        result.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        section.addView(result);
        // Set while Clear empties the fields one by one, so the line changes once, after the last.
        boolean[] clearing = {false};
        Runnable update = () -> {
            if (clearing[0]) return;
            Map<WordField, String> example = new EnumMap<>(WordField.class);
            for (Map.Entry<WordField, EditText> input : inputs.entrySet()) {
                example.put(input.getKey(), input.getValue().getText().toString());
            }
            String draft = list.getText().toString();
            WordPreview preview = WordPreview.of(
                    editingAllowed ? TextSettings.HIDDEN_WORDS.savedValue() : draft,
                    editingAllowed ? draft : TextSettings.ALLOWED_WORDS.savedValue(), selected, example);
            String said = describe(preview, Settings.HIDE_POSTS_WITH_WORDS.savedValue(), HushTumblrPause.isPaused());
            // The same answer again isn't set again, so TalkBack doesn't repeat it at every letter.
            if (!said.contentEquals(result.getText())) result.setText(said);
        };
        TextWatcher changed = new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence text, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence text, int start, int before, int count) { }
            @Override public void afterTextChanged(Editable text) {
                update.run();
            }
        };
        for (EditText input : inputs.values()) input.addTextChangedListener(changed);
        list.addTextChangedListener(changed);
        Button clear = new Button(context);
        clear.setTag(CLEAR_TAG);
        clear.setText(L10n.t("Clear the example"));
        clear.setAllCaps(false);
        clear.setSingleLine(false);
        clear.setMaxLines(Integer.MAX_VALUE);
        ScreenColors.DEFAULT.secondaryAction(clear);
        int target = Math.round(48 * density);
        clear.setMinHeight(target);
        clear.setMinimumHeight(target);
        clear.setOnClickListener(ignored -> {
            clearing[0] = true;
            try {
                for (EditText input : inputs.values()) input.setText("");
            } finally {
                clearing[0] = false;
            }
            update.run();
        });
        section.addView(clear, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        update.run();
        ScreenColors.startSide(section);
        return section;
    }

    private static TextView text(Context context, String said, int size, int color) {
        TextView view = new TextView(context);
        view.setText(said);
        view.setTextSize(size);
        view.setTextColor(color);
        return view;
    }

    /**
     * What [preview] says, in words. A kept example says only what the word filter does, since the
     * other filters aren't asked. [switchOn] is Hide posts with these words as saved, and [paused]
     * whether HushTumblr is paused in this process. A word from the lists is isolated, so a word
     * written right to left doesn't reorder the sentence around it, or the other way round.
     */
    static String describe(WordPreview preview, boolean switchOn, boolean paused) {
        String said;
        boolean kept = false;
        switch (preview.outcome) {
            case NO_FIELDS:
                said = L10n.t("No fields are selected to match, so the word filter keeps every post.");
                break;
            case NO_WORDS:
                said = L10n.t("There are no words to hide yet, so the word filter keeps every post.");
                break;
            case EMPTY:
                said = L10n.t("Type part of a post above to see what the word filter does with it.");
                break;
            case HIDDEN:
                said = L10n.f("The word filter would hide this post for “%1$s” in %2$s.",
                        L10n.isolate(preview.hiddenBy), label(preview.hiddenIn));
                break;
            case ALLOWED:
                kept = true;
                said = L10n.f("The word filter would keep this post. “%1$s” in %2$s would hide it, "
                                + "but the allowed word “%3$s” in %4$s keeps it.",
                        L10n.isolate(preview.hiddenBy), label(preview.hiddenIn),
                        L10n.isolate(preview.allowedBy), label(preview.allowedIn));
                break;
            default:
                kept = true;
                said = L10n.t("The word filter would keep this post. None of the words to hide are in the selected fields.");
                break;
        }
        // Only a typed post the word filter kept is an "it" other filters could still take out, and
        // while paused none of them takes anything out.
        if (kept && !paused) said += " " + L10n.t("Other filters can still hide it.");
        if (!switchOn) said += " " + L10n.t("Hide posts with these words is off, so the word filter hides nothing yet.");
        if (paused) said += " " + L10n.t("HushTumblr is paused, so the word filter hides nothing right now.");
        return said;
    }
}
