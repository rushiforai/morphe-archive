package j$.util.stream;

import j$.util.Spliterator;
import java.util.ArrayDeque;
import java.util.Comparator;
import java.util.Deque;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class j3 implements Spliterator {
    public g2 a;
    public int b;
    public Spliterator c;
    public Spliterator d;
    public Deque e;

    public j3(i2 i2Var) {
        this.a = i2Var;
    }

    public static g2 a(Deque deque) {
        while (true) {
            ArrayDeque arrayDeque = (ArrayDeque) deque;
            g2 g2Var = (g2) arrayDeque.pollFirst();
            if (g2Var == null) {
                return null;
            }
            if (g2Var.o() != 0) {
                for (int iO = g2Var.o() - 1; iO >= 0; iO--) {
                    arrayDeque.addFirst(g2Var.a(iO));
                }
            } else if (g2Var.count() > 0) {
                return g2Var;
            }
        }
    }

    public final Deque b() {
        ArrayDeque arrayDeque = new ArrayDeque(8);
        int iO = this.a.o();
        while (true) {
            iO--;
            if (iO < this.b) {
                return arrayDeque;
            }
            arrayDeque.addFirst(this.a.a(iO));
        }
    }

    public final boolean c() {
        if (this.a == null) {
            return false;
        }
        if (this.d != null) {
            return true;
        }
        Spliterator spliterator = this.c;
        if (spliterator != null) {
            this.d = spliterator;
            return true;
        }
        Deque dequeB = b();
        this.e = dequeB;
        g2 g2VarA = a(dequeB);
        if (g2VarA != null) {
            this.d = g2VarA.spliterator();
            return true;
        }
        this.a = null;
        return false;
    }

    @Override // j$.util.Spliterator
    public final int characteristics() {
        return 64;
    }

    @Override // j$.util.Spliterator
    public final long estimateSize() {
        long jCount = 0;
        if (this.a == null) {
            return 0L;
        }
        Spliterator spliterator = this.c;
        if (spliterator != null) {
            return spliterator.estimateSize();
        }
        for (int i = this.b; i < this.a.o(); i++) {
            jCount += this.a.a(i).count();
        }
        return jCount;
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
    public final Spliterator trySplit() {
        g2 g2Var = this.a;
        if (g2Var == null || this.d != null) {
            return null;
        }
        Spliterator spliterator = this.c;
        if (spliterator != null) {
            return spliterator.trySplit();
        }
        int i = this.b;
        int iO = g2Var.o() - 1;
        g2 g2Var2 = this.a;
        int i2 = this.b;
        if (i < iO) {
            this.b = i2 + 1;
            return g2Var2.a(i2).spliterator();
        }
        g2 g2VarA = g2Var2.a(i2);
        this.a = g2VarA;
        int iO2 = g2VarA.o();
        g2 g2Var3 = this.a;
        if (iO2 != 0) {
            this.b = 1;
            return g2Var3.a(0).spliterator();
        }
        Spliterator spliterator2 = g2Var3.spliterator();
        this.c = spliterator2;
        return spliterator2.trySplit();
    }

    @Override // j$.util.Spliterator
    public /* bridge */ /* synthetic */ j$.util.a1 trySplit() {
        return (j$.util.a1) trySplit();
    }

    @Override // j$.util.Spliterator
    public /* bridge */ /* synthetic */ j$.util.u0 trySplit() {
        return (j$.util.u0) trySplit();
    }

    @Override // j$.util.Spliterator
    public /* bridge */ /* synthetic */ j$.util.x0 trySplit() {
        return (j$.util.x0) trySplit();
    }

    @Override // j$.util.Spliterator
    public /* bridge */ /* synthetic */ j$.util.r0 trySplit() {
        return (j$.util.r0) trySplit();
    }
}
