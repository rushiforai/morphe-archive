package defpackage;

import java.lang.reflect.Field;
import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p2e extends q2e {
    @Override // defpackage.q2e
    public final boolean b(long j, Object obj) {
        return this.b.getBoolean(obj, j);
    }

    @Override // defpackage.q2e
    public final double e(long j, Object obj) {
        return this.b.getDouble(obj, j);
    }

    @Override // defpackage.q2e
    public final float f(long j, Object obj) {
        return this.b.getFloat(obj, j);
    }

    @Override // defpackage.q2e
    public final void g(Object obj, long j, boolean z) {
        this.b.putBoolean(obj, j, z);
    }

    @Override // defpackage.q2e
    public final void h(Object obj, long j, byte b) {
        this.b.putByte(obj, j, b);
    }

    @Override // defpackage.q2e
    public final void i(Object obj, long j, double d) {
        this.b.putDouble(obj, j, d);
    }

    @Override // defpackage.q2e
    public final void j(Object obj, long j, float f) {
        this.b.putFloat(obj, j, f);
    }

    @Override // defpackage.q2e
    public final boolean k() {
        if (!super.k()) {
            return false;
        }
        try {
            Class<?> cls = this.b.getClass();
            Class<?> cls2 = Long.TYPE;
            cls.getMethod("getByte", Object.class, cls2);
            cls.getMethod("putByte", Object.class, cls2, Byte.TYPE);
            cls.getMethod("getBoolean", Object.class, cls2);
            cls.getMethod("putBoolean", Object.class, cls2, Boolean.TYPE);
            cls.getMethod("getFloat", Object.class, cls2);
            cls.getMethod("putFloat", Object.class, cls2, Float.TYPE);
            cls.getMethod("getDouble", Object.class, cls2);
            cls.getMethod("putDouble", Object.class, cls2, Double.TYPE);
            return true;
        } catch (Throwable th) {
            s2e.i(th);
            return false;
        }
    }

    @Override // defpackage.q2e
    public final boolean l() {
        Unsafe unsafe = this.b;
        if (unsafe != null) {
            try {
                Class<?> cls = unsafe.getClass();
                cls.getMethod("objectFieldOffset", Field.class);
                Class<?> cls2 = Long.TYPE;
                cls.getMethod("getLong", Object.class, cls2);
                if (s2e.c() != null) {
                    try {
                        Class<?> cls3 = unsafe.getClass();
                        cls3.getMethod("getByte", cls2);
                        cls3.getMethod("putByte", cls2, Byte.TYPE);
                        cls3.getMethod("getInt", cls2);
                        cls3.getMethod("putInt", cls2, Integer.TYPE);
                        cls3.getMethod("getLong", cls2);
                        cls3.getMethod("putLong", cls2, cls2);
                        cls3.getMethod("copyMemory", cls2, cls2, cls2);
                        cls3.getMethod("copyMemory", Object.class, cls2, Object.class, cls2, cls2);
                        return true;
                    } catch (Throwable th) {
                        s2e.i(th);
                        return false;
                    }
                }
            } catch (Throwable th2) {
                s2e.i(th2);
            }
        }
        return false;
    }
}
