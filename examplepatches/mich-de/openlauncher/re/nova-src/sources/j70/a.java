package j70;

import java.lang.reflect.Method;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final Method f69148a;

    /* renamed from: b, reason: collision with root package name */
    public static final Method f69149b;

    static {
        Method method;
        Method method2;
        Method[] methods = Throwable.class.getMethods();
        Intrinsics.d(methods);
        int length = methods.length;
        int i5 = 0;
        int i11 = 0;
        while (true) {
            method = null;
            if (i11 >= length) {
                method2 = null;
                break;
            }
            method2 = methods[i11];
            if (Intrinsics.b(method2.getName(), "addSuppressed")) {
                Class<?>[] parameterTypes = method2.getParameterTypes();
                Intrinsics.f(parameterTypes, "getParameterTypes(...)");
                if (Intrinsics.b(parameterTypes.length == 1 ? parameterTypes[0] : null, Throwable.class)) {
                    break;
                }
            }
            i11++;
        }
        f69148a = method2;
        int length2 = methods.length;
        while (true) {
            if (i5 >= length2) {
                break;
            }
            Method method3 = methods[i5];
            if (Intrinsics.b(method3.getName(), "getSuppressed")) {
                method = method3;
                break;
            }
            i5++;
        }
        f69149b = method;
    }
}
