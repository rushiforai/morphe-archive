package m00;

import com.teslacoilsw.launcher.search.hero.AppWidgetContent;
import java.util.ArrayList;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function4;

/* loaded from: classes4.dex */
public final class i0 extends SuspendLambda implements Function4 {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ List f75570t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ List f75571u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ boolean f75572v;

    @Override // kotlin.jvm.functions.Function4
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
        boolean zBooleanValue = ((Boolean) obj3).booleanValue();
        i0 i0Var = new i0(4, (Continuation) obj4);
        i0Var.f75570t = (List) obj;
        i0Var.f75571u = (List) obj2;
        i0Var.f75572v = zBooleanValue;
        return i0Var.invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        List list = this.f75570t;
        List<com.teslacoilsw.launcher.search.hero.c> list2 = this.f75571u;
        boolean z11 = this.f75572v;
        ArrayList arrayList = new ArrayList();
        for (com.teslacoilsw.launcher.search.hero.c cVar : list2) {
            AppWidgetContent appWidgetContent = cVar instanceof AppWidgetContent ? (AppWidgetContent) cVar : null;
            AppWidgetContent appWidgetContentD = appWidgetContent != null ? AppWidgetContent.d(appWidgetContent, -1, 0, 23) : null;
            if (appWidgetContentD != null) {
                arrayList.add(appWidgetContentD);
            }
        }
        List<e> list3 = list;
        ArrayList arrayList2 = new ArrayList(b70.c.u0(list3, 10));
        for (e eVar : list3) {
            List<t> list4 = eVar.f75537c;
            ArrayList arrayList3 = new ArrayList(b70.c.u0(list4, 10));
            for (t tVar : list4) {
                boolean zO0 = b70.g.O0(arrayList, tVar.f75643f);
                arrayList3.add(t.a(tVar, null, zO0, zO0 || z11, null, 39));
            }
            arrayList2.add(new e(eVar.f75535a, eVar.f75536b, arrayList3));
        }
        return arrayList2;
    }
}
