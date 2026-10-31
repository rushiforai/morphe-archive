package s50;

import ads_mobile_sdk.mu0;
import ads_mobile_sdk.pk1;
import b.c0;
import b.r;
import b.u7;
import e10.j2;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class l implements k {

    /* renamed from: a, reason: collision with root package name */
    public final Map f86691a;

    public l(Map modifiers) {
        Intrinsics.g(modifiers, "modifiers");
        this.f86691a = modifiers;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(u7 u7Var, ContinuationImpl continuationImpl) {
        pk1 pk1Var;
        Object obj;
        Iterator it;
        if (continuationImpl instanceof pk1) {
            pk1Var = (pk1) continuationImpl;
            int i5 = pk1Var.f8301e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                pk1Var.f8301e = i5 - Integer.MIN_VALUE;
            } else {
                pk1Var = new pk1(this, continuationImpl);
            }
        }
        Object obj2 = pk1Var.f8299c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = pk1Var.f8301e;
        if (i11 == 0) {
            ResultKt.b(obj2);
            obj = u7Var;
            it = this.f86691a.entrySet().iterator();
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            it = pk1Var.f8298b;
            obj = pk1Var.f8297a;
            ResultKt.b(obj2);
        }
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            String str = (String) entry.getKey();
            r rVar = (r) entry.getValue();
            cz.b bVar = mu0.f7335a;
            c0.z("Configuring JsContext with modifier [", str, "]");
            pk1Var.f8297a = obj;
            pk1Var.f8298b = it;
            pk1Var.f8301e = 1;
            if (rVar.a(obj, pk1Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        }
        return Unit.f71706a;
    }

    @Override // s50.k
    public boolean b() {
        return true;
    }

    @Override // s50.k
    public void c(String name, Iterable values) {
        Intrinsics.g(name, "name");
        Intrinsics.g(values, "values");
        List listF = f(name);
        Iterator it = values.iterator();
        while (it.hasNext()) {
            j((String) it.next());
        }
        b70.d.z0(values, listF);
    }

    @Override // s50.k
    public void clear() {
        this.f86691a.clear();
    }

    @Override // s50.k
    public boolean contains(String name) {
        Intrinsics.g(name, "name");
        return this.f86691a.containsKey(name);
    }

    public void d(String name, String value) {
        Intrinsics.g(name, "name");
        Intrinsics.g(value, "value");
        j(value);
        f(name).add(value);
    }

    public void e(j stringValues) {
        Intrinsics.g(stringValues, "stringValues");
        stringValues.c(new j2(this, 12));
    }

    public List f(String str) {
        Map map = this.f86691a;
        List list = (List) map.get(str);
        if (list != null) {
            return list;
        }
        ArrayList arrayList = new ArrayList();
        i(str);
        map.put(str, arrayList);
        return arrayList;
    }

    @Override // s50.k
    public List g(String name) {
        Intrinsics.g(name, "name");
        return (List) this.f86691a.get(name);
    }

    public String h(String str) {
        List listG = g(str);
        if (listG != null) {
            return (String) b70.g.Y0(listG);
        }
        return null;
    }

    public void i(String name) {
        Intrinsics.g(name, "name");
    }

    @Override // s50.k
    public boolean isEmpty() {
        return this.f86691a.isEmpty();
    }

    public void j(String value) {
        Intrinsics.g(value, "value");
    }

    @Override // s50.k
    public Set names() {
        return this.f86691a.keySet();
    }

    public l() {
        this.f86691a = new b();
    }

    @Override // s50.k
    public Set a() {
        Set setEntrySet = this.f86691a.entrySet();
        Intrinsics.g(setEntrySet, "<this>");
        Set setUnmodifiableSet = Collections.unmodifiableSet(setEntrySet);
        Intrinsics.f(setUnmodifiableSet, "unmodifiableSet(...)");
        return setUnmodifiableSet;
    }
}
