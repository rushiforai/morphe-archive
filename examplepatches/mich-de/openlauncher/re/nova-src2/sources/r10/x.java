package r10;

import com.teslacoilsw.launcher.search.AppSearchResultsView;
import java.util.ArrayList;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import nova.branch.engage.sesame_lite.internal.IdHash;

/* loaded from: classes4.dex */
public final class x implements t0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ ArrayList f85303a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ IdHash f85304b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ AppSearchResultsView f85305c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f85306d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ ga.a f85307e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f85308f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ String f85309g;

    public x(ArrayList arrayList, IdHash idHash, AppSearchResultsView appSearchResultsView, Ref.ObjectRef objectRef, ga.a aVar, Object obj, String str) {
        this.f85303a = arrayList;
        this.f85304b = idHash;
        this.f85305c = appSearchResultsView;
        this.f85306d = objectRef;
        this.f85307e = aVar;
        this.f85308f = obj;
        this.f85309g = str;
    }

    @Override // r10.t0
    public final int a() {
        return this.f85303a.contains(this.f85304b) ? 2132020304 : 2132019112;
    }

    @Override // r10.t0
    public final int b() {
        return this.f85303a.contains(this.f85304b) ? 2131231831 : 2131231693;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // r10.t0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(Continuation continuation) {
        w wVar;
        com.teslacoilsw.launcher.search.hero.c cVarV;
        u10.c cVarE;
        Ref.ObjectRef objectRef;
        if (continuation instanceof w) {
            wVar = (w) continuation;
            int i5 = wVar.f85278w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                wVar.f85278w = i5 - Integer.MIN_VALUE;
            } else {
                wVar = new w(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = wVar.f85276u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = wVar.f85278w;
        if (i11 == 0) {
            ResultKt.b(obj);
            Ref.ObjectRef objectRef2 = this.f85306d;
            u10.c cVar = (u10.c) objectRef2.f71863a;
            b3.h0 h0Var = AppSearchResultsView.f46177o0;
            AppSearchResultsView appSearchResultsView = this.f85305c;
            if (cVar == null) {
                ga.a aVar = this.f85307e;
                String string = aVar.f57300l.toString();
                String packageName = aVar.f57279y.getPackageName();
                String className = aVar.f57279y.getClassName();
                b20.b0 b0Var = appSearchResultsView.f46186e;
                if (b0Var == null) {
                    Intrinsics.m("cardCallbacks");
                    throw null;
                }
                cVar = new u10.c(string, new com.teslacoilsw.launcher.search.hero.a(packageName, className, b0Var.c(aVar.o)), (List) null, 12);
            }
            List list = cVar.f90368e;
            Object obj2 = this.f85308f;
            if (obj2 instanceof com.teslacoilsw.launcher.search.hero.c) {
                cVarV = (com.teslacoilsw.launcher.search.hero.c) obj2;
            } else {
                if (!(obj2 instanceof g20.i)) {
                    throw new IllegalStateException();
                }
                cVarV = jk.b.V(((g20.i) obj2).f56942e, null, null, 3);
            }
            ArrayList arrayList = this.f85303a;
            IdHash idHash = this.f85304b;
            if (arrayList.contains(idHash)) {
                arrayList.remove(idHash);
                cVarE = u10.c.e(cVar, null, b70.g.p1(list, cVarV), false, 11);
            } else {
                arrayList.add(idHash);
                cVarE = u10.c.e(cVar, null, b70.g.u1(list, cVarV), false, 11);
            }
            e20.d dVar = appSearchResultsView.L;
            wVar.f85275t = objectRef2;
            wVar.f85278w = 1;
            Object objC = AppSearchResultsView.c(appSearchResultsView, dVar, this.f85309g, cVarE, wVar);
            if (objC == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef = objectRef2;
            obj = objC;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objectRef = wVar.f85275t;
            ResultKt.b(obj);
        }
        objectRef.f71863a = obj;
        return Unit.f71706a;
    }
}
