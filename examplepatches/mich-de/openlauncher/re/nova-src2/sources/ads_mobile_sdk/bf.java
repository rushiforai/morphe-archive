package ads_mobile_sdk;

import b.c0;
import b.ic;
import b.wc;
import java.util.Collections;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class bf extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f1390a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f1391b;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f1392t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ bf(String str, Object obj, Continuation continuation, int i5) {
        super(2, continuation);
        this.f1392t = i5;
        this.f1391b = str;
        this.f1390a = obj;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f1392t) {
            case 0:
                bf bfVar = new bf(this.f1391b, continuation);
                bfVar.f1390a = obj;
                return bfVar;
            case 1:
                return new bf(this.f1391b, this.f1390a, continuation, 1);
            case 2:
                return new bf(this.f1391b, this.f1390a, continuation, 2);
            case 3:
                return new bf(this.f1391b, this.f1390a, continuation, 3);
            case 4:
                return new bf(this.f1391b, this.f1390a, continuation, 4);
            default:
                return new bf(this.f1391b, this.f1390a, continuation, 5);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f1392t) {
            case 0:
                bf bfVar = new bf(this.f1391b, (Continuation) obj2);
                bfVar.f1390a = (ze) obj;
                break;
        }
        return ((bf) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f1392t;
        String key = this.f1391b;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                wc wcVar = (wc) ((ze) this.f1390a).n();
                Intrinsics.f(Collections.unmodifiableMap(Collections.unmodifiableMap(((ze) wcVar.f1095b).logs_)), "getLogsMap(...)");
                Intrinsics.g(key, "key");
                wcVar.b();
                ze zeVar = (ze) wcVar.f1095b;
                gn1 gn1Var = zeVar.logs_;
                if (!gn1Var.f4009a) {
                    zeVar.logs_ = gn1Var.b();
                }
                zeVar.logs_.remove(key);
                break;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                cz.b bVar = mu0.f7335a;
                c0.z("Invoking function [onDestroy] on listener [", key, "]");
                ((ic) this.f1390a).onDestroy();
                break;
            case 2:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                cz.b bVar2 = mu0.f7335a;
                c0.z("Invoking function [onPause] on listener [", key, "]");
                ((ic) this.f1390a).onPause();
                break;
            case 3:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                cz.b bVar3 = mu0.f7335a;
                c0.z("Invoking function [onRestart] on listener [", key, "]");
                ((ic) this.f1390a).c();
                break;
            case 4:
                CoroutineSingletons coroutineSingletons5 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                cz.b bVar4 = mu0.f7335a;
                c0.z("Invoking function [onStart] on listener [", key, "]");
                ((ic) this.f1390a).a$1();
                break;
            default:
                CoroutineSingletons coroutineSingletons6 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                cz.b bVar5 = mu0.f7335a;
                c0.z("Invoking function [onUserLeaveHint] on listener [", key, "]");
                ((ic) this.f1390a).b$1();
                break;
        }
        return Unit.f71706a;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bf(String str, Continuation continuation) {
        super(2, continuation);
        this.f1392t = 0;
        this.f1391b = str;
    }
}
