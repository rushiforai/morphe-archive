package j$.util.stream;

import j$.util.Spliterator;
import java.util.function.BinaryOperator;
import java.util.function.LongFunction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class l2 extends m2 {
    public final /* synthetic */ int k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ l2(a aVar, Spliterator spliterator, LongFunction longFunction, BinaryOperator binaryOperator, int i) {
        super(aVar, spliterator, longFunction, binaryOperator);
        this.k = i;
    }

    @Override // j$.util.stream.m2, j$.util.stream.d
    public final /* bridge */ /* synthetic */ Object a() {
        switch (this.k) {
        }
        return a();
    }

    @Override // j$.util.stream.m2, j$.util.stream.d
    public final d c(Spliterator spliterator) {
        switch (this.k) {
        }
        return new m2(this, spliterator);
    }
}
