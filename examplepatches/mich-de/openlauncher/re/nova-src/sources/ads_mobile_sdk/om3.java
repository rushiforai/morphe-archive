package ads_mobile_sdk;

import com.google.android.libraries.places.api.model.PlaceTypes;
import java.lang.reflect.Field;
import java.nio.Buffer;
import sun.misc.Unsafe;

/* loaded from: classes2.dex */
public abstract class om3 {

    /* renamed from: a, reason: collision with root package name */
    public final Unsafe f7968a;

    public om3(Unsafe unsafe) {
        this.f7968a = unsafe;
    }

    public final int a(Class cls) {
        return this.f7968a.arrayBaseOffset(cls);
    }

    public abstract void a(Object obj, long j11, double d5);

    public abstract void a(Object obj, long j11, float f11);

    public abstract void a(Object obj, long j11, boolean z11);

    public abstract boolean a(Object obj, long j11);

    public abstract double b(long j11, Object obj);

    public final void b(Class cls) {
        this.f7968a.arrayIndexScale(cls);
    }

    public abstract float c(long j11, Object obj);

    public final int d(long j11, Object obj) {
        return this.f7968a.getInt(obj, j11);
    }

    public final long e(long j11, Object obj) {
        return this.f7968a.getLong(obj, j11);
    }

    public final Object f(long j11, Object obj) {
        return this.f7968a.getObject(obj, j11);
    }

    public final void a(Field field) {
        this.f7968a.objectFieldOffset(field);
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0037 A[PHI: r1
      0x0037: PHI (r1v8 java.lang.reflect.Field) = (r1v6 java.lang.reflect.Field), (r1v11 java.lang.reflect.Field) binds: [B:22:0x0049, B:12:0x0035] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:16:0x003b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean b() {
        Field declaredField;
        Class<?> cls = Long.TYPE;
        Unsafe unsafe = this.f7968a;
        if (unsafe == null) {
            return false;
        }
        try {
            Class<?> cls2 = unsafe.getClass();
            cls2.getMethod("objectFieldOffset", Field.class);
            cls2.getMethod("getLong", Object.class, cls);
            Unsafe unsafe2 = pm3.f8321a;
            Field field = null;
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
                    if (declaredField != null) {
                        if (declaredField.getType() == cls) {
                        }
                    }
                }
            }
            return field != null;
        } catch (Throwable th2) {
            pm3.a(th2);
            return false;
        }
    }

    public final void a(long j11, Object obj, int i5) {
        this.f7968a.putInt(obj, j11, i5);
    }

    public final void a(Object obj, long j11, long j12) {
        this.f7968a.putLong(obj, j11, j12);
    }

    public final void a(long j11, Object obj, Object obj2) {
        this.f7968a.putObject(obj, j11, obj2);
    }

    public boolean a() {
        Unsafe unsafe = this.f7968a;
        if (unsafe == null) {
            return false;
        }
        try {
            Class<?> cls = unsafe.getClass();
            cls.getMethod("objectFieldOffset", Field.class);
            cls.getMethod("arrayBaseOffset", Class.class);
            cls.getMethod("arrayIndexScale", Class.class);
            Class cls2 = Long.TYPE;
            cls.getMethod("getInt", Object.class, cls2);
            cls.getMethod("putInt", Object.class, cls2, Integer.TYPE);
            cls.getMethod("getLong", Object.class, cls2);
            cls.getMethod("putLong", Object.class, cls2, cls2);
            cls.getMethod("getObject", Object.class, cls2);
            cls.getMethod("putObject", Object.class, cls2, Object.class);
            return true;
        } catch (Throwable th2) {
            pm3.a(th2);
            return false;
        }
    }
}
