package app.afterglow.extension.ui;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import app.afterglow.extension.downloads.DownloadJob;
import app.afterglow.extension.downloads.LibraryItem;

/** The controls rendered by Control Center, separate from changing transfer counters. */
final class ControlCenterQueueState {
    final boolean loaded;
    final int libraryCount, queued, failed;
    final DownloadJob current;
    final List<LibraryItem> recent;
    final String recoveryMessage, libraryRecoveryMessage;
    private final List<Object> structure;

    ControlCenterQueueState(boolean loaded, List<DownloadJob> jobs, List<LibraryItem> library,
                            String recoveryMessage, String libraryRecoveryMessage) {
        this.loaded = loaded;
        this.libraryCount = library.size();
        this.recoveryMessage = recoveryMessage;
        this.libraryRecoveryMessage = libraryRecoveryMessage;
        structure = new ArrayList<>(Arrays.asList(loaded, libraryCount, recoveryMessage, libraryRecoveryMessage));
        int queued = 0, failed = 0;
        DownloadJob current = null;
        for (DownloadJob job : jobs) {
            if (job.state == DownloadJob.State.QUEUED) queued++;
            if (job.state == DownloadJob.State.FAILED) failed++;
            if (current == null && (job.state == DownloadJob.State.RUNNING
                    || job.state == DownloadJob.State.PAUSED
                    || job.state == DownloadJob.State.WAITING_FOR_DELIVERY)) current = job;
            // Phase, byte totals, progress and updatedAt change without replacing any controls.
            structure.addAll(Arrays.asList(job.id, job.state, job.request.title, job.request.videoId));
        }
        if (current == null) for (DownloadJob job : jobs) {
            if (job.state == DownloadJob.State.QUEUED) { current = job; queued--; break; }
        }
        this.current = current;
        this.queued = queued;
        this.failed = failed;
        recent = new ArrayList<>(library);
        recent.sort(Comparator.comparingLong((LibraryItem item) -> item.createdAt).reversed());
        if (recent.size() > 3) recent.subList(3, recent.size()).clear();
        for (LibraryItem item : recent) structure.addAll(Arrays.asList(item.id, item.title, item.videoId,
                item.mimeType, item.formatSummary, item.isMissing()));
    }

    boolean sameControls(ControlCenterQueueState other) {
        return other != null && structure.equals(other.structure);
    }

    String status() {
        if (current == null) return "";
        return words(current.state.name()) + " · " + words(current.phase.name())
                + (current.progress < 0 ? "" : " · " + Math.round(current.progress * 100) + "%");
    }

    private static String words(String value) {
        return value.toLowerCase(Locale.ROOT).replace('_', ' ');
    }
}
