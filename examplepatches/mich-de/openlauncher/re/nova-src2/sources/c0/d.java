package c0;

import ads_mobile_sdk.ck;
import ads_mobile_sdk.nj3;
import ads_mobile_sdk.p31;
import java.util.Set;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class d extends SuspendLambda implements Function1 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f18742t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ Object f18743u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ d(Object obj, Continuation continuation, int i5) {
        super(1, continuation);
        this.f18742t = i5;
        this.f18743u = obj;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Continuation continuation) {
        switch (this.f18742t) {
            case 0:
                return new d((e) this.f18743u, continuation, 0);
            case 1:
                return new d((nj3) this.f18743u, continuation, 1);
            case 2:
                return new d((String) this.f18743u, continuation, 2);
            default:
                return new d((vs.o) this.f18743u, continuation, 3);
        }
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f18742t) {
            case 1:
                break;
        }
        return ((d) create((Continuation) obj)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        p31 p31Var;
        switch (this.f18742t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                e.b((e) this.f18743u);
                return Unit.f71706a;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                nj3 nj3Var = (nj3) this.f18743u;
                ck ckVar = nj3Var.o;
                Set requestTypes = nj3Var.f7619p;
                String strL = nj3Var.f7611f.f2165a.f10559a.l();
                ckVar.getClass();
                Intrinsics.g(requestTypes, "requestTypes");
                synchronized (ckVar.f1918h) {
                    int i5 = ckVar.f1919i;
                    ckVar.f1919i = i5 + 1;
                    if (requestTypes.isEmpty()) {
                        p31Var = new p31(Integer.valueOf(i5), null, null);
                    } else {
                        String strF1 = b70.g.f1(b70.g.C1(requestTypes), ",", null, null, 0, null, 62);
                        Integer num = (Integer) ckVar.f1920j.get(strF1);
                        int iIntValue = num != null ? num.intValue() : 0;
                        ckVar.f1920j.put(strF1, Integer.valueOf(iIntValue + 1));
                        if (strL == null) {
                            p31Var = new p31(Integer.valueOf(i5), Integer.valueOf(iIntValue), null);
                        } else {
                            String str = strL + "|" + strF1;
                            Integer num2 = (Integer) ckVar.f1921k.get(str);
                            int iIntValue2 = num2 != null ? num2.intValue() : 0;
                            ckVar.f1921k.put(str, Integer.valueOf(iIntValue2 + 1));
                            p31Var = new p31(Integer.valueOf(i5), Integer.valueOf(iIntValue), Integer.valueOf(iIntValue2));
                        }
                    }
                }
                return p31Var;
            case 2:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                return (String) this.f18743u;
            default:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                vs.o oVar = (vs.o) this.f18743u;
                vs.g gVar = vs.g.f92959c;
                int i11 = vs.o.f92987r;
                oVar.k(gVar);
                oVar.i(null, null);
                return Unit.f71706a;
        }
    }
}
