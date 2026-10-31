package s10;

import android.content.ComponentName;
import android.os.UserHandle;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import nova.branch.engage.sesame_lite.internal.IdHash;
import o9.t1;
import t70.j0;

/* loaded from: classes4.dex */
public final class v extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ d0 f86638t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v(d0 d0Var, Continuation continuation) {
        super(2, continuation);
        this.f86638t = d0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new v(this.f86638t, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((v) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Type inference failed for: r7v0, types: [java.lang.Object, java.util.List] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        q9.p pVar;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        try {
            pVar = this.f86638t.f86586i;
        } catch (Exception e3) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("NovaBranchSearchManager");
            bVar.p(e3, "Failed to update Branch app hashes on app update", new Object[0]);
        }
        if (pVar == null) {
            Intrinsics.m("allAppsStore");
            throw null;
        }
        ga.a[] aVarArr = pVar.f83863c;
        ArrayList arrayList = new ArrayList(aVarArr.length);
        for (ga.a aVar : aVarArr) {
            arrayList.add(new Pair(aVar.f57279y, aVar.o));
        }
        d0 d0Var = this.f86638t;
        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            Pair pair = (Pair) it.next();
            ComponentName componentName = (ComponentName) pair.f71683a;
            arrayList2.add(IdHash.INSTANCE.ofAppComponent(componentName.getPackageName(), componentName.getClassName(), d0Var.f86580c.d((UserHandle) pair.f71684b)));
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        d0 d0Var2 = this.f86638t;
        ArrayList arrayList3 = new ArrayList();
        Iterator it2 = arrayList2.iterator();
        while (it2.hasNext()) {
            Object next = it2.next();
            if (!d0Var2.f86589l.contains((IdHash) next)) {
                arrayList3.add(next);
            }
        }
        linkedHashSet.addAll(arrayList3);
        Iterable iterable = (Iterable) this.f86638t.f86589l;
        ArrayList arrayList4 = new ArrayList();
        for (Object obj2 : iterable) {
            if (!arrayList2.contains((IdHash) obj2)) {
                arrayList4.add(obj2);
            }
        }
        linkedHashSet.addAll(arrayList4);
        if (!linkedHashSet.isEmpty()) {
            fz.d0 d0Var3 = ((t1) t1.f80131h.h(this.f86638t.f86578a)).f80135d;
            Iterator it3 = linkedHashSet.iterator();
            while (it3.hasNext()) {
                d0Var3.C.remove(Integer.valueOf(((IdHash) it3.next()).hashCode()));
            }
        }
        return Unit.f71706a;
    }
}
