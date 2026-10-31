package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class u22 {

    /* renamed from: a, reason: collision with root package name */
    public final v22 f10190a;

    public u22(v22 v22Var) {
        this.f10190a = v22Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof u22) && Intrinsics.b(this.f10190a, ((u22) obj).f10190a);
    }

    public final int hashCode() {
        return this.f10190a.hashCode();
    }

    public final String toString() {
        return "NetworkPingConfig(networkPingStrategy=" + this.f10190a + ")";
    }
}
