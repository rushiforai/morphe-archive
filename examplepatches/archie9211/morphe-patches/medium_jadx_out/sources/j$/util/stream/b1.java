package j$.util.stream;

import java.util.function.LongConsumer;
import java.util.function.LongFunction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class b1 extends g5 {
    public final /* synthetic */ int b;
    public final /* synthetic */ a c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b1(a aVar, l5 l5Var, int i) {
        super(l5Var);
        this.b = i;
        this.c = aVar;
    }

    @Override // j$.util.stream.k5, j$.util.stream.l5
    public final void accept(long j) {
        int i = this.b;
        l5 l5Var = this.a;
        a aVar = this.c;
        switch (i) {
            case 0:
                l5Var.accept(((LongFunction) ((p) aVar).m).apply(j));
                break;
            default:
                ((LongConsumer) ((e1) aVar).m).accept(j);
                l5Var.accept(j);
                break;
        }
    }
}
