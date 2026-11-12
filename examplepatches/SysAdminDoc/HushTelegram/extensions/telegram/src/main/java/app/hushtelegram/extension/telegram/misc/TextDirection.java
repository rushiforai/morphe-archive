/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.text.Editable;
import android.view.ActionMode;
import android.view.Menu;
import android.widget.EditText;

import java.util.ArrayList;
import java.util.List;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Right to left, Left to right and Control character in the text menu of Telegram's message and
 * caption boxes (#71). Telegram lays out each line in the direction of its first letter, so a line
 * that starts with an invisible right-to-left mark reads right to left for everyone, as it does
 * after Telegram Desktop's Insert Unicode control character. The patch asks this class once the box
 * has built its text menu, and first whenever one of the menu's items is chosen. Off by default.
 */
public final class TextDirection {
    private TextDirection() {
    }

    /** The items' numbers, which Telegram's own menu may never use, after My messages'. */
    static final int RIGHT_TO_LEFT = 0x48545409;
    static final int LEFT_TO_RIGHT = 0x4854540A;
    static final int CONTROL = 0x4854540B;

    /** After Telegram's own items, so they go at the end of the menu. */
    private static final int ORDER = 1000;

    static final char LRM = (char) 0x200E;
    static final char RLM = (char) 0x200F;

    /** The marks Control character offers, in Telegram Desktop's order, and their short names. */
    static final char[] MARKS = {LRM, RLM, (char) 0x200D, (char) 0x200C, (char) 0x200B, (char) 0x202A, (char) 0x202B,
            (char) 0x202D, (char) 0x202E, (char) 0x202C, (char) 0x2066, (char) 0x2067, (char) 0x2068, (char) 0x2069};
    static final String[] SHORT_NAMES = {"LRM", "RLM", "ZWJ", "ZWNJ", "ZWSP", "LRE", "RLE", "LRO", "RLO", "PDF",
            "LRI", "RLI", "FSI", "PDI"};

    static String[] names() {
        return new String[] {
                L10n.t("Left-to-right mark"), L10n.t("Right-to-left mark"), L10n.t("Zero width joiner"),
                L10n.t("Zero width non-joiner"), L10n.t("Zero width space"), L10n.t("Start of left-to-right embedding"),
                L10n.t("Start of right-to-left embedding"), L10n.t("Start of left-to-right override"),
                L10n.t("Start of right-to-left override"), L10n.t("Pop directional formatting"),
                L10n.t("Left-to-right isolate"), L10n.t("Right-to-left isolate"), L10n.t("First strong isolate"),
                L10n.t("Pop directional isolate"),
        };
    }

    static boolean active() {
        HookStatus.invoked(FamilyNames.TEXT_DIRECTION);
        try {
            return Utils.settingsReady() && Settings.TEXT_DIRECTION.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.TEXT_DIRECTION, "switch", failure);
            return false;
        }
    }

    /**
     * Asked once the box has built its text menu. Telegram can start the same menu twice for one
     * long press, so a menu that already has the items keeps them.
     */
    public static void menu(Object box, ActionMode mode) {
        try {
            if (!(box instanceof EditText) || mode == null || !active()) return;
            Menu menu = mode.getMenu();
            if (menu == null || menu.findItem(RIGHT_TO_LEFT) != null) return;
            menu.add(Menu.NONE, RIGHT_TO_LEFT, ORDER, L10n.t("Right to left"));
            menu.add(Menu.NONE, LEFT_TO_RIGHT, ORDER + 1, L10n.t("Left to right"));
            menu.add(Menu.NONE, CONTROL, ORDER + 2, L10n.t("Control character"));
            mode.invalidate();
            HookStatus.counted(FamilyNames.TEXT_DIRECTION, "text menu items added");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.TEXT_DIRECTION, "text menu", failure);
        }
    }

    /**
     * Asked first when an item of the box's text menu is chosen.
     *
     * @return true when the choice was ours, so Telegram closes the menu and does nothing else with it
     */
    public static boolean chosen(Object box, int id) {
        if (id != RIGHT_TO_LEFT && id != LEFT_TO_RIGHT && id != CONTROL) return false;
        try {
            // An item left in an open menu after the switch went off is still ours, and does nothing.
            if (!(box instanceof EditText) || !active()) return true;
            EditText field = (EditText) box;
            if (id == CONTROL) {
                pick(field);
            } else {
                direction(field.getText(), field.getSelectionStart(), field.getSelectionEnd(), id == RIGHT_TO_LEFT ? RLM : LRM);
                HookStatus.counted(FamilyNames.TEXT_DIRECTION, id == RIGHT_TO_LEFT ? "right to left" : "left to right");
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.TEXT_DIRECTION, "text menu choice", failure);
            Utils.showToastShort(L10n.t("Couldn't change the text."));
        }
        return true;
    }

    /**
     * Starts each line the selection from [start] to [end] touches with [mark], or the cursor's line
     * when nothing is selected. A direction mark a line already starts with is swapped, not stacked,
     * so picking the other direction later turns the line back.
     */
    static void direction(Editable text, int start, int end, char mark) {
        if (text == null) return;
        int to = Math.max(0, Math.min(Math.max(start, end), text.length()));
        int from = Math.max(0, Math.min(Math.min(start, end), to));
        int line = from;
        while (line > 0 && text.charAt(line - 1) != '\n') line--;
        List<Integer> starts = new ArrayList<>();
        starts.add(line);
        // A selection that ends right after a line break leaves the next line alone.
        for (int i = from; i + 1 < to; i++) {
            if (text.charAt(i) == '\n') starts.add(i + 1);
        }
        // From the last line back, so a mark never moves the lines still to do.
        for (int i = starts.size() - 1; i >= 0; i--) {
            int at = starts.get(i);
            char first = at < text.length() ? text.charAt(at) : 0;
            if (first == mark) continue;
            if (first == LRM || first == RLM) {
                text.replace(at, at + 1, String.valueOf(mark));
            } else {
                text.insert(at, String.valueOf(mark));
            }
        }
    }

    /** Telegram Desktop's list of control characters; the chosen one replaces what was selected. */
    static void pick(EditText field) {
        Activity activity = activityOf(field.getContext());
        if (activity == null || activity.isFinishing()) {
            Utils.showToastShort(L10n.t("Couldn't change the text."));
            return;
        }
        // Telegram drops the selection when its menu closes, so the dialog keeps where it was.
        int start = Math.max(0, Math.min(field.getSelectionStart(), field.getSelectionEnd()));
        int end = Math.max(start, Math.max(field.getSelectionStart(), field.getSelectionEnd()));
        String[] names = names();
        CharSequence[] rows = new CharSequence[MARKS.length];
        for (int i = 0; i < rows.length; i++) rows[i] = SHORT_NAMES[i] + "  " + names[i];
        new AlertDialog.Builder(activity)
                .setTitle(L10n.t("Control character"))
                .setItems(rows, (shown, which) -> insert(field, start, end, MARKS[which]))
                .setNegativeButton(L10n.t("Cancel"), null)
                .show();
    }

    static void insert(EditText field, int start, int end, char mark) {
        try {
            Editable text = field.getText();
            if (text == null) return;
            int to = Math.max(0, Math.min(end, text.length()));
            int from = Math.max(0, Math.min(start, to));
            text.replace(from, to, String.valueOf(mark));
            field.setSelection(from + 1);
            HookStatus.counted(FamilyNames.TEXT_DIRECTION, "control character inserted");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.TEXT_DIRECTION, "control character", failure);
            Utils.showToastShort(L10n.t("Couldn't change the text."));
        }
    }

    private static Activity activityOf(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }
}
