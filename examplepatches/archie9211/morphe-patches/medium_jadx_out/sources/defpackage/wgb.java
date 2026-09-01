package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class wgb implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ugb b;

    public /* synthetic */ wgb(ugb ugbVar, int i) {
        this.a = i;
        this.b = ugbVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        boolean zL;
        int i = this.a;
        ugb ugbVar = this.b;
        switch (i) {
            case 0:
                ugb ugbVar2 = (ugb) obj;
                ugbVar2.getClass();
                zL = g76.L(ugbVar2.a, ugbVar.q);
                break;
            case 1:
                zL = g76.L(((ugb) obj).a, ugbVar.q);
                break;
            default:
                ugb ugbVar3 = (ugb) obj;
                ugbVar3.getClass();
                return g76.L(ugbVar3.a, ugbVar.a) ? ugb.a(ugbVar3, null, null, 0, true, null, null, 0, false, 1047551) : ugbVar3;
        }
        return Boolean.valueOf(zL);
    }
}
