package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.os.Handler;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.HeaderViewListAdapter;
import android.widget.ListAdapter;
import android.widget.PopupWindow;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p71 extends ay7 implements View.OnKeyListener, PopupWindow.OnDismissListener {
    public final Context b;
    public final int c;
    public final int d;
    public final boolean e;
    public final Handler f;
    public View n;
    public View o;
    public int p;
    public boolean q;
    public boolean r;
    public int s;
    public int t;
    public boolean v;
    public jy7 w;
    public ViewTreeObserver x;
    public PopupWindow.OnDismissListener y;
    public boolean z;
    public final ArrayList g = new ArrayList();
    public final ArrayList h = new ArrayList();
    public final w20 i = new w20(2, this);
    public final pp j = new pp(1, this);
    public final zg7 k = new zg7(18, this);
    public int l = 0;
    public int m = 0;
    public boolean u = false;

    public p71(Context context, View view, int i, boolean z) {
        this.b = context;
        this.n = view;
        this.d = i;
        this.e = z;
        this.p = view.getLayoutDirection() == 1 ? 0 : 1;
        Resources resources = context.getResources();
        this.c = Math.max(resources.getDisplayMetrics().widthPixels / 2, resources.getDimensionPixelSize(R.dimen.abc_config_prefDialogWidth));
        this.f = new Handler();
    }

    @Override // defpackage.p9c
    public final boolean a() {
        ArrayList arrayList = this.h;
        return arrayList.size() > 0 && ((o71) arrayList.get(0)).a.z.isShowing();
    }

    @Override // defpackage.ky7
    public final void b(lx7 lx7Var, boolean z) {
        ArrayList arrayList = this.h;
        int size = arrayList.size();
        int i = 0;
        while (true) {
            if (i >= size) {
                i = -1;
                break;
            } else if (lx7Var == ((o71) arrayList.get(i)).b) {
                break;
            } else {
                i++;
            }
        }
        if (i < 0) {
            return;
        }
        int i2 = i + 1;
        if (i2 < arrayList.size()) {
            ((o71) arrayList.get(i2)).b.c(false);
        }
        o71 o71Var = (o71) arrayList.remove(i);
        lx7 lx7Var2 = o71Var.b;
        gy7 gy7Var = o71Var.a;
        p20 p20Var = gy7Var.z;
        lx7Var2.r(this);
        if (this.z) {
            dy7.b(p20Var, null);
            p20Var.setAnimationStyle(0);
        }
        gy7Var.dismiss();
        int size2 = arrayList.size();
        if (size2 > 0) {
            this.p = ((o71) arrayList.get(size2 - 1)).c;
        } else {
            this.p = this.n.getLayoutDirection() == 1 ? 0 : 1;
        }
        if (size2 != 0) {
            if (z) {
                ((o71) arrayList.get(0)).b.c(false);
                return;
            }
            return;
        }
        dismiss();
        jy7 jy7Var = this.w;
        if (jy7Var != null) {
            jy7Var.b(lx7Var, true);
        }
        ViewTreeObserver viewTreeObserver = this.x;
        if (viewTreeObserver != null) {
            if (viewTreeObserver.isAlive()) {
                this.x.removeGlobalOnLayoutListener(this.i);
            }
            this.x = null;
        }
        this.o.removeOnAttachStateChangeListener(this.j);
        this.y.onDismiss();
    }

    @Override // defpackage.ky7
    public final boolean c(dvc dvcVar) {
        for (o71 o71Var : this.h) {
            if (dvcVar == o71Var.b) {
                o71Var.a.c.requestFocus();
                return true;
            }
        }
        if (!dvcVar.hasVisibleItems()) {
            return false;
        }
        l(dvcVar);
        jy7 jy7Var = this.w;
        if (jy7Var != null) {
            jy7Var.q(dvcVar);
        }
        return true;
    }

    @Override // defpackage.ky7
    public final boolean d() {
        return false;
    }

    @Override // defpackage.p9c
    public final void dismiss() {
        ArrayList arrayList = this.h;
        int size = arrayList.size();
        if (size > 0) {
            o71[] o71VarArr = (o71[]) arrayList.toArray(new o71[size]);
            for (int i = size - 1; i >= 0; i--) {
                o71 o71Var = o71VarArr[i];
                if (o71Var.a.z.isShowing()) {
                    o71Var.a.dismiss();
                }
            }
        }
    }

    @Override // defpackage.p9c
    public final void e() {
        if (a()) {
            return;
        }
        ArrayList arrayList = this.g;
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            u((lx7) it2.next());
        }
        arrayList.clear();
        View view = this.n;
        this.o = view;
        if (view != null) {
            boolean z = this.x == null;
            ViewTreeObserver viewTreeObserver = view.getViewTreeObserver();
            this.x = viewTreeObserver;
            if (z) {
                viewTreeObserver.addOnGlobalLayoutListener(this.i);
            }
            this.o.addOnAttachStateChangeListener(this.j);
        }
    }

    @Override // defpackage.ky7
    public final void g(jy7 jy7Var) {
        this.w = jy7Var;
    }

    @Override // defpackage.ky7
    public final void i() {
        Iterator it2 = this.h.iterator();
        while (it2.hasNext()) {
            ListAdapter adapter = ((o71) it2.next()).a.c.getAdapter();
            if (adapter instanceof HeaderViewListAdapter) {
                adapter = ((HeaderViewListAdapter) adapter).getWrappedAdapter();
            }
            ((ix7) adapter).notifyDataSetChanged();
        }
    }

    @Override // defpackage.p9c
    public final ym3 j() {
        ArrayList arrayList = this.h;
        if (arrayList.isEmpty()) {
            return null;
        }
        return ((o71) y30.m(1, arrayList)).a.c;
    }

    @Override // defpackage.ay7
    public final void l(lx7 lx7Var) {
        lx7Var.b(this, this.b);
        if (a()) {
            u(lx7Var);
        } else {
            this.g.add(lx7Var);
        }
    }

    @Override // defpackage.ay7
    public final void n(View view) {
        if (this.n != view) {
            this.n = view;
            this.m = Gravity.getAbsoluteGravity(this.l, view.getLayoutDirection());
        }
    }

    @Override // defpackage.ay7
    public final void o(boolean z) {
        this.u = z;
    }

    @Override // android.widget.PopupWindow.OnDismissListener
    public final void onDismiss() {
        o71 o71Var;
        ArrayList arrayList = this.h;
        int size = arrayList.size();
        int i = 0;
        while (true) {
            if (i >= size) {
                o71Var = null;
                break;
            }
            o71Var = (o71) arrayList.get(i);
            if (!o71Var.a.z.isShowing()) {
                break;
            } else {
                i++;
            }
        }
        if (o71Var != null) {
            o71Var.b.c(false);
        }
    }

    @Override // android.view.View.OnKeyListener
    public final boolean onKey(View view, int i, KeyEvent keyEvent) {
        if (keyEvent.getAction() != 1 || i != 82) {
            return false;
        }
        dismiss();
        return true;
    }

    @Override // defpackage.ay7
    public final void p(int i) {
        if (this.l != i) {
            this.l = i;
            this.m = Gravity.getAbsoluteGravity(i, this.n.getLayoutDirection());
        }
    }

    @Override // defpackage.ay7
    public final void q(int i) {
        this.q = true;
        this.s = i;
    }

    @Override // defpackage.ay7
    public final void r(PopupWindow.OnDismissListener onDismissListener) {
        this.y = onDismissListener;
    }

    @Override // defpackage.ay7
    public final void s(boolean z) {
        this.v = z;
    }

    @Override // defpackage.ay7
    public final void t(int i) {
        this.r = true;
        this.t = i;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0163  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0171  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0173  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x017d  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0182  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x01be  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x01c8  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void u(defpackage.lx7 r20) {
        /*
            Method dump skipped, instruction units count: 567
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.p71.u(lx7):void");
    }
}
