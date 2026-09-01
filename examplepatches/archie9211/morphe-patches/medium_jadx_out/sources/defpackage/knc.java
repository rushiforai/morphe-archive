package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Rect;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.PopupWindow;
import android.widget.TextView;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class knc extends ay7 implements PopupWindow.OnDismissListener, View.OnKeyListener {
    public final Context b;
    public final lx7 c;
    public final ix7 d;
    public final boolean e;
    public final int f;
    public final int g;
    public final gy7 h;
    public PopupWindow.OnDismissListener k;
    public View l;
    public View m;
    public jy7 n;
    public ViewTreeObserver o;
    public boolean p;
    public boolean q;
    public int r;
    public boolean t;
    public final w20 i = new w20(3, this);
    public final pp j = new pp(5, this);
    public int s = 0;

    public knc(Context context, lx7 lx7Var, View view, int i, boolean z) {
        this.b = context;
        this.c = lx7Var;
        this.e = z;
        this.d = new ix7(lx7Var, LayoutInflater.from(context), z, R.layout.abc_popup_menu_item_layout);
        this.g = i;
        Resources resources = context.getResources();
        this.f = Math.max(resources.getDisplayMetrics().widthPixels / 2, resources.getDimensionPixelSize(R.dimen.abc_config_prefDialogWidth));
        this.l = view;
        this.h = new gy7(context, null, i, 0);
        lx7Var.b(this, context);
    }

    @Override // defpackage.p9c
    public final boolean a() {
        return !this.p && this.h.z.isShowing();
    }

    @Override // defpackage.ky7
    public final void b(lx7 lx7Var, boolean z) {
        if (lx7Var != this.c) {
            return;
        }
        dismiss();
        jy7 jy7Var = this.n;
        if (jy7Var != null) {
            jy7Var.b(lx7Var, z);
        }
    }

    @Override // defpackage.ky7
    public final boolean c(dvc dvcVar) {
        boolean z;
        if (dvcVar.hasVisibleItems()) {
            cy7 cy7Var = new cy7(this.b, dvcVar, this.m, this.e, this.g, 0);
            jy7 jy7Var = this.n;
            cy7Var.h = jy7Var;
            ay7 ay7Var = cy7Var.i;
            if (ay7Var != null) {
                ay7Var.g(jy7Var);
            }
            int size = dvcVar.f.size();
            int i = 0;
            while (true) {
                if (i >= size) {
                    z = false;
                    break;
                }
                MenuItem item = dvcVar.getItem(i);
                if (item.isVisible() && item.getIcon() != null) {
                    z = true;
                    break;
                }
                i++;
            }
            cy7Var.g = z;
            ay7 ay7Var2 = cy7Var.i;
            if (ay7Var2 != null) {
                ay7Var2.o(z);
            }
            cy7Var.j = this.k;
            this.k = null;
            this.c.c(false);
            gy7 gy7Var = this.h;
            int width = gy7Var.f;
            int iN = gy7Var.n();
            if ((Gravity.getAbsoluteGravity(this.s, this.l.getLayoutDirection()) & 7) == 5) {
                width += this.l.getWidth();
            }
            if (!cy7Var.b()) {
                if (cy7Var.e != null) {
                    cy7Var.d(width, iN, true, true);
                }
            }
            jy7 jy7Var2 = this.n;
            if (jy7Var2 != null) {
                jy7Var2.q(dvcVar);
            }
            return true;
        }
        return false;
    }

    @Override // defpackage.ky7
    public final boolean d() {
        return false;
    }

    @Override // defpackage.p9c
    public final void dismiss() {
        if (a()) {
            this.h.dismiss();
        }
    }

    @Override // defpackage.p9c
    public final void e() {
        View view;
        if (a()) {
            return;
        }
        if (this.p || (view = this.l) == null) {
            ygf.f("StandardMenuPopup cannot be used without an anchor");
            return;
        }
        this.m = view;
        gy7 gy7Var = this.h;
        p20 p20Var = gy7Var.z;
        p20 p20Var2 = gy7Var.z;
        p20Var.setOnDismissListener(this);
        gy7Var.p = this;
        gy7Var.y = true;
        p20Var2.setFocusable(true);
        View view2 = this.m;
        boolean z = this.o == null;
        ViewTreeObserver viewTreeObserver = view2.getViewTreeObserver();
        this.o = viewTreeObserver;
        if (z) {
            viewTreeObserver.addOnGlobalLayoutListener(this.i);
        }
        view2.addOnAttachStateChangeListener(this.j);
        gy7Var.o = view2;
        gy7Var.l = this.s;
        boolean z2 = this.q;
        Context context = this.b;
        ix7 ix7Var = this.d;
        if (!z2) {
            this.r = ay7.m(ix7Var, context, this.f);
            this.q = true;
        }
        gy7Var.q(this.r);
        p20Var2.setInputMethodMode(2);
        Rect rect = this.a;
        gy7Var.x = rect != null ? new Rect(rect) : null;
        gy7Var.e();
        ym3 ym3Var = gy7Var.c;
        ym3Var.setOnKeyListener(this);
        if (this.t) {
            lx7 lx7Var = this.c;
            if (lx7Var.m != null) {
                FrameLayout frameLayout = (FrameLayout) LayoutInflater.from(context).inflate(R.layout.abc_popup_menu_header_item_layout, (ViewGroup) ym3Var, false);
                TextView textView = (TextView) frameLayout.findViewById(android.R.id.title);
                if (textView != null) {
                    textView.setText(lx7Var.m);
                }
                frameLayout.setEnabled(false);
                ym3Var.addHeaderView(frameLayout, null, false);
            }
        }
        gy7Var.o(ix7Var);
        gy7Var.e();
    }

    @Override // defpackage.ky7
    public final void g(jy7 jy7Var) {
        this.n = jy7Var;
    }

    @Override // defpackage.ky7
    public final void i() {
        this.q = false;
        ix7 ix7Var = this.d;
        if (ix7Var != null) {
            ix7Var.notifyDataSetChanged();
        }
    }

    @Override // defpackage.p9c
    public final ym3 j() {
        return this.h.c;
    }

    @Override // defpackage.ay7
    public final void n(View view) {
        this.l = view;
    }

    @Override // defpackage.ay7
    public final void o(boolean z) {
        this.d.c = z;
    }

    @Override // android.widget.PopupWindow.OnDismissListener
    public final void onDismiss() {
        this.p = true;
        this.c.c(true);
        ViewTreeObserver viewTreeObserver = this.o;
        if (viewTreeObserver != null) {
            if (!viewTreeObserver.isAlive()) {
                this.o = this.m.getViewTreeObserver();
            }
            this.o.removeGlobalOnLayoutListener(this.i);
            this.o = null;
        }
        this.m.removeOnAttachStateChangeListener(this.j);
        PopupWindow.OnDismissListener onDismissListener = this.k;
        if (onDismissListener != null) {
            onDismissListener.onDismiss();
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
        this.s = i;
    }

    @Override // defpackage.ay7
    public final void q(int i) {
        this.h.f = i;
    }

    @Override // defpackage.ay7
    public final void r(PopupWindow.OnDismissListener onDismissListener) {
        this.k = onDismissListener;
    }

    @Override // defpackage.ay7
    public final void s(boolean z) {
        this.t = z;
    }

    @Override // defpackage.ay7
    public final void t(int i) {
        this.h.k(i);
    }

    @Override // defpackage.ay7
    public final void l(lx7 lx7Var) {
    }
}
