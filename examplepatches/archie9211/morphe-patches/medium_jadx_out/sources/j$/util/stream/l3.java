package j$.util.stream;

import java.util.Arrays;
import java.util.function.Consumer;
import java.util.function.LongConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class l3 extends k3 implements x1 {
    @Override // j$.util.stream.l5
    public final void accept(long j) {
        int i = this.b;
        long[] jArr = this.a;
        if (i >= jArr.length) {
            j$.time.h.i("Accept exceeded fixed size of %d", new Object[]{Integer.valueOf(jArr.length)});
        } else {
            this.b = i + 1;
            jArr[i] = j;
        }
    }

    public final /* synthetic */ Consumer andThen(Consumer consumer) {
        return j$.time.a.d(this, consumer);
    }

    @Override // j$.util.stream.x1, j$.util.stream.y1
    public final e2 build() {
        int i = this.b;
        long[] jArr = this.a;
        if (i >= jArr.length) {
            return this;
        }
        j$.time.h.i("Current size %d is less than fixed size %d", new Object[]{Integer.valueOf(i), Integer.valueOf(jArr.length)});
        return null;
    }

    @Override // j$.util.stream.l5
    public final void c(long j) {
        long[] jArr = this.a;
        if (j == jArr.length) {
            this.b = 0;
        } else {
            j$.time.h.i("Begin size %d is not equal to fixed size %d", new Object[]{Long.valueOf(j), Integer.valueOf(jArr.length)});
        }
    }

    @Override // j$.util.stream.l5
    public final boolean e() {
        return false;
    }

    @Override // j$.util.stream.l5
    public final void end() {
        int i = this.b;
        long[] jArr = this.a;
        if (i >= jArr.length) {
            return;
        }
        j$.time.h.i("End size %d is less than fixed size %d", new Object[]{Integer.valueOf(i), Integer.valueOf(jArr.length)});
    }

    @Override // j$.util.stream.k5
    public final /* synthetic */ void l(Long l) {
        v3.i(this, l);
    }

    @Override // j$.util.stream.k3
    public final String toString() {
        long[] jArr = this.a;
        return String.format("LongFixedNodeBuilder[%d][%s]", Integer.valueOf(jArr.length - this.b), Arrays.toString(jArr));
    }

    public final /* synthetic */ LongConsumer andThen(LongConsumer longConsumer) {
        return j$.time.a.g(this, longConsumer);
    }

    @Override // j$.util.stream.l5
    public final /* synthetic */ void accept(int i) {
        v3.k();
        throw null;
    }

    @Override // java.util.function.Consumer
    /* JADX INFO: renamed from: accept */
    public final /* bridge */ /* synthetic */ void n(Object obj) {
        l((Long) obj);
    }

    @Override // j$.util.stream.l5
    public final /* synthetic */ void accept(double d) {
        v3.c();
        throw null;
    }

    @Override // j$.util.stream.y1
    public final /* bridge */ /* synthetic */ g2 build() {
        build();
        return this;
    }
}
