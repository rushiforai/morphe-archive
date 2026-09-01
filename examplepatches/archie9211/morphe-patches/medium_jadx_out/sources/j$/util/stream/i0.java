package j$.util.stream;

import j$.util.Optional;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class i0 extends j0 {
    public static final d0 c;
    public static final d0 d;

    static {
        z6 z6Var = z6.REFERENCE;
        c = new d0(true, z6Var, Optional.empty(), new e0(5), new e0(6));
        d = new d0(false, z6Var, Optional.empty(), new e0(5), new e0(6));
    }

    @Override // java.util.function.Supplier
    public final Object get() {
        if (this.a) {
            return Optional.of(this.b);
        }
        return null;
    }
}
