package defpackage;

import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class ia9 {
    public static final Method a;
    public static final Method b;

    static {
        Method method;
        Method method2;
        Method[] methods = Throwable.class.getMethods();
        methods.getClass();
        int length = methods.length;
        int i = 0;
        int i2 = 0;
        while (true) {
            method = null;
            if (i2 >= length) {
                method2 = null;
                break;
            }
            method2 = methods[i2];
            if (g76.L(method2.getName(), "addSuppressed")) {
                Class<?>[] parameterTypes = method2.getParameterTypes();
                parameterTypes.getClass();
                if (g76.L(parameterTypes.length == 1 ? parameterTypes[0] : null, Throwable.class)) {
                    break;
                }
            }
            i2++;
        }
        a = method2;
        int length2 = methods.length;
        while (true) {
            if (i >= length2) {
                break;
            }
            Method method3 = methods[i];
            if (g76.L(method3.getName(), "getSuppressed")) {
                method = method3;
                break;
            }
            i++;
        }
        b = method;
    }
}
