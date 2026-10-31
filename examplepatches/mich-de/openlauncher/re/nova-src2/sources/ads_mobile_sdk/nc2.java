package ads_mobile_sdk;

import b.o2;
import b.t4;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class nc2 implements b.bb {

    /* renamed from: a, reason: collision with root package name */
    public final rg0 f7525a;

    /* renamed from: b, reason: collision with root package name */
    public final b.m5 f7526b;

    /* renamed from: c, reason: collision with root package name */
    public final b.m5 f7527c;

    /* renamed from: d, reason: collision with root package name */
    public final b.m5 f7528d;

    /* renamed from: e, reason: collision with root package name */
    public final b.m5 f7529e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f7530f = 0;

    public nc2(rg0 rg0Var, b.m5 m5Var, b.m5 m5Var2, b.m5 m5Var3, b.m5 m5Var4) {
        this.f7525a = rg0Var;
        this.f7526b = m5Var;
        this.f7527c = m5Var2;
        this.f7528d = m5Var3;
        this.f7529e = m5Var4;
    }

    @Override // b.m5
    public final Object get() {
        switch (this.f7530f) {
            case 0:
                return new mc2((t70.j0) this.f7525a.get(), this.f7526b, (t4) this.f7527c.get(), (kz2) this.f7528d.get(), (o2) this.f7529e.get());
            default:
                ln3 userAgentProviderImpl = (ln3) this.f7526b.get();
                t70.j0 backgroundScope = (t70.j0) this.f7525a.get();
                t70.j0 webViewInitializationScope = (t70.j0) this.f7527c.get();
                kz2 rootTraceCreator = (kz2) this.f7528d.get();
                jr0 flags = (jr0) this.f7529e.get();
                Intrinsics.g(userAgentProviderImpl, "userAgentProviderImpl");
                Intrinsics.g(backgroundScope, "backgroundScope");
                Intrinsics.g(webViewInitializationScope, "webViewInitializationScope");
                Intrinsics.g(rootTraceCreator, "rootTraceCreator");
                Intrinsics.g(flags, "flags");
                return new k41(userAgentProviderImpl, backgroundScope, webViewInitializationScope, rootTraceCreator, flags);
        }
    }

    public nc2(b.m5 m5Var, rg0 rg0Var, b.m5 m5Var2, b.m5 m5Var3, b.m5 m5Var4) {
        this.f7526b = m5Var;
        this.f7525a = rg0Var;
        this.f7527c = m5Var2;
        this.f7528d = m5Var3;
        this.f7529e = m5Var4;
    }
}
