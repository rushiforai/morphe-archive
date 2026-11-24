package app.template.extension.extension;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.LruCache;

import java.io.IOException;
import java.io.InputStream;
import java.util.Optional;
import java.util.regex.Pattern;

final class NavigationWidgetIcons {
    private static final String SKIN = "res/skins/default/";
    private static final String[] DENSITIES = {"@3x", "@2x", ""};
    private static final Pattern ICON_NAME = Pattern.compile("[a-z0-9_]{1,120}");
    private static final LruCache<String, Optional<Bitmap>> CACHE = new LruCache<>(64);

    private NavigationWidgetIcons() {}

    static Bitmap alert(Context context, NavigationWidget.Alert alert, boolean usSign) {
        if (alert.limit > 0) {
            String region = usSign ? "us_" : "world_";
            return load(context, "bigpin_speed_limit_" + region + alert.limit);
        }
        String name = alert.icon;
        if (ICON_NAME.matcher(name).matches()) {
            String icon = name.startsWith("icon_") ? name : "icon_" + name;
            Bitmap bitmap = load(context, "alert_icons/" + icon);
            if (bitmap != null) return bitmap;

            String key = icon.substring(5);
            if (key.startsWith("alerter_")) key = key.substring(8);
            if (key.startsWith("report_")) key = key.substring(7);
            bitmap = load(context, key.startsWith("bigpin_") ? key : "bigpin_" + key);
            if (bitmap != null) return bitmap;

            String alias = pinAlias(key);
            if (alias != null) {
                bitmap = load(context, "bigpin_" + alias);
                if (bitmap != null) return bitmap;
            }
        }
        return load(context, "bigpin_hazard");
    }

    private static String pinAlias(String key) {
        if (key.contains("railroad") || key.contains("railway")) return "railroad";
        if (key.contains("cam")) {
            if (key.contains("mobile")) return "police_mobile_camera";
            if (key.contains("phone")) return "phone_camera";
            if (key.contains("combo") || key.contains("red") && key.contains("speed"))
                return "red_light_and_speed_camera";
            if (key.contains("distance")) return "distance_between_vehicles_camera";
            if (key.contains("bus_lane")) return "bus_lane_cam";
            if (key.contains("noise")) return "noise_camera";
            if (key.contains("stop_sign")) return "stop_sign_camera";
            if (key.contains("hov")) return "hov_camera";
            if (key.contains("red") || key.contains("trafficlight")) return "red_light_camera";
            if (key.contains("fake") || key.contains("dummy")) return "dummy_camera";
            if (key.contains("seat_belt") || key.contains("seatbelt")) return "seatbelt_camera";
            return "speed_camera";
        }
        if (key.contains("police")) return "police";
        if (key.contains("accident") || key.contains("crash")) return "accident";
        if (key.contains("closure") || key.contains("closed_road")) return "closure";
        if (key.contains("traffic_light") || key.equals("traffic_signal")) return "traffic_light";
        if (key.contains("traffic")) {
            if (key.contains("standstill")) return "traffic_4";
            if (key.contains("heavy")) return "traffic_3";
            if (key.contains("moderate")) return "traffic_2";
            return "traffic_1";
        }
        return null;
    }

    private static Bitmap load(Context context, String name) {
        Optional<Bitmap> cached = CACHE.get(name);
        if (cached != null) return cached.orElse(null);

        for (String density : DENSITIES) {
            try (InputStream stream = context.getAssets().open(SKIN + name + density + ".png")) {
                Bitmap bitmap = BitmapFactory.decodeStream(stream);
                if (bitmap != null) {
                    CACHE.put(name, Optional.of(bitmap));
                    return bitmap;
                }
            } catch (IOException ignored) {
                // Some icons ship only at certain densities.
            }
        }
        CACHE.put(name, Optional.empty());
        return null;
    }
}
