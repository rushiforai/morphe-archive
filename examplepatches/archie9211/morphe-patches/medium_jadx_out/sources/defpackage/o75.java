package defpackage;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class o75 {
    public final q1 a;
    public final Object b;
    public final q1 c;
    public final m75 d;
    public final Method e;

    public o75(q1 q1Var, Object obj, q1 q1Var2, m75 m75Var, Class cls) {
        if (q1Var == null) {
            ay0.e("Null containingTypeDefaultInstance");
            throw null;
        }
        if (m75Var.b == k6f.MESSAGE && q1Var2 == null) {
            ay0.e("Null messageDefaultInstance");
            throw null;
        }
        this.a = q1Var;
        this.b = obj;
        this.c = q1Var2;
        this.d = m75Var;
        if (!o56.class.isAssignableFrom(cls)) {
            this.e = null;
            return;
        }
        try {
            this.e = cls.getMethod("valueOf", Integer.TYPE);
        } catch (NoSuchMethodException e) {
            String name = cls.getName();
            lg8.p(y30.s(new StringBuilder(name.length() + 52), "Generated message class \"", name, "\" missing method \"valueOf\"."), e);
            throw null;
        }
    }

    public final Object a(Object obj) {
        if (this.d.b.getJavaType() == n6f.ENUM) {
            Object[] objArr = {(Integer) obj};
            obj = null;
            try {
                return this.e.invoke(null, objArr);
            } catch (IllegalAccessException e) {
                lg8.p("Couldn't use Java reflection to implement protocol message reflection.", e);
            } catch (InvocationTargetException e2) {
                Throwable cause = e2.getCause();
                if (cause instanceof RuntimeException) {
                    throw ((RuntimeException) cause);
                }
                if (cause instanceof Error) {
                    throw ((Error) cause);
                }
                lg8.p("Unexpected exception thrown by generated accessor method.", cause);
                return null;
            }
        }
        return obj;
    }

    public final Object b(Object obj) {
        return this.d.b.getJavaType() == n6f.ENUM ? Integer.valueOf(((o56) obj).getNumber()) : obj;
    }
}
