package defpackage;

import java.lang.annotation.Annotation;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public final class wx implements InvocationHandler {
    public final Class a;
    public final Map b;
    public final w5d c;
    public final w5d d;
    public final List e;

    public wx(Class cls, Map map, w5d w5dVar, w5d w5dVar2, List list) {
        this.a = cls;
        this.b = map;
        this.c = w5dVar;
        this.d = w5dVar2;
        this.e = list;
    }

    @Override // java.lang.reflect.InvocationHandler
    public final Object invoke(Object obj, Method method, Object[] objArr) throws IllegalAccessException, InvocationTargetException {
        boolean zL;
        String name = method.getName();
        Class cls = this.a;
        if (name != null) {
            int iHashCode = name.hashCode();
            if (iHashCode != -1776922004) {
                if (iHashCode != 147696667) {
                    if (iHashCode == 1444986633 && name.equals("annotationType")) {
                        return cls;
                    }
                } else if (name.equals("hashCode")) {
                    return Integer.valueOf(((Number) this.d.getValue()).intValue());
                }
            } else if (name.equals("toString")) {
                return (String) this.c.getValue();
            }
        }
        boolean zL2 = g76.L(name, "equals");
        Map map = this.b;
        boolean z = false;
        if (!zL2 || objArr == null || objArr.length != 1) {
            if (map.containsKey(name)) {
                return map.get(name);
            }
            StringBuilder sb = new StringBuilder("Method is not supported: ");
            sb.append(method);
            sb.append(" (args: ");
            if (objArr == null) {
                objArr = new Object[0];
            }
            sb.append(k80.Q0(objArr));
            sb.append(')');
            throw new zb2(sb.toString());
        }
        Object objK0 = k80.K0(objArr);
        Annotation annotation = objK0 instanceof Annotation ? (Annotation) objK0 : null;
        if (g76.L(annotation != null ? vx0.T(vx0.P(annotation)) : null, cls)) {
            List<Method> list = this.e;
            if (list == null || !list.isEmpty()) {
                for (Method method2 : list) {
                    Object obj2 = map.get(method2.getName());
                    Object objInvoke = method2.invoke(objK0, null);
                    if (obj2 instanceof boolean[]) {
                        objInvoke.getClass();
                        zL = Arrays.equals((boolean[]) obj2, (boolean[]) objInvoke);
                    } else if (obj2 instanceof char[]) {
                        objInvoke.getClass();
                        zL = Arrays.equals((char[]) obj2, (char[]) objInvoke);
                    } else if (obj2 instanceof byte[]) {
                        objInvoke.getClass();
                        zL = Arrays.equals((byte[]) obj2, (byte[]) objInvoke);
                    } else if (obj2 instanceof short[]) {
                        objInvoke.getClass();
                        zL = Arrays.equals((short[]) obj2, (short[]) objInvoke);
                    } else if (obj2 instanceof int[]) {
                        objInvoke.getClass();
                        zL = Arrays.equals((int[]) obj2, (int[]) objInvoke);
                    } else if (obj2 instanceof float[]) {
                        objInvoke.getClass();
                        zL = Arrays.equals((float[]) obj2, (float[]) objInvoke);
                    } else if (obj2 instanceof long[]) {
                        objInvoke.getClass();
                        zL = Arrays.equals((long[]) obj2, (long[]) objInvoke);
                    } else if (obj2 instanceof double[]) {
                        objInvoke.getClass();
                        zL = Arrays.equals((double[]) obj2, (double[]) objInvoke);
                    } else if (obj2 instanceof Object[]) {
                        objInvoke.getClass();
                        zL = Arrays.equals((Object[]) obj2, (Object[]) objInvoke);
                    } else {
                        zL = g76.L(obj2, objInvoke);
                    }
                    if (!zL) {
                        break;
                    }
                }
                z = true;
            } else {
                z = true;
            }
        }
        return Boolean.valueOf(z);
    }
}
