package defpackage;

import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.ListIterator;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@rc8("fragment")
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0017\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Lk25;", "Lsc8;", "Ll25;", "a", "navigation-fragment_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
public class k25 extends sc8 {
    public final Context c;
    public final f25 d;
    public final int e;
    public final LinkedHashSet f = new LinkedHashSet();
    public final ArrayList g = new ArrayList();
    public final di4 h = new di4(1, this);
    public final ff4 i = new ff4(10, this);

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static final class a extends que {
        public WeakReference b;

        @Override // defpackage.que
        public final void d() {
            WeakReference weakReference = this.b;
            if (weakReference == null) {
                g76.g0("completeTransition");
                throw null;
            }
            m45 m45Var = (m45) weakReference.get();
            if (m45Var != null) {
                m45Var.invoke();
            }
        }
    }

    public k25(Context context, f25 f25Var, int i) {
        this.c = context;
        this.d = f25Var;
        this.e = i;
    }

    public static void k(k25 k25Var, String str, int i) {
        boolean z = (i & 2) == 0;
        boolean z2 = (i & 4) != 0;
        ArrayList arrayList = k25Var.g;
        if (z2) {
            bu1.S0(arrayList, new mb(str, 25));
        }
        arrayList.add(new f09(str, Boolean.valueOf(z)));
    }

    public static boolean n() {
        return Log.isLoggable("FragmentManager", 2) || Log.isLoggable("FragmentNavigator", 2);
    }

    @Override // defpackage.sc8
    public final va8 a() {
        return new l25(this);
    }

