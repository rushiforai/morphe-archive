package j$.util.stream;

import j$.util.Objects;
import j$.util.Spliterator;
import java.util.Arrays;
import java.util.function.IntFunction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class e6 extends y0 implements m8 {
    public final /* synthetic */ int l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e6(a aVar, int i, int i2) {
        super(aVar, i);
        this.l = i2;
    }

    @Override // j$.util.stream.a
    public final g2 K(a aVar, Spliterator spliterator, IntFunction intFunction) {
        switch (this.l) {
            case 0:
                if (y6.SORTED.k(aVar.f)) {
                    return aVar.C(spliterator, false, intFunction);
                }
                int[] iArr = (int[]) ((c2) aVar.C(spliterator, true, intFunction)).b();
                Arrays.sort(iArr);
                return new b3(iArr);
            case 1:
                return (g2) new p8(this, aVar, spliterator, intFunction).invoke();
            default:
                return (g2) new o8(this, aVar, spliterator, intFunction).invoke();
        }
    }

    @Override // j$.util.stream.a
    public Spliterator L(a aVar, Spliterator spliterator) {
        switch (this.l) {
            case 1:
                return y6.ORDERED.k(aVar.f) ? K(aVar, spliterator, new u1(15)).spliterator() : new r8((j$.util.u0) aVar.T(spliterator), 1);
            case 2:
                return y6.ORDERED.k(aVar.f) ? K(aVar, spliterator, new u1(16)).spliterator() : new r8((j$.util.u0) aVar.T(spliterator), 0);
            default:
                return super.L(aVar, spliterator);
        }
    }

    @Override // j$.util.stream.a
    public final l5 N(int i, l5 l5Var) {
        switch (this.l) {
            case 0:
                Objects.requireNonNull(l5Var);
                if (y6.SORTED.k(i)) {
                    return l5Var;
                }
                return y6.SIZED.k(i) ? new j6(l5Var) : new b6(l5Var);
            case 1:
                return new v0(this, l5Var, 6);
            default:
                return new j8(this, l5Var, false);
        }
    }

    @Override // j$.util.stream.m8
    public n8 h(y1 y1Var, boolean z) {
        return new j8(this, y1Var, z);
    }
}
