package ud;

import b.c0;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final int f90793a;

    /* renamed from: b, reason: collision with root package name */
    public final long f90794b;

    public b(int i5, long j11) {
        if (i5 == 0) {
            throw new NullPointerException("Null status");
        }
        this.f90793a = i5;
        this.f90794b = j11;
    }

    public static b a() {
        return new b(3, -1L);
    }

    public static b d() {
        return new b(4, -1L);
    }

    public static b e(long j11) {
        return new b(1, j11);
    }

    public static b f() {
        return new b(2, -1L);
    }

    public final long b() {
        return this.f90794b;
    }

    public final int c() {
        return this.f90793a;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return c0.b(this.f90793a, bVar.f90793a) && this.f90794b == bVar.f90794b;
    }

    public final int hashCode() {
        int iF = (c0.F(this.f90793a) ^ 1000003) * 1000003;
        long j11 = this.f90794b;
        return iF ^ ((int) ((j11 >>> 32) ^ j11));
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("BackendResponse{status=");
        int i5 = this.f90793a;
        sb2.append(i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? AbstractJsonLexerKt.NULL : "INVALID_PAYLOAD" : "FATAL_ERROR" : "TRANSIENT_ERROR" : "OK");
        sb2.append(", nextRequestWaitMillis=");
        return a2.c.i(this.f90794b, "}", sb2);
    }
}
