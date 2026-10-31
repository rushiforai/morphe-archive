package h6;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes.dex */
public final class f {

    /* renamed from: c, reason: collision with root package name */
    public static final f f59361c = new f();

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f59362a = new HashMap();

    /* renamed from: b, reason: collision with root package name */
    public final HashMap f59363b = new HashMap();

    public static void b(HashMap map, e eVar, s sVar, Class cls) {
        s sVar2 = (s) map.get(eVar);
        if (sVar2 == null || sVar == sVar2) {
            if (sVar2 == null) {
                map.put(eVar, sVar);
                return;
            }
            return;
        }
        throw new IllegalArgumentException("Method " + eVar.f59355b.getName() + " in " + cls.getName() + " already declared with different @OnLifecycleEvent value: previous value " + sVar2 + ", new value " + sVar);
    }

    public final d a(Class cls, Method[] methodArr) throws SecurityException {
        int i5;
        Class superclass = cls.getSuperclass();
        HashMap map = new HashMap();
        HashMap map2 = this.f59362a;
        if (superclass != null) {
            d dVarA = (d) map2.get(superclass);
            if (dVarA == null) {
                dVarA = a(superclass, null);
            }
            map.putAll(dVarA.f59350b);
        }
        for (Class<?> cls2 : cls.getInterfaces()) {
            d dVarA2 = (d) map2.get(cls2);
            if (dVarA2 == null) {
                dVarA2 = a(cls2, null);
            }
            for (Map.Entry entry : dVarA2.f59350b.entrySet()) {
                b(map, (e) entry.getKey(), (s) entry.getValue(), cls);
            }
        }
        if (methodArr == null) {
            try {
                methodArr = cls.getDeclaredMethods();
            } catch (NoClassDefFoundError e3) {
                throw new IllegalArgumentException("The observer class has some methods that use newer APIs which are not available in the current OS version. Lifecycles cannot access even other methods so you should make sure that your observer classes only access framework classes that are available in your min API level OR use lifecycle:compiler annotation processor.", e3);
            }
        }
        boolean z11 = false;
        for (Method method : methodArr) {
            o0 o0Var = (o0) method.getAnnotation(o0.class);
            if (o0Var != null) {
                Class<?>[] parameterTypes = method.getParameterTypes();
                if (parameterTypes.length <= 0) {
                    i5 = 0;
                } else {
                    if (!a0.class.isAssignableFrom(parameterTypes[0])) {
                        throw new IllegalArgumentException("invalid parameter type. Must be one and instanceof LifecycleOwner");
                    }
                    i5 = 1;
                }
                s sVarValue = o0Var.value();
                if (parameterTypes.length > 1) {
                    if (!s.class.isAssignableFrom(parameterTypes[1])) {
                        throw new IllegalArgumentException("invalid parameter type. second arg must be an event");
                    }
                    if (sVarValue != s.ON_ANY) {
                        throw new IllegalArgumentException("Second arg is supported only for ON_ANY value");
                    }
                    i5 = 2;
                }
                if (parameterTypes.length > 2) {
                    throw new IllegalArgumentException("cannot have more than 2 params");
                }
                b(map, new e(method, i5), sVarValue, cls);
                z11 = true;
            }
        }
        d dVar = new d(map);
        map2.put(cls, dVar);
        this.f59363b.put(cls, Boolean.valueOf(z11));
        return dVar;
    }
}
