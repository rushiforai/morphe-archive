package androidx.fragment.app;

import java.lang.reflect.InvocationTargetException;

/* loaded from: classes.dex */
public abstract class r0 {
    private static final z.c1 sClassCacheMap = new z.c1(0);

    public static Class a(ClassLoader classLoader, String str) throws ClassNotFoundException {
        z.c1 c1Var = sClassCacheMap;
        z.c1 c1Var2 = (z.c1) c1Var.get(classLoader);
        if (c1Var2 == null) {
            c1Var2 = new z.c1(0);
            c1Var.put(classLoader, c1Var2);
        }
        Class cls = (Class) c1Var2.get(str);
        if (cls != null) {
            return cls;
        }
        Class<?> cls2 = Class.forName(str, false, classLoader);
        c1Var2.put(str, cls2);
        return cls2;
    }

    public static boolean isFragmentClass(ClassLoader classLoader, String str) {
        try {
            return h0.class.isAssignableFrom(a(classLoader, str));
        } catch (ClassNotFoundException unused) {
            return false;
        }
    }

    public static Class<? extends h0> loadFragmentClass(ClassLoader classLoader, String str) {
        try {
            return a(classLoader, str);
        } catch (ClassCastException e3) {
            throw new Fragment$InstantiationException(b.c0.l("Unable to instantiate fragment ", str, ": make sure class is a valid subclass of Fragment"), e3);
        } catch (ClassNotFoundException e11) {
            throw new Fragment$InstantiationException(b.c0.l("Unable to instantiate fragment ", str, ": make sure class name exists"), e11);
        }
    }

    public h0 instantiate(ClassLoader classLoader, String str) {
        try {
            return loadFragmentClass(classLoader, str).getConstructor(null).newInstance(null);
        } catch (IllegalAccessException e3) {
            throw new Fragment$InstantiationException(b.c0.l("Unable to instantiate fragment ", str, ": make sure class name exists, is public, and has an empty constructor that is public"), e3);
        } catch (InstantiationException e11) {
            throw new Fragment$InstantiationException(b.c0.l("Unable to instantiate fragment ", str, ": make sure class name exists, is public, and has an empty constructor that is public"), e11);
        } catch (NoSuchMethodException e12) {
            throw new Fragment$InstantiationException(b.c0.l("Unable to instantiate fragment ", str, ": could not find Fragment constructor"), e12);
        } catch (InvocationTargetException e13) {
            throw new Fragment$InstantiationException(b.c0.l("Unable to instantiate fragment ", str, ": calling Fragment constructor caused an exception"), e13);
        }
    }
}
