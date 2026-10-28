/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.extension.facebook.settings;

import android.app.AlertDialog;
import android.content.Context;
import android.preference.Preference;

import androidx.annotation.Nullable;

import java.util.LinkedHashMap;
import java.util.Map;

import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.Setting;

/**
 * Where the tab bar goes and what it does while you scroll, each as one choice of three: as
 * Facebook has it, or one of the two switches behind the row.
 *
 * <p>Each pair stays two saved switches, the keys backups, imports and Pause already know. A choice
 * saves both at once, so the row never leaves both on. When an older backup holds both on, the
 * switch that always won still wins: Bottom over Top, and Hide over Keep.
 */
@SuppressWarnings("deprecation")
final class TabBarChoices {
    private TabBarChoices() { }

    /** The two rows' keys. No setting is behind either: each row stands for a pair. */
    static final String POSITION_ROW = "action_tab_bar_position";
    static final String SCROLLING_ROW = "action_tab_bar_scrolling";

    /** As Facebook has it, the first switch's way (which wins), or the second switch's. */
    static final int FACEBOOK = 0;
    static final int FIRST = 1;
    static final int SECOND = 2;

    enum Pair {
        POSITION(POSITION_ROW, Settings.BOTTOM_TAB_BAR, Settings.TOP_TAB_BAR),
        SCROLLING(SCROLLING_ROW, Settings.TAB_BAR_SCROLL_AWAY, Settings.KEEP_TAB_BAR);

        final String rowKey;
        final BooleanSetting first;
        final BooleanSetting second;

        Pair(String rowKey, BooleanSetting first, BooleanSetting second) {
            this.rowKey = rowKey;
            this.first = first;
            this.second = second;
        }

        /** The saved choice. The first switch wins when an older file left both on. */
        int choice() {
            if (first.savedValue()) return FIRST;
            return second.savedValue() ? SECOND : FACEBOOK;
        }

        /** What [choice] saves: both switches, so neither keeps a value the other overrides. */
        Map<Setting<?>, Object> values(int choice) {
            Map<Setting<?>, Object> values = new LinkedHashMap<>();
            values.put(first, choice == FIRST);
            values.put(second, choice == SECOND);
            return values;
        }

        CharSequence title() {
            return this == POSITION ? L10n.t("Tab bar position") : L10n.t("Tab bar while scrolling");
        }

        CharSequence[] choices() {
            return this == POSITION
                    ? new CharSequence[]{L10n.t("As Facebook has it"), L10n.t("At the bottom"), L10n.t("At the top")}
                    : new CharSequence[]{L10n.t("As Facebook has it"), L10n.t("Hides while scrolling"),
                            L10n.t("Stays on screen")};
        }

        CharSequence summary(int choice) {
            if (this == POSITION) {
                if (choice == FIRST) {
                    return L10n.t("Moves Facebook's tab bar to the bottom, within thumb reach, on accounts that show it at "
                            + "the top. Restart Facebook to see the change.");
                }
                if (choice == SECOND) {
                    return L10n.t("Moves Facebook's tab bar to the top, under the search row, as older Facebook had it. "
                            + "Restart Facebook to see the change.");
                }
                return L10n.t("Facebook decides where the tab bar goes on your account. Restart Facebook after you change "
                        + "this.");
            }
            if (choice == FIRST) {
                return L10n.t("The bottom tab bar hides as you scroll down and returns when you scroll up, for more room. "
                        + "Restart Facebook to see the change.");
            }
            if (choice == SECOND) {
                return L10n.t("The bottom tab bar stays put while you scroll, on accounts where Facebook slides it away. "
                        + "Restart Facebook to see the change.");
            }
            return L10n.t("Facebook decides whether the bottom tab bar slides away as you scroll. Restart Facebook after "
                    + "you change this.");
        }

        /** The switches' own names, which search still finds the row by. */
        CharSequence[] aliases() {
            return new CharSequence[]{SwitchLabels.title(first), SwitchLabels.title(second)};
        }

        /** The pair a switch's key belongs to, so a request for either switch lands on its row. */
        @Nullable
        static Pair forKey(@Nullable String key) {
            for (Pair pair : values()) {
                if (pair.first.key.equals(key) || pair.second.key.equals(key)) return pair;
            }
            return null;
        }
    }

    /** The pair's row: its title, and the saved choice's sentence for a summary. */
    static Preference row(HushfacebookPreferenceFragment page, Context context, Pair pair) {
        SettingsRows.Row row = new SettingsRows.Row(context);
        row.setKey(pair.rowKey);
        row.setTitle(pair.title());
        row.setPersistent(false);
        SettingsRows.alias(row, pair.aliases());
        row.setSummary(pair.summary(pair.choice()));
        row.setOnPreferenceClickListener(p -> {
            choose(page, context, pair, row);
            return true;
        });
        return row;
    }

    /** Shows the saved choice again, after an import or another page changed a switch. */
    static void showSaved(@Nullable Preference row, Pair pair) {
        if (row != null) row.setSummary(pair.summary(pair.choice()));
    }

    private static void choose(HushfacebookPreferenceFragment page, Context context, Pair pair, Preference row) {
        // Through the page, so it closes with the page's view and takes the screen's colors.
        page.show(new AlertDialog.Builder(context)
                .setTitle(pair.title())
                .setSingleChoiceItems(pair.choices(), pair.choice(), (shown, which) -> {
                    shown.dismiss();
                    save(page, pair, which);
                    showSaved(row, pair);
                })
                .setNegativeButton(L10n.t("Cancel"), null));
    }

    /** Saves both switches together, then says a restart is owed for each that changed. */
    static boolean save(HushfacebookPreferenceFragment page, Pair pair, int choice) {
        if (pair.first.savedValue() == (choice == FIRST) && pair.second.savedValue() == (choice == SECOND)) return true;
        Map<Setting<?>, Object> before = new LinkedHashMap<>();
        before.put(pair.first, pair.first.savedValue());
        before.put(pair.second, pair.second.savedValue());
        try {
            Setting.saveAll(pair.values(choice));
        } catch (java.io.IOException | RuntimeException failure) {
            Logger.printInfo(() -> "Tab bar choice not saved", failure);
            Utils.showToastLong(L10n.t("Couldn't save the change. Try again."));
            return false;
        }
        page.savedTogether(before);
        return true;
    }

    /**
     * Gives each pair on the page the choice its switches make in a Quick setup's [values], and
     * answers how many pairs changed. A pair the setup leaves out, or whose row isn't on the page
     * because its patch isn't in this build, keeps its choice.
     */
    static int apply(HushfacebookPreferenceFragment page, Map<BooleanSetting, Boolean> values) {
        int changed = 0;
        for (Pair pair : Pair.values()) {
            Boolean first = values.get(pair.first);
            Boolean second = values.get(pair.second);
            Preference row = page.findPreference(pair.rowKey);
            if (row == null || (first == null && second == null)) continue;
            boolean firstOn = first != null ? first : pair.first.savedValue();
            boolean secondOn = second != null ? second : pair.second.savedValue();
            int choice = firstOn ? FIRST : secondOn ? SECOND : FACEBOOK;
            if (choice == pair.choice() || !save(page, pair, choice)) continue;
            showSaved(row, pair);
            changed++;
        }
        return changed;
    }
}
