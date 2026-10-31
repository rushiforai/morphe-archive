package ps;

import kotlin.Unit;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements Function4 {

    /* renamed from: a, reason: collision with root package name */
    public static final a f82840a = new a();

    @Override // kotlin.jvm.functions.Function4
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
        b0.p composable = (b0.p) obj;
        p6.n it = (p6.n) obj2;
        ((Number) obj4).intValue();
        Intrinsics.g(composable, "$this$composable");
        Intrinsics.g(it, "it");
        f0.d(null, null, (p1.o) obj3, 0, 3);
        return Unit.f71706a;
    }
}
