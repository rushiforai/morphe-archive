package j$.util.stream;

import j$.util.Spliterator;
import java.util.concurrent.CountedCompleter;
import java.util.function.BinaryOperator;
import java.util.function.LongFunction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public class m2 extends d {
    public final a h;
    public final LongFunction i;
    public final BinaryOperator j;

    public m2(m2 m2Var, Spliterator spliterator) {
        super(m2Var, spliterator);
        this.h = m2Var.h;
        this.i = m2Var.i;
        this.j = m2Var.j;
    }

    @Override // j$.util.stream.d
    public d c(Spliterator spliterator) {
        return new m2(this, spliterator);
    }

    @Override // j$.util.stream.d
    /* JADX INFO: renamed from: f, reason: merged with bridge method [inline-methods] */
    public final g2 a() {
        y1 y1Var = (y1) this.i.apply(this.h.G(this.b));
        this.h.R(this.b, y1Var);
        return y1Var.build();
    }

    @Override // j$.util.stream.d, java.util.concurrent.CountedCompleter
    public final void onCompletion(CountedCompleter countedCompleter) {
        d dVar = this.d;
        if (dVar != null) {
            this.f = (g2) this.j.apply((g2) ((m2) dVar).f, (g2) ((m2) this.e).f);
        }
        super.onCompletion(countedCompleter);
    }

    public m2(a aVar, Spliterator spliterator, LongFunction longFunction, BinaryOperator binaryOperator) {
        super(aVar, spliterator);
        this.h = aVar;
        this.i = longFunction;
        this.j = binaryOperator;
    }
}
