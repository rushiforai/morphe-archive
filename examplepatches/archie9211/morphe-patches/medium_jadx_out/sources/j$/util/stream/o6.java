package j$.util.stream;

import j$.util.Objects;
import java.util.Arrays;
import java.util.Iterator;
import java.util.function.Consumer;
import java.util.function.DoubleConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public class o6 extends u6 implements DoubleConsumer {
    @Override // java.util.function.DoubleConsumer
    public void accept(double d) {
        u();
        double[] dArr = (double[]) this.e;
        int i = this.b;
        this.b = i + 1;
        dArr[i] = d;
    }

    public final /* synthetic */ DoubleConsumer andThen(DoubleConsumer doubleConsumer) {
        return j$.time.a.e(this, doubleConsumer);
    }

    @Override // java.lang.Iterable
    public final void forEach(Consumer consumer) {
        if (consumer instanceof DoubleConsumer) {
            g((DoubleConsumer) consumer);
        } else {
            if (g8.a) {
                g8.a(getClass(), "{0} calling SpinedBuffer.OfDouble.forEach(Consumer)");
                throw null;
            }
            j$.time.a.l((n6) spliterator(), consumer);
        }
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        j$.util.r0 r0VarSpliterator = spliterator();
        Objects.requireNonNull(r0VarSpliterator);
        return new j$.util.f1(r0VarSpliterator);
    }

    @Override // j$.util.stream.u6
    public final Object newArray(int i) {
        return new double[i];
    }

    @Override // j$.util.stream.u6
    public final void p(Object obj, int i, int i2, Object obj2) {
        double[] dArr = (double[]) obj;
        DoubleConsumer doubleConsumer = (DoubleConsumer) obj2;
        while (i < i2) {
            doubleConsumer.accept(dArr[i]);
            i++;
        }
    }

    @Override // j$.util.stream.u6
    public final int q(Object obj) {
        return ((double[]) obj).length;
    }

    @Override // j$.util.stream.u6
    public final Object[] t() {
        return new double[8][];
    }

    public final String toString() {
        double[] dArr = (double[]) b();
        if (dArr.length < 200) {
            return String.format("%s[length=%d, chunks=%d]%s", getClass().getSimpleName(), Integer.valueOf(dArr.length), Integer.valueOf(this.c), Arrays.toString(dArr));
        }
        return String.format("%s[length=%d, chunks=%d]%s...", getClass().getSimpleName(), Integer.valueOf(dArr.length), Integer.valueOf(this.c), Arrays.toString(Arrays.copyOf(dArr, 200)));
    }

    @Override // j$.util.stream.u6, java.lang.Iterable, j$.util.stream.g2
    /* JADX INFO: renamed from: v, reason: merged with bridge method [inline-methods] */
    public j$.util.r0 spliterator() {
        return new n6(this, 0, this.c, 0, this.b);
    }
}
