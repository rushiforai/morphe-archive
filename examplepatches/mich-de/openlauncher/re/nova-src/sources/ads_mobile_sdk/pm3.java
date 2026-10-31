package ads_mobile_sdk;

import b.k5;
import b.x6;
import com.google.android.libraries.places.api.model.PlaceTypes;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.nio.Buffer;
import java.nio.ByteOrder;
import java.security.AccessController;
import java.util.logging.Level;
import java.util.logging.Logger;
import sun.misc.Unsafe;

/* loaded from: classes2.dex */
public abstract class pm3 {

    /* renamed from: a, reason: collision with root package name */
    public static final Unsafe f8321a;

    /* renamed from: b, reason: collision with root package name */
    public static final Class f8322b;

    /* renamed from: c, reason: collision with root package name */
    public static final om3 f8323c;

    /* renamed from: d, reason: collision with root package name */
    public static final boolean f8324d;

    /* renamed from: e, reason: collision with root package name */
    public static final boolean f8325e;

    /* JADX WARN: Removed duplicated region for block: B:11:0x0034  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0095 A[PHI: r3
      0x0095: PHI (r3v16 java.lang.reflect.Field) = (r3v14 java.lang.reflect.Field), (r3v19 java.lang.reflect.Field) binds: [B:35:0x00a5, B:27:0x0093] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0097  */
    static {
        om3 z5Var;
        Field declaredField;
        Unsafe unsafeA = a();
        f8321a = unsafeA;
        f8322b = qe.a();
        Class<?> cls = Long.TYPE;
        boolean zD = d(cls);
        boolean zD2 = d(Integer.TYPE);
        Field field = null;
        if (unsafeA != null) {
            z5Var = qe.b() ? zD ? new b.z5(unsafeA, 1) : zD2 ? new b.z5(unsafeA, 0) : null : new x6(unsafeA);
        }
        f8323c = z5Var;
        if (z5Var != null) {
            z5Var.b();
        }
        f8324d = z5Var == null ? false : z5Var.a();
        b(byte[].class);
        b(boolean[].class);
        c(boolean[].class);
        b(int[].class);
        c(int[].class);
        b(long[].class);
        c(long[].class);
        b(float[].class);
        c(float[].class);
        b(double[].class);
        c(double[].class);
        b(Object[].class);
        c(Object[].class);
        if (qe.b()) {
            try {
                declaredField = Buffer.class.getDeclaredField("effectiveDirectAddress");
            } catch (Throwable unused) {
                declaredField = null;
            }
            if (declaredField != null) {
                field = declaredField;
            } else {
                try {
                    declaredField = Buffer.class.getDeclaredField(PlaceTypes.ADDRESS);
                } catch (Throwable unused2) {
                    declaredField = null;
                }
                if (declaredField != null && declaredField.getType() == cls) {
                }
            }
        }
        if (field != null && z5Var != null) {
            z5Var.a(field);
        }
        f8325e = ByteOrder.nativeOrder() == ByteOrder.BIG_ENDIAN;
    }

    public static Unsafe a() {
        Unsafe unsafe;
        try {
            unsafe = (Unsafe) AccessController.doPrivileged(new k5());
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
            Logger.getLogger(pm3.class.getName()).log(Level.WARNING, "As part of the planned removal, sun.misc.Unsafe is available in the current environment but configured to throw on use. Protobuf will continue without using it, but with slightly reduced performance. --sun-misc-unsafe-memory-access=allow is likely available to opt back in if desired. A later Protobuf version release will stop using sun.misc.Unsafe entirely.");
            return null;
        }
    }

    public static void b(Class cls) {
        if (f8324d) {
            f8323c.a(cls);
        }
    }

    public static void c(Class cls) {
        if (f8324d) {
            f8323c.b(cls);
        }
    }

    public static boolean d(Class cls) {
        if (!qe.b()) {
            return false;
        }
        try {
            Class cls2 = f8322b;
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

    public static Object a(Class cls) {
        try {
            return f8321a.allocateInstance(cls);
        } catch (InstantiationException e3) {
            throw new IllegalStateException(e3);
        }
    }

    public static void a(long j11, Object obj, int i5) {
        f8323c.a(j11, obj, i5);
    }

    public static void a(Object obj, long j11, boolean z11) {
        f8323c.a(obj, j11, z11);
    }

    public static void a(Object obj, long j11, float f11) {
        f8323c.a(obj, j11, f11);
    }

    public static void a(Object obj, long j11, double d5) {
        f8323c.a(obj, j11, d5);
    }

    public static void a(long j11, Object obj, Serializable serializable) {
        f8323c.a(j11, obj, serializable);
    }

    public static void a(Throwable th2) {
        Logger.getLogger(pm3.class.getName()).log(Level.WARNING, "platform method missing - proto runtime falling back to safer methods: ".concat(String.valueOf(th2)));
    }
}
