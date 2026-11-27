package app.jagat.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.location.Location;
import android.os.Build;
import java.lang.reflect.Method;

public class LocationHook {
    private static final String TAG = "JagatMorphe_Location";
    private static SharedPreferences prefs;

    public static void init(Context context) {
        if (prefs == null && context != null) {
            prefs = context.getApplicationContext().getSharedPreferences("jagat_morphe_prefs", Context.MODE_PRIVATE);
        }
    }

    public static Location onLocationChanged(Location original) {
        if (original == null) {
            return null;
        }

        if (prefs != null) {
            boolean freezeEnabled = prefs.getBoolean("freeze_enabled", false);
            boolean spoofEnabled = prefs.getBoolean("spoof_enabled", false);

            if (freezeEnabled) {
                // Đóng băng vị trí: giữ nguyên toạ độ lúc bắt đầu bật đóng băng
                if (!prefs.contains("frozen_lat")) {
                    prefs.edit()
                        .putLong("frozen_lat", Double.doubleToRawLongBits(original.getLatitude()))
                        .putLong("frozen_lng", Double.doubleToRawLongBits(original.getLongitude()))
                        .apply();
                } else {
                    double fLat = Double.longBitsToDouble(prefs.getLong("frozen_lat", Double.doubleToRawLongBits(original.getLatitude())));
                    double fLng = Double.longBitsToDouble(prefs.getLong("frozen_lng", Double.doubleToRawLongBits(original.getLongitude())));
                    original.setLatitude(fLat);
                    original.setLongitude(fLng);
                }
            } else if (spoofEnabled) {
                // Toạ độ giả lập do người dùng chỉ định
                double cLat = Double.longBitsToDouble(prefs.getLong("custom_lat", Double.doubleToRawLongBits(21.0285)));
                double cLng = Double.longBitsToDouble(prefs.getLong("custom_lng", Double.doubleToRawLongBits(105.8542)));
                original.setLatitude(cLat);
                original.setLongitude(cLng);
            }
        }

        // Xóa dấu hiệu mock location để bypass kiểm tra của server/app
        cleanMockFlags(original);
        return original;
    }

    private static void cleanMockFlags(Location location) {
        if (location == null) return;
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                location.setMock(false);
            } else {
                Method m = Location.class.getMethod("setIsFromMockProvider", boolean.class);
                m.invoke(location, false);
            }
        } catch (Throwable ignored) {
        }
    }
}
