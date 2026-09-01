package defpackage;

import com.medium.android.postpublishing.ui.TopicData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class al1 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ boolean c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    public /* synthetic */ al1(String str, String str2, boolean z, boolean z2, u37 u37Var, int i) {
        this.a = 2;
        this.f = str;
        this.d = str2;
        this.b = z;
        this.c = z2;
        this.e = u37Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.e;
        Object obj4 = this.d;
        Object obj5 = this.f;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(3073);
                bgf.i(this.b, (String) obj5, (x45) obj4, (r28) obj3, this.c, (x12) obj, iY);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(1);
                u36.e((ml2) obj5, this.b, this.c, (x45) obj4, (r28) obj3, (x12) obj, iY2);
                break;
            case 2:
                ((Integer) obj2).getClass();
                int iY3 = tr7.y(1);
                k50.r((String) obj5, (String) obj4, this.b, this.c, (u37) obj3, (x12) obj, iY3);
                break;
            case 3:
                ((Integer) obj2).getClass();
                int iY4 = tr7.y(1);
                d46.r((TopicData) obj5, this.b, this.c, (jea) obj4, (eb8) obj3, (x12) obj, iY4);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY5 = tr7.y(3073);
                hp7.w(this.b, (m45) obj5, (m45) obj4, (r28) obj3, this.c, (x12) obj, iY5);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ al1(Object obj, boolean z, boolean z2, x45 x45Var, Object obj2, int i, int i2) {
        this.a = i2;
        this.f = obj;
        this.b = z;
        this.c = z2;
        this.d = x45Var;
        this.e = obj2;
    }

    public /* synthetic */ al1(boolean z, Object obj, j55 j55Var, r28 r28Var, boolean z2, int i, int i2) {
        this.a = i2;
        this.b = z;
        this.f = obj;
        this.d = j55Var;
        this.e = r28Var;
        this.c = z2;
    }
}
