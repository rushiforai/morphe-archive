package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class bh5 extends c0c {
    public jud a = null;

    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) {
        jud judVar = this.a;
        if (judVar != null) {
            return judVar.b(gd6Var);
        }
        ygf.f("Adapter for type with cyclic dependency has been used before dependency has been resolved");
        return null;
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) {
        jud judVar = this.a;
        if (judVar != null) {
            judVar.c(yd6Var, obj);
        } else {
            ygf.f("Adapter for type with cyclic dependency has been used before dependency has been resolved");
        }
    }

    @Override // defpackage.c0c
    public final jud d() {
        jud judVar = this.a;
        if (judVar != null) {
            return judVar;
        }
        ygf.f("Adapter for type with cyclic dependency has been used before dependency has been resolved");
        return null;
    }
}
