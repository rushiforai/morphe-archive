package com.fyber.inneractive.sdk.protobuf;

import com.google.android.libraries.places.api.model.PlaceTypes;
import java.lang.reflect.Field;
import java.nio.Buffer;
import sun.misc.Unsafe;

/* loaded from: classes3.dex */
public final class v3 extends w3 {
    public v3(Unsafe unsafe) {
        super(unsafe);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w3
    public final boolean a() {
        if (!super.a()) {
            return false;
        }
        try {
            Class<?> cls = this.f30941a.getClass();
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
            x3.a(th2);
            return false;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0038 A[PHI: r4
      0x0038: PHI (r4v9 java.lang.reflect.Field) = (r4v5 java.lang.reflect.Field), (r4v12 java.lang.reflect.Field) binds: [B:22:0x004a, B:12:0x0036] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:16:0x003c  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0050 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    @Override // com.fyber.inneractive.sdk.protobuf.w3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean b() {
        Field declaredField;
        Class<?> cls = Long.TYPE;
        Unsafe unsafe = this.f30941a;
        if (unsafe != null) {
            try {
                Class<?> cls2 = unsafe.getClass();
                cls2.getMethod("objectFieldOffset", Field.class);
                cls2.getMethod("getLong", Object.class, cls);
                Field field = null;
                if (d.a()) {
                    try {
                        declaredField = Buffer.class.getDeclaredField("effectiveDirectAddress");
                    } catch (Throwable unused) {
                        declaredField = null;
                    }
                    if (declaredField != null) {
                        field = declaredField;
                        if (field != null) {
                            try {
                                Class<?> cls3 = this.f30941a.getClass();
                                cls3.getMethod("getByte", cls);
                                cls3.getMethod("putByte", cls, Byte.TYPE);
                                cls3.getMethod("getInt", cls);
                                cls3.getMethod("putInt", cls, Integer.TYPE);
                                cls3.getMethod("getLong", cls);
                                cls3.getMethod("putLong", cls, cls);
                                cls3.getMethod("copyMemory", cls, cls, cls);
                                cls3.getMethod("copyMemory", Object.class, cls, Object.class, cls, cls);
                                return true;
                            } catch (Throwable th2) {
                                x3.a(th2);
                                return false;
                            }
                        }
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
                        if (field != null) {
                        }
                    }
                }
            } catch (Throwable th3) {
                x3.a(th3);
            }
        }
        return false;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w3
    public final double c(Object obj, long j11) {
        return this.f30941a.getDouble(obj, j11);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w3
    public final float d(Object obj, long j11) {
        return this.f30941a.getFloat(obj, j11);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w3
    public final void a(Object obj, long j11, byte b11) {
        this.f30941a.putByte(obj, j11, b11);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w3
    public final boolean a(Object obj, long j11) {
        return this.f30941a.getBoolean(obj, j11);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w3
    public final void a(Object obj, long j11, boolean z11) {
        this.f30941a.putBoolean(obj, j11, z11);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w3
    public final void a(Object obj, long j11, float f11) {
        this.f30941a.putFloat(obj, j11, f11);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w3
    public final void a(Object obj, long j11, double d5) {
        this.f30941a.putDouble(obj, j11, d5);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w3
    public final byte a(long j11) {
        return this.f30941a.getByte(j11);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w3
    public final void a(long j11, byte[] bArr, long j12) {
        this.f30941a.copyMemory((Object) null, j11, bArr, x3.f30958f, j12);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w3
    public final byte b(Object obj, long j11) {
        return this.f30941a.getByte(obj, j11);
    }
}
