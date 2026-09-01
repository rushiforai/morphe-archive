package j$.util.stream;

import j$.util.Spliterator;
import java.util.function.Consumer;
import java.util.function.IntConsumer;
import java.util.function.IntPredicate;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class r8 extends u8 implements IntConsumer, j$.util.u0 {
    public int e;
    public final /* synthetic */ int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ r8(Spliterator spliterator, int i) {
        super(spliterator);
        this.f = i;
    }

    @Override // java.util.function.IntConsumer
    public final void accept(int i) {
        this.d = (this.d + 1) & 63;
        this.e = i;
    }

    public final /* synthetic */ IntConsumer andThen(IntConsumer intConsumer) {
        return j$.time.a.f(this, intConsumer);
    }

    @Override // j$.util.stream.u8
    public final Spliterator b(Spliterator spliterator) {
        switch (this.f) {
            case 0:
                return new r8((j$.util.u0) spliterator, this, 0);
            default:
                return new r8((j$.util.u0) spliterator, this, 1);
        }
    }

    @Override // j$.util.a1
    public final void forEachRemaining(IntConsumer intConsumer) {
        while (tryAdvance(intConsumer)) {
        }
    }

    @Override // j$.util.u0
    public final boolean tryAdvance(IntConsumer intConsumer) {
        int i = this.f;
        Spliterator spliterator = this.a;
        IntPredicate intPredicate = null;
        switch (i) {
            case 0:
                if (!this.c) {
                    return ((j$.util.u0) spliterator).tryAdvance(intConsumer);
                }
                this.c = false;
                boolean zTryAdvance = ((j$.util.u0) spliterator).tryAdvance((IntConsumer) this);
                if (zTryAdvance && a()) {
                    intPredicate.test(this.e);
                    throw null;
                }
                if (!zTryAdvance) {
                    return zTryAdvance;
                }
                intConsumer.accept(this.e);
                return zTryAdvance;
            default:
                if (this.c && a() && ((j$.util.u0) spliterator).tryAdvance((IntConsumer) this)) {
                    intPredicate.test(this.e);
                    throw null;
                }
                this.c = false;
                return false;
        }
    }

    @Override // j$.util.stream.u8, j$.util.Spliterator
    public j$.util.u0 trySplit() {
        switch (this.f) {
            case 1:
                if (this.b.get()) {
                    return null;
                }
                return (j$.util.u0) super.trySplit();
            default:
                return super.trySplit();
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ r8(Spliterator spliterator, u8 u8Var, int i) {
        super(spliterator, u8Var);
        this.f = i;
    }

    @Override // j$.util.stream.u8, j$.util.Spliterator
    public final /* synthetic */ void forEachRemaining(Consumer consumer) {
        j$.time.a.m(this, consumer);
    }

    @Override // j$.util.stream.u8, j$.util.Spliterator
    public /* bridge */ /* synthetic */ Spliterator trySplit() {
        switch (this.f) {
            case 1:
                return trySplit();
            default:
                return super.trySplit();
        }
    }

    @Override // j$.util.stream.u8, j$.util.Spliterator
    public /* bridge */ /* synthetic */ j$.util.a1 trySplit() {
        switch (this.f) {
            case 1:
                return trySplit();
            default:
                return super.trySplit();
        }
    }

    @Override // j$.util.Spliterator
    public final /* synthetic */ boolean tryAdvance(Consumer consumer) {
        return j$.time.a.C(this, consumer);
    }

    @Override // j$.util.a1
    public /* bridge */ /* synthetic */ boolean tryAdvance(Object obj) {
        switch (this.f) {
            case 1:
                tryAdvance((IntConsumer) obj);
                return false;
            default:
                return tryAdvance((IntConsumer) obj);
        }
    }
}
