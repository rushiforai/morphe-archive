package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class qv2 implements m45 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ int b;
    public final /* synthetic */ l78 c;
    public final /* synthetic */ j55 d;
    public final /* synthetic */ Object e;

    public /* synthetic */ qv2(x45 x45Var, List list, int i, l78 l78Var) {
        this.d = x45Var;
        this.e = list;
        this.b = i;
        this.c = l78Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        l78 l78Var = this.c;
        int i2 = this.b;
        Object obj = this.e;
        j55 j55Var = this.d;
        switch (i) {
            case 0:
                l78Var.setValue(Boolean.FALSE);
                ((b55) j55Var).invoke(Integer.valueOf(i2), (rv2) obj);
                break;
            default:
                ((x45) j55Var).invoke(((List) obj).get(i2));
                l78Var.setValue(Boolean.FALSE);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ qv2(b55 b55Var, int i, rv2 rv2Var, l78 l78Var) {
        this.d = b55Var;
        this.b = i;
        this.e = rv2Var;
        this.c = l78Var;
    }
}
