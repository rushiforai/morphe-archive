package ads_mobile_sdk;

import b.c0;
import b.t2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class s8 {

    /* renamed from: b, reason: collision with root package name */
    public String f9458b = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    /* renamed from: c, reason: collision with root package name */
    public String f9459c = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s8)) {
            return false;
        }
        s8 s8Var = (s8) obj;
        return Intrinsics.b(this.f9458b, s8Var.f9458b) && this.f9459c.equals(s8Var.f9459c);
    }

    public final int hashCode() {
        return this.f9459c.hashCode() + t2.a(this.f9458b, 0);
    }

    public final String toString() {
        return c0.n("AdTraceMeta(impressionEarned=false, adTraceId=", this.f9458b, ", backendQueryId=", this.f9459c, ")");
    }
}
