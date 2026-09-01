package defpackage;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.util.SparseBooleanArray;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import androidx.appcompat.view.menu.ActionMenuItemView;
import androidx.appcompat.widget.ActionMenuView;
import com.medium.reader.R;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h6 implements ky7 {
    public final Context a;
    public Context b;
    public lx7 c;
    public final LayoutInflater d;
    public jy7 e;
    public oy7 h;
    public g6 i;
    public Drawable j;
    public boolean k;
    public boolean l;
    public boolean m;
    public int n;
    public int o;
    public int p;
    public boolean q;
    public e6 s;
    public e6 t;
    public p0g u;
    public f6 v;
    public final int f = R.layout.abc_action_menu_layout;
    public final int g = R.layout.abc_action_menu_item_layout;
    public final SparseBooleanArray r = new SparseBooleanArray();
    public final md5 w = new md5(3, this);

    public h6(Context context) {
        this.a = context;
        this.d = LayoutInflater.from(context);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final View a(sx7 sx7Var, View view, ViewGroup viewGroup) {
        View actionView = sx7Var.getActionView();
        if (actionView == null || sx7Var.e()) {
            ny7 ny7Var = view instanceof ny7 ? (ny7) view : (ny7) this.d.inflate(this.g, viewGroup, false);
            ny7Var.a(sx7Var);
            ActionMenuItemView actionMenuItemView = (ActionMenuItemView) ny7Var;
            actionMenuItemView.setItemInvoker((ActionMenuView) this.h);
            f6 f6Var = this.v;
            if (f6Var == null) {
                f6Var = new f6(this);
                this.v = f6Var;
            }
            actionMenuItemView.setPopupCallback(f6Var);
            actionView = (View) ny7Var;
        }
        actionView.setVisibility(sx7Var.C ? 8 : 0);
        ViewGroup.LayoutParams layoutParams = actionView.getLayoutParams();
        ((ActionMenuView) viewGroup).getClass();
        if (!(layoutParams instanceof j6)) {
            actionView.setLayoutParams(ActionMenuView.j(layoutParams));
        }
        return actionView;
    }

    @Override // defpackage.ky7
    public final void b(lx7 lx7Var, boolean z) {
        e();
        e6 e6Var = this.t;
        if (e6Var != null && e6Var.b()) {
            e6Var.i.dismiss();
        }
        jy7 jy7Var = this.e;
        if (jy7Var != null) {
            jy7Var.b(lx7Var, z);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.ky7
    public final boolean c(dvc dvcVar) {
        boolean z;
        if (dvcVar.hasVisibleItems()) {
            dvc dvcVar2 = dvcVar;
            while (true) {
                lx7 lx7Var = dvcVar2.z;
                if (lx7Var == this.c) {
                    break;
                }
                dvcVar2 = (dvc) lx7Var;
            }
            sx7 sx7Var = dvcVar2.A;
            ViewGroup viewGroup = (ViewGroup) this.h;
            View view = null;
            view = null;
            if (viewGroup != null) {
                int childCount = viewGroup.getChildCount();
                int i = 0;
                while (true) {
                    if (i >= childCount) {
                        break;
                    }
                    View childAt = viewGroup.getChildAt(i);
                    if ((childAt instanceof ny7) && ((ny7) childAt).getItemData() == sx7Var) {
                        view = childAt;
                        break;
                    }
                    i++;
                }
            }
            if (view != null) {
                int size = dvcVar.f.size();
                int i2 = 0;
                while (true) {
                    if (i2 >= size) {
                        z = false;
                        break;
                    }
                    MenuItem item = dvcVar.getItem(i2);
                    if (item.isVisible() && item.getIcon() != null) {
                        z = true;
                        break;
                    }
                    i2++;
                }
                e6 e6Var = new e6(this, this.b, dvcVar, view);
                this.t = e6Var;
                e6Var.g = z;
                ay7 ay7Var = e6Var.i;
                if (ay7Var != null) {
                    ay7Var.o(z);
                }
                e6 e6Var2 = this.t;
                if (!e6Var2.b()) {
                    if (e6Var2.e == null) {
                        ygf.f("MenuPopupHelper cannot be used without an anchor");
                        return false;
                    }
                    e6Var2.d(0, 0, false, false);
                }
                jy7 jy7Var = this.e;
                if (jy7Var != null) {
                    jy7Var.q(dvcVar);
                }
                return true;
            }
        }
        return false;
    }

    @Override // defpackage.ky7
    public final boolean d() {
        int size;
        ArrayList arrayListL;
        int i;
        boolean z;
        h6 h6Var = this;
        lx7 lx7Var = h6Var.c;
        if (lx7Var != null) {
            arrayListL = lx7Var.l();
            size = arrayListL.size();
        } else {
            size = 0;
            arrayListL = null;
        }
        int i2 = h6Var.p;
        int i3 = h6Var.o;
        int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
        ViewGroup viewGroup = (ViewGroup) h6Var.h;
        int i4 = 0;
        boolean z2 = false;
        int i5 = 0;
        int i6 = 0;
        while (true) {
            i = 2;
            z = true;
            if (i4 >= size) {
                break;
            }
            sx7 sx7Var = (sx7) arrayListL.get(i4);
            int i7 = sx7Var.y;
            if ((i7 & 2) == 2) {
                i5++;
            } else if ((i7 & 1) == 1) {
                i6++;
            } else {
                z2 = true;
            }
            if (h6Var.q && sx7Var.C) {
                i2 = 0;
            }
            i4++;
        }
        if (h6Var.l && (z2 || i6 + i5 > i2)) {
            i2--;
        }
        int i8 = i2 - i5;
        SparseBooleanArray sparseBooleanArray = h6Var.r;
        sparseBooleanArray.clear();
        int i9 = 0;
        int i10 = 0;
        while (i9 < size) {
            sx7 sx7Var2 = (sx7) arrayListL.get(i9);
            int i11 = sx7Var2.y;
            boolean z3 = (i11 & 2) == i ? z : false;
            int i12 = sx7Var2.b;
            if (z3) {
                View viewA = h6Var.a(sx7Var2, null, viewGroup);
                viewA.measure(iMakeMeasureSpec, iMakeMeasureSpec);
                int measuredWidth = viewA.getMeasuredWidth();
                i3 -= measuredWidth;
                if (i10 == 0) {
                    i10 = measuredWidth;
                }
                if (i12 != 0) {
                    sparseBooleanArray.put(i12, z);
                }
                sx7Var2.f(z);
            } else if ((i11 & 1) == z) {
                boolean z4 = sparseBooleanArray.get(i12);
                boolean z5 = ((i8 > 0 || z4) && i3 > 0) ? z : false;
                if (z5) {
                    View viewA2 = h6Var.a(sx7Var2, null, viewGroup);
                    viewA2.measure(iMakeMeasureSpec, iMakeMeasureSpec);
                    int measuredWidth2 = viewA2.getMeasuredWidth();
                    i3 -= measuredWidth2;
                    if (i10 == 0) {
                        i10 = measuredWidth2;
                    }
                    z5 &= i3 + i10 > 0;
                }
                if (z5 && i12 != 0) {
                    sparseBooleanArray.put(i12, true);
                } else if (z4) {
                    sparseBooleanArray.put(i12, false);
                    for (int i13 = 0; i13 < i9; i13++) {
                        sx7 sx7Var3 = (sx7) arrayListL.get(i13);
                        if (sx7Var3.b == i12) {
                            if ((sx7Var3.x & 32) == 32) {
                                i8++;
                            }
                            sx7Var3.f(false);
                        }
                    }
                }
                if (z5) {
                    i8--;
                }
                sx7Var2.f(z5);
            } else {
                sx7Var2.f(false);
                i9++;
                i = 2;
                h6Var = this;
                z = true;
            }
            i9++;
            i = 2;
            h6Var = this;
            z = true;
        }
        return z;
    }

    public final boolean e() {
        Object obj;
        p0g p0gVar = this.u;
        if (p0gVar != null && (obj = this.h) != null) {
            ((View) obj).removeCallbacks(p0gVar);
            this.u = null;
            return true;
        }
        e6 e6Var = this.s;
        if (e6Var == null) {
            return false;
        }
        if (e6Var.b()) {
            e6Var.i.dismiss();
        }
        return true;
    }

    @Override // defpackage.ky7
    public final boolean f(sx7 sx7Var) {
        return false;
    }

    @Override // defpackage.ky7
    public final void g(jy7 jy7Var) {
        throw null;
    }

    @Override // defpackage.ky7
    public final boolean h(sx7 sx7Var) {
        return false;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.ky7
    public final void i() {
        int i;
        ViewGroup viewGroup = (ViewGroup) this.h;
        ArrayList arrayList = null;
        boolean z = false;
        if (viewGroup != null) {
            lx7 lx7Var = this.c;
            if (lx7Var != null) {
                lx7Var.i();
                ArrayList arrayListL = this.c.l();
                int size = arrayListL.size();
                i = 0;
                for (int i2 = 0; i2 < size; i2++) {
                    sx7 sx7Var = (sx7) arrayListL.get(i2);
                    if ((sx7Var.x & 32) == 32) {
                        View childAt = viewGroup.getChildAt(i);
                        sx7 itemData = childAt instanceof ny7 ? ((ny7) childAt).getItemData() : null;
                        View viewA = a(sx7Var, childAt, viewGroup);
                        if (sx7Var != itemData) {
                            viewA.setPressed(false);
                            viewA.jumpDrawablesToCurrentState();
                        }
                        if (viewA != childAt) {
                            ViewGroup viewGroup2 = (ViewGroup) viewA.getParent();
                            if (viewGroup2 != null) {
                                viewGroup2.removeView(viewA);
                            }
                            ((ViewGroup) this.h).addView(viewA, i);
                        }
                        i++;
                    }
                }
            } else {
                i = 0;
            }
            while (i < viewGroup.getChildCount()) {
                if (viewGroup.getChildAt(i) == this.i) {
                    i++;
                } else {
                    viewGroup.removeViewAt(i);
                }
            }
        }
        ((View) this.h).requestLayout();
        lx7 lx7Var2 = this.c;
        if (lx7Var2 != null) {
            lx7Var2.i();
            ArrayList arrayList2 = lx7Var2.i;
            int size2 = arrayList2.size();
            for (int i3 = 0; i3 < size2; i3++) {
                tx7 tx7Var = ((sx7) arrayList2.get(i3)).A;
            }
        }
        lx7 lx7Var3 = this.c;
        if (lx7Var3 != null) {
            lx7Var3.i();
            arrayList = lx7Var3.j;
        }
        if (this.l && arrayList != null) {
            int size3 = arrayList.size();
            if (size3 == 1) {
                z = !((sx7) arrayList.get(0)).C;
            } else if (size3 > 0) {
                z = true;
            }
        }
        g6 g6Var = this.i;
        if (z) {
            if (g6Var == null) {
                g6Var = new g6(this, this.a);
                this.i = g6Var;
            }
            ViewGroup viewGroup3 = (ViewGroup) g6Var.getParent();
            if (viewGroup3 != this.h) {
                if (viewGroup3 != null) {
                    viewGroup3.removeView(this.i);
                }
                ActionMenuView actionMenuView = (ActionMenuView) this.h;
                g6 g6Var2 = this.i;
                actionMenuView.getClass();
                j6 j6VarI = ActionMenuView.i();
                j6VarI.a = true;
                actionMenuView.addView(g6Var2, j6VarI);
            }
        } else if (g6Var != null) {
            Object parent = g6Var.getParent();
            Object obj = this.h;
            if (parent == obj) {
                ((ViewGroup) obj).removeView(this.i);
            }
        }
        ((ActionMenuView) this.h).setOverflowReserved(this.l);
    }

    public final boolean j() {
        e6 e6Var = this.s;
        return e6Var != null && e6Var.b();
    }

    @Override // defpackage.ky7
    public final void k(Context context, lx7 lx7Var) {
        this.b = context;
        LayoutInflater.from(context);
        this.c = lx7Var;
        Resources resources = context.getResources();
        if (!this.m) {
            this.l = true;
        }
        int i = 2;
        this.n = context.getResources().getDisplayMetrics().widthPixels / 2;
        Configuration configuration = context.getResources().getConfiguration();
        int i2 = configuration.screenWidthDp;
        int i3 = configuration.screenHeightDp;
        if (configuration.smallestScreenWidthDp > 600 || i2 > 600 || ((i2 > 960 && i3 > 720) || (i2 > 720 && i3 > 960))) {
            i = 5;
        } else if (i2 >= 500 || ((i2 > 640 && i3 > 480) || (i2 > 480 && i3 > 640))) {
            i = 4;
        } else if (i2 >= 360) {
            i = 3;
        }
        this.p = i;
        int measuredWidth = this.n;
        if (this.l) {
            if (this.i == null) {
                g6 g6Var = new g6(this, this.a);
                this.i = g6Var;
                if (this.k) {
                    g6Var.setImageDrawable(this.j);
                    this.j = null;
                    this.k = false;
                }
                int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
                this.i.measure(iMakeMeasureSpec, iMakeMeasureSpec);
            }
            measuredWidth -= this.i.getMeasuredWidth();
        } else {
            this.i = null;
        }
        this.o = measuredWidth;
        float f = resources.getDisplayMetrics().density;
    }

    public final boolean l() {
        lx7 lx7Var;
        boolean z = false;
        if (this.l && !j() && (lx7Var = this.c) != null && this.h != null && this.u == null) {
            lx7Var.i();
            if (!lx7Var.j.isEmpty()) {
                p0g p0gVar = new p0g(this, new e6(this, this.b, this.c, this.i), z, 1);
                this.u = p0gVar;
                ((View) this.h).post(p0gVar);
                return true;
            }
        }
        return false;
    }
}
