/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.preference.Preference;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;

import java.text.Collator;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.telegram.misc.TranslateTarget;

/**
 * The language the outside translate writes in (#35): Telegram's language, or any language
 * Google's web translate knows, found by typing its name in any of the languages the list shows.
 * A pick is saved off the main thread, and the list closes once it has landed.
 */
final class TranslateTargetPicker {
    static final String KEY = "action_translate_target";
    /** The search field's and the list's tags, for the tests. */
    static final String SEARCH = "hushtelegram_translate_target_search";
    static final String LIST = "hushtelegram_translate_target_list";

    private TranslateTargetPicker() {}

    /** What the row says under its title. */
    static String summary(String saved) {
        return L10n.f("Language for outside translations: %1$s. Tap to pick another.", label(saved));
    }

    /**
     * A choice as the list, the row and an import preview name it: what the language calls itself,
     * then its name in the app's language when that's different. Anything that isn't one of the
     * codes reads as Telegram's language.
     */
    static String label(String code) {
        if (!TranslateTarget.LANGUAGES.containsKey(code)) return L10n.t("Telegram's language");
        String own = TranslateTarget.nativeName(code);
        String app = TranslateTarget.nameIn(code, L10n.locale());
        if (app == null) app = TranslateTarget.englishName(code);
        if (!app.equalsIgnoreCase(own)) return L10n.f("%1$s (%2$s)", L10n.isolate(own), app);
        // Where the phone's name isn't the one Google's list uses, Google's goes in brackets.
        String google = TranslateTarget.googleNameIfOther(code);
        return google == null || google.equalsIgnoreCase(own) ? own : L10n.f("%1$s (%2$s)", L10n.isolate(own), google);
    }

    /** Whether [query] is part of the code or of the language's name in its own, the app's or English. */
    static boolean matches(String code, String query) {
        Locale locale = L10n.locale();
        String typed = query.trim().toLowerCase(locale);
        if (typed.isEmpty()) return true;
        String[] names = TranslateTarget.LANGUAGES.containsKey(code)
                ? new String[]{code, TranslateTarget.englishName(code), TranslateTarget.nativeName(code),
                        TranslateTarget.nameIn(code, locale)}
                : new String[]{label(code)};
        for (String name : names) {
            if (name != null && name.toLowerCase(locale).contains(typed)) return true;
        }
        return false;
    }

    /** Telegram's language first, then every code in the app language's alphabetical order of its label. */
    static List<String> choices() {
        List<String> codes = new ArrayList<>(TranslateTarget.LANGUAGES.keySet());
        Map<String, String> labels = new LinkedHashMap<>();
        for (String code : codes) labels.put(code, label(code));
        Collator order = Collator.getInstance(L10n.locale());
        codes.sort((a, b) -> order.compare(labels.get(a), labels.get(b)));
        codes.add(0, TranslateTarget.TELEGRAM);
        return codes;
    }

    /** Opens the list over the settings page, with the saved language checked. The row's summary follows what's saved. */
    static AlertDialog open(Activity activity, Preference row) {
        Context context = HushTelegramPreferenceFragment.themed(activity);
        List<String> all = choices();
        List<String> shown = new ArrayList<>(all);
        List<String> labels = new ArrayList<>();
        for (String code : all) labels.add(label(code));
        ArrayAdapter<String> adapter = new ArrayAdapter<>(context, android.R.layout.simple_list_item_single_choice,
                new ArrayList<>(labels));

        EditText search = new EditText(context);
        search.setTag(SEARCH);
        search.setHint(L10n.t("Search languages"));
        search.setSingleLine(true);
        search.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        ScreenColors.DEFAULT.paintField(search);
        ListView list = new ListView(context);
        list.setTag(LIST);
        list.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
        list.setAdapter(new DialogChoices(adapter, ScreenColors.DEFAULT));
        list.setDivider(null);
        LinearLayout content = new LinearLayout(context);
        content.setOrientation(LinearLayout.VERTICAL);
        int side = Math.round(20 * context.getResources().getDisplayMetrics().density);
        LinearLayout.LayoutParams field = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        field.setMarginStart(side);
        field.setMarginEnd(side);
        content.addView(search, field);
        content.addView(list, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        AlertDialog dialog = new AlertDialog.Builder(context)
                .setTitle(L10n.t("Translate into"))
                .setView(content)
                .setNegativeButton(L10n.t("Cancel"), null)
                .show();
        ScreenColors.dialog(dialog);
        // The search field's keyboard pushes the list up rather than covering Cancel.
        if (dialog.getWindow() != null) dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        Runnable checkSaved = () -> {
            list.clearChoices();
            int at = shown.indexOf(saved());
            if (at >= 0) list.setItemChecked(at, true);
        };
        checkSaved.run();
        // The saved language opens in view, not a hundred rows down.
        list.setSelection(Math.max(0, shown.indexOf(saved())));
        search.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence text, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence text, int start, int before, int count) { }
            @Override public void afterTextChanged(Editable text) {
                shown.clear();
                adapter.setNotifyOnChange(false);
                adapter.clear();
                for (int i = 0; i < all.size(); i++) {
                    if (!matches(all.get(i), text.toString())) continue;
                    shown.add(all.get(i));
                    adapter.add(labels.get(i));
                }
                adapter.notifyDataSetChanged();
                checkSaved.run();
            }
        });
        list.setOnItemClickListener((parent, view, position, id) -> {
            String code = shown.get(position);
            // The dialog's own dimming doesn't reach a list it didn't build, so a second tap can't
            // move the check while the first pick saves.
            list.setEnabled(false);
            boolean started = HushTelegramPreferenceFragment.save(dialog, () -> Settings.TRANSLATE_TARGET.saveCommitted(code), landed -> {
                if (landed) {
                    row.setSummary(summary(Settings.TRANSLATE_TARGET.savedValue()));
                    dialog.dismiss();
                } else {
                    list.setEnabled(true);
                    checkSaved.run();
                    Utils.showToastLong(L10n.t("Couldn't save the language. Try again in a moment."));
                }
            });
            if (!started) {
                list.setEnabled(true);
                checkSaved.run();
            }
        });
        return dialog;
    }

    /** The saved choice, with anything that isn't one read as Telegram's language. */
    private static String saved() {
        String saved = Settings.TRANSLATE_TARGET.savedValue();
        return TranslateTarget.LANGUAGES.containsKey(saved) ? saved : TranslateTarget.TELEGRAM;
    }
}
