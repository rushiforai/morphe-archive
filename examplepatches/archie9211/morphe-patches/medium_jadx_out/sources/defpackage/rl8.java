package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class rl8 extends jb6 {
    public final jb6 a;

    public rl8(jb6 jb6Var) {
        this.a = jb6Var;
    }

    @Override // defpackage.jb6
    public final Object a(hd6 hd6Var) {
        if (hd6Var.I() != dd6.NULL) {
            return this.a.a(hd6Var);
        }
        hd6Var.a0();
        return null;
    }

    @Override // defpackage.jb6
    public final void e(zd6 zd6Var, Object obj) {
        if (obj == null) {
            zd6Var.I();
        } else {
            this.a.e(zd6Var, obj);
        }
    }

    public final String toString() {
        return this.a + ".nullSafe()";
    }
}
