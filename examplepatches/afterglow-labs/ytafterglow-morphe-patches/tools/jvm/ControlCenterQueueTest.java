package app.afterglow.extension.ui;

import android.view.View;
import android.widget.TextView;
import java.util.List;
import app.afterglow.extension.downloads.DownloadJob;
import app.afterglow.extension.downloads.DownloadManager;
import app.afterglow.extension.downloads.QueueFixtures;
import static app.afterglow.extension.downloads.DownloadJob.State.*;
import static app.afterglow.extension.downloads.DownloadJob.Phase.*;

public final class ControlCenterQueueTest {
    private static int checks;
    private static void check(boolean value, String label) { checks++; if (!value) throw new AssertionError(label); }
    private static DownloadJob job(DownloadJob.State state, DownloadJob.Phase phase, long bytes, long total) {
        return QueueFixtures.job("one", state, phase, bytes, total);
    }
    public static void main(String[] args) {
        DownloadManager manager = new DownloadManager();
        manager.jobs = List.of(job(RUNNING, VIDEO_TRANSFER, 0, 100));
        ControlCenterQueueState initial = ControlCenterQueueUpdates.snapshot(manager);
        View anchor = new View(); TextView status = new TextView(); status.setText(initial.status());
        int[] rebuilds = {0}; boolean[] alive = {true};
        ControlCenterQueueUpdates updates = new ControlCenterQueueUpdates(anchor, manager, initial, status, () -> alive[0], () -> rebuilds[0]++);
        manager.changed(); check(anchor.posts == 0, "no detached callbacks");
        anchor.attach();
        check(manager.listeners.size() == 1 && anchor.pending.size() == 1, "attach installs one listener and catches missed state");
        for (int i = 1; i <= 100; i++) { manager.jobs = List.of(job(RUNNING, VIDEO_TRANSFER, i, 100)); manager.changed(); }
        check(anchor.posts == 1 && anchor.delay == 250, "burst coalesced without extending first-event deadline");
        anchor.flush();
        check(rebuilds[0] == 0, "100 byte updates never rebuild controls");
        check(status.getText().toString().endsWith("100%") && status.writes == 2, "one stable status view receives latest progress");
        check(status.focused, "focused status view retained");
        manager.changed(); anchor.flush();
        check(status.writes == 2 && rebuilds[0] == 0, "identical status performs no accessibility text write");
        manager.jobs = List.of(job(RUNNING, AUDIO_TRANSFER, 10, 200)); manager.changed(); anchor.flush();
        check(status.getText().toString().equals("running · audio transfer · 5%") && rebuilds[0] == 0, "phase and new byte total update only status");
        manager.jobs = List.of(job(RUNNING, MUX, 10, -1)); manager.changed(); anchor.flush();
        check(status.getText().toString().equals("running · mux") && rebuilds[0] == 0, "unknown progress removes percent without rebuilding");
        manager.jobs = List.of(job(PAUSED, MUX, 10, -1)); manager.changed(); anchor.flush();
        check(rebuilds[0] == 1, "pause rebuilds controls to replace pause with resume");
        for (int i = 0; i < 100; i++) manager.changed();
        check(anchor.pending.isEmpty() && rebuilds[0] == 1, "structural rebuild requested once until old view detaches");
        anchor.detach();
        check(manager.listeners.isEmpty() && anchor.pending.isEmpty(), "detachment removes listener and callbacks");

        View next = new View(); TextView nextStatus = new TextView();
        new ControlCenterQueueUpdates(next, manager, ControlCenterQueueUpdates.snapshot(manager), nextStatus, () -> alive[0], () -> rebuilds[0]++);
        next.attach(); check(manager.listeners.size() == 1, "replacement view owns exactly one listener");
        next.detach(); next.flush();
        check(nextStatus.writes == 0 && rebuilds[0] == 1, "queued callback cannot touch detached controls");
        next.attach(); alive[0] = false; next.flush();
        check(nextStatus.writes == 0 && rebuilds[0] == 1, "finishing activity is untouched");
        next.detach(); alive[0] = true;

        manager.jobs = List.of(job(QUEUED, METADATA, 0, -1), QueueFixtures.job("two", QUEUED, METADATA, 0, -1), QueueFixtures.job("three", FAILED, EXTRACTION, 0, -1));
        ControlCenterQueueState queued = ControlCenterQueueUpdates.snapshot(manager);
        check(queued.current.id.equals("one") && queued.queued == 1 && queued.failed == 1, "first queued job shown separately from waiting count");
        manager.jobs = List.of(job(RUNNING, VIDEO_TRANSFER, 20, 100));
        ControlCenterQueueState active = ControlCenterQueueUpdates.snapshot(manager);
        check(!active.sameControls(queued), "queue insertion and state transitions are structural");
        manager.loaded = false; check(!active.sameControls(ControlCenterQueueUpdates.snapshot(manager)), "load completion is structural"); manager.loaded = true;
        manager.recovery = "Recovered queue"; check(!active.sameControls(ControlCenterQueueUpdates.snapshot(manager)), "queue recovery notice is structural"); manager.recovery = null;
        manager.library.recovery = "Recovered library"; check(!active.sameControls(ControlCenterQueueUpdates.snapshot(manager)), "library recovery notice is structural"); manager.library.recovery = null;
        manager.jobs = List.of(QueueFixtures.job("different", RUNNING, VIDEO_TRANSFER, 20, 100));
        check(!active.sameControls(ControlCenterQueueUpdates.snapshot(manager)), "same state with new current identity rebuilds details actions");
        manager.library.items = List.of(QueueFixtures.item("a", 1, false), QueueFixtures.item("b", 4, false), QueueFixtures.item("c", 3, false), QueueFixtures.item("d", 2, false));
        ControlCenterQueueState library = ControlCenterQueueUpdates.snapshot(manager);
        check(library.libraryCount == 4 && library.recent.size() == 3 && library.recent.get(0).id.equals("b"), "recent three ordered separately from full count");
        manager.library.items = List.of(QueueFixtures.item("a", 1, false), QueueFixtures.item("b", 4, true), QueueFixtures.item("c", 3, false), QueueFixtures.item("d", 2, false));
        check(!library.sameControls(ControlCenterQueueUpdates.snapshot(manager)), "missing recent item rebuilds its action");
        check(ControlCenterQueueUpdates.snapshot(null) == null, "uninstalled downloader has no snapshot or manager access");
        System.out.println("PASS " + checks + " Control Center progress/identity/lifecycle checks");
    }
}
