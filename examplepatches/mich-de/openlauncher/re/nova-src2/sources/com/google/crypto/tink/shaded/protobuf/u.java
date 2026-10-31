package com.google.crypto.tink.shaded.protobuf;

/* loaded from: classes.dex */
public final class u implements m0 {

    /* renamed from: b, reason: collision with root package name */
    public static final u f34668b = new u(0);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f34669a;

    public /* synthetic */ u(int i5) {
        this.f34669a = i5;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.m0
    public final w0 a(Class cls) {
        switch (this.f34669a) {
            case 0:
                if (!x.class.isAssignableFrom(cls)) {
                    throw new IllegalArgumentException("Unsupported message type: ".concat(cls.getName()));
                }
                try {
                    return (w0) x.i(cls.asSubclass(x.class)).h(3);
                } catch (Exception e3) {
                    throw new RuntimeException("Unable to get message info for ".concat(cls.getName()), e3);
                }
            default:
                throw new IllegalStateException("This should never be called.");
        }
    }

    @Override // com.google.crypto.tink.shaded.protobuf.m0
    public final boolean b(Class cls) {
        switch (this.f34669a) {
            case 0:
                return x.class.isAssignableFrom(cls);
            default:
                return false;
        }
    }
}
