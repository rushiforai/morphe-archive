package j$.sun.misc;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class a {
    public static final a b;
    public final Unsafe a;

    static {
        Field declaredField;
        try {
            declaredField = Unsafe.class.getDeclaredField("theUnsafe");
        } catch (NoSuchFieldException e) {
            for (Field field : Unsafe.class.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) && Unsafe.class.isAssignableFrom(field.getType())) {
                    declaredField = field;
                }
            }
            throw new AssertionError("Couldn't find the Unsafe", e);
        }
        declaredField.setAccessible(true);
        try {
            b = new a((Unsafe) declaredField.get(null));
        } catch (IllegalAccessException e2) {
            throw new AssertionError("Couldn't get the Unsafe", e2);
        }
    }

    public a(Unsafe unsafe) {
        this.a = unsafe;
    }

    public final long a(Class cls, String str) {
        try {
            return this.a.objectFieldOffset(cls.getDeclaredField(str));
        } catch (NoSuchFieldException e) {
            throw new AssertionError("Cannot find field:", e);
        }
    }
}
