package app.jimaku.extension.settings;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.function.Supplier;

import app.jimaku.extension.Languages;
import app.jimaku.extension.jobs.JobKind;
import app.jimaku.extension.session.PendingJob;
import app.jimaku.extension.session.VideoSession;

/**
 * The job being waited on, kept in Jimaku's own preferences file beside the install, so it is picked
 * up again after the app restarted. A record that can't be read counts as none, as in the extension.
 */
public final class KeptPending implements VideoSession.Pending {
    private static final String JOB = "pending_job", VIDEO = "pending_video", LANG = "pending_lang", KIND = "pending_kind",
            TITLE = "pending_title", JOINED = "pending_joined";

    private final Supplier<SharedPreferences> prefs;

    /** {@code context} gives the app's context once YouTube has one, or null before. */
    public static KeptPending of(Supplier<Context> context) {
        return new KeptPending(() -> {
            Context found = context.get();
            return found == null ? null : found.getSharedPreferences("jimaku", Context.MODE_PRIVATE);
        });
    }

    KeptPending(Supplier<SharedPreferences> prefs) {
        this.prefs = prefs;
    }

    @Override
    public synchronized PendingJob load() {
        SharedPreferences kept = prefs.get();
        if (kept == null) return null;
        String job = kept.getString(JOB, null), video = kept.getString(VIDEO, null), lang = kept.getString(LANG, null);
        JobKind kind = JobKind.of(kept.getString(KIND, ""));
        if (job == null || video == null || lang == null || !Languages.isLanguageCode(lang) || kind == null) return null;
        return new PendingJob(job, video, lang, kind, kept.getString(TITLE, ""), kept.getBoolean(JOINED, false));
    }

    @Override
    public synchronized void save(PendingJob job) {
        SharedPreferences kept = prefs.get();
        if (kept == null) return;
        kept.edit().putString(JOB, job.job).putString(VIDEO, job.video).putString(LANG, job.lang).putString(KIND, job.kind.wire)
                .putString(TITLE, job.title).putBoolean(JOINED, job.joined).apply();
    }

    @Override
    public synchronized void clear(String expected) {
        SharedPreferences kept = prefs.get();
        if (kept == null) return;
        // Another job started since is the one waited on now, and stays.
        if (expected != null && !expected.equals(kept.getString(JOB, null))) return;
        kept.edit().remove(JOB).remove(VIDEO).remove(LANG).remove(KIND).remove(TITLE).remove(JOINED).apply();
    }
}
