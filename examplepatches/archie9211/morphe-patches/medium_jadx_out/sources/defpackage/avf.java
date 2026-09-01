package defpackage;

import java.lang.reflect.Field;
import java.nio.Buffer;
import java.security.AccessController;
import java.util.logging.Level;
import java.util.logging.Logger;
import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class avf {
    public static final Unsafe a;
    public static final Class b;
    public static final q2e c;
    public static final boolean d;
    public static final long e;
    public static final boolean f;

    /* JADX WARN: Removed duplicated region for block: B:8:0x002a  */
    static {
        /*
            Method dump skipped, instruction units count: 344
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.avf.<clinit>():void");
    }

    public static void a(int i, long j, Object obj) {
        c.b.putInt(obj, j, i);
    }

    public static void b(long j, Object obj, Object obj2) {
        c.b.putObject(obj, j, obj2);
    }

    public static void c(Object obj, long j, long j2) {
        c.b.putLong(obj, j, j2);
    }

    public static void d(byte[] bArr, long j, byte b2) {
        c.n(bArr, e + j, b2);
    }

    public static int e(Class cls) {
        if (d) {
            return c.b.arrayBaseOffset(cls);
        }
        return -1;
    }

    public static Unsafe f() {
        Unsafe unsafe;
        try {
            unsafe = (Unsafe) AccessController.doPrivileged(new l2e(3));
        } catch (Throwable unused) {
            unsafe = null;
        }
        if (unsafe == null) {
            return null;
        }
        try {
            unsafe.arrayBaseOffset(byte[].class);
            return unsafe;
        } catch (Exception unused2) {
            Logger.getLogger(avf.class.getName()).logp(Level.WARNING, "com.google.protobuf.UnsafeUtil", "getUnsafe", "As part of the planned removal, sun.misc.Unsafe is available in the current environment but configured to throw on use. Protobuf will continue without using it, but with slightly reduced performance. --sun-misc-unsafe-memory-access=allow is likely available to opt back in if desired. A later Protobuf version release will stop using sun.misc.Unsafe entirely.");
            return null;
        }
    }

    public static int g(long j, Object obj) {
        return c.b.getInt(obj, j);
    }

    public static void h(Class cls) {
        if (d) {
            c.b.arrayIndexScale(cls);
        }
    }

    public static void i(Object obj, long j, byte b2) {
        long j2 = (-4) & j;
        int iG = g(j2, obj);
        int i = ((~((int) j)) & 3) << 3;
        a(((255 & b2) << i) | (iG & (~(255 << i))), j2, obj);
    }

    public static long j(long j, Object obj) {
        return c.b.getLong(obj, j);
    }

    public static Field k() {
        Field declaredField;
        Field declaredField2;
        try {
            declaredField = Buffer.class.getDeclaredField("effectiveDirectAddress");
        } catch (Throwable unused) {
            declaredField = null;
        }
        if (declaredField != null) {
            return declaredField;
        }
        try {
            declaredField2 = Buffer.class.getDeclaredField("address");
        } catch (Throwable unused2) {
            declaredField2 = null;
        }
        if (declaredField2 == null || declaredField2.getType() != Long.TYPE) {
            return null;
        }
        return declaredField2;
    }

    public static void l(Object obj, long j, byte b2) {
        long j2 = (-4) & j;
        int i = (((int) j) & 3) << 3;
        a(((255 & b2) << i) | (g(j2, obj) & (~(255 << i))), j2, obj);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static boolean m(Class cls) {
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

    public static Object n(long j, Object obj) {
        return c.b.getObject(obj, j);
    }
}
