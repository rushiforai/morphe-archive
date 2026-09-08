package app.xperia.extension.sony.camera;

import android.content.Context;
import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Two extra entries in Sony's "Connect to" list (StreamingConnectMode): RAW_USB and RAW_WIFI. Both run
 * through Sony's RTMP_URL code path (settings items, start dialog, StateMachine) and are then claimed by
 * {@link RawStreamer} instead of the RTMP client. RAW_USB needs no settings (127.0.0.1:6970 over
 * `adb reverse`); RAW_WIFI takes the PC from the "RTMP stream URL" field (rtmp://pc-ip[:port]).
 */
@SuppressWarnings("unused")
public final class RawConnectMode {
    public static final String USB = "RAW_USB";
    public static final String WIFI = "RAW_WIFI";
    private static final String TAG = "RawConnectMode";

    private RawConnectMode() {
    }

    public static boolean isRaw(Object mode) {
        return mode instanceof Enum && ((Enum<?>) mode).name().startsWith("RAW_");
    }

    /** Sony's `mode == RTMP_URL` checks: raw modes behave like RTMP_URL there. */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static Object normalize(Object mode) {
        if (!isRaw(mode)) return mode;
        return Enum.valueOf((Class) mode.getClass(), "RTMP_URL");
    }

    /** StreamingConnectMode.Companion.getOptions(): everything except FACEBOOK (dead in this build). */
    public static Object[] options(Object[] values) {
        List<Object> out = new ArrayList<>(values.length);
        for (Object v : values) {
            if (!((Enum<?>) v).name().equals("FACEBOOK")) out.add(v);
        }
        return out.toArray(Arrays.copyOf(values, 0));
    }

    /** StreamingConnectMode.$values(): one extra constant (the enum constructor is (name, ordinal, icon, text)). */
    public static Object create(String name, int ordinal) {
        try {
            Class<?> type = Class.forName("jp.co.sony.mc.camera.configuration.parameters.StreamingConnectMode");
            Constructor<?> ctor = type.getDeclaredConstructor(String.class, int.class, int.class, int.class);
            ctor.setAccessible(true);
            return ctor.newInstance(name, ordinal, -1, 0);
        } catch (Exception e) {
            throw new IllegalStateException("StreamingConnectMode." + name, e);
        }
    }

    /** StreamingConnectMode.getTextId(): raw label for the raw entries, otherwise the constant's mTextId. */
    public static int textId(Object mode) {
        int raw = rawTextId(mode);
        if (raw != 0) return raw;
        try {
            Field f = mode.getClass().getDeclaredField("mTextId");
            f.setAccessible(true);
            return f.getInt(mode);
        } catch (Exception e) {
            Log.w(TAG, "textId: " + e);
            return 0;
        }
    }

    /** Label resource for the raw entries; 0 for anything else. */
    public static int rawTextId(Object value) {
        if (!isRaw(value)) return 0;
        Context context = appContext();
        if (context == null) return 0;
        String name = USB.equals(((Enum<?>) value).name()) ? "xperia_raw_usb_txt" : "xperia_raw_wifi_txt";
        return context.getResources().getIdentifier(name, "string", context.getPackageName());
    }

    /**
     * CameraSettingsModel.isStreamingConnectReady: 0 = not ours, 1 = ready, 2 = not ready.
     * USB needs nothing; Wi-Fi needs a host in the URL field.
     */
    public static int readiness(Object mode, String rtmpUrl) {
        if (!isRaw(mode)) return 0;
        return hasHost(mode, rtmpUrl) ? 1 : 2;
    }

    /** SettingAppearanceChecker.getKeyDialogForStreamingAvailable: 0 = not ours, 1 = ok, 2 = not set up. */
    public static int keyDialog(Object settingsHolder) {
        try {
            Object mode = call(settingsHolder, "getStreamingConnectMode");
            if (!isRaw(mode)) return 0;
            return hasHost(mode, (String) call(settingsHolder, "getRtmpStreamUrl")) ? 1 : 2;
        } catch (Exception e) {
            Log.w(TAG, "keyDialog: " + e);
            return 0;
        }
    }

    /** Name of the persisted connect mode, or null. */
    public static String current() {
        try {
            Class<?> setting = Class.forName("jp.co.sony.mc.camera.setting.CameraProSetting");
            Object instance = setting.getMethod("getInstance").invoke(null);
            Object key = Class.forName("jp.co.sony.mc.camera.setting.CommonSettings").getField("STREAMING_CONNECT_MODE").get(null);
            Method get = null;
            for (Method m : setting.getMethods()) {
                if (m.getName().equals("get") && m.getParameterCount() == 1 && m.getParameterTypes()[0].isInstance(key)) {
                    get = m;
                    break;
                }
            }
            Object mode = get == null ? null : get.invoke(instance, key);
            return mode instanceof Enum ? ((Enum<?>) mode).name() : null;
        } catch (Exception e) {
            Log.w(TAG, "current: " + e);
            return null;
        }
    }

    private static boolean hasHost(Object mode, String rtmpUrl) {
        if (USB.equals(((Enum<?>) mode).name())) return true;
        return rtmpUrl != null && android.net.Uri.parse(rtmpUrl.trim()).getHost() != null;
    }

    private static Object call(Object target, String method) throws Exception {
        return target.getClass().getMethod(method).invoke(target);
    }

    private static Context appContext() {
        try {
            return (Context) Class.forName("jp.co.sony.mc.camera.CameraApplication").getMethod("getContext").invoke(null);
        } catch (Exception e) {
            Log.w(TAG, "appContext: " + e);
            return null;
        }
    }
}
