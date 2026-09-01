package j$.util.stream;

import java.util.function.LongBinaryOperator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class w3 extends v3 {
    public final /* synthetic */ LongBinaryOperator h;
    public final /* synthetic */ long i;

    public w3(z6 z6Var, LongBinaryOperator longBinaryOperator, long j) {
        this.h = longBinaryOperator;
        this.i = j;
    }

    @Override // j$.util.stream.v3
    public final q4 X() {
        return new o4(this.i, this.h);
    }
}
