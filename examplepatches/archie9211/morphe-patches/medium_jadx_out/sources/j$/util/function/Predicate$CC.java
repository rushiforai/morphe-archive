package j$.util.function;

import j$.util.Objects;
import j$.util.n;
import java.util.function.Predicate;

/* JADX INFO: renamed from: j$.util.function.Predicate$-CC, reason: invalid class name */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final /* synthetic */ class Predicate$CC {
    public static Predicate $default$and(Predicate predicate, Predicate predicate2) {
        Objects.requireNonNull(predicate2);
        return new g(predicate, predicate2, 0);
    }

    public static Predicate $default$negate(Predicate predicate) {
        return new n(1, predicate);
    }

    public static Predicate $default$or(Predicate predicate, Predicate predicate2) {
        Objects.requireNonNull(predicate2);
        return new g(predicate, predicate2, 1);
    }
}
