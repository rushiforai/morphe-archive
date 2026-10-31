package com.bytedance.sdk.openadsdk.core.settings;

import android.text.TextUtils;
import androidx.annotation.Keep;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.google.android.gms.appset.AppSet;
import com.google.android.gms.appset.AppSetIdInfo;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import fi.g;

/* loaded from: classes2.dex */
public class dj {

    /* renamed from: dj, reason: collision with root package name */
    private static volatile int f26093dj = 0;
    private static String sya = null;
    private static volatile String ycx = "";

    /* renamed from: zb, reason: collision with root package name */
    private static volatile String f26094zb = "";

    public static String dj() {
        if (TextUtils.isEmpty(sya)) {
            sya = pmi.ycx().getPackageManager().getInstallerPackageName(oby.lt());
        }
        if (sya == null) {
            sya = b.f42142b;
        }
        return sya;
    }

    public static String sya() {
        if (f26093dj != 0) {
            return f26094zb;
        }
        ycx();
        return f26094zb;
    }

    public static String zb() {
        if (f26093dj != 0) {
            return ycx;
        }
        ycx();
        return ycx;
    }

    public static void ycx() {
        try {
            AppSet.getClient(pmi.ycx()).getAppSetIdInfo().f(new g() { // from class: com.bytedance.sdk.openadsdk.core.settings.AppSetIdAndScope$1
                @Override // fi.g
                @Keep
                public void onSuccess(AppSetIdInfo appSetIdInfo) {
                    String unused = dj.ycx = Integer.toString(appSetIdInfo.f31693b);
                    String unused2 = dj.f26094zb = appSetIdInfo.getId();
                    int unused3 = dj.f26093dj = 1;
                }
            });
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "ev49pgaoQMOhRNNujx6wLQ==", "XOs5vAedZ8OzSdhNiQ==", 48);
            f26093dj = 2;
        }
    }
}
