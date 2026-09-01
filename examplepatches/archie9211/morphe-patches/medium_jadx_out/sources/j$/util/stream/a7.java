package j$.util.stream;

import j$.util.Spliterator;
import java.util.Comparator;
import java.util.function.BooleanSupplier;
import java.util.function.Supplier;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class a7 implements Spliterator {
    public final boolean a;
    public final a b;
    public Supplier c;
    public Spliterator d;
    public l5 e;
    public BooleanSupplier f;
    public long g;
    public c h;
    public boolean i;

    public a7(a aVar, Supplier supplier, boolean z) {
        this.b = aVar;
        this.c = supplier;
        this.d = null;
        this.a = z;
    }

    public final boolean a() {
        c cVar = this.h;
        if (cVar == null) {
            if (this.i) {
                return false;
            }
            c();
            d();
            this.g = 0L;
            this.e.c(this.d.getExactSizeIfKnown());
            return b();
        }
        long j = this.g + 1;
        this.g = j;
        boolean z = j < cVar.count();
        if (z) {
            return z;
        }
        this.g = 0L;
        this.h.clear();
        return b();
    }

    public final boolean b() {
        while (this.h.count() == 0) {
            if (this.e.e() || !this.f.getAsBoolean()) {
                if (this.i) {
                    return false;
                }
                this.e.end();
                this.i = true;
            }
        }
        return true;
    }

    public final void c() {
        if (this.d == null) {
            this.d = (Spliterator) this.c.get();
            this.c = null;
        }
    }

    @Override // j$.util.Spliterator
    public final int characteristics() {
        c();
        int i = this.b.f;
        int i2 = i & ((~i) >> 1) & y6.j & y6.f;
        if ((i2 & 64) == 0) {
            return i2;
        }
        return (this.d.characteristics() & 16448) | (i2 & (-16449));
    }

    public abstract void d();

    public abstract a7 e(Spliterator spliterator);

    @Override // j$.util.Spliterator
    public final long estimateSize() {
        c();
        return this.d.estimateSize();
    }

    @Override // j$.util.Spliterator
    public final Comparator getComparator() {
        if (j$.time.a.s(this, 4)) {
            return null;
        }
        throw new IllegalStateException();
    }

    @Override // j$.util.Spliterator
    public final long getExactSizeIfKnown() {
        c();
        if (y6.SIZED.k(this.b.f)) {
            return this.d.getExactSizeIfKnown();
        }
        return -1L;
    }

    @Override // j$.util.Spliterator
    public final /* synthetic */ boolean hasCharacteristics(int i) {
        return j$.time.a.s(this, i);
    }

    public final String toString() {
        return String.format("%s[%s]", getClass().getName(), this.d);
    }

    @Override // j$.util.Spliterator
    public Spliterator trySplit() {
        if (!this.a || this.h != null || this.i) {
            return null;
        }
        c();
        Spliterator spliteratorTrySplit = this.d.trySplit();
        if (spliteratorTrySplit == null) {
            return null;
        }
        return e(spliteratorTrySplit);
    }

    public a7(a aVar, Spliterator spliterator, boolean z) {
        this.b = aVar;
        this.c = null;
        this.d = spliterator;
        this.a = z;
    }
}
