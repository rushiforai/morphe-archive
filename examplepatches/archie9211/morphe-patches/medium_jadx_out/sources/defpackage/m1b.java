package defpackage;

import java.lang.reflect.Method;
import java.lang.reflect.Parameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class m1b extends wz7 {
    @Override // defpackage.wz7
    public final String h(int i, Method method) {
        Parameter parameter = method.getParameters()[i];
        if (!parameter.isNamePresent()) {
            return super.h(i, method);
        }
        return "parameter '" + parameter.getName() + '\'';
    }

    @Override // defpackage.wz7
    public final Object p(Class cls, Object obj, Method method, Object[] objArr) {
        return u36.m(cls, obj, method, objArr);
    }

    @Override // defpackage.wz7
    public final boolean q(Method method) {
        return method.isDefault();
    }
}
