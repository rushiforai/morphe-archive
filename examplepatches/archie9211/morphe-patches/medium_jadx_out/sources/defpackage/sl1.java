package defpackage;

import com.medium.android.core.susi.SusiDestination;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class sl1 implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ r28 c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;
    public final /* synthetic */ Object i;

    public /* synthetic */ sl1(m45 m45Var, mz1 mz1Var, r28 r28Var, boolean z, m3c m3cVar, nl1 nl1Var, ol1 ol1Var, cu0 cu0Var, int i) {
        this.d = m45Var;
        this.e = mz1Var;
        this.c = r28Var;
        this.b = z;
        this.f = m3cVar;
        this.g = nl1Var;
        this.h = ol1Var;
        this.i = cu0Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.i;
        Object obj4 = this.h;
        Object obj5 = this.g;
        Object obj6 = this.f;
        Object obj7 = this.e;
        Object obj8 = this.d;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(3127);
                wl1.a((m45) obj8, (mz1) obj7, this.c, this.b, (m3c) obj6, (nl1) obj5, (ol1) obj4, (cu0) obj3, (x12) obj, iY);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(1);
                k50.Q((String) obj8, (String) obj7, (String) obj6, (SusiDestination) obj5, this.b, (hha) obj4, this.c, (sdc) obj3, (x12) obj, iY2);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ sl1(String str, String str2, String str3, SusiDestination susiDestination, boolean z, hha hhaVar, r28 r28Var, sdc sdcVar, int i) {
        this.d = str;
        this.e = str2;
        this.f = str3;
        this.g = susiDestination;
        this.b = z;
        this.h = hhaVar;
        this.c = r28Var;
        this.i = sdcVar;
    }
}
