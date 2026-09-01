package defpackage;

import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kn7 implements v31 {
    public final /* synthetic */ int a;
    public final v31 b;
    public final Object c;

    public kn7(Executor executor, v31 v31Var) {
        this.a = 2;
        this.c = executor;
        this.b = v31Var;
    }

    public kn7 a() {
        v31 v31VarMo127clone = this.b.mo127clone();
        v31VarMo127clone.getClass();
        return new kn7(v31VarMo127clone, (y92) this.c, 0);
    }

    @Override // defpackage.v31
    public final void cancel() {
        int i = this.a;
        v31 v31Var = this.b;
        switch (i) {
            case 0:
                v31Var.cancel();
                break;
            case 1:
                v31Var.cancel();
                break;
            default:
                v31Var.cancel();
                break;
        }
    }

    @Override // defpackage.v31
    /* JADX INFO: renamed from: clone, reason: collision with other method in class */
    public final v31 mo127clone() {
        int i = this.a;
        v31 v31Var = this.b;
        Object obj = this.c;
        switch (i) {
            case 0:
                return a();
            case 1:
                v31 v31VarMo127clone = v31Var.mo127clone();
                v31VarMo127clone.getClass();
                return new kn7(v31VarMo127clone, (y92) obj, 1);
            default:
                return new kn7((Executor) obj, v31Var.mo127clone());
        }
    }

    @Override // defpackage.v31
    public final void f(i41 i41Var) {
        int i = this.a;
        int i2 = 19;
        v31 v31Var = this.b;
        switch (i) {
            case 0:
                v31Var.f(new hx4(i41Var, 18, this));
                break;
            case 1:
                v31Var.f(new hx4(i41Var, i2, this));
                break;
            default:
                v31Var.f(new lig(this, i2, i41Var));
                break;
        }
    }

    @Override // defpackage.v31
    public final boolean m() {
        int i = this.a;
        v31 v31Var = this.b;
        switch (i) {
        }
        return v31Var.m();
    }

    @Override // defpackage.v31
    public final kbb p() {
        int i = this.a;
        v31 v31Var = this.b;
        switch (i) {
            case 0:
                kbb kbbVarP = v31Var.p();
                kbbVarP.getClass();
                return kbbVarP;
            case 1:
                kbb kbbVarP2 = v31Var.p();
                kbbVarP2.getClass();
                return kbbVarP2;
            default:
                return v31Var.p();
        }
    }

    public /* synthetic */ kn7(v31 v31Var, y92 y92Var, int i) {
        this.a = i;
        this.b = v31Var;
        this.c = y92Var;
    }

    public final Object clone() {
        switch (this.a) {
            case 0:
                return a();
            case 1:
                v31 v31VarMo127clone = this.b.mo127clone();
                v31VarMo127clone.getClass();
                return new kn7(v31VarMo127clone, (y92) this.c, 1);
            default:
                return mo127clone();
        }
    }
}
