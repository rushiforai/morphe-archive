package com.bytedance.sdk.openadsdk.utils;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageInfo;
import android.database.ContentObserver;
import android.media.AudioManager;
import android.net.Uri;
import android.os.Build;
import android.os.PowerManager;
import android.os.SystemClock;
import android.provider.Settings;
import android.text.TextUtils;
import android.view.accessibility.AccessibilityManager;
import b.u4;
import com.amplitude.android.TrackingOptions;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.bytedance.sdk.openadsdk.core.settings.jc;
import com.bytedance.sdk.openadsdk.utils.ul;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.pgl.ssdk.ces.out.PglSSConfig;
import com.pgl.ssdk.ces.out.PglSupport;
import com.tiktok.util.TTConst;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.util.Iterator;
import java.util.Locale;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public class DeviceUtils {

    /* renamed from: dy, reason: collision with root package name */
    private static int f27100dy = 0;
    private static int fby = 0;

    /* renamed from: jw, reason: collision with root package name */
    private static int f27103jw = 0;

    /* renamed from: ry, reason: collision with root package name */
    private static int f27106ry = 0;
    private static int syc = 0;
    private static int xkz = 0;
    public static String ycx = "";

    /* renamed from: zb, reason: collision with root package name */
    private static volatile long f27109zb = System.currentTimeMillis();
    private static volatile boolean sya = false;

    /* renamed from: dj, reason: collision with root package name */
    private static volatile boolean f27099dj = false;
    private static volatile boolean lud = false;

    /* renamed from: lt, reason: collision with root package name */
    private static volatile boolean f27104lt = true;

    /* renamed from: ul, reason: collision with root package name */
    private static long f27108ul = 0;

    /* renamed from: jc, reason: collision with root package name */
    private static String f27102jc = b.f42142b;

    /* renamed from: ea, reason: collision with root package name */
    private static int f27101ea = 0;

    /* renamed from: ok, reason: collision with root package name */
    private static final AtomicBoolean f27105ok = new AtomicBoolean(false);
    private static AtomicBoolean wie = new AtomicBoolean(false);
    private static final Object pmi = new Object();

    /* renamed from: uh, reason: collision with root package name */
    private static volatile String f27107uh = null;
    private static volatile String htf = null;

    public static class AudioInfoReceiver extends BroadcastReceiver {
        static final CopyOnWriteArrayList<com.bytedance.sdk.openadsdk.ry.jw> ycx = new CopyOnWriteArrayList<>();

        /* JADX INFO: Access modifiers changed from: private */
        public static void zb(Context context) {
            if (DeviceUtils.f27099dj || context == null) {
                return;
            }
            try {
                IntentFilter intentFilter = new IntentFilter();
                intentFilter.addAction("android.media.VOLUME_CHANGED_ACTION");
                intentFilter.addAction("android.intent.action.HEADSET_PLUG");
                context.registerReceiver(new AudioInfoReceiver(), intentFilter, null, com.bytedance.sdk.component.utils.jw.ycx());
                boolean unused = DeviceUtils.f27099dj = true;
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "f+s7nAC5XNOJRsQZrQSkIVTHI5MMjmzEhUPBWJ4=", "SesqnBCobNWyT9RYhQelOg==", 899);
            }
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if (intent == null) {
                return;
            }
            try {
                if (!"android.media.VOLUME_CHANGED_ACTION".equals(intent.getAction())) {
                    if ("android.intent.action.HEADSET_PLUG".equals(intent.getAction())) {
                        int unused = DeviceUtils.syc = intent.getIntExtra("state", 0);
                    }
                } else if (intent.getIntExtra("android.media.EXTRA_VOLUME_STREAM_TYPE", -1) == 3) {
                    int unused2 = DeviceUtils.f27106ry = intent.getIntExtra("android.media.EXTRA_VOLUME_STREAM_VALUE", 0);
                    if (!ycx.isEmpty()) {
                        yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.utils.DeviceUtils.AudioInfoReceiver.1
                            @Override // java.lang.Runnable
                            public void run() {
                                Iterator<com.bytedance.sdk.openadsdk.ry.jw> it = AudioInfoReceiver.ycx.iterator();
                                while (it.hasNext()) {
                                    it.next().sya(DeviceUtils.f27106ry);
                                }
                            }
                        });
                    }
                    if (DeviceUtils.f27103jw != 0) {
                        int unused3 = DeviceUtils.xkz = (int) ((DeviceUtils.f27106ry / DeviceUtils.f27103jw) * 100.0d);
                    }
                }
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "f+s7nAC5XNOJRsQZrQSkIVTHI5MMjmzEhUPBWJ4=", "VOAfkAC5YNGF", 951);
            }
        }

        public static void ycx(com.bytedance.sdk.openadsdk.ry.jw jwVar) {
            if (jwVar != null) {
                CopyOnWriteArrayList<com.bytedance.sdk.openadsdk.ry.jw> copyOnWriteArrayList = ycx;
                if (copyOnWriteArrayList.contains(jwVar)) {
                    return;
                }
                copyOnWriteArrayList.add(jwVar);
            }
        }

        public static void zb(com.bytedance.sdk.openadsdk.ry.jw jwVar) {
            if (jwVar == null) {
                return;
            }
            ycx.remove(jwVar);
        }
    }

    /* loaded from: classes2.dex */
    public static class ycx extends BroadcastReceiver {
        private ycx() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static void zb(Context context) {
            int i5 = Build.VERSION.SDK_INT;
            if (context != null) {
                IntentFilter intentFilter = new IntentFilter();
                intentFilter.addAction("android.os.action.POWER_SAVE_MODE_CHANGED");
                intentFilter.addAction("huawei.intent.action.POWER_MODE_CHANGED_ACTION");
                if (i5 >= 33) {
                    context.registerReceiver(new ycx(), intentFilter, 2);
                } else {
                    context.registerReceiver(new ycx(), intentFilter);
                }
            }
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if (intent == null || context == null) {
                return;
            }
            if ("android.os.action.POWER_SAVE_MODE_CHANGED".equals(intent.getAction())) {
                DeviceUtils.thx(context);
            } else if ("huawei.intent.action.POWER_MODE_CHANGED_ACTION".equals(intent.getAction())) {
                int unused = DeviceUtils.f27100dy = intent.getIntExtra("state", 0) == 1 ? 1 : 0;
            }
        }
    }

    /* loaded from: classes2.dex */
    public static class zb extends BroadcastReceiver {
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if ("android.intent.action.SCREEN_ON".equals(intent.getAction())) {
                boolean unused = DeviceUtils.f27104lt = true;
            } else if ("android.intent.action.SCREEN_OFF".equals(intent.getAction())) {
                boolean unused2 = DeviceUtils.f27104lt = false;
            } else if ("android.intent.action.USER_PRESENT".equals(intent.getAction())) {
                long unused3 = DeviceUtils.f27109zb = System.currentTimeMillis();
            }
        }
    }

    private static void dv(Context context) {
        final Context applicationContext = context.getApplicationContext();
        if (applicationContext == null) {
            return;
        }
        context.getContentResolver().registerContentObserver(Uri.parse("content://settings/system/POWER_SAVE_MODE_OPEN"), false, new ContentObserver(null) { // from class: com.bytedance.sdk.openadsdk.utils.DeviceUtils.3
            @Override // android.database.ContentObserver
            public void onChange(boolean z11) {
                super.onChange(z11);
                DeviceUtils.thx(applicationContext);
            }
        });
    }

    public static void ea() throws IOException, ClassNotFoundException {
        com.bytedance.sdk.openadsdk.core.settings.ea.ycx(new jc.ycx() { // from class: com.bytedance.sdk.openadsdk.utils.DeviceUtils.1
            @Override // com.bytedance.sdk.openadsdk.core.settings.jc.ycx
            public void ycx() {
                com.bytedance.sdk.openadsdk.thx.ycx.zb.ycx.ycx().ycx(true);
            }

            @Override // com.bytedance.sdk.openadsdk.core.settings.jc.ycx
            public void zb() {
                com.bytedance.sdk.openadsdk.thx.ycx.zb.ycx.ycx().ycx(true);
                DeviceUtils.wie();
            }
        });
        Context contextYcx = com.bytedance.sdk.openadsdk.core.pmi.ycx();
        if (contextYcx != null) {
            com.bytedance.sdk.openadsdk.core.sya.ycx().ycx("cpu_count", jc.ycx());
            com.bytedance.sdk.openadsdk.core.sya.ycx().ycx("cpu_max_frequency", jc.ycx(jc.ycx()));
            com.bytedance.sdk.openadsdk.core.sya.ycx().ycx("cpu_min_frequency", jc.zb(jc.ycx()));
            String strEa = oby.ea();
            if (strEa != null) {
                com.bytedance.sdk.openadsdk.core.sya.ycx().ycx("total_memory", strEa);
            }
            com.bytedance.sdk.openadsdk.core.sya.ycx().ycx("total_internal_storage", oby.ok());
            com.bytedance.sdk.openadsdk.core.sya.ycx().ycx("free_internal_storage", com.bytedance.sdk.component.utils.wie.ycx());
            com.bytedance.sdk.openadsdk.core.sya.ycx().ycx("total_sdcard_storage", oby.syc());
            com.bytedance.sdk.openadsdk.core.sya.ycx().ycx("is_root", oby.wie() ? 1 : 0);
            if (TextUtils.isEmpty(jc())) {
                try {
                    Class.forName("com.unity3d.player.UnityPlayer");
                    ycx = "unity";
                } catch (ClassNotFoundException e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "f+s7nAC5XNOJRsQ=", "Tv4plBe5TcaUSw==", 612);
                    ycx = "native";
                }
                com.bytedance.sdk.openadsdk.core.sya.ycx().ycx("framework_name", ycx);
            }
            ok();
            htf(contextYcx);
            f27100dy = wwx(contextYcx);
            fby.ycx(contextYcx);
            wie();
        }
    }

    public static int fby(Context context) {
        if (context == null) {
            return -1;
        }
        try {
            return Settings.Secure.getInt(context.getContentResolver(), "adb_enabled", -1);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "f+s7nAC5XNOJRsQ=", "SPc+tAe+WtOBXsJO", 456);
            com.bytedance.sdk.component.utils.htf.sya("TTAD.DeviceUtils", th2.getMessage());
            return -1;
        }
    }

    private static void htf(Context context) {
        try {
            AudioManager audioManager = (AudioManager) context.getSystemService("audio");
            f27103jw = audioManager.getStreamMaxVolume(3);
            int streamVolume = audioManager.getStreamVolume(3);
            f27106ry = streamVolume;
            xkz = (int) ((streamVolume / f27103jw) * 100.0d);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "f+s7nAC5XNOJRsQ=", "UuAkgTWzZdKNTw==", 661);
        }
    }

    public static int jc(Context context) {
        return fby;
    }

    public static int jw(Context context) {
        try {
            return Settings.Global.getInt(context.getContentResolver(), "airplane_mode_on", 0) != 0 ? 1 : 0;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "f+s7nAC5XNOJRsQ=", "Uv0ChQaySM6SWttcghQ=", 474);
            return -1;
        }
    }

    public static int lt(Context context) {
        if (!f27105ok.get()) {
            syc(context);
        }
        return f27101ea;
    }

    public static String lud(Context context) {
        if (!f27105ok.get()) {
            syc(context);
        }
        return f27102jc;
    }

    public static void ok() {
        try {
            int ringerMode = ((AudioManager) com.bytedance.sdk.openadsdk.core.pmi.ycx().getSystemService("audio")).getRingerMode();
            if (ringerMode == 2) {
                fby = 1;
            } else if (ringerMode == 1) {
                fby = 2;
            } else {
                fby = 0;
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "f+s7nAC5XNOJRsQ=", "SesrhwavYfWJRNBwgxWl", 643);
        }
    }

    private static float pmi(Context context) {
        return context.getResources().getDisplayMetrics().density;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void thx(Context context) {
        if (context == null) {
            return;
        }
        final Context applicationContext = context.getApplicationContext();
        yzp.sya((Runnable) new com.bytedance.sdk.component.fby.zb.sya("DeviceUtils_get_low_power_mode") { // from class: com.bytedance.sdk.openadsdk.utils.DeviceUtils.2
            @Override // java.lang.Runnable
            public void run() {
                int unused = DeviceUtils.f27100dy = DeviceUtils.wwx(applicationContext);
            }
        });
    }

    private static int tn(Context context) {
        try {
            String str = Build.MANUFACTURER;
            return str.equalsIgnoreCase("XIAOMI") ? Settings.System.getInt(context.getContentResolver(), "POWER_SAVE_MODE_OPEN") == 1 ? 1 : 0 : (str.equalsIgnoreCase("HUAWEI") && Settings.System.getInt(context.getContentResolver(), "SmartModeStatus") == 4) ? 1 : 0;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "f+s7nAC5XNOJRsQ=", "XOs5uQyrWciXT8VwgxWlG0/vOYAQn2bKkEvD", 724);
            return -1;
        }
    }

    private static int uh(Context context) {
        return f27100dy;
    }

    public static JSONObject ul(Context context) {
        return ycx(context, false);
    }

    private static int wie(Context context) {
        return syc;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int wwx(Context context) {
        if (context == null) {
            return 0;
        }
        try {
            String str = Build.MANUFACTURER;
            if (!str.equalsIgnoreCase("XIAOMI") && !str.equalsIgnoreCase("HUAWEI")) {
                return ((PowerManager) context.getSystemService("power")).isPowerSaveMode() ? 1 : 0;
            }
            return tn(context);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "f+s7nAC5XNOJRsQ=", "XOs5uQyrWciXT8VwgxWlG0/vOYAQ", 703);
            return 0;
        }
    }

    public static int dj(Context context) {
        if (sya(context)) {
            return 3;
        }
        return zb(context) ? 2 : 1;
    }

    private static int dy(Context context) {
        try {
            int i5 = context.getApplicationContext().getResources().getConfiguration().uiMode & 48;
            if (i5 == 32) {
                return 1;
            }
            return i5 == 16 ? 0 : -1;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "f+s7nAC5XNOJRsQ=", "Uv0ChQayTcaSQfpSiBQ=", 494);
            return -1;
        }
    }

    public static String jc() {
        if (TextUtils.isEmpty(ycx)) {
            ycx = com.bytedance.sdk.openadsdk.core.sya.ycx().zb("framework_name", b.f42142b);
        }
        return ycx;
    }

    private static String pmi() {
        try {
            return htf == null ? com.bytedance.sdk.openadsdk.core.sya.ycx().zb("bt_id", b.f42142b) : htf;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "f+s7nAC5XNOJRsQ=", "SOIkkQaeZsiUY9M=", 841);
            return b.f42142b;
        }
    }

    public static boolean sya(Context context) {
        try {
            return (context.getResources().getConfiguration().uiMode & 15) == 4;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "f+s7nAC5XNOJRsQ=", "Uv0Zgw==", 170);
            return false;
        }
    }

    private static void syc(Context context) {
        if (context == null || !f27105ok.compareAndSet(false, true)) {
            return;
        }
        try {
            if (com.bytedance.sdk.openadsdk.dv.lud.ycx("gp_v_enable", 0) == 1) {
                PackageInfo packageInfo = context.getPackageManager().getPackageInfo("com.android.vending", 0);
                f27102jc = packageInfo.versionName;
                f27101ea = packageInfo.versionCode;
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "f+s7nAC5XNOJRsQ=", "UuAkgQq9Zc6aT+dRjQiTPFT8KKMGrnrOj0Q=", Sdk.SDKError.Reason.MRAID_JS_COPY_FAILED_VALUE);
        }
    }

    private static String uh() {
        try {
            if (f27107uh == null) {
                synchronized (pmi) {
                    try {
                        if (f27107uh == null) {
                            f27107uh = ycx(String.valueOf(System.currentTimeMillis() - SystemClock.elapsedRealtime()), com.bytedance.sdk.openadsdk.core.sya.ycx().zb("bt_time", b.f42142b), "bt_time");
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
            }
        } catch (Throwable th3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "f+s7nAC5XNOJRsQ=", "SOIkkSGzZtO0Q9pY", 856);
            f27107uh = b.f42142b;
        }
        return f27107uh;
    }

    public static int ul() {
        return f27106ry;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void wie() {
        if (com.bytedance.sdk.openadsdk.core.pmi.dj().bhi("bt_id")) {
            try {
                if (htf == null) {
                    synchronized (pmi) {
                        try {
                            if (htf == null) {
                                htf = ycx(PglSupport.getBootid(), com.bytedance.sdk.openadsdk.core.sya.ycx().zb("bt_id", b.f42142b), "bt_id");
                            }
                        } catch (Throwable th2) {
                            throw th2;
                        }
                    }
                }
            } catch (Throwable th3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "f+s7nAC5XNOJRsQ=", "Tv4plBe5S8iPXv5Z", 828);
                htf = b.f42142b;
            }
        }
    }

    public static int jw() {
        return f27103jw;
    }

    public static boolean zb() {
        if (SystemClock.elapsedRealtime() - f27108ul >= 20000) {
            f27108ul = SystemClock.elapsedRealtime();
            try {
                PowerManager powerManager = (PowerManager) com.bytedance.sdk.openadsdk.core.pmi.ycx().getSystemService("power");
                if (powerManager != null) {
                    f27104lt = powerManager.isInteractive();
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "f+s7nAC5XNOJRsQ=", "Uv0elhG5bMmvRA==", 145);
                com.bytedance.sdk.component.utils.htf.sya("TTAD.DeviceUtils", th2.getMessage());
            }
        }
        return f27104lt;
    }

    public static String dj() {
        String languageTag = Locale.getDefault().toLanguageTag();
        return !TextUtils.isEmpty(languageTag) ? languageTag : b.f42142b;
    }

    public static int fby() {
        return xkz;
    }

    public static int lt() {
        AccessibilityManager accessibilityManager = (AccessibilityManager) com.bytedance.sdk.openadsdk.core.pmi.ycx().getSystemService("accessibility");
        if (accessibilityManager == null) {
            return -1;
        }
        return accessibilityManager.isEnabled() ? 1 : 0;
    }

    public static float lud() {
        int i5 = -1;
        try {
            Context contextYcx = com.bytedance.sdk.openadsdk.core.pmi.ycx();
            if (contextYcx != null) {
                i5 = Settings.System.getInt(contextYcx.getContentResolver(), "screen_brightness", -1);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "f+s7nAC5XNOJRsQ=", "XOs5pgCubMKOaMVUixm0", TTAdConstant.VIDEO_INFO_CODE);
            com.bytedance.sdk.component.utils.htf.sya("TTAD.DeviceUtils", th2.getMessage());
        }
        if (i5 < 0) {
            return -1.0f;
        }
        return Math.round((i5 / 255.0f) * 10.0f) / 10.0f;
    }

    private static void sya(JSONObject jSONObject) throws JSONException {
        jSONObject.put("model", Build.MODEL);
        com.bytedance.sdk.openadsdk.thx.ycx.zb.ycx.ycx().ycx(jSONObject);
    }

    public static void ycx(Context context) {
        if (sya) {
            return;
        }
        try {
            zb zbVar = new zb();
            IntentFilter intentFilter = new IntentFilter();
            intentFilter.addAction("android.intent.action.SCREEN_ON");
            intentFilter.addAction("android.intent.action.SCREEN_OFF");
            intentFilter.addAction("android.intent.action.USER_PRESENT");
            context.getApplicationContext().registerReceiver(zbVar, intentFilter);
            sya = true;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "f+s7nAC5XNOJRsQ=", "SesqnBCobNWzScVYiR+TPFr6KLcRs2jDg0vESb4Uoy1S+CiH", 120);
        }
    }

    public static int sya() {
        return com.bytedance.sdk.openadsdk.core.sya.ycx().zb("limit_ad_track", -1);
    }

    public static void ok(Context context) {
        Context applicationContext;
        if (lud || context == null || (applicationContext = context.getApplicationContext()) == null) {
            return;
        }
        try {
            if (Build.MANUFACTURER.equalsIgnoreCase("XIAOMI")) {
                dv(applicationContext);
            } else {
                ycx.zb(applicationContext);
            }
            lud = true;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "f+s7nAC5XNOJRsQ=", "SesqnBCobNWwRcBYnjyvLF7MP5oCuErGk17lWI8UqT5e/A==", 754);
        }
    }

    public static boolean zb(Context context) {
        try {
            return (context.getResources().getConfiguration().screenLayout & 15) >= 3;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "f+s7nAC5XNOJRsQ=", "Uv0ZlAGwbNM=", 156);
            return false;
        }
    }

    private static void zb(JSONObject jSONObject) throws JSONException {
        sya(jSONObject);
    }

    public static long ycx() {
        return f27109zb;
    }

    public static JSONObject ycx(Context context, boolean z11) throws JSONException {
        String strJc;
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("sys_adb_status", fby(context));
            zb(jSONObject);
            jSONObject.put(TTConst.TRACK_TYPE, dj(context));
            jSONObject.put("os", 1);
            jSONObject.put(TrackingOptions.AMP_TRACKING_OPTION_OS_VERSION, Build.VERSION.RELEASE);
            jSONObject.put("vendor", Build.MANUFACTURER);
            jSONObject.put("conn_type", oby.fby(context));
            jSONObject.put(TrackingOptions.AMP_TRACKING_OPTION_APP_SET_ID, com.bytedance.sdk.openadsdk.core.settings.dj.sya());
            jSONObject.put("app_set_id_scope", com.bytedance.sdk.openadsdk.core.settings.dj.zb());
            jSONObject.put("installed_source", com.bytedance.sdk.openadsdk.core.settings.dj.dj());
            jSONObject.put("screen_scale", dc.ul(context));
            jSONObject.put("density", dc.jw(context));
            jSONObject.put("screen_width", dc.dj(context));
            jSONObject.put("screen_height", dc.lt(context));
            jSONObject.put("sec_did", com.bytedance.sdk.openadsdk.core.ok.sya.lt());
            com.bytedance.sdk.openadsdk.core.settings.ea eaVarDj = com.bytedance.sdk.openadsdk.core.pmi.dj();
            if (eaVarDj.bhi("boot")) {
                jSONObject.put("boot", String.valueOf(System.currentTimeMillis() - SystemClock.elapsedRealtime()));
                jSONObject.put("power_on_time", String.valueOf(SystemClock.elapsedRealtime()));
            }
            jSONObject.put("uuid", com.bytedance.sdk.openadsdk.core.ry.sya(context));
            jSONObject.put("rom_version", bhi.ycx());
            jSONObject.put("sys_compiling_time", com.bytedance.sdk.openadsdk.core.ry.zb(context));
            jSONObject.put("timezone", oby.tru());
            jSONObject.put(TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE, com.bytedance.sdk.openadsdk.core.ry.zb());
            jSONObject.put("carrier_name", rmf.ycx());
            if (z11) {
                strJc = oby.ycx(context);
                jSONObject.put("board", Build.BOARD);
                jSONObject.put("device_city", oby.dv());
                ycx(jSONObject);
            } else {
                strJc = oby.jc();
            }
            jSONObject.put("total_mem", String.valueOf(Long.parseLong(strJc) * 1024));
            jSONObject.put("locale_language", dj());
            jSONObject.put("screen_bright", Math.ceil(lud() * 10.0f) / 10.0d);
            jSONObject.put("is_screen_off", !zb() ? 1 : 0);
            jSONObject.put("cpu_num", jc.zb());
            jSONObject.put("cpu_max_freq", jc.sya());
            jSONObject.put("cpu_min_freq", jc.dj());
            ul.ycx ycxVarYcx = ul.ycx();
            jSONObject.put("battery_remaining_pct", (int) ycxVarYcx.f27180zb);
            jSONObject.put("is_charging", ycxVarYcx.ycx);
            jSONObject.put("total_space", String.valueOf(oby.zb(context)));
            jSONObject.put("free_space_in", String.valueOf(oby.ry()));
            jSONObject.put("sdcard_size", String.valueOf(oby.xkz()));
            jSONObject.put("rooted", oby.dy());
            jSONObject.put("enable_assisted_clicking", lt());
            jSONObject.put("force_language", com.bytedance.sdk.component.utils.wwx.ycx(context, "tt_choose_language"));
            jSONObject.put("airplane", jw(context));
            jSONObject.put("darkmode", dy(context));
            jSONObject.put("headset", wie(context));
            jSONObject.put("ringmute", jc(context));
            jSONObject.put("screenscale", pmi(context));
            jSONObject.put("volume", fby());
            jSONObject.put("low_power_mode", uh(context));
            jSONObject.put("enable_draw_feed", oby.aeu());
            if (z11) {
                fby.ycx(jSONObject, context);
                jSONObject.put("gp_v_name", lud(context));
                jSONObject.put("gp_v_code", lt(context));
            }
            if (eaVarDj.bhi("mnc")) {
                jSONObject.put("mnc", rmf.sya());
            }
            if (eaVarDj.bhi("mcc")) {
                jSONObject.put("mcc", rmf.zb());
            }
            jSONObject.put("act", com.bytedance.sdk.openadsdk.core.ycx.ycx.zb(context));
            jSONObject.put("act_event", com.bytedance.sdk.openadsdk.core.ycx.ycx.ycx());
            String strSya = com.bytedance.sdk.openadsdk.core.ok.sya.sya();
            com.bytedance.sdk.openadsdk.core.ok.sya.dj();
            if (!TextUtils.isEmpty(strSya)) {
                jSONObject.put("sof_chara", strSya);
            }
            String strZb = com.bytedance.sdk.openadsdk.uh.dj.ycx.zb("ttopenadsdk", PglSSConfig.CUSTOMINFO_KEY_IPV6, b.f42142b);
            if (!strZb.isEmpty()) {
                jSONObject.put("ipv6", strZb);
            }
            jSONObject.put("is_multi", !com.bytedance.sdk.component.utils.thx.ycx(com.bytedance.sdk.openadsdk.core.pmi.ycx()));
            return jSONObject;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "f+s7nAC5XNOJRsQ=", "XOs5sQaqYMSFY9lbgzevOnXrObQTtQ==", 328);
            return jSONObject;
        }
    }

    public static void ea(Context context) {
        AudioInfoReceiver.zb(context);
    }

    public static void ycx(JSONObject jSONObject) {
        try {
            com.bytedance.sdk.openadsdk.core.settings.ea eaVarDj = com.bytedance.sdk.openadsdk.core.pmi.dj();
            if (eaVarDj.bhi("boot")) {
                jSONObject.put("bt_time", uh());
            } else {
                jSONObject.put("bt_time", "not_allowed");
                com.bytedance.sdk.openadsdk.core.sya.ycx().ycx("bt_time");
            }
            if (eaVarDj.bhi("bt_id")) {
                jSONObject.put("bt_id", pmi());
            } else {
                jSONObject.put("bt_id", "not_allowed");
                com.bytedance.sdk.openadsdk.core.sya.ycx().ycx("bt_id");
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "f+s7nAC5XNOJRsQ=", "WuoppRG1f8aDU/55vBCyKVb9", 353);
        }
    }

    private static String ycx(String str, String str2, String str3) {
        if (TextUtils.isEmpty(str)) {
            return str2;
        }
        if (!TextUtils.isEmpty(str2)) {
            String[] strArrSplit = str2.split(",");
            int iHf = com.bytedance.sdk.openadsdk.core.settings.ea.zb().hf();
            if (iHf != 1) {
                if (str.equals(strArrSplit[0]) || ("bt_time".equals(str3) && Math.abs(Long.parseLong(str) - Long.parseLong(strArrSplit[0])) < 1000)) {
                    return str2;
                }
                if (strArrSplit.length < iHf) {
                    str = u4.m(str, ",", str2);
                } else {
                    int iLastIndexOf = str2.lastIndexOf(",");
                    if (iLastIndexOf != -1) {
                        str = u4.m(str, ",", str2.substring(0, iLastIndexOf));
                    }
                }
            }
        }
        com.bytedance.sdk.openadsdk.core.sya.ycx().ycx(str3, str);
        return str;
    }
}
