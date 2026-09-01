package j$.util.stream;

import j$.util.Spliterator;
import java.util.concurrent.CountedCompleter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class x4 extends d {
    public final v3 h;

    public x4(x4 x4Var, Spliterator spliterator) {
        super(x4Var, spliterator);
        this.h = x4Var.h;
    }

    @Override // j$.util.stream.d
    public final Object a() {
        a aVar = this.a;
        q4 q4VarX = this.h.X();
        aVar.R(this.b, q4VarX);
        return q4VarX;
    }

    @Override // j$.util.stream.d
    public final d c(Spliterator spliterator) {
        return new x4(this, spliterator);
    }

    @Override // j$.util.stream.d, java.util.concurrent.CountedCompleter
    public final void onCompletion(CountedCompleter countedCompleter) {
        d dVar = this.d;
        if (dVar != null) {
            q4 q4Var = (q4) ((x4) dVar).f;
            q4Var.i((q4) ((x4) this.e).f);
            this.f = q4Var;
        }
        super.onCompletion(countedCompleter);
    }

    public x4(v3 v3Var, a aVar, Spliterator spliterator) {
        super(aVar, spliterator);
        this.h = v3Var;
    }
}
