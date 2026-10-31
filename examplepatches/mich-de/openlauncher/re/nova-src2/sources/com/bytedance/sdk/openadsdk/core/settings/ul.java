package com.bytedance.sdk.openadsdk.core.settings;

import android.util.Log;
import com.bytedance.sdk.component.utils.htf;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes2.dex */
public class ul {
    private static final AtomicInteger ycx = new AtomicInteger(1);

    public static boolean ycx() {
        return ycx.get() == 1;
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0030  */
    /* JADX WARN: Removed duplicated region for block: B:29:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void ycx(int i5) {
        boolean z11 = true;
        if (i5 == 1 || i5 == 2) {
            try {
                AtomicInteger atomicInteger = ycx;
                if (atomicInteger.get() != i5) {
                    try {
                        atomicInteger.set(i5);
                    } catch (Throwable th2) {
                        th = th2;
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "aOomphS1fcSI", "SPcjljCrYNODQg==", 65);
                        htf.sya("SdkSwitch", th.getMessage());
                        if (z11) {
                        }
                    }
                } else {
                    z11 = false;
                }
            } catch (Throwable th3) {
                th = th3;
                z11 = false;
            }
            if (z11) {
                return;
            }
            Log.e("SdkSwitch", "switch status changed: " + ycx());
            if (ycx()) {
                com.bytedance.sdk.openadsdk.dj.ycx.zb.zb();
            } else {
                com.bytedance.sdk.openadsdk.dj.ycx.zb.sya();
            }
        }
    }
}
