/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Typeface;
import android.view.Gravity;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.misc.Bookmarks;

/**
 * The Bookmarks page ({@link Bookmarks}, #79): every bookmark, newest first, with its chat's name,
 * who sent it, a preview and the message's date. A tap opens the chat at the message; a long press
 * or Remove takes the bookmark out at once and says so.
 */
public final class BookmarksPage {
    /** The settings row's key. */
    static final String KEY = "action_bookmarks";

    private BookmarksPage() {}

    /** Opens the page over [activity], from the settings row or the side menu. */
    @Nullable
    public static AlertDialog show(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return null;
        Context themed = HushTelegramPreferenceFragment.themed(activity);
        LinearLayout list = new LinearLayout(themed);
        list.setOrientation(LinearLayout.VERTICAL);
        int pad = dp(themed, 20);
        list.setPadding(pad, pad / 2, pad, 0);
        ScrollView scroll = new ScrollView(themed);
        scroll.addView(list);
        AlertDialog dialog = new AlertDialog.Builder(themed)
                .setTitle(L10n.t("Bookmarks"))
                .setView(scroll)
                .setPositiveButton(L10n.t("Close"), null)
                .create();
        fill(activity, dialog, list);
        dialog.show();
        ScreenColors.dialog(dialog);
        HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "bookmarks opened");
        return dialog;
    }

    /** Builds the rows into [list]; a remove builds them again. */
    static void fill(Activity activity, AlertDialog dialog, LinearLayout list) {
        list.removeAllViews();
        Context context = list.getContext();
        List<Bookmarks.Entry> entries = Bookmarks.parse(Settings.BOOKMARKS.savedValue());
        if (entries.isEmpty()) {
            list.addView(text(context, L10n.t("No bookmarks yet. Long-press a message and tap Bookmark."), 15, false));
            return;
        }
        DateFormat when = DateFormat.getDateTimeInstance(DateFormat.MEDIUM, DateFormat.SHORT, L10n.locale());
        for (Bookmarks.Entry each : entries) {
            LinearLayout row = new LinearLayout(context);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setMinimumHeight(dp(context, 48));
            LinearLayout words = new LinearLayout(context);
            words.setOrientation(LinearLayout.VERTICAL);
            if (!each.chat.isEmpty()) words.addView(text(context, each.chat, 16, true));
            words.addView(text(context, each.shown(), 14, false));
            if (each.date > 0) words.addView(text(context, when.format(new Date(each.date * 1000L)), 12, false));
            words.setClickable(true);
            words.setFocusable(true);
            words.setOnClickListener(v -> Bookmarks.open(activity, each, dialog::dismiss));
            words.setOnLongClickListener(v -> {
                remove(activity, dialog, list, each);
                return true;
            });
            row.addView(words, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
            TextView remove = text(context, L10n.t("Remove"), 14, true);
            remove.setMinHeight(dp(context, 48));
            remove.setGravity(Gravity.CENTER_VERTICAL);
            remove.setPadding(dp(context, 16), 0, 0, 0);
            remove.setOnClickListener(v -> remove(activity, dialog, list, each));
            row.addView(remove);
            list.addView(row);
        }
    }

    static void remove(Activity activity, AlertDialog dialog, LinearLayout list, Bookmarks.Entry entry) {
        String said = Bookmarks.remove(entry) ? L10n.t("Bookmark removed.") : L10n.t("Couldn't save the bookmark. Try again.");
        Utils.showToastShort(said);
        fill(activity, dialog, list);
    }

    private static TextView text(Context context, String words, int sp, boolean bold) {
        TextView view = new TextView(context);
        view.setText(words);
        view.setTextSize(sp);
        view.setPadding(0, dp(context, 3), 0, dp(context, 3));
        if (bold) view.setTypeface(Typeface.DEFAULT_BOLD);
        return view;
    }

    private static int dp(Context context, int value) {
        return Math.round(context.getResources().getDisplayMetrics().density * value);
    }
}
