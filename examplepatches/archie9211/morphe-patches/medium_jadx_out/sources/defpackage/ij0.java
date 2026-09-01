package defpackage;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ij0 {
    public final String a;
    public final Integer b;
    public final qy3 c;
    public final long d;
    public final long e;
    public final Map f;
    public final Integer g;
    public final String h;
    public final byte[] i;
    public final byte[] j;

    public ij0(String str, Integer num, qy3 qy3Var, long j, long j2, HashMap map, Integer num2, String str2, byte[] bArr, byte[] bArr2) {
        this.a = str;
        this.b = num;
        this.c = qy3Var;
        this.d = j;
        this.e = j2;
        this.f = map;
        this.g = num2;
        this.h = str2;
        this.i = bArr;
        this.j = bArr2;
    }

    public final String a(String str) {
        String str2 = (String) this.f.get(str);
        return str2 == null ? "" : str2;
    }

    public final int b(String str) {
        String str2 = (String) this.f.get(str);
        if (str2 == null) {
            return 0;
        }
        return Integer.valueOf(str2).intValue();
    }

    public final hj0 c() {
        hj0 hj0Var = new hj0();
        String str = this.a;
        if (str == null) {
            z72.c("Null transportName");
            return null;
        }
        hj0Var.b = str;
        hj0Var.d = this.b;
        hj0Var.e = this.g;
        hj0Var.c = this.h;
        hj0Var.j = this.i;
        hj0Var.k = this.j;
        qy3 qy3Var = this.c;
        if (qy3Var == null) {
            z72.c("Null encodedPayload");
            return null;
        }
        hj0Var.f = qy3Var;
        hj0Var.g = Long.valueOf(this.d);
        hj0Var.h = Long.valueOf(this.e);
        hj0Var.i = new HashMap(this.f);
        return hj0Var;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof ij0) {
            ij0 ij0Var = (ij0) obj;
            if (this.a.equals(ij0Var.a)) {
                Integer num = ij0Var.b;
                Integer num2 = this.b;
                if (num2 != null ? num2.equals(num) : num == null) {
                    if (this.c.equals(ij0Var.c) && this.d == ij0Var.d && this.e == ij0Var.e && this.f.equals(ij0Var.f)) {
                        Integer num3 = ij0Var.g;
                        Integer num4 = this.g;
                        if (num4 != null ? num4.equals(num3) : num3 == null) {
                            String str = ij0Var.h;
                            String str2 = this.h;
                            if (str2 != null ? str2.equals(str) : str == null) {
                                if (Arrays.equals(this.i, ij0Var.i) && Arrays.equals(this.j, ij0Var.j)) {
                                    return true;
                                }
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = (this.a.hashCode() ^ 1000003) * 1000003;
        Integer num = this.b;
        int iHashCode2 = (((iHashCode ^ (num == null ? 0 : num.hashCode())) * 1000003) ^ this.c.hashCode()) * 1000003;
        long j = this.d;
        int i = (iHashCode2 ^ ((int) (j ^ (j >>> 32)))) * 1000003;
        long j2 = this.e;
        int iHashCode3 = (((i ^ ((int) (j2 ^ (j2 >>> 32)))) * 1000003) ^ this.f.hashCode()) * 1000003;
        Integer num2 = this.g;
        int iHashCode4 = (iHashCode3 ^ (num2 == null ? 0 : num2.hashCode())) * 1000003;
        String str = this.h;
        return Arrays.hashCode(this.j) ^ ((((iHashCode4 ^ (str != null ? str.hashCode() : 0)) * 1000003) ^ Arrays.hashCode(this.i)) * 1000003);
    }

    public final String toString() {
        return "EventInternal{transportName=" + this.a + ", code=" + this.b + ", encodedPayload=" + this.c + ", eventMillis=" + this.d + ", uptimeMillis=" + this.e + ", autoMetadata=" + this.f + ", productId=" + this.g + ", pseudonymousId=" + this.h + ", experimentIdsClear=" + Arrays.toString(this.i) + ", experimentIdsEncrypted=" + Arrays.toString(this.j) + "}";
    }
}
