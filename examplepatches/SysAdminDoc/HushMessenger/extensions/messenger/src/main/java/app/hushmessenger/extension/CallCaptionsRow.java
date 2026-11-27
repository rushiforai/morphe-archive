package app.hushmessenger.extension;

import android.os.Build;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.List;

/**
 * The language buttons under Live captions on calls (#159): which language the other people speak, and which one the
 * captions show. Each opens a sheet of what the phone has, and a choice saves the moment it's tapped.
 */
final class CallCaptionsRow {
    /** The row that opens the rest of the phone's languages. No language tag reads like this. */
    private static final String OTHER = "other";
    private final SettingsActivity page;
    private Button heard, shown;
    private SettingsDialog open;

    CallCaptionsRow(SettingsActivity page) {
        this.page = page;
    }

    /** Below Android 13 the row's reason line already says captions can't run, so there's nothing to pick. */
    void addTo(LinearLayout content) {
        if (Build.VERSION.SDK_INT < 33) return;
        heard = page.ui.button("");
        heard.setTag("call_captions_heard");
        heard.setOnClickListener(clicked -> pickHeard());
        page.ui.add(content, heard, 8);
        shown = page.ui.button("");
        shown.setTag("call_captions_shown");
        shown.setOnClickListener(clicked -> pickShown());
        page.ui.add(content, shown, 8);
        fill();
    }

    void fill() {
        if (heard == null) return;
        heard.setText(page.text.get("call_captions_heard", CallCaptions.name(CallCaptions.heardLanguage())));
        shown.setText(page.text.get("call_captions_shown", CallCaptions.untranslated()
            ? page.text.get("call_captions_untranslated_choice") : CallCaptions.name(CallCaptions.shownLanguage())));
    }

    private void pickHeard() {
        SettingsDialog sheet = sheet("call_captions_heard_title", "call_captions_heard_hint");
        if (sheet == null) return;
        fillHeard(sheet, null);
    }

    /** The heard sheet's choices, under a line saying the last pick was turned down when [refused] names it. */
    private void fillHeard(SettingsDialog sheet, String refused) {
        CallCaptions.parts().heardLanguages(page, (installed, more) -> {
            if (open != sheet) return;
            sheet.body.removeAllViews();
            if (installed == null) {
                say(sheet, "call_captions_no_recognizer");
                return;
            }
            if (refused != null) say(sheet, "call_captions_cant_hear", CallCaptions.name(refused));
            String now = saved(CallCaptions.HEARD_LANGUAGE);
            RadioGroup group = group("call_captions_heard_choices");
            String phone = java.util.Locale.getDefault().toLanguageTag();
            // The phone's language is only certain to work when the recognizer already has it.
            boolean phoneHeard = false;
            for (String language : installed) phoneHeard |= CallCaptions.sameLanguage(language, phone);
            boolean sure = phoneHeard;
            choice(group, "", page.text.get("call_captions_phone_language", CallCaptions.name(phone)),
                now.isEmpty(), () -> {
                    if (sure) picked(CallCaptions.HEARD_LANGUAGE, "", null);
                    else tryHeard(sheet, "", phone, false, () -> fillHeard(sheet, phone));
                });
            List<String> listed = new ArrayList<>(installed);
            for (String language : installed) choice(group, language, CallCaptions.name(language), language.equalsIgnoreCase(now),
                () -> picked(CallCaptions.HEARD_LANGUAGE, language, null));
            if (more != null) for (String language : more) {
                listed.add(language);
                choice(group, language, page.text.get("call_captions_download", CallCaptions.name(language)),
                    language.equalsIgnoreCase(now), () -> picked(CallCaptions.HEARD_LANGUAGE, language, language));
            }
            choice(group, OTHER, page.text.get("call_captions_other"), false,
                () -> pickOther(sheet, CallCaptions.HEARD_LANGUAGE, listed, true, null));
            page.ui.add(sheet.body, group, 0);
        });
    }

    /**
     * A language the recognizer never listed goes past it before it's saved (#244). Filipino on a Galaxy S26 Ultra
     * was picked from the list of every language, and the recognizer only turned it down once a call started. Now the
     * sheet asks it first: a language it takes is saved (fetching its model when [fetch] is set or it needs one), and
     * one it turns down puts the choices back under a line that says so, keeping what was saved before.
     */
    private void tryHeard(SettingsDialog sheet, String saving, String language, boolean fetch, Runnable refused) {
        if (open != sheet) return;
        sheet.body.removeAllViews();
        say(sheet, "call_captions_checking", CallCaptions.name(language));
        CallCaptions.parts().tryHearing(page, language, answer -> {
            if (open != sheet) return;
            if (answer == CallCaptions.HEARS_NEVER) {
                refused.run();
                return;
            }
            picked(CallCaptions.HEARD_LANGUAGE, saving, fetch || answer == CallCaptions.HEARS_AFTER_DOWNLOAD ? language : null);
        });
    }

