package nl.johninnl.navigation;

import java.util.Locale;

/** Native observations only; no Activity, GPS, wall-clock or overlay dependency. */
public final class NavigationState {
    public static final long ROAD_TTL_MS = 30_000, ZONE_TTL_MS = 90_000;
    public static final long SPEED_TTL_MS = 5000;
    private String speedStatus = "unknown";
    private double currentKmh = Double.NaN;
    private long speedAt = -1;
    private boolean estimated;
    private String roadStatus = "unknown", zoneStatus = "unknown", unit = "", source = "", segment = "";
    private long roadAt = -1, zoneAt = -1, startAt, session;
    private double limitKmh = Double.NaN;
    private int rawLimit = -1, firstLeft, minimumLeft, left, percent;
    /** A control is split into consecutive segments; a segment starting right where the last ended continues it. */
    public static final long CHAIN_GAP_MS = 10_000; public static final int CHAIN_END_M = 300;
    private int chainObserved, links, lastLeft = -1; private long lastActiveAt = -1;

    public void reset(boolean enabled) {
        speedStatus = enabled ? "unknown" : "disabled"; speedAt = -1; currentKmh = Double.NaN;
        roadStatus = zoneStatus = enabled ? "unknown" : "disabled";
        roadAt = zoneAt = -1; limitKmh = Double.NaN; rawLimit = -1;
        source = segment = ""; chainObserved = links = 0; lastLeft = -1; lastActiveAt = -1;
    }

    public void current(double kmh, long at) {
        if (at < speedAt) return;
        speedAt = at;
        currentKmh = Double.isFinite(kmh) && kmh >= 0 && kmh <= 500 ? kmh : Double.NaN;
        speedStatus = Double.isNaN(currentKmh) ? "unknown" : "valid";
    }

    public void zone(String id, int remaining, int progress, long at) {
        if (remaining < 0 || progress < 0 || progress > 100) return;
        update("flitsmeister", id, remaining, progress, at);
    }

    public void speed(String units, int limit, long at) {
        if (at < roadAt) return;
        roadAt = at; rawLimit = limit;
        unit = units == null ? "" : units.trim().toLowerCase(Locale.ROOT).replace(" ", "");
        double factor = unit.equals("mph") || unit.equals("mi/h") || unit.equals("imperial") ? 1.609344 :
                unit.equals("km/h") || unit.equals("kmh") || unit.equals("kph") || unit.equals("metric") ? 1 : Double.NaN;
        limitKmh = limit > 0 ? limit * factor : Double.NaN;
        roadStatus = Double.isNaN(limitKmh) ? "unknown" : "valid";
    }

    public void legacy(int progress, int remaining, long at) {
        if (progress < 0 || progress > 100 || remaining < 0) return;
        update("legacy", "", remaining, progress, at);
    }

    public void insights(String id, int remaining, long at) {
        if (remaining < 0) return;
        update("insights", id == null ? "" : id, remaining, -1, at);
    }

    private void update(String feed, String id, int remaining, int progress, long at) {
        expire(at);
        if (at < zoneAt || (zoneStatus.equals("active") && !source.equals(feed))) return;
        if (remaining == 0 || progress == 100) { clear(feed, at); return; }
        boolean identityChanged = !id.equals(segment);
        boolean resetDistance = zoneStatus.equals("active") && remaining > left + Math.max(100, firstLeft / 5);
        boolean resetProgress = zoneStatus.equals("active") && progress >= 0 && percent >= 0 && progress + 5 < percent;
        if (!zoneStatus.equals("active") || identityChanged || resetDistance || resetProgress) {
            boolean recent = identityChanged && !id.isEmpty() && !segment.isEmpty() && feed.equals(source)
                    && lastActiveAt >= 0 && at - lastActiveAt <= CHAIN_GAP_MS && lastLeft >= 0;
            // A new segment measured to the same end (remaining did not jump up) is the same control.
            boolean sameEnd = recent && remaining <= lastLeft + 100;
            boolean continues = recent && lastLeft <= CHAIN_END_M;
            if (sameEnd) {
                source = feed; segment = id; estimated = progress < 0 || feed.equals("flitsmeister");
                zoneStatus = "active"; zoneAt = at; left = remaining; lastLeft = remaining; lastActiveAt = at;
                minimumLeft = Math.min(minimumLeft, remaining); percent = progress;
                return;
            } else if (continues) {
                // The previous segment was driven to its end: keep the session, its start and that distance.
                chainObserved += firstLeft; links++;
            } else {
                session++; startAt = at; chainObserved = 0; links = 0;
            }
            firstLeft = minimumLeft = remaining; source = feed; segment = id;
        }
        estimated = progress < 0 || feed.equals("flitsmeister");
        zoneStatus = "active"; zoneAt = at; left = remaining; lastLeft = remaining; lastActiveAt = at;
        minimumLeft = Math.min(minimumLeft, remaining); percent = progress;
    }

