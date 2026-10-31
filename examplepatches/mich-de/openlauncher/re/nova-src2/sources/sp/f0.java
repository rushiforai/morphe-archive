package sp;

import android.content.res.Configuration;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/* loaded from: classes4.dex */
public abstract class f0 {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int f87578a = 0;

    static {
        new b50.d(f0.class.getSimpleName());
    }

    public static Class a(String str) {
        try {
            return Class.forName(str);
        } catch (Throwable th2) {
            r0.c(th2);
            return null;
        }
    }

    public static Object b(Object obj, String str, Class[] clsArr, Object... objArr) {
        Method method = obj.getClass().getMethod(str, clsArr);
        if (method == null) {
            return null;
        }
        return method.invoke(obj, objArr);
    }

    public static Object c(String str, String str2, Configuration configuration) {
        Field field;
        Class clsA = a(str);
        if (clsA == null || (field = clsA.getField(str2)) == null) {
            return null;
        }
        return field.get(configuration);
    }
}
