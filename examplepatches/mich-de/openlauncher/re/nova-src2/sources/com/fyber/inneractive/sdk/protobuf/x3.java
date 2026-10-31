package com.fyber.inneractive.sdk.protobuf;

import com.google.android.libraries.places.api.model.PlaceTypes;
import java.lang.reflect.Field;
import java.nio.Buffer;
import java.nio.ByteOrder;
import java.security.AccessController;
import java.util.logging.Level;
import java.util.logging.Logger;
import sun.misc.Unsafe;

/* loaded from: classes.dex */
public abstract class x3 {

    /* renamed from: a, reason: collision with root package name */
    public static final Unsafe f30953a;

    /* renamed from: b, reason: collision with root package name */
    public static final Class f30954b;

    /* renamed from: c, reason: collision with root package name */
    public static final w3 f30955c;

    /* renamed from: d, reason: collision with root package name */
    public static final boolean f30956d;

    /* renamed from: e, reason: collision with root package name */
    public static final boolean f30957e;

    /* renamed from: f, reason: collision with root package name */
    public static final long f30958f;

    /* renamed from: g, reason: collision with root package name */
    public static final long f30959g;

    /* renamed from: h, reason: collision with root package name */
    public static final boolean f30960h;

    /* JADX WARN: Removed duplicated region for block: B:15:0x0039  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00a2 A[PHI: r4
      0x00a2: PHI (r4v20 java.lang.reflect.Field) = (r4v18 java.lang.reflect.Field), (r4v23 java.lang.reflect.Field) binds: [B:39:0x00b2, B:31:0x00a0] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00a4  */
    static {
        Unsafe unsafe;
        w3 u3Var;
        Field declaredField;
        Field field = null;
        try {
            unsafe = (Unsafe) AccessController.doPrivileged(new s3());
        } catch (Throwable unused) {
            unsafe = null;
        }
        f30953a = unsafe;
        f30954b = d.f30780a;
        Class<?> cls = Long.TYPE;
        boolean zC = c(cls);
        boolean zC2 = c(Integer.TYPE);
        if (unsafe != null) {
            u3Var = d.a() ? zC ? new u3(unsafe) : zC2 ? new t3(unsafe) : null : new v3(unsafe);
        }
        f30955c = u3Var;
        f30956d = u3Var == null ? false : u3Var.b();
        f30957e = u3Var == null ? false : u3Var.a();
        f30958f = a(byte[].class);
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
        if (d.a()) {
            try {
                declaredField = Buffer.class.getDeclaredField("effectiveDirectAddress");
            } catch (Throwable unused2) {
                declaredField = null;
            }
            if (declaredField != null) {
                field = declaredField;
            } else {
                try {
                    declaredField = Buffer.class.getDeclaredField(PlaceTypes.ADDRESS);
                } catch (Throwable unused3) {
                    declaredField = null;
                }
                if (declaredField != null && declaredField.getType() == cls) {
                }
            }
        }
        f30959g = (field == null || u3Var == null) ? -1L : u3Var.f30941a.objectFieldOffset(field);
        f30960h = ByteOrder.nativeOrder() == ByteOrder.BIG_ENDIAN;
    }

    public static int a(Class cls) {
        if (f30957e) {
            return f30955c.f30941a.arrayBaseOffset(cls);
        }
        return -1;
    }

    public static void b(Class cls) {
        if (f30957e) {
            f30955c.f30941a.arrayIndexScale(cls);
        }
    }

    public static int c(Object obj, long j11) {
        return f30955c.f30941a.getInt(obj, j11);
    }

    public static long d(Object obj, long j11) {
        return f30955c.f30941a.getLong(obj, j11);
    }

    public static Object e(Object obj, long j11) {
        return f30955c.f30941a.getObject(obj, j11);
    }

    public static void a(Object obj, long j11, int i5) {
        f30955c.f30941a.putInt(obj, j11, i5);
    }

    public static byte b(Object obj, long j11) {
        return (byte) ((c(obj, (-4) & j11) >>> ((int) ((j11 & 3) << 3))) & 255);
    }

    public static boolean c(Class cls) {
        if (!d.a()) {
            return false;
        }
        try {
            Class cls2 = f30954b;
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

    public static void b(Object obj, long j11, byte b11) {
        long j12 = (-4) & j11;
        int i5 = (((int) j11) & 3) << 3;
        a(obj, j12, ((255 & b11) << i5) | (c(obj, j12) & (~(255 << i5))));
    }

    public static void a(Object obj, long j11, long j12) {
        f30955c.f30941a.putLong(obj, j11, j12);
    }

    public static void a(long j11, Object obj, Object obj2) {
        f30955c.f30941a.putObject(obj, j11, obj2);
    }

    public static byte a(Object obj, long j11) {
        return (byte) ((c(obj, (-4) & j11) >>> ((int) (((~j11) & 3) << 3))) & 255);
    }

    public static void a(Object obj, long j11, byte b11) {
        long j12 = (-4) & j11;
        int iC = c(obj, j12);
        int i5 = ((~((int) j11)) & 3) << 3;
        a(obj, j12, ((255 & b11) << i5) | (iC & (~(255 << i5))));
    }

    public static void a(Throwable th2) {
        Logger.getLogger(x3.class.getName()).log(Level.WARNING, "platform method missing - proto runtime falling back to safer methods: " + th2);
    }
}
