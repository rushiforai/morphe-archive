package com.waze.gw;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

/**
 * Loads our speed-limit sign PNGs bundled at assets/gw_signs/speed_limit_NN.png, cached.
 * Only exact values 10..120 in steps of 10 exist; any other limit returns null so the caller
 * falls back to its own drawn sign.
 */
final class Signs {

    private static final java.util.HashMap<Integer, Bitmap> cache = new java.util.HashMap<Integer, Bitmap>();
    private static final java.util.HashMap<String, Bitmap> acache = new java.util.HashMap<String, Bitmap>();
    private static final java.util.HashMap<String, Bitmap> wcache = new java.util.HashMap<String, Bitmap>();

    /** Load a Waze alert icon by its iconName from the bundled skins (alert_icons / default), cached. */
    static Bitmap wazeIcon(Context c, String name) {
        if (c == null || name == null || name.length() == 0) return null;
        synchronized (wcache) {
            if (wcache.containsKey(name)) return wcache.get(name);
            Bitmap bm = null;
            String stripped = name.startsWith("icon_") ? name.substring(5) : name;
            String[] bases = new String[]{name, stripped, "bigpin_" + stripped};   // some hazards only ship as bigpin_*
            String[] dirs = {"res/skins/default/alert_icons/", "res/skins/default/"};
            String[] suf = {"@3x", "@2x", ""};
            outer:
            for (String base : bases) for (String dir : dirs) for (String s : suf) {
                try {
                    java.io.InputStream is = c.getAssets().open(dir + base + s + ".png");
                    bm = BitmapFactory.decodeStream(is);
                    is.close();
                    if (bm != null) break outer;
                } catch (Throwable t) { /* try next */ }
            }
            wcache.put(name, bm);
            return bm;
        }
    }

    private static final java.util.HashMap<String, Bitmap> pcache = new java.util.HashMap<String, Bitmap>();
    private static Bitmap trafficSignalSquare;

    /** Waze's traffic-light pin is taller than wide; center it on a square so views don't stretch it. */
    static Bitmap trafficSignal(Context c) {
        if (trafficSignalSquare != null) return trafficSignalSquare;
        Bitmap src = pin(c, "bigpin_traffic_light");
        if (src == null) return null;
        int side = Math.max(src.getWidth(), src.getHeight());
        Bitmap square = Bitmap.createBitmap(side, side, Bitmap.Config.ARGB_8888);
        new android.graphics.Canvas(square).drawBitmap(src,
                (side - src.getWidth()) / 2f, (side - src.getHeight()) / 2f, null);
        trafficSignalSquare = square;
        return square;
    }

    /** Load a native Waze "bigpin" icon (hi-res @3x) bundled at assets/wz_pins/<name>.png, cached. */
    static Bitmap pin(Context c, String name) {
        if (c == null || name == null) return null;
        synchronized (pcache) {
            if (pcache.containsKey(name)) return pcache.get(name);
            Bitmap bm = null;
            try {
                java.io.InputStream is = c.getAssets().open("wz_pins/" + name + ".png");
                bm = BitmapFactory.decodeStream(is);
                is.close();
            } catch (Throwable t) { /* missing -> null */ }
            pcache.put(name, bm);
            return bm;
        }
    }

