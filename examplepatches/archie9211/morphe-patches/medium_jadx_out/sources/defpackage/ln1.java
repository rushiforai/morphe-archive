package defpackage;

import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ln1 extends hlg {
    public final /* synthetic */ Method o;
    public final /* synthetic */ Class p;
    public final /* synthetic */ int q;

    public ln1(Method method, Class cls, int i) {
        this.o = method;
        this.p = cls;
        this.q = i;
    }

    @Override // defpackage.hlg
    public final Object J() {
        return this.o.invoke(null, this.p, Integer.valueOf(this.q));
    }

    public final String toString() {
        return this.p.getName();
    }
}
