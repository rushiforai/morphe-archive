package software.santodan.extension.nuviomerged;

/** A native Activity may take over only after the prepared splash has drawn. */
public final class NuvioStartupGate {
    private boolean resumed, prepared, drawn, launched, destroyed;
    public synchronized void resumed(boolean value) { resumed = value; }
    public synchronized void prepared() { prepared = true; drawn = false; }
    public synchronized void drawn() { if (prepared) drawn = true; }
    public synchronized void destroyed() { destroyed = true; }
    public synchronized boolean takeHandoff() {
        if (!resumed || !prepared || !drawn || launched || destroyed) return false;
        launched = true;
        return true;
    }
}
