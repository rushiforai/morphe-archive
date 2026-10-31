package kotlin.comparisons;

import ab.e0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"ab/e0", "kotlin/comparisons/ComparisonsKt", "kotlin/comparisons/ComparisonsKt"}, d2 = {}, k = 4, mv = {2, 1, 0}, xi = 49)
/* loaded from: classes.dex */
public final class ComparisonsKt extends e0 {
    private ComparisonsKt() {
    }

    public static Comparable Z(Comparable a11, Comparable b11) {
        Intrinsics.g(a11, "a");
        Intrinsics.g(b11, "b");
        return a11.compareTo(b11) >= 0 ? a11 : b11;
    }
}
