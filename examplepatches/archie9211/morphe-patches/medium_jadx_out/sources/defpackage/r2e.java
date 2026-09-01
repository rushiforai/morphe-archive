package defpackage;

import java.lang.reflect.Field;
import java.nio.Buffer;
import java.nio.ByteOrder;
import java.security.AccessController;
import java.util.logging.Level;
import java.util.logging.Logger;
import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class r2e {
    public static final Unsafe a;
    public static final Class b;
    public static final q2e c;
    public static final boolean d;
    public static final boolean e;
    public static final long f;
    public static final long g;
    public static final boolean h;

    static {
        Unsafe unsafe;
        q2e o2eVar = null;
        try {
            unsafe = (Unsafe) AccessController.doPrivileged(new l2e(0));
        } catch (Throwable unused) {
            unsafe = null;
        }
        a = unsafe;
        b = zl.a;
        boolean zD = d(Long.TYPE);
        boolean zD2 = d(Integer.TYPE);
        if (unsafe != null) {
            if (!zl.a()) {
                o2eVar = new o2e(unsafe, 0);
            } else if (zD) {
                o2eVar = new m2e(unsafe, 1);
            } else if (zD2) {
                o2eVar = new m2e(unsafe, 0);
            }
        }
        c = o2eVar;
        d = o2eVar == null ? false : o2eVar.l();
        e = o2eVar == null ? false : o2eVar.k();
        f = a(byte[].class);
        a(boolean[].class);
        b(boolean[].class);
        a(int[].class);
        b(int[].class);
        a(long[].class);
        b(long[].class);
        a(float[].class);
        b(float[].class);
        a(double[].class);
        b(double[].class);
        a(Object[].class);
        b(Object[].class);
        Field fieldC = c();
        g = (fieldC == null || o2eVar == null) ? -1L : o2eVar.b.objectFieldOffset(fieldC);
        h = ByteOrder.nativeOrder() == ByteOrder.BIG_ENDIAN;
    }

    public static int a(Class cls) {
        if (e) {
            return c.b.arrayBaseOffset(cls);
        }
        return -1;
    }

    public static void b(Class cls) {
        if (e) {
            c.b.arrayIndexScale(cls);
        }
    }

    public static Field c() {
        Field declaredField;
        Field declaredField2;
        if (zl.a()) {
            try {
                declaredField2 = Buffer.class.getDeclaredField("effectiveDirectAddress");
            } catch (Throwable unused) {
                declaredField2 = null;
            }
            if (declaredField2 != null) {
                return declaredField2;
            }
        }
        try {
            declaredField = Buffer.class.getDeclaredField("address");
        } catch (Throwable unused2) {
            declaredField = null;
        }
        if (declaredField == null || declaredField.getType() != Long.TYPE) {
            return null;
        }
        return declaredField;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static boolean d(Class cls) {
        if (!zl.a()) {
            return false;
        }
        try {
            Class cls2 = b;
            Class cls3 = Boolean.TYPE;
            cls2.getMethod("peekLong", cls, cls3);
            cls2.getMethod("pokeLong", cls, Long.TYPE, cls3);
            Class cls4 = Integer.TYPE;
            cls2.getMethod("pokeInt", cls, cls4, cls3);
            cls2.getMethod("peekInt", cls, cls3);
            cls2.getMethod("pokeByte", cls, Byte.TYPE);
            cls2.getMethod("peekByte", cls);
            cls2.getMethod("pokeByteArray", cls, byte[].class, cls4, cls4);
            cls2.getMethod("peekByteArray", cls, byte[].class, cls4, cls4);
            return true;
        } catch (Throwable unused) {
            return false;
        }
    }

    public static byte e(byte[] bArr, long j) {
        return c.d(f + j, bArr);
    }

    public static byte f(long j, Object obj) {
        return (byte) ((h((-4) & j, obj) >>> ((int) (((~j) & 3) << 3))) & 255);
    }

    public static byte g(long j, Object obj) {
        return (byte) ((h((-4) & j, obj) >>> ((int) ((j & 3) << 3))) & 255);
    }

    public static int h(long j, Object obj) {
        return c.b.getInt(obj, j);
    }

    public static long i(long j, Object obj) {
        return c.b.getLong(obj, j);
    }

    public static Object j(long j, Object obj) {
        return c.b.getObject(obj, j);
    }

    public static void k(Throwable th) {
        Logger.getLogger(r2e.class.getName()).log(Level.WARNING, "platform method missing - proto runtime falling back to safer methods: " + th);
    }

    public static void l(byte[] bArr, long j, byte b2) {
        c.h(bArr, f + j, b2);
    }

    public static void m(Object obj, long j, byte b2) {
        long j2 = (-4) & j;
        int iH = h(j2, obj);
        int i = ((~((int) j)) & 3) << 3;
        o(((255 & b2) << i) | (iH & (~(255 << i))), j2, obj);
    }

    public static void n(Object obj, long j, byte b2) {
        long j2 = (-4) & j;
        int i = (((int) j) & 3) << 3;
        o(((255 & b2) << i) | (h(j2, obj) & (~(255 << i))), j2, obj);
    }

    public static void o(int i, long j, Object obj) {
        c.b.putInt(obj, j, i);
    }

    public static void p(Object obj, long j, long j2) {
        c.b.putLong(obj, j, j2);
    }

    public static void q(long j, Object obj, Object obj2) {
        c.b.putObject(obj, j, obj2);
    }
}
