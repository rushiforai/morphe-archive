/*
 * Copyright (c) 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Build;
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

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import app.hushpinterest.extension.pinterest.actions.DownloadLedger;
import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/** The private request history. Files and active jobs remain under Android's control. */
@SuppressWarnings("deprecation")
public final class DownloadHistoryPreference extends DialogPreference {
    private Session session;

    public DownloadHistoryPreference(Context context) {
        super(HushPinterestPreferenceFragment.themed(context));
        setKey("action_download_history");
        setPersistent(false);
        setTitle(L10n.t(context, "Download history"));
        setSummary(L10n.t(context, "Check recent downloads started by HushPinterest."));
        setDialogTitle(getTitle());
        setNegativeButtonText(L10n.t(context, "Back"));
        setPositiveButtonText(L10n.t(context, "Open Downloads"));
    }

    @Override protected void onBindView(View view) {
        super.onBindView(view);
        HushPinterestPreferenceFragment.showAllText(view);
        ScreenColors.row(view, this);
        view.setAccessibilityDelegate(new HushPinterestPreferenceFragment.RowSemantics(this, Button.class));
    }

    @Override protected View onCreateDialogView() {
        session = new Session();
        return session.content;
    }

    @Override protected void onBindDialogView(View view) {
        super.onBindDialogView(view);
        session.message.setVisibility(View.VISIBLE);
        session.message.setText(L10n.t(getContext(), "Checking download history..."));
    }

    @Override protected void onPrepareDialogBuilder(AlertDialog.Builder builder) {
        super.onPrepareDialogBuilder(builder);
        builder.setNeutralButton(L10n.t(getContext(), "Refresh"), null);
    }

