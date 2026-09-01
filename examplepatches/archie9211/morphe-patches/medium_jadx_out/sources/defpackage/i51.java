package defpackage;

import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class i51 extends f51 implements tx0 {
    public final boolean g;
    public final Object h;

    /* JADX WARN: Illegal instructions before constructor call */
    public i51(Method method, boolean z, Object obj) {
        Type[] genericParameterTypes = method.getGenericParameterTypes();
        genericParameterTypes.getClass();
        super(method, false, (Type[]) (genericParameterTypes.length <= 1 ? new Type[0] : k80.m0(1, genericParameterTypes.length, genericParameterTypes)));
        this.g = z;
        this.h = obj;
    }

    @Override // defpackage.f51, defpackage.v41
    public final Object call(Object[] objArr) {
        objArr.getClass();
        d(objArr);
        nec necVar = new nec(2);
        necVar.b(this.h);
        necVar.e(objArr);
        ArrayList arrayList = (ArrayList) necVar.b;
        return f(null, arrayList.toArray(new Object[arrayList.size()]));
    }
}
