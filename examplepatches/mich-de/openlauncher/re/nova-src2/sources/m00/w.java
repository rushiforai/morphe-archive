package m00;

import java.util.ArrayList;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class w extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f75650t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ List f75651u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ List f75652v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ boolean f75653w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ w(List list, List list2, boolean z11, Continuation continuation, int i5) {
        super(2, continuation);
        this.f75650t = i5;
        this.f75651u = list;
        this.f75652v = list2;
        this.f75653w = z11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f75650t) {
            case 0:
                return new w(this.f75651u, this.f75652v, this.f75653w, continuation, 0);
            case 1:
                return new w(this.f75651u, this.f75652v, this.f75653w, continuation, 1);
            default:
                return new w(this.f75651u, this.f75652v, this.f75653w, continuation, 2);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f75650t) {
        }
        return ((w) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f75650t;
        boolean z11 = this.f75653w;
        List list = this.f75652v;
        List list2 = this.f75651u;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                List<t> list3 = list2;
                ArrayList arrayList = new ArrayList(b70.c.u0(list3, 10));
                for (t tVar : list3) {
                    boolean zContains = list.contains(tVar.f75643f);
                    arrayList.add(t.a(tVar, null, zContains, zContains || z11, null, 39));
                }
                return arrayList;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                List<e> list4 = list2;
                ArrayList arrayList2 = new ArrayList(b70.c.u0(list4, 10));
                for (e eVar : list4) {
                    List<t> list5 = eVar.f75537c;
                    ArrayList arrayList3 = new ArrayList(b70.c.u0(list5, 10));
                    for (t tVar2 : list5) {
                        boolean zContains2 = list.contains(tVar2.f75643f);
                        arrayList3.add(t.a(tVar2, null, zContains2, zContains2 || z11, null, 39));
                    }
                    arrayList2.add(new e(eVar.f75535a, eVar.f75536b, arrayList3));
                }
                return arrayList2;
            default:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                List<e> list6 = list2;
                ArrayList arrayList4 = new ArrayList(b70.c.u0(list6, 10));
                for (e eVar2 : list6) {
                    List<t> list7 = eVar2.f75537c;
                    ArrayList arrayList5 = new ArrayList(b70.c.u0(list7, 10));
                    for (t tVar3 : list7) {
                        boolean zContains3 = list.contains(tVar3.f75643f);
                        arrayList5.add(t.a(tVar3, null, zContains3, zContains3 || z11, null, 39));
                    }
                    arrayList4.add(new e(eVar2.f75535a, eVar2.f75536b, arrayList5));
                }
                return arrayList4;
        }
    }
}
