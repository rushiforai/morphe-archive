package td;

import java.util.Arrays;

/* loaded from: classes.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final qd.c f88994a;

    /* renamed from: b, reason: collision with root package name */
    public final byte[] f88995b;

    public l(qd.c cVar, byte[] bArr) {
        if (cVar == null) {
            throw new NullPointerException("encoding is null");
        }
        if (bArr == null) {
            throw new NullPointerException("bytes is null");
        }
        this.f88994a = cVar;
        this.f88995b = bArr;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l)) {
            return false;
        }
        l lVar = (l) obj;
        if (this.f88994a.equals(lVar.f88994a)) {
            return Arrays.equals(this.f88995b, lVar.f88995b);
        }
        return false;
    }

    public final int hashCode() {
        return ((this.f88994a.hashCode() ^ 1000003) * 1000003) ^ Arrays.hashCode(this.f88995b);
    }

    public final String toString() {
        return "EncodedPayload{encoding=" + this.f88994a + ", bytes=[...]}";
    }
}
