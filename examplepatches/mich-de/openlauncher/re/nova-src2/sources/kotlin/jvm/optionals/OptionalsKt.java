package kotlin.jvm.optionals;

import java.util.Optional;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u0002\n\u0000¨\u0006\u0000"}, d2 = {"kotlin-stdlib-jdk8"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class OptionalsKt {
    public static final Object a(Optional optional, Object obj) {
        Intrinsics.g(optional, "<this>");
        return optional.isPresent() ? optional.get() : obj;
    }

    public static final Object b(Optional optional) {
        Intrinsics.g(optional, "<this>");
        return optional.orElse(null);
    }
}
