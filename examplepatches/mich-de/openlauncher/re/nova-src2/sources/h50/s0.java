package h50;

import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final /* synthetic */ class s0 implements Function3 {
    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        b1 retryIf = (b1) obj;
        l50.b response = (l50.b) obj3;
        Intrinsics.g(retryIf, "$this$retryIf");
        Intrinsics.g((k50.b) obj2, "<unused var>");
        Intrinsics.g(response, "response");
        int i5 = response.f().f79606a;
        return Boolean.valueOf(500 <= i5 && i5 < 600);
    }
}
