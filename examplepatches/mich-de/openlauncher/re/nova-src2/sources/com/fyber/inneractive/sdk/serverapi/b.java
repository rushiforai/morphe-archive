package com.fyber.inneractive.sdk.serverapi;

import android.app.NotificationManager;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothManager;
import android.content.Intent;
import android.content.IntentFilter;
import android.media.AudioDeviceInfo;
import android.media.AudioManager;
import android.os.Build;
import android.os.PowerManager;
import android.os.SystemClock;
import android.os.ext.SdkExtensions;
import android.provider.Settings;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.c1;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.config.q0;
import com.fyber.inneractive.sdk.config.u0;
import com.fyber.inneractive.sdk.config.v0;
import com.fyber.inneractive.sdk.config.w0;
import com.fyber.inneractive.sdk.config.y0;
import com.fyber.inneractive.sdk.util.o;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

/* loaded from: classes.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static final a f31093a = new a();

    /* renamed from: b, reason: collision with root package name */
    public static final List f31094b = Arrays.asList("POWER_SAVE_MODE_OPEN", "SmartModeStatus");

    public static String a(float f11) {
        return f11 < 5.0f ? "1" : f11 <= 9.0f ? "2" : f11 <= 24.0f ? "3" : f11 <= 39.0f ? "4" : f11 <= 54.0f ? "5" : f11 <= 69.0f ? "6" : f11 <= 84.0f ? "7" : f11 <= 100.0f ? "8" : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    public static String b() {
        try {
            if (o.f31210a.registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED")) == null) {
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            return a((r1.getIntExtra("level", -1) * 100) / r1.getIntExtra("scale", -1));
        } catch (Throwable unused) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
    }

    public static Long c() throws NumberFormatException {
        long j11;
        c1 c1Var = IAConfigManager.Q.f27764x;
        c1Var.getClass();
        try {
            String str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            String str2 = (String) c1Var.f27773d.get("SESSION_STAMP");
            if (!TextUtils.isEmpty(str2)) {
                str = str2;
            }
            j11 = Long.parseLong(str);
        } catch (Exception unused) {
            j11 = 0;
        }
        return Long.valueOf(TimeUnit.SECONDS.convert(SystemClock.elapsedRealtime() - j11, TimeUnit.MILLISECONDS));
    }

    public static String d() {
        return String.valueOf(Build.VERSION.SDK_INT);
    }

    public static Long e() {
        try {
            return Long.valueOf(TimeUnit.MINUTES.convert(Calendar.getInstance().getTimeZone().getOffset(System.currentTimeMillis()), TimeUnit.MILLISECONDS));
        } catch (Throwable unused) {
            return null;
        }
    }

    public static Boolean f() {
        try {
            return Boolean.valueOf(Settings.System.getInt(o.f31210a.getContentResolver(), "airplane_mode_on", 0) != 0);
        } catch (Throwable unused) {
            return null;
        }
    }

    public static Boolean g() {
        int i5 = Build.VERSION.SDK_INT;
        boolean z11 = false;
        boolean z12 = i5 >= 34 && o.a("android.permission.BLUETOOTH_CONNECT");
        if (i5 < 34 && o.a("android.permission.BLUETOOTH")) {
            z11 = true;
        }
        if (!z12 && !z11) {
            return null;
        }
        try {
            BluetoothAdapter adapter = ((BluetoothManager) o.f31210a.getSystemService("bluetooth")).getAdapter();
            if (adapter.getProfileConnectionState(1) != 2 && adapter.getProfileConnectionState(2) != 2) {
                return null;
            }
            return Boolean.TRUE;
        } catch (Throwable unused) {
            return null;
        }
    }

    public static Boolean h() {
        return Boolean.valueOf((o.f31210a.getResources().getConfiguration().uiMode & 48) == 32);
    }

    public static Boolean i() {
        int intExtra;
        try {
            Intent intentRegisterReceiver = o.f31210a.registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
            boolean z11 = false;
            if (intentRegisterReceiver != null && ((intExtra = intentRegisterReceiver.getIntExtra("plugged", -1)) == 1 || intExtra == 2 || intExtra == 4)) {
                z11 = true;
            }
            return Boolean.valueOf(z11);
        } catch (Throwable unused) {
            return null;
        }
    }

    public static Boolean j() {
        try {
            AudioManager audioManager = (AudioManager) o.f31210a.getSystemService("audio");
            if (audioManager != null) {
                return Boolean.valueOf(audioManager.getStreamVolume(3) == 0);
            }
            return null;
        } catch (Throwable unused) {
            return null;
        }
    }

    public static Boolean k() {
        try {
            int ringerMode = ((AudioManager) o.f31210a.getSystemService("audio")).getRingerMode();
            boolean z11 = true;
            if (ringerMode != 0 && ringerMode != 1) {
                z11 = false;
            }
            return Boolean.valueOf(z11);
        } catch (Throwable unused) {
            return null;
        }
    }

    public static Boolean l() {
        try {
            int currentInterruptionFilter = ((NotificationManager) o.f31210a.getSystemService("notification")).getCurrentInterruptionFilter();
            return Boolean.valueOf(currentInterruptionFilter >= 2 && currentInterruptionFilter <= 4);
        } catch (Throwable unused) {
            return null;
        }
    }

    public static Boolean m() {
        try {
            boolean z11 = false;
            for (AudioDeviceInfo audioDeviceInfo : ((AudioManager) o.f31210a.getSystemService("audio")).getDevices(2)) {
                if (audioDeviceInfo.getType() == 22 || audioDeviceInfo.getType() == 11 || audioDeviceInfo.getType() == 12 || audioDeviceInfo.getType() == 4 || audioDeviceInfo.getType() == 3) {
                    z11 = true;
                }
            }
            return Boolean.valueOf(z11);
        } catch (Throwable unused) {
            return null;
        }
    }

    public static Boolean n() {
        Integer num;
        try {
            String upperCase = Build.MANUFACTURER.toUpperCase(Locale.getDefault());
            if (TextUtils.isEmpty(upperCase) || !f31093a.containsKey(upperCase)) {
                return Boolean.valueOf(((PowerManager) o.f31210a.getSystemService("power")).isPowerSaveMode());
            }
            try {
                Iterator it = f31094b.iterator();
                while (it.hasNext()) {
                    int i5 = Settings.System.getInt(o.f31210a.getContentResolver(), (String) it.next(), -1);
                    if (i5 != -1 && (num = (Integer) f31093a.get(upperCase)) != null) {
                        return Boolean.valueOf(num.intValue() == i5);
                    }
                }
                return null;
            } catch (Throwable unused) {
                return null;
            }
        } catch (Throwable unused2) {
            return null;
        }
    }

    public static UnitDisplayType a(String str) {
        w0 w0Var;
        UnitDisplayType unitDisplayType = UnitDisplayType.INTERSTITIAL;
        IAConfigManager iAConfigManager = IAConfigManager.Q;
        HashMap map = iAConfigManager.f27743a;
        v0 v0Var = (map == null || !map.containsKey(str)) ? null : (v0) iAConfigManager.f27743a.get(str);
        if (v0Var != null && v0Var.f27940a.size() > 0 && (w0Var = (w0) v0Var.f27940a.get(0)) != null) {
            y0 y0Var = w0Var.f27948f;
            q0 q0Var = w0Var.f27945c;
            u0 u0Var = w0Var.f27947e;
            if (y0Var != null) {
                return y0Var.f27963j;
            }
            if (q0Var != null) {
                return q0Var.f27882b;
            }
            if (u0Var != null) {
                return UnitDisplayType.NATIVE;
            }
        }
        return unitDisplayType;
    }

    public static Integer a() {
        Integer numValueOf = Build.VERSION.SDK_INT >= 30 ? Integer.valueOf(SdkExtensions.getExtensionVersion(1000000)) : null;
        if (numValueOf == null || numValueOf.intValue() == 0) {
            return null;
        }
        return numValueOf;
    }
}
