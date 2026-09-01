package defpackage;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v1b extends to7 {
    public final Method e = Class.class.getMethod("isRecord", null);
    public final Method f = Class.class.getMethod("getRecordComponents", null);
    public final Method g;
    public final Method h;

    public v1b() throws ClassNotFoundException {
        Class<?> cls = Class.forName("java.lang.reflect.RecordComponent");
        this.g = cls.getMethod("getName", null);
        this.h = cls.getMethod("getType", null);
    }

    @Override // defpackage.to7
    public final Method k(Class cls, Field field) {
        try {
            return cls.getMethod(field.getName(), null);
        } catch (ReflectiveOperationException e) {
            lg8.p("Unexpected ReflectiveOperationException occurred (Gson 2.14.0). To support Java records, reflection is utilized to read out information about records. All these invocations happens after it is established that records exist in the JVM. This exception is unexpected behavior.", e);
            return null;
        }
    }

    @Override // defpackage.to7
    public final Constructor l(Class cls) {
        try {
            Object[] objArr = (Object[]) this.f.invoke(cls, null);
            Class<?>[] clsArr = new Class[objArr.length];
            for (int i = 0; i < objArr.length; i++) {
                clsArr[i] = (Class) this.h.invoke(objArr[i], null);
            }
            return cls.getDeclaredConstructor(clsArr);
        } catch (ReflectiveOperationException e) {
            lg8.p("Unexpected ReflectiveOperationException occurred (Gson 2.14.0). To support Java records, reflection is utilized to read out information about records. All these invocations happens after it is established that records exist in the JVM. This exception is unexpected behavior.", e);
            return null;
        }
    }

    @Override // defpackage.to7
    public final String[] n(Class cls) {
        try {
            Object[] objArr = (Object[]) this.f.invoke(cls, null);
            String[] strArr = new String[objArr.length];
            for (int i = 0; i < objArr.length; i++) {
                strArr[i] = (String) this.g.invoke(objArr[i], null);
            }
            return strArr;
        } catch (ReflectiveOperationException e) {
            lg8.p("Unexpected ReflectiveOperationException occurred (Gson 2.14.0). To support Java records, reflection is utilized to read out information about records. All these invocations happens after it is established that records exist in the JVM. This exception is unexpected behavior.", e);
            return null;
        }
    }

    @Override // defpackage.to7
    public final boolean o(Class cls) {
        try {
            return ((Boolean) this.e.invoke(cls, null)).booleanValue();
        } catch (ReflectiveOperationException e) {
            lg8.p("Unexpected ReflectiveOperationException occurred (Gson 2.14.0). To support Java records, reflection is utilized to read out information about records. All these invocations happens after it is established that records exist in the JVM. This exception is unexpected behavior.", e);
            return false;
        }
    }
}
