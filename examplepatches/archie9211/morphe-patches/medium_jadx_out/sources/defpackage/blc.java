package defpackage;

import android.util.Log;
import android.view.View;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class blc {
    public flc a;
    public clc b;
    public final j15 c;
    public final ArrayList d;
    public final LinkedHashSet e;
    public boolean f;
    public boolean g;
    public final s25 h;

    public blc(flc flcVar, clc clcVar, s25 s25Var, a61 a61Var) {
        flcVar.getClass();
        clcVar.getClass();
        j15 j15Var = s25Var.c;
        flcVar.getClass();
        clcVar.getClass();
        this.a = flcVar;
        this.b = clcVar;
        this.c = j15Var;
        this.d = new ArrayList();
        this.e = new LinkedHashSet();
        a61Var.a(new o19(8, this));
        this.h = s25Var;
    }

    public final void a() {
        LinkedHashSet linkedHashSet = this.e;
        if (this.f) {
            return;
        }
        this.f = true;
        if (linkedHashSet.isEmpty()) {
            b();
            return;
        }
        for (a61 a61Var : bu1.p1(linkedHashSet)) {
            synchronized (a61Var) {
                try {
                    if (!a61Var.a) {
                        a61Var.a = true;
                        a61Var.c = true;
                        z51 z51Var = a61Var.b;
                        if (z51Var != null) {
                            try {
                                z51Var.onCancel();
                            } catch (Throwable th) {
                                synchronized (a61Var) {
                                    a61Var.c = false;
                                    a61Var.notifyAll();
                                    throw th;
                                }
                            }
                        }
                        synchronized (a61Var) {
                            a61Var.c = false;
                            a61Var.notifyAll();
                        }
                    }
                } finally {
                }
            }
        }
    }

    public final void b() {
        if (!this.g) {
            if (f25.I(2)) {
                Log.v("FragmentManager", "SpecialEffectsController: " + this + " has called complete.");
            }
            this.g = true;
            Iterator it2 = this.d.iterator();
            while (it2.hasNext()) {
                ((Runnable) it2.next()).run();
            }
        }
        this.h.k();
    }

    public final void c(flc flcVar, clc clcVar) {
        flcVar.getClass();
        clcVar.getClass();
        int i = glc.a[clcVar.ordinal()];
        j15 j15Var = this.c;
        if (i == 1) {
            if (this.a == flc.REMOVED) {
                if (f25.I(2)) {
                    Log.v("FragmentManager", "SpecialEffectsController: For fragment " + j15Var + " mFinalState = REMOVED -> VISIBLE. mLifecycleImpact = " + this.b + " to ADDING.");
                }
                this.a = flc.VISIBLE;
                this.b = clc.ADDING;
                return;
            }
            return;
        }
        if (i == 2) {
            if (f25.I(2)) {
                Log.v("FragmentManager", "SpecialEffectsController: For fragment " + j15Var + " mFinalState = " + this.a + " -> REMOVED. mLifecycleImpact  = " + this.b + " to REMOVING.");
            }
            this.a = flc.REMOVED;
            this.b = clc.REMOVING;
            return;
        }
        if (i == 3 && this.a != flc.REMOVED) {
            if (f25.I(2)) {
                Log.v("FragmentManager", "SpecialEffectsController: For fragment " + j15Var + " mFinalState = " + this.a + " -> " + flcVar + '.');
            }
            this.a = flcVar;
        }
    }

    public final void d() {
        clc clcVar = this.b;
        clc clcVar2 = clc.ADDING;
        s25 s25Var = this.h;
        if (clcVar != clcVar2) {
            if (clcVar == clc.REMOVING) {
                j15 j15Var = s25Var.c;
                View viewT = j15Var.T();
                if (f25.I(2)) {
                    Log.v("FragmentManager", "Clearing focus " + viewT.findFocus() + " on view " + viewT + " for Fragment " + j15Var);
                }
                viewT.clearFocus();
                return;
            }
            return;
        }
        j15 j15Var2 = s25Var.c;
        View viewFindFocus = j15Var2.G.findFocus();
        if (viewFindFocus != null) {
            j15Var2.f().k = viewFindFocus;
            if (f25.I(2)) {
                Log.v("FragmentManager", "requestFocus: Saved focused view " + viewFindFocus + " for Fragment " + j15Var2);
            }
        }
        View viewT2 = this.c.T();
        if (viewT2.getParent() == null) {
            s25Var.b();
            viewT2.setAlpha(0.0f);
        }
        if (viewT2.getAlpha() == 0.0f && viewT2.getVisibility() == 0) {
            viewT2.setVisibility(4);
        }
        f15 f15Var = j15Var2.J;
        viewT2.setAlpha(f15Var == null ? 1.0f : f15Var.j);
    }

    public final String toString() {
        StringBuilder sbU = lv8.u("Operation {", Integer.toHexString(System.identityHashCode(this)), "} {finalState = ");
        sbU.append(this.a);
        sbU.append(" lifecycleImpact = ");
        sbU.append(this.b);
        sbU.append(" fragment = ");
        sbU.append(this.c);
        sbU.append('}');
        return sbU.toString();
    }
}