    private void pickShown() {
        SettingsDialog sheet = sheet("call_captions_shown_title", "call_captions_shown_hint");
        if (sheet == null) return;
        CallCaptions.parts().shownLanguages(page, CallCaptions.heardLanguage(), targets -> {
            if (open != sheet) return;
            sheet.body.removeAllViews();
            if (targets.isEmpty()) say(sheet, "call_captions_no_translator");
            String now = saved(CallCaptions.SHOWN_LANGUAGE);
            RadioGroup group = group("call_captions_shown_choices");
            choice(group, CallCaptions.UNTRANSLATED, page.text.get("call_captions_untranslated_choice"),
                CallCaptions.UNTRANSLATED.equals(now), () -> picked(CallCaptions.SHOWN_LANGUAGE, CallCaptions.UNTRANSLATED, null));
            choice(group, "", page.text.get("call_captions_phone_language", CallCaptions.name(java.util.Locale.getDefault().toLanguageTag())),
                now.isEmpty(), () -> picked(CallCaptions.SHOWN_LANGUAGE, "", null));
            for (String language : targets) choice(group, language, CallCaptions.name(language), language.equalsIgnoreCase(now),
                () -> picked(CallCaptions.SHOWN_LANGUAGE, language, null));
            choice(group, OTHER, page.text.get("call_captions_other"), false,
                () -> pickOther(sheet, CallCaptions.SHOWN_LANGUAGE, targets, false, null));
            page.ui.add(sheet.body, group, targets.isEmpty() ? 12 : 0);
        });
    }

    /**
     * The same sheet again, holding every other language the phone knows (#159). What the recognizer and the translator
     * report leaves out languages they turn out to handle, so the phone answers for itself: a heard language goes past
     * the recognizer and fetches its model (#244), and a shown language the phone can't translate into leaves captions
     * as spoken, which the call says.
     */
    private void pickOther(SettingsDialog sheet, String key, List<String> listed, boolean heard, String refused) {
        if (open != sheet) return;
        sheet.body.removeAllViews();
        if (refused != null) say(sheet, "call_captions_cant_hear", CallCaptions.name(refused));
        String now = saved(key);
        RadioGroup group = group("call_captions_other_choices");
        for (String language : CallCaptions.others(listed)) choice(group, language, CallCaptions.name(language),
            language.equalsIgnoreCase(now), () -> {
                if (heard) tryHeard(sheet, language, language, true, () -> pickOther(sheet, key, listed, true, language));
                else picked(key, language, null);
            });
        page.ui.add(sheet.body, group, 0);
    }

    /** A sheet saying it's looking, or null when one is already open. */
    private SettingsDialog sheet(String title, String hint) {
        if (open != null || page.isFinishing() || page.isDestroyed()) return null;
        SettingsDialog sheet = new SettingsDialog(page, page.ui, page.text, page.text.get(title), page.text.get(hint));
        sheet.setTag("call_captions_sheet");
        say(sheet, "call_captions_loading");
        Button cancel = page.ui.button(page.text.get("call_captions_cancel"));
        cancel.setTag("call_captions_cancel");
        cancel.setOnClickListener(clicked -> sheet.dialog.dismiss());
        sheet.action(cancel);
        sheet.dialog.setOnDismissListener(dismissed -> {
            if (open == sheet) open = null;
        });
        open = sheet;
        sheet.show();
        return sheet;
    }

    private void say(SettingsDialog sheet, String id, Object... values) {
        TextView line = page.ui.text(page.text.get(id, values), 15, page.ui.muted, false);
        line.setTag(id);
        page.ui.add(sheet.body, line, 0);
    }

    private RadioGroup group(String tag) {
        RadioGroup group = new RadioGroup(page);
        group.setTag(tag);
        group.setOrientation(LinearLayout.VERTICAL);
        return group;
    }

    private void choice(RadioGroup group, String language, String label, boolean checked, Runnable pick) {
        RadioButton choice = page.radio("call_captions_language_" + (language.isEmpty() ? "phone" : language), label);
        choice.setChecked(checked);
        choice.setOnClickListener(clicked -> pick.run());
        group.addView(choice, new RadioGroup.LayoutParams(-1, -2));
    }

    private static String saved(String key) {
        return Settings.preferences == null ? "" : Settings.preferences.getString(key, "");
    }

    /** Saves the choice, starts a download the phone still needs, and closes the sheet. */
    private void picked(String key, String language, String download) {
        if (Settings.preferences != null) Settings.preferences.edit().putString(key, language).apply();
        if (download != null) CallCaptions.parts().download(page, download);
        if (open != null) open.dialog.dismiss();
        fill();
        String named = CallCaptions.UNTRANSLATED.equals(language) ? page.text.get("call_captions_untranslated_choice")
            : CallCaptions.name(language.isEmpty() ? java.util.Locale.getDefault().toLanguageTag() : language);
        page.feedback(page.text.get(download != null ? "call_captions_downloading_now" : "call_captions_picked", named), Toast.LENGTH_SHORT);
    }

    /** For tests: the sheet that's open, or null. */
    SettingsDialog openSheet() {
        return open;
    }
}
