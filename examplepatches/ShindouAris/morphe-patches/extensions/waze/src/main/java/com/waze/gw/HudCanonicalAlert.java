package com.waze.gw;

/**
 * Immutable alert value shared by the protocol adapters.
 *
 * <p>The raw Waze row is deliberately retained.  The HLP/1 encoder historically used the source
 * row as the change signature and decoded it when producing a frame.  Keeping the row here means
 * that extracting the canonical state cannot silently change malformed/legacy alert handling.</p>
 */
final class HudCanonicalAlert {
    final String rawRow;
    final int type;
    final int valueKmh;
    final int distanceM;

    HudCanonicalAlert(String rawRow, int type, int valueKmh, int distanceM) {
        this.rawRow = rawRow;
        this.type = type;
        this.valueKmh = valueKmh;
        this.distanceM = distanceM;
    }

    static HudCanonicalAlert fromLegacyRow(String row) {
        String[] fields = row == null ? new String[0] : row.split("\\t", -1);
        int type = 0;
        int value = 0;
        int distance = -1;
        if (fields.length >= 4) {
            int[] decoded = HudAlertCodec.decode(fields);
            type = decoded[0];
            value = decoded[1];
            distance = parseInt(fields[3], -1);
        }
        return new HudCanonicalAlert(row, type, value, distance);
    }

    boolean hasLegacyPayload() {
        return rawRow != null && rawRow.split("\\t", -1).length >= 4;
    }

    @Override public String toString() {
        // List.toString() is part of the old alertSignature() behavior.
        return String.valueOf(rawRow);
    }

    private static int parseInt(String value, int fallback) {
        try { return Integer.parseInt(value.trim()); }
        catch (Throwable ignored) { return fallback; }
    }
}