    @Override protected void showDialog(Bundle state) {
        try {
            super.showDialog(state);
            Session opened = session;
            opened.dialog = (AlertDialog) getDialog();
            ScreenColors.dialog(opened.dialog);
            opened.dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener(view -> opened.refresh(null));
            opened.dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(view -> {
                if (opened.alive()) DownloadLedger.openDownloads(getContext());
            });
            opened.refresh(null);
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "open native download history", failure);
            if (getDialog() != null) getDialog().dismiss();
            session = null;
            Utils.showToastLong(L10n.t(getContext(), "Couldn't check Downloads. Try again."));
        }
    }

    @Override protected void onDialogClosed(boolean positiveResult) {
        Session closed = session;
        session = null;
        if (closed != null && closed.jobDialog != null) closed.jobDialog.dismiss();
        super.onDialogClosed(positiveResult);
    }

    @Override protected void onPrepareForRemoval() {
        onActivityDestroy();
        super.onPrepareForRemoval();
    }

    private boolean retryEnabled() {
        return Build.VERSION.SDK_INT >= 29 && Utils.settingsReady()
                && PatchFamily.Capability.PIN_DOWNLOADS.installed() && Settings.DOWNLOAD_PINS.get();
    }

    private String pinName(DownloadLedger.Job job) {
        return L10n.f(getContext(), "Pin %s", L10n.isolate(job.pinId));
    }

    private String detail(DownloadLedger.Job job) {
        Date created = new Date(job.createdAt);
        String time = DateFormat.getDateFormat(getContext()).format(created) + " "
                + DateFormat.getTimeFormat(getContext()).format(created);
        String reason = job.reasonText();
        return L10n.isolate(time) + "\n" + job.statusText() + (reason.isEmpty() ? "" : "\n" + reason);
    }

    /** One open screen. A callback from a dismissed or replaced screen can't change its successor. */
    private final class Session {
        final LinearLayout content = new LinearLayout(getContext());
        final TextView message = new TextView(getContext());
        final ListView list = new ListView(getContext());
        List<DownloadLedger.Job> jobs = Collections.emptyList();
        AlertDialog dialog;
        AlertDialog jobDialog;
        boolean busy;

        Session() {
            content.setOrientation(LinearLayout.VERTICAL);
            message.setId(android.R.id.message);
            message.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            message.setTextColor(ScreenColors.DEFAULT.summary);
            message.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
            int inset = dp(24);
            message.setPaddingRelative(inset, dp(12), inset, dp(12));
            content.addView(message, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            list.setId(android.R.id.list);
            list.setDivider(null);
            list.setSelector(new ColorDrawable(Color.TRANSPARENT));
            list.setVisibility(View.GONE);
            // The native list scrolls through the bounded history without pushing actions offscreen.
            int height = Math.min(dp(320), getContext().getResources().getDisplayMetrics().heightPixels / 3);
            content.addView(list, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, height));
            list.setOnItemClickListener((parent, view, position, id) -> {
                if (!busy && position >= 0 && position < jobs.size()) refresh(jobs.get(position).id);
            });
        }

        boolean alive() { return session == this && dialog != null && dialog.isShowing(); }

        void working() {
            busy = true;
            list.setEnabled(false);
            dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setEnabled(false);
            message.setText(L10n.t(getContext(), "Checking download history..."));
        }

        void refresh(Long chooseId) {
            if (!alive() || busy) return;
            working();
            DownloadLedger.refresh(getContext(), found -> {
                if (!alive()) return;
                try {
                    jobs = found == null ? Collections.emptyList() : new ArrayList<>(found);
                    CharSequence[] names = new CharSequence[jobs.size()];
                    CharSequence[] details = new CharSequence[jobs.size()];
                    for (int i = 0; i < jobs.size(); i++) {
                        names[i] = pinName(jobs.get(i));
                        details[i] = detail(jobs.get(i));
                    }
                    list.setAdapter(new ChoiceCards(ScreenColors.DEFAULT, names, details));
                    list.setVisibility(jobs.isEmpty() ? View.GONE : View.VISIBLE);
                    message.setText(L10n.t(getContext(), found == null ? "Couldn't check Downloads. Try again."
                            : jobs.isEmpty() ? Build.VERSION.SDK_INT < 29
                                ? "Android 9 uses the file picker. Results from visible-pin selections appear here."
                                : "No HushPinterest downloads in this history."
                            : jobs.stream().anyMatch(job -> job.id < 0)
                                ? "Only the 32 most recent downloads and selection results are listed. Saved files are kept."
                                : "Only the 32 most recent HushPinterest requests are listed. Manage active downloads in Downloads."));
                } catch (RuntimeException failure) {
                    HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "show native download history", failure);
                    jobs = Collections.emptyList();
                    list.setVisibility(View.GONE);
                    message.setText(L10n.t(getContext(), "Couldn't check Downloads. Try again."));
                } finally {
                    busy = false;
                    list.setEnabled(true);
                    dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setEnabled(true);
                }
                if (chooseId != null) {
                    for (DownloadLedger.Job job : jobs) if (job.id == chooseId) { showJob(job); break; }
                }
            });
        }

        void showJob(DownloadLedger.Job job) {
            if (!alive() || busy || jobDialog != null) return;
            boolean retry = job.canRetry() && retryEnabled();
            List<CharSequence> names = new ArrayList<>();
            List<CharSequence> details = new ArrayList<>();
            if (retry) {
                names.add(L10n.t(getContext(), "Retry download"));
                details.add(L10n.t(getContext(), "Starts a new download. Android manages it."));
            }
            names.add(L10n.t(getContext(), "Open pin"));
            details.add(L10n.t(getContext(), "Open the pin again to get a fresh download link."));
            names.add(L10n.t(getContext(), "Remove from history"));
            details.add(L10n.t(getContext(), "Removes this history entry. Files and active downloads are kept."));

            LinearLayout header = new LinearLayout(getContext());
            header.setOrientation(LinearLayout.VERTICAL);
            header.setPaddingRelative(dp(24), dp(20), dp(24), dp(12));
            TextView title = new TextView(getContext());
            title.setText(pinName(job));
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
            title.setTextColor(ScreenColors.DEFAULT.title);
            title.setAccessibilityHeading(true);
            header.addView(title);
            TextView status = new TextView(getContext());
            status.setId(android.R.id.message);
            status.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            String guidance = "";
            if (job.canRetry() && !retryEnabled()) {
                guidance = L10n.t(getContext(), Build.VERSION.SDK_INT >= 29 && Utils.settingsReady()
                        && PatchFamily.Capability.PIN_DOWNLOADS.installed()
                        ? "Resume HushPinterest and turn on Download pins to retry."
                        : "Open the pin again to get a fresh download link.");
            }
            status.setText(detail(job) + (guidance.isEmpty() ? "" : "\n" + guidance));
            status.setTextColor(ScreenColors.DEFAULT.summary);
            header.addView(status);
            try {
                AlertDialog opened = new AlertDialog.Builder(getContext()).setCustomTitle(header)
                        .setAdapter(new ChoiceCards(ScreenColors.DEFAULT, names.toArray(new CharSequence[0]),
                                details.toArray(new CharSequence[0])), (choice, position) -> {
                            if (!alive() || busy || jobDialog != choice) return;
                            if (retry && position == 0) change(job.id, true);
                            else if (position == (retry ? 1 : 0)) DownloadLedger.reopenPin(getContext(), job);
                            else change(job.id, false);
                        })
                        .setPositiveButton(L10n.t(getContext(), "Open Downloads"), (choice, which) -> {
                            if (alive() && jobDialog == choice) DownloadLedger.openDownloads(getContext());
                        })
                        .setNegativeButton(L10n.t(getContext(), "Back"), null).create();
                jobDialog = opened;
                opened.setOnDismissListener(ignored -> { if (jobDialog == opened) jobDialog = null; });
                opened.create();
                opened.getListView().setDivider(null);
                opened.getListView().setSelector(new ColorDrawable(Color.TRANSPARENT));
                ScreenColors.dialog(opened);
                opened.show();
            } catch (RuntimeException failure) {
                if (jobDialog != null) jobDialog.dismiss();
                jobDialog = null;
                HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "open native download history entry", failure);
                Utils.showToastLong(L10n.t(getContext(), "Couldn't check Downloads. Try again."));
            }
        }

        void change(long id, boolean retry) {
            if (!alive() || busy) return;
            working();
            Runnable after = () -> {
                if (!alive()) return;
                busy = false;
                refresh(null);
            };
            if (retry) DownloadLedger.retry(getContext(), id, after);
            else DownloadLedger.removeHistory(getContext(), id, after);
        }

        int dp(int value) {
            return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                    getContext().getResources().getDisplayMetrics()));
        }
    }
}
