package defpackage;

import android.app.Activity;
import android.app.Application;
import android.content.ComponentCallbacks;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Bundle;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.fragment.app.strictmode.SetRetainInstanceUsageViolation;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class j15 implements ComponentCallbacks, View.OnCreateContextMenuListener, iy6, wue, pi5, hpb {
    public static final Object l0 = new Object();
    public boolean A;
    public boolean B;
    public boolean C;
    public boolean E;
    public ViewGroup F;
    public View G;
    public boolean H;
    public f15 J;
    public boolean K;
    public boolean L;
    public String M;
    public vx6 N;
    public ky6 O;
    public w25 P;
    public final n68 Q;
    public ipb R;
    public fpb S;
    public final AtomicInteger X;
    public final ArrayList Y;
    public final c15 Z;
    public Bundle b;
    public SparseArray c;
    public Bundle d;
    public Bundle f;
    public j15 g;
    public int i;
    public boolean k;
    public boolean l;
    public boolean m;
    public boolean n;
    public boolean o;
    public boolean p;
    public boolean q;
    public int r;
    public f25 s;
    public l15 t;
    public j15 v;
    public int w;
    public int x;
    public String y;
    public boolean z;
    public int a = -1;
    public String e = UUID.randomUUID().toString();
    public String h = null;
    public Boolean j = null;
    public g25 u = new g25();
    public final boolean D = true;
    public boolean I = true;

    public j15() {
        new jn(7, this);
        this.N = vx6.RESUMED;
        this.Q = new n68();
        this.X = new AtomicInteger();
        this.Y = new ArrayList();
        this.Z = new c15(this);
        r();
    }

    public void A(Bundle bundle) {
        Bundle bundle2;
        this.E = true;
        Bundle bundle3 = this.b;
        if (bundle3 != null && (bundle2 = bundle3.getBundle("childFragmentManager")) != null) {
            this.u.V(bundle2);
            g25 g25Var = this.u;
            g25Var.G = false;
            g25Var.H = false;
            g25Var.N.g = false;
            g25Var.t(1);
        }
        g25 g25Var2 = this.u;
        if (g25Var2.u >= 1) {
            return;
        }
        g25Var2.G = false;
        g25Var2.H = false;
        g25Var2.N.g = false;
        g25Var2.t(1);
    }

    public View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return null;
    }

    public void C() {
        this.E = true;
    }

    public void D() {
        this.E = true;
    }

    public void E() {
        this.E = true;
    }

    public LayoutInflater F(Bundle bundle) {
        l15 l15Var = this.t;
        if (l15Var == null) {
            ygf.f("onGetLayoutInflater() cannot be executed until the Fragment is attached to the FragmentManager.");
            return null;
        }
        m15 m15Var = l15Var.z;
        LayoutInflater layoutInflaterCloneInContext = m15Var.getLayoutInflater().cloneInContext(m15Var);
        layoutInflaterCloneInContext.setFactory2(this.u.f);
        return layoutInflaterCloneInContext;
    }

    public void G(Context context, AttributeSet attributeSet, Bundle bundle) {
        this.E = true;
        l15 l15Var = this.t;
        if ((l15Var == null ? null : l15Var.v) != null) {
            this.E = true;
        }
    }

    public void H() {
        this.E = true;
    }

    public void I() {
        this.E = true;
    }

    public void K() {
        this.E = true;
    }

    public void L() {
        this.E = true;
    }

    public void N(Bundle bundle) {
        this.E = true;
    }

    public void O(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.u.P();
        this.q = true;
        this.P = new w25(this, getViewModelStore(), new v0(23, this));
        View viewB = B(layoutInflater, viewGroup, bundle);
        this.G = viewB;
        w25 w25Var = this.P;
        if (viewB == null) {
            if (w25Var.e == null) {
                this.P = null;
                return;
            } else {
                ygf.f("Called getViewLifecycleOwner() but onCreateView() returned null");
                return;
            }
        }
        w25Var.b();
        if (f25.I(3)) {
            Log.d("FragmentManager", "Setting ViewLifecycleOwner on View " + this.G + " for Fragment " + this);
        }
        View view = this.G;
        w25 w25Var2 = this.P;
        view.getClass();
        view.setTag(R.id.view_tree_lifecycle_owner, w25Var2);
        View view2 = this.G;
        w25 w25Var3 = this.P;
        view2.getClass();
        view2.setTag(R.id.view_tree_view_model_store_owner, w25Var3);
        View view3 = this.G;
        w25 w25Var4 = this.P;
        view3.getClass();
        view3.setTag(R.id.view_tree_saved_state_registry_owner, w25Var4);
        this.Q.j(this.P);
    }

    public final k7 P(f7 f7Var, d7 d7Var) {
        pkf pkfVar = new pkf(this);
        if (this.a > 1) {
            ygf.f(km4.x("Fragment ", this, " is attempting to registerForActivityResult after being created. Fragments must call registerForActivityResult() before they are created (i.e. initialization, onAttach(), or onCreate())."));
            return null;
        }
        AtomicReference atomicReference = new AtomicReference();
        e15 e15Var = new e15(this, pkfVar, atomicReference, f7Var, d7Var);
        if (this.a >= 0) {
            e15Var.a();
        } else {
            this.Y.add(e15Var);
        }
        return new b15(atomicReference);
    }

    public final m15 Q() {
        m15 m15VarG = g();
        if (m15VarG != null) {
            return m15VarG;
        }
        ygf.f(km4.x("Fragment ", this, " not attached to an activity."));
        return null;
    }

    public final Bundle R() {
        Bundle bundle = this.f;
        if (bundle != null) {
            return bundle;
        }
        ygf.f(km4.x("Fragment ", this, " does not have any arguments."));
        return null;
    }

    public final Context S() {
        Context contextI = i();
        if (contextI != null) {
            return contextI;
        }
        ygf.f(km4.x("Fragment ", this, " not attached to a context."));
        return null;
    }

    public final View T() {
        View view = this.G;
        if (view != null) {
            return view;
        }
        ygf.f(km4.x("Fragment ", this, " did not return a View from onCreateView() or this was called before onCreateView()."));
        return null;
    }

    public final void U(int i, int i2, int i3, int i4) {
        if (this.J == null && i == 0 && i2 == 0 && i3 == 0 && i4 == 0) {
            return;
        }
        f().b = i;
        f().c = i2;
        f().d = i3;
        f().e = i4;
    }

    public final void V(Bundle bundle) {
        f25 f25Var = this.s;
        if (f25Var != null) {
            if (f25Var == null ? false : f25Var.N()) {
                ygf.f("Fragment already added and state has been saved");
                return;
            }
        }
        this.f = bundle;
    }

    public final void W() {
        t25 t25Var = u25.a;
        u25.b(new SetRetainInstanceUsageViolation(this, "Attempting to set retain instance for fragment " + this));
        u25.a(this).getClass();
        this.B = true;
        f25 f25Var = this.s;
        if (f25Var != null) {
            f25Var.N.e(this);
        } else {
            this.C = true;
        }
    }

    public final void X(Intent intent) {
        l15 l15Var = this.t;
        if (l15Var != null) {
            l15Var.w.startActivity(intent, null);
        } else {
            ygf.f(km4.x("Fragment ", this, " not attached to Activity"));
        }
    }

    public gx1 d() {
        return new d15(this);
    }

    public final boolean equals(Object obj) {
        return this == obj;
    }

    public final f15 f() {
        f15 f15Var = this.J;
        if (f15Var != null) {
            return f15Var;
        }
        f15 f15Var2 = new f15();
        Object obj = l0;
        f15Var2.g = obj;
        f15Var2.h = obj;
        f15Var2.i = obj;
        f15Var2.j = 1.0f;
        f15Var2.k = null;
        this.J = f15Var2;
        return f15Var2;
    }

    public final m15 g() {
        l15 l15Var = this.t;
        if (l15Var == null) {
            return null;
        }
        return l15Var.v;
    }

    @Override // defpackage.pi5
    public final qg2 getDefaultViewModelCreationExtras() {
        Application application;
        Context applicationContext = S().getApplicationContext();
        while (true) {
            if (!(applicationContext instanceof ContextWrapper)) {
                application = null;
                break;
            }
            if (applicationContext instanceof Application) {
                application = (Application) applicationContext;
                break;
            }
            applicationContext = ((ContextWrapper) applicationContext).getBaseContext();
        }
        if (application == null && f25.I(3)) {
            Log.d("FragmentManager", "Could not find Application instance from Context " + S().getApplicationContext() + ", you will not be able to use AndroidViewModel with the default ViewModelProvider.Factory");
        }
        g68 g68Var = new g68(0);
        LinkedHashMap linkedHashMap = g68Var.a;
        if (application != null) {
            linkedHashMap.put(tue.f, application);
        }
        linkedHashMap.put(kyd.i, this);
        linkedHashMap.put(kyd.j, this);
        Bundle bundle = this.f;
        if (bundle != null) {
            linkedHashMap.put(kyd.k, bundle);
        }
        return g68Var;
    }

    public uue getDefaultViewModelProviderFactory() {
        Application application = null;
        if (this.s == null) {
            ygf.f("Can't access ViewModels from detached fragment");
            return null;
        }
        ipb ipbVar = this.R;
        if (ipbVar != null) {
            return ipbVar;
        }
        Context applicationContext = S().getApplicationContext();
        while (true) {
            if (!(applicationContext instanceof ContextWrapper)) {
                break;
            }
            if (applicationContext instanceof Application) {
                application = (Application) applicationContext;
                break;
            }
            applicationContext = ((ContextWrapper) applicationContext).getBaseContext();
        }
        if (application == null && f25.I(3)) {
            Log.d("FragmentManager", "Could not find Application instance from Context " + S().getApplicationContext() + ", you will need CreationExtras to use AndroidViewModel with the default ViewModelProvider.Factory");
        }
        ipb ipbVar2 = new ipb(application, this, this.f);
        this.R = ipbVar2;
        return ipbVar2;
    }

    @Override // defpackage.iy6
    public final wx6 getLifecycle() {
        return this.O;
    }

    @Override // defpackage.hpb
    public final epb getSavedStateRegistry() {
        return this.S.b;
    }

    @Override // defpackage.wue
    public final vue getViewModelStore() {
        if (this.s == null) {
            ygf.f("Can't access ViewModels from detached fragment");
            return null;
        }
        if (k() == vx6.INITIALIZED.ordinal()) {
            ygf.f("Calling getViewModelStore() before a Fragment reaches onCreate() when using setMaxLifecycle(INITIALIZED) is not supported");
            return null;
        }
        HashMap map = this.s.N.d;
        vue vueVar = (vue) map.get(this.e);
        if (vueVar != null) {
            return vueVar;
        }
        vue vueVar2 = new vue();
        map.put(this.e, vueVar2);
        return vueVar2;
    }

    public final f25 h() {
        if (this.t != null) {
            return this.u;
        }
        ygf.f(km4.x("Fragment ", this, " has not been attached yet."));
        return null;
    }

    public Context i() {
        l15 l15Var = this.t;
        if (l15Var == null) {
            return null;
        }
        return l15Var.w;
    }

    public final int k() {
        vx6 vx6Var = this.N;
        return (vx6Var == vx6.INITIALIZED || this.v == null) ? vx6Var.ordinal() : Math.min(vx6Var.ordinal(), this.v.k());
    }

    public final f25 m() {
        f25 f25Var = this.s;
        if (f25Var != null) {
            return f25Var;
        }
        ygf.f(km4.x("Fragment ", this, " not associated with a fragment manager."));
        return null;
    }

    public final Resources n() {
        return S().getResources();
    }

    public final String o(int i) {
        return n().getString(i);
    }

    @Override // android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration configuration) {
        this.E = true;
    }

    @Override // android.view.View.OnCreateContextMenuListener
    public final void onCreateContextMenu(ContextMenu contextMenu, View view, ContextMenu.ContextMenuInfo contextMenuInfo) {
        Q().onCreateContextMenu(contextMenu, view, contextMenuInfo);
    }

    @Override // android.content.ComponentCallbacks
    public final void onLowMemory() {
        this.E = true;
    }

    public final String p(int i, Object... objArr) {
        return n().getString(i, objArr);
    }

    public final w25 q() {
        w25 w25Var = this.P;
        if (w25Var != null) {
            return w25Var;
        }
        ygf.f(km4.x("Can't access the Fragment View's LifecycleOwner for ", this, " when getView() is null i.e., before onCreateView() or after onDestroyView()"));
        return null;
    }

    public final void r() {
        this.O = new ky6(this, true);
        this.S = new fpb(new gpb(this, new i5b(14, this)));
        this.R = null;
        ArrayList arrayList = this.Y;
        c15 c15Var = this.Z;
        if (arrayList.contains(c15Var)) {
            return;
        }
        if (this.a >= 0) {
            c15Var.a();
        } else {
            arrayList.add(c15Var);
        }
    }

    public final void s() {
        r();
        this.M = this.e;
        this.e = UUID.randomUUID().toString();
        this.k = false;
        this.l = false;
        this.n = false;
        this.o = false;
        this.p = false;
        this.r = 0;
        this.s = null;
        this.u = new g25();
        this.t = null;
        this.w = 0;
        this.x = 0;
        this.y = null;
        this.z = false;
        this.A = false;
    }

    public final boolean t() {
        return this.t != null && this.k;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(128);
        sb.append(getClass().getSimpleName());
        sb.append("{");
        sb.append(Integer.toHexString(System.identityHashCode(this)));
        sb.append("} (");
        sb.append(this.e);
        if (this.w != 0) {
            sb.append(" id=0x");
            sb.append(Integer.toHexString(this.w));
        }
        if (this.y != null) {
            sb.append(" tag=");
            sb.append(this.y);
        }
        sb.append(")");
        return sb.toString();
    }

    public final boolean u() {
        if (this.z) {
            return true;
        }
        f25 f25Var = this.s;
        if (f25Var != null) {
            j15 j15Var = this.v;
            f25Var.getClass();
            if (j15Var == null ? false : j15Var.u()) {
                return true;
            }
        }
        return false;
    }

    public final boolean v() {
        return this.r > 0;
    }

    public void w() {
        this.E = true;
    }

    public void x(int i, int i2, Intent intent) {
        if (f25.I(2)) {
            Log.v("FragmentManager", "Fragment " + this + " received the following in onActivityResult(): requestCode: " + i + " resultCode: " + i2 + " data: " + intent);
        }
    }

    public void y(Activity activity) {
        this.E = true;
    }

    public void z(Context context) {
        this.E = true;
        l15 l15Var = this.t;
        m15 m15Var = l15Var == null ? null : l15Var.v;
        if (m15Var != null) {
            this.E = false;
            y(m15Var);
        }
    }

    public void J(Bundle bundle) {
    }

    public void M(View view) {
    }
}
