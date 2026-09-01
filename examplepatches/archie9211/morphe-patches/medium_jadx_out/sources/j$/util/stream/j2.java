package j$.util.stream;

import j$.util.Objects;
import j$.util.Spliterator;
import j$.util.Spliterators;
import java.util.Arrays;
import java.util.function.Consumer;
import java.util.function.IntFunction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public class j2 implements g2 {
    public final Object[] a;
    public int b;

    public j2(long j, IntFunction intFunction) {
        if (j >= 2147483639) {
            j$.time.h.c("Stream size exceeds max array size");
            throw null;
        }
        this.a = (Object[]) intFunction.apply((int) j);
        this.b = 0;
    }

    @Override // j$.util.stream.g2
    public final g2 a(int i) {
        throw new IndexOutOfBoundsException();
    }

    @Override // j$.util.stream.g2
    public final long count() {
        return this.b;
    }

    @Override // j$.util.stream.g2
    public final void forEach(Consumer consumer) {
        for (int i = 0; i < this.b; i++) {
            consumer.n(this.a[i]);
        }
    }

    @Override // j$.util.stream.g2
    public final /* synthetic */ g2 j(long j, long j2, IntFunction intFunction) {
        return v3.w(this, j, j2, intFunction);
    }

    @Override // j$.util.stream.g2
    public final void k(Object[] objArr, int i) {
        System.arraycopy(this.a, 0, objArr, i, this.b);
    }

    @Override // j$.util.stream.g2
    public final Object[] m(IntFunction intFunction) {
        Object[] objArr = this.a;
        if (objArr.length == this.b) {
            return objArr;
        }
        throw new IllegalStateException();
    }

    @Override // j$.util.stream.g2
    public final int o() {
        return 0;
    }

    @Override // j$.util.stream.g2
    public final Spliterator spliterator() {
        int i = this.b;
        Object[] objArr = this.a;
        Spliterators.a(((Object[]) Objects.requireNonNull(objArr)).length, 0, i);
        return new j$.util.g1(objArr, 0, i, 1040);
    }

    public String toString() {
        Object[] objArr = this.a;
        return String.format("ArrayNode[%d][%s]", Integer.valueOf(objArr.length - this.b), Arrays.toString(objArr));
    }

    public j2(Object[] objArr) {
        this.a = objArr;
        this.b = objArr.length;
    }
}
