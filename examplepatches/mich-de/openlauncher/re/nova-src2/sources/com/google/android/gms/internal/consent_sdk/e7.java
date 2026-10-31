package com.google.android.gms.internal.consent_sdk;

import com.google.android.libraries.places.api.model.PlaceTypes;
import java.lang.reflect.Field;
import java.nio.Buffer;
import java.nio.ByteOrder;
import java.security.AccessController;
import java.util.logging.Level;
import java.util.logging.Logger;
import libcore.io.Memory;
import sun.misc.Unsafe;

/* loaded from: classes3.dex */
public abstract class e7 {

    /* renamed from: a, reason: collision with root package name */
    public static final Unsafe f32055a;

    /* renamed from: b, reason: collision with root package name */
    public static final Class f32056b;

    /* renamed from: c, reason: collision with root package name */
    public static final d7 f32057c;

    /* renamed from: d, reason: collision with root package name */
    public static final boolean f32058d;

    /* renamed from: e, reason: collision with root package name */
    public static final boolean f32059e;

    /* renamed from: f, reason: collision with root package name */
    public static final long f32060f;

    /* renamed from: g, reason: collision with root package name */
    public static final boolean f32061g;

    /* JADX WARN: Removed duplicated region for block: B:11:0x0043  */
    static {
        boolean z11;
        boolean z12;
        d7 d7Var;
        Unsafe unsafeI = i();
        f32055a = unsafeI;
        int i5 = k5.f32121a;
        f32056b = Memory.class;
        Class cls = Long.TYPE;
        boolean zO = o(cls);
        Class cls2 = Integer.TYPE;
        boolean zO2 = o(cls2);
        d7 b7Var = null;
        if (unsafeI != null) {
            if (zO) {
                b7Var = new c7(unsafeI);
            } else if (zO2) {
                b7Var = new b7(unsafeI);
            }
        }
        f32057c = b7Var;
        if (b7Var == null) {
            z11 = false;
        } else {
            try {
                Class<?> cls3 = b7Var.f32050a.getClass();
                cls3.getMethod("objectFieldOffset", Field.class);
                cls3.getMethod("getLong", Object.class, cls);
                if (b() != null) {
                    z11 = true;
                }
            } catch (Throwable th2) {
                Logger.getLogger(e7.class.getName()).logp(Level.WARNING, "com.google.protobuf.UnsafeUtil", "logMissingMethod", "platform method missing - proto runtime falling back to safer methods: ".concat(th2.toString()));
            }
        }
        f32058d = z11;
        d7 d7Var2 = f32057c;
        if (d7Var2 == null) {
            z12 = false;
        } else {
            try {
                Class<?> cls4 = d7Var2.f32050a.getClass();
                cls4.getMethod("objectFieldOffset", Field.class);
                cls4.getMethod("arrayBaseOffset", Class.class);
                cls4.getMethod("arrayIndexScale", Class.class);
                cls4.getMethod("getInt", Object.class, cls);
                cls4.getMethod("putInt", Object.class, cls, cls2);
                cls4.getMethod("getLong", Object.class, cls);
                cls4.getMethod("putLong", Object.class, cls, cls);
                cls4.getMethod("getObject", Object.class, cls);
                cls4.getMethod("putObject", Object.class, cls, Object.class);
                z12 = true;
            } catch (Throwable th3) {
                Logger.getLogger(e7.class.getName()).logp(Level.WARNING, "com.google.protobuf.UnsafeUtil", "logMissingMethod", "platform method missing - proto runtime falling back to safer methods: ".concat(th3.toString()));
            }
        }
        f32059e = z12;
        f32060f = p(byte[].class);
        p(boolean[].class);
        a(boolean[].class);
        p(int[].class);
        a(int[].class);
        p(long[].class);
        a(long[].class);
        p(float[].class);
        a(float[].class);
        p(double[].class);
        a(double[].class);
        p(Object[].class);
        a(Object[].class);
        Field fieldB = b();
        if (fieldB != null && (d7Var = f32057c) != null) {
            d7Var.f32050a.objectFieldOffset(fieldB);
        }
        f32061g = ByteOrder.nativeOrder() == ByteOrder.BIG_ENDIAN;
    }

    public static void a(Class cls) {
        if (f32059e) {
            f32057c.f32050a.arrayIndexScale(cls);
        }
    }

    public static Field b() {
        Field declaredField;
        Field declaredField2;
        int i5 = k5.f32121a;
        try {
            declaredField = Buffer.class.getDeclaredField("effectiveDirectAddress");
        } catch (Throwable unused) {
            declaredField = null;
        }
        if (declaredField != null) {
            return declaredField;
        }
        try {
            declaredField2 = Buffer.class.getDeclaredField(PlaceTypes.ADDRESS);
        } catch (Throwable unused2) {
            declaredField2 = null;
        }
        if (declaredField2 == null || declaredField2.getType() != Long.TYPE) {
            return null;
        }
        return declaredField2;
    }

    public static void c(Object obj, long j11, byte b11) {
        Unsafe unsafe = f32057c.f32050a;
        long j12 = (-4) & j11;
        int i5 = unsafe.getInt(obj, j12);
        int i11 = ((~((int) j11)) & 3) << 3;
        unsafe.putInt(obj, j12, ((255 & b11) << i11) | (i5 & (~(255 << i11))));
    }

    public static void d(Object obj, long j11, byte b11) {
        Unsafe unsafe = f32057c.f32050a;
        long j12 = (-4) & j11;
        int i5 = (((int) j11) & 3) << 3;
        unsafe.putInt(obj, j12, ((255 & b11) << i5) | (unsafe.getInt(obj, j12) & (~(255 << i5))));
    }

    public static int e(Object obj, long j11) {
        return f32057c.f32050a.getInt(obj, j11);
    }

    public static long f(Object obj, long j11) {
        return f32057c.f32050a.getLong(obj, j11);
    }

    public static Object g(Class cls) {
        try {
            return f32055a.allocateInstance(cls);
        } catch (InstantiationException e3) {
            throw new IllegalStateException(e3);
        }
    }

    public static Object h(Object obj, long j11) {
        return f32057c.f32050a.getObject(obj, j11);
    }

    public static Unsafe i() {
        try {
            return (Unsafe) AccessController.doPrivileged(new a7());
        } catch (Throwable unused) {
            return null;
        }
    }

    public static void j(Object obj, long j11, int i5) {
        f32057c.f32050a.putInt(obj, j11, i5);
    }

    public static void k(Object obj, long j11, long j12) {
        f32057c.f32050a.putLong(obj, j11, j12);
    }

    public static void l(Object obj, long j11, Object obj2) {
        f32057c.f32050a.putObject(obj, j11, obj2);
    }

    public static /* bridge */ /* synthetic */ boolean m(Object obj, long j11) {
        return ((byte) ((f32057c.f32050a.getInt(obj, (-4) & j11) >>> ((int) (((~j11) & 3) << 3))) & 255)) != 0;
    }

    public static /* bridge */ /* synthetic */ boolean n(Object obj, long j11) {
        return ((byte) ((f32057c.f32050a.getInt(obj, (-4) & j11) >>> ((int) ((j11 & 3) << 3))) & 255)) != 0;
    }

    public static boolean o(Class cls) {
        int i5 = k5.f32121a;
        try {
            Class cls2 = f32056b;
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

    public static int p(Class cls) {
        if (f32059e) {
            return f32057c.f32050a.arrayBaseOffset(cls);
        }
        return -1;
    }
}
