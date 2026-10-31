package ads_mobile_sdk;

import b.c0;
import b.h8;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class o70 extends h8 {

    /* renamed from: a, reason: collision with root package name */
    public final String f7795a;

    /* renamed from: b, reason: collision with root package name */
    public final String f7796b;

    public o70(String str, String str2) {
        this.f7795a = str;
        this.f7796b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o70)) {
            return false;
        }
        o70 o70Var = (o70) obj;
        return Intrinsics.b(this.f7795a, o70Var.f7795a) && Intrinsics.b(this.f7796b, o70Var.f7796b);
    }

    public final int hashCode() {
        return this.f7796b.hashCode() + (this.f7795a.hashCode() * 31);
    }

    public final String toString() {
        return c0.n("StringCustomAsset(key=", this.f7795a, ", stringValue=", this.f7796b, ")");
    }
}
