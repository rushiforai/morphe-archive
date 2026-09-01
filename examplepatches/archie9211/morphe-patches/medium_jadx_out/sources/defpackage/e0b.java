package defpackage;

import com.medium.android.core.fragments.KB.JWcjNoweKCnTr;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class e0b {
    public static final List a;
    public static final Map b;
    public static final Map c;
    public static final Map d;

    static {
        s1b s1bVar = n1b.a;
        int i = 0;
        List<wg6> listR = d46.R(s1bVar.b(Boolean.TYPE), s1bVar.b(Byte.TYPE), s1bVar.b(Character.TYPE), s1bVar.b(Double.TYPE), s1bVar.b(Float.TYPE), s1bVar.b(Integer.TYPE), s1bVar.b(Long.TYPE), s1bVar.b(Short.TYPE));
        a = listR;
        ArrayList arrayList = new ArrayList(cu1.k0(listR, 10));
        for (wg6 wg6Var : listR) {
            arrayList.add(new f09(vx0.U(wg6Var), vx0.V(wg6Var)));
        }
        b = ei7.V(arrayList);
        List<wg6> list = a;
        ArrayList arrayList2 = new ArrayList(cu1.k0(list, 10));
        for (wg6 wg6Var2 : list) {
            arrayList2.add(new f09(vx0.V(wg6Var2), vx0.U(wg6Var2)));
        }
        c = ei7.V(arrayList2);
        List listR2 = d46.R(m45.class, x45.class, b55.class, c55.class, d55.class, e55.class, f55.class, g55.class, h55.class, i55.class, n45.class, o45.class, p45.class, q45.class, r45.class, s45.class, t45.class, u45.class, v45.class, w45.class, y45.class, z45.class, a55.class);
        ArrayList arrayList3 = new ArrayList(cu1.k0(listR2, 10));
        for (Object obj : listR2) {
            int i2 = i + 1;
            if (i < 0) {
                d46.i0();
                throw null;
            }
            arrayList3.add(new f09((Class) obj, Integer.valueOf(i)));
            i = i2;
        }
        d = ei7.V(arrayList3);
    }

    public static final mn1 a(Class cls) {
        cls.getClass();
        if (cls.isPrimitive()) {
            ik4.h("Can't compute ClassId for primitive type: ", cls);
            return null;
        }
        if (cls.isArray()) {
            ik4.h("Can't compute ClassId for array type: ", cls);
            return null;
        }
        if (cls.getEnclosingMethod() != null || cls.getEnclosingConstructor() != null || cls.getSimpleName().length() == 0) {
            y05 y05Var = new y05(cls.getName());
            return new mn1(y05Var.b(), sgg.b0(y05Var.a.g()), true);
        }
        Class<?> declaringClass = cls.getDeclaringClass();
        if (declaringClass != null) {
            return a(declaringClass).d(n98.e(cls.getSimpleName()));
        }
        y05 y05Var2 = new y05(cls.getName());
        return new mn1(y05Var2.b(), y05Var2.a.g());
    }

    public static final List c(Type type) {
        type.getClass();
        if (!(type instanceof ParameterizedType)) {
            return ey3.a;
        }
        ParameterizedType parameterizedType = (ParameterizedType) type;
        if (parameterizedType.getOwnerType() != null) {
            return szb.O0(new ym4(szb.K0(type, p79.g), p79.h, uzb.a));
        }
        Type[] actualTypeArguments = parameterizedType.getActualTypeArguments();
        actualTypeArguments.getClass();
        return k80.Q0(actualTypeArguments);
    }

    public static final ClassLoader d(Class cls) {
        cls.getClass();
        ClassLoader classLoader = cls.getClassLoader();
        if (classLoader != null) {
            return classLoader;
        }
        ClassLoader systemClassLoader = ClassLoader.getSystemClassLoader();
        systemClassLoader.getClass();
        return systemClassLoader;
    }

    public static final String b(Class cls) {
        cls.getClass();
        if (cls.isPrimitive()) {
            String name = cls.getName();
            switch (name.hashCode()) {
                case -1325958191:
                    if (name.equals("double")) {
                        return "D";
                    }
                    break;
                case 104431:
                    if (name.equals("int")) {
                        return "I";
                    }
                    break;
                case 3039496:
                    if (name.equals("byte")) {
                        return "B";
                    }
                    break;
                case 3052374:
                    if (name.equals("char")) {
                        return "C";
                    }
                    break;
                case 3327612:
                    if (name.equals("long")) {
                        return "J";
                    }
                    break;
                case 3625364:
                    if (name.equals("void")) {
                        return "V";
                    }
                    break;
                case 64711720:
                    if (name.equals("boolean")) {
                        return "Z";
                    }
                    break;
                case 97526364:
                    if (name.equals(JWcjNoweKCnTr.aAAuREeT)) {
                        return "F";
                    }
                    break;
                case 109413500:
                    if (name.equals("short")) {
                        return "S";
                    }
                    break;
            }
            ik4.h("Unsupported primitive type: ", cls);
            return null;
        }
        if (cls.isArray()) {
            String strReplace = cls.getName().replace('.', '/');
            strReplace.getClass();
            return strReplace;
        }
        StringBuilder sb = new StringBuilder("L");
        String strReplace2 = cls.getName().replace('.', '/');
        strReplace2.getClass();
        sb.append(strReplace2);
        sb.append(';');
        return sb.toString();
    }
}
