package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dpc {
    public final String a;
    public final String b;
    public final nr8 c;
    public final az5 d;
    public final int e;
    public final int f;
    public final int g;

    public dpc(String str, String str2, nr8 nr8Var, az5 az5Var, int i, int i2, int i3) {
        str.getClass();
        str2.getClass();
        nr8Var.getClass();
        az5Var.getClass();
        this.a = str;
        this.b = str2;
        this.c = nr8Var;
        this.d = az5Var;
        this.e = i;
        this.f = i2;
        this.g = i3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof dpc)) {
            return false;
        }
        dpc dpcVar = (dpc) obj;
        return g76.L(this.a, dpcVar.a) && g76.L(this.b, dpcVar.b) && g76.L(this.c, dpcVar.c) && g76.L(this.d, dpcVar.d) && this.e == dpcVar.e && this.f == dpcVar.f && this.g == dpcVar.g;
    }

    public final int hashCode() {
        return ((((ka1.b(this.d, (this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b)) * 31, 31) + this.e) * 31) + this.f) * 31) + this.g;
    }

    public final String toString() {
        StringBuilder sbU = y30.u("StarterPackUiModel(id=", this.a, ", categoryName=", this.b, ", colors=");
        sbU.append(this.c);
        sbU.append(", writerAvatarImageIds=");
        sbU.append(this.d);
        sbU.append(", writerCount=");
        sbU.append(this.e);
        sbU.append(", publicationCount=");
        sbU.append(this.f);
        sbU.append(", followCount=");
        return ho2.H(sbU, this.g, ")");
    }
}
