/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-05.
 */
package app.morphe.extension.youtube.patches.general.offline;

import org.json.JSONArray;
import org.json.JSONObject;

/** MWEB's observed thumbnail badge plus the legacy playlist renderer's duration fields. */
final class OfflinePlaylistDuration {
    private OfflinePlaylistDuration() {
    }

    static long from(JSONObject renderer, boolean lockup) {
        long seconds = renderer.optLong("lengthSeconds", 0);
        if (seconds > 0 && seconds <= Long.MAX_VALUE / 1000) return seconds * 1000;
        if (!lockup) {
            JSONObject text = renderer.optJSONObject("lengthText");
            if (text == null) return 0;
            String label = text.optString("simpleText");
            JSONArray runs = text.optJSONArray("runs");
            if (label.isEmpty() && runs != null && runs.optJSONObject(0) != null) {
                label = runs.optJSONObject(0).optString("text");
            }
            return parse(label);
        }
        JSONObject image = renderer.optJSONObject("contentImage");
        JSONObject thumbnail = image == null ? null : image.optJSONObject("thumbnailViewModel");
        JSONArray overlays = thumbnail == null ? null : thumbnail.optJSONArray("overlays");
        if (overlays == null) return 0;
        for (int index = 0; index < overlays.length(); index++) {
            JSONObject overlay = overlays.optJSONObject(index);
            JSONObject bottom = overlay == null ? null : overlay.optJSONObject("thumbnailBottomOverlayViewModel");
            JSONArray badges = bottom == null ? null : bottom.optJSONArray("badges");
            if (badges == null) continue;
            for (int badgeIndex = 0; badgeIndex < badges.length(); badgeIndex++) {
                JSONObject badge = badges.optJSONObject(badgeIndex);
                JSONObject model = badge == null ? null : badge.optJSONObject("thumbnailBadgeViewModel");
                long duration = model == null ? 0 : parse(model.optString("text"));
                if (duration > 0) return duration;
            }
        }
        return 0;
    }

    static long parse(String text) {
        if (!text.matches("[0-9]+:[0-5][0-9](:[0-5][0-9])?")) return 0;
        try {
            long seconds = 0;
            for (String part : text.split(":")) seconds = Math.addExact(Math.multiplyExact(seconds, 60),
                    Long.parseLong(part));
            return Math.multiplyExact(seconds, 1000);
        } catch (ArithmeticException | NumberFormatException ex) {
            return 0;
        }
    }
}
