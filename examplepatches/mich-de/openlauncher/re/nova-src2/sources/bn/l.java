package bn;

/* loaded from: classes.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final k f18239a;

    /* renamed from: b, reason: collision with root package name */
    public final k f18240b;

    /* renamed from: c, reason: collision with root package name */
    public final double f18241c;

    public l(k kVar, k kVar2, double d5) {
        this.f18239a = kVar;
        this.f18240b = kVar2;
        this.f18241c = d5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l)) {
            return false;
        }
        l lVar = (l) obj;
        return this.f18239a == lVar.f18239a && this.f18240b == lVar.f18240b && Double.compare(this.f18241c, lVar.f18241c) == 0;
    }

    public final int hashCode() {
        return Double.hashCode(this.f18241c) + ((this.f18240b.hashCode() + (this.f18239a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        return "DataCollectionStatus(performance=" + this.f18239a + ", crashlytics=" + this.f18240b + ", sessionSamplingRate=" + this.f18241c + ')';
    }
}
