package dx;

/* loaded from: classes4.dex */
public final class b implements f {

    /* renamed from: a, reason: collision with root package name */
    public final String f49685a;

    /* renamed from: b, reason: collision with root package name */
    public final String f49686b;

    public b(String str, String str2) {
        c0 c0Var = c0.f49689a;
        this.f49685a = str;
        this.f49686b = str2;
        if (r70.k.U0(str)) {
            throw new IllegalArgumentException("Failed requirement.");
        }
        if (r70.k.U0(str2)) {
            throw new IllegalArgumentException("Failed requirement.");
        }
    }

    @Override // dx.f
    public final String a() {
        return this.f49685a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        if (!this.f49685a.equals(bVar.f49685a) || !this.f49686b.equals(bVar.f49686b)) {
            return false;
        }
        c0 c0Var = c0.f49689a;
        return true;
    }

    public final int hashCode() {
        return Integer.hashCode(0) + ((c0.f49689a.hashCode() + b.c0.e(this.f49685a.hashCode() * 31, 31, this.f49686b)) * 31);
    }

    public final String toString() {
        c0 c0Var = c0.f49689a;
        StringBuilder sbW = b.c0.w("Banner(candidateId=", this.f49685a, ", adUnitId=", this.f49686b, ", size=");
        sbW.append(c0Var);
        sbW.append(", horizontalPaddingDp=0)");
        return sbW.toString();
    }
}
