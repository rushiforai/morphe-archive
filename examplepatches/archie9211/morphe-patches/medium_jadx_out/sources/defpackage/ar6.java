package defpackage;

import com.medium.android.graphql.type.PublicationSubmissionStatus;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ar6 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ boolean f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;
    public final /* synthetic */ int i;
    public final /* synthetic */ int j;
    public final /* synthetic */ Object k;
    public final /* synthetic */ Object l;

    public /* synthetic */ ar6(pq9 pq9Var, rq9 rq9Var, String str, boolean z, SourceParameter sourceParameter, b55 b55Var, b55 b55Var2, r28 r28Var, PublicationSubmissionStatus publicationSubmissionStatus, int i, int i2) {
        this.a = 3;
        this.c = pq9Var;
        this.d = rq9Var;
        this.k = str;
        this.f = z;
        this.l = sourceParameter;
        this.e = b55Var;
        this.g = b55Var2;
        this.b = r28Var;
        this.h = publicationSubmissionStatus;
        this.i = i;
        this.j = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.i;
        Object obj3 = this.h;
        Object obj4 = this.g;
        Object obj5 = this.e;
        Object obj6 = this.l;
        Object obj7 = this.k;
        Object obj8 = this.d;
        Object obj9 = this.c;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                k40.t(this.b, (kv6) obj9, (hy8) obj8, (j70) obj7, (wd) obj6, (dn4) obj5, this.f, (fx8) obj4, (x45) obj3, (x12) obj, iY, this.j);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                k40.u(this.b, (kv6) obj9, (hy8) obj8, (g70) obj7, (zq0) obj6, (dn4) obj5, this.f, (fx8) obj4, (x45) obj3, (x12) obj, iY2, this.j);
                break;
            case 2:
                ((Integer) obj2).getClass();
                int iY3 = tr7.y(i2 | 1);
                lk7.f((j4a) obj9, (x45) obj3, (x45) obj8, this.b, this.f, (String) obj7, (Integer) obj6, (m45) obj5, (sr4) obj4, (x12) obj, iY3, this.j);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY4 = tr7.y(i2 | 1);
                gp7.c((pq9) obj9, (rq9) obj8, (String) obj7, this.f, (SourceParameter) obj6, (b55) obj5, (b55) obj4, this.b, (PublicationSubmissionStatus) obj3, (x12) obj, iY4, this.j);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ ar6(r28 r28Var, kv6 kv6Var, hy8 hy8Var, Object obj, Object obj2, dn4 dn4Var, boolean z, fx8 fx8Var, x45 x45Var, int i, int i2, int i3) {
        this.a = i3;
        this.b = r28Var;
        this.c = kv6Var;
        this.d = hy8Var;
        this.k = obj;
        this.l = obj2;
        this.e = dn4Var;
        this.f = z;
        this.g = fx8Var;
        this.h = x45Var;
        this.i = i;
        this.j = i2;
    }

    public /* synthetic */ ar6(j4a j4aVar, x45 x45Var, x45 x45Var2, r28 r28Var, boolean z, String str, Integer num, m45 m45Var, sr4 sr4Var, int i, int i2) {
        this.a = 2;
        this.c = j4aVar;
        this.h = x45Var;
        this.d = x45Var2;
        this.b = r28Var;
        this.f = z;
        this.k = str;
        this.l = num;
        this.e = m45Var;
        this.g = sr4Var;
        this.i = i;
        this.j = i2;
    }
}
