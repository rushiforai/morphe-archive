package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class wa8 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ qa8 b;

    public /* synthetic */ wa8(qa8 qa8Var, int i) {
        this.a = i;
        this.b = qa8Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        boolean zContains;
        int i = this.a;
        qa8 qa8Var = this.b;
        String str = (String) obj;
        switch (i) {
            case 0:
                str.getClass();
                zContains = qa8Var.c().contains(str);
                break;
            default:
                str.getClass();
                zContains = qa8Var.c().contains(str);
                break;
        }
        return Boolean.valueOf(!zContains);
    }
}
