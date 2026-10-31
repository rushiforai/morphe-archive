package ads_mobile_sdk;

import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class co3 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Object f1961a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ sy0 f1962b;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f1963t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ co3(Map map, sy0 sy0Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f1963t = i5;
        this.f1961a = map;
        this.f1962b = sy0Var;
    }

    /* JADX WARN: Type inference failed for: r2v0, types: [java.lang.Object, java.util.Map] */
    /* JADX WARN: Type inference failed for: r2v1, types: [java.lang.Object, java.util.Map] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f1963t) {
            case 0:
                return new co3(this.f1961a, this.f1962b, continuation, 0);
            default:
                return new co3(this.f1961a, this.f1962b, continuation, 1);
        }
    }

    /* JADX WARN: Type inference failed for: r2v0, types: [java.lang.Object, java.util.Map] */
    /* JADX WARN: Type inference failed for: r2v1, types: [java.lang.Object, java.util.Map] */
    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f1963t) {
            case 0:
                sy0 sy0Var = this.f1962b;
                return new co3(this.f1961a, sy0Var, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            default:
                sy0 sy0Var2 = this.f1962b;
                return new co3(this.f1961a, sy0Var2, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r6v1, types: [java.lang.Object, java.util.Map] */
    /* JADX WARN: Type inference failed for: r6v9, types: [java.lang.Object, java.util.Map] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws NumberFormatException {
        switch (this.f1963t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                String str = (String) this.f1961a.get("currentTime");
                if (str == null) {
                    zi3.a(6, "CurrentTime parameter missing from timeupdate video GMSG: " + this.f1961a, null);
                    return Unit.f71706a;
                }
                try {
                    sy0 sy0Var = this.f1962b;
                    Float.parseFloat(str);
                    synchronized (sy0Var.f9733f) {
                        Unit unit = Unit.f71706a;
                    }
                } catch (NumberFormatException e3) {
                    zi3.a(4, "Could not parse currentTime from timeupdate video GMSG: ".concat(str), e3);
                }
                return Unit.f71706a;
            default:
                t70.s sVar = this.f1962b.f9732e;
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                ?? r62 = this.f1961a;
                String str2 = (String) r62.get("src");
                if (str2 != null && !r70.k.U0(str2)) {
                    sVar.X(str2);
                    return Unit.f71706a;
                }
                zi3.a(6, "Src parameter missing from video GMSG: " + ((Object) r62), null);
                sVar.X(null);
                return Unit.f71706a;
        }
    }
}
