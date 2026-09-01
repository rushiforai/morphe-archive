package defpackage;

import java.lang.reflect.Method;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class q66 extends s66 implements tx0 {
    public final Object d;

    public q66(Method method, Object obj) {
        super(method, ey3.a);
        this.d = obj;
    }

    @Override // defpackage.v41
    public final Object call(Object[] objArr) {
        objArr.getClass();
        d(objArr);
        return this.a.invoke(this.d, Arrays.copyOf(objArr, objArr.length));
    }
}
