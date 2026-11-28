package com.waze.gw;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;
import java.util.LinkedHashSet;
import java.util.Set;

/** HLP/1-only encoder extracted from the protocol-neutral canonical state. */
final class HlpStateEncoder {
    private HlpStateEncoder() { }

    static String signature(HudCanonicalState state, Set<String> fields) {
        return json(state, fields, 0L, 4, 40).toString();
    }

    static byte[] encode(HudCanonicalState state, Set<String> requested, long ts)
            throws IOException {
        LinkedHashSet<String> fields = new LinkedHashSet<String>(requested);
        int alertCount = 4;
        int stringLimit = 40;
        JSONObject value = json(state, fields, ts, alertCount, stringLimit);
        try { return HlpFrameCodec.encode(value.toString()); }
        catch (IOException ignored) { }

        // alrs is explicitly opt-in, but navigation text has higher display priority. Reduce the
        // list from four toward one while keeping full street strings; shorten text only if a
        // single-alert snapshot still cannot fit the 512-byte HLP frame.
        if (fields.contains("alrs")) {
            for (alertCount = 3; alertCount >= 1; alertCount--) {
                value = json(state, fields, ts, alertCount, 40);
                try { return HlpFrameCodec.encode(value.toString()); }
                catch (IOException ignored) { }
            }
            for (stringLimit = 32; stringLimit >= 0; stringLimit -= 4) {
                value = json(state, fields, ts, 1, stringLimit);
                try { return HlpFrameCodec.encode(value.toString()); }
                catch (IOException ignored) { }
            }
        }

        // Only now fall back to the legacy compact state. Older firmware never requested alrs,
        // while a rich peer still receives alr/alrD/alrV if its full array cannot fit at all.
        fields.remove("alrs");
        stringLimit = 40;
        value = json(state, fields, ts, 0, stringLimit);
        try { return HlpFrameCodec.encode(value.toString()); }
        catch (IOException ignored) { }
        for (stringLimit = 32; stringLimit >= 0; stringLimit -= 4) {
            value = json(state, fields, ts, 0, stringLimit);
            try { return HlpFrameCodec.encode(value.toString()); }
            catch (IOException ignored) { }
        }
        // Optional content is removed deterministically before giving up.
        for (String optional : new String[]{"gap", "gapW", "st2", "st", "eta", "rkm", "rm", "avgL", "avgR", "avgP",
                "alrV", "alrD", "alr"}) {
            fields.remove(optional);
            value = json(state, fields, ts, 0, 0);
            try { return HlpFrameCodec.encode(value.toString()); }
            catch (IOException ignored) { }
        }
        throw new IOException("mandatory HLP state exceeds 512 bytes");
    }

