package defpackage;

import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class mc0 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ boolean c;
    public final /* synthetic */ int d;
    public final /* synthetic */ int e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;
    public final /* synthetic */ Object i;

    public /* synthetic */ mc0(m45 m45Var, r28 r28Var, boolean z, nv5 nv5Var, m3c m3cVar, b55 b55Var, int i, int i2) {
        this.f = m45Var;
        this.b = r28Var;
        this.c = z;
        this.g = nv5Var;
        this.h = m3cVar;
        this.i = b55Var;
        this.d = i;
        this.e = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.d;
        Object obj3 = this.i;
        Object obj4 = this.h;
        Object obj5 = this.g;
        Object obj6 = this.f;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                gsa.o((SusiOperation) obj6, (SusiDestination) obj5, (String) obj4, this.c, (ec0) obj3, this.b, (x12) obj, iY, this.e);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                f49.l((m45) obj6, this.b, this.c, (nv5) obj5, (m3c) obj4, (b55) obj3, (x12) obj, iY2, this.e);
                break;
            case 2:
                ((Integer) obj2).getClass();
                int iY3 = tr7.y(i2 | 1);
                fo7.j((m45) obj6, (String) obj4, (xn7) obj5, this.b, this.c, (g11) obj3, (x12) obj, iY3, this.e);
                break;
            case 3:
                ((Integer) obj2).getClass();
                int iY4 = tr7.y(i2 | 1);
                mo7.l((m45) obj6, (String) obj4, (yn7) obj5, this.b, (ay2) obj3, this.c, (x12) obj, iY4, this.e);
                break;
            case 4:
                ((Integer) obj2).getClass();
                int iY5 = tr7.y(i2 | 1);
                vx0.y((String) obj4, this.c, (x45) obj6, (String) obj5, this.b, (String) obj3, (x12) obj, iY5, this.e);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY6 = tr7.y(i2 | 1);
                kod.b((gd9) obj6, (mz1) obj5, (pod) obj4, this.b, this.c, (mz1) obj3, (x12) obj, iY6, this.e);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ mc0(m45 m45Var, String str, xn7 xn7Var, r28 r28Var, boolean z, g11 g11Var, int i, int i2) {
        this.f = m45Var;
        this.h = str;
        this.g = xn7Var;
        this.b = r28Var;
        this.c = z;
        this.i = g11Var;
        this.d = i;
        this.e = i2;
    }

    public /* synthetic */ mc0(m45 m45Var, String str, yn7 yn7Var, r28 r28Var, ay2 ay2Var, boolean z, int i, int i2) {
        this.f = m45Var;
        this.h = str;
        this.g = yn7Var;
        this.b = r28Var;
        this.i = ay2Var;
        this.c = z;
        this.d = i;
        this.e = i2;
    }

    public /* synthetic */ mc0(gd9 gd9Var, mz1 mz1Var, pod podVar, r28 r28Var, boolean z, mz1 mz1Var2, int i, int i2) {
        this.f = gd9Var;
        this.g = mz1Var;
        this.h = podVar;
        this.b = r28Var;
        this.c = z;
        this.i = mz1Var2;
        this.d = i;
        this.e = i2;
    }

    public /* synthetic */ mc0(SusiOperation susiOperation, SusiDestination susiDestination, String str, boolean z, ec0 ec0Var, r28 r28Var, int i, int i2) {
        this.f = susiOperation;
        this.g = susiDestination;
        this.h = str;
        this.c = z;
        this.i = ec0Var;
        this.b = r28Var;
        this.d = i;
        this.e = i2;
    }

    public /* synthetic */ mc0(String str, boolean z, x45 x45Var, String str2, r28 r28Var, String str3, int i, int i2) {
        this.h = str;
        this.c = z;
        this.f = x45Var;
        this.g = str2;
        this.b = r28Var;
        this.i = str3;
        this.d = i;
        this.e = i2;
    }
}
