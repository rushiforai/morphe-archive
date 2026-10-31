package t5;

import ads_mobile_sdk.hv;
import ads_mobile_sdk.i03;
import ads_mobile_sdk.jx2;
import ads_mobile_sdk.qw2;
import ads_mobile_sdk.u22;
import ads_mobile_sdk.v22;
import ads_mobile_sdk.y2;
import ads_mobile_sdk.z1;
import android.net.Uri;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* loaded from: classes.dex */
public final class e extends SuspendLambda implements Function2 {
    public final /* synthetic */ Object A;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f88565t;

    /* renamed from: u, reason: collision with root package name */
    public int f88566u;

    /* renamed from: v, reason: collision with root package name */
    public Object f88567v;

    /* renamed from: w, reason: collision with root package name */
    public Object f88568w;

    /* renamed from: x, reason: collision with root package name */
    public Object f88569x;

    /* renamed from: y, reason: collision with root package name */
    public /* synthetic */ Object f88570y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ Object f88571z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Continuation continuation, int i5) {
        super(2, continuation);
        this.f88565t = i5;
        this.f88567v = obj;
        this.f88568w = obj2;
        this.f88569x = obj3;
        this.f88570y = obj4;
        this.f88571z = obj5;
        this.A = obj6;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f88565t) {
            case 0:
                e eVar = new e((List) this.f88571z, (ArrayList) this.A, continuation);
                eVar.f88570y = obj;
                return eVar;
            case 1:
                return new e((i03) this.f88567v, (Map.Entry) this.f88568w, (ni.q) this.f88569x, (Map) this.f88570y, (qw2) this.f88571z, (mi.a) this.A, continuation, 1);
            default:
                return new e((jx2) this.f88567v, (Uri) this.f88568w, (z1) this.f88569x, (hv) this.f88570y, (y2) this.f88571z, (Boolean) this.A, continuation, 2);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f88565t) {
        }
        return ((e) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x00fb  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x011d  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x013b  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:41:0x011b -> B:35:0x00f5). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:43:0x0138 -> B:35:0x00f5). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        List list;
        Object objA;
        Iterator it;
        Object objB;
        w5.c cVar;
        int i5 = this.f88565t;
        Object obj2 = this.A;
        Object obj3 = this.f88571z;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = this.f88566u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    Object obj4 = this.f88570y;
                    Iterator it2 = ((List) obj3).iterator();
                    list = (ArrayList) obj2;
                    objA = obj4;
                    it = it2;
                } else if (i11 == 1) {
                    objA = this.f88569x;
                    w5.c cVar2 = (w5.c) this.f88568w;
                    it = (Iterator) this.f88567v;
                    List list2 = (List) this.f88570y;
                    ResultKt.b(obj);
                    cVar = cVar2;
                    list = list2;
                    objB = obj;
                    if (((Boolean) objB).booleanValue()) {
                        list.add(new c0.g0(cVar, null, 7));
                        this.f88570y = list;
                        this.f88567v = it;
                        this.f88568w = null;
                        this.f88569x = null;
                        this.f88566u = 2;
                        objA = cVar.a(objA, this);
                        if (objA == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    }
                } else {
                    if (i11 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    Iterator it3 = (Iterator) this.f88567v;
                    list = (List) this.f88570y;
                    ResultKt.b(obj);
                    it = it3;
                    objA = obj;
                }
                if (!it.hasNext()) {
                    cVar = (w5.c) it.next();
                    this.f88570y = list;
                    this.f88567v = it;
                    this.f88568w = cVar;
                    this.f88569x = objA;
                    this.f88566u = 1;
                    objB = cVar.b(objA, this);
                    if (objB == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    if (((Boolean) objB).booleanValue()) {
                    }
                    if (!it.hasNext()) {
                        return objA;
                    }
                }
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i12 = this.f88566u;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    this.f88566u = 1;
                    if (((i03) this.f88567v).a((Map.Entry) this.f88568w, (ni.q) this.f88569x, (Map) this.f88570y, (qw2) obj3, (mi.a) obj2, this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                jx2 jx2Var = (jx2) this.f88567v;
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i13 = this.f88566u;
                if (i13 == 0) {
                    ResultKt.b(obj);
                    Uri uri = (Uri) this.f88568w;
                    u22 u22Var = ((z1) this.f88569x).f12410w0;
                    Intrinsics.d(u22Var);
                    v22 v22Var = u22Var.f10190a;
                    Duration.Companion companion = Duration.f72038b;
                    long jG = DurationKt.g(0, DurationUnit.f72045d);
                    String str = ((hv) this.f88570y).f4554h;
                    Uri uri2 = (Uri) this.f88568w;
                    this.f88566u = 1;
                    if (jx2Var.a(uri, v22Var, 1, jG, str, jx2Var.f5445g.a(uri2), (y2) obj3, (z1) this.f88569x, (Boolean) obj2, this) == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(List list, ArrayList arrayList, Continuation continuation) {
        super(2, continuation);
        this.f88565t = 0;
        this.f88571z = list;
        this.A = arrayList;
    }
}