    /** Map a Waze RAW alert iconName to a native Waze bigpin badge (hi-res). */
    static Bitmap alertIcon(Context c, String icon) {
        if (icon == null) return null;
        String lo = icon.toLowerCase();
        if (lo.equals("roadpoint_exit")) return pin(c, "loi_ra");
        if (lo.equals("traffic_signal")) return trafficSignal(c);   // TrafficLightAlerts
        if (lo.equals("roadpoint_expressway_rest") || lo.equals("roadpoint_rest")) {
            return pin(c, "bigpin_hazard_stopped");
        }
        if (lo.startsWith("wme_")) {
            int type = -1;
            try { type = Integer.parseInt(lo.substring(4)); } catch (Throwable ignored) { }
            String asset = null;
            switch (type) {
                case 2: case 5: asset = "no_left_and_u_turn"; break;
                case 6: case 7: asset = "no_right_and_u_turn"; break;
                case 8: case 16: asset = "no_left_turn"; break;
                case 9: case 17: asset = "no_right_turn"; break;
                case 11: case 18: asset = "no_u_turn"; break;
                case 14: asset = "no_passing_in"; break;
                case 15: asset = "no_passing_out"; break;
                case 19: asset = "cam_oto"; break;
                case 20: asset = "cam_xe_may"; break;
                case 21: asset = "only_go_straight"; break;
                case 22: asset = "only_turn_right"; break;
                case 23: asset = "only_turn_left"; break;
                case 26: asset = "residential_area_start"; break;
                case 27: asset = "residential_area_end"; break;
                case 35: asset = "end_of_previous_prohibitions"; break;
                default: break;
            }
            Bitmap custom = asset == null ? null : pin(c, asset);
            return custom != null ? custom : pin(c, "bigpin_hazard");
        }
        if (lo.startsWith("speeddrop_")) {                   // upcoming speed change -> Waze world speed sign
            String v = icon.substring(10);
            Bitmap b = pin(c, "bigpin_speed_limit_world_" + v);
            if (b == null) { try { b = limit(c, Integer.parseInt(v)); } catch (Throwable t) { } }   // gaps (100/120) -> our own sign
            return b;
        }
        // avg-speed zone = "cấm vượt" (no passing) in Vietnam only
        if ((lo.contains("french") || lo.contains("average")) && Region.inVietnam()) return pin(c, "no_passing_in");
        // "railroad camera" contains "cam"; keep the semantic railroad match ahead of the
        // generic camera family or the crossing is rendered as a speed camera.
        if (lo.contains("railway") || lo.contains("railroad") || lo.contains("train")) return pin(c, "bigpin_railroad");
        if (lo.contains("cam")) {                            // icon_alerter_cam_phone / _speed / _red_light …
            if (lo.contains("phone")) return pin(c, "bigpin_phone_camera");           // phạt nguội
            // Native iconNames (libwaze.so): cam_combo_speed_and_redlight, cam_distance_between_vehicles,
            // cam_bus_lane, cam_noise, cam_stop_signe (sic), cam_hov, cam_seat_belt.
            if (lo.contains("combo")) return pin(c, "bigpin_red_light_and_speed_camera");
            if (lo.contains("distance")) return pin(c, "bigpin_distance_between_vehicles_camera");
            if (lo.contains("bus_lane")) return pin(c, "bigpin_bus_lane_cam");
            if (lo.contains("noise")) return pin(c, "bigpin_noise_camera");
            if (lo.contains("stop_sign")) return pin(c, "bigpin_stop_sign_camera");
            if (lo.contains("hov")) return pin(c, "bigpin_hov_camera");
            if (lo.contains("red")) return pin(c, "bigpin_red_light_camera");
            if (lo.contains("dummy") || lo.contains("fake")) return pin(c, "bigpin_dummy_camera");
            if (lo.contains("seatbelt") || lo.contains("seat_belt")) return pin(c, "bigpin_seatbelt_camera");
            if (lo.contains("speed")) return pin(c, "bigpin_speed_camera");
            return pin(c, "bigpin_speed_camera");
        }
        if (lo.contains("police") || lo.contains("checkpoint")) return pin(c, "bigpin_police");
        if (lo.contains("toll")) return pin(c, "bigpin_permanent_hazard_toll_booth");
        if (lo.contains("blocked_lane") || lo.contains("closed_lane")) return pin(c, "bigpin_blocked_lane");
        if (lo.contains("accident") || lo.contains("crash")) return pin(c, "bigpin_accident");
        if (lo.contains("report_traffic") && !lo.contains("light")) {   // jams: 1 light/unknown .. 4 standstill
            int level = lo.contains("standstill") ? 4 : lo.contains("heavy") ? 3 : lo.contains("moderate") ? 2 : 1;
            Bitmap jam = pin(c, "bigpin_traffic_" + level);
            if (jam != null) return jam;
        }
        // general: bigpin_<stripped>, then drop "report_/" prefix, then generic hazard pin
        String s = icon.startsWith("icon_") ? icon.substring(5) : icon;
        Bitmap b = pin(c, "bigpin_" + s);
        if (b == null && s.startsWith("report_")) b = pin(c, "bigpin_" + s.substring(7));
        if (b == null) b = hazardFamilyPin(c, lo);
        if (b == null) b = pin(c, "bigpin_hazard");
        return b;
    }

