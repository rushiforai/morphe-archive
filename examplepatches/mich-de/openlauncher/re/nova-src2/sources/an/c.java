package an;

/* loaded from: classes3.dex */
public final class c extends e {

    /* renamed from: a, reason: collision with root package name */
    public final String f13549a;

    /* renamed from: b, reason: collision with root package name */
    public final String f13550b;

    /* renamed from: c, reason: collision with root package name */
    public final String f13551c;

    /* renamed from: d, reason: collision with root package name */
    public final String f13552d;

    /* renamed from: e, reason: collision with root package name */
    public final long f13553e;

    public c(String str, String str2, String str3, String str4, long j11) {
        this.f13549a = str;
        this.f13550b = str2;
        this.f13551c = str3;
        this.f13552d = str4;
        this.f13553e = j11;
    }

    @Override // an.e
    public final String b() {
        return this.f13551c;
    }

    @Override // an.e
    public final String c() {
        return this.f13552d;
    }

    @Override // an.e
    public final String d() {
        return this.f13549a;
    }

    @Override // an.e
    public final long e() {
        return this.f13553e;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof e) {
            c cVar = (c) ((e) obj);
            if (this.f13549a.equals(cVar.f13549a) && this.f13550b.equals(cVar.f13550b) && this.f13551c.equals(cVar.f13551c) && this.f13552d.equals(cVar.f13552d) && this.f13553e == cVar.f13553e) {
                return true;
            }
        }
        return false;
    }

    @Override // an.e
    public final String f() {
        return this.f13550b;
    }

    public final int hashCode() {
        int iHashCode = (((((((this.f13549a.hashCode() ^ 1000003) * 1000003) ^ this.f13550b.hashCode()) * 1000003) ^ this.f13551c.hashCode()) * 1000003) ^ this.f13552d.hashCode()) * 1000003;
        long j11 = this.f13553e;
        return iHashCode ^ ((int) ((j11 >>> 32) ^ j11));
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("RolloutAssignment{rolloutId=");
        sb2.append(this.f13549a);
        sb2.append(", variantId=");
        sb2.append(this.f13550b);
        sb2.append(", parameterKey=");
        sb2.append(this.f13551c);
        sb2.append(", parameterValue=");
        sb2.append(this.f13552d);
        sb2.append(", templateVersion=");
        return a2.c.i(this.f13553e, "}", sb2);
    }
}
