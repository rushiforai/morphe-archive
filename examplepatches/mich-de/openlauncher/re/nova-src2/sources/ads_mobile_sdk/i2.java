package ads_mobile_sdk;

import b.c0;
import b.m9;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class i2 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f4625a;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f4626c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f4627d;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f4628t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i2(String str, Object obj, Continuation continuation, int i5) {
        super(2, continuation);
        this.f4628t = i5;
        this.f4626c = str;
        this.f4627d = obj;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f4628t) {
            case 0:
                return new i2(this.f4626c, this.f4627d, continuation, 0);
            case 1:
                return new i2(this.f4626c, this.f4627d, continuation, 1);
            case 2:
                return new i2(this.f4626c, this.f4627d, continuation, 2);
            case 3:
                return new i2(this.f4626c, this.f4627d, continuation, 3);
            case 4:
                return new i2(this.f4626c, this.f4627d, continuation, 4);
            case 5:
                return new i2(this.f4626c, this.f4627d, continuation, 5);
            case 6:
                return new i2(this.f4626c, this.f4627d, continuation, 6);
            case 7:
                return new i2(this.f4626c, this.f4627d, continuation, 7);
            case 8:
                return new i2(this.f4626c, this.f4627d, continuation, 8);
            case 9:
                return new i2(this.f4626c, this.f4627d, continuation, 9);
            case 10:
                return new i2(this.f4626c, this.f4627d, continuation, 10);
            case 11:
                return new i2(this.f4626c, this.f4627d, continuation, 11);
            case 12:
                return new i2(this.f4626c, this.f4627d, continuation, 12);
            case 13:
                return new i2(this.f4626c, this.f4627d, continuation, 13);
            default:
                return new i2(this.f4626c, this.f4627d, continuation, 14);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f4628t) {
        }
        return ((i2) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f4628t;
        Object obj2 = this.f4627d;
        String str = this.f4626c;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = this.f4625a;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    cz.b bVar = mu0.f7335a;
                    c0.z("Invoking function [onAdClicked] on listener [", str, "]");
                    this.f4625a = 1;
                    if (((b.va) obj2).n(this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i12 = this.f4625a;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    cz.b bVar2 = mu0.f7335a;
                    c0.z("Invoking function [onVisibilityChanged (false)] on listener [", str, "]");
                    this.f4625a = 1;
                    if (((b.w5) obj2).a(false, this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 2:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i13 = this.f4625a;
                if (i13 == 0) {
                    ResultKt.b(obj);
                    cz.b bVar3 = mu0.f7335a;
                    c0.z("Invoking function [onRewardedVideoStart] on listener [", str, "]");
                    this.f4625a = 1;
                    if (((b.g6) obj2).k(this) == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 3:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                int i14 = this.f4625a;
                if (i14 == 0) {
                    ResultKt.b(obj);
                    cz.b bVar4 = mu0.f7335a;
                    c0.z("Invoking function [onAdDestroyed] on listener [", str, "]");
                    this.f4625a = 1;
                    if (((b.va) obj2).a(this) == coroutineSingletons4) {
                        return coroutineSingletons4;
                    }
                } else {
                    if (i14 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 4:
                CoroutineSingletons coroutineSingletons5 = CoroutineSingletons.f71806a;
                int i15 = this.f4625a;
                if (i15 == 0) {
                    ResultKt.b(obj);
                    cz.b bVar5 = mu0.f7335a;
                    c0.z("Invoking function [onAdDestroyed] on listener [", str, "]");
                    this.f4625a = 1;
                    if (((b.va) obj2).a(this) == coroutineSingletons5) {
                        return coroutineSingletons5;
                    }
                } else {
                    if (i15 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 5:
                CoroutineSingletons coroutineSingletons6 = CoroutineSingletons.f71806a;
                int i16 = this.f4625a;
                if (i16 == 0) {
                    ResultKt.b(obj);
                    cz.b bVar6 = mu0.f7335a;
                    c0.z("Invoking function [onAdDismissedFullscreenContent] on listener [", str, "]");
                    this.f4625a = 1;
                    if (((b.va) obj2).g(this) == coroutineSingletons6) {
                        return coroutineSingletons6;
                    }
                } else {
                    if (i16 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 6:
                CoroutineSingletons coroutineSingletons7 = CoroutineSingletons.f71806a;
                int i17 = this.f4625a;
                if (i17 == 0) {
                    ResultKt.b(obj);
                    cz.b bVar7 = mu0.f7335a;
                    c0.z("Invoking function [onMraidAdResized] on listener [", str, "]");
                    this.f4625a = 1;
                    if (((m9) obj2).d(this) == coroutineSingletons7) {
                        return coroutineSingletons7;
                    }
                } else {
                    if (i17 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 7:
                CoroutineSingletons coroutineSingletons8 = CoroutineSingletons.f71806a;
                int i18 = this.f4625a;
                if (i18 == 0) {
                    ResultKt.b(obj);
                    cz.b bVar8 = mu0.f7335a;
                    c0.z("Invoking function [onMraidResizedAdClosed] on listener [", str, "]");
                    this.f4625a = 1;
                    if (((m9) obj2).h(this) == coroutineSingletons8) {
                        return coroutineSingletons8;
                    }
                } else {
                    if (i18 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 8:
                CoroutineSingletons coroutineSingletons9 = CoroutineSingletons.f71806a;
                int i19 = this.f4625a;
                if (i19 == 0) {
                    ResultKt.b(obj);
                    cz.b bVar9 = mu0.f7335a;
                    c0.z("Invoking function [onAdImpression] on listener [", str, "]");
                    this.f4625a = 1;
                    if (((b.va) obj2).q(this) == coroutineSingletons9) {
                        return coroutineSingletons9;
                    }
                } else {
                    if (i19 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 9:
                CoroutineSingletons coroutineSingletons10 = CoroutineSingletons.f71806a;
                int i21 = this.f4625a;
                if (i21 == 0) {
                    ResultKt.b(obj);
                    cz.b bVar10 = mu0.f7335a;
                    c0.z("Invoking function [onRequestStarted] on listener [", str, "]");
                    this.f4625a = 1;
                    if (((b.ka) obj2).b(this) == coroutineSingletons10) {
                        return coroutineSingletons10;
                    }
                } else {
                    if (i21 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 10:
                CoroutineSingletons coroutineSingletons11 = CoroutineSingletons.f71806a;
                int i22 = this.f4625a;
                if (i22 == 0) {
                    ResultKt.b(obj);
                    cz.b bVar11 = mu0.f7335a;
                    c0.z("Invoking function [onMraidUnload] on listener [", str, "]");
                    this.f4625a = 1;
                    if (((m9) obj2).c(this) == coroutineSingletons11) {
                        return coroutineSingletons11;
                    }
                } else {
                    if (i22 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 11:
                CoroutineSingletons coroutineSingletons12 = CoroutineSingletons.f71806a;
                int i23 = this.f4625a;
                if (i23 == 0) {
                    ResultKt.b(obj);
                    cz.b bVar12 = mu0.f7335a;
                    c0.z("Invoking function [onAdPolled] on listener [", str, "]");
                    this.f4625a = 1;
                    if (((b.va) obj2).e() == coroutineSingletons12) {
                        return coroutineSingletons12;
                    }
                } else {
                    if (i23 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 12:
                CoroutineSingletons coroutineSingletons13 = CoroutineSingletons.f71806a;
                int i24 = this.f4625a;
                if (i24 == 0) {
                    ResultKt.b(obj);
                    cz.b bVar13 = mu0.f7335a;
                    c0.z("Invoking function [onSignalCollectionSucceeded] on listener [", str, "]");
                    this.f4625a = 1;
                    if (((b.ka) obj2).f() == coroutineSingletons13) {
                        return coroutineSingletons13;
                    }
                } else {
                    if (i24 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 13:
                CoroutineSingletons coroutineSingletons14 = CoroutineSingletons.f71806a;
                int i25 = this.f4625a;
                if (i25 == 0) {
                    ResultKt.b(obj);
                    cz.b bVar14 = mu0.f7335a;
                    c0.z("Invoking function [onAdPresentation] on listener [", str, "]");
                    this.f4625a = 1;
                    if (((b.va) obj2).j(this) == coroutineSingletons14) {
                        return coroutineSingletons14;
                    }
                } else {
                    if (i25 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons15 = CoroutineSingletons.f71806a;
                int i26 = this.f4625a;
                if (i26 == 0) {
                    ResultKt.b(obj);
                    cz.b bVar15 = mu0.f7335a;
                    c0.z("Invoking function [onAdShowedFullscreenContent] on listener [", str, "]");
                    this.f4625a = 1;
                    if (((b.va) obj2).o(this) == coroutineSingletons15) {
                        return coroutineSingletons15;
                    }
                } else {
                    if (i26 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }
}
