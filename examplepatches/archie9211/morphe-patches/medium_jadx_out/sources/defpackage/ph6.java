package defpackage;

import java.lang.reflect.Array;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class ph6 implements ym1 {
    public static final x2b a = new x2b("<v#(\\d+)>");

    public static Method B(Class cls, String str, Class[] clsArr, Class cls2) {
        try {
            Method declaredMethod = cls.getDeclaredMethod(str, (Class[]) Arrays.copyOf(clsArr, clsArr.length));
            if (g76.L(declaredMethod.getReturnType(), cls2)) {
                return declaredMethod;
            }
            Method[] declaredMethods = cls.getDeclaredMethods();
            declaredMethods.getClass();
            for (Method method : declaredMethods) {
                if (g76.L(method.getName(), str) && g76.L(method.getReturnType(), cls2) && Arrays.equals(method.getParameterTypes(), clsArr)) {
                    return method;
                }
            }
            return null;
        } catch (NoSuchMethodException unused) {
            return null;
        }
    }

    public static void f(ArrayList arrayList, ArrayList arrayList2, boolean z) {
        Class cls;
        cls = gy2.class;
        boolean zL = g76.L(bu1.I0(arrayList2), cls);
        List listSubList = arrayList2;
        if (zL) {
            listSubList = arrayList2.subList(0, arrayList2.size() - 1);
        }
        arrayList.addAll(listSubList);
        int size = (listSubList.size() + 31) / 32;
        for (int i = 0; i < size; i++) {
            Class cls2 = Integer.TYPE;
            cls2.getClass();
            arrayList.add(cls2);
        }
        arrayList.add(z ? gy2.class : Object.class);
    }

    public static Method y(Class cls, String str, Class[] clsArr, Class cls2, boolean z) {
        Method methodY;
        if (z) {
            clsArr[0] = cls;
        }
        Method methodB = B(cls, str, clsArr, cls2);
        if (methodB != null) {
            return methodB;
        }
        Class superclass = cls.getSuperclass();
        if (superclass != null && (methodY = y(superclass, str, clsArr, cls2, z)) != null) {
            return methodY;
        }
        Class<?>[] interfaces = cls.getInterfaces();
        interfaces.getClass();
        int length = interfaces.length;
        int i = 0;
        while (true) {
            Class<?> cls3 = null;
            if (i >= length) {
                return null;
            }
            Class<?> cls4 = interfaces[i];
            cls4.getClass();
            Method methodY2 = y(cls4, str, clsArr, cls2, z);
            if (methodY2 != null) {
                return methodY2;
            }
            if (z) {
                try {
                    cls3 = Class.forName(cls4.getName().concat("$DefaultImpls"), false, e0b.d(cls4));
                } catch (ClassNotFoundException unused) {
                }
                if (cls3 != null) {
                    clsArr[0] = cls4;
                    Method methodB2 = B(cls3, str, clsArr, cls2);
                    if (methodB2 != null) {
                        return methodB2;
                    }
                } else {
                    continue;
                }
            }
            i++;
        }
    }

    public final Class A(int i, int i2, String str) throws ClassNotFoundException {
        char cCharAt = str.charAt(i);
        if (cCharAt == 'F') {
            return Float.TYPE;
        }
        if (cCharAt == 'L') {
            ClassLoader classLoaderD = e0b.d(e());
            String strReplace = str.substring(i + 1, i2 - 1).replace('/', '.');
            strReplace.getClass();
            Class<?> clsLoadClass = classLoaderD.loadClass(strReplace);
            clsLoadClass.getClass();
            return clsLoadClass;
        }
        if (cCharAt == 'S') {
            return Short.TYPE;
        }
        if (cCharAt == 'V') {
            Class cls = Void.TYPE;
            cls.getClass();
            return cls;
        }
        if (cCharAt == 'I') {
            return Integer.TYPE;
        }
        if (cCharAt == 'J') {
            return Long.TYPE;
        }
        if (cCharAt == 'Z') {
            return Boolean.TYPE;
        }
        if (cCharAt == '[') {
            Class clsA = A(i + 1, i2, str);
            y05 y05Var = bpe.a;
            clsA.getClass();
            return Array.newInstance((Class<?>) clsA, 0).getClass();
        }
        switch (cCharAt) {
            case 'B':
                return Byte.TYPE;
            case 'C':
                return Character.TYPE;
            case 'D':
                return Double.TYPE;
            default:
                throw new zb2("Unknown type prefix in the method signature: ".concat(str));
        }
    }

    public final Method k(String str, String str2, boolean z) {
        str.getClass();
        str2.getClass();
        if (str.equals("<init>")) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        if (z) {
            arrayList.add(e());
        }
        gg5 gg5VarZ = z(str2, true);
        f(arrayList, (ArrayList) gg5VarZ.b, false);
        Class clsW = w();
        String strConcat = str.concat("$default");
        Class[] clsArr = (Class[]) arrayList.toArray(new Class[0]);
        Class cls = (Class) gg5VarZ.c;
        cls.getClass();
        return y(clsW, strConcat, clsArr, cls, z);
    }

    public final Method p(String str, String str2) {
        Method methodY;
        str.getClass();
        str2.getClass();
        if (str.equals("<init>")) {
            return null;
        }
        gg5 gg5VarZ = z(str2, true);
        Class[] clsArr = (Class[]) ((ArrayList) gg5VarZ.b).toArray(new Class[0]);
        Class cls = (Class) gg5VarZ.c;
        cls.getClass();
        Method methodY2 = y(w(), str, clsArr, cls, false);
        if (methodY2 != null) {
            return methodY2;
        }
        if (!w().isInterface() || (methodY = y(Object.class, str, clsArr, cls, false)) == null) {
            return null;
        }
        return methodY;
    }

    public abstract Collection q();

    public abstract Collection s(n98 n98Var);

    public abstract q4a u(int i);

    /* JADX WARN: Removed duplicated region for block: B:12:0x004c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.util.List v(defpackage.ev7 r7, defpackage.nh6 r8) {
        /*
            r6 = this;
            r7.getClass()
            r8.getClass()
            oh6 r0 = new oh6
            r1 = 24
            r0.<init>(r1, r6)
            r6 = 3
            r1 = 0
            java.util.Collection r6 = defpackage.qo7.o(r7, r1, r6)
            java.lang.Iterable r6 = (java.lang.Iterable) r6
            java.util.ArrayList r7 = new java.util.ArrayList
            r7.<init>()
            java.util.Iterator r6 = r6.iterator()
        L1e:
            boolean r2 = r6.hasNext()
            if (r2 == 0) goto L53
            java.lang.Object r2 = r6.next()
            yv2 r2 = (defpackage.yv2) r2
            boolean r3 = r2 instanceof defpackage.f41
            if (r3 == 0) goto L4c
            r3 = r2
            f41 r3 = (defpackage.f41) r3
            g93 r4 = r3.getVisibility()
            g93 r5 = defpackage.h93.h
            boolean r4 = defpackage.g76.L(r4, r5)
            if (r4 != 0) goto L4c
            boolean r3 = r8.accept(r3)
            if (r3 == 0) goto L4c
            c1e r3 = defpackage.c1e.a
            java.lang.Object r2 = r2.F(r0, r3)
            vg6 r2 = (defpackage.vg6) r2
            goto L4d
        L4c:
            r2 = r1
        L4d:
            if (r2 == 0) goto L1e
            r7.add(r2)
            goto L1e
        L53:
            java.util.List r6 = defpackage.bu1.m1(r7)
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ph6.v(ev7, nh6):java.util.List");
    }

    public Class w() {
        Class clsE = e();
        List list = e0b.a;
        clsE.getClass();
        Class cls = (Class) e0b.c.get(clsE);
        return cls == null ? e() : cls;
    }

    public abstract Collection x(n98 n98Var);

    public final gg5 z(String str, boolean z) {
        int iY;
        ArrayList arrayList = new ArrayList();
        int i = 1;
        while (str.charAt(i) != ')') {
            int i2 = i;
            while (str.charAt(i2) == '[') {
                i2++;
            }
            char cCharAt = str.charAt(i2);
            if (muc.R("VZCBSIFJD", cCharAt)) {
                iY = i2 + 1;
            } else {
                if (cCharAt != 'L') {
                    throw new zb2("Unknown type prefix in the method signature: ".concat(str));
                }
                iY = muc.Y(str, ';', i, 4) + 1;
            }
            arrayList.add(A(i, iY, str));
            i = iY;
        }
        return new gg5(arrayList, 6, z ? A(i + 1, str.length(), str) : null);
    }
}
