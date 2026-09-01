package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class dq7 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ l78 b;

    public /* synthetic */ dq7(l78 l78Var, int i) {
        this.a = i;
        this.b = l78Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        l78 l78Var = this.b;
        switch (i) {
            case 0:
                l78Var.setValue(Boolean.TRUE);
                break;
            case 1:
                l78Var.setValue(Boolean.FALSE);
                break;
            case 2:
                l78Var.setValue(Boolean.FALSE);
                break;
            case 3:
                l78Var.setValue(Boolean.FALSE);
                break;
            case 4:
                l78Var.setValue(Boolean.TRUE);
                break;
            case 5:
                l78Var.setValue(Boolean.FALSE);
                break;
            case 6:
                l78Var.setValue(Boolean.TRUE);
                break;
            case 7:
                l78Var.setValue(Boolean.FALSE);
                break;
            case 8:
                l78Var.setValue(Boolean.valueOf(!((Boolean) l78Var.getValue()).booleanValue()));
                break;
            case 9:
                l78Var.setValue(Boolean.FALSE);
                break;
            case 10:
                hp6 hp6Var = (hp6) l78Var.getValue();
                if (hp6Var == null) {
                    e26.d("Required value was null.");
                    z72.b();
                }
                break;
            case 11:
                l78Var.setValue(Boolean.FALSE);
                break;
            case 12:
                break;
            case 13:
                l78Var.setValue(Boolean.TRUE);
                break;
            case 14:
                l78Var.setValue(null);
                break;
            case 15:
                l78Var.setValue(null);
                break;
            case 16:
                l78Var.setValue(Boolean.valueOf(!((Boolean) l78Var.getValue()).booleanValue()));
                break;
            case 17:
                l78Var.setValue(Boolean.FALSE);
                break;
            case 18:
                l78Var.setValue(true);
                break;
            case 19:
                l78Var.setValue(Boolean.FALSE);
                break;
            case 20:
                l78Var.setValue(Boolean.valueOf(!((Boolean) l78Var.getValue()).booleanValue()));
                break;
            case 21:
                l78Var.setValue(Boolean.FALSE);
                break;
            case 22:
                l78Var.setValue(Boolean.valueOf(!((Boolean) l78Var.getValue()).booleanValue()));
                break;
            case 23:
                l78Var.setValue(Boolean.FALSE);
                break;
            case 24:
                l78Var.setValue(Boolean.valueOf(!((Boolean) l78Var.getValue()).booleanValue()));
                break;
            case 25:
                l78Var.setValue(Boolean.FALSE);
                break;
            case 26:
                l78Var.setValue(true);
                break;
            case 27:
                l78Var.setValue(Boolean.FALSE);
                break;
            case 28:
                l78Var.setValue(Boolean.TRUE);
                break;
            default:
                l78Var.setValue(Boolean.FALSE);
                break;
        }
        return c1eVar;
    }
}