    private static JSONObject json(HudCanonicalState state, Set<String> fields, long ts,
                                   int alertCount, int stringLimit) {
        JSONObject b = new JSONObject();
        try {
            b.put("v", 1).put("t", "s").put("ts", ts);
            if (fields.contains("nav")) b.put("nav", state.navigating ? 1 : 0);
            if (fields.contains("spd")) b.put("spd", Math.max(0, state.speedKmh));
            if (fields.contains("lim")) b.put("lim", Math.max(0, state.limitKmh));
            // Minimum legal speed, only when requested and known (additive HLP/1 field).
            if (fields.contains("min") && state.minimumLimitKmh >= 10)
                b.put("min", state.minimumLimitKmh);
            // Measured gap to the vehicle ahead (xADAS, opt-in); omitted when there is none.
            if (fields.contains("gap") || fields.contains("gapW")) {
                int gap = Gateway.measuredGapMetres();
                if (gap >= 0) {
                    if (fields.contains("gap")) b.put("gap", gap);
                    if (fields.contains("gapW")) b.put("gapW", Gateway.gapTooClose() ? 1 : 0);
                }
            }
            if (fields.contains("over")) b.put("over", state.limitKmh >= 10
                    && state.speedKmh > state.limitKmh + overMargin(state) ? 1 : 0);
            if (fields.contains("trn")) b.put("trn", state.turn);
            if (fields.contains("trn2")) b.put("trn2", state.nextTurn);
            if (fields.contains("dst")) b.put("dst", state.turnDistanceM);
            if (fields.contains("exit")) b.put("exit", state.exitNumber);
            if (fields.contains("lan")) {
                JSONArray laneArray = new JSONArray();
                Gateway.LaneSnapshot lanes = state.lanes == null
                        ? Gateway.LaneSnapshot.EMPTY : state.lanes;
                for (int lane = 0; lane < lanes.size(); lane++) {
                    int directions = 0;
                    int selected = 0;
                    for (int angle = 0; angle < lanes.angleCount(lane); angle++) {
                        int bit = HudLaneCodec.directionBit(lanes.angleAt(lane, angle));
                        directions |= bit;
                        if (lanes.isSelected(lane, angle)) selected |= bit;
                    }
                    if (directions != 0) laneArray.put(new JSONArray().put(directions).put(selected));
                }
                // Empty array explicitly clears guidance cached by the HUD.
                b.put("lan", laneArray);
            }
            if (fields.contains("st")) b.put("st", trimCodePoints(state.currentStreet, stringLimit));
            if (fields.contains("st2")) b.put("st2", trimCodePoints(state.nextStreet, stringLimit));
            if (fields.contains("eta")) b.put("eta", state.etaClock);
            if (fields.contains("rmin")) b.put("rmin", state.remainingMinutes);
            if (fields.contains("rm") && state.remainingMeters >= 0)
                b.put("rm", state.remainingMeters);
            if (fields.contains("rkm") && state.remainingMeters >= 0)
                b.put("rkm", Math.round(state.remainingMeters / 100.0) / 10.0);
            if (fields.contains("avg")) b.put("avg", averageZone(state) ? 1 : 0);
            if (averageZone(state)) {
                if (fields.contains("avgL")) b.put("avgL", state.averageLeftM);
                if (fields.contains("avgR")) b.put("avgR", state.recommendedSpeedKmh);
                if (fields.contains("avgP")) b.put("avgP", state.averagePercent);
            }
            if (!state.alerts.isEmpty()) {
                // Re-parse the retained legacy row here instead of relying on the decoded cache.
                // This deliberately preserves the old null/malformed-row control flow and keeps
                // HLP output characterization independent of future canonical alert mappings.
                String[] first = state.alerts.get(0).rawRow.split("\\t", -1);
                if (first.length >= 4) {
                    int[] code = HudAlertCodec.decode(first);
                    if (fields.contains("alr")) b.put("alr", code[0]);
                    if (fields.contains("alrD")) b.put("alrD", parseInt(first[3], -1));
                    if (fields.contains("alrV") && code[1] > 0) b.put("alrV", code[1]);
                    int severity = HudAlertCodec.jamSeverity(first);
                    int minutes = HudAlertCodec.jamDelayMinutes(first);
                    if (fields.contains("alrS") && severity > 0) b.put("alrS", severity);
                    if (fields.contains("alrM") && minutes > 0) b.put("alrM", minutes);
                }
            }
            if (fields.contains("alrs")) {
                JSONArray array = new JSONArray();
                if (alertCount > 0) {
                    for (int i = 0; i < state.alerts.size() && i < alertCount; i++) {
                        HudCanonicalAlert alert = state.alerts.get(i);
                        String[] row = alert.rawRow.split("\\t", -1);
                        if (row.length < 4) continue;
                        int[] code = HudAlertCodec.decode(row);
                        JSONObject item = new JSONObject();
                        item.put("k", code[0]).put("d", parseInt(row[3], -1));
                        if (code[1] > 0) item.put("v", code[1]);
                        int severity = HudAlertCodec.jamSeverity(row);
                        int minutes = HudAlertCodec.jamDelayMinutes(row);
                        if (severity > 0) item.put("s", severity);
                        if (minutes > 0) item.put("m", minutes);
                        array.put(item);
                    }
                }
                // Empty means the opt-in field was accepted but no alert is currently active.
                b.put("alrs", array);
            }
        } catch (Exception ignored) { }
        return b;
    }

    /* These values are carried by canonical state in the new boundary. */
    private static int overMargin(HudCanonicalState state) { return state.overMargin; }
    private static boolean averageZone(HudCanonicalState state) { return state.averageZone; }

    private static String trimCodePoints(String value, int max) {
        if (value == null || max <= 0) return "";
        int end = value.offsetByCodePoints(0, Math.min(max, value.codePointCount(0, value.length())));
        return end == value.length() ? value : value.substring(0, end);
    }

    private static int parseInt(String value, int fallback) {
        try { return Integer.parseInt(value.trim()); }
        catch (Throwable ignored) { return fallback; }
    }
}
