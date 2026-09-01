package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class qr1 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ cs1 b;
    public final /* synthetic */ lt1 c;

    public /* synthetic */ qr1(cs1 cs1Var, lt1 lt1Var, int i) {
        this.a = i;
        this.b = cs1Var;
        this.c = lt1Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        lt1 lt1Var = this.c;
        cs1 cs1Var = this.b;
        switch (i) {
            case 0:
                cs1Var.A(lt1Var.i, lt1Var.a, false);
                break;
            case 1:
                cs1Var.p(lt1Var.a, lt1Var.i);
                break;
            case 2:
                cs1Var.B(lt1Var.i, lt1Var.a, true);
                break;
            case 3:
                cs1Var.B(lt1Var.i, lt1Var.a, false);
                break;
            case 4:
                cs1Var.A(lt1Var.i, lt1Var.a, true);
                break;
            case 5:
                cs1Var.p(lt1Var.a, lt1Var.i);
                break;
            case 6:
                cs1Var.B(lt1Var.i, lt1Var.a, true);
                break;
            case 7:
                cs1Var.B(lt1Var.i, lt1Var.a, false);
                break;
            case 8:
                cs1Var.A(lt1Var.i, lt1Var.a, true);
                break;
            default:
                cs1Var.A(lt1Var.i, lt1Var.a, false);
                break;
        }
        return c1eVar;
    }
}
