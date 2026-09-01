package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tkb implements w06 {
    public final boolean a;
    public final float b;
    public final long c;

    public tkb(float f, long j, boolean z) {
        this.a = z;
        this.b = f;
        this.c = j;
    }

    @Override // defpackage.w06
    public final a43 a(d56 d56Var) {
        q43 q43Var = new q43(3, this);
        return new r43(d56Var, this.a, this.b, q43Var, 1);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof tkb)) {
            return false;
        }
        tkb tkbVar = (tkb) obj;
        if (this.a != tkbVar.a || !vj3.b(this.b, tkbVar.b)) {
            return false;
        }
        long j = tkbVar.c;
        int i = uu1.i;
        return ezd.a(this.c, j);
    }

    @Override // defpackage.w06
    public final int hashCode() {
        int iP = km4.p(this.b, (this.a ? 1231 : 1237) * 31, 961);
        int i = uu1.i;
        return ev6.n(this.c) + iP;
    }
}
