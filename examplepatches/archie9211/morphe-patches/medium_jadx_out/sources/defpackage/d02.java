package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class d02 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ h49 b;

    public /* synthetic */ d02(h49 h49Var, int i) {
        this.a = i;
        this.b = h49Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        h49 h49Var = this.b;
        switch (i) {
            case 0:
                h49Var.h(((Integer) obj).intValue());
                break;
            case 1:
                h49Var.h(((Integer) obj).intValue());
                break;
            case 2:
                h49Var.h((int) (((s46) obj).a >> 32));
                break;
            case 3:
                h49Var.h((int) (((s46) obj).a >> 32));
                break;
            default:
                hp6 hp6Var = (hp6) obj;
                hp6Var.getClass();
                int iJ = (int) (hp6Var.j() & 4294967295L);
                if (h49Var.g() < iJ) {
                    h49Var.h(iJ);
                }
                break;
        }
        return c1eVar;
    }
}
