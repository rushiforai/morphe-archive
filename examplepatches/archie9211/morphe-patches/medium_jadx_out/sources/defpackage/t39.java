package defpackage;

import java.io.IOException;
import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class t39 extends to7 {
    public final Method e;
    public final int f;
    public final y92 g;

    public t39(Method method, int i, y92 y92Var) {
        this.e = method;
        this.f = i;
        this.g = y92Var;
    }

    @Override // defpackage.to7
    public final void h(ubb ubbVar, Object obj) {
        int i = this.f;
        Method method = this.e;
        if (obj == null) {
            throw vv2.S(method, i, "Body parameter value must not be null.", new Object[0]);
        }
        try {
            ubbVar.k = (sbb) this.g.v(obj);
        } catch (IOException e) {
            throw vv2.T(method, e, i, "Unable to convert " + obj + " to RequestBody", new Object[0]);
        }
    }
}
