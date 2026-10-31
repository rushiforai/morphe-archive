package com.amplitude.android.network;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import r70.k;
import x80.a0;
import x80.m0;
import x80.p0;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0003\u001a\u0013\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lx80/m0;", b.f42142b, "isJsonContentType", "(Lx80/m0;)Z", "android_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class NetworkTrackingPluginKt {
    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean isJsonContentType(m0 m0Var) {
        a0 a0VarContentType;
        p0 p0Var = m0Var.f95559g;
        if (p0Var == null || (a0VarContentType = p0Var.contentType()) == null) {
            return true;
        }
        return a0VarContentType.f95399b.equals("application") && k.K0(a0VarContentType.f95400c, "json", false);
    }
}
