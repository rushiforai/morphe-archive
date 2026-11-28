package com.waze.gw;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;

/** Shared parsing and selection rules for upcoming-alert renderers. */
final class UpcomingAlertModel {
    static final class Entry {
        final String rawIcon;
        final String distance;
        final int meters;
        final int speed;
        /** 0 = not a traffic jam; 1..4 = light, moderate, heavy, standstill (the bigpin_traffic_N badges). */
        final int jamLevel;

        Entry(String rawIcon, String distance, int meters, int speed, int jamLevel) {
            this.rawIcon = rawIcon;
            this.distance = distance;
            this.meters = meters;
            this.speed = speed;
            this.jamLevel = jamLevel;
        }

        String key() {
            // one chip for the nearest jam, whatever its level
            return speed > 0 ? "speed" : jamLevel > 0 ? "jam" : rawIcon.toLowerCase(Locale.US);
        }
    }

    private UpcomingAlertModel() { }

    static List<Entry> select(List<String> rows, int currentLimit, int maxMeters, int maxCount) {
        ArrayList<Entry> out = new ArrayList<Entry>();
        if (rows == null || maxCount <= 0) return out;
        for (String row : rows) {
            try {
                String[] parts = row.split("\\t", -1);
                if (parts.length < 5) continue;
                int meters = Integer.parseInt(parts[3]);
                if (meters < 0 || meters > maxMeters) continue;
                String rawIcon = parts[4] == null ? "" : parts[4];
                int speed = speedFromIcon(rawIcon);
                if (speed > 0 && speed == currentLimit) continue;
                int jam = jamLevel(parts);
                String text = parts[2];
                if (jam > 0) {                       // "<icon> +<minutes> phút" when Waze names the delay
                    int minutes = HudAlertCodec.jamDelayMinutes(parts);
                    if (minutes > 0) text = I18n.f("core.0_min", minutes);
                }
                Entry entry = new Entry(rawIcon, text, meters, speed, jam);
                if (entry.key().length() == 0) continue;
                out.add(entry);
            } catch (Throwable ignored) { }
        }
        Collections.sort(out, new Comparator<Entry>() {
            @Override public int compare(Entry left, Entry right) {
                return Integer.compare(left.meters, right.meters);
            }
        });
        ArrayList<Entry> selected = new ArrayList<Entry>();
        HashSet<String> seen = new HashSet<String>();
        Entry nearestJam = null;
        for (Entry entry : out) {
            if (entry.jamLevel > 0 && nearestJam == null) nearestJam = entry;
            if (selected.size() < maxCount && seen.add(entry.key())) selected.add(entry);
        }
        // The jam chip must not be pushed out by nearer alerts: it takes the last slot.
        if (nearestJam != null && maxCount > 1 && !selected.contains(nearestJam)) {
            selected.set(maxCount - 1, nearestJam);
            Collections.sort(selected, new Comparator<Entry>() {
                @Override public int compare(Entry left, Entry right) {
                    return Integer.compare(left.meters, right.meters);
                }
            });
        }
        return selected;
    }

    /** 0 when the row is not a traffic jam, else 1..4 (jam severity: light/unknown, moderate, heavy, standstill). */
    static int jamLevel(String[] row) {
        if (HudAlertCodec.decode(row)[0] != HudAlertCodec.TRAFFIC_JAM) return 0;
        switch (HudAlertCodec.jamSeverity(row)) {
            case HudAlertCodec.JAM_SEVERITY_MODERATE: return 2;
            case HudAlertCodec.JAM_SEVERITY_HEAVY: return 3;
            case HudAlertCodec.JAM_SEVERITY_STANDSTILL:
            case HudAlertCodec.JAM_SEVERITY_CLOSED: return 4;
            default: return 1;
        }
    }

    static int speedFromIcon(String rawIcon) {
        if (rawIcon == null || !rawIcon.toLowerCase(Locale.US).startsWith("speeddrop_"))
            return -1;
        try {
            int speed = Integer.parseInt(rawIcon.substring(10));
            return speed >= 10 && speed <= 160 ? speed : -1;
        } catch (Throwable ignored) {
            return -1;
        }
    }

    /** Gives the safety-critical first 200 m half of the rail. */
    static float position(int meters, int horizonMeters) {
        float normalized = Math.max(0f, Math.min(1f, meters / (float) horizonMeters));
        if (normalized <= 0.2f) return normalized * 2.5f;
        return 0.5f + (normalized - 0.2f) * 0.625f;
    }
}
