/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.settings.preference;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.preference.Preference;
import android.view.View;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.SignedInUser;
import app.morphe.extension.tiktok.seen.SeenVideoHistory;
import app.morphe.extension.tiktok.seen.WatchHistoryImport;
import app.morphe.extension.tiktok.settings.L10n;
import java.lang.ref.WeakReference;
import java.text.NumberFormat;
import java.util.TimeZone;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicBoolean;

/** The picker and worker keep the account that asked, including when settings is recreated. */
@SuppressWarnings("deprecation")
public final class ImportSeenVideoHistoryPreference extends Preference {
    static final int REQUEST_IMPORT = 7321;
    private static final String ACCOUNT_STATE = "hushfeed_watch_import_account";
    private static final String ZONE_STATE = "hushfeed_watch_import_zone";
    private static final String SUMMARY =
            "Use this account's TikTok JSON export, up to %1$s MB and %2$s entries. Dates without a time zone use this phone's time zone.";
    private static final String SIGN_IN = "Sign in to TikTok before importing watch history.";
    private static final String ACCOUNT_CHANGED =
            "Your TikTok account changed. Choose the file again for this account.";
    private static final AtomicBoolean BUSY = new AtomicBoolean();
    private static final CopyOnWriteArrayList<WeakReference<ImportSeenVideoHistoryPreference>> ROWS =
            new CopyOnWriteArrayList<>();
    private static volatile PendingPick pending;
    private static String busyLine;

    private static final class PendingPick {
        final SeenVideoHistory.ImportTarget target;
        final String account;
        final TimeZone zone;

        PendingPick(SeenVideoHistory.ImportTarget target, String account, TimeZone zone) {
            this.target = target;
            this.account = account;
            this.zone = (TimeZone) zone.clone();
        }
    }

    public ImportSeenVideoHistoryPreference(Context context) {
        super(context);
        setKey("action_import_seen_video_history");
        setTitle(L10n.t(context, "Import watch history"));
        ROWS.add(new WeakReference<>(this));
        refreshState();
        setOnPreferenceClickListener(preference -> {
            if (!BUSY.get() && pending == null) TikTokPreferenceFragment.openSeenVideoHistoryPicker();
            return true;
        });
    }

