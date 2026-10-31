package yx;

import android.content.Context;
import com.amplitude.android.Amplitude;
import com.amplitude.android.AutocaptureOptionsKt;
import com.amplitude.android.Configuration;
import com.amplitude.android.TrackingOptions;
import com.amplitude.android.events.Identify;
import com.amplitude.android.plugins.SessionReplayPlugin;
import com.amplitude.core.ServerZone;
import com.amplitude.core.events.EventOptions;
import e10.y2;
import j10.m;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: b, reason: collision with root package name */
    public static volatile Amplitude f97679b;

    /* renamed from: c, reason: collision with root package name */
    public static volatile boolean f97680c;

    /* renamed from: e, reason: collision with root package name */
    public static volatile SessionReplayPlugin f97682e;

    /* renamed from: f, reason: collision with root package name */
    public static volatile String f97683f;

    /* renamed from: h, reason: collision with root package name */
    public static volatile boolean f97685h;

    /* renamed from: i, reason: collision with root package name */
    public static boolean f97686i;

    /* renamed from: a, reason: collision with root package name */
    public static final b f97678a = new b();

    /* renamed from: d, reason: collision with root package name */
    public static volatile a f97681d = a.f97675a;

    /* renamed from: g, reason: collision with root package name */
    public static final ConcurrentHashMap f97684g = new ConcurrentHashMap();

    public static void a(String str) {
        f97684g.remove(str);
        if (f97681d != a.f97675a) {
            return;
        }
        Identify identify = new Identify();
        identify.unset(str);
        Amplitude amplitude = f97679b;
        if (amplitude != null) {
            com.amplitude.core.Amplitude.identify$default(amplitude, identify, (EventOptions) null, 2, (Object) null);
        }
    }

    public static void c(String str) {
        Amplitude amplitude;
        f97683f = str;
        if (f97681d == a.f97675a && (amplitude = f97679b) != null) {
            amplitude.setUserId(str);
        }
    }

    public static void d(Object obj, String str) {
        f97684g.put(str, obj);
        if (f97681d != a.f97675a) {
            return;
        }
        Identify identify = new Identify();
        identify.set(str, obj);
        Amplitude amplitude = f97679b;
        if (amplitude != null) {
            com.amplitude.core.Amplitude.identify$default(amplitude, identify, (EventOptions) null, 2, (Object) null);
        }
    }

    public static void g(String str, Map map) {
        if (f97681d != a.f97675a) {
            map = null;
        }
        Map map2 = map;
        Amplitude amplitude = f97679b;
        if (amplitude != null) {
            com.amplitude.core.Amplitude.track$default(amplitude, str, map2, (EventOptions) null, 4, (Object) null);
        }
    }

    public final synchronized void b(Context context, boolean z11, a aVar) {
        Amplitude amplitude;
        Amplitude amplitude2;
        boolean zI = m.i(context);
        if (f97680c && f97681d == aVar && f97685h == zI) {
            return;
        }
        if (f97680c) {
            f();
            Amplitude amplitude3 = f97679b;
            if (amplitude3 != null) {
                amplitude3.flush();
            }
            f97679b = null;
            f97680c = false;
        }
        f97681d = aVar;
        f97685h = zI;
        f97686i = z11;
        f97679b = new Amplitude(new Configuration("695bd40ef9ffbd57cae4c31d645e4a3d", context.getApplicationContext(), 0, 0, null, !z11, null, null, null, null, null, 0, false, ServerZone.EU, null, null, null, false, false, false, aVar == a.f97676b ? new TrackingOptions().disableIpAddress().disableCity().disableDma().disableRegion().disableCountry().disableCarrier().disableLatLng() : zI ? new TrackingOptions().disableIpAddress().disableCity().disableDma().disableRegion().disableCountry().disableLatLng() : new TrackingOptions().disableLatLng(), false, false, false, 0L, AutocaptureOptionsKt.autocaptureOptions(new xu.c(5)), 0L, null, null, false, null, null, null, null, null, false, false, false, -34611236, 63, null));
        a aVar2 = a.f97675a;
        if (aVar != aVar2 || zI) {
            Objects.toString(aVar);
        }
        if (aVar == aVar2) {
            y2.f51877a.getClass();
            String str = (String) y2.k().l();
            if (!Intrinsics.b(str, y2.k().f51806a) && (amplitude2 = f97679b) != null) {
                amplitude2.setDeviceId(str);
            }
            String str2 = f97683f;
            if (str2 != null && (amplitude = f97679b) != null) {
                amplitude.setUserId(str2);
            }
            ConcurrentHashMap concurrentHashMap = f97684g;
            if (!concurrentHashMap.isEmpty()) {
                Identify identify = new Identify();
                for (Map.Entry entry : concurrentHashMap.entrySet()) {
                    identify.set((String) entry.getKey(), entry.getValue());
                }
                Amplitude amplitude4 = f97679b;
                if (amplitude4 != null) {
                    com.amplitude.core.Amplitude.identify$default(amplitude4, identify, (EventOptions) null, 2, (Object) null);
                }
            }
        }
        f97680c = true;
        mc0.d.f76206a.b("Amplitude initialized in %s mode", aVar);
    }

    public final synchronized void e(String str, double d5) {
        if (f97681d != a.f97675a) {
            return;
        }
        Amplitude amplitude = f97679b;
        if (amplitude == null) {
            return;
        }
        if (f97682e != null) {
            return;
        }
        if (amplitude.getOptOut()) {
            return;
        }
        zy.c cVar = zy.c.f98823a;
        double dF = zy.c.f(str, d5);
        if (dF <= 0.0d) {
            return;
        }
        SessionReplayPlugin sessionReplayPlugin = new SessionReplayPlugin(Double.valueOf(dF), false, null, null, null, null, false, null, 254, null);
        f97682e = sessionReplayPlugin;
        amplitude.add(sessionReplayPlugin);
        mc0.d.f76206a.b("Amplitude Session Replay started (rcKey=" + str + ", rate=" + dF + ")", new Object[0]);
    }

    public final synchronized void f() {
        Amplitude amplitude = f97679b;
        if (amplitude == null) {
            return;
        }
        SessionReplayPlugin sessionReplayPlugin = f97682e;
        if (sessionReplayPlugin == null) {
            return;
        }
        amplitude.remove(sessionReplayPlugin);
        f97682e = null;
        mc0.d.f76206a.b("Amplitude Session Replay stopped", new Object[0]);
    }
}
