package io.sentry.android.core;

import android.os.Build;
import io.sentry.ILogger;
import io.sentry.g3;

/* loaded from: classes4.dex */
public final class a0 {

    /* renamed from: a, reason: collision with root package name */
    public final ILogger f66846a;

    public a0(ILogger iLogger) {
        i30.j.Q(iLogger, "The ILogger object is required.");
        this.f66846a = iLogger;
    }

    /* JADX WARN: Removed duplicated region for block: B:42:0x0097  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Boolean a() {
        boolean z11;
        try {
            if (!Build.BRAND.startsWith("generic") || !Build.DEVICE.startsWith("generic")) {
                String str = Build.FINGERPRINT;
                if (str.startsWith("generic") || str.startsWith("unknown")) {
                    z11 = true;
                } else {
                    String str2 = Build.HARDWARE;
                    if (!str2.contains("goldfish") && !str2.contains("ranchu")) {
                        String str3 = Build.MODEL;
                        if (!str3.contains("google_sdk") && !str3.contains("Emulator") && !str3.contains("Android SDK built for x86") && !Build.MANUFACTURER.contains("Genymotion")) {
                            String str4 = Build.PRODUCT;
                            if (!str4.contains("sdk_google") && !str4.contains("google_sdk") && !str4.contains("sdk") && !str4.contains("sdk_x86") && !str4.contains("vbox86p") && !str4.contains("emulator") && !str4.contains("simulator")) {
                                z11 = false;
                            }
                        }
                    }
                }
            }
            return Boolean.valueOf(z11);
        } catch (Throwable th2) {
            this.f66846a.e(g3.ERROR, "Error checking whether application is running in an emulator.", th2);
            return null;
        }
    }
}
