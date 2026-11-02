package app.myspoti.extension;

/**
 * Process-wide state for every export sync entry point. Activity instances and the
 * native-index observer share this coordinator so a second screen cannot queue a
 * second export pass behind the SAF write lock.
 */
final class ExportSyncCoordinator {
    static final class Snapshot {
        final boolean running;
        final boolean backgrounded;
        final boolean canStop;
        final boolean stopRequested;
        final String mode;
        final String status;
        final String lastResult;
        final int completed;
        final int total;

        Snapshot(boolean running, boolean backgrounded, boolean canStop,
                 boolean stopRequested, String mode, String status,
                 String lastResult, int completed, int total) {
            this.running = running;
            this.backgrounded = backgrounded;
            this.canStop = canStop;
            this.stopRequested = stopRequested;
            this.mode = mode;
            this.status = status;
            this.lastResult = lastResult;
            this.completed = completed;
            this.total = total;
        }

        String displayText() {
            if (!running) return lastResult;
            StringBuilder text = new StringBuilder();
            if (backgrounded) text.append("Background sync is running");
            else if ("Auto-sync".equals(mode)) text.append("Automatic background sync is running");
            else text.append("Sync is running");
            if (total > 0) text.append(" (").append(completed).append('/').append(total).append(" songs)");
            if (status != null && !status.trim().isEmpty()) text.append("\n").append(status);
            if (stopRequested) text.append("\nStopping after the current song finishes…");
            else if (canStop) text.append("\nYou can stop this sync here.");
            return text.toString();
        }
    }

    private static final Object LOCK = new Object();
    private static boolean running;
    private static boolean backgrounded;
    private static boolean canStop;
    private static boolean stopRequested;
    private static String mode = "";
    private static String status = "";
    private static String lastResult = "";
    private static int completed;
    private static int total;

    private ExportSyncCoordinator() {}

    static boolean tryStart(String requestedMode, boolean allowStop, String initialStatus) {
        synchronized (LOCK) {
            if (running) return false;
            running = true;
            backgrounded = false;
            canStop = allowStop;
            stopRequested = false;
            mode = requestedMode == null ? "Sync" : requestedMode;
            status = initialStatus == null ? "Preparing export…" : initialStatus;
            completed = 0;
            total = 0;
            return true;
        }
    }

    static Snapshot snapshot() {
        synchronized (LOCK) {
            return new Snapshot(running, backgrounded, canStop, stopRequested,
                    mode, status, lastResult, completed, total);
        }
    }

    static boolean isRunning() {
        synchronized (LOCK) { return running; }
    }

    static boolean isStopRequested() {
        synchronized (LOCK) { return stopRequested; }
    }

    static boolean requestStop() {
        synchronized (LOCK) {
            if (!running || !canStop || stopRequested) return false;
            stopRequested = true;
            status = "Stopping after the current song finishes…";
            return true;
        }
    }

    static void markBackgrounded() {
        synchronized (LOCK) {
            if (!running) return;
            backgrounded = true;
            status = "Continuing in the background. You can return to this page to check progress.";
        }
    }

    static void update(String nextStatus, int nextCompleted, int nextTotal) {
        synchronized (LOCK) {
            if (!running) return;
            if (nextStatus != null) status = nextStatus;
            if (nextCompleted >= 0) completed = nextCompleted;
            if (nextTotal >= 0) total = nextTotal;
        }
    }

    static void finish(String result) {
        synchronized (LOCK) {
            running = false;
            backgrounded = false;
            canStop = false;
            stopRequested = false;
            status = result == null || result.trim().isEmpty() ? "Sync finished." : result;
            lastResult = status;
            if (total > 0) completed = Math.max(completed, total);
        }
    }
}
