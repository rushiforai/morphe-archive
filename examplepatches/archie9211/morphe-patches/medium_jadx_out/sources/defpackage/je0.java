package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class je0 implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    public /* synthetic */ je0(xm1 xm1Var, Integer num, boolean z, ojc ojcVar, r28 r28Var, int i) {
        this.c = xm1Var;
        this.d = num;
        this.b = z;
        this.e = ojcVar;
        this.f = r28Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.f;
        Object obj4 = this.e;
        Object obj5 = this.d;
        Object obj6 = this.c;
        switch (i) {
            case 0:
                pq9 pq9Var = (pq9) obj6;
                rq9 rq9Var = (rq9) obj5;
                SourceParameter sourceParameter = (SourceParameter) obj4;
                b55 b55Var = (b55) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(1 & iIntValue, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    vc2.d(pq9Var, rq9Var, this.b, sourceParameter, b55Var, null, p65Var, 0);
                }
                break;
            case 1:
                ((Integer) obj2).getClass();
                k40.z((String) obj6, this.b, (String) obj5, (r28) obj4, (x45) obj3, (x12) obj, tr7.y(1));
                break;
            default:
                ((Integer) obj2).getClass();
                wo7.e((xm1) obj6, (Integer) obj5, this.b, (ojc) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ je0(pq9 pq9Var, rq9 rq9Var, boolean z, SourceParameter sourceParameter, b55 b55Var) {
        this.c = pq9Var;
        this.d = rq9Var;
        this.b = z;
        this.e = sourceParameter;
        this.f = b55Var;
    }

    public /* synthetic */ je0(String str, boolean z, String str2, r28 r28Var, x45 x45Var, int i) {
        this.c = str;
        this.b = z;
        this.d = str2;
        this.e = r28Var;
        this.f = x45Var;
    }
}
