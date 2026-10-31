package com.google.protobuf;

/* loaded from: classes.dex */
public final class e0 implements m1 {

    /* renamed from: b, reason: collision with root package name */
    public static final e0 f34845b = new e0(0);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f34846a;

    public /* synthetic */ e0(int i5) {
        this.f34846a = i5;
    }

    @Override // com.google.protobuf.m1
    public final z1 a(Class cls) {
        switch (this.f34846a) {
            case 0:
                if (!n0.class.isAssignableFrom(cls)) {
                    throw new IllegalArgumentException("Unsupported message type: ".concat(cls.getName()));
                }
                try {
                    return (z1) n0.getDefaultInstance(cls.asSubclass(n0.class)).buildMessageInfo();
                } catch (Exception e3) {
                    throw new RuntimeException("Unable to get message info for ".concat(cls.getName()), e3);
                }
            default:
                throw new IllegalStateException("This should never be called.");
        }
    }

    @Override // com.google.protobuf.m1
    public final boolean b(Class cls) {
        switch (this.f34846a) {
            case 0:
                return n0.class.isAssignableFrom(cls);
            default:
                return false;
        }
    }
}
