package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class mq implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ int c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;

    public /* synthetic */ mq(int i, String str, boolean z, String str2, r28 r28Var, x45 x45Var, int i2) {
        this.a = 4;
        this.c = i;
        this.d = str;
        this.b = z;
        this.f = str2;
        this.e = r28Var;
        this.g = x45Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        int i2 = this.c;
        c1e c1eVar = c1e.a;
        Object obj3 = this.e;
        Object obj4 = this.g;
        Object obj5 = this.f;
        Object obj6 = this.d;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                pq.b((m45) obj6, (r28) obj3, this.b, (hy8) obj5, (mz1) obj4, (x12) obj, iY);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                yi2.m((String) obj6, (String) obj3, this.b, (SourceParameter) obj5, (cv9) obj4, (x12) obj, iY2);
                break;
            case 2:
                ((Integer) obj2).getClass();
                int iY3 = tr7.y(i2 | 1);
                fo7.m((m45) obj6, (String) obj5, (xn7) obj4, (r28) obj3, this.b, (x12) obj, iY3);
                break;
            case 3:
                ((Integer) obj2).getClass();
                int iY4 = tr7.y(i2 | 1);
                mk7.b((dr9) obj5, this.b, (sh9) obj4, (m45) obj6, (r28) obj3, (x12) obj, iY4);
                break;
            case 4:
                ((Integer) obj2).getClass();
                int iY5 = tr7.y(27649);
                dm2.r(this.c, (String) obj6, this.b, (String) obj5, (r28) obj3, (x45) obj4, (x12) obj, iY5);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY6 = tr7.y(i2 | 1);
                fo7.x((uid) obj6, (bib) obj5, (lgb) obj4, this.b, (r28) obj3, (x12) obj, iY6);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ mq(m45 m45Var, String str, xn7 xn7Var, r28 r28Var, boolean z, int i) {
        this.a = 2;
        this.d = m45Var;
        this.f = str;
        this.g = xn7Var;
        this.e = r28Var;
        this.b = z;
        this.c = i;
    }

    public /* synthetic */ mq(dr9 dr9Var, boolean z, sh9 sh9Var, m45 m45Var, r28 r28Var, int i) {
        this.a = 3;
        this.f = dr9Var;
        this.b = z;
        this.g = sh9Var;
        this.d = m45Var;
        this.e = r28Var;
        this.c = i;
    }

    public /* synthetic */ mq(uid uidVar, bib bibVar, lgb lgbVar, boolean z, r28 r28Var, int i) {
        this.a = 5;
        this.d = uidVar;
        this.f = bibVar;
        this.g = lgbVar;
        this.b = z;
        this.e = r28Var;
        this.c = i;
    }

    public /* synthetic */ mq(Object obj, Object obj2, boolean z, Object obj3, Object obj4, int i, int i2) {
        this.a = i2;
        this.d = obj;
        this.e = obj2;
        this.b = z;
        this.f = obj3;
        this.g = obj4;
        this.c = i;
    }
}
