package j$.util.function;

import java.util.Comparator;
import java.util.function.BiFunction;
import java.util.function.BinaryOperator;
import java.util.function.Function;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final /* synthetic */ class a implements BinaryOperator {
    public final /* synthetic */ int a;
    public final /* synthetic */ Comparator b;

    public /* synthetic */ a(Comparator comparator, int i) {
        this.a = i;
        this.b = comparator;
    }

    public final /* synthetic */ BiFunction andThen(Function function) {
        switch (this.a) {
        }
        return j$.time.a.c(this, function);
    }

    @Override // java.util.function.BiFunction
    public final Object apply(Object obj, Object obj2) {
        int i = this.a;
        Comparator comparator = this.b;
        switch (i) {
            case 0:
                if (comparator.compare(obj, obj2) < 0) {
                    break;
                }
                break;
            default:
                if (comparator.compare(obj, obj2) > 0) {
                    break;
                }
                break;
        }
        return obj2;
    }
}
