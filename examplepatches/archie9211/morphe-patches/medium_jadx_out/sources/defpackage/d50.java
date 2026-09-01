package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d50 extends co6 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ List b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ d50(List list, int i) {
        super(2);
        this.a = i;
        this.b = list;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        List list = this.b;
        switch (i) {
            case 0:
                try {
                    f94.c().execute(new ho((Integer) obj2, 4, list));
                } catch (Exception unused) {
                }
                break;
            default:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Number) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    int size = list.size();
                    for (int i2 = 0; i2 < size; i2++) {
                        b55 b55Var = (b55) list.get(i2);
                        long j = p65Var.T;
                        int i3 = (int) (j ^ (j >>> 32));
                        r12.W.getClass();
                        co coVar = q12.c;
                        p65Var.c0();
                        if (p65Var.S) {
                            p65Var.k(coVar);
                        } else {
                            p65Var.m0();
                        }
                        tp7.B(p65Var, q12.g, Integer.valueOf(i3));
                        b55Var.invoke(p65Var, 0);
                        p65Var.p(true);
                    }
                } else {
                    p65Var.S();
                }
                break;
        }
        return c1eVar;
        return c1eVar;
    }
}
