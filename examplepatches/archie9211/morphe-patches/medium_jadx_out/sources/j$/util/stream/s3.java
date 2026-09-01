package j$.util.stream;

import java.util.function.IntFunction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class s3 extends v6 implements g2, y1 {
    @Override // j$.util.stream.g2
    public final g2 a(int i) {
        throw new IndexOutOfBoundsException();
    }

    @Override // j$.util.stream.l5
    public final /* synthetic */ void accept(double d) {
        v3.c();
        throw null;
    }

    @Override // j$.util.stream.l5
    public final void c(long j) {
        clear();
        p(j);
    }

    @Override // j$.util.stream.l5
    public final boolean e() {
        return false;
    }

    @Override // j$.util.stream.g2
    public final /* synthetic */ g2 j(long j, long j2, IntFunction intFunction) {
        return v3.w(this, j, j2, intFunction);
    }

    @Override // j$.util.stream.g2
    public final void k(Object[] objArr, int i) {
        long j = i;
        long jCount = count() + j;
        if (jCount > objArr.length || jCount < j) {
            throw new IndexOutOfBoundsException("does not fit");
        }
        if (this.c == 0) {
            System.arraycopy(this.e, 0, objArr, i, this.b);
            return;
        }
        for (int i2 = 0; i2 < this.c; i2++) {
            Object[] objArr2 = this.f[i2];
            System.arraycopy(objArr2, 0, objArr, i, objArr2.length);
            i += this.f[i2].length;
        }
        int i3 = this.b;
        if (i3 > 0) {
            System.arraycopy(this.e, 0, objArr, i, i3);
        }
    }

    @Override // j$.util.stream.g2
    public final Object[] m(IntFunction intFunction) {
        long jCount = count();
        if (jCount >= 2147483639) {
            j$.time.h.c("Stream size exceeds max array size");
            return null;
        }
        Object[] objArr = (Object[]) intFunction.apply((int) jCount);
        k(objArr, 0);
        return objArr;
    }

    @Override // j$.util.stream.g2
    public final int o() {
        return 0;
    }

    @Override // j$.util.stream.l5
    public final /* synthetic */ void accept(int i) {
        v3.k();
        throw null;
    }

    @Override // j$.util.stream.l5
    public final /* synthetic */ void accept(long j) {
        v3.l();
        throw null;
    }

    @Override // j$.util.stream.y1
    public final g2 build() {
        return this;
    }

    @Override // j$.util.stream.l5
    public final void end() {
    }
}
