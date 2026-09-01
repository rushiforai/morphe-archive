package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lo extends co6 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lo(bc7 bc7Var, r28 r28Var, n4b n4bVar, t90 t90Var, int i) {
        super(2);
        this.a = 3;
        this.b = bc7Var;
        this.c = r28Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.c;
        Object obj4 = this.b;
        switch (i) {
            case 0:
                int iIntValue = ((Number) obj).intValue();
                zxb zxbVar = (zxb) obj2;
                mo moVar = (mo) obj3;
                if (!((ayb) obj4).b.c(zxbVar.f)) {
                    moVar.j(iIntValue, zxbVar);
                    moVar.g.e(c1eVar);
                }
                break;
            case 1:
                ((Number) obj2).intValue();
                m40.i((r28) obj4, (b55) obj3, (x12) obj, tr7.y(1));
                break;
            case 2:
                x12 x12Var = (x12) obj;
                int iIntValue2 = ((Number) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var.S();
                } else {
                    Boolean bool = (Boolean) ((gq6) obj4).g.getValue();
                    boolean zBooleanValue = bool.booleanValue();
                    b55 b55Var = (b55) obj3;
                    p65Var.b0(bool);
                    boolean zG = p65Var.g(zBooleanValue);
                    if (zBooleanValue) {
                        b55Var.invoke(p65Var, 0);
                    } else {
                        if (p65Var.l != 0) {
                            b22.a("No nodes can be emitted before calling deactivateToEndGroup");
                        }
                        if (!p65Var.S) {
                            if (zG) {
                                egc egcVar = p65Var.G;
                                int i2 = egcVar.g;
                                int i3 = egcVar.h;
                                y12 y12Var = p65Var.M;
                                y12Var.getClass();
                                y12Var.d(false);
                                y12Var.b.s.I(eu8.d);
                                ht2.B0(i2, i3, p65Var.s);
                                p65Var.G.t();
                            } else {
                                p65Var.R();
                            }
                        }
                    }
                    if (p65Var.y && p65Var.G.i == p65Var.z) {
                        p65Var.z = -1;
                        p65Var.y = false;
                    }
                    p65Var.p(false);
                }
                break;
            case 3:
                ((Number) obj2).intValue();
                nk7.A((bc7) obj4, (r28) obj3, (x12) obj, tr7.y(1572913));
                break;
            default:
                e61 e61Var = (e61) obj;
                of5 of5Var = (of5) obj2;
                eh8 eh8Var = (eh8) obj4;
                aq6 aq6Var = eh8Var.o;
                if (!aq6Var.I()) {
                    eh8Var.K = true;
                } else {
                    eh8Var.H = e61Var;
                    eh8Var.G = of5Var;
                    px8 snapshotObserver = ((mn) dq6.a(aq6Var)).getSnapshotObserver();
                    tjb tjbVar = eh8.N;
                    snapshotObserver.a.d(eh8Var, zu2.x, (bh8) obj3);
                    eh8Var.K = false;
                }
                break;
        }
        return c1eVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lo(r28 r28Var, b55 b55Var, int i) {
        super(2);
        this.a = 1;
        this.b = r28Var;
        this.c = b55Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ lo(Object obj, int i, Object obj2) {
        super(2);
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }
}
