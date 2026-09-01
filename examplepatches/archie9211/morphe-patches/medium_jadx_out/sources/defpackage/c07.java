package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c07 extends d07 {
    public final String a;
    public final wjd b;

    public c07(String str, wjd wjdVar) {
        this.a = str;
        this.b = wjdVar;
    }

    @Override // defpackage.d07
    public final e07 a() {
        return null;
    }

    @Override // defpackage.d07
    public final wjd b() {
        return this.b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c07)) {
            return false;
        }
        c07 c07Var = (c07) obj;
        return this.a.equals(c07Var.a) && g76.L(this.b, c07Var.b);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        wjd wjdVar = this.b;
        return (iHashCode + (wjdVar != null ? wjdVar.hashCode() : 0)) * 31;
    }

    public final String toString() {
        return ev6.z(new StringBuilder("LinkAnnotation.Url(url="), this.a, ')');
    }
}
