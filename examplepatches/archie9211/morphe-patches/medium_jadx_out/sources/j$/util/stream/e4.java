package j$.util.stream;

import java.util.function.DoubleBinaryOperator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class e4 extends v3 {
    public final /* synthetic */ DoubleBinaryOperator h;
    public final /* synthetic */ double i;

    public e4(z6 z6Var, DoubleBinaryOperator doubleBinaryOperator, double d) {
        this.h = doubleBinaryOperator;
        this.i = d;
    }

    @Override // j$.util.stream.v3
    public final q4 X() {
        return new z3(this.i, this.h);
    }
}
