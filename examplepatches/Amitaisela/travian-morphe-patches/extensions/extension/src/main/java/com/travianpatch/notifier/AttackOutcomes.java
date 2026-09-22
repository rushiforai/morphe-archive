package com.travianpatch.notifier;

import org.json.JSONObject;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * Spots an incoming attack that was called off: the attacker cancelled it, so it stops being listed
 * well before its landing time. The game doesn't say why an attack is gone, so it is told by time:
 * gone well before the landing time means called off; gone at or after it is just the attack landing,
 * which is not reported. Pure logic (no Android APIs) so it can be checked against sample data
 * off-device.
 */
final class AttackOutcomes {

    /**
     * Gone earlier than this before its landing time counts as called off. Generous on purpose: the
     * phone's clock can be a little behind the game's, and reporting a real landing as "called off"
     * would be misleading. An attack cancelled inside the last two minutes goes unreported.
     */
    static final long EARLY_MARGIN_MS = 120_000L;

    /** An attack seen in flight, with everything needed to word its outcome later. */
    static final class Tracked {
        final String key;
        final long arrivalMs;
        final String kind; // "attack" or "raid"
        final String target; // "Home (1|2)"
        final String origin; // "Bob — Enemy (5|6)"

        Tracked(String key, long arrivalMs, String kind, String target, String origin) {
            this.key = key;
            this.arrivalMs = arrivalMs;
            this.kind = kind;
            this.target = target;
            this.origin = origin;
        }

        static Tracked of(AttackAlerts.Alert a) {
            return new Tracked(a.key, a.arrivalMs, a.kind, AttackAlerts.targetLabel(a), AttackAlerts.originLabel(a));
        }
    }

    private AttackOutcomes() {
    }

    /** True if this attack, no longer listed at nowMs, was called off rather than landing. */
    static boolean calledOff(Tracked t, long nowMs) {
        return nowMs < t.arrivalMs - EARLY_MARGIN_MS;
    }

    static String title(Tracked t) {
        return "Incoming " + t.kind + " called off";
    }

    static String text(Tracked t) {
        return "The " + t.kind + " on " + t.target + " from " + t.origin + " was called off before it landed.";
    }

    static String toJson(Collection<Tracked> tracked) {
        JSONObject root = new JSONObject();
        try {
            for (Tracked t : tracked) {
                JSONObject o = new JSONObject();
                o.put("arrivalMs", t.arrivalMs);
                o.put("kind", t.kind);
                o.put("target", t.target);
                o.put("origin", t.origin);
                root.put(t.key, o);
            }
        } catch (Exception e) {
            // an entry that can't be written is simply left out
        }
        return root.toString();
    }

    /** Empty for null or unreadable input. */
    static Map<String, Tracked> fromJson(String json) {
        Map<String, Tracked> out = new HashMap<String, Tracked>();
        if (json == null) {
            return out;
        }
        try {
            JSONObject root = new JSONObject(json);
            Iterator<String> keys = root.keys();
            while (keys.hasNext()) {
                String key = keys.next();
                JSONObject o = root.getJSONObject(key);
                out.put(key, new Tracked(key, o.getLong("arrivalMs"), o.getString("kind"),
                        o.getString("target"), o.getString("origin")));
            }
        } catch (Exception e) {
            out.clear(); // unreadable: start over rather than report half of it
        }
        return out;
    }
}
