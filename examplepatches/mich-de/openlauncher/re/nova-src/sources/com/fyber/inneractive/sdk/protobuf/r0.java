package com.fyber.inneractive.sdk.protobuf;

/* loaded from: classes.dex */
public final class r0 implements b2 {

    /* renamed from: a, reason: collision with root package name */
    public static final r0 f30882a = new r0();

    @Override // com.fyber.inneractive.sdk.protobuf.b2
    public final boolean a(Class cls) {
        return z0.class.isAssignableFrom(cls);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b2
    public final r2 b(Class cls) {
        if (!z0.class.isAssignableFrom(cls)) {
            throw new IllegalArgumentException("Unsupported message type: ".concat(cls.getName()));
        }
        try {
            return (r2) z0.getDefaultInstance(cls.asSubclass(z0.class)).buildMessageInfo();
        } catch (Exception e3) {
            throw new RuntimeException("Unable to get message info for ".concat(cls.getName()), e3);
        }
    }
}
