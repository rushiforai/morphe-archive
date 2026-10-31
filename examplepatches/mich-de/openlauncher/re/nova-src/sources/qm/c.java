package qm;

import b.c0;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final String f84256a;

    /* renamed from: b, reason: collision with root package name */
    public final long f84257b;

    /* renamed from: c, reason: collision with root package name */
    public final int f84258c;

    public c(String str, long j11, int i5) {
        this.f84256a = str;
        this.f84257b = j11;
        this.f84258c = i5;
    }

    public static b a() {
        b bVar = new b();
        bVar.d(0L);
        return bVar;
    }

    public final int b() {
        return this.f84258c;
    }

    public final String c() {
        return this.f84256a;
    }

    public final long d() {
        return this.f84257b;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        int i5 = cVar.f84258c;
        String str = cVar.f84256a;
        String str2 = this.f84256a;
        if (str2 == null) {
            if (str != null) {
                return false;
            }
        } else if (!str2.equals(str)) {
            return false;
        }
        if (this.f84257b != cVar.f84257b) {
            return false;
        }
        int i11 = this.f84258c;
        return i11 == 0 ? i5 == 0 : c0.b(i11, i5);
    }

    public final int hashCode() {
        String str = this.f84256a;
        int iHashCode = str == null ? 0 : str.hashCode();
        long j11 = this.f84257b;
        int i5 = (((iHashCode ^ 1000003) * 1000003) ^ ((int) ((j11 >>> 32) ^ j11))) * 1000003;
        int i11 = this.f84258c;
        return (i11 != 0 ? c0.F(i11) : 0) ^ i5;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("TokenResult{token=");
        sb2.append(this.f84256a);
        sb2.append(", tokenExpirationTimestamp=");
        sb2.append(this.f84257b);
        sb2.append(", responseCode=");
        int i5 = this.f84258c;
        sb2.append(i5 != 1 ? i5 != 2 ? i5 != 3 ? AbstractJsonLexerKt.NULL : "AUTH_ERROR" : "BAD_CONFIG" : "OK");
        sb2.append("}");
        return sb2.toString();
    }
}
