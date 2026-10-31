package androidx.datastore.preferences.protobuf;

import java.lang.reflect.Field;
import sun.misc.Unsafe;

/* loaded from: classes.dex */
public abstract class m1 {

    /* renamed from: a, reason: collision with root package name */
    public final Unsafe f14360a;

    public m1(Unsafe unsafe) {
        this.f14360a = unsafe;
    }

    public final int a(Class cls) {
        return this.f14360a.arrayBaseOffset(cls);
    }

    public final int b(Class cls) {
        return this.f14360a.arrayIndexScale(cls);
    }

    public abstract boolean c(long j11, Object obj);

    public abstract double d(long j11, Object obj);

    public abstract float e(long j11, Object obj);

    public final int f(long j11, Object obj) {
        return this.f14360a.getInt(obj, j11);
    }

    public final long g(long j11, Object obj) {
        return this.f14360a.getLong(obj, j11);
    }

    public final Object h(long j11, Object obj) {
        return this.f14360a.getObject(obj, j11);
    }

    public final long i(Field field) {
        return this.f14360a.objectFieldOffset(field);
    }

    public abstract void j(Object obj, long j11, boolean z11);

    public abstract void k(Object obj, long j11, byte b11);

    public abstract void l(Object obj, long j11, double d5);

    public abstract void m(Object obj, long j11, float f11);

    public final void n(long j11, Object obj, int i5) {
        this.f14360a.putInt(obj, j11, i5);
    }

    public final void o(Object obj, long j11, long j12) {
        this.f14360a.putLong(obj, j11, j12);
    }

    public final void p(long j11, Object obj, Object obj2) {
        this.f14360a.putObject(obj, j11, obj2);
    }

    public boolean q() {
        Unsafe unsafe = this.f14360a;
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
            n1.a(th2);
            return false;
        }
    }

    public abstract boolean r();
}
