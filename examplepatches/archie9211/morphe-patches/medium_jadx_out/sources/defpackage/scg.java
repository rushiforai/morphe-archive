package defpackage;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class scg extends ydg {
    public final rcg a;
    public final pcg b;
    public final ocg c;
    public final qcg d;

    public scg(rcg rcgVar, pcg pcgVar, ocg ocgVar, qcg qcgVar) {
        this.a = rcgVar;
        this.b = pcgVar;
        this.c = ocgVar;
        this.d = qcgVar;
    }

    public static o2b b() {
        o2b o2bVar = new o2b(29, false);
        o2bVar.b = null;
        o2bVar.c = null;
        o2bVar.d = null;
        o2bVar.e = qcg.d;
        return o2bVar;
    }

    @Override // defpackage.bzf
    public final boolean a() {
        return this.d != qcg.d;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof scg)) {
            return false;
        }
        scg scgVar = (scg) obj;
        return this.a == scgVar.a && this.b == scgVar.b && this.c == scgVar.c && this.d == scgVar.d;
    }

    public final int hashCode() {
        return Objects.hash(scg.class, this.a, this.b, this.c, this.d);
    }

    public final String toString() {
        String strValueOf = String.valueOf(this.d);
        String strValueOf2 = String.valueOf(this.a);
        return km4.C(y30.u("HPKE Parameters (Variant: ", strValueOf, ", KemId: ", strValueOf2, ", KdfId: "), String.valueOf(this.b), ", AeadId: ", String.valueOf(this.c), ")");
    }
}
