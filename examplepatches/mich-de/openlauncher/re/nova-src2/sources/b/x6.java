package b;

import ads_mobile_sdk.om3;
import ads_mobile_sdk.pm3;

/* loaded from: classes2.dex */
public final class x6 extends om3 {
    @Override // ads_mobile_sdk.om3
    public final boolean a(Object obj, long j11) {
        return this.f7968a.getBoolean(obj, j11);
    }

    @Override // ads_mobile_sdk.om3
    public final double b(long j11, Object obj) {
        return this.f7968a.getDouble(obj, j11);
    }

    @Override // ads_mobile_sdk.om3
    public final float c(long j11, Object obj) {
        return this.f7968a.getFloat(obj, j11);
    }

    @Override // ads_mobile_sdk.om3
    public final void a(Object obj, long j11, boolean z11) {
        this.f7968a.putBoolean(obj, j11, z11);
    }

    @Override // ads_mobile_sdk.om3
    public final boolean b() {
        if (!super.b()) {
            return false;
        }
        try {
            Class<?> cls = this.f7968a.getClass();
            Class cls2 = Long.TYPE;
            cls.getMethod("getByte", cls2);
            cls.getMethod("putByte", cls2, Byte.TYPE);
            cls.getMethod("getInt", cls2);
            cls.getMethod("putInt", cls2, Integer.TYPE);
            cls.getMethod("getLong", cls2);
            cls.getMethod("putLong", cls2, cls2);
            cls.getMethod("copyMemory", cls2, cls2, cls2);
            cls.getMethod("copyMemory", Object.class, cls2, Object.class, cls2, cls2);
            return true;
        } catch (Throwable th2) {
            pm3.a(th2);
            return false;
        }
    }

    @Override // ads_mobile_sdk.om3
    public final void a(Object obj, long j11, double d5) {
        this.f7968a.putDouble(obj, j11, d5);
    }

    @Override // ads_mobile_sdk.om3
    public final void a(Object obj, long j11, float f11) {
        this.f7968a.putFloat(obj, j11, f11);
    }

    @Override // ads_mobile_sdk.om3
    public final boolean a() {
        if (!super.a()) {
            return false;
        }
        try {
            Class<?> cls = this.f7968a.getClass();
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
            pm3.a(th2);
            return false;
        }
    }
}
