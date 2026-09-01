package defpackage;

import androidx.fragment.app.Fragment$InstantiationException;
import java.lang.reflect.InvocationTargetException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w15 {
    public static final aec b = new aec(0);
    public final /* synthetic */ f25 a;

    public w15(f25 f25Var) {
        this.a = f25Var;
    }

    public static Class b(String str, ClassLoader classLoader) throws ClassNotFoundException {
        aec aecVar = b;
        aec aecVar2 = (aec) aecVar.get(classLoader);
        if (aecVar2 == null) {
            aecVar2 = new aec(0);
            aecVar.put(classLoader, aecVar2);
        }
        Class cls = (Class) aecVar2.get(str);
        if (cls != null) {
            return cls;
        }
        Class<?> cls2 = Class.forName(str, false, classLoader);
        aecVar2.put(str, cls2);
        return cls2;
    }

    public static Class c(String str, ClassLoader classLoader) {
        try {
            return b(str, classLoader);
        } catch (ClassCastException e) {
            throw new Fragment$InstantiationException(ev6.x("Unable to instantiate fragment ", str, ": make sure class is a valid subclass of Fragment"), e);
        } catch (ClassNotFoundException e2) {
            throw new Fragment$InstantiationException(ev6.x("Unable to instantiate fragment ", str, ": make sure class name exists"), e2);
        }
    }

    public final j15 a(String str) {
        try {
            return (j15) c(str, this.a.v.w.getClassLoader()).getConstructor(null).newInstance(null);
        } catch (IllegalAccessException e) {
            throw new Fragment$InstantiationException(ev6.x("Unable to instantiate fragment ", str, ": make sure class name exists, is public, and has an empty constructor that is public"), e);
        } catch (InstantiationException e2) {
            throw new Fragment$InstantiationException(ev6.x("Unable to instantiate fragment ", str, ": make sure class name exists, is public, and has an empty constructor that is public"), e2);
        } catch (NoSuchMethodException e3) {
            throw new Fragment$InstantiationException(ev6.x("Unable to instantiate fragment ", str, ": could not find Fragment constructor"), e3);
        } catch (InvocationTargetException e4) {
            throw new Fragment$InstantiationException(ev6.x("Unable to instantiate fragment ", str, ": calling Fragment constructor caused an exception"), e4);
        }
    }
}
