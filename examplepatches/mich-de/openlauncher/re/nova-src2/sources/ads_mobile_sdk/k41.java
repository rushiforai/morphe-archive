package ads_mobile_sdk;

import b.t7;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class k41 implements t7 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ ln3 f5501a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ t70.j0 f5502b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ t70.j0 f5503c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ kz2 f5504d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ jr0 f5505e;

    public k41(ln3 ln3Var, t70.j0 j0Var, t70.j0 j0Var2, kz2 kz2Var, jr0 jr0Var) {
        this.f5501a = ln3Var;
        this.f5502b = j0Var;
        this.f5503c = j0Var2;
        this.f5504d = kz2Var;
        this.f5505e = jr0Var;
    }

    @Override // b.t7
    public final Unit a() {
        ln3 ln3Var = this.f5501a;
        ln3Var.getClass();
        t70.j0 backgroundScope = this.f5502b;
        Intrinsics.g(backgroundScope, "backgroundScope");
        t70.j0 webViewInitializationScope = this.f5503c;
        Intrinsics.g(webViewInitializationScope, "webViewInitializationScope");
        kz2 rootTraceCreator = this.f5504d;
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        jr0 flags = this.f5505e;
        Intrinsics.g(flags, "flags");
        ln3Var.f6304d = backgroundScope;
        ln3Var.f6305e = webViewInitializationScope;
        ln3Var.f6306f = rootTraceCreator;
        ln3Var.f6307g = flags;
        return Unit.f71706a;
    }
}
