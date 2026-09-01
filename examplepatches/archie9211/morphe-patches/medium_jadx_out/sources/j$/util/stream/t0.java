package j$.util.stream;

import java.util.function.IntConsumer;
import java.util.function.IntFunction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class t0 extends f5 {
    public final /* synthetic */ int b;
    public final /* synthetic */ a c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ t0(a aVar, l5 l5Var, int i) {
        super(l5Var);
        this.b = i;
        this.c = aVar;
    }

    @Override // j$.util.stream.j5, j$.util.stream.l5
    public final void accept(int i) {
        int i2 = this.b;
        l5 l5Var = this.a;
        a aVar = this.c;
        switch (i2) {
            case 0:
                l5Var.accept(((IntFunction) ((p) aVar).m).apply(i));
                break;
            default:
                ((IntConsumer) ((u0) aVar).m).accept(i);
                l5Var.accept(i);
                break;
        }
    }
}
