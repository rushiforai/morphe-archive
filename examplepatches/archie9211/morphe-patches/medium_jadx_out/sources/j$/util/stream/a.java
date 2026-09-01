package j$.util.stream;

import j$.util.Objects;
import j$.util.Spliterator;
import java.util.function.IntFunction;
import java.util.function.Supplier;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class a implements g {
    public final a a;
    public final a b;
    public final int c;
    public final a d;
    public int e;
    public int f;
    public Spliterator g;
    public boolean h;
    public final boolean i;
    public Runnable j;
    public boolean k;

    public a(a aVar, int i) {
        if (aVar.h) {
            throw new IllegalStateException("stream has already been operated upon or closed");
        }
        aVar.h = true;
        aVar.d = this;
        this.b = aVar;
        this.c = y6.h & i;
        this.f = y6.h(i, aVar.f);
        a aVar2 = aVar.a;
        this.a = aVar2;
        if (M()) {
            aVar2.i = true;
        }
        this.e = aVar.e + 1;
    }

    public final void A(Spliterator spliterator, l5 l5Var) {
        Objects.requireNonNull(l5Var);
        if (y6.SHORT_CIRCUIT.k(this.f)) {
            B(spliterator, l5Var);
            return;
        }
        l5Var.c(spliterator.getExactSizeIfKnown());
        spliterator.forEachRemaining(l5Var);
        l5Var.end();
    }

    public final boolean B(Spliterator spliterator, l5 l5Var) {
        while (this.e > 0) {
            this = this.b;
        }
        l5Var.c(spliterator.getExactSizeIfKnown());
        boolean zH = this.H(spliterator, l5Var);
        l5Var.end();
        return zH;
    }

    public final g2 C(Spliterator spliterator, boolean z, IntFunction intFunction) {
        if (this.a.k) {
            return F(this, spliterator, z, intFunction);
        }
        y1 y1VarJ = J(G(spliterator), intFunction);
        R(spliterator, y1VarJ);
        return y1VarJ.build();
    }

    public final Object D(e8 e8Var) {
        if (this.h) {
            throw new IllegalStateException("stream has already been operated upon or closed");
        }
        this.h = true;
        return this.a.k ? e8Var.b(this, O(e8Var.f())) : e8Var.a(this, O(e8Var.f()));
    }

    public final g2 E(IntFunction intFunction) {
        if (this.h) {
            throw new IllegalStateException("stream has already been operated upon or closed");
        }
        this.h = true;
        if (!this.a.k || this.b == null || !M()) {
            return C(O(0), true, intFunction);
        }
        this.e = 0;
        a aVar = this.b;
        return K(aVar, aVar.O(0), intFunction);
    }

    public abstract g2 F(a aVar, Spliterator spliterator, boolean z, IntFunction intFunction);

    public final long G(Spliterator spliterator) {
        if (y6.SIZED.k(this.f)) {
            return spliterator.getExactSizeIfKnown();
        }
        return -1L;
    }

    public abstract boolean H(Spliterator spliterator, l5 l5Var);

    public abstract z6 I();

    public abstract y1 J(long j, IntFunction intFunction);

    public g2 K(a aVar, Spliterator spliterator, IntFunction intFunction) {
        throw new UnsupportedOperationException("Parallel evaluation is not supported");
    }

    public Spliterator L(a aVar, Spliterator spliterator) {
        return K(aVar, spliterator, new j$.time.format.a(9)).spliterator();
    }

    public abstract boolean M();

    public abstract l5 N(int i, l5 l5Var);

    public final Spliterator O(int i) {
        int i2;
        int i3;
        a aVar = this.a;
        Spliterator spliteratorL = aVar.g;
        if (spliteratorL == null) {
            throw new IllegalStateException("source already consumed or closed");
        }
        aVar.g = null;
        if (aVar.k && aVar.i) {
            a aVar2 = aVar.d;
            int i4 = 1;
            while (aVar != this) {
                int i5 = aVar2.c;
                if (aVar2.M()) {
                    if (y6.SHORT_CIRCUIT.k(i5)) {
                        i5 &= ~y6.u;
                    }
                    spliteratorL = aVar2.L(aVar, spliteratorL);
                    if (spliteratorL.hasCharacteristics(64)) {
                        i2 = (~y6.t) & i5;
                        i3 = y6.s;
                    } else {
                        i2 = (~y6.s) & i5;
                        i3 = y6.t;
                    }
                    i5 = i2 | i3;
                    i4 = 0;
                }
                int i6 = i4 + 1;
                aVar2.e = i4;
                aVar2.f = y6.h(i5, aVar.f);
                a aVar3 = aVar2;
                aVar2 = aVar2.d;
                aVar = aVar3;
                i4 = i6;
            }
        }
        if (i != 0) {
            this.f = y6.h(i, this.f);
        }
        return spliteratorL;
    }

    public final Spliterator P() {
        a aVar = this.a;
        if (this != aVar) {
            throw new IllegalStateException();
        }
        if (this.h) {
            throw new IllegalStateException("stream has already been operated upon or closed");
        }
        this.h = true;
        Spliterator spliterator = aVar.g;
        if (spliterator == null) {
            throw new IllegalStateException("source already consumed or closed");
        }
        aVar.g = null;
        return spliterator;
    }

    public abstract Spliterator Q(a aVar, Supplier supplier, boolean z);

    public final l5 R(Spliterator spliterator, l5 l5Var) {
        A(spliterator, S((l5) Objects.requireNonNull(l5Var)));
        return l5Var;
    }

    public final l5 S(l5 l5Var) {
        Objects.requireNonNull(l5Var);
        while (this.e > 0) {
            l5Var = this.N(this.b.f, l5Var);
            this = this.b;
        }
        return l5Var;
    }

    public final Spliterator T(Spliterator spliterator) {
        return this.e == 0 ? spliterator : Q(this, new j$.util.n(3, spliterator), this.a.k);
    }

    @Override // java.lang.AutoCloseable
    public final void close() {
        this.h = true;
        this.g = null;
        a aVar = this.a;
        Runnable runnable = aVar.j;
        if (runnable != null) {
            aVar.j = null;
            runnable.run();
        }
    }

    @Override // j$.util.stream.g
    public final boolean isParallel() {
        return this.a.k;
    }

    @Override // j$.util.stream.g
    public final g onClose(Runnable runnable) {
        if (this.h) {
            throw new IllegalStateException("stream has already been operated upon or closed");
        }
        Objects.requireNonNull(runnable);
        a aVar = this.a;
        Runnable runnable2 = aVar.j;
        if (runnable2 != null) {
            runnable = new d8(runnable2, runnable);
        }
        aVar.j = runnable;
        return this;
    }

    @Override // j$.util.stream.g
    public final g parallel() {
        this.a.k = true;
        return this;
    }

    @Override // j$.util.stream.g
    public final g sequential() {
        this.a.k = false;
        return this;
    }

    @Override // j$.util.stream.g
    public Spliterator spliterator() {
        if (this.h) {
            throw new IllegalStateException("stream has already been operated upon or closed");
        }
        this.h = true;
        a aVar = this.a;
        if (this != aVar) {
            return Q(this, new j$.util.n(2, this), aVar.k);
        }
        Spliterator spliterator = aVar.g;
        if (spliterator == null) {
            throw new IllegalStateException("source already consumed or closed");
        }
        aVar.g = null;
        return spliterator;
    }

    public a(Spliterator spliterator, int i, boolean z) {
        this.b = null;
        this.g = spliterator;
        this.a = this;
        int i2 = y6.g & i;
        this.c = i2;
        this.f = (~(i2 << 1)) & y6.l;
        this.e = 0;
        this.k = z;
    }
}
