package j$.util.stream;

import j$.util.Objects;
import j$.util.Spliterator;
import java.util.Comparator;
import java.util.function.DoubleConsumer;
import java.util.function.IntConsumer;
import java.util.function.LongConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class x7 extends a8 implements j$.util.a1 {
    @Override // j$.util.a1
    public final void forEachRemaining(Object obj) {
        Objects.requireNonNull(obj);
        e7 e7VarJ = null;
        while (true) {
            z7 z7VarF = f();
            if (z7VarF == z7.NO_MORE) {
                return;
            }
            z7 z7Var = z7.MAYBE_MORE;
            Spliterator spliterator = this.a;
            if (z7VarF != z7Var) {
                ((j$.util.a1) spliterator).forEachRemaining(obj);
                return;
            }
            if (e7VarJ == null) {
                e7VarJ = j();
            } else {
                e7VarJ.b = 0;
            }
            long j = 0;
            while (((j$.util.a1) spliterator).tryAdvance(e7VarJ)) {
                j++;
                if (j >= 128) {
                    break;
                }
            }
            if (j == 0) {
                return;
            } else {
                e7VarJ.a(obj, a(j));
            }
        }
    }

    public abstract void g(Object obj);

    @Override // j$.util.Spliterator
    public final Comparator getComparator() {
        throw new IllegalStateException();
    }

    @Override // j$.util.Spliterator
    public final /* synthetic */ long getExactSizeIfKnown() {
        return j$.time.a.q(this);
    }

    @Override // j$.util.Spliterator
    public final /* synthetic */ boolean hasCharacteristics(int i) {
        return j$.time.a.s(this, i);
    }

    public abstract e7 j();

    @Override // j$.util.a1
    public final boolean tryAdvance(Object obj) {
        Objects.requireNonNull(obj);
        while (f() != z7.NO_MORE && ((j$.util.a1) this.a).tryAdvance(this)) {
            if (a(1L) == 1) {
                g(obj);
                return true;
            }
        }
        return false;
    }

    public /* bridge */ /* synthetic */ boolean tryAdvance(IntConsumer intConsumer) {
        return tryAdvance((Object) intConsumer);
    }

    public /* bridge */ /* synthetic */ boolean tryAdvance(LongConsumer longConsumer) {
        return tryAdvance((Object) longConsumer);
    }

    public /* bridge */ /* synthetic */ boolean tryAdvance(DoubleConsumer doubleConsumer) {
        return tryAdvance((Object) doubleConsumer);
    }

    public /* bridge */ /* synthetic */ void forEachRemaining(IntConsumer intConsumer) {
        forEachRemaining((Object) intConsumer);
    }

    public /* bridge */ /* synthetic */ void forEachRemaining(LongConsumer longConsumer) {
        forEachRemaining((Object) longConsumer);
    }

    public /* bridge */ /* synthetic */ void forEachRemaining(DoubleConsumer doubleConsumer) {
        forEachRemaining((Object) doubleConsumer);
    }
}
