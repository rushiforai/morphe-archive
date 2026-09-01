package defpackage;

import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class j51 extends f51 implements tx0 {
    public final Object[] g;

    /* JADX WARN: Illegal instructions before constructor call */
    public j51(Method method, Object[] objArr) {
        method.getClass();
        objArr.getClass();
        Type[] genericParameterTypes = method.getGenericParameterTypes();
        genericParameterTypes.getClass();
        super(method, false, (Type[]) k80.n0(objArr.length, genericParameterTypes).toArray(new Type[0]));
        this.g = objArr;
    }

    @Override // defpackage.f51, defpackage.v41
    public final Object call(Object[] objArr) {
        objArr.getClass();
        d(objArr);
        nec necVar = new nec(2);
        necVar.e(this.g);
        necVar.e(objArr);
        ArrayList arrayList = (ArrayList) necVar.b;
        return f(null, arrayList.toArray(new Object[arrayList.size()]));
    }
}
