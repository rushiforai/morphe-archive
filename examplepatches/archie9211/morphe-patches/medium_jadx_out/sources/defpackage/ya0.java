package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class ya0 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ int c;
    public final /* synthetic */ int d;
    public final /* synthetic */ Object e;

    public /* synthetic */ ya0(ec0 ec0Var, r28 r28Var, int i, int i2) {
        this.a = 1;
        this.e = ec0Var;
        this.b = r28Var;
        this.c = i;
        this.d = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        int i2 = this.d;
        int i3 = this.c;
        c1e c1eVar = c1e.a;
        Object obj3 = this.b;
        Object obj4 = this.e;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(1);
                t40.t(this.c, this.d, (ArrayList) obj4, (r28) obj3, (x12) obj, iY);
                break;
            case 1:
                ((Integer) obj2).getClass();
                gsa.S((ec0) obj4, (r28) obj3, (x12) obj, tr7.y(i3 | 1), i2);
                break;
            case 2:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(3073);
                tp7.h(this.c, this.d, (mx) obj4, (r28) obj3, (x12) obj, iY2);
                break;
            default:
                ((Integer) obj2).intValue();
                tp7.m((uwe) obj4, i3, (x45) obj3, (x12) obj, tr7.y(i2 | 1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ ya0(int i, int i2, Object obj, r28 r28Var, int i3, int i4) {
        this.a = i4;
        this.c = i;
        this.d = i2;
        this.e = obj;
        this.b = r28Var;
    }

    public /* synthetic */ ya0(uwe uweVar, int i, x45 x45Var, int i2) {
        this.a = 3;
        this.e = uweVar;
        this.c = i;
        this.b = x45Var;
        this.d = i2;
    }
}
