package j$.util;

import j$.util.stream.l5;
import java.util.function.Consumer;
import java.util.function.DoubleConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final /* synthetic */ class b0 implements DoubleConsumer {
    public final /* synthetic */ int a;
    public final /* synthetic */ Consumer b;

    public /* synthetic */ b0(Consumer consumer, int i) {
        this.a = i;
        this.b = consumer;
    }

    @Override // java.util.function.DoubleConsumer
    public final void accept(double d) {
        int i = this.a;
        Consumer consumer = this.b;
        switch (i) {
            case 0:
                consumer.accept(Double.valueOf(d));
                break;
            default:
                ((l5) consumer).accept(d);
                break;
        }
    }

    public final /* synthetic */ DoubleConsumer andThen(DoubleConsumer doubleConsumer) {
        switch (this.a) {
        }
        return j$.time.a.e(this, doubleConsumer);
    }
}
