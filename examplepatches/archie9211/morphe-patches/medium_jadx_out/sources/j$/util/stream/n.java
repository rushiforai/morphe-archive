package j$.util.stream;

import java.util.function.DoubleConsumer;
import java.util.function.DoubleFunction;
import java.util.function.DoubleUnaryOperator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class n extends e5 {
    public final /* synthetic */ int b;
    public final /* synthetic */ a c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ n(a aVar, l5 l5Var, int i) {
        super(l5Var);
        this.b = i;
        this.c = aVar;
    }

    @Override // j$.util.stream.i5, j$.util.stream.l5
    public final void accept(double d) {
        int i = this.b;
        l5 l5Var = this.a;
        a aVar = this.c;
        switch (i) {
            case 0:
                l5Var.accept(((DoubleFunction) ((p) aVar).m).apply(d));
                break;
            case 1:
                l5Var.accept(((DoubleUnaryOperator) ((q) aVar).m).applyAsDouble(d));
                break;
            default:
                ((DoubleConsumer) ((q) aVar).m).accept(d);
                l5Var.accept(d);
                break;
        }
    }
}
