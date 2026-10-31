package com.apm.insight.h;

import android.util.Log;
import b.c0;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    private static final Map<Class<?>, Class<?>> f21632a;

    /* renamed from: com.apm.insight.h.a$a, reason: collision with other inner class name */
    public static class C0006a<T> {

        /* renamed from: a, reason: collision with root package name */
        public final Class<? extends T> f21633a;

        /* renamed from: b, reason: collision with root package name */
        public final T f21634b;
    }

    static {
        HashMap map = new HashMap();
        f21632a = map;
        Class cls = Boolean.TYPE;
        map.put(Boolean.class, cls);
        Class cls2 = Byte.TYPE;
        map.put(Byte.class, cls2);
        Class cls3 = Character.TYPE;
        map.put(Character.class, cls3);
        Class cls4 = Short.TYPE;
        map.put(Short.class, cls4);
        Class cls5 = Integer.TYPE;
        map.put(Integer.class, cls5);
        Class cls6 = Float.TYPE;
        map.put(Float.class, cls6);
        Class cls7 = Long.TYPE;
        map.put(Long.class, cls7);
        Class cls8 = Double.TYPE;
        map.put(Double.class, cls8);
        map.put(cls, cls);
        map.put(cls2, cls2);
        map.put(cls3, cls3);
        map.put(cls4, cls4);
        map.put(cls5, cls5);
        map.put(cls6, cls6);
        map.put(cls7, cls7);
        map.put(cls8, cls8);
    }

    public static <T> T a(String str, String str2, Object... objArr) throws NoSuchMethodException, ClassNotFoundException, SecurityException {
        Method method;
        Class<?>[] parameterTypes;
        try {
            Class<?> cls = Class.forName(str);
            Class<?>[] clsArr = new Class[4];
            for (int i5 = 0; i5 < 4; i5++) {
                Object obj = objArr[i5];
                clsArr[i5] = (obj == null || !(obj instanceof C0006a)) ? obj == null ? null : obj.getClass() : ((C0006a) obj).f21633a;
            }
            while (true) {
                Method[] declaredMethods = cls.getDeclaredMethods();
                int length = declaredMethods.length;
                int i11 = 0;
                while (true) {
                    if (i11 >= length) {
                        method = null;
                        break;
                    }
                    method = declaredMethods[i11];
                    if (method.getName().equals(str2) && (parameterTypes = method.getParameterTypes()) != null && parameterTypes.length == 4) {
                        for (int i12 = 0; i12 < parameterTypes.length; i12++) {
                            if (!parameterTypes[i12].isAssignableFrom(clsArr[i12])) {
                                Map<Class<?>, Class<?>> map = f21632a;
                                if (map.containsKey(parameterTypes[i12]) && map.get(parameterTypes[i12]).equals(map.get(clsArr[i12]))) {
                                }
                            }
                        }
                        break;
                    }
                    i11++;
                }
                if (method != null) {
                    method.setAccessible(true);
                    Object[] objArr2 = new Object[4];
                    for (int i13 = 0; i13 < 4; i13++) {
                        Object obj2 = objArr[i13];
                        if (obj2 == null || !(obj2 instanceof C0006a)) {
                            objArr2[i13] = obj2;
                        } else {
                            objArr2[i13] = ((C0006a) obj2).f21634b;
                        }
                    }
                    return (T) method.invoke(null, objArr2);
                }
                if (cls.getSuperclass() == null) {
                    throw new NoSuchMethodException();
                }
                cls = cls.getSuperclass();
            }
        } catch (Exception e3) {
            Log.w("JavaCalls", c0.m("Meet exception when call Method '", str2, "' in ", str), e3);
            return null;
        }
    }
}
