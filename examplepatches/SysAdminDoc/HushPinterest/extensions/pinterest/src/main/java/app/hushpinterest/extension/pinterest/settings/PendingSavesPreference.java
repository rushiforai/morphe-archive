/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.preference.DialogPreference;
import android.text.format.DateFormat;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import java.util.Date;
import java.util.List;

import app.hushpinterest.extension.pinterest.actions.PendingSaveJournal;
import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/** Recovery guidance for chosen Android 9 destinations. It never opens or deletes their files. */
@SuppressWarnings("deprecation")
public final class PendingSavesPreference extends DialogPreference {
    private long generation;
    private TextView message;
    private ListView list;
    private AlertDialog detail;
    private boolean busy;

    public PendingSavesPreference(Context context) {
        super(HushPinterestPreferenceFragment.themed(context));
        setKey("action_pending_saves");
        setPersistent(false);
        setTitle(L10n.t(context, "Pending saves"));
        setSummary(L10n.t(context, "Check unfinished file picker saves. Files are kept."));
        setDialogTitle(getTitle());
        setPositiveButtonText(null);
        setNegativeButtonText(L10n.t(context, "Back"));
    }

    @Override protected void onBindView(View view) {
        super.onBindView(view);
        HushPinterestPreferenceFragment.showAllText(view);
        ScreenColors.row(view, this);
        view.setAccessibilityDelegate(new HushPinterestPreferenceFragment.RowSemantics(this, Button.class));
    }

    @Override protected View onCreateDialogView() {
        generation++;
        busy = false;
        LinearLayout content = new LinearLayout(getContext());
        content.setOrientation(LinearLayout.VERTICAL);
        message = new TextView(getContext());
        message.setId(android.R.id.message);
        message.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        message.setTextColor(ScreenColors.DEFAULT.summary);
        message.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        message.setPaddingRelative(dp(24), dp(12), dp(24), dp(12));
        content.addView(message);
        list = new ListView(getContext());
        list.setId(android.R.id.list);
        list.setDivider(null);
        list.setSelector(new ColorDrawable(Color.TRANSPARENT));
        content.addView(list, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                Math.min(dp(320), getContext().getResources().getDisplayMetrics().heightPixels / 3)));
        return content;
    }

    @Override protected void onPrepareDialogBuilder(AlertDialog.Builder builder) {
        super.onPrepareDialogBuilder(builder);
        builder.setNeutralButton(L10n.t(getContext(), "Refresh"), null);
    }

    @Override protected void onBindDialogView(View view) {
        super.onBindDialogView(view);
        message.setVisibility(View.VISIBLE);
    }

    @Override protected void showDialog(Bundle state) {
        try {
            super.showDialog(state);
            AlertDialog dialog = (AlertDialog) getDialog();
            ScreenColors.dialog(dialog);
            dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener(view -> refresh());
            refresh();
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "open pending saves", failure);
            if (getDialog() != null) getDialog().dismiss();
            generation++;
            Utils.showToastLong(L10n.t(getContext(), "Couldn't check your chosen save location. Open your Files app to inspect it."));
        }
    }

    private void refresh() {
        if (getDialog() == null || !getDialog().isShowing() || busy) return;
        long opened = generation;
        AlertDialog dialog = (AlertDialog) getDialog();
        busy = true;
        list.setEnabled(false);
        dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setEnabled(false);
        message.setText(L10n.t(getContext(), "Checking pending saves..."));
        PendingSaveJournal.refresh(getContext(), entries -> {
            if (generation != opened || getDialog() != dialog || !dialog.isShowing()) return;
            busy = false;
            list.setEnabled(true);
            dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setEnabled(true);
            try {
                render(entries);
            } catch (RuntimeException failure) {
                HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "show pending saves", failure);
                list.setVisibility(View.GONE);
                message.setText(L10n.t(getContext(), "Couldn't check your chosen save location. Open your Files app to inspect it."));
            }
        });
    }

    private void render(List<PendingSaveJournal.Entry> entries) {
        boolean empty = entries == null || entries.isEmpty();
        list.setVisibility(empty ? View.GONE : View.VISIBLE);
        message.setText(L10n.t(getContext(), entries == null
                ? "Couldn't check your chosen save location. Open your Files app to inspect it."
                : empty ? "No pending HushPinterest saves."
                : "Only unfinished saves are listed. Check your chosen location before saving again."));
        if (empty) return;
        CharSequence[] titles = new CharSequence[entries.size()];
        CharSequence[] summaries = new CharSequence[entries.size()];
        for (int i = 0; i < entries.size(); i++) {
            PendingSaveJournal.Entry entry = entries.get(i);
            Date date = new Date(entry.createdAt);
            titles[i] = entry.statusText();
            summaries[i] = L10n.isolate(DateFormat.getDateFormat(getContext()).format(date) + " "
                    + DateFormat.getTimeFormat(getContext()).format(date));
        }
        list.setAdapter(new ChoiceCards(ScreenColors.DEFAULT, titles, summaries));
        list.setOnItemClickListener((parent, view, position, id) -> {
            if (busy || detail != null || position < 0 || position >= entries.size()) return;
            PendingSaveJournal.Entry entry = entries.get(position);
            AlertDialog shown = new AlertDialog.Builder(getContext()).setTitle(entry.statusText())
                    .setMessage(entry.guidanceText()).setNegativeButton(L10n.t(getContext(), "Back"), null)
                    .setPositiveButton(L10n.t(getContext(), "Remove from history"), null).create();
            detail = shown;
            shown.setOnDismissListener(ignored -> { if (detail == shown) detail = null; });
            shown.show();
            ScreenColors.dialog(shown);
            Button remove = shown.getButton(AlertDialog.BUTTON_POSITIVE);
            remove.setEnabled(entry.state != PendingSaveJournal.State.SAVING);
            remove.setOnClickListener(ignored -> {
                remove.setEnabled(false);
                PendingSaveJournal.forget(getContext(), entry.id, () -> {
                    if (detail != shown || !shown.isShowing()) return;
                    shown.dismiss();
                    refresh();
                });
            });
        });
    }

    @Override protected void onDialogClosed(boolean positiveResult) {
        generation++;
        if (detail != null) detail.dismiss();
        super.onDialogClosed(positiveResult);
    }

    @Override protected void onPrepareForRemoval() {
        onActivityDestroy();
        super.onPrepareForRemoval();
    }

    private int dp(int value) { return Math.round(value * getContext().getResources().getDisplayMetrics().density); }
}
