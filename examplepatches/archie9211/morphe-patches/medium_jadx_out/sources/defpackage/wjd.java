package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wjd {
    public final skc a;
    public final skc b;
    public final skc c;
    public final skc d;

    public /* synthetic */ wjd(skc skcVar, skc skcVar2, int i) {
        this((i & 1) != 0 ? null : skcVar, null, null, (i & 8) != 0 ? null : skcVar2);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof wjd)) {
            return false;
        }
        wjd wjdVar = (wjd) obj;
        return g76.L(this.a, wjdVar.a) && g76.L(this.b, wjdVar.b) && g76.L(this.c, wjdVar.c) && g76.L(this.d, wjdVar.d);
    }

    public final int hashCode() {
        skc skcVar = this.a;
        int iHashCode = (skcVar != null ? skcVar.hashCode() : 0) * 31;
        skc skcVar2 = this.b;
        int iHashCode2 = (iHashCode + (skcVar2 != null ? skcVar2.hashCode() : 0)) * 31;
        skc skcVar3 = this.c;
        int iHashCode3 = (iHashCode2 + (skcVar3 != null ? skcVar3.hashCode() : 0)) * 31;
        skc skcVar4 = this.d;
        return iHashCode3 + (skcVar4 != null ? skcVar4.hashCode() : 0);
    }

    public wjd(skc skcVar, skc skcVar2, skc skcVar3, skc skcVar4) {
        this.a = skcVar;
        this.b = skcVar2;
        this.c = skcVar3;
        this.d = skcVar4;
    }
}
