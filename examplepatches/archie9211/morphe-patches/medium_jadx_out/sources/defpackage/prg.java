package defpackage;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class prg extends dlg {
    public final d2g a;
    public final grg b;
    public final d1g c;
    public final d1g d;

    public prg(d2g d2gVar, grg grgVar, d1g d1gVar, d1g d1gVar2) {
        this.a = d2gVar;
        this.b = grgVar;
        this.c = d1gVar;
        this.d = d1gVar2;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof prg)) {
            return false;
        }
        prg prgVar = (prg) obj;
        return prgVar.a == this.a && prgVar.b == this.b && prgVar.c == this.c && prgVar.d == this.d;
    }

    public final int hashCode() {
        return Objects.hash(prg.class, this.a, this.b, this.c, this.d);
    }

    public final String toString() {
        String str = this.d.b;
        int length = str.length();
        String str2 = this.c.b;
        int length2 = str2.length();
        String str3 = this.a.b;
        int length3 = str3.length();
        String str4 = this.b.a;
        StringBuilder sb = new StringBuilder(length + 39 + length2 + 12 + length3 + 9 + str4.length() + 1);
        ka1.C(sb, "ECDSA Parameters (variant: ", str, ", hashType: ", str2);
        ka1.C(sb, ", encoding: ", str3, ", curve: ", str4);
        sb.append(")");
        return sb.toString();
    }
}
