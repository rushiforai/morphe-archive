package com.google.crypto.tink.shaded.protobuf;

import java.lang.reflect.Field;
import sun.misc.Unsafe;

/* loaded from: classes3.dex */
public abstract class f1 {

    /* renamed from: a, reason: collision with root package name */
    public final Unsafe f34596a;

    public f1(Unsafe unsafe) {
        this.f34596a = unsafe;
    }

    public final int a(Class cls) {
        return this.f34596a.arrayBaseOffset(cls);
    }

    public final int b(Class cls) {
        return this.f34596a.arrayIndexScale(cls);
    }

    public abstract boolean c(long j11, Object obj);

    public abstract byte d(long j11, Object obj);

    public abstract double e(long j11, Object obj);

    public abstract float f(long j11, Object obj);

    public final int g(long j11, Object obj) {
        return this.f34596a.getInt(obj, j11);
    }

    public final long h(long j11, Object obj) {
        return this.f34596a.getLong(obj, j11);
    }

    public final Object i(long j11, Object obj) {
        return this.f34596a.getObject(obj, j11);
    }

    public final long j(Field field) {
        return this.f34596a.objectFieldOffset(field);
    }

    public abstract void k(Object obj, long j11, boolean z11);

    public abstract void l(Object obj, long j11, byte b11);

    public abstract void m(Object obj, long j11, double d5);

    public abstract void n(Object obj, long j11, float f11);

    public final void o(long j11, Object obj, int i5) {
        this.f34596a.putInt(obj, j11, i5);
    }

    public final void p(Object obj, long j11, long j12) {
        this.f34596a.putLong(obj, j11, j12);
    }

    public final void q(long j11, Object obj, Object obj2) {
        this.f34596a.putObject(obj, j11, obj2);
    }

    public boolean r() {
        Unsafe unsafe = this.f34596a;
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
            g1.a(th2);
            return false;
        }
    }

    public abstract boolean s();
}
