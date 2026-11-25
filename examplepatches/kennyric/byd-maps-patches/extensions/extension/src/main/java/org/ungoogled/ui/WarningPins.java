package org.ungoogled.ui;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import nl.johninnl.navigation.alerts.IndicatorContract;
import nl.johninnl.navigation.alerts.WarningEvent;
import nl.johninnl.navigation.alerts.WarningGeometry;

/**
 * Map pins for the provider warnings the pills show (WARNINGS_V1), drawn as Maps' own personal places and,
 * during navigation, as Google's own incident callouts (IncidentPins).
 *
 * The pins take the pills' own selection -- the same warning identity, CLEAR, expiry, category choice and
 * passed/off-route filtering -- and add only the geometry rules of navigation-indicators-v1: a pin needs
 * the provider's own coordinate pair (never 0,0, never a receiver estimate); a fixed native point
 * ({@code native_point_target}) may stay until the warning's state expires, any other point (Waze, a
 * responder) only while its position observation is at most 5 s old. No direction and no zone extent: an
 * average-speed control is pinned only at its own native start (before entry) or end (inside), as the
 * provider marks it ({@code zone_point}, contract revision 12 November 2026).
 *
 * Display only: nothing here renews speech, an observation clock or warning state, and nothing is logged.
 */
final class WarningPins {
    private WarningPins() {}

    /** Non-fixed positions older than this are no longer pinned (contract: fresh = 5 s). */
    static final long FRESH_MS = 5000;
    /** Maps rebuilds every visible tile's labels per redraw: at most one alert-driven redraw this often. */
    static final long MIN_REDRAW_MS = 1000;

    /** One pin. Value equality, so an unchanged selection never asks Maps to draw again. */
    static final class Pin {
        /** Stable per warning (provider session + warning id), hashed: carries no id text or position. */
        final String key;
        /** The warning's icon key from the shared vocabulary (WarningIcons / IndicatorContract). */
        final String icon;
        final double lat, lng;
        final String title;
        final boolean mapFeature;

        Pin(String key, String icon, double lat, double lng, String title) {
            this(key, icon, lat, lng, title, false);
        }
        Pin(String key, String icon, double lat, double lng, String title, boolean mapFeature) {
            this.key = key; this.icon = icon; this.lat = lat; this.lng = lng; this.title = title;
            this.mapFeature = mapFeature;
        }

        String emoji() { return WarningPins.emoji(icon); }

        @Override public boolean equals(Object o) {
            if (!(o instanceof Pin)) return false;
            Pin p = (Pin) o;
            return key.equals(p.key) && icon.equals(p.icon) && Double.compare(lat, p.lat) == 0
                    && Double.compare(lng, p.lng) == 0 && title.equals(p.title) && mapFeature == p.mapFeature;
        }

        @Override public int hashCode() { return Objects.hash(key, icon, lat, lng, title, mapFeature); }

        /** Never the position: this may end up in a log line. */
        @Override public String toString() { return "Pin{" + key + "," + icon + "}"; }
    }

    /** The pins for [events] (the pills' selection) at [now], in the pills' order. */
    static List<Pin> select(List<WarningEvent> events, long now, boolean dutch) {
        if (events == null || events.isEmpty()) return Collections.emptyList();
        List<Pin> out = new ArrayList<>(events.size());
        for (WarningEvent event : events) {
            if (!placeable(event, now)) continue;
            String icon = IndicatorContract.icon(event);
            out.add(new Pin(key(event), icon, event.latitude, event.longitude, title(icon, dutch),
                    WarningGeometry.nativeMapFeature(event)));
        }
        return Collections.unmodifiableList(out);
    }

    /** Static map features use the place layer, not the road-report callout layer. */
    static List<Pin> incidentPins(List<Pin> pins) {
        List<Pin> result = new ArrayList<>();
        for (Pin pin : pins) if (!pin.mapFeature) result.add(pin);
        return Collections.unmodifiableList(result);
    }
    static List<Pin> mapPlaces(List<Pin> pins, boolean incidentsDrawing) {
        if (!incidentsDrawing) return pins;
        List<Pin> result = new ArrayList<>();
        for (Pin pin : pins) if (pin.mapFeature) result.add(pin);
        return Collections.unmodifiableList(result);
    }

    /**
     * [pins] in key order: a set for the map. The pills' order follows distance and can swap two equally
     * near warnings several times a second; the map's pins must not be drawn again for that.
     */
    static List<Pin> byKey(List<Pin> pins) {
        if (pins.size() < 2) return pins;
        List<Pin> out = new ArrayList<>(pins);
        out.sort((a, b) -> a.key.compareTo(b.key));
        return Collections.unmodifiableList(out);
    }

