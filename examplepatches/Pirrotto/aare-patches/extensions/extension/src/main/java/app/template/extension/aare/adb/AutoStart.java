package app.template.extension.aare.adb;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.util.Log;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import app.template.extension.aare.PatchSettings;

/**
 * Starts AARE's integrated Shizuku each time AARE connects to the car, if it isn't running yet
 * (after a restart of the phone, for example): as soon as the phone is on a Wi-Fi network, the
 * car's own Wi-Fi included.
 *
 * AARE picks the car-audio method when the car opens its audio channels, which may be before the
 * server is up: the channels opened meanwhile are started again once it is, so they move to the
 * Shizuku method.
 */
public final class AutoStart {
    private static final String TAG = "AarePatches";
    /** How long to wait for Wi-Fi after the car connects (wireless Android Auto joins it first). */
    private static final long WIFI_WAIT_MS = 3 * 60_000;

    private static volatile boolean running;
    private static final List<WeakReference<Object>[]> channels = new ArrayList<>();
    private static final Handler main = new Handler(Looper.getMainLooper());

    private AutoStart() {
    }

    /** Called at the start of AARE's ProjectionService.onCreate. */
    public static void onCarConnection(Context context) {
        try {
            Context app = context.getApplicationContext() != null ? context.getApplicationContext() : context;
            if (!eligible(app) || running) return;
            running = true;
            synchronized (channels) {
                channels.clear();
            }
            new Thread(() -> run(app), "aare-integrated-shizuku").start();
        } catch (Throwable t) {
            Log.w(TAG, "integrated shizuku: car connection", t);
        }
    }

    /** Called at the start of CarSession.startAudio(channel): remembers the channel. */
    @SuppressWarnings("unchecked")
    public static void onAudio(Object session, Object channel) {
        if (!running) return;
        synchronized (channels) {
            channels.add(new WeakReference[]{new WeakReference<>(session), new WeakReference<>(channel)});
        }
    }

    private static boolean eligible(Context context) {
        if (!PatchSettings.isEnabled(context, PatchSettings.INTEGRATED_SHIZUKU)) return false;
        if (!IntegratedShizuku.autoStart(context) || !IntegratedShizuku.isPaired(context)) return false;
        // The Shizuku app's server: leave it. Ours: started again only if AARE was updated since.
        if (IntegratedShizuku.anyShizukuRunning()) {
            if (!IntegratedShizuku.isRunning() || !IntegratedShizuku.outdated(context)) return false;
        }
        return IntegratedShizuku.canWriteSecureSettings(context)
                || Settings.Global.getInt(context.getContentResolver(), "adb_wifi_enabled", 0) == 1;
    }

    private static void run(Context context) {
        try {
            // Tries again until it works or the time is up: Wi-Fi may come and go while the car connects.
            long deadline = System.currentTimeMillis() + WIFI_WAIT_MS;
            IntegratedShizuku.Result result = null;
            while (System.currentTimeMillis() < deadline) {
                if (IntegratedShizuku.onWifi(context)) {
                    result = IntegratedShizuku.start(context);
                    Log.i(TAG, "integrated shizuku: car start " + result);
                    if (result == IntegratedShizuku.Result.STARTED || result == IntegratedShizuku.Result.ALREADY_RUNNING
                            || result == IntegratedShizuku.Result.NOT_PAIRED) break;
                }
                Thread.sleep(10_000);
            }
            if (result == IntegratedShizuku.Result.STARTED) main.post(AutoStart::restartAudio);
        } catch (Throwable t) {
            Log.w(TAG, "integrated shizuku: car start", t);
        } finally {
            running = false;
        }
    }

    /** Starts the car's audio channels again, now with the Shizuku method. */
    private static void restartAudio() {
        List<WeakReference<Object>[]> list;
        synchronized (channels) {
            list = new ArrayList<>(channels);
            channels.clear();
        }
        for (WeakReference<Object>[] pair : list) {
            Object session = pair[0].get(), channel = pair[1].get();
            if (session == null || channel == null) continue;
            try {
                for (Method m : session.getClass().getDeclaredMethods()) {
                    if (m.getName().equals("startAudio") && m.getParameterTypes().length == 1
                            && m.getParameterTypes()[0].isInstance(channel)) {
                        m.setAccessible(true);
                        m.invoke(session, channel);
                        break;
                    }
                }
            } catch (Throwable t) {
                Log.w(TAG, "integrated shizuku: restart audio", t);
            }
        }
    }
}
