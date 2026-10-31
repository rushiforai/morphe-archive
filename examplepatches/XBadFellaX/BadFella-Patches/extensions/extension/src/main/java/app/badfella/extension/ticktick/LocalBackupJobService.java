package app.badfella.extension.ticktick;

import android.app.job.JobParameters;
import android.app.job.JobService;
import app.badfella.extension.ticktick.locallists.AccountScope;
import java.util.concurrent.atomic.AtomicBoolean;

/** Periodic work stays off Android's main thread and stops when Android revokes the job. */
public final class LocalBackupJobService extends JobService {
    private AtomicBoolean cancelled;
    private Thread worker;

    @Override public boolean onStartJob(final JobParameters params) {
        final AtomicBoolean stop = new AtomicBoolean();
        cancelled = stop;
        worker = new Thread(new Runnable() {
            @Override public void run() {
                boolean retry = false;
                String profile = params.getExtras().getString("profile");
                try {
                    TickTickBridge bridge = TickTickBridge.create(LocalBackupJobService.this);
                    AccountScope account = bridge.accountScope();
                    if (!account.tag().equals(profile)) {
                        LocalBackupManager.recordFailure(LocalBackupJobService.this, profile,
                                "Backup paused: reopen BadFella Settings in the original account.");
                    } else {
                        LocalBackupManager.writeToFolder(LocalBackupJobService.this, account, stop,
                                true, params.getExtras().getLong("revision"));
                    }
                } catch (InterruptedException ignored) {
                    // Android will reschedule stopped work; no partial file counts as a backup.
                } catch (Exception error) {
                    LocalBackupManager.recordFailure(LocalBackupJobService.this, profile,
                            "Scheduled backup failed. Check the folder's access and free space, then try Back up now.");
                    retry = true;
                } finally {
                    if (!stop.get()) jobFinished(params, retry);
                }
            }
        }, "BadFella-local-backup");
        worker.start();
        return true;
    }

    @Override public boolean onStopJob(JobParameters params) {
        if (cancelled != null) cancelled.set(true);
        if (worker != null) worker.interrupt();
        return true;
    }
}
