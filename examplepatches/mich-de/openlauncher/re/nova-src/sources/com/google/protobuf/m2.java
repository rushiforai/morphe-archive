package com.google.protobuf;

import com.google.android.libraries.places.api.model.PlaceTypes;
import java.lang.reflect.Field;
import java.nio.Buffer;
import java.nio.ByteOrder;
import java.security.AccessController;
import java.util.logging.Level;
import java.util.logging.Logger;
import sun.misc.Unsafe;

/* loaded from: classes.dex */
public abstract class m2 {

    /* renamed from: a, reason: collision with root package name */
    public static final Unsafe f34909a;

    /* renamed from: b, reason: collision with root package name */
    public static final Class f34910b;

    /* renamed from: c, reason: collision with root package name */
    public static final l2 f34911c;

    /* renamed from: d, reason: collision with root package name */
    public static final boolean f34912d;

    /* renamed from: e, reason: collision with root package name */
    public static final boolean f34913e;

    /* renamed from: f, reason: collision with root package name */
    public static final long f34914f;

    /* renamed from: g, reason: collision with root package name */
    public static final long f34915g;

    /* renamed from: h, reason: collision with root package name */
    public static final boolean f34916h;

    /* JADX WARN: Removed duplicated region for block: B:4:0x0019  */
    static {
        l2 k2Var;
        Unsafe unsafe;
        boolean z11;
        Field declaredField;
        Field declaredField2;
        Unsafe unsafeH = h();
        f34909a = unsafeH;
        f34910b = e.f34844a;
        Class<?> cls = Long.TYPE;
        boolean zE = e(cls);
        Class cls2 = Integer.TYPE;
        boolean zE2 = e(cls2);
        Field field = null;
        if (unsafeH != null) {
            k2Var = zE ? new k2(unsafeH) : zE2 ? new j2(unsafeH) : null;
        }
        f34911c = k2Var;
        f34912d = k2Var == null ? false : k2Var.s();
        if (k2Var == null || (unsafe = k2Var.f34893a) == null) {
            z11 = false;
        } else {
            try {
                Class<?> cls3 = unsafe.getClass();
                cls3.getMethod("objectFieldOffset", Field.class);
                cls3.getMethod("arrayBaseOffset", Class.class);
                cls3.getMethod("arrayIndexScale", Class.class);
                cls3.getMethod("getInt", Object.class, cls);
                cls3.getMethod("putInt", Object.class, cls, cls2);
                cls3.getMethod("getLong", Object.class, cls);
                cls3.getMethod("putLong", Object.class, cls, cls);
                cls3.getMethod("getObject", Object.class, cls);
                cls3.getMethod("putObject", Object.class, cls, Object.class);
                z11 = true;
            } catch (Throwable th2) {
                a(th2);
            }
        }
        f34913e = z11;
        f34914f = c(byte[].class);
        c(boolean[].class);
        d(boolean[].class);
        c(int[].class);
        d(int[].class);
        c(long[].class);
        d(long[].class);
        c(float[].class);
        d(float[].class);
        c(double[].class);
        d(double[].class);
        c(Object[].class);
        d(Object[].class);
        Class cls4 = e.f34844a;
        try {
            declaredField = Buffer.class.getDeclaredField("effectiveDirectAddress");
        } catch (Throwable unused) {
            declaredField = null;
        }
        if (declaredField == null) {
            try {
                declaredField2 = Buffer.class.getDeclaredField(PlaceTypes.ADDRESS);
            } catch (Throwable unused2) {
                declaredField2 = null;
            }
            if (declaredField2 != null && declaredField2.getType() == cls) {
                field = declaredField2;
            }
            declaredField = field;
        }
        f34915g = (declaredField == null || k2Var == null) ? -1L : k2Var.k(declaredField);
        f34916h = ByteOrder.nativeOrder() == ByteOrder.BIG_ENDIAN;
    }

    public static void a(Throwable th2) {
        Logger.getLogger(m2.class.getName()).log(Level.WARNING, "platform method missing - proto runtime falling back to safer methods: " + th2);
    }

    public static Object b(Class cls) {
        try {
            return f34909a.allocateInstance(cls);
        } catch (InstantiationException e3) {
            throw new IllegalStateException(e3);
        }
    }

    public static int c(Class cls) {
        if (f34913e) {
            return f34911c.a(cls);
        }
        return -1;
    }

    public static void d(Class cls) {
        if (f34913e) {
            f34911c.b(cls);
        }
    }

    public static boolean e(Class cls) {
        Class cls2 = e.f34844a;
        try {
            Class cls3 = f34910b;
            Class cls4 = Boolean.TYPE;
            cls3.getMethod("peekLong", cls, cls4);
            cls3.getMethod("pokeLong", cls, Long.TYPE, cls4);
            Class cls5 = Integer.TYPE;
            cls3.getMethod("pokeInt", cls, cls5, cls4);
            cls3.getMethod("peekInt", cls, cls4);
            cls3.getMethod("pokeByte", cls, Byte.TYPE);
            cls3.getMethod("peekByte", cls);
            cls3.getMethod("pokeByteArray", cls, byte[].class, cls5, cls5);
            cls3.getMethod("peekByteArray", cls, byte[].class, cls5, cls5);
            return true;
        } catch (Throwable unused) {
            return false;
        }
    }

    public static byte f(long j11, Object obj) {
        return (byte) ((f34911c.h((-4) & j11, obj) >>> ((int) (((~j11) & 3) << 3))) & 255);
    }

    public static byte g(long j11, Object obj) {
        return (byte) ((f34911c.h((-4) & j11, obj) >>> ((int) ((j11 & 3) << 3))) & 255);
    }

    public static Unsafe h() {
        try {
            return (Unsafe) AccessController.doPrivileged(new i2());
        } catch (Throwable unused) {
            return null;
        }
    }

    public static void i(byte[] bArr, long j11, byte b11) {
        f34911c.m(bArr, f34914f + j11, b11);
    }

    public static void j(Object obj, long j11, byte b11) {
        long j12 = (-4) & j11;
        int iH = f34911c.h(j12, obj);
        int i5 = ((~((int) j11)) & 3) << 3;
        l(j12, obj, ((255 & b11) << i5) | (iH & (~(255 << i5))));
    }

    public static void k(Object obj, long j11, byte b11) {
        long j12 = (-4) & j11;
        int i5 = (((int) j11) & 3) << 3;
        l(j12, obj, ((255 & b11) << i5) | (f34911c.h(j12, obj) & (~(255 << i5))));
    }

    public static void l(long j11, Object obj, int i5) {
        f34911c.p(j11, obj, i5);
    }

    public static void m(Object obj, long j11, long j12) {
        f34911c.q(obj, j11, j12);
    }

    public static void n(long j11, Object obj, Object obj2) {
        f34911c.r(j11, obj, obj2);
    }
}
