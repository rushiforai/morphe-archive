package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bs4 extends b43 implements ln8, u22 {
    public final es4 q;
    public cu6 r;

    public bs4() {
        es4 es4Var = new es4(0, new xi1(2, this, bs4.class, "onFocusStateChange", "onFocusStateChange(Landroidx/compose/ui/focus/FocusState;Landroidx/compose/ui/focus/FocusState;)V", 0, 6), 9);
        I0(es4Var);
        this.q = es4Var;
    }

    @Override // defpackage.ln8
    public final void d0() {
        rya ryaVar = new rya();
        mo7.T(this, new cn(ryaVar, 12, this));
        cu6 cu6Var = (cu6) ryaVar.a;
        if (this.q.N0().isFocused()) {
            cu6 cu6Var2 = this.r;
            if (cu6Var2 != null) {
                cu6Var2.b();
            }
            if (cu6Var != null) {
                cu6Var.a();
            } else {
                cu6Var = null;
            }
            this.r = cu6Var;
        }
    }
}