    public void clear(String feed, long at) {
        if (at < zoneAt || (zoneStatus.equals("active") && !source.equals(feed))) return;
        if (zoneStatus.equals("active")) lastActiveAt = at;
        zoneStatus = "inactive"; zoneAt = at; source = feed;
    }

    private void expire(long now) {
        if (speedAt >= 0 && now - speedAt > SPEED_TTL_MS && !speedStatus.equals("disabled")) speedStatus = "stale";
        if (roadAt >= 0 && now - roadAt > ROAD_TTL_MS && !roadStatus.equals("disabled")) roadStatus = "stale";
        if (zoneAt >= 0 && now - zoneAt > ZONE_TTL_MS && zoneStatus.equals("active")) zoneStatus = "stale";
    }

    public Snapshot snapshot(long now) {
        expire(now);
        boolean active = zoneStatus.equals("active");
        int observed = active ? chainObserved + firstLeft - minimumLeft : -1;
        long elapsed = zoneAt - startAt;
        double avg = active && observed >= 30 && elapsed >= 3000 ? observed * 3600.0 / elapsed : Double.NaN;
        // A continued control's total length is unknown: withhold the bar rather than restart it per segment.
        double progress = !active ? Double.NaN : percent >= 0 ? percent : links > 0 ? Double.NaN :
                Math.max(0, Math.min(100, 100.0 * (firstLeft - left) / firstLeft));
        return new Snapshot(roadStatus, zoneStatus, roadAt, zoneAt,
                roadStatus.equals("valid") ? limitKmh : Double.NaN,
                roadStatus.equals("valid") ? rawLimit : -1, unit, source, segment,
                session, active ? startAt : -1, active ? left : -1, observed, progress,
                active && estimated, avg, speedStatus, speedAt, speedStatus.equals("valid") ? currentKmh : Double.NaN);
    }

    public static final class Snapshot {
        public final String currentStatus;
        public final long currentAt;
        public final double currentKmh;
        public final String roadStatus, zoneStatus, unit, source, segment;
        public final long roadAt, zoneAt, zoneSession, observationStart;
        public final int rawLimit, remaining, observedMeters;
        public final double limitKmh, progress, averageKmh;
        public final boolean progressEstimated;
        Snapshot(String roadStatus, String zoneStatus, long roadAt, long zoneAt, double limitKmh,
                 int rawLimit, String unit, String source, String segment, long zoneSession,
                 long observationStart, int remaining, int observedMeters, double progress,
                 boolean progressEstimated, double averageKmh, String currentStatus, long currentAt, double currentKmh) {
            this.currentStatus = currentStatus; this.currentAt = currentAt; this.currentKmh = currentKmh;
            this.roadStatus = roadStatus; this.zoneStatus = zoneStatus; this.roadAt = roadAt; this.zoneAt = zoneAt;
            this.limitKmh = limitKmh; this.rawLimit = rawLimit; this.unit = unit; this.source = source;
            this.segment = segment; this.zoneSession = zoneSession; this.observationStart = observationStart;
            this.remaining = remaining; this.observedMeters = observedMeters; this.progress = progress;
            this.progressEstimated = progressEstimated; this.averageKmh = averageKmh;
        }
    }
}
