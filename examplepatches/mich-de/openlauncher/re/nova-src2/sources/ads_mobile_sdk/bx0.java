package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class bx0 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f1596a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ tx0 f1597b;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f1598t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ bx0(tx0 tx0Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f1598t = i5;
        this.f1597b = tx0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f1598t) {
            case 0:
                return new bx0(this.f1597b, continuation, 0);
            case 1:
                return new bx0(this.f1597b, continuation, 1);
            case 2:
                return new bx0(this.f1597b, continuation, 2);
            case 3:
                return new bx0(this.f1597b, continuation, 3);
            case 4:
                return new bx0(this.f1597b, continuation, 4);
            case 5:
                return new bx0(this.f1597b, continuation, 5);
            case 6:
                return new bx0(this.f1597b, continuation, 6);
            default:
                return new bx0(this.f1597b, continuation, 7);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f1598t) {
            case 0:
                return new bx0(this.f1597b, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            case 1:
                return new bx0(this.f1597b, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
            case 2:
                return new bx0(this.f1597b, (Continuation) obj2, 2).invokeSuspend(Unit.f71706a);
            case 3:
                return new bx0(this.f1597b, (Continuation) obj2, 3).invokeSuspend(Unit.f71706a);
            case 4:
                return new bx0(this.f1597b, (Continuation) obj2, 4).invokeSuspend(Unit.f71706a);
            case 5:
                return new bx0(this.f1597b, (Continuation) obj2, 5).invokeSuspend(Unit.f71706a);
            case 6:
                return new bx0(this.f1597b, (Continuation) obj2, 6).invokeSuspend(Unit.f71706a);
            default:
                return new bx0(this.f1597b, (Continuation) obj2, 7).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f1598t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f1596a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    tx0 tx0Var = this.f1597b;
                    this.f1596a = 1;
                    if (tx0Var.a(this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f1596a;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    tx0 tx0Var2 = this.f1597b;
                    this.f1596a = 1;
                    if (tx0Var2.a(this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 2:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i12 = this.f1596a;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    tx0 tx0Var3 = this.f1597b;
                    this.f1596a = 1;
                    if (tx0Var3.a("(function() {  var height = -1;  if (document.body) {    height = document.body.offsetHeight;  } else if (document.documentElement) {    height = document.documentElement.offsetHeight;  }  var url = 'gmsg://mobileads.google.com/contentHeight?';  url += 'height=' + height;  try {    window.googleAdsJsInterface.notify(url);  } catch (e) {    var frame = document.getElementById('afma-notify-fluid');    if (!frame) {      frame = document.createElement('IFRAME');      frame.id = 'afma-notify-fluid';      frame.style.display = 'none';      var body = document.body || document.documentElement;      body.appendChild(frame);    }    frame.src = url;  }})();", this) == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 3:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                int i13 = this.f1596a;
                if (i13 == 0) {
                    ResultKt.b(obj);
                    tx0 tx0Var4 = this.f1597b;
                    this.f1596a = 1;
                    if (tx0Var4.a(this) == coroutineSingletons4) {
                        return coroutineSingletons4;
                    }
                } else {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 4:
                CoroutineSingletons coroutineSingletons5 = CoroutineSingletons.f71806a;
                int i14 = this.f1596a;
                if (i14 == 0) {
                    ResultKt.b(obj);
                    tx0 tx0Var5 = this.f1597b;
                    this.f1596a = 1;
                    if (tx0Var5.a(this) == coroutineSingletons5) {
                        return coroutineSingletons5;
                    }
                } else {
                    if (i14 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 5:
                CoroutineSingletons coroutineSingletons6 = CoroutineSingletons.f71806a;
                int i15 = this.f1596a;
                if (i15 == 0) {
                    ResultKt.b(obj);
                    b.c7 c7Var = this.f1597b.f10134p;
                    if (c7Var != null) {
                        this.f1596a = 1;
                        if (c7Var.a(this) == coroutineSingletons6) {
                            return coroutineSingletons6;
                        }
                    }
                } else {
                    if (i15 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 6:
                CoroutineSingletons coroutineSingletons7 = CoroutineSingletons.f71806a;
                int i16 = this.f1596a;
                if (i16 == 0) {
                    ResultKt.b(obj);
                    x60 x60Var = this.f1597b.f10124d;
                    if (x60Var == null) {
                        return null;
                    }
                    this.f1596a = 1;
                    obj = x60.a(x60Var, "native:view_create", this);
                    if (obj == coroutineSingletons7) {
                        return coroutineSingletons7;
                    }
                } else {
                    if (i16 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return (kh3) obj;
            default:
                CoroutineSingletons coroutineSingletons8 = CoroutineSingletons.f71806a;
                int i17 = this.f1596a;
                if (i17 == 0) {
                    ResultKt.b(obj);
                    x60 x60Var2 = this.f1597b.f10124d;
                    if (x60Var2 == null) {
                        return null;
                    }
                    this.f1596a = 1;
                    if (x60Var2.a("action", "make_wv", true, (ContinuationImpl) this) == coroutineSingletons8) {
                        return coroutineSingletons8;
                    }
                } else {
                    if (i17 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }
}
