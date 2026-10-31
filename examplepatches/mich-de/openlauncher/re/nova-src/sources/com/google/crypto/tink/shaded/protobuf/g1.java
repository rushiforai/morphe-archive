package com.google.crypto.tink.shaded.protobuf;

import com.google.android.libraries.places.api.model.PlaceTypes;
import java.lang.reflect.Field;
import java.nio.Buffer;
import java.nio.ByteOrder;
import java.security.AccessController;
import java.util.logging.Level;
import java.util.logging.Logger;
import sun.misc.Unsafe;

/* loaded from: classes3.dex */
public abstract class g1 {

    /* renamed from: a, reason: collision with root package name */
    public static final Unsafe f34599a;

    /* renamed from: b, reason: collision with root package name */
    public static final Class f34600b;

    /* renamed from: c, reason: collision with root package name */
    public static final f1 f34601c;

    /* renamed from: d, reason: collision with root package name */
    public static final boolean f34602d;

    /* renamed from: e, reason: collision with root package name */
    public static final boolean f34603e;

    /* renamed from: f, reason: collision with root package name */
    public static final long f34604f;

    /* renamed from: g, reason: collision with root package name */
    public static final boolean f34605g;

    static {
        Unsafe unsafeJ = j();
        f34599a = unsafeJ;
        f34600b = c.f34577a;
        boolean zF = f(Long.TYPE);
        boolean zF2 = f(Integer.TYPE);
        f1 e1Var = null;
        if (unsafeJ != null) {
            if (!c.a()) {
                e1Var = new e1(unsafeJ);
            } else if (zF) {
                e1Var = new d1(unsafeJ, 1);
            } else if (zF2) {
                e1Var = new d1(unsafeJ, 0);
            }
        }
        f34601c = e1Var;
        f34602d = e1Var == null ? false : e1Var.s();
        f34603e = e1Var == null ? false : e1Var.r();
        f34604f = c(byte[].class);
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
        Field fieldE = e();
        if (fieldE != null && e1Var != null) {
            e1Var.j(fieldE);
        }
        f34605g = ByteOrder.nativeOrder() == ByteOrder.BIG_ENDIAN;
    }

    public static void a(Throwable th2) {
        Logger.getLogger(g1.class.getName()).log(Level.WARNING, "platform method missing - proto runtime falling back to safer methods: " + th2);
    }

    public static Object b(Class cls) {
        try {
            return f34599a.allocateInstance(cls);
        } catch (InstantiationException e3) {
            throw new IllegalStateException(e3);
        }
    }

    public static int c(Class cls) {
        if (f34603e) {
            return f34601c.a(cls);
        }
        return -1;
    }

    public static void d(Class cls) {
        if (f34603e) {
            f34601c.b(cls);
        }
    }

    public static Field e() {
        Field declaredField;
        Field declaredField2;
        if (c.a()) {
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
            declaredField = Buffer.class.getDeclaredField(PlaceTypes.ADDRESS);
        } catch (Throwable unused2) {
            declaredField = null;
        }
        if (declaredField == null || declaredField.getType() != Long.TYPE) {
            return null;
        }
        return declaredField;
    }

    public static boolean f(Class cls) {
        if (!c.a()) {
            return false;
        }
        try {
            Class cls2 = f34600b;
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

    public static byte g(long j11, byte[] bArr) {
        return f34601c.d(f34604f + j11, bArr);
    }

    public static byte h(long j11, Object obj) {
        return (byte) ((f34601c.g((-4) & j11, obj) >>> ((int) (((~j11) & 3) << 3))) & 255);
    }

    public static byte i(long j11, Object obj) {
        return (byte) ((f34601c.g((-4) & j11, obj) >>> ((int) ((j11 & 3) << 3))) & 255);
    }

    public static Unsafe j() {
        try {
            return (Unsafe) AccessController.doPrivileged(new c1());
        } catch (Throwable unused) {
            return null;
        }
    }

    public static void k(byte[] bArr, long j11, byte b11) {
        f34601c.l(bArr, f34604f + j11, b11);
    }

    public static void l(Object obj, long j11, byte b11) {
        long j12 = (-4) & j11;
        int iG = f34601c.g(j12, obj);
        int i5 = ((~((int) j11)) & 3) << 3;
        n(j12, obj, ((255 & b11) << i5) | (iG & (~(255 << i5))));
    }

    public static void m(Object obj, long j11, byte b11) {
        long j12 = (-4) & j11;
        int i5 = (((int) j11) & 3) << 3;
        n(j12, obj, ((255 & b11) << i5) | (f34601c.g(j12, obj) & (~(255 << i5))));
    }

    public static void n(long j11, Object obj, int i5) {
        f34601c.o(j11, obj, i5);
    }

    public static void o(Object obj, long j11, long j12) {
        f34601c.p(obj, j11, j12);
    }

    public static void p(long j11, Object obj, Object obj2) {
        f34601c.q(j11, obj, obj2);
    }
}
