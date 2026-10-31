package com.google.android.gms.internal.measurement;

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
public abstract class d3 {

    /* renamed from: a, reason: collision with root package name */
    public static final Unsafe f32452a;

    /* renamed from: b, reason: collision with root package name */
    public static final Class f32453b;

    /* renamed from: c, reason: collision with root package name */
    public static final c3 f32454c;

    /* renamed from: d, reason: collision with root package name */
    public static final boolean f32455d;

    /* renamed from: e, reason: collision with root package name */
    public static final long f32456e;

    /* renamed from: f, reason: collision with root package name */
    public static final boolean f32457f;

    static {
        boolean z11;
        c3 c3Var;
        Unsafe unsafeL = l();
        f32452a = unsafeL;
        int i5 = p0.f32944a;
        f32453b = Memory.class;
        Class cls = Long.TYPE;
        boolean zM = m(cls);
        Class cls2 = Integer.TYPE;
        boolean zM2 = m(cls2);
        c3 a3Var = null;
        if (unsafeL != null) {
            if (zM) {
                a3Var = new b3(unsafeL);
            } else if (zM2) {
                a3Var = new a3(unsafeL);
            }
        }
        f32454c = a3Var;
        if (a3Var != null) {
            try {
                Class<?> cls3 = ((Unsafe) a3Var.f32423a).getClass();
                cls3.getMethod("objectFieldOffset", Field.class);
                cls3.getMethod("getLong", Object.class, cls);
                a();
            } catch (Throwable th2) {
                Logger.getLogger(d3.class.getName()).logp(Level.WARNING, "com.google.protobuf.UnsafeUtil", "logMissingMethod", "platform method missing - proto runtime falling back to safer methods: ".concat(th2.toString()));
            }
        }
        c3 c3Var2 = f32454c;
        if (c3Var2 == null) {
            z11 = false;
        } else {
            try {
                Class<?> cls4 = ((Unsafe) c3Var2.f32423a).getClass();
                cls4.getMethod("objectFieldOffset", Field.class);
                cls4.getMethod("arrayBaseOffset", Class.class);
                cls4.getMethod("arrayIndexScale", Class.class);
                cls4.getMethod("getInt", Object.class, cls);
                cls4.getMethod("putInt", Object.class, cls, cls2);
                cls4.getMethod("getLong", Object.class, cls);
                cls4.getMethod("putLong", Object.class, cls, cls);
                cls4.getMethod("getObject", Object.class, cls);
                cls4.getMethod("putObject", Object.class, cls, Object.class);
                z11 = true;
            } catch (Throwable th3) {
                Logger.getLogger(d3.class.getName()).logp(Level.WARNING, "com.google.protobuf.UnsafeUtil", "logMissingMethod", "platform method missing - proto runtime falling back to safer methods: ".concat(th3.toString()));
            }
        }
        f32455d = z11;
        f32456e = p(byte[].class);
        p(boolean[].class);
        q(boolean[].class);
        p(int[].class);
        q(int[].class);
        p(long[].class);
        q(long[].class);
        p(float[].class);
        q(float[].class);
        p(double[].class);
        q(double[].class);
        p(Object[].class);
        q(Object[].class);
        Field fieldA = a();
        if (fieldA != null && (c3Var = f32454c) != null) {
            ((Unsafe) c3Var.f32423a).objectFieldOffset(fieldA);
        }
        f32457f = ByteOrder.nativeOrder() == ByteOrder.BIG_ENDIAN;
    }

    public static Field a() {
        Field declaredField;
        Field declaredField2;
        int i5 = p0.f32944a;
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

    public static void b(Object obj, long j11, byte b11) {
        Unsafe unsafe = (Unsafe) f32454c.f32423a;
        long j12 = (-4) & j11;
        int i5 = unsafe.getInt(obj, j12);
        int i11 = ((~((int) j11)) & 3) << 3;
        unsafe.putInt(obj, j12, ((255 & b11) << i11) | (i5 & (~(255 << i11))));
    }

    public static void c(Object obj, long j11, byte b11) {
        Unsafe unsafe = (Unsafe) f32454c.f32423a;
        long j12 = (-4) & j11;
        int i5 = (((int) j11) & 3) << 3;
        unsafe.putInt(obj, j12, ((255 & b11) << i5) | (unsafe.getInt(obj, j12) & (~(255 << i5))));
    }

    public static Object d(Class cls) {
        try {
            return f32452a.allocateInstance(cls);
        } catch (InstantiationException e3) {
            throw new IllegalStateException(e3);
        }
    }

    public static int e(Object obj, long j11) {
        return ((Unsafe) f32454c.f32423a).getInt(obj, j11);
    }

    public static void f(long j11, Object obj, int i5) {
        ((Unsafe) f32454c.f32423a).putInt(obj, j11, i5);
    }

    public static long g(long j11, Object obj) {
        return ((Unsafe) f32454c.f32423a).getLong(obj, j11);
    }

    public static void h(Object obj, long j11, long j12) {
        ((Unsafe) f32454c.f32423a).putLong(obj, j11, j12);
    }

    public static Object i(long j11, Object obj) {
        return ((Unsafe) f32454c.f32423a).getObject(obj, j11);
    }

    public static void j(long j11, Object obj, Object obj2) {
        ((Unsafe) f32454c.f32423a).putObject(obj, j11, obj2);
    }

    public static void k(byte[] bArr, long j11, byte b11) {
        f32454c.b(bArr, f32456e + j11, b11);
    }

    public static Unsafe l() {
        Unsafe unsafe;
        try {
            unsafe = (Unsafe) AccessController.doPrivileged(new z2());
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
            Logger.getLogger(d3.class.getName()).logp(Level.WARNING, "com.google.protobuf.UnsafeUtil", "getUnsafe", "As part of the planned removal, sun.misc.Unsafe is available in the current environment but configured to throw on use. Protobuf will continue without using it, but with slightly reduced performance. --sun-misc-unsafe-memory-access=allow is likely available to opt back in if desired. A later Protobuf version release will stop using sun.misc.Unsafe entirely.");
            return null;
        }
    }

    public static boolean m(Class cls) {
        int i5 = p0.f32944a;
        try {
            Class cls2 = f32453b;
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

    public static /* synthetic */ boolean n(Object obj, long j11) {
        return ((byte) ((((Unsafe) f32454c.f32423a).getInt(obj, (-4) & j11) >>> ((int) (((~j11) & 3) << 3))) & 255)) != 0;
    }

    public static /* synthetic */ boolean o(Object obj, long j11) {
        return ((byte) ((((Unsafe) f32454c.f32423a).getInt(obj, (-4) & j11) >>> ((int) ((j11 & 3) << 3))) & 255)) != 0;
    }

    public static int p(Class cls) {
        if (f32455d) {
            return ((Unsafe) f32454c.f32423a).arrayBaseOffset(cls);
        }
        return -1;
    }

    public static void q(Class cls) {
        if (f32455d) {
            ((Unsafe) f32454c.f32423a).arrayIndexScale(cls);
        }
    }
}
