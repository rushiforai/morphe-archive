package com.bytedance.sdk.component.zb.ycx.zb;

/* loaded from: classes2.dex */
final class lt {
    static lud ycx;

    /* renamed from: zb, reason: collision with root package name */
    static long f24226zb;

    private lt() {
    }

    public static lud ycx() {
        synchronized (lt.class) {
            lud ludVar = ycx;
            if (ludVar == null) {
                return new lud();
            }
            ycx = ludVar.f24228lt;
            ludVar.f24228lt = null;
            f24226zb -= 8192;
            return ludVar;
        }
    }

    public static void ycx(lud ludVar) {
        if (ludVar.f24228lt == null && ludVar.f24229ul == null) {
            if (ludVar.f24227dj) {
                return;
            }
            synchronized (lt.class) {
                try {
                    long j11 = f24226zb;
                    if (j11 + 8192 > 65536) {
                        return;
                    }
                    f24226zb = j11 + 8192;
                    ludVar.f24228lt = ycx;
                    ludVar.sya = 0;
                    ludVar.f24230zb = 0;
                    ycx = ludVar;
                    return;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        throw new IllegalArgumentException();
    }
}
