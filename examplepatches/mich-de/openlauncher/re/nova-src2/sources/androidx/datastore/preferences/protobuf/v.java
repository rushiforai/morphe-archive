package androidx.datastore.preferences.protobuf;

/* loaded from: classes.dex */
public final class v implements o0 {

    /* renamed from: b, reason: collision with root package name */
    public static final v f14405b = new v(0);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f14406a;

    public /* synthetic */ v(int i5) {
        this.f14406a = i5;
    }

    @Override // androidx.datastore.preferences.protobuf.o0
    public final y0 a(Class cls) {
        switch (this.f14406a) {
            case 0:
                if (!y.class.isAssignableFrom(cls)) {
                    throw new IllegalArgumentException("Unsupported message type: ".concat(cls.getName()));
                }
                try {
                    return (y0) y.c(cls.asSubclass(y.class)).b(3);
                } catch (Exception e3) {
                    throw new RuntimeException("Unable to get message info for ".concat(cls.getName()), e3);
                }
            default:
                throw new IllegalStateException("This should never be called.");
        }
    }

    @Override // androidx.datastore.preferences.protobuf.o0
    public final boolean b(Class cls) {
        switch (this.f14406a) {
            case 0:
                return y.class.isAssignableFrom(cls);
            default:
                return false;
        }
    }
}
