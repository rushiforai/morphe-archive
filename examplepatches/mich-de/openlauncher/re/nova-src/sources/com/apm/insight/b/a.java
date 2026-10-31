package com.apm.insight.b;

/* loaded from: classes.dex */
public final class a {
    public a() {
        com.apm.insight.f.a.a();
    }

    public static void a(String str) {
        if (com.apm.insight.e.i().isEnsureEnable()) {
            com.apm.insight.f.b.a(Thread.currentThread().getStackTrace(), str, "EnsureNotReachHere");
        }
    }
}
