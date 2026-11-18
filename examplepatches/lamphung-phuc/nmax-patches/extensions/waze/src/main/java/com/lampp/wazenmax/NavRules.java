package com.lampp.wazenmax;

/** WazeNav's pure rules (no Android), tested by tools/waze-patch/test/NavRulesTest.java. */
public final class NavRules {
    private static final String SPEED_DROP = "speeddrop_";

    private NavRules() {
    }

    /** Lane angle → the dash's bitmask: 1 straight, 2/4/8 slight/normal/sharp left, 16/32/64 right, 128 U-turn. */
    // shortcut: assumes Waze's angles are degrees with negative = left; check the log of a real lane strip and flip if not.
    public static int laneBit(int angle) {
        int a = ((angle % 360) + 540) % 360 - 180; // -180..179
        int abs = Math.abs(a);
        if (abs <= 20) return 1;
        if (abs >= 160) return 128;
        int side = a < 0 ? 0 : 3;
        return 1 << (side + (abs <= 65 ? 1 : abs <= 115 ? 2 : 3));
    }

    /** Waze's own "the limit changes ahead" alert has the icon {@code speeddrop_<new limit>}; 0 for any other icon. */
    public static int speedDropLimit(String icon) {
        if (icon == null || !icon.startsWith(SPEED_DROP)) return 0;
        try {
            return Math.max(Integer.parseInt(icon.substring(SPEED_DROP.length())), 0);
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    /**
     * Waze's alert icon → the snapshot's alert type (the codes {@code WazeCards} draws: 1 police, 2 speed camera,
     * 3 red-light camera, 8 limit changes ahead, 40 phone/penalty camera, 56 speed bump, 57 school zone, 61 broken
     * traffic light; 0 any other). Waze 5.27 gives red-light and phone cameras the same type value (10), so the icon
     * name is what tells them apart: icon_alerter_cam_red_light, icon_alerter_cam_phone, speeddrop_80, ….
     */
    // shortcut: keywords from the icons seen so far; WazeNmaxNav logs every new icon name, add rules from ride logs.
    public static int alertType(String icon) {
        String i = icon == null ? "" : icon.toLowerCase(java.util.Locale.ROOT);
        if (speedDropLimit(i) > 0) return 8;
        if (i.contains("cam_phone") || i.contains("phone_camera")) return 40;
        if (i.contains("red_light") || i.contains("redlight")) return 3; // also the speed + red-light combo
        if (i.contains("police")) return 1;
        if (i.contains("speed_bump")) return 56;
        if (i.contains("school")) return 57;
        if (i.contains("broken_light")) return 61;
        if (i.contains("cam")) return 2;
        return 0;
    }

    /**
     * Waze's limits are car limits; Vietnam caps motorbikes lower on fast roads. The rule the owner rode with
     * (Waze Mod's): above 80 → 70, 71–80 → 60, else the road's limit. 0 (unknown) stays 0.
     */
    public static int motorbikeCap(int limit) {
        if (limit > 80) return 70;
        if (limit > 70) return 60;
        return limit;
    }

    /** Micro-degree positions → metres (equirectangular, fine for alerts a few km away). */
    public static int distanceM(int lat1, int lon1, int lat2, int lon2) {
        double phi = Math.toRadians((lat1 + lat2) / 2e6);
        double dx = Math.toRadians((lon2 - lon1) / 1e6) * Math.cos(phi);
        double dy = Math.toRadians((lat2 - lat1) / 1e6);
        return (int) Math.round(6_371_000 * Math.sqrt(dx * dx + dy * dy));
    }
}
