package defpackage;

import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class g51 extends f51 implements tx0 {
    public final Object g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g51(Method method, Object obj) {
        super(method, false, 4);
        method.getClass();
        this.g = obj;
    }

    @Override // defpackage.f51, defpackage.v41
    public final Object call(Object[] objArr) {
        objArr.getClass();
        d(objArr);
        return f(this.g, objArr);
    }
}
