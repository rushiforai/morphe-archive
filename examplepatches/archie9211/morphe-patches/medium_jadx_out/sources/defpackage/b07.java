package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b07 extends d07 {
    public final String a;
    public final wjd b;
    public final e07 c;

    public b07(String str, wjd wjdVar, e07 e07Var) {
        this.a = str;
        this.b = wjdVar;
        this.c = e07Var;
    }

    @Override // defpackage.d07
    public final e07 a() {
        return this.c;
    }

    @Override // defpackage.d07
    public final wjd b() {
        return this.b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b07)) {
            return false;
        }
        b07 b07Var = (b07) obj;
        return g76.L(this.a, b07Var.a) && g76.L(this.b, b07Var.b) && g76.L(this.c, b07Var.c);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        wjd wjdVar = this.b;
        int iHashCode2 = (iHashCode + (wjdVar != null ? wjdVar.hashCode() : 0)) * 31;
        e07 e07Var = this.c;
        return iHashCode2 + (e07Var != null ? e07Var.hashCode() : 0);
    }

    public final String toString() {
        return ev6.z(new StringBuilder("LinkAnnotation.Clickable(tag="), this.a, ')');
    }
}
