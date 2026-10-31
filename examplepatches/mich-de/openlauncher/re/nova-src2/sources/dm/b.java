package dm;

import hv.m;
import java.util.ArrayList;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final class b extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f49272t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f49273u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Function1 f49274v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b(Function1 function1, Continuation continuation, int i5) {
        super(2, continuation);
        this.f49272t = i5;
        this.f49274v = function1;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f49272t) {
            case 0:
                b bVar = new b(this.f49274v, continuation, 0);
                bVar.f49273u = obj;
                return bVar;
            case 1:
                b bVar2 = new b(this.f49274v, continuation, 1);
                bVar2.f49273u = obj;
                return bVar2;
            default:
                b bVar3 = new b(this.f49274v, continuation, 2);
                bVar3.f49273u = obj;
                return bVar3;
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f49272t) {
            case 0:
                return ((b) create((y5.b) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 1:
                return ((b) create((List) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            default:
                return ((b) create((m) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f49272t;
        Function1 function1 = this.f49274v;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                function1.invoke((y5.b) this.f49273u);
                return Unit.f71706a;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                List list = (List) this.f49273u;
                ArrayList arrayList = new ArrayList();
                for (Object obj2 : list) {
                    if (!((Boolean) function1.invoke(obj2)).booleanValue()) {
                        arrayList.add(obj2);
                    }
                }
                return arrayList;
            default:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                function1.invoke((m) this.f49273u);
                return Unit.f71706a;
        }
    }
}
