package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ggb implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ lgb b;

    public /* synthetic */ ggb(lgb lgbVar, int i) {
        this.a = i;
        this.b = lgbVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        lgb lgbVar = this.b;
        switch (i) {
            case 0:
                String str = (String) obj;
                String str2 = (String) obj2;
                str.getClass();
                str2.getClass();
                lgbVar.j(str, str2);
                break;
            default:
                String str3 = (String) obj;
                String str4 = (String) obj2;
                str3.getClass();
                str4.getClass();
                lgbVar.j(str3, str4);
                break;
        }
        return c1eVar;
    }
}
