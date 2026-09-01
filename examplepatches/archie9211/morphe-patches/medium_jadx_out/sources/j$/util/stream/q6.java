package j$.util.stream;

import j$.util.Objects;
import java.util.Arrays;
import java.util.Iterator;
import java.util.function.Consumer;
import java.util.function.IntConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public class q6 extends u6 implements IntConsumer {
    @Override // java.util.function.IntConsumer
    public void accept(int i) {
        u();
        int[] iArr = (int[]) this.e;
        int i2 = this.b;
        this.b = i2 + 1;
        iArr[i2] = i;
    }

    public final /* synthetic */ IntConsumer andThen(IntConsumer intConsumer) {
        return j$.time.a.f(this, intConsumer);
    }

    @Override // java.lang.Iterable
    public final void forEach(Consumer consumer) {
        if (consumer instanceof IntConsumer) {
            g((IntConsumer) consumer);
        } else {
            if (g8.a) {
                g8.a(getClass(), "{0} calling SpinedBuffer.OfInt.forEach(Consumer)");
                throw null;
            }
            j$.time.a.m((p6) spliterator(), consumer);
        }
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        j$.util.u0 u0VarSpliterator = spliterator();
        Objects.requireNonNull(u0VarSpliterator);
        return new j$.util.d1(u0VarSpliterator);
    }

    @Override // j$.util.stream.u6
    public final Object newArray(int i) {
        return new int[i];
    }

    @Override // j$.util.stream.u6
    public final void p(Object obj, int i, int i2, Object obj2) {
        int[] iArr = (int[]) obj;
        IntConsumer intConsumer = (IntConsumer) obj2;
        while (i < i2) {
            intConsumer.accept(iArr[i]);
            i++;
        }
    }

    @Override // j$.util.stream.u6
    public final int q(Object obj) {
        return ((int[]) obj).length;
    }

    @Override // j$.util.stream.u6
    public final Object[] t() {
        return new int[8][];
    }

    public final String toString() {
        int[] iArr = (int[]) b();
        if (iArr.length < 200) {
            return String.format("%s[length=%d, chunks=%d]%s", getClass().getSimpleName(), Integer.valueOf(iArr.length), Integer.valueOf(this.c), Arrays.toString(iArr));
        }
        return String.format("%s[length=%d, chunks=%d]%s...", getClass().getSimpleName(), Integer.valueOf(iArr.length), Integer.valueOf(this.c), Arrays.toString(Arrays.copyOf(iArr, 200)));
    }

    @Override // j$.util.stream.u6, java.lang.Iterable, j$.util.stream.g2
    /* JADX INFO: renamed from: v, reason: merged with bridge method [inline-methods] */
    public j$.util.u0 spliterator() {
        return new p6(this, 0, this.c, 0, this.b);
    }
}
