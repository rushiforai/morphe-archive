package defpackage;

import com.medium.android.core.susi.SusiOperation;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class kc0 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ SusiOperation b;
    public final /* synthetic */ ec0 c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ int e;
    public final /* synthetic */ int f;

    public /* synthetic */ kc0(SusiOperation susiOperation, ec0 ec0Var, r28 r28Var, int i, int i2, int i3) {
        this.a = i3;
        this.b = susiOperation;
        this.c = ec0Var;
        this.d = r28Var;
        this.e = i;
        this.f = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.e;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                gsa.r(this.b, this.c, this.d, (x12) obj, iY, this.f);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                gsa.q(this.b, this.c, this.d, (x12) obj, iY2, this.f);
                break;
        }
        return c1eVar;
    }
}
