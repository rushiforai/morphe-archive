package com.travianpatch.notifier;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Finds incoming attacks that land close together on the same village (each within `windowMs` of the one
 * before), which usually means a coordinated wave. Uses only the attack list the check already reads.
 * Pure logic (no Android APIs).
 */
final class AttackWaves {

    /** Attacks landing within this long of the previous one count as one wave. */
    static final long WINDOW_MS = 2 * 60_000L;

    private AttackWaves() {
    }

    static final class Wave {
        final String key;
        final String targetVillage;
        final int count;
        final long firstMs;
        final long lastMs;

        Wave(String key, String targetVillage, int count, long firstMs, long lastMs) {
            this.key = key;
            this.targetVillage = targetVillage;
            this.count = count;
            this.firstMs = firstMs;
            this.lastMs = lastMs;
        }
    }

    static List<Wave> find(List<AttackAlerts.Alert> attacks, long windowMs) {
        Map<String, List<AttackAlerts.Alert>> byVillage = new LinkedHashMap<String, List<AttackAlerts.Alert>>();
        for (AttackAlerts.Alert a : attacks) {
            List<AttackAlerts.Alert> list = byVillage.get(a.targetVillage);
            if (list == null) {
                list = new ArrayList<AttackAlerts.Alert>();
                byVillage.put(a.targetVillage, list);
            }
            list.add(a);
        }
        List<Wave> waves = new ArrayList<Wave>();
        for (List<AttackAlerts.Alert> list : byVillage.values()) {
            Collections.sort(list, new Comparator<AttackAlerts.Alert>() {
                @Override
                public int compare(AttackAlerts.Alert x, AttackAlerts.Alert y) {
                    return Long.compare(x.arrivalMs, y.arrivalMs);
                }
            });
            int start = 0;
            for (int i = 1; i <= list.size(); i++) {
                boolean breaks = i == list.size() || list.get(i).arrivalMs - list.get(i - 1).arrivalMs > windowMs;
                if (breaks) {
                    int count = i - start;
                    if (count >= 2) {
                        AttackAlerts.Alert first = list.get(start);
                        waves.add(new Wave("wave:" + first.key + ":" + count, first.targetVillage, count,
                                first.arrivalMs, list.get(i - 1).arrivalMs));
                    }
                    start = i;
                }
            }
        }
        return waves;
    }

    static String title(Wave w) {
        return w.count + " attacks landing together!";
    }

    static String describe(Wave w) {
        long spanSec = (w.lastMs - w.firstMs) / 1000L;
        String span = spanSec < 60 ? spanSec + " s" : (spanSec / 60) + " min " + (spanSec % 60) + " s";
        return w.count + " attacks land on " + w.targetVillage + " within " + span + ".";
    }
}
