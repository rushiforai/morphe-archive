package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class vy6 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ long b;
    public final /* synthetic */ int c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ j55 g;

    public /* synthetic */ vy6(long j, xqc xqcVar, r28 r28Var, List list, x45 x45Var, int i, int i2) {
        this.b = j;
        this.d = xqcVar;
        this.e = r28Var;
        this.f = list;
        this.g = x45Var;
        this.c = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        j55 j55Var = this.g;
        Object obj3 = this.f;
        Object obj4 = this.e;
        Object obj5 = this.d;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(1);
                wy6.a(this.b, (xqc) obj5, (r28) obj4, (List) obj3, (x45) j55Var, (x12) obj, iY, this.c);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(this.c | 1);
                mq7.d((m45) obj5, this.b, (u18) obj4, (ou) obj3, (mz1) j55Var, (x12) obj, iY2);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ vy6(m45 m45Var, long j, u18 u18Var, ou ouVar, mz1 mz1Var, int i) {
        this.d = m45Var;
        this.b = j;
        this.e = u18Var;
        this.f = ouVar;
        this.g = mz1Var;
        this.c = i;
    }
}
