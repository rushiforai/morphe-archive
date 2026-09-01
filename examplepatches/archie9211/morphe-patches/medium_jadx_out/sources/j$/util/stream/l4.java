package j$.util.stream;

import java.util.function.IntBinaryOperator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class l4 extends v3 {
    public final /* synthetic */ IntBinaryOperator h;
    public final /* synthetic */ int i;

    public l4(z6 z6Var, IntBinaryOperator intBinaryOperator, int i) {
        this.h = intBinaryOperator;
        this.i = i;
    }

    @Override // j$.util.stream.v3
    public final q4 X() {
        return new k4(this.i, this.h);
    }
}
