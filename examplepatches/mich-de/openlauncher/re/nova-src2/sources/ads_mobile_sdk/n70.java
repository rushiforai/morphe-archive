package ads_mobile_sdk;

import b.h8;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class n70 extends h8 {

    /* renamed from: a, reason: collision with root package name */
    public final String f7450a;

    /* renamed from: b, reason: collision with root package name */
    public final wf1 f7451b;

    public n70(String key, wf1 wf1Var) {
        Intrinsics.g(key, "key");
        this.f7450a = key;
        this.f7451b = wf1Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n70)) {
            return false;
        }
        n70 n70Var = (n70) obj;
        return Intrinsics.b(this.f7450a, n70Var.f7450a) && Intrinsics.b(this.f7451b, n70Var.f7451b);
    }

    public final int hashCode() {
        return this.f7451b.hashCode() + (this.f7450a.hashCode() * 31);
    }

    public final String toString() {
        return "ImageCustomAsset(key=" + this.f7450a + ", imageValue=" + this.f7451b + ")";
    }
}
