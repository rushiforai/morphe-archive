package defpackage;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h44 extends jud {
    public volatile jud a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ boolean c;
    public final /* synthetic */ ch5 d;
    public final /* synthetic */ kxd e;
    public final /* synthetic */ i44 f;

    public h44(i44 i44Var, boolean z, boolean z2, ch5 ch5Var, kxd kxdVar) {
        this.f = i44Var;
        this.b = z;
        this.c = z2;
        this.d = ch5Var;
        this.e = kxdVar;
    }

    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        if (this.b) {
            gd6Var.v();
            return null;
        }
        jud judVarF = this.a;
        if (judVarF == null) {
            judVarF = this.d.f(this.f, this.e);
            this.a = judVarF;
        }
        return judVarF.b(gd6Var);
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) {
        if (this.c) {
            yd6Var.Q();
            return;
        }
        jud judVarF = this.a;
        if (judVarF == null) {
            judVarF = this.d.f(this.f, this.e);
            this.a = judVarF;
        }
        judVarF.c(yd6Var, obj);
    }
}
