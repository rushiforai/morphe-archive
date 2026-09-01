package defpackage;

import com.medium.proto.obv.post.BlockLayout;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ip3 implements b55 {
    public final /* synthetic */ int a = 2;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ boolean c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;

    public /* synthetic */ ip3(y09 y09Var, BlockLayout blockLayout, boolean z, boolean z2, a19 a19Var, gx5 gx5Var, r28 r28Var, int i) {
        this.d = y09Var;
        this.e = blockLayout;
        this.b = z;
        this.c = z2;
        this.f = a19Var;
        this.g = gx5Var;
        this.h = r28Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.h;
        Object obj4 = this.g;
        Object obj5 = this.f;
        Object obj6 = this.e;
        Object obj7 = this.d;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                bo.i((y09) obj7, (BlockLayout) obj6, this.b, this.c, (a19) obj5, (gx5) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 1:
                nhc nhcVar = (nhc) obj7;
                c84 c84Var = (c84) obj6;
                l78 l78Var = (l78) obj5;
                l78 l78Var2 = (l78) obj4;
                l78 l78Var3 = (l78) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(1 & iIntValue, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    v4.b((String) l78Var.getValue(), (String) l78Var2.getValue(), (String) l78Var3.getValue(), nhcVar, c84Var, this.b, this.c, p65Var, 3072);
                }
                break;
            default:
                ((Integer) obj2).getClass();
                v4.b((String) obj7, (String) obj6, (String) obj5, (nhc) obj4, (c84) obj3, this.b, this.c, (x12) obj, tr7.y(3073));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ ip3(nhc nhcVar, c84 c84Var, boolean z, boolean z2, l78 l78Var, l78 l78Var2, l78 l78Var3) {
        this.d = nhcVar;
        this.e = c84Var;
        this.b = z;
        this.c = z2;
        this.f = l78Var;
        this.g = l78Var2;
        this.h = l78Var3;
    }

    public /* synthetic */ ip3(String str, String str2, String str3, nhc nhcVar, c84 c84Var, boolean z, boolean z2, int i) {
        this.d = str;
        this.e = str2;
        this.f = str3;
        this.g = nhcVar;
        this.h = c84Var;
        this.b = z;
        this.c = z2;
    }
}
