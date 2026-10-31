package e20;

import java.util.ArrayList;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class b extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f52007t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ String f52008u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f52009v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(String str, Ref.ObjectRef objectRef, Continuation continuation) {
        super(2, continuation);
        this.f52008u = str;
        this.f52009v = objectRef;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        b bVar = new b(this.f52008u, this.f52009v, continuation);
        bVar.f52007t = obj;
        return bVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((b) create((List) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        List list = (List) this.f52007t;
        ArrayList arrayList = new ArrayList();
        for (Object obj2 : list) {
            k kVar = (k) obj2;
            if (Intrinsics.b(kVar.f52040b, this.f52008u)) {
                this.f52009v.f71863a = kVar;
            } else {
                arrayList.add(obj2);
            }
        }
        return arrayList;
    }
}
