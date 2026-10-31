package com.google.protobuf;

import java.lang.reflect.Field;
import sun.misc.Unsafe;

/* loaded from: classes.dex */
public abstract class l2 {

    /* renamed from: a, reason: collision with root package name */
    public final Unsafe f34893a;

    public l2(Unsafe unsafe) {
        this.f34893a = unsafe;
    }

    public final int a(Class cls) {
        return this.f34893a.arrayBaseOffset(cls);
    }

    public final int b(Class cls) {
        return this.f34893a.arrayIndexScale(cls);
    }

    public abstract void c(long j11, byte[] bArr, long j12);

    public abstract boolean d(long j11, Object obj);

    public abstract byte e(long j11);

    public abstract double f(long j11, Object obj);

    public abstract float g(long j11, Object obj);

    public final int h(long j11, Object obj) {
        return this.f34893a.getInt(obj, j11);
    }

    public final long i(long j11, Object obj) {
        return this.f34893a.getLong(obj, j11);
    }

    public final Object j(long j11, Object obj) {
        return this.f34893a.getObject(obj, j11);
    }

    public final long k(Field field) {
        return this.f34893a.objectFieldOffset(field);
    }

    public abstract void l(Object obj, long j11, boolean z11);

    public abstract void m(Object obj, long j11, byte b11);

    public abstract void n(Object obj, long j11, double d5);

    public abstract void o(Object obj, long j11, float f11);

    public final void p(long j11, Object obj, int i5) {
        this.f34893a.putInt(obj, j11, i5);
    }

    public final void q(Object obj, long j11, long j12) {
        this.f34893a.putLong(obj, j11, j12);
    }

    public final void r(long j11, Object obj, Object obj2) {
        this.f34893a.putObject(obj, j11, obj2);
    }

    public abstract boolean s();
}
