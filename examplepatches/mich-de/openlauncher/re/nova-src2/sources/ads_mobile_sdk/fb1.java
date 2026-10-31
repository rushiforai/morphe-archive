package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;

/* loaded from: classes.dex */
public final class fb1 extends b.h1 {

    /* renamed from: c, reason: collision with root package name */
    public final t70.j0 f3282c;

    /* renamed from: d, reason: collision with root package name */
    public final t70.j0 f3283d;

    /* renamed from: e, reason: collision with root package name */
    public final jr0 f3284e;

    /* renamed from: f, reason: collision with root package name */
    public final q43 f3285f;

    /* renamed from: g, reason: collision with root package name */
    public final kz2 f3286g;

    /* renamed from: h, reason: collision with root package name */
    public final ra1 f3287h;

    public fb1(t70.j0 backgroundScope, t70.j0 uiScope, jr0 flags, q43 sharedSettingsDataStore, kz2 rootTraceCreator, ra1 installReferrerClientProxy) {
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(sharedSettingsDataStore, "sharedSettingsDataStore");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(installReferrerClientProxy, "installReferrerClientProxy");
        this.f3282c = backgroundScope;
        this.f3283d = uiScope;
        this.f3284e = flags;
        this.f3285f = sharedSettingsDataStore;
        this.f3286g = rootTraceCreator;
        this.f3287h = installReferrerClientProxy;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // ads_mobile_sdk.c61
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object h(Continuation continuation) {
        cb1 cb1Var;
        fb1 fb1Var;
        if (continuation instanceof cb1) {
            cb1Var = (cb1) continuation;
            int i5 = cb1Var.f1766d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cb1Var.f1766d = i5 - Integer.MIN_VALUE;
            } else {
                cb1Var = new cb1(this, (ContinuationImpl) continuation);
            }
        }
        Object objA = cb1Var.f1764b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cb1Var.f1766d;
        if (i11 == 0) {
            ResultKt.b(objA);
            jr0 jr0Var = this.f3284e;
            jr0Var.getClass();
            if (((Boolean) jr0Var.a("gads:install_referrer_details:enabled", Boolean.FALSE, jn.a$10)).booleanValue()) {
                cb1Var.f1763a = this;
                cb1Var.f1766d = 1;
                q43 q43Var = this.f3285f;
                q43Var.getClass();
                objA = q43.a(q43Var, cb1Var);
                if (objA == coroutineSingletons) {
                    return coroutineSingletons;
                }
                fb1Var = this;
            }
            return new xu0(Unit.f71706a);
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        fb1Var = cb1Var.f1763a;
        ResultKt.b(objA);
        if (!((k43) objA).p()) {
            m0.t(fb1Var.f3283d, null, null, new androidx.room.c(fb1Var, null, 5), 3);
        }
        return new xu0(Unit.f71706a);
    }
}
