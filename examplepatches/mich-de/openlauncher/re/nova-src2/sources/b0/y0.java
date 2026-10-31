package b0;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class y0 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f16278j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Function1 f16279k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ y0(Function1 function1, int i5) {
        super(1);
        this.f16278j = i5;
        this.f16279k = function1;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int i5 = this.f16278j;
        Function1 function1 = this.f16279k;
        switch (i5) {
            case 0:
                return new y3.m((((Number) function1.invoke(Integer.valueOf((int) (r0 & 4294967295L)))).intValue() & 4294967295L) | (((int) (((y3.m) obj).f96611a >> 32)) << 32));
            case 1:
                return new y3.k((0 & 4294967295L) | (((Number) function1.invoke(Integer.valueOf((int) (((y3.m) obj).f96611a >> 32)))).intValue() << 32));
            case 2:
                return new y3.k((0 << 32) | (4294967295L & ((Number) function1.invoke(Integer.valueOf((int) (((y3.m) obj).f96611a & 4294967295L)))).intValue()));
            case 3:
                return new y3.k((0 & 4294967295L) | (((Number) function1.invoke(Integer.valueOf((int) (((y3.m) obj).f96611a >> 32)))).intValue() << 32));
            default:
                w wVar = (w) ((r) obj);
                p6.e0 e0Var = ((p6.n) wVar.a()).f82192b;
                Intrinsics.e(e0Var, "null cannot be cast to non-null type androidx.navigation.compose.ComposeNavigator.Destination");
                int i11 = p6.e0.f82151i;
                for (p6.e0 e0Var2 : p6.a0.b((q6.h) e0Var)) {
                }
                if (function1 != null) {
                    return (s1) function1.invoke(wVar);
                }
                return null;
        }
    }
}
