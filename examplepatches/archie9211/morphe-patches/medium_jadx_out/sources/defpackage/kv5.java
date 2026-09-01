package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kv5 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ lv5 b;

    public /* synthetic */ kv5(lv5 lv5Var, int i) {
        this.a = i;
        this.b = lv5Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        lv5 lv5Var = this.b;
        switch (i) {
            case 0:
                return lv5Var.getDefaultViewModelProviderFactory();
            case 1:
                return lv5Var.getViewModelStore();
            default:
                return lv5Var.getDefaultViewModelCreationExtras();
        }
    }
}
