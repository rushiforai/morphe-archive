package j$.util.stream;

import j$.util.Objects;
import java.util.Comparator;
import java.util.function.DoubleConsumer;
import java.util.function.IntConsumer;
import java.util.function.LongConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class t6 implements j$.util.a1 {
    public int a;
    public final int b;
    public int c;
    public final int d;
    public Object e;
    public final /* synthetic */ u6 f;

    public t6(u6 u6Var, int i, int i2, int i3, int i4) {
        this.f = u6Var;
        this.a = i;
        this.b = i2;
        this.c = i3;
        this.d = i4;
        Object[] objArr = u6Var.f;
        this.e = objArr == null ? u6Var.e : objArr[i];
    }

    public abstract void a(int i, Object obj, Object obj2);

    public abstract j$.util.a1 b(Object obj, int i, int i2);

    public abstract j$.util.a1 c(int i, int i2, int i3, int i4);

    @Override // j$.util.Spliterator
    public final int characteristics() {
        return 16464;
    }

    @Override // j$.util.Spliterator
    public final long estimateSize() {
        int i = this.a;
        int i2 = this.d;
        int i3 = this.b;
        if (i == i3) {
            return ((long) i2) - ((long) this.c);
        }
        long[] jArr = this.f.d;
        return ((jArr[i3] + ((long) i2)) - jArr[i]) - ((long) this.c);
    }

    @Override // j$.util.a1
    public final void forEachRemaining(Object obj) {
        u6 u6Var;
        Objects.requireNonNull(obj);
        int i = this.a;
        int i2 = this.d;
        int i3 = this.b;
        if (i < i3 || (i == i3 && this.c < i2)) {
            int i4 = this.c;
            while (true) {
                u6Var = this.f;
                if (i >= i3) {
                    break;
                }
                Object obj2 = u6Var.f[i];
                u6Var.p(obj2, i4, u6Var.q(obj2), obj);
                i++;
                i4 = 0;
            }
            u6Var.p(this.a == i3 ? this.e : u6Var.f[i3], i4, i2, obj);
            this.a = i3;
            this.c = i2;
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

    @Override // j$.util.a1
    public final boolean tryAdvance(Object obj) {
        Objects.requireNonNull(obj);
        int i = this.a;
        int i2 = this.b;
        if (i >= i2 && (i != i2 || this.c >= this.d)) {
            return false;
        }
        Object obj2 = this.e;
        int i3 = this.c;
        this.c = i3 + 1;
        a(i3, obj2, obj);
        int i4 = this.c;
        Object obj3 = this.e;
        u6 u6Var = this.f;
        if (i4 == u6Var.q(obj3)) {
            this.c = 0;
            int i5 = this.a + 1;
            this.a = i5;
            Object[] objArr = u6Var.f;
            if (objArr != null && i5 <= i2) {
                this.e = objArr[i5];
            }
        }
        return true;
    }

    @Override // j$.util.Spliterator
    public final j$.util.a1 trySplit() {
        int i = this.a;
        int i2 = this.b;
        if (i < i2) {
            int i3 = i2 - 1;
            int i4 = this.c;
            u6 u6Var = this.f;
            j$.util.a1 a1VarC = c(i, i3, i4, u6Var.q(u6Var.f[i3]));
            this.a = i2;
            this.c = 0;
            this.e = u6Var.f[i2];
            return a1VarC;
        }
        if (i != i2) {
            return null;
        }
        int i5 = this.c;
        int i6 = (this.d - i5) / 2;
        if (i6 == 0) {
            return null;
        }
        j$.util.a1 a1VarB = b(this.e, i5, i6);
        this.c += i6;
        return a1VarB;
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

    public /* bridge */ /* synthetic */ boolean tryAdvance(IntConsumer intConsumer) {
        return tryAdvance((Object) intConsumer);
    }

    public /* bridge */ /* synthetic */ boolean tryAdvance(LongConsumer longConsumer) {
        return tryAdvance((Object) longConsumer);
    }

    @Override // j$.util.a1, j$.util.Spliterator
    public /* bridge */ /* synthetic */ j$.util.u0 trySplit() {
        return (j$.util.u0) trySplit();
    }

    public /* bridge */ /* synthetic */ boolean tryAdvance(DoubleConsumer doubleConsumer) {
        return tryAdvance((Object) doubleConsumer);
    }

    @Override // j$.util.a1, j$.util.Spliterator
    public /* bridge */ /* synthetic */ j$.util.x0 trySplit() {
        return (j$.util.x0) trySplit();
    }

    @Override // j$.util.a1, j$.util.Spliterator
    public /* bridge */ /* synthetic */ j$.util.r0 trySplit() {
        return (j$.util.r0) trySplit();
    }
}
