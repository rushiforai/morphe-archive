package defpackage;

import android.app.Application;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class jpb {
    public static final List a = d46.R(Application.class, vob.class);
    public static final List b = d46.Q(vob.class);

    public static final Constructor a(Class cls, List list) {
        list.getClass();
        Constructor<?>[] constructors = cls.getConstructors();
        constructors.getClass();
        for (Constructor<?> constructor : constructors) {
            Class<?>[] parameterTypes = constructor.getParameterTypes();
            parameterTypes.getClass();
            List listQ0 = k80.Q0(parameterTypes);
            if (list.equals(listQ0)) {
                return constructor;
            }
            if (list.size() == listQ0.size() && listQ0.containsAll(list)) {
                throw new UnsupportedOperationException("Class " + cls.getSimpleName() + " must have parameters in the proper order: " + list);
            }
        }
        return null;
    }

    public static final que b(Class cls, Constructor constructor, Object... objArr) {
        try {
            return (que) constructor.newInstance(Arrays.copyOf(objArr, objArr.length));
        } catch (IllegalAccessException e) {
            ywb.k("Failed to access ", cls, e);
            return null;
        } catch (InstantiationException e2) {
            throw new RuntimeException("A " + cls + " cannot be instantiated.", e2);
        } catch (InvocationTargetException e3) {
            lg8.p("An exception happened in constructor of " + cls, e3.getCause());
            return null;
        }
    }
}
