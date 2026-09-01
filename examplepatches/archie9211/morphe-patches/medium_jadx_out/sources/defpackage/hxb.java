package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hxb {
    public final ai5 a;
    public final long b;
    public final gxb c;
    public final boolean d;

    public hxb(ai5 ai5Var, long j, gxb gxbVar, boolean z) {
        this.a = ai5Var;
        this.b = j;
        this.c = gxbVar;
        this.d = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof hxb)) {
            return false;
        }
        hxb hxbVar = (hxb) obj;
        return this.a == hxbVar.a && ip8.b(this.b, hxbVar.b) && this.c == hxbVar.c && this.d == hxbVar.d;
    }

    public final int hashCode() {
        return ((this.c.hashCode() + ((ev6.n(this.b) + (this.a.hashCode() * 31)) * 31)) * 31) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("SelectionHandleInfo(handle=");
        sb.append(this.a);
        sb.append(", position=");
        sb.append((Object) ip8.g(this.b));
        sb.append(", anchor=");
        sb.append(this.c);
        sb.append(", visible=");
        return ev6.A(sb, this.d, ')');
    }
}
