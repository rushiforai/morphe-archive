package defpackage;

import android.os.Build;
import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class l1b extends wz7 {
    @Override // defpackage.wz7
    public final Object p(Class cls, Object obj, Method method, Object[] objArr) {
        if (Build.VERSION.SDK_INT >= 26) {
            return u36.m(cls, obj, method, objArr);
        }
        ik4.k("Calling default methods on API 24 and 25 is not supported");
        return null;
    }

    @Override // defpackage.wz7
    public final boolean q(Method method) {
        return method.isDefault();
    }
}
