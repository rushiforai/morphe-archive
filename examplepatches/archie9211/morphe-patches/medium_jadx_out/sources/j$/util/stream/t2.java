package j$.util.stream;

import java.util.Arrays;
import java.util.function.Consumer;
import java.util.function.DoubleConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class t2 extends s2 implements v1 {
    @Override // j$.util.stream.l5
    public final void accept(double d) {
        int i = this.b;
        double[] dArr = this.a;
        if (i >= dArr.length) {
            j$.time.h.i("Accept exceeded fixed size of %d", new Object[]{Integer.valueOf(dArr.length)});
        } else {
            this.b = i + 1;
            dArr[i] = d;
        }
    }

    public final /* synthetic */ Consumer andThen(Consumer consumer) {
        return j$.time.a.d(this, consumer);
    }

    @Override // j$.util.stream.v1, j$.util.stream.y1
    public final a2 build() {
        int i = this.b;
        double[] dArr = this.a;
        if (i >= dArr.length) {
            return this;
        }
        j$.time.h.i("Current size %d is less than fixed size %d", new Object[]{Integer.valueOf(i), Integer.valueOf(dArr.length)});
        return null;
    }

    @Override // j$.util.stream.l5
    public final void c(long j) {
        double[] dArr = this.a;
        if (j == dArr.length) {
            this.b = 0;
        } else {
            j$.time.h.i("Begin size %d is not equal to fixed size %d", new Object[]{Long.valueOf(j), Integer.valueOf(dArr.length)});
        }
    }

    @Override // j$.util.stream.l5
    public final boolean e() {
        return false;
    }

    @Override // j$.util.stream.l5
    public final void end() {
        int i = this.b;
        double[] dArr = this.a;
        if (i >= dArr.length) {
            return;
        }
        j$.time.h.i("End size %d is less than fixed size %d", new Object[]{Integer.valueOf(i), Integer.valueOf(dArr.length)});
    }

    @Override // j$.util.stream.i5
    public final /* synthetic */ void n(Double d) {
        v3.d(this, d);
    }

    @Override // j$.util.stream.s2
    public final String toString() {
        double[] dArr = this.a;
        return String.format("DoubleFixedNodeBuilder[%d][%s]", Integer.valueOf(dArr.length - this.b), Arrays.toString(dArr));
    }

    public final /* synthetic */ DoubleConsumer andThen(DoubleConsumer doubleConsumer) {
        return j$.time.a.e(this, doubleConsumer);
    }

    @Override // j$.util.stream.l5
    public final /* synthetic */ void accept(long j) {
        v3.l();
        throw null;
    }

    @Override // java.util.function.Consumer
    /* JADX INFO: renamed from: accept */
    public final /* bridge */ /* synthetic */ void n(Object obj) {
        n((Double) obj);
    }

    @Override // j$.util.stream.l5
    public final /* synthetic */ void accept(int i) {
        v3.k();
        throw null;
    }

    @Override // j$.util.stream.y1
    public final /* bridge */ /* synthetic */ g2 build() {
        build();
        return this;
    }
}
