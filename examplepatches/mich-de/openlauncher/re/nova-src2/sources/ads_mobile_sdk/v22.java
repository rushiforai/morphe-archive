package ads_mobile_sdk;

import b.c0;
import b.k9;

/* loaded from: classes.dex */
public final class v22 {

    /* renamed from: a, reason: collision with root package name */
    public final int f10555a;

    /* renamed from: b, reason: collision with root package name */
    public final int f10556b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f10557c;

    /* renamed from: d, reason: collision with root package name */
    public final double f10558d;

    public v22(int i5, boolean z11, double d5, int i11) {
        this.f10555a = i5;
        this.f10556b = i11;
        this.f10557c = z11;
        this.f10558d = d5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v22)) {
            return false;
        }
        v22 v22Var = (v22) obj;
        return this.f10555a == v22Var.f10555a && this.f10556b == v22Var.f10556b && this.f10557c == v22Var.f10557c && Double.compare(this.f10558d, v22Var.f10558d) == 0;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iB = k9.b(this.f10556b, Integer.hashCode(this.f10555a) * 31);
        boolean z11 = this.f10557c;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return Double.hashCode(this.f10558d) + ((iB + i5) * 31);
    }

    public final String toString() {
        StringBuilder sbT = c0.t(this.f10555a, "NetworkPingStrategy(maxAttempts=", ", initialBackoffMs=", this.f10556b, ", bufferAfterMaxAttempts=");
        sbT.append(this.f10557c);
        sbT.append(", backoffMultiplier=");
        sbT.append(this.f10558d);
        sbT.append(")");
        return sbT.toString();
    }
}
