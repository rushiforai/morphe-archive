package com.google.crypto.tink.shaded.protobuf;

/* loaded from: classes3.dex */
public abstract class r {

    /* renamed from: a, reason: collision with root package name */
    public static final q f34657a = new q();

    /* renamed from: b, reason: collision with root package name */
    public static final q f34658b;

    static {
        u0 u0Var = u0.f34670c;
        q qVar = null;
        try {
            qVar = (q) Class.forName("com.google.crypto.tink.shaded.protobuf.ExtensionSchemaFull").getDeclaredConstructor(null).newInstance(null);
        } catch (Exception unused) {
        }
        f34658b = qVar;
    }

    public static q a() {
        q qVar = f34658b;
        if (qVar != null) {
            return qVar;
        }
        throw new IllegalStateException("Protobuf runtime is not correctly loaded.");
    }
}
