package defpackage;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.Log;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.fragment.app.FragmentContainerView;
import androidx.fragment.app.strictmode.WrongFragmentContainerViolation;
import androidx.fragment.app.strictmode.WrongNestedHierarchyViolation;
import com.medium.android.admin.stagebranch.uG.peNPu;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.WeakHashMap;
import sprig.b.VPIE.gYpYQDQkhfs;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class s25 {
    public final hx4 a;
    public final n0c b;
    public final j15 c;
    public boolean d = false;
    public int e = -1;

    public s25(hx4 hx4Var, n0c n0cVar, ClassLoader classLoader, w15 w15Var, Bundle bundle) {
        this.a = hx4Var;
        this.b = n0cVar;
        j15 j15VarA = ((q25) bundle.getParcelable("state")).a(w15Var);
        this.c = j15VarA;
        j15VarA.b = bundle;
        Bundle bundle2 = bundle.getBundle("arguments");
        if (bundle2 != null) {
            bundle2.setClassLoader(classLoader);
        }
        j15VarA.V(bundle2);
        if (f25.I(2)) {
            Log.v("FragmentManager", "Instantiated fragment " + j15VarA);
        }
    }

    public final void a() {
        boolean zI = f25.I(3);
        j15 j15Var = this.c;
        if (zI) {
            Log.d("FragmentManager", "moveto ACTIVITY_CREATED: " + j15Var);
        }
        Bundle bundle = j15Var.b;
        Bundle bundle2 = bundle != null ? bundle.getBundle("savedInstanceState") : null;
        j15Var.u.P();
        j15Var.a = 3;
        j15Var.E = false;
        j15Var.w();
        if (!j15Var.E) {
            throw new k2d(km4.x("Fragment ", j15Var, " did not call through to super.onActivityCreated()"));
        }
        if (f25.I(3)) {
            Log.d("FragmentManager", "moveto RESTORE_VIEW_STATE: " + j15Var);
        }
        if (j15Var.G != null) {
            Bundle bundle3 = j15Var.b;
            Bundle bundle4 = bundle3 != null ? bundle3.getBundle("savedInstanceState") : null;
            SparseArray<Parcelable> sparseArray = j15Var.c;
            if (sparseArray != null) {
                j15Var.G.restoreHierarchyState(sparseArray);
                j15Var.c = null;
            }
            j15Var.E = false;
            j15Var.N(bundle4);
            if (!j15Var.E) {
                throw new k2d(km4.x("Fragment ", j15Var, " did not call through to super.onViewStateRestored()"));
            }
            if (j15Var.G != null) {
                j15Var.P.a(ux6.ON_CREATE);
            }
        }
        j15Var.b = null;
        g25 g25Var = j15Var.u;
        g25Var.G = false;
        g25Var.H = false;
        g25Var.N.g = false;
        g25Var.t(4);
        this.a.v(j15Var, bundle2, false);
    }

    public final void b() {
        j15 j15Var;
        View view;
        View view2;
        j15 j15Var2 = this.c;
        View view3 = j15Var2.F;
        while (true) {
            j15Var = null;
            if (view3 == null) {
                break;
            }
            Object tag = view3.getTag(R.id.fragment_container_view_tag);
            j15 j15Var3 = tag instanceof j15 ? (j15) tag : null;
            if (j15Var3 != null) {
                j15Var = j15Var3;
                break;
            } else {
                Object parent = view3.getParent();
                view3 = parent instanceof View ? (View) parent : null;
            }
        }
        j15 j15Var4 = j15Var2.v;
        if (j15Var != null && j15Var != j15Var4) {
            int i = j15Var2.x;
            t25 t25Var = u25.a;
            StringBuilder sb = new StringBuilder("Attempting to nest fragment ");
            sb.append(j15Var2);
            sb.append(" within the view of parent fragment ");
            sb.append(j15Var);
            sb.append(" via container with ID ");
            u25.b(new WrongNestedHierarchyViolation(j15Var2, ho2.H(sb, i, " without using parent's childFragmentManager")));
            u25.a(j15Var2).getClass();
        }
        ArrayList arrayList = (ArrayList) this.b.b;
        ViewGroup viewGroup = j15Var2.F;
        int iIndexOfChild = -1;
        if (viewGroup != null) {
            int iIndexOf = arrayList.indexOf(j15Var2);
            int i2 = iIndexOf - 1;
            while (true) {
                if (i2 < 0) {
                    while (true) {
                        iIndexOf++;
                        if (iIndexOf >= arrayList.size()) {
                            break;
                        }
                        j15 j15Var5 = (j15) arrayList.get(iIndexOf);
                        if (j15Var5.F == viewGroup && (view = j15Var5.G) != null) {
                            iIndexOfChild = viewGroup.indexOfChild(view);
                            break;
                        }
                    }
                } else {
                    j15 j15Var6 = (j15) arrayList.get(i2);
                    if (j15Var6.F == viewGroup && (view2 = j15Var6.G) != null) {
                        iIndexOfChild = viewGroup.indexOfChild(view2) + 1;
                        break;
                    }
                    i2--;
                }
            }
        }
        j15Var2.F.addView(j15Var2.G, iIndexOfChild);
    }

    public final void c() {
        boolean zI = f25.I(3);
        j15 j15Var = this.c;
        if (zI) {
            Log.d("FragmentManager", "moveto ATTACHED: " + j15Var);
        }
        j15 j15Var2 = j15Var.g;
        s25 s25Var = null;
        n0c n0cVar = this.b;
        if (j15Var2 != null) {
            s25 s25Var2 = (s25) ((HashMap) n0cVar.c).get(j15Var2.e);
            if (s25Var2 == null) {
                StringBuilder sb = new StringBuilder("Fragment ");
                sb.append(j15Var);
                j15 j15Var3 = j15Var.g;
                sb.append(" declared target fragment ");
                sb.append(j15Var3);
                sb.append(" that does not belong to this FragmentManager!");
                throw new IllegalStateException(sb.toString());
            }
            j15Var.h = j15Var.g.e;
            j15Var.g = null;
            s25Var = s25Var2;
        } else {
            String str = j15Var.h;
            if (str != null && (s25Var = (s25) ((HashMap) n0cVar.c).get(str)) == null) {
                StringBuilder sb2 = new StringBuilder("Fragment ");
                sb2.append(j15Var);
                sb2.append(" declared target fragment ");
                ygf.f(ka1.v(sb2, j15Var.h, " that does not belong to this FragmentManager!"));
                return;
            }
        }
        if (s25Var != null) {
            s25Var.k();
        }
        f25 f25Var = j15Var.s;
        j15Var.t = f25Var.v;
        j15Var.v = f25Var.x;
        hx4 hx4Var = this.a;
        hx4Var.K0(j15Var, false);
        ArrayList arrayList = j15Var.Y;
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            ((h15) it2.next()).a();
        }
        arrayList.clear();
        j15Var.u.b(j15Var.t, j15Var.d(), j15Var);
        j15Var.a = 0;
        j15Var.E = false;
        j15Var.z(j15Var.t.w);
        if (!j15Var.E) {
            throw new k2d(km4.x("Fragment ", j15Var, " did not call through to super.onAttach()"));
        }
        f25 f25Var2 = j15Var.s;
        Iterator it3 = f25Var2.o.iterator();
        while (it3.hasNext()) {
            ((o25) it3.next()).a(f25Var2, j15Var);
        }
        g25 g25Var = j15Var.u;
        g25Var.G = false;
        g25Var.H = false;
        g25Var.N.g = false;
        g25Var.t(0);
        hx4Var.T(j15Var, false);
    }

    public final int d() {
        Object next;
        j15 j15Var = this.c;
        if (j15Var.s == null) {
            return j15Var.a;
        }
        int iMin = this.e;
        int i = r25.a[j15Var.N.ordinal()];
        if (i != 1) {
            iMin = i != 2 ? i != 3 ? i != 4 ? Math.min(iMin, -1) : Math.min(iMin, 0) : Math.min(iMin, 1) : Math.min(iMin, 5);
        }
        if (j15Var.n) {
            boolean z = j15Var.o;
            int i2 = this.e;
            if (z) {
                iMin = Math.max(i2, 2);
                View view = j15Var.G;
                if (view != null && view.getParent() == null) {
                    iMin = Math.min(iMin, 2);
                }
            } else {
                iMin = i2 < 4 ? Math.min(iMin, j15Var.a) : Math.min(iMin, 1);
            }
        }
        if (!j15Var.k) {
            iMin = Math.min(iMin, 1);
        }
        ViewGroup viewGroup = j15Var.F;
        if (viewGroup != null) {
            g23 g23VarF = g23.f(viewGroup, j15Var.m());
            blc blcVarD = g23VarF.d(j15Var);
            clc clcVar = blcVarD != null ? blcVarD.b : null;
            Iterator it2 = g23VarF.c.iterator();
            while (true) {
                if (!it2.hasNext()) {
                    next = null;
                    break;
                }
                next = it2.next();
                blc blcVar = (blc) next;
                if (blcVar.c.equals(j15Var) && !blcVar.f) {
                    break;
                }
            }
            blc blcVar2 = (blc) next;
            clcVar = blcVar2 != null ? blcVar2.b : null;
            int i3 = clcVar == null ? -1 : hlc.a[clcVar.ordinal()];
            if (i3 != -1 && i3 != 1) {
                clcVar = clcVar;
            }
        }
        if (clcVar == clc.ADDING) {
            iMin = Math.min(iMin, 6);
        } else if (clcVar == clc.REMOVING) {
            iMin = Math.max(iMin, 3);
        } else if (j15Var.l) {
            iMin = j15Var.v() ? Math.min(iMin, 1) : Math.min(iMin, -1);
        }
        if (j15Var.H && j15Var.a < 5) {
            iMin = Math.min(iMin, 4);
        }
        if (f25.I(2)) {
            Log.v("FragmentManager", "computeExpectedState() of " + iMin + " for " + j15Var);
        }
        return iMin;
    }

    public final void e() {
        Bundle bundle;
        boolean zI = f25.I(3);
        j15 j15Var = this.c;
        if (zI) {
            Log.d("FragmentManager", "moveto CREATED: " + j15Var);
        }
        Bundle bundle2 = j15Var.b;
        Bundle bundle3 = bundle2 != null ? bundle2.getBundle("savedInstanceState") : null;
        if (j15Var.L) {
            j15Var.a = 1;
            Bundle bundle4 = j15Var.b;
            if (bundle4 == null || (bundle = bundle4.getBundle("childFragmentManager")) == null) {
                return;
            }
            j15Var.u.V(bundle);
            g25 g25Var = j15Var.u;
            g25Var.G = false;
            g25Var.H = false;
            g25Var.N.g = false;
            g25Var.t(1);
            return;
        }
        hx4 hx4Var = this.a;
        hx4Var.L0(j15Var, bundle3, false);
        j15Var.u.P();
        j15Var.a = 1;
        j15Var.E = false;
        j15Var.O.a(new ywa(4, j15Var));
        j15Var.A(bundle3);
        j15Var.L = true;
        if (!j15Var.E) {
            throw new k2d(km4.x("Fragment ", j15Var, " did not call through to super.onCreate()"));
        }
        j15Var.O.e(ux6.ON_CREATE);
        hx4Var.f0(j15Var, bundle3, false);
    }

    public final void g() {
        j15 j15VarE;
        boolean zI = f25.I(3);
        j15 j15Var = this.c;
        if (zI) {
            Log.d("FragmentManager", "movefrom CREATED: " + j15Var);
        }
        boolean zIsChangingConfigurations = true;
        boolean z = j15Var.l && !j15Var.v();
        n0c n0cVar = this.b;
        if (z && !j15Var.m) {
            n0cVar.g0(j15Var.e, null);
        }
        if (!z) {
            i25 i25Var = (i25) n0cVar.e;
            if (!((i25Var.b.containsKey(j15Var.e) && i25Var.e) ? i25Var.f : true)) {
                String str = j15Var.h;
                if (str != null && (j15VarE = n0cVar.E(str)) != null && j15VarE.B) {
                    j15Var.g = j15VarE;
                }
                j15Var.a = 0;
                return;
            }
        }
        l15 l15Var = j15Var.t;
        if (l15Var != null) {
            zIsChangingConfigurations = ((i25) n0cVar.e).f;
        } else {
            Context context = l15Var.w;
            if (context instanceof Activity) {
                zIsChangingConfigurations = true ^ ((Activity) context).isChangingConfigurations();
            }
        }
        if ((z && !j15Var.m) || zIsChangingConfigurations) {
            ((i25) n0cVar.e).f(j15Var, false);
        }
        j15Var.u.k();
        j15Var.O.e(ux6.ON_DESTROY);
        j15Var.a = 0;
        j15Var.E = false;
        j15Var.L = false;
        j15Var.C();
        if (!j15Var.E) {
            throw new k2d(km4.x("Fragment ", j15Var, " did not call through to super.onDestroy()"));
        }
        this.a.l0(j15Var, false);
        for (s25 s25Var : n0cVar.J()) {
            if (s25Var != null) {
                j15 j15Var2 = s25Var.c;
                if (j15Var.e.equals(j15Var2.h)) {
                    j15Var2.g = j15Var;
                    j15Var2.h = null;
                }
            }
        }
        String str2 = j15Var.h;
        if (str2 != null) {
            j15Var.g = n0cVar.E(str2);
        }
        n0cVar.V(this);
    }

    public final void h() {
        View view;
        boolean zI = f25.I(3);
        j15 j15Var = this.c;
        if (zI) {
            Log.d("FragmentManager", "movefrom CREATE_VIEW: " + j15Var);
        }
        ViewGroup viewGroup = j15Var.F;
        if (viewGroup != null && (view = j15Var.G) != null) {
            viewGroup.removeView(view);
        }
        j15Var.u.t(1);
        if (j15Var.G != null) {
            w25 w25Var = j15Var.P;
            w25Var.b();
            if (w25Var.e.d.isAtLeast(vx6.CREATED)) {
                j15Var.P.a(ux6.ON_DESTROY);
            }
        }
        j15Var.a = 1;
        j15Var.E = false;
        j15Var.D();
        if (!j15Var.E) {
            throw new k2d(km4.x("Fragment ", j15Var, " did not call through to super.onDestroyView()"));
        }
        xkc xkcVar = ((q57) new hx4(j15Var, j15Var.getViewModelStore()).c).b;
        int iE = xkcVar.e();
        for (int i = 0; i < iE; i++) {
            ((o57) xkcVar.g(i)).k();
        }
        j15Var.q = false;
        this.a.S0(j15Var, false);
        j15Var.F = null;
        j15Var.G = null;
        j15Var.P = null;
        j15Var.Q.j(null);
        j15Var.o = false;
    }

    public final void i() {
        boolean zI = f25.I(3);
        j15 j15Var = this.c;
        if (zI) {
            Log.d("FragmentManager", "movefrom ATTACHED: " + j15Var);
        }
        j15Var.a = -1;
        j15Var.E = false;
        j15Var.E();
        if (!j15Var.E) {
            throw new k2d(km4.x("Fragment ", j15Var, " did not call through to super.onDetach()"));
        }
        g25 g25Var = j15Var.u;
        if (!g25Var.I) {
            g25Var.k();
            j15Var.u = new g25();
        }
        this.a.x0(j15Var, false);
        j15Var.a = -1;
        j15Var.t = null;
        j15Var.v = null;
        j15Var.s = null;
        if (!j15Var.l || j15Var.v()) {
            i25 i25Var = (i25) this.b.e;
            if (!((i25Var.b.containsKey(j15Var.e) && i25Var.e) ? i25Var.f : true)) {
                return;
            }
        }
        if (f25.I(3)) {
            Log.d("FragmentManager", "initState called for fragment: " + j15Var);
        }
        j15Var.s();
    }

    public final void j() {
        j15 j15Var = this.c;
        if (j15Var.n && j15Var.o && !j15Var.q) {
            if (f25.I(3)) {
                Log.d("FragmentManager", "moveto CREATE_VIEW: " + j15Var);
            }
            Bundle bundle = j15Var.b;
            Bundle bundle2 = bundle != null ? bundle.getBundle("savedInstanceState") : null;
            j15Var.O(j15Var.F(bundle2), null, bundle2);
            View view = j15Var.G;
            if (view != null) {
                view.setSaveFromParentEnabled(false);
                j15Var.G.setTag(R.id.fragment_container_view_tag, j15Var);
                if (j15Var.z) {
                    j15Var.G.setVisibility(8);
                }
                Bundle bundle3 = j15Var.b;
                if (bundle3 != null) {
                    bundle3.getBundle("savedInstanceState");
                }
                j15Var.M(j15Var.G);
                j15Var.u.t(2);
                this.a.R0(j15Var, j15Var.G, bundle2, false);
                j15Var.a = 2;
            }
        }
    }

    public final void k() {
        ViewGroup viewGroup;
        ViewGroup viewGroup2;
        ViewGroup viewGroup3;
        boolean z = this.d;
        j15 j15Var = this.c;
        if (z) {
            if (f25.I(2)) {
                Log.v("FragmentManager", "Ignoring re-entrant call to moveToExpectedState() for " + j15Var);
                return;
            }
            return;
        }
        try {
            this.d = true;
            boolean z2 = false;
            while (true) {
                int iD = d();
                int i = j15Var.a;
                n0c n0cVar = this.b;
                if (iD == i) {
                    if (!z2 && i == -1 && j15Var.l && !j15Var.v() && !j15Var.m) {
                        if (f25.I(3)) {
                            Log.d("FragmentManager", "Cleaning up state of never attached fragment: " + j15Var);
                        }
                        ((i25) n0cVar.e).f(j15Var, true);
                        n0cVar.V(this);
                        if (f25.I(3)) {
                            Log.d("FragmentManager", "initState called for fragment: " + j15Var);
                        }
                        j15Var.s();
                    }
                    if (j15Var.K) {
                        if (j15Var.G != null && (viewGroup = j15Var.F) != null) {
                            g23 g23VarF = g23.f(viewGroup, j15Var.m());
                            if (j15Var.z) {
                                if (f25.I(2)) {
                                    Log.v("FragmentManager", "SpecialEffectsController: Enqueuing hide operation for fragment " + j15Var);
                                }
                                g23VarF.a(flc.GONE, clc.NONE, this);
                            } else {
                                if (f25.I(2)) {
                                    Log.v("FragmentManager", "SpecialEffectsController: Enqueuing show operation for fragment " + j15Var);
                                }
                                g23VarF.a(flc.VISIBLE, clc.NONE, this);
                            }
                        }
                        f25 f25Var = j15Var.s;
                        if (f25Var != null && j15Var.k && f25.J(j15Var)) {
                            f25Var.F = true;
                        }
                        j15Var.K = false;
                        j15Var.u.n();
                    }
                    this.d = false;
                    return;
                }
                if (iD <= i) {
                    switch (i - 1) {
                        case -1:
                            i();
                            break;
                        case 0:
                            if (j15Var.m) {
                                if (((Bundle) ((HashMap) n0cVar.d).get(j15Var.e)) == null) {
                                    n0cVar.g0(j15Var.e, o());
                                }
                            }
                            g();
                            break;
                        case 1:
                            h();
                            j15Var.a = 1;
                            break;
                        case 2:
                            j15Var.o = false;
                            j15Var.a = 2;
                            break;
                        case 3:
                            if (f25.I(3)) {
                                Log.d("FragmentManager", "movefrom ACTIVITY_CREATED: " + j15Var);
                            }
                            if (j15Var.m) {
                                n0cVar.g0(j15Var.e, o());
                            } else if (j15Var.G != null && j15Var.c == null) {
                                p();
                            }
                            if (j15Var.G != null && (viewGroup2 = j15Var.F) != null) {
                                g23 g23VarF2 = g23.f(viewGroup2, j15Var.m());
                                if (f25.I(2)) {
                                    Log.v("FragmentManager", "SpecialEffectsController: Enqueuing remove operation for fragment " + j15Var);
                                }
                                g23VarF2.a(flc.REMOVED, clc.REMOVING, this);
                            }
                            j15Var.a = 3;
                            break;
                        case 4:
                            r();
                            break;
                        case 5:
                            j15Var.a = 5;
                            break;
                        case 6:
                            l();
                            break;
                    }
                } else {
                    switch (i + 1) {
                        case 0:
                            c();
                            break;
                        case 1:
                            e();
                            break;
                        case 2:
                            j();
                            f();
                            break;
                        case 3:
                            a();
                            break;
                        case 4:
                            if (j15Var.G != null && (viewGroup3 = j15Var.F) != null) {
                                g23 g23VarF3 = g23.f(viewGroup3, j15Var.m());
                                flc flcVarFrom = flc.from(j15Var.G.getVisibility());
                                flcVarFrom.getClass();
                                if (f25.I(2)) {
                                    Log.v("FragmentManager", "SpecialEffectsController: Enqueuing add operation for fragment " + j15Var);
                                }
                                g23VarF3.a(flcVarFrom, clc.ADDING, this);
                            }
                            j15Var.a = 4;
                            break;
                        case 5:
                            q();
                            break;
                        case 6:
                            j15Var.a = 6;
                            break;
                        case 7:
                            n();
                            break;
                    }
                }
                z2 = true;
            }
        } catch (Throwable th) {
            this.d = false;
            throw th;
        }
    }

    public final void l() {
        boolean zI = f25.I(3);
        j15 j15Var = this.c;
        if (zI) {
            Log.d("FragmentManager", "movefrom RESUMED: " + j15Var);
        }
        j15Var.u.t(5);
        if (j15Var.G != null) {
            j15Var.P.a(ux6.ON_PAUSE);
        }
        j15Var.O.e(ux6.ON_PAUSE);
        j15Var.a = 6;
        j15Var.E = false;
        j15Var.H();
        if (!j15Var.E) {
            throw new k2d(km4.x("Fragment ", j15Var, " did not call through to super.onPause()"));
        }
        this.a.E0(j15Var, false);
    }

    public final void m(ClassLoader classLoader) {
        j15 j15Var = this.c;
        Bundle bundle = j15Var.b;
        if (bundle == null) {
            return;
        }
        bundle.setClassLoader(classLoader);
        if (j15Var.b.getBundle("savedInstanceState") == null) {
            j15Var.b.putBundle("savedInstanceState", new Bundle());
        }
        j15Var.c = j15Var.b.getSparseParcelableArray("viewState");
        j15Var.d = j15Var.b.getBundle("viewRegistryState");
        q25 q25Var = (q25) j15Var.b.getParcelable("state");
        if (q25Var != null) {
            j15Var.h = q25Var.l;
            j15Var.i = q25Var.m;
            j15Var.I = q25Var.n;
        }
        if (j15Var.I) {
            return;
        }
        j15Var.H = true;
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0041  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void n() {
        /*
            Method dump skipped, instruction units count: 219
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.s25.n():void");
    }

    public final void p() {
        j15 j15Var = this.c;
        if (j15Var.G == null) {
            return;
        }
        if (f25.I(2)) {
            Log.v("FragmentManager", "Saving view state for fragment " + j15Var + " with view " + j15Var.G);
        }
        SparseArray<Parcelable> sparseArray = new SparseArray<>();
        j15Var.G.saveHierarchyState(sparseArray);
        if (sparseArray.size() > 0) {
            j15Var.c = sparseArray;
        }
        Bundle bundle = new Bundle();
        j15Var.P.f.b(bundle);
        if (bundle.isEmpty()) {
            return;
        }
        j15Var.d = bundle;
    }

    public final void q() {
        boolean zI = f25.I(3);
        j15 j15Var = this.c;
        if (zI) {
            Log.d("FragmentManager", "moveto STARTED: " + j15Var);
        }
        j15Var.u.P();
        j15Var.u.y(true);
        j15Var.a = 5;
        j15Var.E = false;
        j15Var.K();
        if (!j15Var.E) {
            throw new k2d(km4.x("Fragment ", j15Var, " did not call through to super.onStart()"));
        }
        ky6 ky6Var = j15Var.O;
        ux6 ux6Var = ux6.ON_START;
        ky6Var.e(ux6Var);
        if (j15Var.G != null) {
            j15Var.P.e.e(ux6Var);
        }
        g25 g25Var = j15Var.u;
        g25Var.G = false;
        g25Var.H = false;
        g25Var.N.g = false;
        g25Var.t(5);
        this.a.P0(j15Var, false);
    }

    public final void r() {
        boolean zI = f25.I(3);
        j15 j15Var = this.c;
        if (zI) {
            Log.d("FragmentManager", "movefrom STARTED: " + j15Var);
        }
        g25 g25Var = j15Var.u;
        g25Var.H = true;
        g25Var.N.g = true;
        g25Var.t(4);
        if (j15Var.G != null) {
            j15Var.P.a(ux6.ON_STOP);
        }
        j15Var.O.e(ux6.ON_STOP);
        j15Var.a = 4;
        j15Var.E = false;
        j15Var.L();
        if (!j15Var.E) {
            throw new k2d(km4.x("Fragment ", j15Var, " did not call through to super.onStop()"));
        }
        this.a.Q0(j15Var, false);
    }

    public final void f() {
        String resourceName;
        j15 j15Var = this.c;
        if (j15Var.n) {
            return;
        }
        if (f25.I(3)) {
            Log.d("FragmentManager", "moveto CREATE_VIEW: " + j15Var);
        }
        Bundle bundle = j15Var.b;
        String str = peNPu.EexVLjU;
        ViewGroup viewGroup = null;
        Bundle bundle2 = bundle != null ? bundle.getBundle(str) : null;
        LayoutInflater layoutInflaterF = j15Var.F(bundle2);
        ViewGroup viewGroup2 = j15Var.F;
        if (viewGroup2 != null) {
            viewGroup = viewGroup2;
        } else {
            int i = j15Var.x;
            if (i != 0) {
                if (i == -1) {
                    ay0.e(km4.x("Cannot create fragment ", j15Var, " for a container view with no id"));
                    return;
                }
                viewGroup = (ViewGroup) j15Var.s.w.T(i);
                if (viewGroup == null) {
                    if (!j15Var.p) {
                        try {
                            resourceName = j15Var.n().getResourceName(j15Var.x);
                        } catch (Resources.NotFoundException unused) {
                            resourceName = "unknown";
                        }
                        throw new IllegalArgumentException("No view found for id 0x" + Integer.toHexString(j15Var.x) + " (" + resourceName + ") for fragment " + j15Var);
                    }
                } else if (!(viewGroup instanceof FragmentContainerView)) {
                    t25 t25Var = u25.a;
                    u25.b(new WrongFragmentContainerViolation(j15Var, "Attempting to add fragment " + j15Var + " to container " + viewGroup + " which is not a FragmentContainerView"));
                    u25.a(j15Var).getClass();
                }
            }
        }
        j15Var.F = viewGroup;
        j15Var.O(layoutInflaterF, viewGroup, bundle2);
        int i2 = 2;
        if (j15Var.G != null) {
            if (f25.I(3)) {
                Log.d("FragmentManager", "moveto VIEW_CREATED: " + j15Var);
            }
            j15Var.G.setSaveFromParentEnabled(false);
            j15Var.G.setTag(R.id.fragment_container_view_tag, j15Var);
            if (viewGroup != null) {
                b();
            }
            if (j15Var.z) {
                j15Var.G.setVisibility(8);
            }
            View view = j15Var.G;
            WeakHashMap weakHashMap = ute.a;
            boolean zIsAttachedToWindow = view.isAttachedToWindow();
            View view2 = j15Var.G;
            if (zIsAttachedToWindow) {
                view2.requestApplyInsets();
            } else {
                view2.addOnAttachStateChangeListener(new pp(i2, view2));
            }
            Bundle bundle3 = j15Var.b;
            if (bundle3 != null) {
                bundle3.getBundle(str);
            }
            j15Var.M(j15Var.G);
            j15Var.u.t(2);
            this.a.R0(j15Var, j15Var.G, bundle2, false);
            int visibility = j15Var.G.getVisibility();
            j15Var.f().j = j15Var.G.getAlpha();
            if (j15Var.F != null && visibility == 0) {
                View viewFindFocus = j15Var.G.findFocus();
                if (viewFindFocus != null) {
                    j15Var.f().k = viewFindFocus;
                    if (f25.I(2)) {
                        Log.v("FragmentManager", "requestFocus: Saved focused view " + viewFindFocus + " for Fragment " + j15Var);
                    }
                }
                j15Var.G.setAlpha(0.0f);
            }
        }
        j15Var.a = 2;
    }

    public final Bundle o() {
        Bundle bundle;
        Bundle bundle2 = new Bundle();
        j15 j15Var = this.c;
        if (j15Var.a == -1 && (bundle = j15Var.b) != null) {
            bundle2.putAll(bundle);
        }
        bundle2.putParcelable("state", new q25(j15Var));
        if (j15Var.a > -1) {
            Bundle bundle3 = new Bundle();
            j15Var.J(bundle3);
            if (!bundle3.isEmpty()) {
                bundle2.putBundle("savedInstanceState", bundle3);
            }
            this.a.O0(j15Var, bundle3, false);
            Bundle bundle4 = new Bundle();
            j15Var.S.b(bundle4);
            if (!bundle4.isEmpty()) {
                bundle2.putBundle("registryState", bundle4);
            }
            Bundle bundleW = j15Var.u.W();
            if (!bundleW.isEmpty()) {
                bundle2.putBundle(gYpYQDQkhfs.rDUddLbejv, bundleW);
            }
            if (j15Var.G != null) {
                p();
            }
            SparseArray<? extends Parcelable> sparseArray = j15Var.c;
            if (sparseArray != null) {
                bundle2.putSparseParcelableArray("viewState", sparseArray);
            }
            Bundle bundle5 = j15Var.d;
            if (bundle5 != null) {
                bundle2.putBundle("viewRegistryState", bundle5);
            }
        }
        Bundle bundle6 = j15Var.f;
        if (bundle6 != null) {
            bundle2.putBundle("arguments", bundle6);
        }
        return bundle2;
    }

    public s25(hx4 hx4Var, n0c n0cVar, j15 j15Var) {
        this.a = hx4Var;
        this.b = n0cVar;
        this.c = j15Var;
    }

    public s25(hx4 hx4Var, n0c n0cVar, j15 j15Var, Bundle bundle) {
        this.a = hx4Var;
        this.b = n0cVar;
        this.c = j15Var;
        j15Var.c = null;
        j15Var.d = null;
        j15Var.r = 0;
        j15Var.o = false;
        j15Var.k = false;
        j15 j15Var2 = j15Var.g;
        j15Var.h = j15Var2 != null ? j15Var2.e : null;
        j15Var.g = null;
        j15Var.b = bundle;
        j15Var.f = bundle.getBundle("arguments");
    }
}
