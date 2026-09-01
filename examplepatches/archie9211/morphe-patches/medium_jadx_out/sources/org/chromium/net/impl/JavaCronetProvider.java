package org.chromium.net.impl;

import android.content.Context;
import defpackage.cj2;
import defpackage.ti2;
import defpackage.v86;
import defpackage.vv2;
import defpackage.w54;
import java.util.Arrays;
import org.chromium.net.httpflags.HttpFlagsLoader;
import org.chromium.net.httpflags.ResolvedFlags;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class JavaCronetProvider extends cj2 {
    public JavaCronetProvider(Context context) {
        super(context);
    }

    @Override // defpackage.cj2
    public final w54 b() {
        boolean zH = HttpEngineNativeProvider.h();
        Context context = this.a;
        if (zH) {
            ti2 ti2Var = ti2.CRONET_SOURCE_FALLBACK;
            ResolvedFlags.Value value = HttpFlagsLoader.getHttpFlags(context, ImplVersion.getCronetVersion(), false, vv2.J(context).getBoolean("android.net.http.EnableTelemetry", ti2Var == ti2.CRONET_SOURCE_PLATFORM || ti2Var == ti2.CRONET_SOURCE_PLAY_SERVICES)).flags().get("Cronet_ForceHttpEngineInFallback");
            if (value != null && value.getBoolValue()) {
                return new HttpEngineNativeProvider(context).b();
            }
        }
        return new w54(new v86(context, ti2.CRONET_SOURCE_FALLBACK));
    }

    @Override // defpackage.cj2
    public final String d() {
        return "Fallback-Cronet-Provider";
    }

    @Override // defpackage.cj2
    public final String e() {
        return ImplVersion.getCronetVersion();
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof JavaCronetProvider) {
            return this.a.equals(((JavaCronetProvider) obj).a);
        }
        return false;
    }

    @Override // defpackage.cj2
    public final boolean f() {
        return true;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{JavaCronetProvider.class, this.a});
    }
}
