package defpackage;

import java.lang.annotation.Annotation;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class f0b extends u0b {
    public final Annotation a;

    public f0b(Annotation annotation) {
        annotation.getClass();
        this.a = annotation;
    }

    public final ArrayList b() throws IllegalAccessException, InvocationTargetException {
        Annotation annotation = this.a;
        Method[] declaredMethods = vx0.T(vx0.P(annotation)).getDeclaredMethods();
        declaredMethods.getClass();
        ArrayList arrayList = new ArrayList(declaredMethods.length);
        for (Method method : declaredMethods) {
            Object objInvoke = method.invoke(annotation, null);
            objInvoke.getClass();
            n98 n98VarE = n98.e(method.getName());
            Class<?> cls = objInvoke.getClass();
            List list = e0b.a;
            arrayList.add(Enum.class.isAssignableFrom(cls) ? new v0b(n98VarE, (Enum) objInvoke) : objInvoke instanceof Annotation ? new h0b(n98VarE, (Annotation) objInvoke) : objInvoke instanceof Object[] ? new i0b(n98VarE, (Object[]) objInvoke) : objInvoke instanceof Class ? new r0b(n98VarE, (Class) objInvoke) : new x0b(n98VarE, objInvoke));
        }
        return arrayList;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof f0b) {
            return this.a == ((f0b) obj).a;
        }
        return false;
    }

    public final int hashCode() {
        return System.identityHashCode(this.a);
    }

    public final String toString() {
        return f0b.class.getName() + ": " + this.a;
    }
}
