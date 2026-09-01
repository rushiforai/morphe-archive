package j$.util.stream;

import java.util.function.DoubleConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class q extends y {
    public final /* synthetic */ int l;
    public final /* synthetic */ Object m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q(z zVar, DoubleConsumer doubleConsumer) {
        super(zVar, 0);
        this.l = 2;
        this.m = doubleConsumer;
    }

    @Override // j$.util.stream.a
    public final l5 N(int i, l5 l5Var) {
        switch (this.l) {
            case 0:
                return new n(this, l5Var, 1);
            case 1:
                return new u(this, l5Var);
            case 2:
                return new n(this, l5Var, 2);
            case 3:
                return new l(this, l5Var, 6);
            default:
                return new y4(this, l5Var);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ q(a aVar, int i, Object obj, int i2) {
        super(aVar, i);
        this.l = i2;
        this.m = obj;
    }
}
