package b3;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class h2 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public static final h2 f17232j = new h2(1);

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Intrinsics.e(obj, "null cannot be cast to non-null type androidx.compose.ui.node.OwnerScope");
        return Boolean.valueOf(!((g2) obj).isValidOwnerScope());
    }
}
