package com.google.crypto.tink.shaded.protobuf;

/* loaded from: classes3.dex */
public abstract class l0 {

    /* renamed from: a, reason: collision with root package name */
    public static final k0 f34628a;

    /* renamed from: b, reason: collision with root package name */
    public static final k0 f34629b;

    static {
        u0 u0Var = u0.f34670c;
        k0 k0Var = null;
        try {
            k0Var = (k0) Class.forName("com.google.crypto.tink.shaded.protobuf.MapFieldSchemaFull").getDeclaredConstructor(null).newInstance(null);
        } catch (Exception unused) {
        }
        f34628a = k0Var;
        f34629b = new k0();
    }

    public static k0 a() {
        return f34628a;
    }

    public static k0 b() {
        return f34629b;
    }
}
