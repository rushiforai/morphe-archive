package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hq6 implements al7 {
    public final /* synthetic */ int a;
    public final /* synthetic */ int b;
    public final /* synthetic */ Map c;
    public final /* synthetic */ x45 d;
    public final /* synthetic */ iq6 e;
    public final /* synthetic */ nq6 f;
    public final /* synthetic */ x45 g;

    public hq6(int i, int i2, Map map, x45 x45Var, iq6 iq6Var, nq6 nq6Var, x45 x45Var2) {
        this.a = i;
        this.b = i2;
        this.c = map;
        this.d = x45Var;
        this.e = iq6Var;
        this.f = nq6Var;
        this.g = x45Var2;
    }

    @Override // defpackage.al7
    public final int a() {
        return this.b;
    }

    @Override // defpackage.al7
    public final int b() {
        return this.a;
    }

    @Override // defpackage.al7
    public final Map c() {
        return this.c;
    }

    @Override // defpackage.al7
    public final void d() {
        k26 k26Var;
        aq6 aq6Var = this.f.a;
        boolean zW = this.e.W();
        x45 x45Var = this.g;
        if (!zW || (k26Var = ((l26) aq6Var.F.d).X) == null) {
            x45Var.invoke(((l26) aq6Var.F.d).l);
        } else {
            x45Var.invoke(k26Var.l);
        }
    }

    @Override // defpackage.al7
    public final x45 e() {
        return this.d;
    }
}
