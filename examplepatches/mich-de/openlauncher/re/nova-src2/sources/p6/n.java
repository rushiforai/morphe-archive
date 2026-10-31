package p6;

import android.app.Application;
import android.content.Context;
import android.os.Bundle;
import h6.i1;
import h6.j1;
import h6.n1;
import h6.o1;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Set;
import kotlin.LazyKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class n implements h6.a0, o1, h6.n, a7.h {

    /* renamed from: a, reason: collision with root package name */
    public final Context f82191a;

    /* renamed from: b, reason: collision with root package name */
    public e0 f82192b;

    /* renamed from: c, reason: collision with root package name */
    public final Bundle f82193c;

    /* renamed from: d, reason: collision with root package name */
    public h6.t f82194d;

    /* renamed from: e, reason: collision with root package name */
    public final v f82195e;

    /* renamed from: f, reason: collision with root package name */
    public final String f82196f;

    /* renamed from: g, reason: collision with root package name */
    public final Bundle f82197g;

    /* renamed from: h, reason: collision with root package name */
    public final h6.c0 f82198h = new h6.c0(this);

    /* renamed from: i, reason: collision with root package name */
    public final a7.g f82199i = new a7.g(new c7.a(this, new a7.f(this, 0)));

    /* renamed from: j, reason: collision with root package name */
    public boolean f82200j;

    /* renamed from: k, reason: collision with root package name */
    public final a70.d f82201k;

    /* renamed from: l, reason: collision with root package name */
    public h6.t f82202l;

    /* renamed from: m, reason: collision with root package name */
    public final h6.b1 f82203m;

    public n(Context context, e0 e0Var, Bundle bundle, h6.t tVar, v vVar, String str, Bundle bundle2) {
        this.f82191a = context;
        this.f82192b = e0Var;
        this.f82193c = bundle;
        this.f82194d = tVar;
        this.f82195e = vVar;
        this.f82196f = str;
        this.f82197g = bundle2;
        a70.d dVarA = LazyKt.a(new m(this, 0));
        this.f82201k = LazyKt.a(new m(this, 1));
        this.f82202l = h6.t.f59441b;
        this.f82203m = (h6.b1) dVarA.getValue();
    }

    public final Bundle a() {
        Bundle bundle = this.f82193c;
        if (bundle == null) {
            return null;
        }
        return new Bundle(bundle);
    }

    public final void b(h6.t maxState) {
        Intrinsics.g(maxState, "maxState");
        this.f82202l = maxState;
        c();
    }

    public final void c() {
        if (!this.f82200j) {
            a7.g gVar = this.f82199i;
            gVar.f441a.d();
            this.f82200j = true;
            if (this.f82195e != null) {
                h6.y0.b(this);
            }
            gVar.a(this.f82197g);
        }
        int iOrdinal = this.f82194d.ordinal();
        int iOrdinal2 = this.f82202l.ordinal();
        h6.c0 c0Var = this.f82198h;
        if (iOrdinal < iOrdinal2) {
            c0Var.h(this.f82194d);
        } else {
            c0Var.h(this.f82202l);
        }
    }

    public final boolean equals(Object obj) {
        Set<String> setKeySet;
        if (obj != null && (obj instanceof n)) {
            n nVar = (n) obj;
            Bundle bundle = nVar.f82193c;
            if (Intrinsics.b(this.f82196f, nVar.f82196f) && Intrinsics.b(this.f82192b, nVar.f82192b) && Intrinsics.b(this.f82198h, nVar.f82198h) && Intrinsics.b(this.f82199i.f442b, nVar.f82199i.f442b)) {
                Bundle bundle2 = this.f82193c;
                if (Intrinsics.b(bundle2, bundle)) {
                    return true;
                }
                if (bundle2 != null && (setKeySet = bundle2.keySet()) != null) {
                    Set<String> set = setKeySet;
                    if ((set instanceof Collection) && set.isEmpty()) {
                        return true;
                    }
                    for (String str : set) {
                        if (!Intrinsics.b(bundle2.get(str), bundle != null ? bundle.get(str) : null)) {
                        }
                    }
                    return true;
                }
            }
        }
        return false;
    }

    @Override // h6.n
    public final k6.c getDefaultViewModelCreationExtras() {
        k6.d dVar = new k6.d(0);
        Context context = this.f82191a;
        Object applicationContext = context != null ? context.getApplicationContext() : null;
        Application application = applicationContext instanceof Application ? (Application) applicationContext : null;
        LinkedHashMap linkedHashMap = dVar.f71150a;
        if (application != null) {
            linkedHashMap.put(i1.f59383d, application);
        }
        linkedHashMap.put(h6.y0.f59469a, this);
        linkedHashMap.put(h6.y0.f59470b, this);
        Bundle bundleA = a();
        if (bundleA != null) {
            linkedHashMap.put(h6.y0.f59471c, bundleA);
        }
        return dVar;
    }

    @Override // h6.n
    public final j1 getDefaultViewModelProviderFactory() {
        return this.f82203m;
    }

    @Override // h6.a0
    public final h6.u getLifecycle() {
        return this.f82198h;
    }

    @Override // a7.h
    public final a7.e getSavedStateRegistry() {
        return this.f82199i.f442b;
    }

    @Override // h6.o1
    public final n1 getViewModelStore() {
        if (!this.f82200j) {
            throw new IllegalStateException("You cannot access the NavBackStackEntry's ViewModels until it is added to the NavController's back stack (i.e., the Lifecycle of the NavBackStackEntry reaches the CREATED state).");
        }
        if (this.f82198h.f59342d == h6.t.f59440a) {
            throw new IllegalStateException("You cannot access the NavBackStackEntry's ViewModels after the NavBackStackEntry is destroyed.");
        }
        v vVar = this.f82195e;
        if (vVar == null) {
            throw new IllegalStateException("You must call setViewModelStore() on your NavHostController before accessing the ViewModelStore of a navigation graph.");
        }
        String backStackEntryId = this.f82196f;
        Intrinsics.g(backStackEntryId, "backStackEntryId");
        LinkedHashMap linkedHashMap = vVar.f82279a;
        n1 n1Var = (n1) linkedHashMap.get(backStackEntryId);
        if (n1Var != null) {
            return n1Var;
        }
        n1 n1Var2 = new n1();
        linkedHashMap.put(backStackEntryId, n1Var2);
        return n1Var2;
    }

    public final int hashCode() {
        Set<String> setKeySet;
        int iHashCode = this.f82192b.hashCode() + (this.f82196f.hashCode() * 31);
        Bundle bundle = this.f82193c;
        if (bundle != null && (setKeySet = bundle.keySet()) != null) {
            Iterator<T> it = setKeySet.iterator();
            while (it.hasNext()) {
                int i5 = iHashCode * 31;
                Object obj = bundle.get((String) it.next());
                iHashCode = i5 + (obj != null ? obj.hashCode() : 0);
            }
        }
        return this.f82199i.f442b.hashCode() + ((this.f82198h.hashCode() + (iHashCode * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(n.class.getSimpleName());
        sb2.append("(" + this.f82196f + ')');
        sb2.append(" destination=");
        sb2.append(this.f82192b);
        String string = sb2.toString();
        Intrinsics.f(string, "sb.toString()");
        return string;
    }
}
