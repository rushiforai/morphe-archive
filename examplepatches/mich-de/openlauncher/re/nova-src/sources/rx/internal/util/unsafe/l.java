package rx.internal.util.unsafe;

import java.lang.reflect.Field;
import sun.misc.Unsafe;

/* loaded from: classes5.dex */
public abstract class l {

    /* renamed from: a, reason: collision with root package name */
    public static final Unsafe f86488a;

    /* renamed from: b, reason: collision with root package name */
    public static final boolean f86489b;

    static {
        f86489b = System.getProperty("rx.unsafe-disable") != null;
        Unsafe unsafe = null;
        try {
            Field declaredField = Unsafe.class.getDeclaredField("theUnsafe");
            declaredField.setAccessible(true);
            unsafe = (Unsafe) declaredField.get(null);
        } catch (Throwable unused) {
        }
        f86488a = unsafe;
    }

    public static long a(Class cls, String str) throws NoSuchFieldException {
        try {
            return f86488a.objectFieldOffset(cls.getDeclaredField(str));
        } catch (NoSuchFieldException e3) {
            InternalError internalError = new InternalError();
            internalError.initCause(e3);
            throw internalError;
        }
    }
}
