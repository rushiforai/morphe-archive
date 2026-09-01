package j$.util.stream;

import java.util.function.BiFunction;
import java.util.function.BinaryOperator;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.IntFunction;
import java.util.function.LongFunction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final /* synthetic */ class u1 implements Consumer, IntFunction, LongFunction, BinaryOperator {
    public final /* synthetic */ int a;

    public /* synthetic */ u1(int i) {
        this.a = i;
    }

    @Override // java.util.function.Consumer
    /* JADX INFO: renamed from: accept */
    public void n(Object obj) {
        int i = this.a;
    }

    public /* synthetic */ BiFunction andThen(Function function) {
        switch (this.a) {
        }
        return j$.time.a.c(this, function);
    }

    @Override // java.util.function.IntFunction
    public Object apply(int i) {
        switch (this.a) {
            case 1:
                return new Object[i];
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 13:
            case 14:
            default:
                return new Double[i];
            case 9:
                return new Object[i];
            case 10:
                return new Integer[i];
            case 11:
                return new Long[i];
            case 12:
                return new Double[i];
            case 15:
                return new Integer[i];
            case 16:
                return new Integer[i];
            case 17:
                return new Long[i];
            case 18:
                return new Long[i];
            case 19:
                return new Double[i];
        }
    }

    public /* synthetic */ Consumer andThen(Consumer consumer) {
        switch (this.a) {
            case 0:
                break;
            case 13:
                break;
        }
        return j$.time.a.d(this, consumer);
    }

    @Override // java.util.function.LongFunction
    public Object apply(long j) {
        switch (this.a) {
            case 2:
                return v3.F(j);
            case 3:
            default:
                return v3.O(j);
            case 4:
                return v3.N(j);
        }
    }

    @Override // java.util.function.BiFunction
    public Object apply(Object obj, Object obj2) {
        switch (this.a) {
            case 3:
                return new n2((a2) obj, (a2) obj2);
            case 4:
            case 6:
            default:
                return new r2((g2) obj, (g2) obj2);
            case 5:
                return new o2((c2) obj, (c2) obj2);
            case 7:
                return new p2((e2) obj, (e2) obj2);
        }
    }

    private final void accept$j$$util$stream$Node$0(Object obj) {
    }

    private final void accept$j$$util$stream$StreamSpliterators$SliceSpliterator$OfRef$0(Object obj) {
    }

    private final void accept$j$$util$stream$StreamSpliterators$SliceSpliterator$OfRef$1(Object obj) {
    }
}
