package io;

import ads_mobile_sdk.jr0;
import ads_mobile_sdk.l0;
import ads_mobile_sdk.u;
import b.ed;
import c0.h2;
import com.instabridge.ai.auth.AiConsentMutationResult;
import com.instabridge.ai.consent.AiConsentDialog;
import com.instabridge.ai.consent.ConsentSettingsView;
import e0.a2;
import g0.m1;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.time.Duration;
import kotlin.time.DurationUnit;
import l1.o8;
import l1.w5;
import m0.b0;
import n0.u0;
import n0.x0;
import p0.y;
import t00.a0;
import t00.c0;
import t70.j0;
import t70.t0;

/* loaded from: classes3.dex */
public final class h extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f66527t;

    /* renamed from: u, reason: collision with root package name */
    public int f66528u;

    /* renamed from: v, reason: collision with root package name */
    public int f66529v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Object f66530w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(AiConsentDialog aiConsentDialog, Continuation continuation) {
        super(2, continuation);
        this.f66527t = 0;
        this.f66530w = aiConsentDialog;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f66527t) {
            case 0:
                return new h((AiConsentDialog) this.f66530w, continuation);
            case 1:
                return new h((l0) this.f66530w, this.f66529v, continuation, 1);
            case 2:
                return new h((w5) this.f66530w, this.f66529v, continuation, 2);
            case 3:
                return new h((x0) this.f66530w, this.f66529v, continuation, 3);
            case 4:
                return new h((y) this.f66530w, this.f66529v, continuation, 4);
            case 5:
                return new h((a0) this.f66530w, this.f66529v, continuation, 5);
            default:
                return new h((c0) this.f66530w, this.f66529v, continuation, 6);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f66527t) {
            case 1:
                break;
        }
        return ((h) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        Object objJ;
        int i5;
        ConsentSettingsView consentSettingsView;
        int i11 = this.f66527t;
        Object obj2 = this.f66530w;
        switch (i11) {
            case 0:
                AiConsentDialog aiConsentDialog = (AiConsentDialog) obj2;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i12 = this.f66529v;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    int i13 = (!aiConsentDialog.f35493f || ((consentSettingsView = aiConsentDialog.f35498k) != null && consentSettingsView.f35501a.isChecked())) ? 1 : 0;
                    this.f66528u = i13;
                    this.f66529v = 1;
                    ConsentSettingsView consentSettingsView2 = aiConsentDialog.f35498k;
                    if (consentSettingsView2 == null) {
                        objJ = new AiConsentMutationResult(false, fo.d.a().getAiAccessDecision(), null, "ConsentSettingsView not available", 4, null);
                    } else {
                        objJ = consentSettingsView2.j(i13 != 0 ? true : consentSettingsView2.f35501a.isChecked(), this);
                    }
                    if (objJ == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    i5 = i13;
                    obj = objJ;
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    i5 = this.f66528u;
                    ResultKt.b(obj);
                }
                AiConsentMutationResult aiConsentMutationResult = (AiConsentMutationResult) obj;
                if (!aiConsentDialog.isAdded()) {
                    return Unit.f71706a;
                }
                if (aiConsentMutationResult.getSuccess()) {
                    aiConsentDialog.f35492e = i5 != 0;
                    aiConsentDialog.dismissAllowingStateLoss();
                } else {
                    AiConsentDialog.o(aiConsentDialog, aiConsentMutationResult);
                    aiConsentDialog.p(false);
                }
                return Unit.f71706a;
            case 1:
                l0 l0Var = (l0) obj2;
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i14 = this.f66528u;
                if (i14 == 0) {
                    ResultKt.b(obj);
                    jr0 jr0Var = l0Var.f6024b;
                    jr0Var.getClass();
                    Duration.Companion companion = Duration.f72038b;
                    long j11 = ((Duration) jr0Var.a("gads:ad_activity_delegate_map_retain_duration", ed.k(60, DurationUnit.f72046e, "gads:ad_activity_delegate_map_retain_duration"), u.a$3)).f72041a;
                    this.f66528u = 1;
                    if (t0.c(j11, this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i14 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                l0Var.f6026d.remove(new Integer(this.f66529v));
                return Unit.f71706a;
            case 2:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i15 = this.f66528u;
                if (i15 == 0) {
                    ResultKt.b(obj);
                    a2 a2Var = ((w5) obj2).f74177a;
                    int i16 = this.f66529v;
                    h2 h2Var = o8.f73756b;
                    this.f66528u = 1;
                    if (a2Var.f(i16, h2Var, this) == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i15 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 3:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                int i17 = this.f66528u;
                if (i17 == 0) {
                    ResultKt.b(obj);
                    u0 u0Var = ((x0) obj2).f77525b;
                    int i18 = this.f66529v;
                    this.f66528u = 1;
                    if (u0Var.b(i18, this) == coroutineSingletons4) {
                        return coroutineSingletons4;
                    }
                } else {
                    if (i17 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 4:
                y yVar = (y) obj2;
                CoroutineSingletons coroutineSingletons5 = CoroutineSingletons.f71806a;
                int i19 = this.f66528u;
                if (i19 == 0) {
                    ResultKt.b(obj);
                    this.f66528u = 1;
                    Object objA = yVar.f81248x.a(this);
                    if (objA != coroutineSingletons5) {
                        objA = Unit.f71706a;
                    }
                    if (objA == coroutineSingletons5) {
                        return coroutineSingletons5;
                    }
                } else {
                    if (i19 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                double d5 = 0.0f;
                if (-0.5d > d5 || d5 > 0.5d) {
                    j0.b.a("pageOffsetFraction 0.0 is not within the range -0.5 to 0.5");
                }
                yVar.u(yVar.j(this.f66529v), 0.0f, true);
                return Unit.f71706a;
            case 5:
                CoroutineSingletons coroutineSingletons6 = CoroutineSingletons.f71806a;
                int i21 = this.f66528u;
                if (i21 == 0) {
                    ResultKt.b(obj);
                    b0 b0Var = ((a0) obj2).f88321f;
                    int i22 = this.f66529v;
                    this.f66528u = 1;
                    if (b0.j(b0Var, i22, this) == coroutineSingletons6) {
                        return coroutineSingletons6;
                    }
                } else {
                    if (i21 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons7 = CoroutineSingletons.f71806a;
                int i23 = this.f66528u;
                if (i23 == 0) {
                    ResultKt.b(obj);
                    a2 a2Var2 = ((c0) obj2).f88332e;
                    int i24 = this.f66529v;
                    this.f66528u = 1;
                    if (m1.b(a2Var2, i24 - a2Var2.h(), this) == coroutineSingletons7) {
                        return coroutineSingletons7;
                    }
                } else {
                    if (i23 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ h(Object obj, int i5, Continuation continuation, int i11) {
        super(2, continuation);
        this.f66527t = i11;
        this.f66530w = obj;
        this.f66529v = i5;
    }
}
