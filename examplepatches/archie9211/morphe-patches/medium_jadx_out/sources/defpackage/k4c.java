package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k4c implements r82 {
    public final String a;
    public final int b;
    public final pu c;
    public final boolean d;

    public k4c(String str, int i, pu puVar, boolean z) {
        this.a = str;
        this.b = i;
        this.c = puVar;
        this.d = z;
    }

    @Override // defpackage.r82
    public final v72 a(rc7 rc7Var, bc7 bc7Var, tn0 tn0Var) {
        return new r3c(rc7Var, tn0Var, this);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ShapePath{name=");
        sb.append(this.a);
        sb.append(", index=");
        return km4.A(sb, this.b, '}');
    }
}