    /**
     * Waze names some alerts with no pin of the same name (there is no "bigpin_hazard_weather_rain",
     * for instance), which used to fall through to the plain hazard sign. Map those families to the
     * closest pin Waze does ship. Tokens are matched whole so "ice" never matches "police".
     */
    private static Bitmap hazardFamilyPin(Context c, String lowerName) {
        java.util.List<String> t = java.util.Arrays.asList(lowerName.split("_"));
        String pin = null;
        if (t.contains("fog")) pin = "bigpin_hazard_weather_fog";
        else if (t.contains("hail")) pin = "bigpin_hazard_weather_hail";
        else if (t.contains("snow")) pin = "bigpin_hazard_weather_snow";
        else if (t.contains("flood")) pin = "bigpin_hazard_weather_flood";
        else if (t.contains("freezing") || t.contains("ice")) pin = "bigpin_hazard_weather_ice";
        else if (t.contains("slippery") || t.contains("oil")) pin = "bigpin_slippery_road";
        else if (t.contains("rain") || t.contains("monsoon") || t.contains("storm")
                || t.contains("tornado") || t.contains("hurricane") || t.contains("heat")
                || t.contains("wind") || t.contains("weather")) pin = "bigpin_bad_weather";
        else if (t.contains("topes") || t.contains("bump") || t.contains("bumps"))
            pin = "bigpin_permanent_hazard_speed_bumps";
        return pin == null ? null : pin(c, pin);
    }

    /** Load a VietMap alert icon bundled at assets/vm_alerts/<file>.png (e.g. "speed_limit_camera"), cached. */
    static Bitmap alert(Context c, String file) {
        if (c == null || file == null) return null;
        synchronized (acache) {
            if (acache.containsKey(file)) return acache.get(file);
            Bitmap bm = null;
            try {
                java.io.InputStream is = c.getAssets().open("vm_alerts/" + file + ".png");
                bm = BitmapFactory.decodeStream(is);
                is.close();
            } catch (Throwable t) { /* missing -> null */ }
            acache.put(file, bm);
            return bm;
        }
    }

    /** The limit sign in the style Waze uses here: square (US) when it is, otherwise the round {@link #limit} artwork. */
    static Bitmap limitFor(Context c, int lim) {
        if (lim >= 5 && lim <= 160 && LimitSign.square()) return LimitSign.bitmap(lim);
        return limit(c, lim);
    }

    static Bitmap limit(Context c, int lim) {
        if (c == null || lim < 10 || lim > 120 || lim % 10 != 0) return null;
        Integer k = Integer.valueOf(lim);
        synchronized (cache) {
            if (cache.containsKey(k)) return cache.get(k);
            Bitmap bm = null;
            try {
                java.io.InputStream is = c.getAssets().open("gw_signs/speed_limit_" + lim + ".png");
                bm = BitmapFactory.decodeStream(is);
                is.close();
            } catch (Throwable t) { /* missing -> null */ }
            cache.put(k, bm);   // cache null too, to avoid retrying a missing asset
            return bm;
        }
    }
}
