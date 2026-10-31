package com.tiktok.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/* loaded from: classes4.dex */
public final class TTReflect {
    private Class<?> mClass;
    private Field mField;
    private Method mMethod;

    private TTReflect() {
    }

    public static Object callMethod(Method method, Object obj, Object... objArr) {
        try {
            return method.invoke(obj, objArr);
        } catch (Throwable unused) {
            return null;
        }
    }

    public static Method getMethod(Class<?> cls, String str, Class<?>... clsArr) {
        try {
            return cls.getMethod(str, clsArr);
        } catch (Throwable unused) {
            return null;
        }
    }

    public static TTReflect on(String str) {
        TTReflect tTReflect = new TTReflect();
        try {
            tTReflect.mClass = Class.forName(str);
        } catch (Throwable unused) {
        }
        return tTReflect;
    }

    public Object call(Object obj, Object... objArr) {
        try {
            this.mMethod.setAccessible(true);
            return this.mMethod.invoke(obj, objArr);
        } catch (Throwable unused) {
            return null;
        }
    }

    public TTReflect findField(String str) {
        try {
            this.mField = this.mClass.getDeclaredField(str);
        } catch (Throwable unused) {
        }
        return this;
    }

    public TTReflect findMethod(String str, Class<?>... clsArr) {
        try {
            this.mMethod = this.mClass.getDeclaredMethod(str, clsArr);
        } catch (Throwable unused) {
        }
        return this;
    }

    public Object getValue(Object obj) {
        try {
            this.mField.setAccessible(true);
            return this.mField.get(obj);
        } catch (Throwable unused) {
            return null;
        }
    }

    public static Method getMethod(String str, String str2, Class<?>... clsArr) {
        try {
            return getMethod(Class.forName(str), str2, clsArr);
        } catch (Throwable unused) {
            return null;
        }
    }

    public static TTReflect on(Class<?> cls) {
        TTReflect tTReflect = new TTReflect();
        tTReflect.mClass = cls;
        return tTReflect;
    }
}
