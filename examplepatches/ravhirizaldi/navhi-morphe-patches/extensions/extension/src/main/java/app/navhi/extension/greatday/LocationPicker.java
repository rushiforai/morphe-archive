package app.navhi.extension.greatday;

import android.content.Context;

import com.google.android.gms.maps.CameraUpdate;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;

import java.lang.reflect.Method;

/**
 * State and drawing for the manual location picker.
 *
 * <p>One picker is open at a time, so the map, the pin and its marker live in
 * static fields. The pin is committed to {@link LocationStore} by the screen
 * itself; everything here is display only.
 */
@SuppressWarnings("unused")
public final class LocationPicker {
    public static GoogleMap map;
    public static LatLng pin;
    public static Marker marker;

    private static PinWatcher watcher;

    private LocationPicker() {
    }

    /** Keep the camera in sync with the centre of the pinch: the map is the pin. */
    public static void listen(GoogleMap googleMap, Object host) {
        map = googleMap;
        if (watcher == null) {
            watcher = new PinWatcher(host);
        }
        googleMap.setOnCameraIdleListener(watcher);
        googleMap.setOnMapClickListener(watcher);
    }

    public static LatLng savedPin(Context context) {
        double[] pinned = LocationStore.get(context);
        return pinned == null ? null : new LatLng(pinned[0], pinned[1]);
    }

    public static void pin(LatLng target) {
        pin = target;
        refresh();
    }

    public static void clear() {
        pin = null;
        refresh();
    }

    public static void centre() {
        if (map == null) {
            return;
        }
        pin(map.getCameraPosition().target);
    }

    public static void move(LatLng target, boolean animate) {
        if (map == null) {
            return;
        }
        CameraUpdate update = CameraUpdateFactory.newLatLng(target);
        if (animate) {
            map.animateCamera(update);
        } else {
            map.moveCamera(update);
        }
    }

    public static void refresh() {
        if (map == null) {
            return;
        }
        if (marker != null) {
            marker.remove();
            marker = null;
        }
        if (pin != null) {
            marker = map.addMarker(new MarkerOptions().position(pin));
        }
    }

    /** Map callbacks, forwarded to the screen by name. */
    private static final class PinWatcher
            implements GoogleMap.OnCameraIdleListener, GoogleMap.OnMapClickListener {
        private final Object host;

        PinWatcher(Object host) {
            this.host = host;
        }

        @Override
        public void onCameraIdle() {
            call("r");
        }

        @Override
        public void onMapClick(LatLng latLng) {
            call("u", latLng);
        }

        private void call(String name, Object... args) {
            try {
                Class<?>[] types = new Class<?>[args.length];
                for (int i = 0; i < args.length; i++) {
                    types[i] = args[i].getClass();
                }
                Method method = host.getClass().getMethod(name, types);
                method.invoke(host, args);
            } catch (Exception ignored) {
            }
        }
    }
}
