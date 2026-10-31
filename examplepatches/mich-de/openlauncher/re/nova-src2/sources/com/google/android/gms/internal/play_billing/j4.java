package com.google.android.gms.internal.play_billing;

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
public abstract class j4 {

    /* renamed from: a, reason: collision with root package name */
    public static final Unsafe f33426a;

    /* renamed from: b, reason: collision with root package name */
    public static final Class f33427b;

    /* renamed from: c, reason: collision with root package name */
    public static final i4 f33428c;

    /* renamed from: d, reason: collision with root package name */
    public static final boolean f33429d;

    /* renamed from: e, reason: collision with root package name */
    public static final boolean f33430e;

    /* renamed from: f, reason: collision with root package name */
    public static final long f33431f;

    /* renamed from: g, reason: collision with root package name */
    public static final boolean f33432g;

    /* JADX WARN: Removed duplicated region for block: B:11:0x0043  */
    static {
        boolean z11;
        boolean z12;
        i4 i4Var;
        Unsafe unsafeI = i();
        f33426a = unsafeI;
        int i5 = i2.f33421a;
        f33427b = Memory.class;
        Class cls = Long.TYPE;
        boolean zO = o(cls);
        Class cls2 = Integer.TYPE;
        boolean zO2 = o(cls2);
        i4 g4Var = null;
        if (unsafeI != null) {
            if (zO) {
                g4Var = new h4(unsafeI);
            } else if (zO2) {
                g4Var = new g4(unsafeI);
            }
        }
        f33428c = g4Var;
        if (g4Var == null) {
            z11 = false;
        } else {
            try {
                Class<?> cls3 = g4Var.f33422a.getClass();
                cls3.getMethod("objectFieldOffset", Field.class);
                cls3.getMethod("getLong", Object.class, cls);
                if (b() != null) {
                    z11 = true;
                }
            } catch (Throwable th2) {
                Logger.getLogger(j4.class.getName()).logp(Level.WARNING, "com.google.protobuf.UnsafeUtil", "logMissingMethod", "platform method missing - proto runtime falling back to safer methods: ".concat(th2.toString()));
            }
        }
        f33429d = z11;
        i4 i4Var2 = f33428c;
        if (i4Var2 == null) {
            z12 = false;
        } else {
            try {
                Class<?> cls4 = i4Var2.f33422a.getClass();
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
                Logger.getLogger(j4.class.getName()).logp(Level.WARNING, "com.google.protobuf.UnsafeUtil", "logMissingMethod", "platform method missing - proto runtime falling back to safer methods: ".concat(th3.toString()));
            }
        }
        f33430e = z12;
        f33431f = p(byte[].class);
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
        if (fieldB != null && (i4Var = f33428c) != null) {
            i4Var.f33422a.objectFieldOffset(fieldB);
        }
        f33432g = ByteOrder.nativeOrder() == ByteOrder.BIG_ENDIAN;
    }

    public static void a(Class cls) {
        if (f33430e) {
            f33428c.f33422a.arrayIndexScale(cls);
        }
    }

    public static Field b() {
        Field declaredField;
        Field declaredField2;
        int i5 = i2.f33421a;
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
        Unsafe unsafe = f33428c.f33422a;
        long j12 = (-4) & j11;
        int i5 = unsafe.getInt(obj, j12);
        int i11 = ((~((int) j11)) & 3) << 3;
        unsafe.putInt(obj, j12, ((255 & b11) << i11) | (i5 & (~(255 << i11))));
    }

    public static void d(Object obj, long j11, byte b11) {
        Unsafe unsafe = f33428c.f33422a;
        long j12 = (-4) & j11;
        int i5 = (((int) j11) & 3) << 3;
        unsafe.putInt(obj, j12, ((255 & b11) << i5) | (unsafe.getInt(obj, j12) & (~(255 << i5))));
    }

    public static int e(Object obj, long j11) {
        return f33428c.f33422a.getInt(obj, j11);
    }

    public static long f(Object obj, long j11) {
        return f33428c.f33422a.getLong(obj, j11);
    }

    public static Object g(Class cls) {
        try {
            return f33426a.allocateInstance(cls);
        } catch (InstantiationException e3) {
            throw new IllegalStateException(e3);
        }
    }

    public static Object h(Object obj, long j11) {
        return f33428c.f33422a.getObject(obj, j11);
    }

    public static Unsafe i() {
        Unsafe unsafe;
        try {
            unsafe = (Unsafe) AccessController.doPrivileged(new f4());
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
            Logger.getLogger(j4.class.getName()).logp(Level.WARNING, "com.google.protobuf.UnsafeUtil", "getUnsafe", "As part of the planned removal, sun.misc.Unsafe is available in the current environment but configured to throw on use. Protobuf will continue without using it, but with slightly reduced performance. --sun-misc-unsafe-memory-access=allow is likely available to opt back in if desired. A later Protobuf version release will stop using sun.misc.Unsafe entirely.");
            return null;
        }
    }

    public static void j(Object obj, long j11, int i5) {
        f33428c.f33422a.putInt(obj, j11, i5);
    }

    public static void k(Object obj, long j11, long j12) {
        f33428c.f33422a.putLong(obj, j11, j12);
    }

    public static void l(Object obj, long j11, Object obj2) {
        f33428c.f33422a.putObject(obj, j11, obj2);
    }

    public static /* bridge */ /* synthetic */ boolean m(Object obj, long j11) {
        return ((byte) ((f33428c.f33422a.getInt(obj, (-4) & j11) >>> ((int) (((~j11) & 3) << 3))) & 255)) != 0;
    }

    public static /* bridge */ /* synthetic */ boolean n(Object obj, long j11) {
        return ((byte) ((f33428c.f33422a.getInt(obj, (-4) & j11) >>> ((int) ((j11 & 3) << 3))) & 255)) != 0;
    }

    public static boolean o(Class cls) {
        int i5 = i2.f33421a;
        try {
            Class cls2 = f33427b;
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
        if (f33430e) {
            return f33428c.f33422a.arrayBaseOffset(cls);
        }
        return -1;
    }
}
