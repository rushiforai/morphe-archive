package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tj0 extends t77 {
    public final long a;
    public final Integer b;
    public final ey1 c;
    public final long d;
    public final byte[] e;
    public final String f;
    public final long g;
    public final td8 h;
    public final s54 i;

    public tj0(long j, Integer num, ey1 ey1Var, long j2, byte[] bArr, String str, long j3, td8 td8Var, s54 s54Var) {
        this.a = j;
        this.b = num;
        this.c = ey1Var;
        this.d = j2;
        this.e = bArr;
        this.f = str;
        this.g = j3;
        this.h = td8Var;
        this.i = s54Var;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof t77) {
            t77 t77Var = (t77) obj;
            tj0 tj0Var = (tj0) t77Var;
            if (this.a == tj0Var.a) {
                Integer num = tj0Var.b;
                Integer num2 = this.b;
                if (num2 != null ? num2.equals(num) : num == null) {
                    ey1 ey1Var = tj0Var.c;
                    ey1 ey1Var2 = this.c;
                    if (ey1Var2 != null ? ey1Var2.equals(ey1Var) : ey1Var == null) {
                        if (this.d == tj0Var.d) {
                            if (Arrays.equals(this.e, t77Var instanceof tj0 ? ((tj0) t77Var).e : tj0Var.e)) {
                                String str = tj0Var.f;
                                String str2 = this.f;
                                if (str2 != null ? str2.equals(str) : str == null) {
                                    if (this.g == tj0Var.g) {
                                        td8 td8Var = tj0Var.h;
                                        td8 td8Var2 = this.h;
                                        if (td8Var2 != null ? td8Var2.equals(td8Var) : td8Var == null) {
                                            s54 s54Var = tj0Var.i;
                                            s54 s54Var2 = this.i;
                                            if (s54Var2 != null ? s54Var2.equals(s54Var) : s54Var == null) {
                                                return true;
                                            }
                                        }
                                    }
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
        long j = this.a;
        int i = (((int) (j ^ (j >>> 32))) ^ 1000003) * 1000003;
        Integer num = this.b;
        int iHashCode = (i ^ (num == null ? 0 : num.hashCode())) * 1000003;
        ey1 ey1Var = this.c;
        int iHashCode2 = (iHashCode ^ (ey1Var == null ? 0 : ey1Var.hashCode())) * 1000003;
        long j2 = this.d;
        int iHashCode3 = (((iHashCode2 ^ ((int) (j2 ^ (j2 >>> 32)))) * 1000003) ^ Arrays.hashCode(this.e)) * 1000003;
        String str = this.f;
        int iHashCode4 = (iHashCode3 ^ (str == null ? 0 : str.hashCode())) * 1000003;
        long j3 = this.g;
        int i2 = (iHashCode4 ^ ((int) (j3 ^ (j3 >>> 32)))) * 1000003;
        td8 td8Var = this.h;
        int iHashCode5 = (i2 ^ (td8Var == null ? 0 : td8Var.hashCode())) * 1000003;
        s54 s54Var = this.i;
        return iHashCode5 ^ (s54Var != null ? s54Var.hashCode() : 0);
    }

    public final String toString() {
        return "LogEvent{eventTimeMs=" + this.a + ", eventCode=" + this.b + ", complianceData=" + this.c + ", eventUptimeMs=" + this.d + ", sourceExtension=" + Arrays.toString(this.e) + ", sourceExtensionJsonProto3=" + this.f + ", timezoneOffsetSeconds=" + this.g + ", networkConnectionInfo=" + this.h + ", experimentIds=" + this.i + "}";
    }
}
