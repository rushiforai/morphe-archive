package defpackage;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.TypeVariable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class q0b extends u0b implements o86, s86, x96 {
    public final Class a;

    public q0b(Class cls) {
        this.a = cls;
    }

    @Override // defpackage.o86
    public final f0b a(y05 y05Var) {
        y05Var.getClass();
        Annotation[] declaredAnnotations = this.a.getDeclaredAnnotations();
        if (declaredAnnotations != null) {
            return vn7.w(declaredAnnotations, y05Var);
        }
        return null;
    }

    public final List b() {
        Field[] declaredFields = this.a.getDeclaredFields();
        declaredFields.getClass();
        return szb.O0(new srd(new zh4(k80.b0(declaredFields), false, n0b.a), o0b.a));
    }

    public final y05 c() {
        return e0b.a(this.a).a();
    }

    public final List d() {
        Method[] declaredMethods = this.a.getDeclaredMethods();
        declaredMethods.getClass();
        return szb.O0(new srd(new zh4(k80.b0(declaredMethods), true, new k0b(0, this)), p0b.a));
    }

    public final n98 e() {
        Class cls = this.a;
        if (!cls.isAnonymousClass()) {
            return n98.e(cls.getSimpleName());
        }
        String name = cls.getName();
        int iE0 = muc.e0(name, 0, 6, ".");
        if (iE0 != -1) {
            name = name.substring(1 + iE0, name.length());
        }
        return n98.e(name);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof q0b) {
            return this.a.equals(((q0b) obj).a);
        }
        return false;
    }

    public final ArrayList f() {
        n0c n0cVar = pxf.Q;
        if (n0cVar == null) {
            try {
                n0cVar = new n0c(Class.class.getMethod("isSealed", null), Class.class.getMethod("getPermittedSubclasses", null), Class.class.getMethod("isRecord", null), Class.class.getMethod("getRecordComponents", null), 20);
            } catch (NoSuchMethodException unused) {
                n0cVar = new n0c(objArr, objArr, objArr, objArr, 20);
            }
            pxf.Q = n0cVar;
        }
        Method method = (Method) n0cVar.e;
        objArr = method != null ? (Object[]) method.invoke(this.a, null) : null;
        if (objArr == null) {
            objArr = new Object[0];
        }
        ArrayList arrayList = new ArrayList(objArr.length);
        for (Object obj : objArr) {
            arrayList.add(new c1b(obj));
        }
        return arrayList;
    }

    public final boolean g() throws IllegalAccessException, InvocationTargetException {
        n0c n0cVar = pxf.Q;
        Boolean bool = null;
        if (n0cVar == null) {
            try {
                n0cVar = new n0c(Class.class.getMethod("isSealed", null), Class.class.getMethod("getPermittedSubclasses", null), Class.class.getMethod("isRecord", null), Class.class.getMethod("getRecordComponents", null), 20);
            } catch (NoSuchMethodException unused) {
                n0cVar = new n0c(bool, bool, bool, bool, 20);
            }
            pxf.Q = n0cVar;
        }
        Method method = (Method) n0cVar.d;
        if (method != null) {
            Object objInvoke = method.invoke(this.a, null);
            objInvoke.getClass();
            bool = (Boolean) objInvoke;
        }
        if (bool != null) {
            return bool.booleanValue();
        }
        return false;
    }

    @Override // defpackage.o86
    public final Collection getAnnotations() {
        Annotation[] declaredAnnotations = this.a.getDeclaredAnnotations();
        return declaredAnnotations != null ? vn7.y(declaredAnnotations) : ey3.a;
    }

    @Override // defpackage.x96
    public final ArrayList getTypeParameters() {
        TypeVariable[] typeParameters = this.a.getTypeParameters();
        typeParameters.getClass();
        ArrayList arrayList = new ArrayList(typeParameters.length);
        for (TypeVariable typeVariable : typeParameters) {
            arrayList.add(new e1b(typeVariable));
        }
        return arrayList;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return q0b.class.getName() + ": " + this.a;
    }
}
