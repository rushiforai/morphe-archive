package defpackage;

import gen.model.SourceParameter;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ie3 implements me3 {
    public final String a;
    public final long b;
    public final List c;
    public final String d;
    public final SourceParameter e;
    public final String f;

    public ie3(String str, long j, List list, String str2, SourceParameter sourceParameter, String str3) {
        str.getClass();
        str2.getClass();
        sourceParameter.getClass();
        str3.getClass();
        this.a = str;
        this.b = j;
        this.c = list;
        this.d = str2;
        this.e = sourceParameter;
        this.f = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ie3)) {
            return false;
        }
        ie3 ie3Var = (ie3) obj;
        return g76.L(this.a, ie3Var.a) && this.b == ie3Var.b && this.c.equals(ie3Var.c) && g76.L(this.d, ie3Var.d) && g76.L(this.e, ie3Var.e) && g76.L(this.f, ie3Var.f);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        long j = this.b;
        return this.f.hashCode() + ev6.o(this.e, wgd.o(wgd.p((iHashCode + ((int) (j ^ (j >>> 32)))) * 31, 31, this.c), 31, this.d), 31);
    }

    public final String toString() {
        StringBuilder sbI = ho2.I(this.b, "Digest(selectedDigestId=", this.a, ", digestDate=");
        sbI.append(", sections=");
        sbI.append(this.c);
        sbI.append(", referrerSource=");
        sbI.append(this.d);
        sbI.append(", sourceParameter=");
        sbI.append(this.e);
        sbI.append(", location=");
        sbI.append(this.f);
        sbI.append(")");
        return sbI.toString();
    }
}
