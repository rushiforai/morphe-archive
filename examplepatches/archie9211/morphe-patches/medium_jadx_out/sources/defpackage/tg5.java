package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class tg5 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ obe b;
    public final /* synthetic */ hne c;

    public /* synthetic */ tg5(obe obeVar, hne hneVar, int i) {
        this.a = i;
        this.b = obeVar;
        this.c = hneVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        hne hneVar = this.c;
        obe obeVar = this.b;
        switch (i) {
            case 0:
                obeVar.p(hneVar.a, hneVar.i);
                break;
            case 1:
                obeVar.A(hneVar.i, hneVar.a, true);
                break;
            case 2:
                obeVar.A(hneVar.i, hneVar.a, false);
                break;
            default:
                obeVar.p(hneVar.a, hneVar.i);
                break;
        }
        return c1eVar;
    }
}