    static void pickFile(TikTokPreferenceFragment fragment) {
        if (BUSY.get() || pending != null) return;
        SeenVideoHistory.ImportTarget target = SeenVideoHistory.captureImportTarget();
        if (target == null) {
            SettingsActionBanner.showNotice(fragment.getActivity(), L10n.t(SIGN_IN));
            return;
        }
        pending = new PendingPick(target, target.accountKey(), TimeZone.getDefault());
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT)
                .addCategory(Intent.CATEGORY_OPENABLE)
                .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                .setType("application/json");
        refreshRows();
        try {
            fragment.startActivityForResult(intent, REQUEST_IMPORT);
        } catch (RuntimeException failure) {
            pending = null;
            refreshRows();
            Logger.printException(() -> "Could not open watch-history file picker", failure);
            SettingsActionBanner.showNotice(fragment.getActivity(), L10n.t(
                    "This phone has no file picker, so there's no way to choose a file here"));
        }
    }

    static void savePickerState(Bundle state) {
        PendingPick pick = pending;
        if (pick != null) {
            state.putString(ACCOUNT_STATE, pick.account);
            state.putString(ZONE_STATE, pick.zone.getID());
        }
    }

    static void restorePickerState(Bundle state) {
        if (pending != null || state == null) return;
        String account = state.getString(ACCOUNT_STATE);
        String zone = state.getString(ZONE_STATE);
        if (account == null || zone == null) return;
        SeenVideoHistory.ImportTarget target = SeenVideoHistory.captureImportTarget();
        if (target != null && !account.equals(target.accountKey())) target = null;
        pending = new PendingPick(target, account, TimeZone.getTimeZone(zone));
        refreshRows();
    }

    static boolean onResult(TikTokPreferenceFragment fragment, int request, int result, Intent data) {
        if (request != REQUEST_IMPORT) return false;
        PendingPick pick = pending;
        pending = null;
        if (result != Activity.RESULT_OK || data == null || data.getData() == null) {
            refreshRows();
            return true;
        }
        Activity activity = fragment.getActivity();
        // On process recreation TikTok may not have supplied its account yet. Resolve that
        // saved request only when its original account is known again, before opening the file.
        SeenVideoHistory.ImportTarget recovered = pick == null ? null : pick.target;
        if (pick != null && recovered == null && pick.account.equals(SignedInUser.id())) {
            recovered = SeenVideoHistory.captureImportTarget();
        }
        final SeenVideoHistory.ImportTarget target = recovered;
        if (pick == null || target == null || !pick.account.equals(target.accountKey())
                || !target.isCurrentAccount()) {
            refreshRows();
            SettingsActionBanner.showNotice(activity, L10n.t(ACCOUNT_CHANGED));
            return true;
        }
        if (activity == null || !BUSY.compareAndSet(false, true)) {
            refreshRows();
            return true;
        }
        Context context = activity.getApplicationContext();
        WeakReference<Activity> window = new WeakReference<>(activity);
        Uri uri = data.getData();
        busyLine = "Reading watch history";
        refreshRows();
        SettingsActionBanner.showNotice(activity, L10n.t(context, busyLine));
        boolean accepted = Utils.runOnBackgroundThread(() -> {
            try {
                WatchHistoryImport.Records records = WatchHistoryImport.read(
                        context.getContentResolver().openInputStream(uri), pick.zone, System.currentTimeMillis());
                Utils.runOnMainThread(() -> {
                    busyLine = "Importing watch history";
                    refreshRows();
                });
                SeenVideoHistory.importHistory(target, records, outcome -> {
                    finish();
                    Activity currentWindow = window.get();
                    Context feedback = currentWindow == null ? context : currentWindow;
                    SettingsActionBanner.showNotice(feedback, outcomeMessage(context, target, outcome));
                });
            } catch (Exception failure) {
                Logger.printException(() -> "Could not read watch-history import", failure);
                Utils.runOnMainThread(() -> {
                    finish();
                    Activity currentWindow = window.get();
                    Context feedback = currentWindow == null ? context : currentWindow;
                    SettingsActionBanner.showNotice(feedback, failureMessage(context, failure));
                });
            }
        });
        if (!accepted) {
            finish();
            SettingsActionBanner.showNotice(activity, L10n.t(context,
                    "Couldn't start the import. Try again in a moment."));
        }
        return true;
    }

    private static String outcomeMessage(Context context, SeenVideoHistory.ImportTarget target,
                                         SeenVideoHistory.ImportResult outcome) {
        if (outcome.status == SeenVideoHistory.ImportStatus.ACCOUNT_CHANGED) return L10n.t(context, ACCOUNT_CHANGED);
        if (outcome.status == SeenVideoHistory.ImportStatus.SUPERSEDED) return L10n.t(context,
                "Your seen history changed before the import finished. Choose the file again.");
        if (outcome.status == SeenVideoHistory.ImportStatus.FAILED) return L10n.t(context,
                "Couldn't import watch history. Your saved history is unchanged.");
        String added = L10n.quantity(context, outcome.imported,
                "%1$s watched video added.", "%1$s watched videos added.",
                NumberFormat.getInstance().format(outcome.imported));
        String skipped = L10n.quantity(context, outcome.skipped,
                "%1$s entry skipped.", "%1$s entries skipped.",
                NumberFormat.getInstance().format(outcome.skipped));
        String explanation = L10n.f(context,
                "Skipped entries are invalid, expired, already recorded, or older than the newest %1$s videos.",
                NumberFormat.getInstance().format(SeenVideoHistory.MAX_RECORDS));
        String recovery = outcome.undoRetired ? " " + L10n.t(context,
                "Importing new history ended Undo for the earlier clear. You can clear the imported history.") : "";
        String account = target.isCurrentAccount() ? "" : " " + L10n.t(context,
                "Watch history was imported for the account that chose the file. Switch back to see it.");
        return added + " " + skipped + " " + explanation + recovery + account;
    }

    static String failureMessage(Context context, Exception failure) {
        if (!(failure instanceof WatchHistoryImport.Rejected)) return L10n.t(context,
                "Couldn't read that file. Choose it again.");
        switch (((WatchHistoryImport.Rejected) failure).reason) {
            case TOO_LARGE: return L10n.f(context,
                    "That file is larger than %1$s MB. Choose a smaller watch-history export.",
                    NumberFormat.getInstance().format(WatchHistoryImport.MAX_BYTES / (1024 * 1024)));
            case TOO_MANY: return L10n.f(context, "That file has more than %1$s watch-history entries.",
                    NumberFormat.getInstance().format(SeenVideoHistory.MAX_RECORDS));
            case UNSUPPORTED: return L10n.t(context, "That JSON file doesn't contain the supported TikTok watch history.");
            case DAMAGED: return L10n.t(context, "That watch-history file is damaged. Nothing was imported.");
            default: return L10n.t(context, "Couldn't read that file. Choose it again.");
        }
    }

    private static void finish() {
        BUSY.set(false);
        busyLine = null;
        refreshRows();
        ClearSeenVideoHistoryPreference.refreshRows();
    }

    private static void refreshRows() {
        for (WeakReference<ImportSeenVideoHistoryPreference> held : ROWS) {
            ImportSeenVideoHistoryPreference row = held.get();
            if (row == null) ROWS.remove(held);
            else row.refreshState();
        }
    }

    private void refreshState() {
        boolean signedIn = SignedInUser.id() != null;
        setEnabled(signedIn && !BUSY.get() && pending == null);
        setSummary(busyLine != null ? L10n.t(getContext(), busyLine) : signedIn
                ? L10n.f(getContext(), SUMMARY,
                        NumberFormat.getInstance().format(WatchHistoryImport.MAX_BYTES / (1024 * 1024)),
                        NumberFormat.getInstance().format(SeenVideoHistory.MAX_RECORDS))
                : L10n.t(getContext(), SIGN_IN));
    }

    @Override protected void onBindView(View view) {
        refreshState();
        super.onBindView(view);
        SettingsUi.styleTitleAndSummary(view);
    }
}
