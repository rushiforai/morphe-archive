package defpackage;

import gen.model.SourceParameter;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class o implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ int b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ o(Object obj, int i, Object obj2, int i2) {
        this.a = i2;
        this.c = obj;
        this.b = i;
        this.d = obj2;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.b;
        Object obj = this.d;
        Object obj2 = this.c;
        switch (i) {
            case 0:
                p pVar = (p) obj;
                String str = pVar.a;
                Integer numValueOf = Integer.valueOf(i2);
                SourceParameter sourceParameter = pVar.c;
                str.getClass();
                sourceParameter.getClass();
                b09.P(((iaa) obj2).a, str, numValueOf, null, sourceParameter, 4);
                break;
            case 1:
                qs5 qs5Var = (qs5) obj2;
                b14 b14Var = (b14) obj;
                try {
                    b14Var.getClass();
                    qs5Var.w.L(i2, b14Var);
                } catch (IOException e) {
                    b14 b14Var2 = b14.PROTOCOL_ERROR;
                    qs5Var.f(b14Var2, b14Var2, e);
                }
                break;
            case 2:
                ((l78) obj).setValue(Boolean.FALSE);
                ((nba) obj2).a(Integer.valueOf(i2));
                break;
            default:
                vx0.c0((sb2) obj2, null, null, new fz8((gz8) obj, i2, null, 3), 3);
                break;
        }
        return c1eVar;
        return c1eVar;
    }

    public /* synthetic */ o(Object obj, Object obj2, int i, int i2) {
        this.a = i2;
        this.c = obj;
        this.d = obj2;
        this.b = i;
    }
}
