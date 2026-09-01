package defpackage;

import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class kn1 extends hlg {
    public final /* synthetic */ Method o;
    public final /* synthetic */ Object p;
    public final /* synthetic */ Class q;

    public kn1(Method method, Object obj, Class cls) {
        this.o = method;
        this.p = obj;
        this.q = cls;
    }

    @Override // defpackage.hlg
    public final Object J() {
        return this.o.invoke(this.p, this.q);
    }

    public final String toString() {
        return this.q.getName();
    }
}
