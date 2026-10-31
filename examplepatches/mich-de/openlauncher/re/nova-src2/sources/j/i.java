package j;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import androidx.activity.result.ActivityResult;
import b.u4;
import h6.a0;
import h6.s;
import h6.t;
import h6.u;
import h6.y;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.NoSuchElementException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.ConstrainedOnceSequence;

/* loaded from: classes.dex */
public abstract class i {

    /* renamed from: a, reason: collision with root package name */
    public final LinkedHashMap f68431a = new LinkedHashMap();

    /* renamed from: b, reason: collision with root package name */
    public final LinkedHashMap f68432b = new LinkedHashMap();

    /* renamed from: c, reason: collision with root package name */
    public final LinkedHashMap f68433c = new LinkedHashMap();

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f68434d = new ArrayList();

    /* renamed from: e, reason: collision with root package name */
    public final transient LinkedHashMap f68435e = new LinkedHashMap();

    /* renamed from: f, reason: collision with root package name */
    public final LinkedHashMap f68436f = new LinkedHashMap();

    /* renamed from: g, reason: collision with root package name */
    public final Bundle f68437g = new Bundle();

    public final boolean a(int i5, int i11, Intent intent) {
        String str = (String) this.f68431a.get(Integer.valueOf(i5));
        if (str == null) {
            return false;
        }
        e eVar = (e) this.f68435e.get(str);
        if ((eVar != null ? eVar.f68422a : null) != null) {
            ArrayList arrayList = this.f68434d;
            if (arrayList.contains(str)) {
                eVar.f68422a.onActivityResult(eVar.f68423b.parseResult(i11, intent));
                arrayList.remove(str);
                return true;
            }
        }
        this.f68436f.remove(str);
        this.f68437g.putParcelable(str, new ActivityResult(i11, intent));
        return true;
    }

    public abstract void b(int i5, k.b bVar, Object obj, n4.c cVar);

    public final h c(final String key, a0 a0Var, final k.b contract, final a callback) {
        Intrinsics.g(key, "key");
        Intrinsics.g(contract, "contract");
        Intrinsics.g(callback, "callback");
        u lifecycle = a0Var.getLifecycle();
        if (lifecycle.b().compareTo(t.f59443d) >= 0) {
            throw new IllegalStateException(("LifecycleOwner " + a0Var + " is attempting to register while current state is " + lifecycle.b() + ". LifecycleOwners must call register before they are STARTED.").toString());
        }
        e(key);
        LinkedHashMap linkedHashMap = this.f68433c;
        f fVar = (f) linkedHashMap.get(key);
        if (fVar == null) {
            fVar = new f(lifecycle);
        }
        y yVar = new y() { // from class: j.d
            @Override // h6.y
            public final void d(a0 a0Var2, s sVar) {
                i iVar = this.f68418a;
                Bundle bundle = iVar.f68437g;
                LinkedHashMap linkedHashMap2 = iVar.f68435e;
                LinkedHashMap linkedHashMap3 = iVar.f68436f;
                String key2 = key;
                Intrinsics.g(key2, "$key");
                a callback2 = callback;
                Intrinsics.g(callback2, "$callback");
                k.b contract2 = contract;
                Intrinsics.g(contract2, "$contract");
                if (s.ON_START != sVar) {
                    if (s.ON_STOP == sVar) {
                        linkedHashMap2.remove(key2);
                        return;
                    } else {
                        if (s.ON_DESTROY == sVar) {
                            iVar.f(key2);
                            return;
                        }
                        return;
                    }
                }
                linkedHashMap2.put(key2, new e(contract2, callback2));
                if (linkedHashMap3.containsKey(key2)) {
                    Object obj = linkedHashMap3.get(key2);
                    linkedHashMap3.remove(key2);
                    callback2.onActivityResult(obj);
                }
                ActivityResult activityResult = (ActivityResult) vm.d.i(bundle, key2, ActivityResult.class);
                if (activityResult != null) {
                    bundle.remove(key2);
                    callback2.onActivityResult(contract2.parseResult(activityResult.f13597a, activityResult.f13598b));
                }
            }
        };
        fVar.f68424a.a(yVar);
        fVar.f68425b.add(yVar);
        linkedHashMap.put(key, fVar);
        return new h(this, key, contract, 0);
    }

    public final h d(String key, k.b contract, a aVar) {
        Intrinsics.g(key, "key");
        Intrinsics.g(contract, "contract");
        e(key);
        this.f68435e.put(key, new e(contract, aVar));
        LinkedHashMap linkedHashMap = this.f68436f;
        if (linkedHashMap.containsKey(key)) {
            Object obj = linkedHashMap.get(key);
            linkedHashMap.remove(key);
            aVar.onActivityResult(obj);
        }
        Bundle bundle = this.f68437g;
        ActivityResult activityResult = (ActivityResult) vm.d.i(bundle, key, ActivityResult.class);
        if (activityResult != null) {
            bundle.remove(key);
            aVar.onActivityResult(contract.parseResult(activityResult.f13597a, activityResult.f13598b));
        }
        return new h(this, key, contract, 1);
    }

    public final void e(String str) {
        LinkedHashMap linkedHashMap = this.f68432b;
        if (((Integer) linkedHashMap.get(str)) != null) {
            return;
        }
        Iterator it = ((ConstrainedOnceSequence) q70.d.q0(g.f68426j)).iterator();
        while (it.hasNext()) {
            Number number = (Number) it.next();
            Integer numValueOf = Integer.valueOf(number.intValue());
            LinkedHashMap linkedHashMap2 = this.f68431a;
            if (!linkedHashMap2.containsKey(numValueOf)) {
                int iIntValue = number.intValue();
                linkedHashMap2.put(Integer.valueOf(iIntValue), str);
                linkedHashMap.put(str, Integer.valueOf(iIntValue));
                return;
            }
        }
        throw new NoSuchElementException("Sequence contains no element matching the predicate.");
    }

    public final void f(String key) {
        Integer num;
        Intrinsics.g(key, "key");
        if (!this.f68434d.contains(key) && (num = (Integer) this.f68432b.remove(key)) != null) {
            this.f68431a.remove(num);
        }
        this.f68435e.remove(key);
        LinkedHashMap linkedHashMap = this.f68436f;
        if (linkedHashMap.containsKey(key)) {
            StringBuilder sbK = u4.k("Dropping pending result for request ", key, ": ");
            sbK.append(linkedHashMap.get(key));
            Log.w("ActivityResultRegistry", sbK.toString());
            linkedHashMap.remove(key);
        }
        Bundle bundle = this.f68437g;
        if (bundle.containsKey(key)) {
            Log.w("ActivityResultRegistry", "Dropping pending result for request " + key + ": " + ((ActivityResult) vm.d.i(bundle, key, ActivityResult.class)));
            bundle.remove(key);
        }
        LinkedHashMap linkedHashMap2 = this.f68433c;
        f fVar = (f) linkedHashMap2.get(key);
        if (fVar != null) {
            ArrayList arrayList = fVar.f68425b;
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                fVar.f68424a.c((y) it.next());
            }
            arrayList.clear();
            linkedHashMap2.remove(key);
        }
    }
}
