package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class lla implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ az5 b;

    public /* synthetic */ lla(az5 az5Var, int i) {
        this.a = i;
        this.b = az5Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int size;
        int i = this.a;
        th6 th6Var = this.b;
        switch (i) {
            case 0:
                size = ((t0) th6Var).getSize();
                break;
            default:
                size = ((t0) th6Var).getSize();
                break;
        }
        return Integer.valueOf(size);
    }
}
