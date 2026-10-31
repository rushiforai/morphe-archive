package r20;

import com.amplitude.android.TrackingOptions;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function3;

/* loaded from: classes4.dex */
public final class e extends SuspendLambda implements Function3 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f85350t;

    /* renamed from: u, reason: collision with root package name */
    public int f85351u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ i20.d f85352v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ c f85353w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ l f85354x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e(l lVar, Continuation continuation, int i5) {
        super(3, continuation);
        this.f85350t = i5;
        this.f85354x = lVar;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        i20.d dVar = (i20.d) obj;
        c cVar = (c) obj2;
        Continuation continuation = (Continuation) obj3;
        switch (this.f85350t) {
            case 0:
                e eVar = new e(this.f85354x, continuation, 0);
                eVar.f85352v = dVar;
                eVar.f85353w = cVar;
                return eVar.invokeSuspend(Unit.f71706a);
            default:
                e eVar2 = new e(this.f85354x, continuation, 1);
                eVar2.f85352v = dVar;
                eVar2.f85353w = cVar;
                return eVar2.invokeSuspend(Unit.f71706a);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0062 A[LOOP:0: B:19:0x005c->B:21:0x0062, LOOP_END] */
    /* JADX WARN: Type inference failed for: r0v1, types: [kotlin.coroutines.intrinsics.CoroutineSingletons] */
    /* JADX WARN: Type inference failed for: r0v3, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r0v5, types: [kotlin.coroutines.intrinsics.CoroutineSingletons] */
    /* JADX WARN: Type inference failed for: r0v7, types: [java.util.ArrayList] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        i20.d dVar;
        switch (this.f85350t) {
            case 0:
                Object arrayList = CoroutineSingletons.f71806a;
                int i5 = this.f85351u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    i20.d dVar2 = this.f85352v;
                    c cVar = this.f85353w;
                    this.f85352v = null;
                    this.f85351u = 1;
                    obj = l.n(this.f85354x, dVar2, cVar, this);
                    if (obj != arrayList) {
                    }
                    return arrayList;
                }
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                Iterable iterable = (Iterable) obj;
                arrayList = new ArrayList(b70.c.u0(iterable, 10));
                Iterator it = iterable.iterator();
                while (it.hasNext()) {
                    arrayList.add(b70.k.e0(new Pair("user_id", (String) it.next())));
                }
                return arrayList;
            default:
                Object arrayList2 = CoroutineSingletons.f71806a;
                int i11 = this.f85351u;
                l lVar = this.f85354x;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    dVar = this.f85352v;
                    c cVar2 = this.f85353w;
                    this.f85352v = dVar;
                    this.f85351u = 1;
                    obj = l.n(lVar, dVar, cVar2, this);
                    if (obj != arrayList2) {
                    }
                    return arrayList2;
                }
                if (i11 != 1) {
                    if (i11 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    List<a> listP0 = b70.g.P0((Iterable) obj);
                    arrayList2 = new ArrayList(b70.c.u0(listP0, 10));
                    for (a aVar : listP0) {
                        arrayList2.add(MapsKt.j0(new Pair("game_id", aVar.f85332a), new Pair(TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE, aVar.f85333b)));
                    }
                    return arrayList2;
                }
                dVar = this.f85352v;
                ResultKt.b(obj);
                this.f85352v = null;
                this.f85351u = 2;
                obj = l.m(lVar, (List) obj, dVar, this);
                if (obj != arrayList2) {
                    List<a> listP02 = b70.g.P0((Iterable) obj);
                    arrayList2 = new ArrayList(b70.c.u0(listP02, 10));
                    while (r6.hasNext()) {
                    }
                }
                return arrayList2;
        }
    }
}
