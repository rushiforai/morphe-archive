package defpackage;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Member;
import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class c1b extends y0b {
    public final Object a;

    public c1b(Object obj) {
        obj.getClass();
        this.a = obj;
    }

    @Override // defpackage.y0b
    public final Member b() throws IllegalAccessException, InvocationTargetException {
        Object obj = this.a;
        obj.getClass();
        hx4 hx4Var = wgf.F;
        Method method = null;
        if (hx4Var == null) {
            Class<?> cls = obj.getClass();
            int i = 8;
            try {
                hx4Var = new hx4(cls.getMethod("getType", null), i, cls.getMethod("getAccessor", null));
            } catch (NoSuchMethodException unused) {
                hx4Var = new hx4(method, i, method);
            }
            wgf.F = hx4Var;
        }
        Method method2 = (Method) hx4Var.c;
        if (method2 != null) {
            Object objInvoke = method2.invoke(obj, null);
            objInvoke.getClass();
            method = (Method) objInvoke;
        }
        if (method != null) {
            return method;
        }
        throw new NoSuchMethodError("Can't find `getAccessor` method");
    }

    public final d1b f() throws IllegalAccessException, InvocationTargetException {
        Object obj = this.a;
        obj.getClass();
        hx4 hx4Var = wgf.F;
        Class cls = null;
        if (hx4Var == null) {
            Class<?> cls2 = obj.getClass();
            int i = 8;
            try {
                hx4Var = new hx4(cls2.getMethod("getType", null), i, cls2.getMethod("getAccessor", null));
            } catch (NoSuchMethodException unused) {
                hx4Var = new hx4(cls, i, cls);
            }
            wgf.F = hx4Var;
        }
        Method method = (Method) hx4Var.b;
        if (method != null) {
            Object objInvoke = method.invoke(obj, null);
            objInvoke.getClass();
            cls = (Class) objInvoke;
        }
        if (cls != null) {
            return new s0b(cls);
        }
        throw new NoSuchMethodError("Can't find `getType` method");
    }
}
