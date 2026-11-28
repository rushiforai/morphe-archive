package com.waze.gw;

import android.content.Context;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Immutable, protocol-neutral snapshot of the data published by WazeMod.
 *
 * <p>This class intentionally contains no transport or wire-format behavior.  A capture performs
 * the same repeated-read stabilization that the original HLP snapshot used because the individual
 * JNI callbacks publish related navigation fields independently.</p>
 */
final class HudCanonicalState {
    final int speedKmh;
    final int limitKmh;
    /** Resolved minimum legal speed.  Protocol encoders must opt in explicitly. */
    final int minimumLimitKmh;
    final int overMargin;
    final boolean navigating;
    final int turn;
    final int nextTurn;
    final int turnDistanceM;
    final int exitNumber;
    final Gateway.LaneSnapshot lanes;
    final String currentStreet;
    final String nextStreet;
    final String etaClock;
    final int remainingMinutes;
    final int remainingMeters;
    /** -1 until a route-progress source is available; HLP/1 does not advertise this field. */
    final int routeProgressPercent;
    final boolean averageZone;
    final int averageLeftM;
    final int recommendedSpeedKmh;
    final int averagePercent;
    final List<HudCanonicalAlert> alerts;

    HudCanonicalState(int speedKmh, int limitKmh, int minimumLimitKmh, boolean navigating,
                      int turn, int nextTurn, int turnDistanceM, int exitNumber,
                      Gateway.LaneSnapshot lanes, String currentStreet, String nextStreet,
                      String etaClock, int remainingMinutes, int remainingMeters,
                      int routeProgressPercent, int overMargin, boolean averageZone,
                      int averageLeftM, int recommendedSpeedKmh, int averagePercent,
                      List<HudCanonicalAlert> alerts) {
        this.speedKmh = speedKmh;
        this.limitKmh = limitKmh;
        this.minimumLimitKmh = minimumLimitKmh;
        this.navigating = navigating;
        this.turn = turn;
        this.nextTurn = nextTurn;
        this.turnDistanceM = turnDistanceM;
        this.exitNumber = exitNumber;
        this.lanes = lanes == null ? Gateway.LaneSnapshot.EMPTY : lanes;
        this.currentStreet = currentStreet == null ? "" : currentStreet;
        this.nextStreet = nextStreet == null ? "" : nextStreet;
        this.etaClock = etaClock == null ? "" : etaClock;
        this.remainingMinutes = remainingMinutes;
        this.remainingMeters = remainingMeters;
        this.routeProgressPercent = routeProgressPercent;
        this.overMargin = overMargin;
        this.averageZone = averageZone;
        this.averageLeftM = averageLeftM;
        this.recommendedSpeedKmh = recommendedSpeedKmh;
        this.averagePercent = averagePercent;
        ArrayList<HudCanonicalAlert> copy = new ArrayList<HudCanonicalAlert>();
        if (alerts != null) copy.addAll(alerts);
        this.alerts = Collections.unmodifiableList(copy);
    }

    /** Convenience constructor matching the protocol-neutral field list in the integration plan. */
    HudCanonicalState(int speedKmh, int limitKmh, int minimumLimitKmh, boolean navigating,
                      int turn, int nextTurn, int turnDistanceM, int exitNumber,
                      Gateway.LaneSnapshot lanes, String currentStreet, String nextStreet,
                      String etaClock, int remainingMinutes, int remainingMeters,
                      int routeProgressPercent, List<HudCanonicalAlert> alerts) {
        this(speedKmh, limitKmh, minimumLimitKmh, navigating, turn, nextTurn, turnDistanceM,
                exitNumber, lanes, currentStreet, nextStreet, etaClock, remainingMinutes,
                remainingMeters, routeProgressPercent, 5, false, -1, -1, -1, alerts);
    }

