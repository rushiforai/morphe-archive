package com.google.crypto.tink.shaded.protobuf;

import java.lang.reflect.Field;
import sun.misc.Unsafe;

/* loaded from: classes3.dex */
public final class e1 extends f1 {
    @Override // com.google.crypto.tink.shaded.protobuf.f1
    public final boolean c(long j11, Object obj) {
        return this.f34596a.getBoolean(obj, j11);
    }

    @Override // com.google.crypto.tink.shaded.protobuf.f1
    public final byte d(long j11, Object obj) {
        return this.f34596a.getByte(obj, j11);
    }

    @Override // com.google.crypto.tink.shaded.protobuf.f1
    public final double e(long j11, Object obj) {
        return this.f34596a.getDouble(obj, j11);
    }

    @Override // com.google.crypto.tink.shaded.protobuf.f1
    public final float f(long j11, Object obj) {
        return this.f34596a.getFloat(obj, j11);
    }

    @Override // com.google.crypto.tink.shaded.protobuf.f1
    public final void k(Object obj, long j11, boolean z11) {
        this.f34596a.putBoolean(obj, j11, z11);
    }

    @Override // com.google.crypto.tink.shaded.protobuf.f1
    public final void l(Object obj, long j11, byte b11) {
        this.f34596a.putByte(obj, j11, b11);
    }

    @Override // com.google.crypto.tink.shaded.protobuf.f1
    public final void m(Object obj, long j11, double d5) {
        this.f34596a.putDouble(obj, j11, d5);
    }

    @Override // com.google.crypto.tink.shaded.protobuf.f1
    public final void n(Object obj, long j11, float f11) {
        this.f34596a.putFloat(obj, j11, f11);
    }

    @Override // com.google.crypto.tink.shaded.protobuf.f1
    public final boolean r() {
        if (!super.r()) {
            return false;
        }
        try {
            Class<?> cls = this.f34596a.getClass();
            Class cls2 = Long.TYPE;
            cls.getMethod("getByte", Object.class, cls2);
            cls.getMethod("putByte", Object.class, cls2, Byte.TYPE);
            cls.getMethod("getBoolean", Object.class, cls2);
            cls.getMethod("putBoolean", Object.class, cls2, Boolean.TYPE);
            cls.getMethod("getFloat", Object.class, cls2);
            cls.getMethod("putFloat", Object.class, cls2, Float.TYPE);
            cls.getMethod("getDouble", Object.class, cls2);
            cls.getMethod("putDouble", Object.class, cls2, Double.TYPE);
            return true;
        } catch (Throwable th2) {
            g1.a(th2);
            return false;
        }
    }

    @Override // com.google.crypto.tink.shaded.protobuf.f1
    public final boolean s() {
        Unsafe unsafe = this.f34596a;
        if (unsafe != null) {
            try {
                Class<?> cls = unsafe.getClass();
                cls.getMethod("objectFieldOffset", Field.class);
                Class cls2 = Long.TYPE;
                cls.getMethod("getLong", Object.class, cls2);
                if (g1.e() != null) {
                    try {
                        Class<?> cls3 = this.f34596a.getClass();
                        cls3.getMethod("getByte", cls2);
                        cls3.getMethod("putByte", cls2, Byte.TYPE);
                        cls3.getMethod("getInt", cls2);
                        cls3.getMethod("putInt", cls2, Integer.TYPE);
                        cls3.getMethod("getLong", cls2);
                        cls3.getMethod("putLong", cls2, cls2);
                        cls3.getMethod("copyMemory", cls2, cls2, cls2);
                        cls3.getMethod("copyMemory", Object.class, cls2, Object.class, cls2, cls2);
                        return true;
                    } catch (Throwable th2) {
                        g1.a(th2);
                        return false;
                    }
                }
            } catch (Throwable th3) {
                g1.a(th3);
            }
        }
        return false;
    }
}
