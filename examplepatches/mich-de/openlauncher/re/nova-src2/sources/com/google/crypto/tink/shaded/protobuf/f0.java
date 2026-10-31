package com.google.crypto.tink.shaded.protobuf;

/* loaded from: classes3.dex */
public abstract class f0 {

    /* renamed from: a, reason: collision with root package name */
    public static final e0 f34594a;

    /* renamed from: b, reason: collision with root package name */
    public static final e0 f34595b;

    static {
        u0 u0Var = u0.f34670c;
        e0 e0Var = null;
        try {
            e0Var = (e0) Class.forName("com.google.crypto.tink.shaded.protobuf.ListFieldSchemaFull").getDeclaredConstructor(null).newInstance(null);
        } catch (Exception unused) {
        }
        f34594a = e0Var;
        f34595b = new e0();
    }

    public static e0 a() {
        return f34594a;
    }

    public static e0 b() {
        return f34595b;
    }
}
