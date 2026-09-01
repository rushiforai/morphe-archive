package j$.util.stream;

import java.util.function.DoubleConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final /* synthetic */ class z1 implements DoubleConsumer {
    public final /* synthetic */ int a;

    public /* synthetic */ z1(int i) {
        this.a = i;
    }

    @Override // java.util.function.DoubleConsumer
    public final void accept(double d) {
        int i = this.a;
    }

    public final /* synthetic */ DoubleConsumer andThen(DoubleConsumer doubleConsumer) {
        switch (this.a) {
        }
        return j$.time.a.e(this, doubleConsumer);
    }

    private final void accept$j$$util$stream$Node$OfDouble$0(double d) {
    }

    private final void accept$j$$util$stream$StreamSpliterators$SliceSpliterator$OfDouble$0(double d) {
    }
}
