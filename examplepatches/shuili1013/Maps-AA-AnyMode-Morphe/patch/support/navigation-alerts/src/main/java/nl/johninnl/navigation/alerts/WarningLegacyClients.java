package nl.johninnl.navigation.alerts;

import java.util.HashMap;
import java.util.Map;

/** Authenticated control-client observations. Confine this registry to the source actor.
 * The service authenticates each UID before calling observe; this class performs no package lookup.
 * Broadcast-only receivers cannot be discovered through this registry.
 */
public final class WarningLegacyClients {
    public static final int MAX_CLIENTS = 8;
    public static final long LEASE_MS = 45000;
    public enum Observation { ACCEPTED, OVERFLOW }

    private static final class Client {
        final boolean warningAware;
        final long until;
        Client(boolean warningAware, long until) { this.warningAware = warningAware; this.until = until; }
    }

    private final Map<Integer, Client> clients = new HashMap<>();
    private long lastNow = -1, overflowUntil;

    /** Renew only the authenticated caller's observation. Missing old-SDK awareness is false.
     * An untracked caller at capacity holds the legacy gate for its complete observation lease;
     * no tracked client is displaced, and another client's upgrade cannot clear that gate.
     */
    public Observation observe(int uid, boolean warningAware, long now) {
        if (uid <= 0) throw new IllegalArgumentException("CLIENT_UID");
        advance(now);
        if (!clients.containsKey(uid) && clients.size() == MAX_CLIENTS) {
            overflowUntil = Math.max(overflowUntil, now + LEASE_MS);
            return Observation.OVERFLOW;
        }
        clients.put(uid, new Client(warningAware, now + LEASE_MS));
        return Observation.ACCEPTED;
    }

    /** Unknown overflow is treated as active legacy output until its last observation expires. */
    public boolean legacyActive(long now) {
        advance(now);
        if (now < overflowUntil) return true;
        for (Client client : clients.values()) if (!client.warningAware) return true;
        return false;
    }

    private void advance(long now) {
        if (now < 0 || now < lastNow || now > Long.MAX_VALUE - LEASE_MS)
            throw new IllegalArgumentException("CLOCK");
        lastNow = now;
        clients.values().removeIf(client -> now >= client.until);
    }
}
