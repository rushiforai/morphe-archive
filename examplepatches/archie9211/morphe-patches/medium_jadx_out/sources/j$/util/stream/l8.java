package j$.util.stream;

import java.util.function.DoublePredicate;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class l8 extends e5 implements n8 {
    public l8(d6 d6Var, l5 l5Var, boolean z) {
        super(l5Var);
    }

    @Override // j$.util.stream.i5, j$.util.stream.l5
    public final void accept(double d) {
        DoublePredicate doublePredicate = null;
        doublePredicate.test(d);
        throw null;
    }

    @Override // j$.util.stream.n8
    public final long h() {
        return 0L;
    }
}
