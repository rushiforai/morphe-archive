package com.google.android.gms.internal.measurement;

import android.os.Build;
import dalvik.system.VMStack;

/* loaded from: classes3.dex */
public final class i extends e {

    /* renamed from: b, reason: collision with root package name */
    public static final k1 f32619b;

    static {
        try {
            Class.forName("dalvik.system.VMStack").getMethod("getStackClass2", null);
            h.class.getName().equals(a());
        } catch (Throwable unused) {
        }
        String str = Build.FINGERPRINT;
        if (str != null) {
            "robolectric".equals(str);
        }
        f32619b = new k1(4);
    }

    public static String a() {
        try {
            return VMStack.getStackClass2().getName();
        } catch (Throwable unused) {
            return null;
        }
    }
}
