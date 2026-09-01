package defpackage;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class x39 extends to7 {
    public final /* synthetic */ int e = 1;
    public final Method f;
    public final int g;
    public final y92 h;
    public final Object i;

    public x39(Method method, int i, y92 y92Var, String str) {
        this.f = method;
        this.g = i;
        this.h = y92Var;
        this.i = str;
    }

    @Override // defpackage.to7
    public final void h(ubb ubbVar, Object obj) {
        int i = this.e;
        y92 y92Var = this.h;
        Object obj2 = this.i;
        Method method = this.f;
        int i2 = this.g;
        switch (i) {
            case 0:
                if (obj == null) {
                    return;
                }
                try {
                    ubbVar.c((yi5) obj2, (sbb) y92Var.v(obj));
                    return;
                } catch (IOException e) {
                    throw vv2.S(method, i2, "Unable to convert " + obj + " to RequestBody", e);
                }
            default:
                Map map = (Map) obj;
                if (map == null) {
                    throw vv2.S(method, i2, "Part map was null.", new Object[0]);
                }
                for (Map.Entry entry : map.entrySet()) {
                    String str = (String) entry.getKey();
                    if (str == null) {
                        throw vv2.S(method, i2, "Part map contained null key.", new Object[0]);
                    }
                    Object value = entry.getValue();
                    if (value == null) {
                        throw vv2.S(method, i2, ev6.x("Part map contained null value for key '", str, "'."), new Object[0]);
                    }
                    String[] strArr = {"Content-Disposition", ev6.x("form-data; name=\"", str, "\""), "Content-Transfer-Encoding", (String) obj2};
                    yi5 yi5Var = yi5.b;
                    ubbVar.c(pwd.U(strArr), (sbb) y92Var.v(value));
                }
                return;
        }
    }

    public x39(Method method, int i, yi5 yi5Var, y92 y92Var) {
        this.f = method;
        this.g = i;
        this.i = yi5Var;
        this.h = y92Var;
    }
}
