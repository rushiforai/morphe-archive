package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yg7 implements az7 {
    public az7[] a;

    @Override // defpackage.az7
    public final tsa a(Class cls) {
        for (az7 az7Var : this.a) {
            if (az7Var.b(cls)) {
                return az7Var.a(cls);
            }
        }
        ik4.k("No factory is available for message type: ".concat(cls.getName()));
        return null;
    }

    @Override // defpackage.az7
    public final boolean b(Class cls) {
        for (az7 az7Var : this.a) {
            if (az7Var.b(cls)) {
                return true;
            }
        }
        return false;
    }
}
