package androidx.fragment.app;

import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Objects;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public abstract class f2 {

    /* renamed from: a, reason: collision with root package name */
    public final ViewGroup f14553a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f14554b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f14555c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f14556d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f14557e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f14558f;

    public f2(ViewGroup container) {
        Intrinsics.g(container, "container");
        this.f14553a = container;
        this.f14554b = new ArrayList();
        this.f14555c = new ArrayList();
    }

    public static final f2 k(ViewGroup container, h1 fragmentManager) {
        Intrinsics.g(container, "container");
        Intrinsics.g(fragmentManager, "fragmentManager");
        lm.e eVarJ = fragmentManager.J();
        Intrinsics.f(eVarJ, "fragmentManager.specialEffectsControllerFactory");
        return i30.j.G(container, eVarJ);
    }

    public static final f2 l(ViewGroup viewGroup, lm.e eVar) {
        return i30.j.G(viewGroup, eVar);
    }

    public static boolean m(ArrayList arrayList) {
        boolean z11;
        Iterator it = arrayList.iterator();
        loop0: while (true) {
            z11 = true;
            while (it.hasNext()) {
                d2 d2Var = (d2) it.next();
                if (!d2Var.f14526k.isEmpty()) {
                    ArrayList arrayList2 = d2Var.f14526k;
                    if (arrayList2 == null || !arrayList2.isEmpty()) {
                        Iterator it2 = arrayList2.iterator();
                        while (it2.hasNext()) {
                            if (!((c2) it2.next()).a()) {
                                break;
                            }
                        }
                    }
                }
                z11 = false;
            }
            break loop0;
        }
        if (z11) {
            ArrayList arrayList3 = new ArrayList();
            Iterator it3 = arrayList.iterator();
            while (it3.hasNext()) {
                b70.d.z0(((d2) it3.next()).f14526k, arrayList3);
            }
            if (!arrayList3.isEmpty()) {
                return true;
            }
        }
        return false;
    }

    public final void a(d2 operation) {
        Intrinsics.g(operation, "operation");
        if (operation.f14524i) {
            int i5 = operation.f14516a;
            View viewRequireView = operation.f14518c.requireView();
            Intrinsics.f(viewRequireView, "operation.fragment.requireView()");
            a80.m.a(i5, viewRequireView, this.f14553a);
            operation.f14524i = false;
        }
    }

    public abstract void b(ArrayList arrayList, boolean z11);

    public final void c(ArrayList operations) {
        Intrinsics.g(operations, "operations");
        ArrayList arrayList = new ArrayList();
        Iterator it = operations.iterator();
        while (it.hasNext()) {
            b70.d.z0(((d2) it.next()).f14526k, arrayList);
        }
        List listI1 = b70.g.I1(b70.g.N1(arrayList));
        int size = listI1.size();
        for (int i5 = 0; i5 < size; i5++) {
            ((c2) listI1.get(i5)).c(this.f14553a);
        }
        int size2 = operations.size();
        for (int i11 = 0; i11 < size2; i11++) {
            a((d2) operations.get(i11));
        }
        List listI12 = b70.g.I1(operations);
        int size3 = listI12.size();
        for (int i12 = 0; i12 < size3; i12++) {
            d2 d2Var = (d2) listI12.get(i12);
            if (d2Var.f14526k.isEmpty()) {
                d2Var.b();
            }
        }
    }

    public final void d() {
        ArrayList arrayList = this.f14555c;
        p(arrayList);
        c(arrayList);
    }

    public final void e(int i5, int i11, n1 n1Var) {
        synchronized (this.f14554b) {
            try {
                h0 h0Var = n1Var.f14632c;
                Intrinsics.f(h0Var, "fragmentStateManager.fragment");
                d2 d2VarG = g(h0Var);
                if (d2VarG == null) {
                    h0 h0Var2 = n1Var.f14632c;
                    d2VarG = h0Var2.mTransitioning ? h(h0Var2) : null;
                }
                if (d2VarG != null) {
                    d2VarG.d(i5, i11);
                    return;
                }
                final d2 d2Var = new d2(i5, i11, n1Var);
                this.f14554b.add(d2Var);
                final int i12 = 0;
                d2Var.f14519d.add(new Runnable(this) { // from class: androidx.fragment.app.b2

                    /* renamed from: b, reason: collision with root package name */
                    public final /* synthetic */ f2 f14497b;

                    {
                        this.f14497b = this;
                    }

                    @Override // java.lang.Runnable
                    public final void run() {
                        switch (i12) {
                            case 0:
                                f2 f2Var = this.f14497b;
                                ArrayList arrayList = f2Var.f14554b;
                                d2 d2Var2 = d2Var;
                                if (arrayList.contains(d2Var2)) {
                                    int i13 = d2Var2.f14516a;
                                    View view = d2Var2.f14518c.mView;
                                    Intrinsics.f(view, "operation.fragment.mView");
                                    a80.m.a(i13, view, f2Var.f14553a);
                                    break;
                                }
                                break;
                            default:
                                f2 f2Var2 = this.f14497b;
                                ArrayList arrayList2 = f2Var2.f14554b;
                                d2 d2Var3 = d2Var;
                                arrayList2.remove(d2Var3);
                                f2Var2.f14555c.remove(d2Var3);
                                break;
                        }
                    }
                });
                final int i13 = 1;
                d2Var.f14519d.add(new Runnable(this) { // from class: androidx.fragment.app.b2

                    /* renamed from: b, reason: collision with root package name */
                    public final /* synthetic */ f2 f14497b;

                    {
                        this.f14497b = this;
                    }

                    @Override // java.lang.Runnable
                    public final void run() {
                        switch (i13) {
                            case 0:
                                f2 f2Var = this.f14497b;
                                ArrayList arrayList = f2Var.f14554b;
                                d2 d2Var2 = d2Var;
                                if (arrayList.contains(d2Var2)) {
                                    int i132 = d2Var2.f14516a;
                                    View view = d2Var2.f14518c.mView;
                                    Intrinsics.f(view, "operation.fragment.mView");
                                    a80.m.a(i132, view, f2Var.f14553a);
                                    break;
                                }
                                break;
                            default:
                                f2 f2Var2 = this.f14497b;
                                ArrayList arrayList2 = f2Var2.f14554b;
                                d2 d2Var3 = d2Var;
                                arrayList2.remove(d2Var3);
                                f2Var2.f14555c.remove(d2Var3);
                                break;
                        }
                    }
                });
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void f() {
        boolean z11;
        if (this.f14558f) {
            return;
        }
        if (!this.f14553a.isAttachedToWindow()) {
            i();
            this.f14557e = false;
            return;
        }
        synchronized (this.f14554b) {
            try {
                ArrayList arrayListK1 = b70.g.K1(this.f14555c);
                this.f14555c.clear();
                Iterator it = arrayListK1.iterator();
                while (true) {
                    z11 = true;
                    if (!it.hasNext()) {
                        break;
                    }
                    d2 d2Var = (d2) it.next();
                    if (this.f14554b.isEmpty() || !d2Var.f14518c.mTransitioning) {
                        z11 = false;
                    }
                    d2Var.f14522g = z11;
                }
                Iterator it2 = arrayListK1.iterator();
                while (it2.hasNext()) {
                    d2 d2Var2 = (d2) it2.next();
                    if (this.f14556d) {
                        if (h1.K(2)) {
                            Objects.toString(d2Var2);
                        }
                        d2Var2.b();
                    } else {
                        if (h1.K(2)) {
                            Objects.toString(d2Var2);
                        }
                        d2Var2.a(this.f14553a);
                    }
                    this.f14556d = false;
                    if (!d2Var2.f14521f) {
                        this.f14555c.add(d2Var2);
                    }
                }
                if (!this.f14554b.isEmpty()) {
                    q();
                    ArrayList arrayListK12 = b70.g.K1(this.f14554b);
                    if (arrayListK12.isEmpty()) {
                        return;
                    }
                    this.f14554b.clear();
                    this.f14555c.addAll(arrayListK12);
                    b(arrayListK12, this.f14557e);
                    boolean zM = m(arrayListK12);
                    Iterator it3 = arrayListK12.iterator();
                    boolean z12 = true;
                    while (it3.hasNext()) {
                        if (!((d2) it3.next()).f14518c.mTransitioning) {
                            z12 = false;
                        }
                    }
                    if (!z12 || zM) {
                        z11 = false;
                    }
                    this.f14556d = z11;
                    if (!z12) {
                        p(arrayListK12);
                        c(arrayListK12);
                    } else if (zM) {
                        p(arrayListK12);
                        int size = arrayListK12.size();
                        for (int i5 = 0; i5 < size; i5++) {
                            a((d2) arrayListK12.get(i5));
                        }
                    }
                    this.f14557e = false;
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final d2 g(h0 h0Var) {
        Object next;
        Iterator it = this.f14554b.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            d2 d2Var = (d2) next;
            if (Intrinsics.b(d2Var.f14518c, h0Var) && !d2Var.f14520e) {
                break;
            }
        }
        return (d2) next;
    }

    public final d2 h(h0 h0Var) {
        Object next;
        Iterator it = this.f14555c.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            d2 d2Var = (d2) next;
            if (Intrinsics.b(d2Var.f14518c, h0Var) && !d2Var.f14520e) {
                break;
            }
        }
        return (d2) next;
    }

    public final void i() {
        boolean zIsAttachedToWindow = this.f14553a.isAttachedToWindow();
        synchronized (this.f14554b) {
            try {
                q();
                p(this.f14554b);
                ArrayList arrayListK1 = b70.g.K1(this.f14555c);
                Iterator it = arrayListK1.iterator();
                while (it.hasNext()) {
                    ((d2) it.next()).f14522g = false;
                }
                Iterator it2 = arrayListK1.iterator();
                while (it2.hasNext()) {
                    d2 d2Var = (d2) it2.next();
                    if (h1.K(2)) {
                        if (!zIsAttachedToWindow) {
                            Objects.toString(this.f14553a);
                        }
                        Objects.toString(d2Var);
                    }
                    d2Var.a(this.f14553a);
                }
                ArrayList arrayListK12 = b70.g.K1(this.f14554b);
                Iterator it3 = arrayListK12.iterator();
                while (it3.hasNext()) {
                    ((d2) it3.next()).f14522g = false;
                }
                Iterator it4 = arrayListK12.iterator();
                while (it4.hasNext()) {
                    d2 d2Var2 = (d2) it4.next();
                    if (h1.K(2)) {
                        if (!zIsAttachedToWindow) {
                            Objects.toString(this.f14553a);
                        }
                        Objects.toString(d2Var2);
                    }
                    d2Var2.a(this.f14553a);
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void j() {
        if (this.f14558f) {
            this.f14558f = false;
            f();
        }
    }

    public final void n() {
        Object objPrevious;
        synchronized (this.f14554b) {
            try {
                q();
                ArrayList arrayList = this.f14554b;
                ListIterator listIterator = arrayList.listIterator(arrayList.size());
                while (true) {
                    if (!listIterator.hasPrevious()) {
                        objPrevious = null;
                        break;
                    }
                    objPrevious = listIterator.previous();
                    d2 d2Var = (d2) objPrevious;
                    View view = d2Var.f14518c.mView;
                    Intrinsics.f(view, "operation.fragment.mView");
                    char c11 = 4;
                    if (view.getAlpha() != 0.0f || view.getVisibility() != 0) {
                        int visibility = view.getVisibility();
                        if (visibility == 0) {
                            c11 = 2;
                        } else if (visibility != 4) {
                            if (visibility != 8) {
                                throw new IllegalArgumentException("Unknown visibility " + visibility);
                            }
                            c11 = 3;
                        }
                    }
                    if (d2Var.f14516a == 2 && c11 != 2) {
                        break;
                    }
                }
                d2 d2Var2 = (d2) objPrevious;
                h0 h0Var = d2Var2 != null ? d2Var2.f14518c : null;
                this.f14558f = h0Var != null ? h0Var.isPostponed() : false;
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void o(g.b backEvent) {
        Intrinsics.g(backEvent, "backEvent");
        ArrayList arrayList = new ArrayList();
        Iterator it = this.f14555c.iterator();
        while (it.hasNext()) {
            b70.d.z0(((d2) it.next()).f14526k, arrayList);
        }
        List listI1 = b70.g.I1(b70.g.N1(arrayList));
        int size = listI1.size();
        for (int i5 = 0; i5 < size; i5++) {
            ((c2) listI1.get(i5)).d(backEvent, this.f14553a);
        }
    }

    public final void p(ArrayList arrayList) {
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            d2 d2Var = (d2) arrayList.get(i5);
            n1 n1Var = d2Var.f14527l;
            if (!d2Var.f14523h) {
                d2Var.f14523h = true;
                int i11 = d2Var.f14517b;
                if (i11 == 2) {
                    h0 h0Var = n1Var.f14632c;
                    Intrinsics.f(h0Var, "fragmentStateManager.fragment");
                    View viewFindFocus = h0Var.mView.findFocus();
                    if (viewFindFocus != null) {
                        h0Var.setFocusedView(viewFindFocus);
                        if (h1.K(2)) {
                            viewFindFocus.toString();
                            h0Var.toString();
                        }
                    }
                    View viewRequireView = d2Var.f14518c.requireView();
                    Intrinsics.f(viewRequireView, "this.fragment.requireView()");
                    if (viewRequireView.getParent() == null) {
                        n1Var.a();
                        viewRequireView.setAlpha(0.0f);
                    }
                    if (viewRequireView.getAlpha() == 0.0f && viewRequireView.getVisibility() == 0) {
                        viewRequireView.setVisibility(4);
                    }
                    viewRequireView.setAlpha(h0Var.getPostOnViewCreatedAlpha());
                } else if (i11 == 3) {
                    h0 h0Var2 = n1Var.f14632c;
                    Intrinsics.f(h0Var2, "fragmentStateManager.fragment");
                    View viewRequireView2 = h0Var2.requireView();
                    Intrinsics.f(viewRequireView2, "fragment.requireView()");
                    if (h1.K(2)) {
                        Objects.toString(viewRequireView2.findFocus());
                        viewRequireView2.toString();
                        h0Var2.toString();
                    }
                    viewRequireView2.clearFocus();
                }
            }
        }
        ArrayList arrayList2 = new ArrayList();
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            b70.d.z0(((d2) it.next()).f14526k, arrayList2);
        }
        List listI1 = b70.g.I1(b70.g.N1(arrayList2));
        int size2 = listI1.size();
        for (int i12 = 0; i12 < size2; i12++) {
            c2 c2Var = (c2) listI1.get(i12);
            c2Var.getClass();
            ViewGroup container = this.f14553a;
            Intrinsics.g(container, "container");
            if (!c2Var.f14505a) {
                c2Var.e(container);
            }
            c2Var.f14505a = true;
        }
    }

    public final void q() {
        Iterator it = this.f14554b.iterator();
        while (it.hasNext()) {
            d2 d2Var = (d2) it.next();
            int i5 = 2;
            if (d2Var.f14517b == 2) {
                View viewRequireView = d2Var.f14518c.requireView();
                Intrinsics.f(viewRequireView, "fragment.requireView()");
                int visibility = viewRequireView.getVisibility();
                if (visibility != 0) {
                    i5 = 4;
                    if (visibility != 4) {
                        if (visibility != 8) {
                            throw new IllegalArgumentException(b.c0.h(visibility, "Unknown visibility "));
                        }
                        i5 = 3;
                    }
                }
                d2Var.d(i5, 1);
            }
        }
    }

    public final void r(boolean z11) {
        this.f14557e = z11;
    }
}
