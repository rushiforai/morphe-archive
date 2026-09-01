package j$.util.stream;

import j$.util.Spliterator;
import java.util.Deque;
import java.util.function.DoubleConsumer;
import java.util.function.IntConsumer;
import java.util.function.LongConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class h3 extends j3 implements j$.util.a1 {
    @Override // j$.util.a1
    public final void forEachRemaining(Object obj) {
        if (this.a == null) {
            return;
        }
        if (this.d != null) {
            while (tryAdvance(obj)) {
            }
            return;
        }
        Spliterator spliterator = this.c;
        if (spliterator != null) {
            ((j$.util.a1) spliterator).forEachRemaining(obj);
            return;
        }
        Deque dequeB = b();
        while (true) {
            f2 f2Var = (f2) j3.a(dequeB);
            if (f2Var == null) {
                this.a = null;
                return;
            }
            f2Var.g(obj);
        }
    }

    @Override // j$.util.a1
    public final boolean tryAdvance(Object obj) {
        f2 f2Var;
        if (!c()) {
            return false;
        }
        boolean zTryAdvance = ((j$.util.a1) this.d).tryAdvance(obj);
        if (!zTryAdvance) {
            if (this.c == null && (f2Var = (f2) j3.a(this.e)) != null) {
                j$.util.a1 a1VarSpliterator = f2Var.spliterator();
                this.d = a1VarSpliterator;
                return a1VarSpliterator.tryAdvance(obj);
            }
            this.a = null;
        }
        return zTryAdvance;
    }

    public /* bridge */ /* synthetic */ void forEachRemaining(IntConsumer intConsumer) {
        forEachRemaining((Object) intConsumer);
    }

    public /* bridge */ /* synthetic */ boolean tryAdvance(IntConsumer intConsumer) {
        return tryAdvance((Object) intConsumer);
    }

    public /* bridge */ /* synthetic */ void forEachRemaining(LongConsumer longConsumer) {
        forEachRemaining((Object) longConsumer);
    }

    public /* bridge */ /* synthetic */ boolean tryAdvance(LongConsumer longConsumer) {
        return tryAdvance((Object) longConsumer);
    }

    public /* bridge */ /* synthetic */ void forEachRemaining(DoubleConsumer doubleConsumer) {
        forEachRemaining((Object) doubleConsumer);
    }

    public /* bridge */ /* synthetic */ boolean tryAdvance(DoubleConsumer doubleConsumer) {
        return tryAdvance((Object) doubleConsumer);
    }
}
