package defpackage;

import java.lang.annotation.Annotation;
import java.lang.reflect.Array;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class bpe {
    public static final y05 a = new y05("kotlin.jvm.JvmStatic");

    public static final vg6 a(Object obj) {
        vg6 vg6Var = obj instanceof vg6 ? (vg6) obj : null;
        if (vg6Var != null) {
            return vg6Var;
        }
        sh6 sh6VarB = b(obj);
        return sh6VarB != null ? sh6VarB : c(obj);
    }

    public static final sh6 b(Object obj) {
        sh6 sh6Var = obj instanceof sh6 ? (sh6) obj : null;
        if (sh6Var != null) {
            return sh6Var;
        }
        w55 w55Var = obj instanceof w55 ? (w55) obj : null;
        rg6 rg6VarCompute = w55Var != null ? w55Var.compute() : null;
        if (rg6VarCompute instanceof sh6) {
            return (sh6) rg6VarCompute;
        }
        return null;
    }

    public static final mj6 c(Object obj) {
        mj6 mj6Var = obj instanceof mj6 ? (mj6) obj : null;
        if (mj6Var != null) {
            return mj6Var;
        }
        w4a w4aVar = obj instanceof w4a ? (w4a) obj : null;
        rg6 rg6VarCompute = w4aVar != null ? w4aVar.compute() : null;
        if (rg6VarCompute instanceof mj6) {
            return (mj6) rg6VarCompute;
        }
        return null;
    }

    public static final List d(c41 c41Var) {
        Annotation annotationI;
        c41Var.getClass();
        ly<yx> annotations = c41Var.getAnnotations();
        ArrayList arrayList = new ArrayList();
        for (yx yxVar : annotations) {
            jkc jkcVarD = yxVar.d();
            if (jkcVarD instanceof d0b) {
                annotationI = ((d0b) jkcVarD).a;
            } else if (jkcVarD instanceof wmb) {
                u0b u0bVar = ((wmb) jkcVarD).a;
                f0b f0bVar = u0bVar instanceof f0b ? (f0b) u0bVar : null;
                annotationI = f0bVar != null ? f0bVar.a : null;
            } else {
                annotationI = i(yxVar);
            }
            if (annotationI != null) {
                arrayList.add(annotationI);
            }
        }
        return l(arrayList);
    }

    public static final Object e(Type type) {
        if (type instanceof Class) {
            Class cls = (Class) type;
            if (cls.isPrimitive()) {
                if (cls.equals(Boolean.TYPE)) {
                    return Boolean.FALSE;
                }
                if (cls.equals(Character.TYPE)) {
                    return (char) 0;
                }
                if (cls.equals(Byte.TYPE)) {
                    return (byte) 0;
                }
                if (cls.equals(Short.TYPE)) {
                    return (short) 0;
                }
                if (cls.equals(Integer.TYPE)) {
                    return 0;
                }
                if (cls.equals(Float.TYPE)) {
                    return Float.valueOf(0.0f);
                }
                if (cls.equals(Long.TYPE)) {
                    return 0L;
                }
                if (cls.equals(Double.TYPE)) {
                    return Double.valueOf(0.0d);
                }
                if (cls.equals(Void.TYPE)) {
                    ygf.f("Parameter with void type is illegal");
                    return null;
                }
                ywb.i("Unknown primitive: ", type);
            }
        }
        return null;
    }

    public static final c41 f(Class cls, l75 l75Var, p98 p98Var, wjc wjcVar, mr0 mr0Var, b55 b55Var) {
        List list;
        l75Var.getClass();
        p98Var.getClass();
        mr0Var.getClass();
        vmb vmbVarA = z28.a(cls);
        if (l75Var instanceof a6a) {
            list = ((a6a) l75Var).i;
        } else {
            if (!(l75Var instanceof i6a)) {
                ik4.m("Unsupported message: ", l75Var);
                return null;
            }
            list = ((i6a) l75Var).i;
        }
        List list2 = list;
        i93 i93Var = vmbVarA.a;
        b38 b38Var = i93Var.b;
        kse kseVar = kse.b;
        list2.getClass();
        return (c41) b55Var.invoke(new yu7(new sj0(i93Var, p98Var, b38Var, wjcVar, kseVar, mr0Var, null, null, list2)), l75Var);
    }

    public static final boolean g(vj6 vj6Var) {
        ih6 ih6VarR = vj6Var.r();
        dh6 dh6Var = ih6VarR instanceof dh6 ? (dh6) ih6VarR : null;
        if (dh6Var == null || !dh6Var.i()) {
            return false;
        }
        zl6 zl6VarG = dh6Var.G();
        return (zl6VarG != null ? zl6VarG.m : null) == null;
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    public static final Class h(ClassLoader classLoader, mn1 mn1Var, int i) {
        mn1Var.getClass();
        String str = s96.a;
        mn1 mn1VarG = s96.g(mn1Var.a().a);
        if (mn1VarG == null) {
            mn1VarG = mn1Var;
        }
        if (!mn1VarG.equals(mn1Var)) {
            classLoader = e0b.d(c1e.class);
        }
        String str2 = mn1VarG.a.a.a;
        String str3 = mn1VarG.b.a.a;
        if (g76.L(str2, "kotlin")) {
            switch (str3.hashCode()) {
                case -901856463:
                    if (str3.equals("BooleanArray")) {
                        return boolean[].class;
                    }
                    break;
                case -763279523:
                    if (str3.equals("ShortArray")) {
                        return short[].class;
                    }
                    break;
                case -755911549:
                    if (str3.equals("CharArray")) {
                        return char[].class;
                    }
                    break;
                case -74930671:
                    if (str3.equals("ByteArray")) {
                        return byte[].class;
                    }
                    break;
                case 22374632:
                    if (str3.equals("DoubleArray")) {
                        return double[].class;
                    }
                    break;
                case 63537721:
                    if (str3.equals("Array")) {
                        return Object[].class;
                    }
                    break;
                case 601811914:
                    if (str3.equals("IntArray")) {
                        return int[].class;
                    }
                    break;
                case 948852093:
                    if (str3.equals("FloatArray")) {
                        return float[].class;
                    }
                    break;
                case 2104330525:
                    if (str3.equals("LongArray")) {
                        return long[].class;
                    }
                    break;
            }
        }
        StringBuilder sb = new StringBuilder();
        if (i > 0) {
            for (int i2 = 0; i2 < i; i2++) {
                sb.append("[");
            }
            sb.append("L");
        }
        if (str2.length() > 0) {
            sb.append(str2.concat("."));
        }
        sb.append(tuc.K(str3, '.', '$'));
        if (i > 0) {
            sb.append(";");
        }
        try {
            return Class.forName(sb.toString(), false, classLoader);
        } catch (ClassNotFoundException unused) {
            return null;
        }
    }

    public static final Annotation i(yx yxVar) {
        y28 y28VarD = f93.d(yxVar);
        Class clsJ = y28VarD != null ? j(y28VarD) : null;
        if (clsJ == null) {
            clsJ = null;
        }
        if (clsJ == null) {
            return null;
        }
        Set<Map.Entry> setEntrySet = yxVar.f().entrySet();
        ArrayList arrayList = new ArrayList();
        for (Map.Entry entry : setEntrySet) {
            n98 n98Var = (n98) entry.getKey();
            f52 f52Var = (f52) entry.getValue();
            ClassLoader classLoader = clsJ.getClassLoader();
            classLoader.getClass();
            Object objK = k(f52Var, classLoader);
            f09 f09Var = objK != null ? new f09(n98Var.b(), objK) : null;
            if (f09Var != null) {
                arrayList.add(f09Var);
            }
        }
        Map mapV = ei7.V(arrayList);
        Set setKeySet = mapV.keySet();
        ArrayList arrayList2 = new ArrayList(cu1.k0(setKeySet, 10));
        Iterator it2 = setKeySet.iterator();
        while (it2.hasNext()) {
            arrayList2.add(clsJ.getDeclaredMethod((String) it2.next(), null));
        }
        return (Annotation) op8.Q(clsJ, mapV, arrayList2);
    }

    public static final Class j(y28 y28Var) {
        jkc jkcVarD = y28Var.d();
        jkcVarD.getClass();
        if (jkcVarD instanceof hn6) {
            return ((hn6) jkcVarD).a.a;
        }
        if (jkcVarD instanceof wmb) {
            return ((q0b) ((wmb) jkcVarD).a).a;
        }
        mn1 mn1VarF = f93.f(y28Var);
        if (mn1VarF == null) {
            return null;
        }
        return h(e0b.d(y28Var.getClass()), mn1VarF, 0);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final Object k(f52 f52Var, ClassLoader classLoader) {
        Class clsH;
        if (f52Var instanceof jy) {
            return i((yx) ((jy) f52Var).a);
        }
        int i = 0;
        if (f52Var instanceof g80) {
            g80 g80Var = (g80) f52Var;
            rxd rxdVar = g80Var instanceof rxd ? (rxd) g80Var : null;
            if (rxdVar != null) {
                mn6 mn6Var = rxdVar.c;
                Object obj = g80Var.a;
                Iterable iterable = (Iterable) obj;
                ArrayList arrayList = new ArrayList(cu1.k0(iterable, 10));
                Iterator it2 = iterable.iterator();
                while (it2.hasNext()) {
                    arrayList.add(k((f52) it2.next(), classLoader));
                }
                n98 n98Var = vm6.e;
                co1 co1VarA = mn6Var.j0().a();
                x0a x0aVarR = co1VarA == null ? null : vm6.r(co1VarA);
                switch (x0aVarR == null ? -1 : ape.a[x0aVarR.ordinal()]) {
                    case -1:
                        if (!vm6.y(mn6Var)) {
                            lg8.m("Not an array type: ", mn6Var);
                            return null;
                        }
                        mn6 mn6VarB = ((xwd) bu1.a1(mn6Var.h0())).b();
                        mn6VarB.getClass();
                        co1 co1VarA2 = mn6VarB.j0().a();
                        y28 y28Var = co1VarA2 instanceof y28 ? (y28) co1VarA2 : null;
                        if (y28Var == null) {
                            ik4.m("Not a class type: ", mn6VarB);
                            return null;
                        }
                        if (vm6.G(mn6VarB)) {
                            int size = ((List) obj).size();
                            String[] strArr = new String[size];
                            while (i < size) {
                                Object obj2 = arrayList.get(i);
                                obj2.getClass();
                                strArr[i] = obj2;
                                i++;
                            }
                            return strArr;
                        }
                        if (vm6.b(y28Var, lnc.Q)) {
                            int size2 = ((List) obj).size();
                            Class[] clsArr = new Class[size2];
                            while (i < size2) {
                                Object obj3 = arrayList.get(i);
                                obj3.getClass();
                                clsArr[i] = obj3;
                                i++;
                            }
                            return clsArr;
                        }
                        mn1 mn1VarF = f93.f(y28Var);
                        if (mn1VarF != null && (clsH = h(classLoader, mn1VarF, 0)) != null) {
                            Object objNewInstance = Array.newInstance((Class<?>) clsH, ((List) obj).size());
                            objNewInstance.getClass();
                            Object[] objArr = (Object[]) objNewInstance;
                            int size3 = arrayList.size();
                            while (i < size3) {
                                objArr[i] = arrayList.get(i);
                                i++;
                            }
                            return objArr;
                        }
                        break;
                    case 0:
                    default:
                        ygf.a();
                        return null;
                    case 1:
                        int size4 = ((List) obj).size();
                        boolean[] zArr = new boolean[size4];
                        while (i < size4) {
                            Object obj4 = arrayList.get(i);
                            obj4.getClass();
                            zArr[i] = ((Boolean) obj4).booleanValue();
                            i++;
                        }
                        return zArr;
                    case 2:
                        int size5 = ((List) obj).size();
                        char[] cArr = new char[size5];
                        while (i < size5) {
                            Object obj5 = arrayList.get(i);
                            obj5.getClass();
                            cArr[i] = ((Character) obj5).charValue();
                            i++;
                        }
                        return cArr;
                    case 3:
                        int size6 = ((List) obj).size();
                        byte[] bArr = new byte[size6];
                        while (i < size6) {
                            Object obj6 = arrayList.get(i);
                            obj6.getClass();
                            bArr[i] = ((Byte) obj6).byteValue();
                            i++;
                        }
                        return bArr;
                    case 4:
                        int size7 = ((List) obj).size();
                        short[] sArr = new short[size7];
                        while (i < size7) {
                            Object obj7 = arrayList.get(i);
                            obj7.getClass();
                            sArr[i] = ((Short) obj7).shortValue();
                            i++;
                        }
                        return sArr;
                    case 5:
                        int size8 = ((List) obj).size();
                        int[] iArr = new int[size8];
                        while (i < size8) {
                            Object obj8 = arrayList.get(i);
                            obj8.getClass();
                            iArr[i] = ((Integer) obj8).intValue();
                            i++;
                        }
                        return iArr;
                    case 6:
                        int size9 = ((List) obj).size();
                        float[] fArr = new float[size9];
                        while (i < size9) {
                            Object obj9 = arrayList.get(i);
                            obj9.getClass();
                            fArr[i] = ((Float) obj9).floatValue();
                            i++;
                        }
                        return fArr;
                    case 7:
                        int size10 = ((List) obj).size();
                        long[] jArr = new long[size10];
                        while (i < size10) {
                            Object obj10 = arrayList.get(i);
                            obj10.getClass();
                            jArr[i] = ((Long) obj10).longValue();
                            i++;
                        }
                        return jArr;
                    case 8:
                        int size11 = ((List) obj).size();
                        double[] dArr = new double[size11];
                        while (i < size11) {
                            Object obj11 = arrayList.get(i);
                            obj11.getClass();
                            dArr[i] = ((Double) obj11).doubleValue();
                            i++;
                        }
                        return dArr;
                }
            }
        } else if (f52Var instanceof r04) {
            f09 f09Var = (f09) ((r04) f52Var).a;
            mn1 mn1Var = (mn1) f09Var.a;
            n98 n98Var2 = (n98) f09Var.b;
            Class clsH2 = h(classLoader, mn1Var, 0);
            if (clsH2 != null) {
                return Enum.valueOf(clsH2, n98Var2.b());
            }
        } else {
            if (!(f52Var instanceof hh6)) {
                if ((f52Var instanceof m24) || (f52Var instanceof sl8)) {
                    return null;
                }
                return f52Var.b();
            }
            gh6 gh6Var = (gh6) ((hh6) f52Var).a;
            if (gh6Var instanceof fh6) {
                rn1 rn1Var = ((fh6) gh6Var).a;
                return h(classLoader, rn1Var.a, rn1Var.b);
            }
            if (!(gh6Var instanceof eh6)) {
                ygf.a();
                return null;
            }
            co1 co1VarA3 = ((eh6) gh6Var).a.j0().a();
            y28 y28Var2 = co1VarA3 instanceof y28 ? (y28) co1VarA3 : null;
            if (y28Var2 != null) {
                return j(y28Var2);
            }
        }
        return null;
    }

    public static final List l(ArrayList arrayList) throws IllegalAccessException, InvocationTargetException {
        List listQ;
        if (!arrayList.isEmpty()) {
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                if (vx0.T(vx0.P((Annotation) it2.next())).getSimpleName().equals("Container")) {
                    ArrayList arrayList2 = new ArrayList();
                    Iterator it3 = arrayList.iterator();
                    while (it3.hasNext()) {
                        Annotation annotation = (Annotation) it3.next();
                        Class clsT = vx0.T(vx0.P(annotation));
                        if (!clsT.getSimpleName().equals("Container") || clsT.getAnnotation(x4b.class) == null) {
                            listQ = d46.Q(annotation);
                        } else {
                            Object objInvoke = clsT.getDeclaredMethod("value", null).invoke(annotation, null);
                            objInvoke.getClass();
                            listQ = Arrays.asList((Annotation[]) objInvoke);
                            listQ.getClass();
                        }
                        bu1.n0(listQ, arrayList2);
                    }
                    return arrayList2;
                }
            }
        }
        return arrayList;
    }
}
