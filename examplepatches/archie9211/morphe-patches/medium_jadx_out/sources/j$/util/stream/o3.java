package j$.util.stream;

import j$.util.Spliterator;
import java.util.function.IntConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class o3 extends r3 implements j5 {
    public final int[] h;

    public o3(o3 o3Var, Spliterator spliterator, long j, long j2) {
        super(o3Var, spliterator, j, j2, o3Var.h.length);
        this.h = o3Var.h;
    }

    @Override // j$.util.stream.r3
    public final r3 a(Spliterator spliterator, long j, long j2) {
        return new o3(this, spliterator, j, j2);
    }

    @Override // j$.util.stream.r3, j$.util.stream.l5
    public final void accept(int i) {
        int i2 = this.f;
        if (i2 >= this.g) {
            throw new IndexOutOfBoundsException(Integer.toString(i2));
        }
        int[] iArr = this.h;
        this.f = i2 + 1;
        iArr[i2] = i;
    }

    public final /* synthetic */ IntConsumer andThen(IntConsumer intConsumer) {
        return j$.time.a.f(this, intConsumer);
    }

    @Override // j$.util.stream.j5
    public final /* synthetic */ void d(Integer num) {
        v3.g(this, num);
    }

    public o3(Spliterator spliterator, a aVar, int[] iArr) {
        super(spliterator, aVar, iArr.length);
        this.h = iArr;
    }

    @Override // java.util.function.Consumer
    /* JADX INFO: renamed from: accept */
    public final /* bridge */ /* synthetic */ void n(Object obj) {
        d((Integer) obj);
    }
}
