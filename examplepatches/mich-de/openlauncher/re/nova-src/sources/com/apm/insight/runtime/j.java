package com.apm.insight.runtime;

import com.apm.insight.MonitorCrash;

/* loaded from: classes.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    private static MonitorCrash f21894a = null;

    /* renamed from: b, reason: collision with root package name */
    private static int f21895b = -1;

    /* renamed from: c, reason: collision with root package name */
    private static int f21896c;

    public static MonitorCrash a() {
        if (f21894a == null) {
            MonitorCrash monitorCrashInitSDK = MonitorCrash.initSDK(com.apm.insight.e.g(), "239017", 200000990L, "2.0.0.9", "com.apm.insight");
            f21894a = monitorCrashInitSDK;
            monitorCrashInitSDK.config().setChannel("release");
        }
        return f21894a;
    }

    public static void a(Throwable th2, String str) {
        if (com.apm.insight.e.g() == null) {
            return;
        }
        if (f21895b == -1) {
            f21895b = 5;
        }
        int i5 = f21896c;
        if (i5 < f21895b) {
            f21896c = i5 + 1;
            a().reportCustomErr(str, "INNER", th2);
        }
    }
}
