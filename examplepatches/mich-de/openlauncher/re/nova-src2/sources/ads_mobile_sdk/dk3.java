package ads_mobile_sdk;

import b.o2;
import b.s1;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class dk3 extends dr {

    /* renamed from: l, reason: collision with root package name */
    public final fz f2556l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dk3(fz consentManager, jr0 flags, g0 activityTracker, kz2 rootTraceCreator, o2 clock, t70.j0 backgroundScope) {
        super(clock, backgroundScope, rootTraceCreator, flags, activityTracker);
        Intrinsics.g(flags, "flags");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(activityTracker, "activityTracker");
        Intrinsics.g(consentManager, "consentManager");
        this.f2556l = consentManager;
    }

    @Override // b.x2
    public final cw0 a() {
        return cw0.TRUSTLESS_TOKEN;
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x005f, code lost:
    
        if (r8 == r1) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x007d, code lost:
    
        if (r8 == r1) goto L30;
     */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.x2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(Continuation continuation) {
        bk3 bk3Var;
        String str;
        if (continuation instanceof bk3) {
            bk3Var = (bk3) continuation;
            int i5 = bk3Var.f1458c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bk3Var.f1458c = i5 - Integer.MIN_VALUE;
            } else {
                bk3Var = new bk3(this, (ContinuationImpl) continuation);
            }
        }
        Object objI = bk3Var.f1456a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bk3Var.f1458c;
        if (i11 == 0) {
            ResultKt.b(objI);
            s1 s1Var = this.f2601f.f5356r;
            s1Var.getClass();
            boolean zBooleanValue = ((Boolean) s1Var.a("gads:trustless_token_caching_in_signal_source_enabled", Boolean.FALSE, jn.a$10)).booleanValue();
            fz fzVar = this.f2556l;
            if (zBooleanValue) {
                bk3Var.f1458c = 1;
                fzVar.getClass();
                objI = fz.h(fzVar, bk3Var);
            } else {
                bk3Var.f1458c = 2;
                fzVar.getClass();
                objI = fz.i(fzVar, bk3Var);
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            ResultKt.b(objI);
            b.a1 a1Var = (b.a1) objI;
            if (a1Var != null) {
                if (a1Var instanceof pu0) {
                    return (pu0) a1Var;
                }
                str = (String) ((xu0) a1Var).f11834b;
            }
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objI);
            b.a1 a1Var2 = (b.a1) objI;
            if (a1Var2 == null) {
                str = null;
            } else {
                if (a1Var2 instanceof pu0) {
                    return (pu0) a1Var2;
                }
                str = (String) ((xu0) a1Var2).f11834b;
            }
        }
        return new xu0(new ak3(str));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // ads_mobile_sdk.dr
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object k(Continuation continuation) {
        ck3 ck3Var;
        dk3 dk3Var;
        if (continuation instanceof ck3) {
            ck3Var = (ck3) continuation;
            int i5 = ck3Var.f1931d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ck3Var.f1931d = i5 - Integer.MIN_VALUE;
            } else {
                ck3Var = new ck3(this, (ContinuationImpl) continuation);
            }
        }
        Object objK = ck3Var.f1929b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ck3Var.f1931d;
        if (i11 == 0) {
            ResultKt.b(objK);
            s1 s1Var = this.f2601f.f5356r;
            s1Var.getClass();
            if (((Boolean) s1Var.a("gads:trustless_token_caching_in_signal_source_enabled", Boolean.FALSE, jn.a$10)).booleanValue()) {
                ck3Var.f1928a = this;
                ck3Var.f1931d = 1;
                fz fzVar = this.f2556l;
                fzVar.getClass();
                objK = fz.k(fzVar, ck3Var);
                if (objK != coroutineSingletons) {
                    dk3Var = this;
                }
            }
            return null;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objK);
            return objK;
        }
        dk3Var = ck3Var.f1928a;
        ResultKt.b(objK);
        if (((Boolean) objK).booleanValue()) {
            ck3Var.f1928a = null;
            ck3Var.f1931d = 2;
            dk3Var.getClass();
            Object objB = dr.b((dr) dk3Var, (ContinuationImpl) ck3Var);
            return objB == coroutineSingletons ? coroutineSingletons : objB;
        }
        return null;
    }
}
