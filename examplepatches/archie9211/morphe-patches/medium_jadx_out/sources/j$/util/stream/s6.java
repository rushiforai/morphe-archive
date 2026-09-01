package j$.util.stream;

import j$.util.Objects;
import java.util.Arrays;
import java.util.Iterator;
import java.util.function.Consumer;
import java.util.function.LongConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public class s6 extends u6 implements LongConsumer {
    @Override // java.util.function.LongConsumer
    public void accept(long j) {
        u();
        long[] jArr = (long[]) this.e;
        int i = this.b;
        this.b = i + 1;
        jArr[i] = j;
    }

    public final /* synthetic */ LongConsumer andThen(LongConsumer longConsumer) {
        return j$.time.a.g(this, longConsumer);
    }

    @Override // java.lang.Iterable
    public final void forEach(Consumer consumer) {
        if (consumer instanceof LongConsumer) {
            g((LongConsumer) consumer);
        } else {
            if (g8.a) {
                g8.a(getClass(), "{0} calling SpinedBuffer.OfLong.forEach(Consumer)");
                throw null;
            }
            j$.time.a.n((r6) spliterator(), consumer);
        }
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        j$.util.x0 x0VarSpliterator = spliterator();
        Objects.requireNonNull(x0VarSpliterator);
        return new j$.util.e1(x0VarSpliterator);
    }

    @Override // j$.util.stream.u6
    public final Object newArray(int i) {
        return new long[i];
    }

    @Override // j$.util.stream.u6
    public final void p(Object obj, int i, int i2, Object obj2) {
        long[] jArr = (long[]) obj;
        LongConsumer longConsumer = (LongConsumer) obj2;
        while (i < i2) {
            longConsumer.accept(jArr[i]);
            i++;
        }
    }

    @Override // j$.util.stream.u6
    public final int q(Object obj) {
        return ((long[]) obj).length;
    }

    @Override // j$.util.stream.u6
    public final Object[] t() {
        return new long[8][];
    }

    public final String toString() {
        long[] jArr = (long[]) b();
        if (jArr.length < 200) {
            return String.format("%s[length=%d, chunks=%d]%s", getClass().getSimpleName(), Integer.valueOf(jArr.length), Integer.valueOf(this.c), Arrays.toString(jArr));
        }
        return String.format("%s[length=%d, chunks=%d]%s...", getClass().getSimpleName(), Integer.valueOf(jArr.length), Integer.valueOf(this.c), Arrays.toString(Arrays.copyOf(jArr, 200)));
    }

    @Override // j$.util.stream.u6, java.lang.Iterable, j$.util.stream.g2
    /* JADX INFO: renamed from: v, reason: merged with bridge method [inline-methods] */
    public j$.util.x0 spliterator() {
        return new r6(this, 0, this.c, 0, this.b);
    }
}
