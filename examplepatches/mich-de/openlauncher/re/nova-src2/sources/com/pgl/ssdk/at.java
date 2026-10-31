package com.pgl.ssdk;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes4.dex */
public class at {

    /* renamed from: a, reason: collision with root package name */
    private static final Map<Class<?>, Class<?>> f42312a;

    public static class a<T> {

        /* renamed from: a, reason: collision with root package name */
        public final Class<? extends T> f42313a;

        /* renamed from: b, reason: collision with root package name */
        public final T f42314b;
    }

    static {
        HashMap map = new HashMap();
        f42312a = map;
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

    private static Method a(Class<?> cls, String str, Class... clsArr) throws NoSuchMethodException, SecurityException {
        Method methodA = a(cls.getDeclaredMethods(), str, (Class<?>[]) clsArr);
        if (methodA != null) {
            methodA.setAccessible(true);
            return methodA;
        }
        if (cls.getSuperclass() != null) {
            return a((Class<?>) cls.getSuperclass(), str, clsArr);
        }
        throw new NoSuchMethodException();
    }

    private static Object[] b(Object... objArr) {
        if (objArr == null || objArr.length <= 0) {
            return null;
        }
        Object[] objArr2 = new Object[objArr.length];
        for (int i5 = 0; i5 < objArr.length; i5++) {
            Object obj = objArr[i5];
            if (obj == null || !(obj instanceof a)) {
                objArr2[i5] = obj;
            } else {
                objArr2[i5] = ((a) obj).f42314b;
            }
        }
        return objArr2;
    }

    private static Method a(Method[] methodArr, String str, Class<?>[] clsArr) {
        if (str == null) {
            throw new NullPointerException("Method name must not be null.");
        }
        for (Method method : methodArr) {
            if (method.getName().equals(str) && a(method.getParameterTypes(), clsArr)) {
                return method;
            }
        }
        return null;
    }

    public static void a(Class<?> cls, String str, Object... objArr) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        a(cls, str, (Class[]) a(objArr)).invoke(null, b(objArr));
    }

    public static void a(String str, String str2, Object... objArr) {
        try {
            a(Class.forName(str), str2, objArr);
        } catch (Exception unused) {
        }
    }

    private static boolean a(Class<?>[] clsArr, Class<?>[] clsArr2) {
        if (clsArr == null) {
            return clsArr2 == null || clsArr2.length == 0;
        }
        if (clsArr2 == null) {
            return clsArr.length == 0;
        }
        if (clsArr.length != clsArr2.length) {
            return false;
        }
        for (int i5 = 0; i5 < clsArr.length; i5++) {
            if (!clsArr[i5].isAssignableFrom(clsArr2[i5])) {
                Map<Class<?>, Class<?>> map = f42312a;
                if (!map.containsKey(clsArr[i5]) || !map.get(clsArr[i5]).equals(map.get(clsArr2[i5]))) {
                    return false;
                }
            }
        }
        return true;
    }

    private static Class<?>[] a(Object... objArr) {
        if (objArr == null || objArr.length <= 0) {
            return null;
        }
        Class<?>[] clsArr = new Class[objArr.length];
        for (int i5 = 0; i5 < objArr.length; i5++) {
            Object obj = objArr[i5];
            if (obj == null || !(obj instanceof a)) {
                clsArr[i5] = obj == null ? null : obj.getClass();
            } else {
                clsArr[i5] = ((a) obj).f42313a;
            }
        }
        return clsArr;
    }
}
