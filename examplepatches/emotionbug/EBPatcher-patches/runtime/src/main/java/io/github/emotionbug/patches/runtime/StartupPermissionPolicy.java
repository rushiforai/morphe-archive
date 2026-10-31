package io.github.emotionbug.patches.runtime;

/** Permission-prompt eligibility only; never controls a call or authorizes recording. */
public final class StartupPermissionPolicy {
    public enum CallState { IDLE, RINGING, OFFHOOK, UNKNOWN }

    private boolean launcherResumed;
    private boolean finished;
    private long generation;

    /** A pause/resume invalidates any asynchronous phone-state observation. */
    public synchronized void resumed(boolean launcher) {
        launcherResumed = launcher;
        generation++;
    }

    public synchronized void paused() {
        launcherResumed = false;
        generation++;
    }

    public synchronized long observationToken() {
        return launcherResumed && !finished ? generation : -1;
    }

    /** Claim before IPC: denial, failure or repeated callbacks cannot request again this launch. */
    public synchronized boolean claimRequest(long token, boolean binderAvailable,
            boolean permissionGranted, CallState state) {
        if (token < 0 || token != generation || !launcherResumed || finished) return false;
        if (permissionGranted) {
            finished = true;
            return false;
        }
        if (!binderAvailable || state != CallState.IDLE) return false;
        finished = true;
        return true;
    }

    public synchronized boolean finished() { return finished; }

    public synchronized void finish() {
        finished = true;
        launcherResumed = false;
        generation++;
    }
}