    @Override // defpackage.sc8
    public final void d(List list, ob8 ob8Var, w6 w6Var) {
        f25 f25Var = this.d;
        if (f25Var.N()) {
            Log.i("FragmentNavigator", "Ignoring navigate() call: FragmentManager has already saved its state");
            return;
        }
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            ba8 ba8Var = (ba8) it2.next();
            boolean zIsEmpty = ((List) b().e.a.getValue()).isEmpty();
            int i = 0;
            if (ob8Var == null || zIsEmpty || !ob8Var.b || !this.f.remove(ba8Var.f)) {
                km0 km0VarM = m(ba8Var, ob8Var);
                String str = ba8Var.f;
                if (!zIsEmpty) {
                    ba8 ba8Var2 = (ba8) bu1.I0((List) b().e.a.getValue());
                    if (ba8Var2 != null) {
                        k(this, ba8Var2.f, 6);
                    }
                    k(this, str, 6);
                    if (!km0VarM.h) {
                        ygf.f("This FragmentTransaction is not allowed to be added to the back stack.");
                        return;
                    } else {
                        km0VarM.g = true;
                        km0VarM.i = str;
                    }
                }
                km0VarM.d(false);
                if (n()) {
                    Log.v("FragmentNavigator", "Calling pushWithTransition via navigate() on entry " + ba8Var);
                }
                b().i(ba8Var);
            } else {
                f25Var.w(new e25(f25Var, ba8Var.f, i), false);
                b().i(ba8Var);
            }
        }
    }

    @Override // defpackage.sc8
    public final void e(final ga8 ga8Var) {
        this.a = ga8Var;
        this.b = true;
        if (n()) {
            Log.v("FragmentNavigator", "onAttach");
        }
        o25 o25Var = new o25() { // from class: j25
            @Override // defpackage.o25
            public final void a(f25 f25Var, j15 j15Var) {
                Object objPrevious;
                f25Var.getClass();
                ga8 ga8Var2 = ga8Var;
                List list = (List) ga8Var2.e.a.getValue();
                ListIterator listIterator = list.listIterator(list.size());
                while (true) {
                    if (!listIterator.hasPrevious()) {
                        objPrevious = null;
                        break;
                    } else {
                        objPrevious = listIterator.previous();
                        if (((ba8) objPrevious).f.equals(j15Var.y)) {
                            break;
                        }
                    }
                }
                ba8 ba8Var = (ba8) objPrevious;
                boolean zN = k25.n();
                k25 k25Var = this;
                if (zN) {
                    Log.v("FragmentNavigator", "Attaching fragment " + j15Var + " associated with entry " + ba8Var + " to FragmentManager " + k25Var.d);
                }
                if (ba8Var != null) {
                    j15Var.Q.d(j15Var, new n25(new o8(k25Var, j15Var, ba8Var, 22)));
                    j15Var.O.a(k25Var.h);
                    k25Var.l(j15Var, ba8Var, ga8Var2);
                }
            }
        };
        f25 f25Var = this.d;
        f25Var.o.add(o25Var);
        m25 m25Var = new m25(ga8Var, this);
        ArrayList arrayList = f25Var.m;
        if (arrayList == null) {
            arrayList = new ArrayList();
            f25Var.m = arrayList;
        }
        arrayList.add(m25Var);
    }

    @Override // defpackage.sc8
    public final void f(ba8 ba8Var) {
        String str = ba8Var.f;
        f25 f25Var = this.d;
        if (f25Var.N()) {
            Log.i("FragmentNavigator", "Ignoring onLaunchSingleTop() call: FragmentManager has already saved its state");
            return;
        }
        km0 km0VarM = m(ba8Var, null);
        List list = (List) b().e.a.getValue();
        if (list.size() > 1) {
            ba8 ba8Var2 = (ba8) bu1.A0(list.size() - 2, list);
            if (ba8Var2 != null) {
                k(this, ba8Var2.f, 6);
            }
            k(this, str, 4);
            f25Var.w(new d25(f25Var, str, -1, 1), false);
            k(this, str, 2);
            if (!km0VarM.h) {
                ygf.f("This FragmentTransaction is not allowed to be added to the back stack.");
                return;
            } else {
                km0VarM.g = true;
                km0VarM.i = str;
            }
        }
        km0VarM.d(false);
        b().d(ba8Var);
    }

    @Override // defpackage.sc8
    public final void g(Bundle bundle) {
        ArrayList<String> stringArrayList = bundle.getStringArrayList("androidx-nav-fragment:navigator:savedIds");
        if (stringArrayList != null) {
            LinkedHashSet linkedHashSet = this.f;
            linkedHashSet.clear();
            bu1.n0(stringArrayList, linkedHashSet);
        }
    }

    @Override // defpackage.sc8
    public final Bundle h() {
        LinkedHashSet linkedHashSet = this.f;
        if (linkedHashSet.isEmpty()) {
            return null;
        }
        return xz5.E(new f09("androidx-nav-fragment:navigator:savedIds", new ArrayList(linkedHashSet)));
    }

    @Override // defpackage.sc8
    public final void i(ba8 ba8Var, boolean z) {
        int i;
        f25 f25Var = this.d;
        if (f25Var.N()) {
            Log.i("FragmentNavigator", "Ignoring popBackStack() call: FragmentManager has already saved its state");
            return;
        }
        List list = (List) b().e.a.getValue();
        int iIndexOf = list.indexOf(ba8Var);
        List listSubList = list.subList(iIndexOf, list.size());
        ba8 ba8Var2 = (ba8) bu1.x0(list);
        int i2 = 1;
        ba8 ba8Var3 = (ba8) bu1.A0(iIndexOf - 1, list);
        if (ba8Var3 != null) {
            k(this, ba8Var3.f, 6);
        }
        ArrayList arrayList = new ArrayList();
        Iterator it2 = listSubList.iterator();
        while (true) {
            int i3 = 0;
            if (!it2.hasNext()) {
                Iterator it3 = arrayList.iterator();
                while (it3.hasNext()) {
                    k(this, ((ba8) it3.next()).f, 4);
                }
                if (z) {
                    for (ba8 ba8Var4 : bu1.Y0(listSubList)) {
                        if (g76.L(ba8Var4, ba8Var2)) {
                            Log.i("FragmentNavigator", "FragmentManager cannot save the state of the initial destination " + ba8Var4);
                        } else {
                            f25Var.w(new e25(f25Var, ba8Var4.f, i2), false);
                            this.f.add(ba8Var4.f);
                        }
                    }
                } else {
                    f25Var.w(new d25(f25Var, ba8Var.f, -1, 1), false);
                }
                if (n()) {
                    Log.v("FragmentNavigator", "Calling popWithTransition via popBackStack() on entry " + ba8Var + " with savedState " + z);
                }
                b().f(ba8Var, z);
                return;
            }
            Object next = it2.next();
            ba8 ba8Var5 = (ba8) next;
            String str = ba8Var5.f;
            Iterator it4 = this.g.iterator();
            while (true) {
                if (!it4.hasNext()) {
                    i = -1;
                    break;
                }
                f09 f09Var = (f09) it4.next();
                f09Var.getClass();
                String str2 = (String) f09Var.a;
                if (i3 < 0) {
                    d46.i0();
                    throw null;
                }
                if (str.equals(str2)) {
                    i = i3;
                    break;
                }
                i3++;
            }
            if (i >= 0 || !ba8Var5.f.equals(ba8Var2.f)) {
                arrayList.add(next);
            }
        }
    }

    public final void l(j15 j15Var, ba8 ba8Var, ga8 ga8Var) {
        vue viewModelStore = j15Var.getViewModelStore();
        w16 w16Var = new w16();
        cq4 cq4Var = new cq4(19);
        s1b s1bVar = n1b.a;
        w16Var.a(s1bVar.b(a.class), cq4Var);
        w7 w7VarB = w16Var.b();
        og2 og2Var = og2.b;
        og2Var.getClass();
        o2b o2bVar = new o2b(viewModelStore, w7VarB, og2Var);
        wg6 wg6VarB = s1bVar.b(a.class);
        String strD = wg6VarB.d();
        if (strD == null) {
            ay0.e("Local and anonymous classes can not be ViewModels");
        } else {
            ((a) o2bVar.o(wg6VarB, "androidx.lifecycle.ViewModelProvider.DefaultKey:".concat(strD))).b = new WeakReference(new gd3(ba8Var, ga8Var, this, j15Var));
        }
    }

    public final km0 m(ba8 ba8Var, ob8 ob8Var) {
        va8 va8Var = ba8Var.b;
        va8Var.getClass();
        Bundle bundleA = ba8Var.h.a();
        String str = ((l25) va8Var).g;
        if (str == null) {
            ygf.f("Fragment class was not set");
            return null;
        }
        char cCharAt = str.charAt(0);
        Context context = this.c;
        if (cCharAt == '.') {
            str = context.getPackageName() + str;
        }
        f25 f25Var = this.d;
        w15 w15VarF = f25Var.F();
        context.getClassLoader();
        j15 j15VarA = w15VarF.a(str);
        j15VarA.getClass();
        j15VarA.V(bundleA);
        km0 km0Var = new km0(f25Var);
        int i = ob8Var != null ? ob8Var.f : -1;
        int i2 = ob8Var != null ? ob8Var.g : -1;
        int i3 = ob8Var != null ? ob8Var.h : -1;
        int i4 = ob8Var != null ? ob8Var.i : -1;
        if (i != -1 || i2 != -1 || i3 != -1 || i4 != -1) {
            if (i == -1) {
                i = 0;
            }
            if (i2 == -1) {
                i2 = 0;
            }
            if (i3 == -1) {
                i3 = 0;
            }
            int i5 = i4 != -1 ? i4 : 0;
            km0Var.b = i;
            km0Var.c = i2;
            km0Var.d = i3;
            km0Var.e = i5;
        }
        String str2 = ba8Var.f;
        int i6 = this.e;
        if (i6 == 0) {
            ay0.e("Must use non-zero containerViewId");
            return null;
        }
        km0Var.e(i6, j15VarA, str2, 2);
        km0Var.g(j15VarA);
        km0Var.p = true;
        return km0Var;
    }
}
