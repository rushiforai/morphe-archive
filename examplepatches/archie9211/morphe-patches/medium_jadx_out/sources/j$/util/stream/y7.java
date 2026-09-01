package j$.util.stream;

import j$.util.Objects;
import j$.util.Spliterator;
import java.util.Comparator;
import java.util.function.Consumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class y7 extends a8 implements Spliterator, Consumer {
    public Object e;

    @Override // java.util.function.Consumer
    /* JADX INFO: renamed from: accept */
    public final void n(Object obj) {
        this.e = obj;
    }

    public final /* synthetic */ Consumer andThen(Consumer consumer) {
        return j$.time.a.d(this, consumer);
    }

    @Override // j$.util.stream.a8
    public final Spliterator b(Spliterator spliterator) {
        return new y7(spliterator, this);
    }

    @Override // j$.util.Spliterator
    public final void forEachRemaining(Consumer consumer) {
        Objects.requireNonNull(consumer);
        f7 f7Var = null;
        while (true) {
            z7 z7VarF = f();
            if (z7VarF == z7.NO_MORE) {
                return;
            }
            z7 z7Var = z7.MAYBE_MORE;
            Spliterator spliterator = this.a;
            if (z7VarF != z7Var) {
                spliterator.forEachRemaining(consumer);
                return;
            }
            if (f7Var == null) {
                f7Var = new f7();
            } else {
                f7Var.a = 0;
            }
            long j = 0;
            while (spliterator.tryAdvance(f7Var)) {
                j++;
                if (j >= 128) {
                    break;
                }
            }
            if (j == 0) {
                return;
            }
            long jA = a(j);
            for (int i = 0; i < jA; i++) {
                consumer.n(f7Var.b[i]);
            }
        }
    }

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

    @Override // j$.util.Spliterator
    public final boolean tryAdvance(Consumer consumer) {
        Objects.requireNonNull(consumer);
        while (f() != z7.NO_MORE && this.a.tryAdvance(this)) {
            if (a(1L) == 1) {
                consumer.n(this.e);
                this.e = null;
                return true;
            }
        }
        return false;
    }
}
