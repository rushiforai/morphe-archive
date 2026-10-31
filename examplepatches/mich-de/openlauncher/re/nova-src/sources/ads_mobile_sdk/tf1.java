package ads_mobile_sdk;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class tf1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f9916a;

    /* renamed from: b, reason: collision with root package name */
    public final String f9917b;

    public tf1(String str, String str2) {
        this.f9916a = str;
        this.f9917b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof tf1)) {
            return false;
        }
        tf1 tf1Var = (tf1) obj;
        return Intrinsics.b(this.f9916a, tf1Var.f9916a) && Intrinsics.b(this.f9917b, tf1Var.f9917b);
    }

    public final int hashCode() {
        return this.f9917b.hashCode() + (this.f9916a.hashCode() * 31);
    }

    public final String toString() {
        return c0.n("InternalMuteThisAdReason(description=", this.f9916a, ", muteUrl=", this.f9917b, ")");
    }
}
