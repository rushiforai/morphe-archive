package ads_mobile_sdk;

/* loaded from: classes2.dex */
public final class e42 {

    /* renamed from: a, reason: collision with root package name */
    public final d42 f2736a;

    /* renamed from: b, reason: collision with root package name */
    public final d42 f2737b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f2738c;

    public e42(d42 d42Var, d42 d42Var2, boolean z11) {
        this.f2736a = d42Var;
        this.f2737b = d42Var2;
        this.f2738c = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e42)) {
            return false;
        }
        e42 e42Var = (e42) obj;
        return this.f2736a == e42Var.f2736a && this.f2737b == e42Var.f2737b && this.f2738c == e42Var.f2738c;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iHashCode = (this.f2737b.hashCode() + (this.f2736a.hashCode() * 31)) * 31;
        boolean z11 = this.f2738c;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return iHashCode + i5;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("OfflineAdConfig(impressionPrerequisite=");
        sb2.append(this.f2736a);
        sb2.append(", clickPrerequisite=");
        sb2.append(this.f2737b);
        sb2.append(", notificationFlowEnabled=");
        return a80.m.k(sb2, this.f2738c, ")");
    }
}
