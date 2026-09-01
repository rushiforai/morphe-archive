package j$.util.function;

import j$.util.Objects;
import java.util.function.DoubleUnaryOperator;

/* JADX INFO: renamed from: j$.util.function.DoubleUnaryOperator$-CC, reason: invalid class name */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final /* synthetic */ class DoubleUnaryOperator$CC {
    public static DoubleUnaryOperator $default$andThen(DoubleUnaryOperator doubleUnaryOperator, DoubleUnaryOperator doubleUnaryOperator2) {
        Objects.requireNonNull(doubleUnaryOperator2);
        return new c(doubleUnaryOperator, doubleUnaryOperator2, 1);
    }

    public static DoubleUnaryOperator $default$compose(DoubleUnaryOperator doubleUnaryOperator, DoubleUnaryOperator doubleUnaryOperator2) {
        Objects.requireNonNull(doubleUnaryOperator2);
        return new c(doubleUnaryOperator, doubleUnaryOperator2, 0);
    }
}
