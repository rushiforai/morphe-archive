package androidx.datastore.preferences.protobuf;

import com.google.android.libraries.places.api.model.PlaceTypes;
import java.lang.reflect.Field;
import java.nio.Buffer;
import java.nio.ByteOrder;
import java.security.AccessController;
import java.util.logging.Level;
import java.util.logging.Logger;
import sun.misc.Unsafe;

/* loaded from: classes.dex */
public abstract class n1 {

    /* renamed from: a, reason: collision with root package name */
    public static final Unsafe f14363a;

    /* renamed from: b, reason: collision with root package name */
    public static final Class f14364b;

    /* renamed from: c, reason: collision with root package name */
    public static final m1 f14365c;

    /* renamed from: d, reason: collision with root package name */
    public static final boolean f14366d;

    /* renamed from: e, reason: collision with root package name */
    public static final boolean f14367e;

    /* renamed from: f, reason: collision with root package name */
    public static final long f14368f;

    /* renamed from: g, reason: collision with root package name */
    public static final boolean f14369g;

    static {
        Unsafe unsafeI = i();
        f14363a = unsafeI;
        f14364b = c.f14286a;
        boolean zH = h(Long.TYPE);
        boolean zH2 = h(Integer.TYPE);
        m1 l1Var = null;
        if (unsafeI != null) {
            if (!c.a()) {
                l1Var = new l1(unsafeI);
            } else if (zH) {
                l1Var = new k1(unsafeI);
            } else if (zH2) {
                l1Var = new j1(unsafeI);
            }
        }
        f14365c = l1Var;
        f14366d = l1Var == null ? false : l1Var.r();
        f14367e = l1Var == null ? false : l1Var.q();
        f14368f = e(byte[].class);
        e(boolean[].class);
        f(boolean[].class);
        e(int[].class);
        f(int[].class);
        e(long[].class);
        f(long[].class);
        e(float[].class);
        f(float[].class);
        e(double[].class);
        f(double[].class);
        e(Object[].class);
        f(Object[].class);
        Field fieldG = g();
        if (fieldG != null && l1Var != null) {
            l1Var.i(fieldG);
        }
        f14369g = ByteOrder.nativeOrder() == ByteOrder.BIG_ENDIAN;
    }

    public static void a(Throwable th2) {
        Logger.getLogger(n1.class.getName()).log(Level.WARNING, "platform method missing - proto runtime falling back to safer methods: " + th2);
    }

    public static boolean b(long j11, Object obj) {
        return ((byte) ((f14365c.f((-4) & j11, obj) >>> ((int) (((~j11) & 3) << 3))) & 255)) != 0;
    }

    public static boolean c(long j11, Object obj) {
        return ((byte) ((f14365c.f((-4) & j11, obj) >>> ((int) ((j11 & 3) << 3))) & 255)) != 0;
    }

    public static Object d(Class cls) {
        try {
            return f14363a.allocateInstance(cls);
        } catch (InstantiationException e3) {
            throw new IllegalStateException(e3);
        }
    }

    public static int e(Class cls) {
        if (f14367e) {
            return f14365c.a(cls);
        }
        return -1;
    }

    public static void f(Class cls) {
        if (f14367e) {
            f14365c.b(cls);
        }
    }

    public static Field g() {
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

    public static boolean h(Class cls) {
        if (!c.a()) {
            return false;
        }
        try {
            Class cls2 = f14364b;
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

    public static Unsafe i() {
        try {
            return (Unsafe) AccessController.doPrivileged(new i1());
        } catch (Throwable unused) {
            return null;
        }
    }

    public static void j(byte[] bArr, long j11, byte b11) {
        f14365c.k(bArr, f14368f + j11, b11);
    }

    public static void k(Object obj, long j11, byte b11) {
        long j12 = (-4) & j11;
        int iF = f14365c.f(j12, obj);
        int i5 = ((~((int) j11)) & 3) << 3;
        m(j12, obj, ((255 & b11) << i5) | (iF & (~(255 << i5))));
    }

    public static void l(Object obj, long j11, byte b11) {
        long j12 = (-4) & j11;
        int i5 = (((int) j11) & 3) << 3;
        m(j12, obj, ((255 & b11) << i5) | (f14365c.f(j12, obj) & (~(255 << i5))));
    }

    public static void m(long j11, Object obj, int i5) {
        f14365c.n(j11, obj, i5);
    }

    public static void n(Object obj, long j11, long j12) {
        f14365c.o(obj, j11, j12);
    }

    public static void o(long j11, Object obj, Object obj2) {
        f14365c.p(j11, obj, obj2);
    }
}
