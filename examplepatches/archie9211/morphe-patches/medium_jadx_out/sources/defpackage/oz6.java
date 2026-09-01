package defpackage;

import android.graphics.Shader;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oz6 extends g3c {
    public final List c;
    public final long d;
    public final long e;

    public oz6(List list, long j, long j2) {
        this.c = list;
        this.d = j;
        this.e = j2;
    }

    @Override // defpackage.g3c
    public final Shader b(long j) {
        long j2 = this.d;
        int i = (int) (j2 >> 32);
        if (Float.intBitsToFloat(i) == Float.POSITIVE_INFINITY) {
            i = (int) (j >> 32);
        }
        float fIntBitsToFloat = Float.intBitsToFloat(i);
        int i2 = (int) (j2 & 4294967295L);
        if (Float.intBitsToFloat(i2) == Float.POSITIVE_INFINITY) {
            i2 = (int) (j & 4294967295L);
        }
        float fIntBitsToFloat2 = Float.intBitsToFloat(i2);
        long j3 = this.e;
        int i3 = (int) (j3 >> 32);
        if (Float.intBitsToFloat(i3) == Float.POSITIVE_INFINITY) {
            i3 = (int) (j >> 32);
        }
        float fIntBitsToFloat3 = Float.intBitsToFloat(i3);
        int i4 = (int) (j3 & 4294967295L);
        if (Float.intBitsToFloat(i4) == Float.POSITIVE_INFINITY) {
            i4 = (int) (j & 4294967295L);
        }
        float fIntBitsToFloat4 = Float.intBitsToFloat(i4);
        return n01.a((((long) Float.floatToRawIntBits(fIntBitsToFloat)) << 32) | (((long) Float.floatToRawIntBits(fIntBitsToFloat2)) & 4294967295L), (((long) Float.floatToRawIntBits(fIntBitsToFloat3)) << 32) | (((long) Float.floatToRawIntBits(fIntBitsToFloat4)) & 4294967295L), this.c, null);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof oz6)) {
            return false;
        }
        oz6 oz6Var = (oz6) obj;
        return this.c.equals(oz6Var.c) && ip8.b(this.d, oz6Var.d) && ip8.b(this.e, oz6Var.e);
    }

    public final int hashCode() {
        return (ev6.n(this.e) + ((ev6.n(this.d) + (this.c.hashCode() * 961)) * 31)) * 31;
    }

    public final String toString() {
        String str;
        long j = this.d;
        String str2 = "";
        if (((((j & 9187343241974906880L) ^ 9187343241974906880L) - 4294967297L) & (-9223372034707292160L)) == 0) {
            str = "start=" + ((Object) ip8.g(j)) + ", ";
        } else {
            str = "";
        }
        long j2 = this.e;
        if (((((j2 & 9187343241974906880L) ^ 9187343241974906880L) - 4294967297L) & (-9223372034707292160L)) == 0) {
            str2 = "end=" + ((Object) ip8.g(j2)) + ", ";
        }
        return "LinearGradient(colors=" + this.c + ", stops=null, " + str + str2 + "tileMode=" + ((Object) "Clamp") + ')';
    }
}
