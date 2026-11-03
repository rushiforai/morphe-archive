/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.settings.preference;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Typeface;
import android.os.Handler;
import android.os.Looper;
import android.preference.Preference;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import app.morphe.extension.pinedrama.Utils;
import app.morphe.extension.pinedrama.download.SaveQueue;
import app.morphe.extension.pinedrama.settings.L10n;

import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * The saves under way, on the Downloads page (#27). The row names them and keeps up while it's on
 * screen; a tap lists each one with what it's doing and a Cancel where Cancel still does
 * something, and the list keeps up too, a save moving under Earlier this session as it ends.
 */
@SuppressWarnings("deprecation")
public class SavesNowPreference extends Preference {
    private static final String KEY = "action_saves_now";
    private static final long ROW_TICK_MS = 1000;
    private static final long LIST_TICK_MS = 500;

    private final Handler handler = new Handler(Looper.getMainLooper());
    /** The row as last drawn, while it still carries this row's title. */
    private WeakReference<View> bound = new WeakReference<>(null);
    private boolean ticking;

    public SavesNowPreference(Context context) {
        super(context);
        // A key so the settings search can index this row. Nothing is stored under it.
        setKey(KEY);
        setTitle(L10n.t(context, "Saves right now"));
        setOnPreferenceClickListener(preference -> {
            showList();
            return true;
        });
    }

    @Override
    public CharSequence getSummary() {
        Context context = getContext();
        return SaveQueue.summary(context, SaveQueue.entries(context));
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        Utils.setTitleAndSummaryColor(view);
        bound = new WeakReference<>(view);
        if (!ticking) {
            ticking = true;
            handler.postDelayed(rowTick, ROW_TICK_MS);
        }
    }

    /** Keeps the summary current while the row is on screen, and stops once it isn't. */
    private final Runnable rowTick = new Runnable() {
        @Override public void run() {
            View view = bound.get();
            View title = view == null ? null : view.findViewById(android.R.id.title);
            // Gone, scrolled off into the list's spare rows (they keep their window but lose their
            // parent), or recycled for another setting: stop until it's drawn again.
            if (view == null || !view.isAttachedToWindow() || view.getParent() == null
                    || !(title instanceof TextView)
                    || !android.text.TextUtils.equals(((TextView) title).getText(), getTitle())) {
                ticking = false;
                return;
            }
            // Behind another screen it keeps its place but redraws nothing. It keeps checking,
            // since coming back to the page doesn't draw the row again.
            View summary = view.findViewById(android.R.id.summary);
            if (view.isShown() && summary instanceof TextView) {
                SettingsUi.setTextIfChanged((TextView) summary, getSummary());
            }
            handler.postDelayed(this, ROW_TICK_MS);
        }
    };

    /** One save's line in the list, kept from refresh to refresh so focus stays where it is. */
    private static final class Line {
        final LinearLayout view;
        final TextView title;
        final TextView detail;
        final TextView cancel;
        SaveQueue.Entry entry;

        Line(LinearLayout view, TextView title, TextView detail, TextView cancel) {
            this.view = view;
            this.title = title;
            this.detail = detail;
            this.cancel = cancel;
        }
    }

    private void showList() {
        Context context = getContext();
        if (SettingsUi.dialogOpen(KEY, context)) return;
        int padding = SettingsUi.dp(context, 22);
        LinearLayout body = new LinearLayout(context);
        body.setOrientation(LinearLayout.VERTICAL);
        body.setPadding(padding, 0, padding, SettingsUi.dp(context, 8));
        TextView empty = SettingsUi.text(context, L10n.t(context, "Nothing is saving right now"),
                SettingsUi.TEXT_BODY, SettingsUi.textSecondary(), Typeface.NORMAL);
        body.addView(empty);
        LinearLayout list = new LinearLayout(context);
        list.setOrientation(LinearLayout.VERTICAL);
        body.addView(list);
        TextView earlier = SettingsUi.text(context, L10n.t(context, "Earlier this session"),
                SettingsUi.TEXT_BODY_SMALL, SettingsUi.textSecondary(), Typeface.BOLD);
        earlier.setPadding(0, SettingsUi.dp(context, 16), 0, 0);
        earlier.setVisibility(View.GONE);
        body.addView(earlier);
        LinearLayout endedList = new LinearLayout(context);
        endedList.setOrientation(LinearLayout.VERTICAL);
        body.addView(endedList);
        ScrollView scroll = new ScrollView(context);
        scroll.addView(body);

        AlertDialog dialog = new AlertDialog.Builder(context)
                .setCustomTitle(SettingsUi.dialogTitle(context, L10n.t(context, "Saves right now")))
                .setView(scroll)
                .setNegativeButton(L10n.t(context, "Close"), null)
                .create();
        dialog.show();
        SettingsUi.dialogOpened(KEY, context, dialog);
        SettingsUi.styleStandardAlertDialog(dialog);
        SettingsUi.styleActionButton(dialog.getButton(AlertDialog.BUTTON_NEGATIVE), false);

        Map<Object, Line> lines = new HashMap<>();
        Map<Object, Line> endedLines = new HashMap<>();
        Runnable listTick = new Runnable() {
            @Override public void run() {
                // A page closed under the list (a theme or size change) takes the dialog's window
                // without dismissing it, so the dialog alone would keep this running.
                if (!dialog.isShowing() || closed(context)) return;
                List<SaveQueue.Entry> entries = SaveQueue.entries(context);
                fill(context, entries, list, lines, this);
                empty.setVisibility(entries.isEmpty() ? View.VISIBLE : View.GONE);
                List<SaveQueue.Entry> ended = SaveQueue.endedEntries(context);
                fill(context, ended, endedList, endedLines, this);
                earlier.setVisibility(ended.isEmpty() ? View.GONE : View.VISIBLE);
                handler.postDelayed(this, LIST_TICK_MS);
            }
        };
        dialog.setOnDismissListener(gone -> handler.removeCallbacks(listTick));
        listTick.run();
    }

    /** True once the page the list was opened on is finishing or gone. */
    private static boolean closed(Context context) {
        while (context instanceof ContextWrapper && !(context instanceof Activity)) {
            context = ((ContextWrapper) context).getBaseContext();
        }
        return context instanceof Activity
                && (((Activity) context).isFinishing() || ((Activity) context).isDestroyed());
    }

    /**
     * Brings a list to the saves as they are now. A line that is still there keeps its view, and
     * its words change only when they do, so a screen reader on a Cancel isn't moved every tick.
     */
    private void fill(Context context, List<SaveQueue.Entry> entries, LinearLayout list,
                      Map<Object, Line> lines, Runnable refresh) {
        Set<Object> current = new HashSet<>();
        for (SaveQueue.Entry entry : entries) current.add(entry.key);
        for (Object key : new HashSet<>(lines.keySet())) {
            if (current.contains(key)) continue;
            list.removeView(lines.remove(key).view);
        }
        for (int index = 0; index < entries.size(); index++) {
            SaveQueue.Entry entry = entries.get(index);
            Line line = lines.get(entry.key);
            if (line == null) {
                line = newLine(context, refresh, list);
                lines.put(entry.key, line);
            }
            line.entry = entry;
            SettingsUi.setTextIfChanged(line.title, entry.title);
            SettingsUi.setTextIfChanged(line.detail, entry.detail);
            line.cancel.setVisibility(entry.canCancel() ? View.VISIBLE : View.GONE);
            if (list.getChildAt(index) != line.view) {
                if (line.view.getParent() != null) list.removeView(line.view);
                list.addView(line.view, Math.min(index, list.getChildCount()));
            }
        }
    }

    private Line newLine(Context context, Runnable refresh, LinearLayout list) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        int gap = SettingsUi.dp(context, 8);
        row.setPadding(0, gap, 0, gap);
        LinearLayout words = new LinearLayout(context);
        words.setOrientation(LinearLayout.VERTICAL);
        TextView title = SettingsUi.text(context, "", SettingsUi.TEXT_BODY, SettingsUi.textPrimary(), Typeface.BOLD);
        TextView detail = SettingsUi.text(context, "", SettingsUi.TEXT_BODY_SMALL, SettingsUi.textSecondary(), Typeface.NORMAL);
        words.addView(title);
        words.addView(detail);
        row.addView(words, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView cancel = SettingsUi.text(context, L10n.t(context, "Cancel"),
                SettingsUi.TEXT_BODY, SettingsUi.textSecondary(), Typeface.NORMAL);
        SettingsUi.styleTextAction(cancel, false);
        cancel.setPadding(gap * 2, 0, gap * 2, 0);
        row.addView(cancel);
        Line line = new Line(row, title, detail, cancel);
        cancel.setOnClickListener(clicked -> {
            SaveQueue.Entry entry = line.entry;
            if (entry != null) entry.cancel();
            handler.removeCallbacks(refresh);
            refresh.run();
        });
        return line;
    }
}