    static HudCanonicalState capture(Context context) {
        HudCanonicalState previous = captureOnce(context);
        // JNI callbacks publish related fields separately. Two equal canonical reads avoid emitting
        // the common mid-update combination without locking Waze's hot navigation callbacks.
        for (int attempt = 0; attempt < 3; attempt++) {
            Thread.yield();
            HudCanonicalState current = captureOnce(context);
            if (previous.stableSignature().equals(current.stableSignature())) return current;
            previous = current;
        }
        return previous;
    }

    private static HudCanonicalState captureOnce(Context context) {
        String units = Gateway.hudUnits == null ? "" : Gateway.hudUnits;
        int speed = toKmh(Gateway.hudSpeed, units);
        int limit = toKmh(Gateway.hudLimit, units);
        int minimum = Gateway.minimumSpeedLimit;
        int margin = context.getSharedPreferences("waze_hud_gw", Context.MODE_PRIVATE)
                .getInt("over_margin", 5);
        ArrayList<HudCanonicalAlert> alerts = new ArrayList<HudCanonicalAlert>();
        List<String> source = Gateway.hudAlerts;
        if (source != null) {
            for (String row : source) alerts.add(HudCanonicalAlert.fromLegacyRow(row));
        }
        return new HudCanonicalState(speed, limit, minimum, Gateway.hudNavigating,
                HudTurnCodec.encode(Gateway.hudTurn), HudTurnCodec.encode(Gateway.hudTurnNext),
                Gateway.hudTurnDist, Math.max(0, Gateway.hudExit), Gateway.hudLanes,
                normalizeStreet(Gateway.hudCurStreet), normalizeStreet(Gateway.hudStreet),
                normalizeEta(Gateway.hudEtaClock), Math.max(0, Gateway.hudEtaMin),
                Gateway.hudEtaDistM, -1, margin, Gateway.avgZone, Gateway.avgLeftM,
                toKmh(Gateway.avgRecSpeed, units), Gateway.avgPercent, alerts);
    }

    /** Stable, protocol-neutral comparison key used only to detect torn captures. */
    private String stableSignature() {
        StringBuilder result = new StringBuilder(256);
        result.append(speedKmh).append('|').append(limitKmh).append('|')
                .append(minimumLimitKmh).append('|').append(navigating).append('|')
                .append(turn).append('|').append(nextTurn).append('|')
                .append(turnDistanceM).append('|').append(exitNumber).append('|')
                .append(lanes == null ? "" : lanes.signature()).append('|')
                .append(currentStreet).append('|').append(nextStreet).append('|')
                .append(etaClock).append('|').append(remainingMinutes).append('|')
                .append(remainingMeters).append('|').append(routeProgressPercent).append('|')
                .append(overMargin).append('|').append(averageZone).append('|')
                .append(averageLeftM).append('|').append(recommendedSpeedKmh).append('|')
                .append(averagePercent).append('|')
                .append(alerts.toString());
        return result.toString();
    }

    String alertSignature() { return alerts.toString(); }

    static int toKmhForTest(int value, String units) { return toKmh(value, units); }

    private static int toKmh(int value, String units) {
        if (value < 0) return value;
        String u = units == null ? "" : units.toLowerCase(java.util.Locale.US);
        return u.contains("mph") || u.contains("mi/h")
                ? (int) Math.round(value * 1.609344) : value;
    }

    private static String normalizeStreet(String value) {
        return value == null ? "" : trimCodePoints(value, 40);
    }

    private static String normalizeEta(String value) {
        if (value == null) return "";
        java.util.regex.Matcher m = java.util.regex.Pattern
                .compile("\\b([01]?\\d|2[0-3]):([0-5]\\d)\\b").matcher(value);
        return m.find() ? String.format(java.util.Locale.US, "%02d:%s",
                Integer.parseInt(m.group(1)), m.group(2)) : "";
    }

    private static String trimCodePoints(String value, int max) {
        if (value == null || max <= 0) return "";
        int end = value.offsetByCodePoints(0, Math.min(max, value.codePointCount(0, value.length())));
        return end == value.length() ? value : value.substring(0, end);
    }
}
