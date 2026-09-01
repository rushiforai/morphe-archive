package defpackage;

import android.app.Application;
import android.os.Bundle;
import androidx.core.widget.nRCC.nGxjfIr;
import java.lang.reflect.Constructor;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ipb implements uue {
    public final Application a;
    public final tue b;
    public final Bundle c;
    public final wx6 d;
    public final epb e;

    public ipb(Application application, hpb hpbVar, Bundle bundle) {
        tue tueVar;
        this.e = hpbVar.getSavedStateRegistry();
        this.d = hpbVar.getLifecycle();
        this.c = bundle;
        this.a = application;
        if (application != null) {
            tueVar = tue.e;
            if (tueVar == null) {
                tueVar = new tue(application);
                tue.e = tueVar;
            }
        } else {
            tueVar = new tue(null);
        }
        this.b = tueVar;
    }

    @Override // defpackage.uue
    public final que a(Class cls) {
        String canonicalName = cls.getCanonicalName();
        if (canonicalName != null) {
            return d(cls, canonicalName);
        }
        ay0.e("Local and anonymous classes can not be ViewModels");
        return null;
    }

    @Override // defpackage.uue
    public final que c(wg6 wg6Var, g68 g68Var) {
        wg6Var.getClass();
        return b(vx0.T(wg6Var), g68Var);
    }

    public final que d(Class cls, String str) {
        vob vobVar;
        wx6 wx6Var = this.d;
        if (wx6Var == null) {
            ik4.k("SavedStateViewModelFactory constructed with empty constructor supports only calls to create(modelClass: Class<T>, extras: CreationExtras).");
            return null;
        }
        boolean zIsAssignableFrom = bu.class.isAssignableFrom(cls);
        Application application = this.a;
        Constructor constructorA = (!zIsAssignableFrom || application == null) ? jpb.a(cls, jpb.b) : jpb.a(cls, jpb.a);
        if (constructorA == null) {
            if (application != null) {
                return this.b.a(cls);
            }
            i33 i33Var = i33.c;
            if (i33Var == null) {
                i33Var = new i33(4);
                i33.c = i33Var;
            }
            return i33Var.a(cls);
        }
        epb epbVar = this.e;
        epbVar.getClass();
        Bundle bundleA = epbVar.a(str);
        if (bundleA == null) {
            bundleA = this.c;
        }
        if (bundleA == null) {
            vobVar = new vob();
        } else {
            ClassLoader classLoader = vob.class.getClassLoader();
            classLoader.getClass();
            bundleA.setClassLoader(classLoader);
            dh7 dh7Var = new dh7(bundleA.size());
            for (String str2 : bundleA.keySet()) {
                str2.getClass();
                dh7Var.put(str2, bundleA.get(str2));
            }
            vobVar = new vob(dh7Var.b());
        }
        wob wobVar = new wob(vobVar, str);
        wobVar.m(epbVar, wx6Var);
        vx6 vx6Var = ((ky6) wx6Var).d;
        int i = 1;
        if (vx6Var == vx6.INITIALIZED || vx6Var.isAtLeast(vx6.STARTED)) {
            epbVar.d();
        } else {
            wx6Var.a(new h03(wx6Var, i, epbVar));
        }
        que queVarB = (!zIsAssignableFrom || application == null) ? jpb.b(cls, constructorA, vobVar) : jpb.b(cls, constructorA, application, vobVar);
        queVarB.a("androidx.lifecycle.savedstate.vm.tag", wobVar);
        return queVarB;
    }

    @Override // defpackage.uue
    public final que b(Class cls, g68 g68Var) {
        cd7 cd7Var = zg7.d;
        LinkedHashMap linkedHashMap = g68Var.a;
        String str = (String) linkedHashMap.get(cd7Var);
        if (str == null) {
            ygf.f(nGxjfIr.qRnt);
            return null;
        }
        if (linkedHashMap.get(kyd.i) == null || linkedHashMap.get(kyd.j) == null) {
            if (this.d != null) {
                return d(cls, str);
            }
            ygf.f("SAVED_STATE_REGISTRY_OWNER_KEY andVIEW_MODEL_STORE_OWNER_KEY must be provided in the creation extras tosuccessfully create a ViewModel.");
            return null;
        }
        Application application = (Application) linkedHashMap.get(tue.f);
        boolean zIsAssignableFrom = bu.class.isAssignableFrom(cls);
        Constructor constructorA = (!zIsAssignableFrom || application == null) ? jpb.a(cls, jpb.b) : jpb.a(cls, jpb.a);
        return constructorA == null ? this.b.b(cls, g68Var) : (!zIsAssignableFrom || application == null) ? jpb.b(cls, constructorA, kyd.Q(g68Var)) : jpb.b(cls, constructorA, application, kyd.Q(g68Var));
    }

    public ipb() {
        this.b = new tue(null);
    }
}
