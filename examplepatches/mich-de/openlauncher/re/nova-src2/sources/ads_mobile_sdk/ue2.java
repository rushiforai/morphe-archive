package ads_mobile_sdk;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class ue2 {

    /* renamed from: a, reason: collision with root package name */
    public final String f10324a;

    /* renamed from: b, reason: collision with root package name */
    public final qw2 f10325b;

    /* renamed from: c, reason: collision with root package name */
    public final String f10326c;

    public ue2(String filename, qw2 adFormat, String adRequest) {
        Intrinsics.g(filename, "filename");
        Intrinsics.g(adFormat, "adFormat");
        Intrinsics.g(adRequest, "adRequest");
        this.f10324a = filename;
        this.f10325b = adFormat;
        this.f10326c = adRequest;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ue2)) {
            return false;
        }
        ue2 ue2Var = (ue2) obj;
        return Intrinsics.b(this.f10324a, ue2Var.f10324a) && this.f10325b == ue2Var.f10325b && Intrinsics.b(this.f10326c, ue2Var.f10326c);
    }

    public final int hashCode() {
        return this.f10326c.hashCode() + ((this.f10325b.hashCode() + (this.f10324a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("PersistentCacheToken(filename=");
        sb2.append(this.f10324a);
        sb2.append(", adFormat=");
        sb2.append(this.f10325b);
        sb2.append(", adRequest=");
        return c0.q(sb2, this.f10326c, ")");
    }
}
