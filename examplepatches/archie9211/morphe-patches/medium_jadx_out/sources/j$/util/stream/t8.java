package j$.util.stream;

import j$.util.Spliterator;
import java.util.function.Consumer;
import java.util.function.Predicate;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class t8 extends u8 implements Consumer {
    public final Predicate e;
    public Object f;
    public final /* synthetic */ int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t8(Spliterator spliterator, t8 t8Var, int i) {
        super(spliterator, t8Var);
        this.g = i;
        this.e = t8Var.e;
    }

    @Override // java.util.function.Consumer
    /* JADX INFO: renamed from: accept */
    public final void n(Object obj) {
        this.d = (this.d + 1) & 63;
        this.f = obj;
    }

    public final /* synthetic */ Consumer andThen(Consumer consumer) {
        return j$.time.a.d(this, consumer);
    }

    @Override // j$.util.stream.u8
    public final Spliterator b(Spliterator spliterator) {
        switch (this.g) {
            case 0:
                return new t8(spliterator, this, 0);
            default:
                return new t8(spliterator, this, 1);
        }
    }

    @Override // j$.util.Spliterator
    public final boolean tryAdvance(Consumer consumer) {
        boolean zTryAdvance;
        boolean zTest;
        int i = this.g;
        Predicate predicate = this.e;
        Spliterator spliterator = this.a;
        boolean z = false;
        switch (i) {
            case 0:
                if (!this.c) {
                    return spliterator.tryAdvance(consumer);
                }
                this.c = false;
                while (true) {
                    zTryAdvance = spliterator.tryAdvance(this);
                    if (zTryAdvance && a() && predicate.test(this.f)) {
                        z = true;
                    }
                }
                if (!zTryAdvance) {
                    return zTryAdvance;
                }
                if (z) {
                    this.b.set(true);
                }
                consumer.n(this.f);
                return zTryAdvance;
            default:
                if (this.c && a() && spliterator.tryAdvance(this)) {
                    zTest = predicate.test(this.f);
                    if (zTest) {
                        consumer.n(this.f);
                        return true;
                    }
                } else {
                    zTest = true;
                }
                this.c = false;
                if (!zTest) {
                    this.b.set(true);
                }
                return false;
        }
    }

    @Override // j$.util.stream.u8, j$.util.Spliterator
    public Spliterator trySplit() {
        switch (this.g) {
            case 1:
                if (!this.b.get()) {
                    break;
                }
                break;
        }
        return super.trySplit();
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t8(Spliterator spliterator, Predicate predicate, int i) {
        super(spliterator);
        this.g = i;
        this.e = predicate;
    }
}