    /** The contract's geometry gate for a point drawn on the map. */
    static boolean placeable(WarningEvent event, long now) {
        if (event == null || !event.stateValid(now) || event.latitude == null || event.longitude == null) return false;
        double lat = event.latitude, lng = event.longitude;
        if (!Double.isFinite(lat) || !Double.isFinite(lng) || Math.abs(lat) > 90 || Math.abs(lng) > 180) return false;
        if (lat == 0 && lng == 0) return false;
        // Only the provider's own pair: an estimated position is not a native point.
        if (event.positionEstimated) return false;
        boolean fixed = Boolean.TRUE.equals(event.fields().get("native_point_target"));
        // A zone's fixed point is its start while approaching and its end inside, never anything else.
        if (fixed && "zone".equals(event.relevance)) return WarningGeometry.zonePoint(event) != null;
        if (fixed) return true;
        return WarningGeometry.fresh(event.positionObservedAt, now);
    }

    /** "w" + 16 hex: the same for every revision of one warning in one provider session. */
    static String key(WarningEvent event) {
        try {
            byte[] hash = MessageDigest.getInstance("SHA-256")
                    .digest((event.providerSession + "\n" + event.warningId).getBytes(StandardCharsets.UTF_8));
            StringBuilder out = new StringBuilder("w");
            for (int i = 0; i < 8; i++) out.append(Character.forDigit((hash[i] >> 4) & 0xf, 16)).append(Character.forDigit(hash[i] & 0xf, 16));
            return out.toString();
        } catch (NoSuchAlgorithmException impossible) {
            throw new IllegalStateException(impossible);
        }
    }

    /**
     * Maps' personal places carry an emoji or a remote photo URL as their icon, not a local bitmap, so each
     * icon of the shared vocabulary gets its closest emoji.
     */
    static String emoji(String icon) {
        switch (icon) {
            case "speed_trap": return "👮";
            case "speed_camera": return "📷";
            case "average_speed": return "⏱️";
            case "speed_trap_hotspot": return "🎯";
            case "traffic_jam": return "🚗";
            case "roadworks": return "🚧";
            case "poor_road": return "〰️";
            case "emergency": return "🚨";
            case "wrong_way": return "⛔";
            case "level_crossing": return "🚆";
            case "animals": return "🐾";
            case "bridge": return "🌉";
            case "matrix": return "❌";
            case "traffic_camera": return "🎥";
            case "maximum_speed_unknown": return "❓";
            case "border_nl": return "🇳🇱";
            case "speed_limit_130": return "🛣️";
            case "traffic_light": return "🚦";
            default: return "⚠️";   // incident, and anything new
        }
    }

    /** The pin's name: the kind, not the warning text (its distance would be stale on the map). */
    static String title(String icon, boolean dutch) {
        switch (icon) {
            case "speed_trap": return dutch ? "Snelheidscontrole" : "Speed trap";
            case "speed_camera": return dutch ? "Flitspaal" : "Speed camera";
            case "average_speed": return dutch ? "Trajectcontrole" : "Average speed check";
            case "speed_trap_hotspot": return dutch ? "Controlehotspot" : "Speed trap hotspot";
            case "traffic_jam": return dutch ? "File" : "Traffic jam";
            case "roadworks": return dutch ? "Werkzaamheden" : "Roadworks";
            case "poor_road": return dutch ? "Slecht wegdek" : "Poor road surface";
            case "emergency": return dutch ? "Hulpdienst" : "Emergency vehicle";
            case "wrong_way": return dutch ? "Spookrijder" : "Wrong-way driver";
            case "level_crossing": return dutch ? "Spoorwegovergang" : "Level crossing";
            case "animals": return dutch ? "Dieren op de weg" : "Animals on the road";
            case "bridge": return dutch ? "Brug" : "Bridge";
            case "matrix": return dutch ? "Rijstrook dicht" : "Lane closed";
            case "traffic_camera": return dutch ? "Verkeerscamera" : "Traffic camera";
            case "maximum_speed_unknown": return dutch ? "Maximumsnelheid" : "Speed limit";
            case "border_nl": return dutch ? "Grens" : "Border";
            case "speed_limit_130": return dutch ? "130 km/u" : "130 km/h";
            case "traffic_light": return dutch ? "Verkeerslicht" : "Traffic light";
            default: return dutch ? "Melding" : "Road alert";
        }
    }

    /** Bounded redraw rate: the first redraw after a quiet spell runs at once, later ones wait their turn. */
    static final class Throttle {
        private final long interval;
        private boolean ran;
        private long last;

        Throttle(long interval) { this.interval = interval; }

        /** How long to wait at [now] before the next redraw, 0..interval. */
        synchronized long delay(long now) {
            if (!ran || now < last) return 0;
            return Math.max(0, Math.min(interval, last + interval - now));
        }

        synchronized void ran(long now) { ran = true; last = now; }
    }
}
