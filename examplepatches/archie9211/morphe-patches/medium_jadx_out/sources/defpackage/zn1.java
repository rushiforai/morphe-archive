package defpackage;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zn1 {
    public static final zn1 c = new zn1();
    public final HashMap a = new HashMap();
    public final HashMap b = new HashMap();

    public static void b(HashMap map, yn1 yn1Var, ux6 ux6Var, Class cls) {
        ux6 ux6Var2 = (ux6) map.get(yn1Var);
        if (ux6Var2 == null || ux6Var == ux6Var2) {
            if (ux6Var2 == null) {
                map.put(yn1Var, ux6Var);
                return;
            }
            return;
        }
        throw new IllegalArgumentException("Method " + yn1Var.b.getName() + " in " + cls.getName() + " already declared with different @OnLifecycleEvent value: previous value " + ux6Var2 + ", new value " + ux6Var);
    }

    public final xn1 a(Class cls, Method[] methodArr) {
        int i;
        Class superclass = cls.getSuperclass();
        HashMap map = new HashMap();
        HashMap map2 = this.a;
        if (superclass != null) {
            xn1 xn1VarA = (xn1) map2.get(superclass);
            if (xn1VarA == null) {
                xn1VarA = a(superclass, null);
            }
            map.putAll(xn1VarA.b);
        }
        for (Class<?> cls2 : cls.getInterfaces()) {
            xn1 xn1VarA2 = (xn1) map2.get(cls2);
            if (xn1VarA2 == null) {
                xn1VarA2 = a(cls2, null);
            }
            for (Map.Entry entry : xn1VarA2.b.entrySet()) {
                b(map, (yn1) entry.getKey(), (ux6) entry.getValue(), cls);
            }
        }
        if (methodArr == null) {
            try {
                methodArr = cls.getDeclaredMethods();
            } catch (NoClassDefFoundError e) {
                throw new IllegalArgumentException("The observer class has some methods that use newer APIs which are not available in the current OS version. Lifecycles cannot access even other methods so you should make sure that your observer classes only access framework classes that are available in your min API level OR use lifecycle:compiler annotation processor.", e);
            }
        }
        boolean z = false;
        for (Method method : methodArr) {
            er8 er8Var = (er8) method.getAnnotation(er8.class);
            if (er8Var != null) {
                Class<?>[] parameterTypes = method.getParameterTypes();
                if (parameterTypes.length <= 0) {
                    i = 0;
                } else {
                    if (!iy6.class.isAssignableFrom(parameterTypes[0])) {
                        ay0.e("invalid parameter type. Must be one and instanceof LifecycleOwner");
                        return null;
                    }
                    i = 1;
                }
                ux6 ux6VarValue = er8Var.value();
                if (parameterTypes.length > 1) {
                    if (!ux6.class.isAssignableFrom(parameterTypes[1])) {
                        ay0.e("invalid parameter type. second arg must be an event");
                        return null;
                    }
                    if (ux6VarValue != ux6.ON_ANY) {
                        ay0.e("Second arg is supported only for ON_ANY value");
                        return null;
                    }
                    i = 2;
                }
                if (parameterTypes.length > 2) {
                    ay0.e("cannot have more than 2 params");
                    return null;
                }
                b(map, new yn1(i, method), ux6VarValue, cls);
                z = true;
            }
        }
        xn1 xn1Var = new xn1(map);
        map2.put(cls, xn1Var);
        this.b.put(cls, Boolean.valueOf(z));
        return xn1Var;
    }
}
