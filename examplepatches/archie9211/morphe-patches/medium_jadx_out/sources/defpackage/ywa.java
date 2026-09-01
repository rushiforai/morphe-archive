package defpackage;

import android.app.Dialog;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.ListIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ywa implements cy6 {
    public final /* synthetic */ int a;
    public final Object b;

    public /* synthetic */ ywa(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.cy6
    public final void f(iy6 iy6Var, ux6 ux6Var) {
        int iNextIndex;
        View view;
        int i = this.a;
        Object obj = this.b;
        Object obj2 = null;
        switch (i) {
            case 0:
                hpb hpbVar = (hpb) obj;
                if (ux6Var != ux6.ON_CREATE) {
                    ay0.d("Next event must be ON_CREATE");
                    return;
                }
                iy6Var.getLifecycle().b(this);
                Bundle bundleA = hpbVar.getSavedStateRegistry().a("androidx.savedstate.Restarter");
                if (bundleA == null) {
                    return;
                }
                ArrayList<String> stringArrayList = bundleA.getStringArrayList("classes_to_restore");
                if (stringArrayList == null) {
                    ygf.f("SavedState with restored state for the component \"androidx.savedstate.Restarter\" must contain list of strings by the key \"classes_to_restore\"");
                    return;
                }
                for (String str : stringArrayList) {
                    try {
                        Class<? extends U> clsAsSubclass = Class.forName(str, false, ywa.class.getClassLoader()).asSubclass(cpb.class);
                        clsAsSubclass.getClass();
                        try {
                            Constructor declaredConstructor = clsAsSubclass.getDeclaredConstructor(null);
                            declaredConstructor.setAccessible(true);
                            try {
                                Object objNewInstance = declaredConstructor.newInstance(null);
                                objNewInstance.getClass();
                                if (!(hpbVar instanceof wue)) {
                                    lg8.m("Internal error: OnRecreation should be registered only on components that implement ViewModelStoreOwner. Received owner: ", hpbVar);
                                    return;
                                }
                                vue viewModelStore = ((wue) hpbVar).getViewModelStore();
                                epb savedStateRegistry = hpbVar.getSavedStateRegistry();
                                viewModelStore.getClass();
                                LinkedHashMap linkedHashMap = viewModelStore.a;
                                for (String str2 : new HashSet(linkedHashMap.keySet())) {
                                    str2.getClass();
                                    que queVar = (que) linkedHashMap.get(str2);
                                    if (queVar != null) {
                                        guc.s(queVar, savedStateRegistry, hpbVar.getLifecycle());
                                    }
                                }
                                if (!new HashSet(linkedHashMap.keySet()).isEmpty()) {
                                    savedStateRegistry.d();
                                }
                            } catch (Exception e) {
                                lg8.p(ka1.r("Failed to instantiate ", str), e);
                                return;
                            }
                        } catch (NoSuchMethodException e2) {
                            throw new IllegalStateException("Class " + clsAsSubclass.getSimpleName() + " must have default constructor in order to be automatically recreated", e2);
                        }
                    } catch (ClassNotFoundException e3) {
                        lg8.p(ev6.x("Class ", str, " wasn't found"), e3);
                        return;
                    }
                }
                return;
            case 1:
                xy1 xy1Var = (xy1) obj;
                xy1.access$ensureViewModelStore(xy1Var);
                xy1Var.getLifecycle().b(this);
                return;
            case 2:
                new HashMap();
                y65[] y65VarArr = (y65[]) obj;
                if (y65VarArr.length > 0) {
                    y65 y65Var = y65VarArr[0];
                    throw null;
                }
                if (y65VarArr.length <= 0) {
                    return;
                }
                y65 y65Var2 = y65VarArr[0];
                throw null;
            case 3:
                jb3 jb3Var = (jb3) obj;
                int i2 = ib3.a[ux6Var.ordinal()];
                if (i2 == 1) {
                    fb3 fb3Var = (fb3) iy6Var;
                    Iterable iterable = (Iterable) jb3Var.b().e.a.getValue();
                    if (!(iterable instanceof Collection) || !((Collection) iterable).isEmpty()) {
                        Iterator it2 = iterable.iterator();
                        while (it2.hasNext()) {
                            if (((ba8) it2.next()).f.equals(fb3Var.y)) {
                                return;
                            }
                        }
                    }
                    fb3Var.Y();
                    return;
                }
                if (i2 == 2) {
                    fb3 fb3Var2 = (fb3) iy6Var;
                    for (Object obj3 : (Iterable) jb3Var.b().f.a.getValue()) {
                        if (((ba8) obj3).f.equals(fb3Var2.y)) {
                            obj2 = obj3;
                        }
                    }
                    ba8 ba8Var = (ba8) obj2;
                    if (ba8Var != null) {
                        jb3Var.b().c(ba8Var);
                        return;
                    }
                    return;
                }
                if (i2 != 3) {
                    if (i2 != 4) {
                        return;
                    }
                    fb3 fb3Var3 = (fb3) iy6Var;
                    for (Object obj4 : (Iterable) jb3Var.b().f.a.getValue()) {
                        if (((ba8) obj4).f.equals(fb3Var3.y)) {
                            obj2 = obj4;
                        }
                    }
                    ba8 ba8Var2 = (ba8) obj2;
                    if (ba8Var2 != null) {
                        jb3Var.b().c(ba8Var2);
                    }
                    fb3Var3.O.b(this);
                    return;
                }
                fb3 fb3Var4 = (fb3) iy6Var;
                Dialog dialog = fb3Var4.x0;
                if (dialog == null) {
                    rd6.w("DialogFragment ", fb3Var4, " does not have a Dialog.");
                    return;
                }
                if (dialog.isShowing()) {
                    return;
                }
                List list = (List) jb3Var.b().e.a.getValue();
                ListIterator listIterator = list.listIterator(list.size());
                while (true) {
                    if (!listIterator.hasPrevious()) {
                        iNextIndex = -1;
                    } else if (((ba8) listIterator.previous()).f.equals(fb3Var4.y)) {
                        iNextIndex = listIterator.nextIndex();
                    }
                }
                ba8 ba8Var3 = (ba8) bu1.A0(iNextIndex, list);
                if (!g76.L(bu1.I0(list), ba8Var3)) {
                    Log.i("DialogFragmentNavigator", "Dialog " + fb3Var4 + " was dismissed while it was not the top of the back stack, popping all dialogs above this dismissed dialog");
                }
                if (ba8Var3 != null) {
                    jb3Var.l(iNextIndex, ba8Var3, false);
                    return;
                }
                return;
            case 4:
                if (ux6Var != ux6.ON_STOP || (view = ((j15) obj).G) == null) {
                    return;
                }
                view.cancelPendingInputEvents();
                return;
            case 5:
                if (ux6Var != ux6.ON_CREATE) {
                    lg8.m("Next event must be ON_CREATE, it was ", ux6Var);
                    return;
                } else {
                    iy6Var.getLifecycle().b(this);
                    ((apb) obj).b();
                    return;
                }
            default:
                if (ux6Var == ux6.ON_DESTROY) {
                    vte vteVar = (vte) obj;
                    vteVar.a = null;
                    vteVar.b = null;
                    return;
                }
                return;
        }
    }
}
