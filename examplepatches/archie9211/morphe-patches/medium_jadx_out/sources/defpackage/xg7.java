package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xg7 implements zy7 {
    public zy7[] a;

    @Override // defpackage.zy7
    public final ssa a(Class cls) {
        for (zy7 zy7Var : this.a) {
            if (zy7Var.b(cls)) {
                return zy7Var.a(cls);
            }
        }
        ik4.k("No factory is available for message type: ".concat(cls.getName()));
        return null;
    }

    @Override // defpackage.zy7
    public final boolean b(Class cls) {
        for (zy7 zy7Var : this.a) {
            if (zy7Var.b(cls)) {
                return true;
            }
        }
        return false;
    }
}
