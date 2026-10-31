package t7;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f88763a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f88764b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f88765c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f88766d;

    public e(boolean z11, boolean z12, boolean z13, boolean z14) {
        this.f88763a = z11;
        this.f88764b = z12;
        this.f88765c = z13;
        this.f88766d = z14;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return this.f88763a == eVar.f88763a && this.f88764b == eVar.f88764b && this.f88765c == eVar.f88765c && this.f88766d == eVar.f88766d;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        boolean z11 = this.f88763a;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int i11 = i5 * 31;
        boolean z12 = this.f88764b;
        int i12 = z12;
        if (z12 != 0) {
            i12 = 1;
        }
        int i13 = (i11 + i12) * 31;
        boolean z13 = this.f88765c;
        int i14 = z13;
        if (z13 != 0) {
            i14 = 1;
        }
        int i15 = (i13 + i14) * 31;
        boolean z14 = this.f88766d;
        return i15 + (z14 ? 1 : z14 ? 1 : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("NetworkState(isConnected=");
        sb2.append(this.f88763a);
        sb2.append(", isValidated=");
        sb2.append(this.f88764b);
        sb2.append(", isMetered=");
        sb2.append(this.f88765c);
        sb2.append(", isNotRoaming=");
        return a2.c.p(sb2, this.f88766d, ')');
    }
}
