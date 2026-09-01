package defpackage;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class un1 implements wg6, ym1 {
    public static final Map b;
    public final Class a;

    static {
        int i = 0;
        List listR = d46.R(m45.class, x45.class, b55.class, c55.class, d55.class, e55.class, f55.class, g55.class, h55.class, i55.class, n45.class, o45.class, p45.class, q45.class, r45.class, s45.class, t45.class, u45.class, v45.class, w45.class, y45.class, z45.class, a55.class);
        ArrayList arrayList = new ArrayList(cu1.k0(listR, 10));
        for (Object obj : listR) {
            int i2 = i + 1;
            if (i < 0) {
                d46.i0();
                throw null;
            }
            arrayList.add(new f09((Class) obj, Integer.valueOf(i)));
            i = i2;
        }
        b = ei7.V(arrayList);
    }

    public un1(Class cls) {
        cls.getClass();
        this.a = cls;
    }

    public static void a() {
        throw new in6();
    }

    @Override // defpackage.wg6
    public final String d() {
        String strC;
        Class cls = this.a;
        cls.getClass();
        String strConcat = null;
        if (cls.isAnonymousClass() || cls.isLocalClass()) {
            return null;
        }
        if (!cls.isArray()) {
            String strC2 = gx1.C(cls.getName());
            return strC2 == null ? cls.getCanonicalName() : strC2;
        }
        Class<?> componentType = cls.getComponentType();
        if (componentType.isPrimitive() && (strC = gx1.C(componentType.getName())) != null) {
            strConcat = strC.concat("Array");
        }
        return strConcat == null ? "kotlin.Array" : strConcat;
    }

    @Override // defpackage.ym1
    public final Class e() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof un1) && vx0.U(this).equals(vx0.U((wg6) obj));
    }

    @Override // defpackage.wg6
    public final boolean g() {
        a();
        throw null;
    }

    @Override // defpackage.qg6
    public final List getAnnotations() {
        a();
        throw null;
    }

    @Override // defpackage.wg6
    public final List getTypeParameters() {
        a();
        throw null;
    }

    @Override // defpackage.wg6
    public final int hashCode() {
        return vx0.U(this).hashCode();
    }

    @Override // defpackage.wg6
    public final boolean i() {
        a();
        throw null;
    }

    @Override // defpackage.wg6
    public final boolean isAbstract() {
        a();
        throw null;
    }

    @Override // defpackage.wg6
    public final String j() {
        String strB0;
        Class cls = this.a;
        cls.getClass();
        String strConcat = null;
        if (cls.isAnonymousClass()) {
            return null;
        }
        if (!cls.isLocalClass()) {
            if (!cls.isArray()) {
                String strB02 = gx1.b0(cls.getName());
                return strB02 == null ? cls.getSimpleName() : strB02;
            }
            Class<?> componentType = cls.getComponentType();
            if (componentType.isPrimitive() && (strB0 = gx1.b0(componentType.getName())) != null) {
                strConcat = strB0.concat("Array");
            }
            return strConcat == null ? "Array" : strConcat;
        }
        String simpleName = cls.getSimpleName();
        Method enclosingMethod = cls.getEnclosingMethod();
        if (enclosingMethod != null) {
            return muc.s0(simpleName, enclosingMethod.getName() + '$', simpleName);
        }
        Constructor<?> enclosingConstructor = cls.getEnclosingConstructor();
        if (enclosingConstructor == null) {
            int iY = muc.Y(simpleName, '$', 0, 6);
            return iY == -1 ? simpleName : simpleName.substring(iY + 1, simpleName.length());
        }
        return muc.s0(simpleName, enclosingConstructor.getName() + '$', simpleName);
    }

    @Override // defpackage.wg6
    public final Object l() {
        a();
        throw null;
    }

    @Override // defpackage.wg6
    public final boolean n() {
        a();
        throw null;
    }

    @Override // defpackage.wg6
    public final boolean t(Object obj) {
        Class clsU = this.a;
        clsU.getClass();
        Map map = b;
        map.getClass();
        Integer num = (Integer) map.get(clsU);
        if (num != null) {
            return pwd.S(num.intValue(), obj);
        }
        if (clsU.isPrimitive()) {
            clsU = vx0.U(n1b.a.b(clsU));
        }
        return clsU.isInstance(obj);
    }

    public final String toString() {
        return this.a.toString() + " (Kotlin reflection is not available)";
    }
}
