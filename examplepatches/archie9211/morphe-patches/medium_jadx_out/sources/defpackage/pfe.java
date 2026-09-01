package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class pfe implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ int b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ pfe(String str, lgb lgbVar, r28 r28Var, int i) {
        this.a = 2;
        this.c = str;
        this.e = lgbVar;
        this.d = r28Var;
        this.b = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.b;
        Object obj3 = this.d;
        Object obj4 = this.e;
        Object obj5 = this.c;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                sfe.a((hge) obj5, (r28) obj3, (rfe) obj4, (x12) obj, tr7.y(i2 | 1));
                break;
            case 1:
                ((Integer) obj2).getClass();
                tp7.n((Map) obj5, (b55) obj3, (m45) obj4, (x12) obj, tr7.y(i2 | 1));
                break;
            default:
                ((Integer) obj2).getClass();
                fo7.e((String) obj5, (lgb) obj4, (r28) obj3, (x12) obj, tr7.y(i2 | 1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ pfe(int i, int i2, Object obj, Object obj2, Object obj3) {
        this.a = i2;
        this.c = obj;
        this.d = obj2;
        this.e = obj3;
        this.b = i;
    }
}
