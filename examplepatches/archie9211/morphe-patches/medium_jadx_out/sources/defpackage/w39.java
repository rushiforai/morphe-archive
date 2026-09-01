package defpackage;

import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class w39 extends to7 {
    public final /* synthetic */ int e;
    public final Method f;
    public final int g;

    public /* synthetic */ w39(Method method, int i, int i2) {
        this.e = i2;
        this.f = method;
        this.g = i;
    }

    @Override // defpackage.to7
    public final void h(ubb ubbVar, Object obj) {
        int i = this.e;
        int i2 = this.g;
        Method method = this.f;
        switch (i) {
            case 0:
                yi5 yi5Var = (yi5) obj;
                if (yi5Var == null) {
                    throw vv2.S(method, i2, "Headers parameter must not be null.", new Object[0]);
                }
                ru ruVar = ubbVar.f;
                ruVar.getClass();
                int size = yi5Var.size();
                for (int i3 = 0; i3 < size; i3++) {
                    iq7.B(ruVar, iq7.D(yi5Var, i3), iq7.F(yi5Var, i3));
                }
                return;
            default:
                if (obj == null) {
                    throw vv2.S(method, i2, "@Url parameter is null.", new Object[0]);
                }
                ubbVar.c = obj.toString();
                return;
        }
    }
}
