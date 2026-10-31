package kotlin;

import a70.c;
import a70.d;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"kotlin/LazyKt", "kotlin/LazyKt"}, d2 = {}, k = 4, mv = {2, 1, 0}, xi = 49)
/* loaded from: classes.dex */
public final class LazyKt {
    private LazyKt() {
    }

    public static d a(Function0 initializer) {
        Intrinsics.g(initializer, "initializer");
        return new d(initializer);
    }

    public static Lazy b(LazyThreadSafetyMode lazyThreadSafetyMode, Function0 initializer) {
        Intrinsics.g(initializer, "initializer");
        int iOrdinal = lazyThreadSafetyMode.ordinal();
        if (iOrdinal == 0) {
            return new d(initializer);
        }
        if (iOrdinal == 1) {
            c cVar = new c();
            cVar.f448a = initializer;
            cVar.f449b = UNINITIALIZED_VALUE.f71702a;
            return cVar;
        }
        if (iOrdinal != 2) {
            throw new NoWhenBranchMatchedException();
        }
        UnsafeLazyImpl unsafeLazyImpl = new UnsafeLazyImpl();
        unsafeLazyImpl.f71707a = initializer;
        unsafeLazyImpl.f71708b = UNINITIALIZED_VALUE.f71702a;
        return unsafeLazyImpl;
    }
}
