package org.ungoogled.waze;

import android.content.Context;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.os.Looper;
import android.os.SystemClock;
import java.io.InputStream;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/** Copies native tile points into the existing local display-only event channel. */
final class NativeTileCameras {
    private static final String HASH = "72a28430c1fe2f0b5939141bd92c3b7000af8e64fb366f96bf4a47cd6d478e1e";
    private static volatile Location fix;
    private static boolean started;
    private static volatile boolean installed;
    private static boolean engineObservedRunning; // Accessed only by WORKER.
    private static final ScheduledExecutorService WORKER = Executors.newSingleThreadScheduledExecutor(r -> {
        Thread t = new Thread(r, "waze-tile-cameras"); t.setDaemon(true); return t;
    });
    private static native boolean nativeInstall();
    private static native long[] nativeSnapshot();
    private static native long[] nativeZoneSnapshot();
    static long[] zoneSnapshot() {
        if (!installed) return new long[0];
        try { return nativeZoneSnapshot(); } catch (LinkageError unavailable) { return new long[0]; }
    }
    private static native void nativeClear();

    static synchronized void start(Context context) {
        if (started) return;
        started = true;
        Context app = context.getApplicationContext();
        try {
            LocationManager manager = (LocationManager) app.getSystemService(Context.LOCATION_SERVICE);
            manager.requestLocationUpdates(LocationManager.PASSIVE_PROVIDER, 1000, 0,
                new LocationListener() {
                    @Override public void onLocationChanged(Location value) { fix = new Location(value); }
                    @Override public void onProviderEnabled(String provider) {}
                    @Override public void onProviderDisabled(String provider) { fix = null; }
                    @Override public void onStatusChanged(String provider, int status, Bundle extras) {}
                }, Looper.getMainLooper());
            Location known = manager.getLastKnownLocation(LocationManager.PASSIVE_PROVIDER);
            if (known != null) fix = new Location(known);
        } catch (RuntimeException unavailable) { started = false; return; }
        WORKER.execute(() -> {
            if (!android.os.Process.is64Bit() || !"aarch64".equals(System.getProperty("os.arch")) || !verifiedLibrary(app)) return;
            // libshadowhook is an ELF dependency. Loading it through Java would run its
            // JNI_OnLoad, which requires the optional ShadowHook Java facade we do not ship.
            try { System.load(NativeObserverAssets.prepare(app).getAbsolutePath()); }
            catch (java.io.IOException | LinkageError unavailable) {
                android.util.Log.w("UA", "Native tile camera library unavailable: " + unavailable.getClass().getSimpleName());
                return;
            }
            WORKER.scheduleWithFixedDelay(() -> {
                long epoch = NativeWarnings.tileEpoch();
                try {
                    if (!nativeInstall()) return; // NativeManager may not have loaded its engine yet.
                    installed = true;
                    if (!engineRunning()) {
                        // Tile callbacks can arrive during native initialization. Preserve those
                        // initial records; only a previously running engine transitioning to stop
                        // invalidates the copied cache.
                        if (engineObservedRunning) nativeClear();
                        engineObservedRunning = false;
                        NativeWarnings.tilePoints(new long[0], epoch); return;
                    }
                    engineObservedRunning = true;
                    NativeWarnings.tilePoints(select(nativeSnapshot(), fix, SystemClock.elapsedRealtime()), epoch);
                } catch (RuntimeException | LinkageError unavailable) { NativeWarnings.tilePoints(new long[0], epoch); }
            }, 0, 1000, TimeUnit.MILLISECONDS);
        });
    }

    private static boolean engineRunning() {
        if (!NavigationStartup.running()) return false;
        try {
            Class<?> manager = Class.forName("com.waze.NativeManager");
            Object instance = manager.getMethod("getInstance").invoke(null);
            return !((Boolean) manager.getMethod("isShutdown").invoke(instance));
        } catch (ReflectiveOperationException unavailable) { return false; }
    }

    static void clear() {
        fix = null;
        try { nativeClear(); } catch (LinkageError unavailable) { /* Unsupported builds remain inert. */ }
    }

    // The APK resource binder pins the ELF too; this check also covers normal split-package loading.
    private static boolean verifiedLibrary(Context app) {
        List<String> paths = new ArrayList<>();
        paths.add(app.getApplicationInfo().sourceDir);
        String[] splits = app.getApplicationInfo().splitSourceDirs;
        if (splits != null) java.util.Collections.addAll(paths, splits);
        try {
            for (String path : paths) try (ZipFile zip = new ZipFile(path)) {
                ZipEntry entry = zip.getEntry("lib/arm64-v8a/libwaze.so");
                if (entry == null) continue;
                MessageDigest digest = MessageDigest.getInstance("SHA-256");
                try (InputStream input = zip.getInputStream(entry)) {
                    byte[] bytes = new byte[65536]; int size;
                    while ((size = input.read(bytes)) != -1) digest.update(bytes, 0, size);
                }
                StringBuilder hash = new StringBuilder();
                for (byte value : digest.digest()) hash.append(String.format(java.util.Locale.ROOT, "%02x", value & 255));
                return HASH.contentEquals(hash);
            }
        } catch (Exception unavailable) { return false; }
        return false;
    }

    /** Export nearby points with a bounded share of the warning channel; never infer road direction. */
    static long[] select(long[] snapshot, Location location, long now) {
        if (snapshot == null || snapshot.length % 5 != 0 || snapshot.length > 2048 * 5 || location == null)
            return new long[0];
        long at = location.getElapsedRealtimeNanos() / 1000000;
        if (at < 0 || at > now || now - at > 15000 || !location.hasAccuracy()
                || !Float.isFinite(location.getAccuracy()) || location.getAccuracy() > 100)
            return new long[0];
        List<long[]> points = new ArrayList<>();
        java.util.Set<String> identities = new java.util.HashSet<>();
        for (int i = 0; i < snapshot.length; i += 5) {
            long kind = snapshot[i + 2], longitude = snapshot[i + 3], latitude = snapshot[i + 4];
            if (kind < 69 || kind > 80 || longitude < -180000000 || longitude > 180000000
                    || latitude < -90000000 || latitude > 90000000
                    || longitude == 0 && latitude == 0) continue;
            if (!identities.add(snapshot[i]+":"+snapshot[i+1]+":"+kind)) continue;
            Location target = new Location("native-tile");
            target.setLongitude(longitude / 1e6); target.setLatitude(latitude / 1e6);
            double distance = location.distanceTo(target);
            if (Double.isFinite(distance) && distance <= 20000)
                points.add(new long[]{snapshot[i], snapshot[i + 1], kind, longitude, latitude, Math.round(distance)});
        }
        points.sort(Comparator.comparingLong(p -> p[5]));
        int count = Math.min(32, points.size()); long[] result = new long[count * 5];
        for (int i = 0; i < count; i++) System.arraycopy(points.get(i), 0, result, i * 5, 5);
        return result;
    }
}
