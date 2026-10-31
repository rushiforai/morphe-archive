package e00;

/* loaded from: classes4.dex */
public final class h4 extends o4 {

    /* renamed from: a, reason: collision with root package name */
    public final i4 f50474a;

    public h4(i4 i4Var) {
        this.f50474a = i4Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof h4) && this.f50474a == ((h4) obj).f50474a;
    }

    public final int hashCode() {
        return this.f50474a.hashCode();
    }

    public final String toString() {
        return "LegacyPrime(source=" + this.f50474a + ")";
    }
}
