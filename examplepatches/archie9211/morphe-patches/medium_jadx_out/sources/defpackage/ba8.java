package defpackage;

import android.os.Bundle;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ba8 implements iy6, wue, pi5, hpb {
    public final mp a;
    public va8 b;
    public final Bundle c;
    public vx6 d;
    public final la8 e;
    public final String f;
    public final Bundle g;
    public final da8 h = new da8(this);
    public final w5d i = new w5d(new em4(27, this));

    public ba8(mp mpVar, va8 va8Var, Bundle bundle, vx6 vx6Var, la8 la8Var, String str, Bundle bundle2) {
        this.a = mpVar;
        this.b = va8Var;
        this.c = bundle;
        this.d = vx6Var;
        this.e = la8Var;
        this.f = str;
        this.g = bundle2;
    }

    public final vob a() {
        return (vob) this.i.getValue();
    }

    public final void b(vx6 vx6Var) {
        vx6Var.getClass();
        da8 da8Var = this.h;
        da8Var.getClass();
        da8Var.k = vx6Var;
        da8Var.b();
    }

    public final boolean equals(Object obj) {
        Set<String> setKeySet;
        if (obj != null && (obj instanceof ba8)) {
            ba8 ba8Var = (ba8) obj;
            Bundle bundle = ba8Var.c;
            if (!this.f.equals(ba8Var.f) || !g76.L(this.b, ba8Var.b) || this.h.j != ba8Var.h.j || getSavedStateRegistry() != ba8Var.getSavedStateRegistry()) {
                return false;
            }
            Bundle bundle2 = this.c;
            if (g76.L(bundle2, bundle)) {
                return true;
            }
            if (bundle2 != null && (setKeySet = bundle2.keySet()) != null) {
                Set<String> set = setKeySet;
                if ((set instanceof Collection) && set.isEmpty()) {
                    return true;
                }
                for (String str : set) {
                    if (!g76.L(bundle2.get(str), bundle != null ? bundle.get(str) : null)) {
                    }
                }
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x003a  */
    @Override // defpackage.pi5
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.qg2 getDefaultViewModelCreationExtras() {
        /*
            r5 = this;
            da8 r0 = r5.h
            r0.getClass()
            g68 r1 = new g68
            r2 = 0
            r1.<init>(r2)
            no3 r2 = defpackage.kyd.i
            ba8 r3 = r0.a
            java.util.LinkedHashMap r4 = r1.a
            r4.put(r2, r3)
            zi5 r2 = defpackage.kyd.j
            r4.put(r2, r3)
            android.os.Bundle r0 = r0.a()
            if (r0 == 0) goto L24
            xsa r2 = defpackage.kyd.k
            r4.put(r2, r0)
        L24:
            r0 = 0
            mp r5 = r5.a
            if (r5 == 0) goto L3a
            android.content.Context r5 = r5.a
            if (r5 == 0) goto L32
            android.content.Context r5 = r5.getApplicationContext()
            goto L33
        L32:
            r5 = r0
        L33:
            boolean r2 = r5 instanceof android.app.Application
            if (r2 == 0) goto L3a
            android.app.Application r5 = (android.app.Application) r5
            goto L3b
        L3a:
            r5 = r0
        L3b:
            if (r5 == 0) goto L3e
            r0 = r5
        L3e:
            if (r0 == 0) goto L45
            rz5 r5 = defpackage.tue.f
            r4.put(r5, r0)
        L45:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ba8.getDefaultViewModelCreationExtras():qg2");
    }

    @Override // defpackage.pi5
    public final uue getDefaultViewModelProviderFactory() {
        return this.h.l;
    }

    @Override // defpackage.iy6
    public final wx6 getLifecycle() {
        return this.h.j;
    }

    @Override // defpackage.hpb
    public final epb getSavedStateRegistry() {
        return this.h.h.b;
    }

    @Override // defpackage.wue
    public final vue getViewModelStore() {
        da8 da8Var = this.h;
        if (!da8Var.i) {
            ygf.f("You cannot access the NavBackStackEntry's ViewModels until it is added to the NavController's back stack (i.e., the Lifecycle of the NavBackStackEntry reaches the CREATED state).");
            return null;
        }
        if (da8Var.j.d == vx6.DESTROYED) {
            ygf.f("You cannot access the NavBackStackEntry's ViewModels after the NavBackStackEntry is destroyed.");
            return null;
        }
        la8 la8Var = da8Var.e;
        if (la8Var == null) {
            ygf.f("You must call setViewModelStore() on your NavHostController before accessing the ViewModelStore of a navigation graph.");
            return null;
        }
        String str = da8Var.f;
        LinkedHashMap linkedHashMap = la8Var.b;
        vue vueVar = (vue) linkedHashMap.get(str);
        if (vueVar != null) {
            return vueVar;
        }
        vue vueVar2 = new vue();
        linkedHashMap.put(str, vueVar2);
        return vueVar2;
    }

    public final int hashCode() {
        Set<String> setKeySet;
        int iHashCode = this.b.hashCode() + (this.f.hashCode() * 31);
        Bundle bundle = this.c;
        if (bundle != null && (setKeySet = bundle.keySet()) != null) {
            Iterator<T> it2 = setKeySet.iterator();
            while (it2.hasNext()) {
                int i = iHashCode * 31;
                Object obj = bundle.get((String) it2.next());
                iHashCode = i + (obj != null ? obj.hashCode() : 0);
            }
        }
        return getSavedStateRegistry().hashCode() + ((this.h.j.hashCode() + (iHashCode * 31)) * 31);
    }

    public final String toString() {
        return this.h.toString();
    }
}
