/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.download;

import android.content.Context;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.live.LiveRecordChip;
import app.morphe.extension.tiktok.settings.L10n;

import java.util.ArrayList;
import java.util.List;

/**
 * What the Downloads page shows of the saves under way (#27): each one in the order it was
 * accepted, what it's doing, and Cancel where Cancel can still do something. A save still in
 * line is taken out of it; one that runs stops after its file the way its progress row's Cancel
 * does, and one that can't be stopped mid-file, a single video, shows no Cancel. A LIVE being
 * recorded or saved is listed too, without a Cancel, since its file is already being written.
 * Under them, the last few saves that ended this session, each with how it went.
 */
public final class SaveQueue {
    private SaveQueue() {}

    /** One save as the page shows it. */
    public static final class Entry {
        /** The same for one save on every refresh, so the page can keep its row. */
        public final Object key;
        public final String title;
        public final String detail;
        private final MediaJobScheduler.Job job;

        private Entry(Object key, String title, String detail, MediaJobScheduler.Job job) {
            this.key = key;
            this.title = title;
            this.detail = detail;
            this.job = job;
        }

        /** True when Cancel would take the save out of line or stop it after its file. */
        public boolean canCancel() {
            if (job == null) return false;
            if (job.waiting()) return true;
            SaveProgress progress = job.progress;
            return job.running() && progress != null && progress.stoppable();
        }

        /** Cancel, as the save's own row would do it. */
        public void cancel() {
            if (job == null) return;
            SaveProgress progress = job.progress;
            if (progress != null) {
                progress.cancelFromRow();
                return;
            }
            if (job.cancel()) Utils.showToastShort(L10n.t("Save cancelled. Nothing was saved."));
        }
    }

    /** Stands for a LIVE recording in {@link Entry#key}: there's one at a time. */
    private static final Object LIVE = new Object();

    /** Every save under way, oldest first, the LIVE recording last. Main thread, for the LIVE. */
    public static List<Entry> entries(Context context) {
        List<Entry> entries = new ArrayList<>();
        List<MediaJobScheduler.Job> jobs = MediaJobScheduler.jobs();
        // The pool's own number, not the setting's: an imported or reset setting reaches the
        // pool only with the next save.
        int limit = MediaJobScheduler.poolLimit();
        for (int index = 0; index < jobs.size(); index++) {
            MediaJobScheduler.Job job = jobs.get(index);
            if (!job.waiting() && !job.running()) continue;
            String title = UnfinishedSaves.kindLabel(context, job.label);
            entries.add(new Entry(job, title, detail(context, job, index - limit + 1), job));
        }
        String live = LiveRecordChip.queueStatus();
        if (live != null) entries.add(new Entry(LIVE, L10n.t(context, "LIVE"), live, null));
        return entries;
    }

    /**
     * The saves that ended this session, newest first, each with how it went: what it last told
     * the reader (its count, or why it stopped), or that it was cancelled before it started.
     */
    public static List<Entry> endedEntries(Context context) {
        List<Entry> entries = new ArrayList<>();
        for (MediaJobScheduler.Ended ended : MediaJobScheduler.ended()) {
            String title = UnfinishedSaves.kindLabel(context, ended.label);
            entries.add(new Entry(ended, title, outcome(context, ended), null));
        }
        return entries;
    }

    static String outcome(Context context, MediaJobScheduler.Ended ended) {
        if (ended.cancelled) return L10n.t(context, "Save cancelled. Nothing was saved.");
        if (ended.failed) return L10n.t(context, "Stopped by an unexpected error");
        return ended.said != null ? ended.said : L10n.t(context, "Done");
    }

    /**
     * What a save is doing. One in line says how many saves have to end before it starts:
     * those accepted before it, less the ones that make room by ending, which is every running
     * slot but the one it takes.
     */
    static String detail(Context context, MediaJobScheduler.Job job, int ahead) {
        SaveProgress progress = job.progress;
        String status = progress != null ? progress.statusText() : null;
        // Waiting for Wi-Fi isn't a place in line: no worker frees it, the network does.
        if (job.parked()) return status != null ? status : L10n.t(context, "Waiting for Wi-Fi");
        if (job.waiting() && ahead > 0) {
            String line = L10n.quantity(context, ahead,
                    "Starts after one other save", "Starts after %1$s other saves");
            return status == null ? line : status + "\n" + line;
        }
        return status != null ? status : L10n.t(context, "Saving");
    }

    /** The row's summary: the saves by name, or that there are none. */
    public static String summary(Context context, List<Entry> entries) {
        if (entries.isEmpty()) return L10n.t(context, "Nothing is saving right now");
        List<String> names = new ArrayList<>();
        for (Entry entry : entries) names.add(entry.title);
        return String.join(", ", names);
    }

    /** Saves at once as it's saved now: a waiting save starts at once if the new number has room. */
    public static void applyLimit() {
        MediaJobScheduler.applyLimit();
    }

    /** Save only on Wi-Fi as it's saved now: turned off, the saves waiting for Wi-Fi start. */
    public static void networkSettingChanged() {
        SaveNetwork.changed();
    }
}
