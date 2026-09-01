package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pjd {
    public final mx a;
    public final mkd b;
    public final List c;
    public final int d;
    public final boolean e;
    public final int f;
    public final m73 g;
    public final ip6 h;
    public final yy4 i;
    public final long j;

    public pjd(mx mxVar, mkd mkdVar, List list, int i, boolean z, int i2, m73 m73Var, ip6 ip6Var, yy4 yy4Var, long j) {
        this.a = mxVar;
        this.b = mkdVar;
        this.c = list;
        this.d = i;
        this.e = z;
        this.f = i2;
        this.g = m73Var;
        this.h = ip6Var;
        this.i = yy4Var;
        this.j = j;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof pjd)) {
            return false;
        }
        pjd pjdVar = (pjd) obj;
        return g76.L(this.a, pjdVar.a) && g76.L(this.b, pjdVar.b) && g76.L(this.c, pjdVar.c) && this.d == pjdVar.d && this.e == pjdVar.e && this.f == pjdVar.f && g76.L(this.g, pjdVar.g) && this.h == pjdVar.h && g76.L(this.i, pjdVar.i) && f72.b(this.j, pjdVar.j);
    }

    public final int hashCode() {
        int iHashCode = (this.i.hashCode() + ((this.h.hashCode() + ((this.g.hashCode() + ((((((wgd.p(b09.o(this.b, this.a.hashCode() * 31, 31), 31, this.c) + this.d) * 31) + (this.e ? 1231 : 1237)) * 31) + this.f) * 31)) * 31)) * 31)) * 31;
        long j = this.j;
        return ((int) ((j >>> 32) ^ j)) + iHashCode;
    }

    public final String toString() {
        return "TextLayoutInput(text=" + ((Object) this.a) + ", style=" + this.b + ", placeholders=" + this.c + ", maxLines=" + this.d + ", softWrap=" + this.e + ", overflow=" + ((Object) hk7.I(this.f)) + ", density=" + this.g + ", layoutDirection=" + this.h + ", fontFamilyResolver=" + this.i + ", constraints=" + ((Object) f72.l(this.j)) + ')';
    }
}
