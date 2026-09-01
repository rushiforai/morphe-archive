package defpackage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes5.dex */
public final class hs6 implements m45 {
    public final /* synthetic */ int a;
    public final js6 b;

    public /* synthetic */ hs6(js6 js6Var, int i) {
        this.a = i;
        this.b = js6Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        js6 js6Var = this.b;
        switch (i) {
            case 0:
                Object obj = js6Var.i.b;
                js6Var.f.a.a.getClass();
                return ei7.V(new ArrayList());
            case 1:
                js6Var.h.getClass();
                return new ArrayList(cu1.k0(ey3.a, 10));
            default:
                HashMap map = new HashMap();
                for (Map.Entry entry : ((Map) mk7.z(js6Var.j, js6.n[0])).entrySet()) {
                    String str = (String) entry.getKey();
                    h1b h1bVar = (h1b) entry.getValue();
                    te6 te6VarC = te6.c(str);
                    ym6 ym6Var = h1bVar.b;
                    xm6 xm6Var = (xm6) ym6Var.d;
                    int i2 = is6.a[xm6Var.ordinal()];
                    if (i2 == 1) {
                        String str2 = ym6Var.b;
                        if (xm6Var != xm6.MULTIFILE_CLASS_PART) {
                            str2 = null;
                        }
                        if (str2 != null) {
                            map.put(te6VarC, te6.c(str2));
                        }
                    } else if (i2 == 2) {
                        map.put(te6VarC, te6VarC);
                    }
                }
                return map;
        }
    }
}
