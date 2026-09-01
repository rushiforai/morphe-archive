package defpackage;

import android.os.Bundle;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class epb {
    public final gpb a;
    public g10 b;

    public epb(gpb gpbVar) {
        this.a = gpbVar;
    }

    public final Bundle a(String str) {
        Bundle bundle;
        gpb gpbVar = this.a;
        if (!gpbVar.g) {
            ygf.f("You can 'consumeRestoredStateForKey' only after the corresponding component has moved to the 'CREATED' state");
            return null;
        }
        Bundle bundle2 = gpbVar.f;
        if (bundle2 == null) {
            return null;
        }
        if (bundle2.containsKey(str)) {
            bundle = bundle2.getBundle(str);
            if (bundle == null) {
                wo7.q(str);
                throw null;
            }
        } else {
            bundle = null;
        }
        bundle2.remove(str);
        if (bundle2.isEmpty()) {
            gpbVar.f = null;
        }
        return bundle;
    }

    public final dpb b(String str) {
        dpb dpbVar;
        gpb gpbVar = this.a;
        synchronized (gpbVar.c) {
            Iterator it2 = gpbVar.d.entrySet().iterator();
            do {
                dpbVar = null;
                if (!it2.hasNext()) {
                    break;
                }
                Map.Entry entry = (Map.Entry) it2.next();
                String str2 = (String) entry.getKey();
                dpb dpbVar2 = (dpb) entry.getValue();
                if (g76.L(str2, str)) {
                    dpbVar = dpbVar2;
                }
            } while (dpbVar == null);
        }
        return dpbVar;
    }

    public final void c(String str, dpb dpbVar) {
        gpb gpbVar = this.a;
        synchronized (gpbVar.c) {
            if (gpbVar.d.containsKey(str)) {
                throw new IllegalArgumentException("SavedStateProvider with the given key is already registered");
            }
            gpbVar.d.put(str, dpbVar);
        }
    }

    public final void d() {
        if (!this.a.h) {
            ygf.f("Can not perform this action after onSaveInstanceState");
            return;
        }
        g10 g10Var = this.b;
        if (g10Var == null) {
            g10Var = new g10(this);
        }
        this.b = g10Var;
        try {
            jx6.class.getDeclaredConstructor(null);
            g10 g10Var2 = this.b;
            if (g10Var2 != null) {
                ((LinkedHashSet) g10Var2.b).add(jx6.class.getName());
            }
        } catch (NoSuchMethodException e) {
            throw new IllegalArgumentException("Class " + jx6.class.getSimpleName() + " must have default constructor in order to be automatically recreated", e);
        }
    }
}
