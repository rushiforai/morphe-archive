package o7;

import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public final class b0 {

    /* renamed from: a, reason: collision with root package name */
    public final long f79620a;

    /* renamed from: b, reason: collision with root package name */
    public final long f79621b;

    public b0(long j11, long j12) {
        this.f79620a = j11;
        this.f79621b = j12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && b0.class.equals(obj.getClass())) {
            b0 b0Var = (b0) obj;
            if (b0Var.f79620a == this.f79620a && b0Var.f79621b == this.f79621b) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Long.hashCode(this.f79621b) + (Long.hashCode(this.f79620a) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("PeriodicityInfo{repeatIntervalMillis=");
        sb2.append(this.f79620a);
        sb2.append(", flexIntervalMillis=");
        return a2.c.n(sb2, this.f79621b, AbstractJsonLexerKt.END_OBJ);
    }
}
