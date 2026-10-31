package hv;

/* loaded from: classes4.dex */
public final class o2 extends r2 {

    /* renamed from: a, reason: collision with root package name */
    public final n0.w f60460a;

    public o2(n0.w wVar) {
        this.f60460a = wVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof o2) && this.f60460a.equals(((o2) obj).f60460a);
    }

    public final int hashCode() {
        return this.f60460a.hashCode();
    }

    public final String toString() {
        return "FinishProcessing(onComplete=" + this.f60460a + ")";
    }
}
