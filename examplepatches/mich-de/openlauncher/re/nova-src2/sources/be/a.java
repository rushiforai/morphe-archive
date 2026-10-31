package be;

import b.c0;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: f, reason: collision with root package name */
    public static final a f17825f = new a(10485760, 200, 10000, 604800000, 81920);

    /* renamed from: a, reason: collision with root package name */
    public final long f17826a;

    /* renamed from: b, reason: collision with root package name */
    public final int f17827b;

    /* renamed from: c, reason: collision with root package name */
    public final int f17828c;

    /* renamed from: d, reason: collision with root package name */
    public final long f17829d;

    /* renamed from: e, reason: collision with root package name */
    public final int f17830e;

    public a(long j11, int i5, int i11, long j12, int i12) {
        this.f17826a = j11;
        this.f17827b = i5;
        this.f17828c = i11;
        this.f17829d = j12;
        this.f17830e = i12;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof a) {
            a aVar = (a) obj;
            if (this.f17826a == aVar.f17826a && this.f17827b == aVar.f17827b && this.f17828c == aVar.f17828c && this.f17829d == aVar.f17829d && this.f17830e == aVar.f17830e) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        long j11 = this.f17826a;
        int i5 = (((((((int) (j11 ^ (j11 >>> 32))) ^ 1000003) * 1000003) ^ this.f17827b) * 1000003) ^ this.f17828c) * 1000003;
        long j12 = this.f17829d;
        return ((i5 ^ ((int) ((j12 >>> 32) ^ j12))) * 1000003) ^ this.f17830e;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("EventStoreConfig{maxStorageSizeInBytes=");
        sb2.append(this.f17826a);
        sb2.append(", loadBatchSize=");
        sb2.append(this.f17827b);
        sb2.append(", criticalSectionEnterTimeoutMs=");
        sb2.append(this.f17828c);
        sb2.append(", eventCleanUpAge=");
        sb2.append(this.f17829d);
        sb2.append(", maxBlobByteSizePerRow=");
        return c0.o(sb2, this.f17830e, "}");
    }
}
