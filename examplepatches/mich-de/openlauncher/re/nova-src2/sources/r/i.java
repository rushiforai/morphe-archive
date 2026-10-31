package r;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.util.SparseBooleanArray;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import androidx.appcompat.view.menu.ActionMenuItemView;
import androidx.appcompat.widget.ActionMenuView;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public final class i implements q.w {

    /* renamed from: a, reason: collision with root package name */
    public final Context f84725a;

    /* renamed from: b, reason: collision with root package name */
    public Context f84726b;

    /* renamed from: c, reason: collision with root package name */
    public q.k f84727c;

    /* renamed from: d, reason: collision with root package name */
    public final LayoutInflater f84728d;

    /* renamed from: e, reason: collision with root package name */
    public q.v f84729e;

    /* renamed from: h, reason: collision with root package name */
    public q.y f84732h;

    /* renamed from: i, reason: collision with root package name */
    public h f84733i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f84734j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f84735k;

    /* renamed from: l, reason: collision with root package name */
    public int f84736l;

    /* renamed from: m, reason: collision with root package name */
    public int f84737m;
    public int n;
    public boolean o;

    /* renamed from: q, reason: collision with root package name */
    public e f84739q;

    /* renamed from: r, reason: collision with root package name */
    public e f84740r;

    /* renamed from: s, reason: collision with root package name */
    public g f84741s;

    /* renamed from: t, reason: collision with root package name */
    public f f84742t;

    /* renamed from: f, reason: collision with root package name */
    public final int f84730f = 2131623939;

    /* renamed from: g, reason: collision with root package name */
    public final int f84731g = 2131623938;

    /* renamed from: p, reason: collision with root package name */
    public final SparseBooleanArray f84738p = new SparseBooleanArray();

    /* renamed from: u, reason: collision with root package name */
    public final f f84743u = new f(this);

    public i(Context context) {
        this.f84725a = context;
        this.f84728d = LayoutInflater.from(context);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // q.w
    public final boolean a(q.c0 c0Var) {
        boolean z11;
        if (c0Var.hasVisibleItems()) {
            q.c0 c0Var2 = c0Var;
            while (true) {
                q.k kVar = c0Var2.f83190z;
                if (kVar == this.f84727c) {
                    break;
                }
                c0Var2 = (q.c0) kVar;
            }
            q.m mVar = c0Var2.A;
            ViewGroup viewGroup = (ViewGroup) this.f84732h;
            View view = null;
            if (viewGroup != null) {
                int childCount = viewGroup.getChildCount();
                int i5 = 0;
                while (true) {
                    if (i5 >= childCount) {
                        break;
                    }
                    View childAt = viewGroup.getChildAt(i5);
                    if ((childAt instanceof q.x) && ((q.x) childAt).c() == mVar) {
                        view = childAt;
                        break;
                    }
                    i5++;
                }
            }
            if (view != null) {
                c0Var.A.getClass();
                int size = c0Var.f83237f.size();
                int i11 = 0;
                while (true) {
                    if (i11 >= size) {
                        z11 = false;
                        break;
                    }
                    MenuItem item = c0Var.getItem(i11);
                    if (item.isVisible() && item.getIcon() != null) {
                        z11 = true;
                        break;
                    }
                    i11++;
                }
                e eVar = new e(this, this.f84726b, c0Var, view);
                this.f84740r = eVar;
                eVar.f83300g = z11;
                q.s sVar = eVar.f83302i;
                if (sVar != null) {
                    sVar.m(z11);
                }
                e eVar2 = this.f84740r;
                if (!eVar2.b()) {
                    if (eVar2.f83298e == null) {
                        throw new IllegalStateException("MenuPopupHelper cannot be used without an anchor");
                    }
                    eVar2.d(0, 0, false, false);
                }
                q.v vVar = this.f84729e;
                if (vVar != null) {
                    vVar.m(c0Var);
                }
                return true;
            }
        }
        return false;
    }

    @Override // q.w
    public final void b(q.k kVar, boolean z11) {
        j();
        e eVar = this.f84740r;
        if (eVar != null && eVar.b()) {
            eVar.f83302i.dismiss();
        }
        q.v vVar = this.f84729e;
        if (vVar != null) {
            vVar.b(kVar, z11);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // q.w
    public final void c() {
        int i5;
        ViewGroup viewGroup = (ViewGroup) this.f84732h;
        ArrayList arrayList = null;
        boolean z11 = false;
        if (viewGroup != null) {
            q.k kVar = this.f84727c;
            if (kVar != null) {
                kVar.i();
                ArrayList arrayListL = this.f84727c.l();
                int size = arrayListL.size();
                i5 = 0;
                for (int i11 = 0; i11 < size; i11++) {
                    q.m mVar = (q.m) arrayListL.get(i11);
                    if ((mVar.f83278x & 32) == 32) {
                        View childAt = viewGroup.getChildAt(i5);
                        q.m mVarC = childAt instanceof q.x ? ((q.x) childAt).c() : null;
                        View viewI = i(mVar, childAt, viewGroup);
                        if (mVar != mVarC) {
                            viewI.setPressed(false);
                            viewI.jumpDrawablesToCurrentState();
                        }
                        if (viewI != childAt) {
                            ViewGroup viewGroup2 = (ViewGroup) viewI.getParent();
                            if (viewGroup2 != null) {
                                viewGroup2.removeView(viewI);
                            }
                            ((ViewGroup) this.f84732h).addView(viewI, i5);
                        }
                        i5++;
                    }
                }
            } else {
                i5 = 0;
            }
            while (i5 < viewGroup.getChildCount()) {
                if (viewGroup.getChildAt(i5) == this.f84733i) {
                    i5++;
                } else {
                    viewGroup.removeViewAt(i5);
                }
            }
        }
        ((View) this.f84732h).requestLayout();
        q.k kVar2 = this.f84727c;
        if (kVar2 != null) {
            kVar2.i();
            ArrayList arrayList2 = kVar2.f83240i;
            int size2 = arrayList2.size();
            for (int i12 = 0; i12 < size2; i12++) {
                q.n nVar = ((q.m) arrayList2.get(i12)).A;
            }
        }
        q.k kVar3 = this.f84727c;
        if (kVar3 != null) {
            kVar3.i();
            arrayList = kVar3.f83241j;
        }
        if (this.f84734j && arrayList != null) {
            int size3 = arrayList.size();
            if (size3 == 1) {
                z11 = !((q.m) arrayList.get(0)).C;
            } else if (size3 > 0) {
                z11 = true;
            }
        }
        if (z11) {
            if (this.f84733i == null) {
                this.f84733i = new h(this, this.f84725a);
            }
            ViewGroup viewGroup3 = (ViewGroup) this.f84733i.getParent();
            if (viewGroup3 != this.f84732h) {
                if (viewGroup3 != null) {
                    viewGroup3.removeView(this.f84733i);
                }
                ActionMenuView actionMenuView = (ActionMenuView) this.f84732h;
                h hVar = this.f84733i;
                actionMenuView.getClass();
                k kVarK = ActionMenuView.k();
                kVarK.f84763a = true;
                actionMenuView.addView(hVar, kVarK);
            }
        } else {
            h hVar2 = this.f84733i;
            if (hVar2 != null) {
                Object parent = hVar2.getParent();
                Object obj = this.f84732h;
                if (parent == obj) {
                    ((ViewGroup) obj).removeView(this.f84733i);
                }
            }
        }
        ((ActionMenuView) this.f84732h).f13745s = this.f84734j;
    }

    @Override // q.w
    public final boolean d(q.m mVar) {
        return false;
    }

    @Override // q.w
    public final void e(Context context, q.k kVar) {
        this.f84726b = context;
        LayoutInflater.from(context);
        this.f84727c = kVar;
        Resources resources = context.getResources();
        if (!this.f84735k) {
            this.f84734j = true;
        }
        int i5 = 2;
        this.f84736l = context.getResources().getDisplayMetrics().widthPixels / 2;
        Configuration configuration = context.getResources().getConfiguration();
        int i11 = configuration.screenWidthDp;
        int i12 = configuration.screenHeightDp;
        if (configuration.smallestScreenWidthDp > 600 || i11 > 600 || ((i11 > 960 && i12 > 720) || (i11 > 720 && i12 > 960))) {
            i5 = 5;
        } else if (i11 >= 500 || ((i11 > 640 && i12 > 480) || (i11 > 480 && i12 > 640))) {
            i5 = 4;
        } else if (i11 >= 360) {
            i5 = 3;
        }
        this.n = i5;
        int measuredWidth = this.f84736l;
        if (this.f84734j) {
            if (this.f84733i == null) {
                this.f84733i = new h(this, this.f84725a);
                int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
                this.f84733i.measure(iMakeMeasureSpec, iMakeMeasureSpec);
            }
            measuredWidth -= this.f84733i.getMeasuredWidth();
        } else {
            this.f84733i = null;
        }
        this.f84737m = measuredWidth;
        float f11 = resources.getDisplayMetrics().density;
    }

    @Override // q.w
    public final boolean f(q.m mVar) {
        return false;
    }

    @Override // q.w
    public final boolean g() {
        int size;
        ArrayList arrayListL;
        int i5;
        boolean z11;
        i iVar = this;
        q.k kVar = iVar.f84727c;
        if (kVar != null) {
            arrayListL = kVar.l();
            size = arrayListL.size();
        } else {
            size = 0;
            arrayListL = null;
        }
        int i11 = iVar.n;
        int i12 = iVar.f84737m;
        int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
        ViewGroup viewGroup = (ViewGroup) iVar.f84732h;
        int i13 = 0;
        boolean z12 = false;
        int i14 = 0;
        int i15 = 0;
        while (true) {
            i5 = 2;
            z11 = true;
            if (i13 >= size) {
                break;
            }
            q.m mVar = (q.m) arrayListL.get(i13);
            int i16 = mVar.f83279y;
            if ((i16 & 2) == 2) {
                i14++;
            } else if ((i16 & 1) == 1) {
                i15++;
            } else {
                z12 = true;
            }
            if (iVar.o && mVar.C) {
                i11 = 0;
            }
            i13++;
        }
        if (iVar.f84734j && (z12 || i15 + i14 > i11)) {
            i11--;
        }
        int i17 = i11 - i14;
        SparseBooleanArray sparseBooleanArray = iVar.f84738p;
        sparseBooleanArray.clear();
        int i18 = 0;
        int i19 = 0;
        while (i18 < size) {
            q.m mVar2 = (q.m) arrayListL.get(i18);
            int i21 = mVar2.f83279y;
            boolean z13 = (i21 & 2) == i5 ? z11 : false;
            int i22 = mVar2.f83258b;
            if (z13) {
                View viewI = iVar.i(mVar2, null, viewGroup);
                viewI.measure(iMakeMeasureSpec, iMakeMeasureSpec);
                int measuredWidth = viewI.getMeasuredWidth();
                i12 -= measuredWidth;
                if (i19 == 0) {
                    i19 = measuredWidth;
                }
                if (i22 != 0) {
                    sparseBooleanArray.put(i22, z11);
                }
                mVar2.f(z11);
            } else if ((i21 & 1) == z11) {
                boolean z14 = sparseBooleanArray.get(i22);
                boolean z15 = ((i17 > 0 || z14) && i12 > 0) ? z11 : false;
                if (z15) {
                    View viewI2 = iVar.i(mVar2, null, viewGroup);
                    viewI2.measure(iMakeMeasureSpec, iMakeMeasureSpec);
                    int measuredWidth2 = viewI2.getMeasuredWidth();
                    i12 -= measuredWidth2;
                    if (i19 == 0) {
                        i19 = measuredWidth2;
                    }
                    z15 &= i12 + i19 > 0;
                }
                if (z15 && i22 != 0) {
                    sparseBooleanArray.put(i22, true);
                } else if (z14) {
                    sparseBooleanArray.put(i22, false);
                    for (int i23 = 0; i23 < i18; i23++) {
                        q.m mVar3 = (q.m) arrayListL.get(i23);
                        if (mVar3.f83258b == i22) {
                            if ((mVar3.f83278x & 32) == 32) {
                                i17++;
                            }
                            mVar3.f(false);
                        }
                    }
                }
                if (z15) {
                    i17--;
                }
                mVar2.f(z15);
            } else {
                mVar2.f(false);
                i18++;
                i5 = 2;
                iVar = this;
                z11 = true;
            }
            i18++;
            i5 = 2;
            iVar = this;
            z11 = true;
        }
        return z11;
    }

    @Override // q.w
    public final void h(q.v vVar) {
        throw null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r5v0, types: [android.view.View] */
    /* JADX WARN: Type inference failed for: r5v4, types: [q.x] */
    /* JADX WARN: Type inference failed for: r5v7 */
    /* JADX WARN: Type inference failed for: r5v8 */
    public final View i(q.m mVar, View view, ViewGroup viewGroup) {
        View actionView = mVar.getActionView();
        if (actionView == null || mVar.e()) {
            ActionMenuItemView actionMenuItemView = view instanceof q.x ? (q.x) view : (q.x) this.f84728d.inflate(this.f84731g, viewGroup, false);
            actionMenuItemView.d(mVar);
            ActionMenuItemView actionMenuItemView2 = actionMenuItemView;
            actionMenuItemView2.f13667d = (ActionMenuView) this.f84732h;
            if (this.f84742t == null) {
                this.f84742t = new f(this);
            }
            actionMenuItemView2.f13669f = this.f84742t;
            actionView = actionMenuItemView;
        }
        actionView.setVisibility(mVar.C ? 8 : 0);
        ViewGroup.LayoutParams layoutParams = actionView.getLayoutParams();
        ((ActionMenuView) viewGroup).getClass();
        if (!(layoutParams instanceof k)) {
            actionView.setLayoutParams(ActionMenuView.l(layoutParams));
        }
        return actionView;
    }

    public final boolean j() {
        Object obj;
        g gVar = this.f84741s;
        if (gVar != null && (obj = this.f84732h) != null) {
            ((View) obj).removeCallbacks(gVar);
            this.f84741s = null;
            return true;
        }
        e eVar = this.f84739q;
        if (eVar == null) {
            return false;
        }
        if (eVar.b()) {
            eVar.f83302i.dismiss();
        }
        return true;
    }

    public final boolean k() {
        e eVar = this.f84739q;
        return eVar != null && eVar.b();
    }

    public final boolean l() {
        q.k kVar;
        if (!this.f84734j || k() || (kVar = this.f84727c) == null || this.f84732h == null || this.f84741s != null) {
            return false;
        }
        kVar.i();
        if (kVar.f83241j.isEmpty()) {
            return false;
        }
        g gVar = new g(this, new e(this, this.f84726b, this.f84727c, this.f84733i));
        this.f84741s = gVar;
        ((View) this.f84732h).post(gVar);
        return true;
    }
}
