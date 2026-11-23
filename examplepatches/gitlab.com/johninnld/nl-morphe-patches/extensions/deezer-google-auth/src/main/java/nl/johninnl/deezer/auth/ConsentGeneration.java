package nl.johninnl.deezer.auth;

/** Minted before the chooser; identity survives coroutine cloning and is never persisted. */
public final class ConsentGeneration {
    private boolean active = true;
    private Object credential;

    public synchronized boolean isActive() { return active; }

    public synchronized boolean isCurrentFor(ConsentGeneration current, boolean googleMode) {
        return active && this == current && googleMode;
    }

    public synchronized boolean bindCredential(Object value) {
        if (!active || value == null || credential != null) return false;
        credential = value;
        return true;
    }

    public synchronized boolean matchesCredential(Object value) {
        return active && credential != null && credential == value;
    }

    public synchronized Object credential() { return active ? credential : null; }

    public synchronized void retire() { active = false; credential = null; }
}
