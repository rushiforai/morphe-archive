package org.chromium.net.impl;

import android.content.Context;
import android.net.http.HttpEngine;
import android.os.Build;
import android.os.Trace;
import android.os.ext.SdkExtensions;
import defpackage.cj2;
import defpackage.grb;
import defpackage.rp;
import defpackage.tp;
import defpackage.w54;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class HttpEngineNativeProvider extends cj2 {
    public HttpEngineNativeProvider(Context context) {
        super(context);
    }

    public static boolean h() {
        return Build.VERSION.SDK_INT >= 30 && SdkExtensions.getExtensionVersion(31) >= 7;
    }

    @Override // defpackage.cj2
    public final w54 b() {
        grb.f("HttpEngineNativeProvider#createBuilder");
        try {
            rp.b();
            w54 w54Var = new w54(new tp(rp.a(this.a)));
            Trace.endSection();
            return w54Var;
        } catch (Throwable th) {
            try {
                Trace.endSection();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
            throw th;
        }
    }

    @Override // defpackage.cj2
    public final String d() {
        return "HttpEngine-Native-Provider";
    }

    @Override // defpackage.cj2
    public final String e() {
        return HttpEngine.getVersionString();
    }

    @Override // defpackage.cj2
    public final boolean f() {
        return h();
    }
}
