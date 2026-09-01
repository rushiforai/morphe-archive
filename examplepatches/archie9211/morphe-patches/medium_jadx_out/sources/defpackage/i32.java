package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i32 implements q44 {
    public static final rz5 c = new rz5(14);
    public final kb2 a;
    public final k92 b;

    public i32(kb2 kb2Var, k92 k92Var) {
        kb2Var.getClass();
        this.a = kb2Var;
        this.b = k92Var;
    }

    @Override // defpackage.s44
    public final /* synthetic */ s44 a(r44 r44Var) {
        return ho2.b(this, r44Var);
    }

    @Override // defpackage.s44
    public final Object b(Object obj, p44 p44Var) {
        return p44Var.invoke(obj, this);
    }

    @Override // defpackage.s44
    public final /* synthetic */ s44 c(s44 s44Var) {
        return ho2.c(this, s44Var);
    }

    @Override // defpackage.s44
    public final /* synthetic */ q44 d(r44 r44Var) {
        return ho2.a(this, r44Var);
    }

    @Override // defpackage.q44
    public final r44 getKey() {
        return c;
    }
}
