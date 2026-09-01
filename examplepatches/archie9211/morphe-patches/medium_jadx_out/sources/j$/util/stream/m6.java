package j$.util.stream;

import j$.util.Objects;
import j$.util.Spliterator;
import j$.util.Spliterators;
import java.util.Comparator;
import java.util.function.Consumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class m6 implements Spliterator {
    public int a;
    public final int b;
    public int c;
    public final int d;
    public Object[] e;
    public final /* synthetic */ v6 f;

    public m6(v6 v6Var, int i, int i2, int i3, int i4) {
        this.f = v6Var;
        this.a = i;
        this.b = i2;
        this.c = i3;
        this.d = i4;
        Object[][] objArr = v6Var.f;
        this.e = objArr == null ? v6Var.e : objArr[i];
    }

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

    @Override // j$.util.Spliterator
    public final void forEachRemaining(Consumer consumer) {
        v6 v6Var;
        Objects.requireNonNull(consumer);
        int i = this.a;
        int i2 = this.d;
        int i3 = this.b;
        if (i < i3 || (i == i3 && this.c < i2)) {
            int i4 = this.c;
            while (true) {
                v6Var = this.f;
                if (i >= i3) {
                    break;
                }
                Object[] objArr = v6Var.f[i];
                while (i4 < objArr.length) {
                    consumer.n(objArr[i4]);
                    i4++;
                }
                i++;
                i4 = 0;
            }
            Object[] objArr2 = this.a == i3 ? this.e : v6Var.f[i3];
            while (i4 < i2) {
                consumer.n(objArr2[i4]);
                i4++;
            }
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

    @Override // j$.util.Spliterator
    public final boolean tryAdvance(Consumer consumer) {
        Objects.requireNonNull(consumer);
        int i = this.a;
        int i2 = this.b;
        if (i >= i2 && (i != i2 || this.c >= this.d)) {
            return false;
        }
        Object[] objArr = this.e;
        int i3 = this.c;
        this.c = i3 + 1;
        consumer.n(objArr[i3]);
        if (this.c == this.e.length) {
            this.c = 0;
            int i4 = this.a + 1;
            this.a = i4;
            Object[][] objArr2 = this.f.f;
            if (objArr2 != null && i4 <= i2) {
                this.e = objArr2[i4];
            }
        }
        return true;
    }

    @Override // j$.util.Spliterator
    public final Spliterator trySplit() {
        int i = this.a;
        int i2 = this.b;
        if (i < i2) {
            int i3 = i2 - 1;
            int i4 = this.c;
            v6 v6Var = this.f;
            m6 m6Var = new m6(v6Var, i, i3, i4, v6Var.f[i3].length);
            this.a = i2;
            this.c = 0;
            this.e = v6Var.f[i2];
            return m6Var;
        }
        if (i != i2) {
            return null;
        }
        int i5 = this.c;
        int i6 = (this.d - i5) / 2;
        if (i6 == 0) {
            return null;
        }
        Object[] objArr = this.e;
        int i7 = i5 + i6;
        Spliterators.a(((Object[]) Objects.requireNonNull(objArr)).length, i5, i7);
        j$.util.g1 g1Var = new j$.util.g1(objArr, i5, i7, 1040);
        this.c += i6;
        return g1Var;
    }
}
