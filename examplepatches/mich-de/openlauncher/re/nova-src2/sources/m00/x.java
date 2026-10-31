package m00;

import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function4;
import t70.m0;
import t70.y0;

/* loaded from: classes4.dex */
public final class x extends SuspendLambda implements Function4 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f75654t;

    /* renamed from: u, reason: collision with root package name */
    public int f75655u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ List f75656v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ List f75657w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ boolean f75658x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ x(int i5, Continuation continuation, int i11) {
        super(i5, continuation);
        this.f75654t = i11;
    }

    @Override // kotlin.jvm.functions.Function4
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
        int i5 = this.f75654t;
        List list = (List) obj;
        List list2 = (List) obj2;
        boolean zBooleanValue = ((Boolean) obj3).booleanValue();
        Continuation continuation = (Continuation) obj4;
        switch (i5) {
            case 0:
                x xVar = new x(4, continuation, 0);
                xVar.f75656v = list;
                xVar.f75657w = list2;
                xVar.f75658x = zBooleanValue;
                return xVar.invokeSuspend(Unit.f71706a);
            case 1:
                x xVar2 = new x(4, continuation, 1);
                xVar2.f75656v = list;
                xVar2.f75657w = list2;
                xVar2.f75658x = zBooleanValue;
                return xVar2.invokeSuspend(Unit.f71706a);
            default:
                x xVar3 = new x(4, continuation, 2);
                xVar3.f75656v = list;
                xVar3.f75657w = list2;
                xVar3.f75658x = zBooleanValue;
                return xVar3.invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        switch (this.f75654t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f75655u;
                if (i5 != 0) {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                List list = this.f75656v;
                List list2 = this.f75657w;
                boolean z11 = this.f75658x;
                a80.e eVar = y0.f88884a;
                w wVar = new w(list, list2, z11, null, 0);
                this.f75656v = null;
                this.f75655u = 1;
                Object objY = m0.y(eVar, wVar, this);
                return objY == coroutineSingletons ? coroutineSingletons : objY;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f75655u;
                if (i11 != 0) {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                List list3 = this.f75656v;
                List list4 = this.f75657w;
                boolean z12 = this.f75658x;
                a80.e eVar2 = y0.f88884a;
                w wVar2 = new w(list3, list4, z12, null, 1);
                this.f75656v = null;
                this.f75655u = 1;
                Object objY2 = m0.y(eVar2, wVar2, this);
                return objY2 == coroutineSingletons2 ? coroutineSingletons2 : objY2;
            default:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i12 = this.f75655u;
                if (i12 != 0) {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                List list5 = this.f75656v;
                List list6 = this.f75657w;
                boolean z13 = this.f75658x;
                a80.e eVar3 = y0.f88884a;
                w wVar3 = new w(list5, list6, z13, null, 2);
                this.f75656v = null;
                this.f75655u = 1;
                Object objY3 = m0.y(eVar3, wVar3, this);
                return objY3 == coroutineSingletons3 ? coroutineSingletons3 : objY3;
        }
    }
}
