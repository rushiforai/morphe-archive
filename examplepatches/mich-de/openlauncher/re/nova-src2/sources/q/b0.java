package q;

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
import r.g1;
import r.x1;

/* loaded from: classes2.dex */
public final class b0 extends s implements PopupWindow.OnDismissListener, View.OnKeyListener {

    /* renamed from: b, reason: collision with root package name */
    public final Context f83171b;

    /* renamed from: c, reason: collision with root package name */
    public final k f83172c;

    /* renamed from: d, reason: collision with root package name */
    public final h f83173d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f83174e;

    /* renamed from: f, reason: collision with root package name */
    public final int f83175f;

    /* renamed from: g, reason: collision with root package name */
    public final int f83176g;

    /* renamed from: h, reason: collision with root package name */
    public final x1 f83177h;

    /* renamed from: k, reason: collision with root package name */
    public PopupWindow.OnDismissListener f83180k;

    /* renamed from: l, reason: collision with root package name */
    public View f83181l;

    /* renamed from: m, reason: collision with root package name */
    public View f83182m;
    public v n;
    public ViewTreeObserver o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f83183p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f83184q;

    /* renamed from: r, reason: collision with root package name */
    public int f83185r;

    /* renamed from: t, reason: collision with root package name */
    public boolean f83187t;

    /* renamed from: i, reason: collision with root package name */
    public final d9.d f83178i = new d9.d(this, 3);

    /* renamed from: j, reason: collision with root package name */
    public final eb.f f83179j = new eb.f(this, 7);

    /* renamed from: s, reason: collision with root package name */
    public int f83186s = 0;

    public b0(Context context, k kVar, View view, int i5, boolean z11) {
        this.f83171b = context;
        this.f83172c = kVar;
        this.f83174e = z11;
        this.f83173d = new h(kVar, LayoutInflater.from(context), z11, 2131623955);
        this.f83176g = i5;
        Resources resources = context.getResources();
        this.f83175f = Math.max(resources.getDisplayMetrics().widthPixels / 2, resources.getDimensionPixelSize(2131165207));
        this.f83181l = view;
        this.f83177h = new x1(context, null, i5, 0);
        kVar.b(this, context);
    }

    @Override // q.w
    public final boolean a(c0 c0Var) {
        boolean z11;
        if (c0Var.hasVisibleItems()) {
            u uVar = new u(this.f83171b, c0Var, this.f83182m, this.f83174e, this.f83176g, 0);
            v vVar = this.n;
            uVar.f83301h = vVar;
            s sVar = uVar.f83302i;
            if (sVar != null) {
                sVar.h(vVar);
            }
            int size = c0Var.f83237f.size();
            int i5 = 0;
            while (true) {
                if (i5 >= size) {
                    z11 = false;
                    break;
                }
                MenuItem item = c0Var.getItem(i5);
                if (item.isVisible() && item.getIcon() != null) {
                    z11 = true;
                    break;
                }
                i5++;
            }
            uVar.f83300g = z11;
            s sVar2 = uVar.f83302i;
            if (sVar2 != null) {
                sVar2.m(z11);
            }
            uVar.f83303j = this.f83180k;
            this.f83180k = null;
            this.f83172c.c(false);
            x1 x1Var = this.f83177h;
            int width = x1Var.f84865f;
            int i11 = x1Var.i();
            if ((Gravity.getAbsoluteGravity(this.f83186s, this.f83181l.getLayoutDirection()) & 7) == 5) {
                width += this.f83181l.getWidth();
            }
            if (!uVar.b()) {
                if (uVar.f83298e != null) {
                    uVar.d(width, i11, true, true);
                }
            }
            v vVar2 = this.n;
            if (vVar2 != null) {
                vVar2.m(c0Var);
            }
            return true;
        }
        return false;
    }

    @Override // q.w
    public final void b(k kVar, boolean z11) {
        if (kVar != this.f83172c) {
            return;
        }
        dismiss();
        v vVar = this.n;
        if (vVar != null) {
            vVar.b(kVar, z11);
        }
    }

    @Override // q.w
    public final void c() {
        this.f83184q = false;
        h hVar = this.f83173d;
        if (hVar != null) {
            hVar.notifyDataSetChanged();
        }
    }

    @Override // q.a0
    public final void dismiss() {
        if (isShowing()) {
            this.f83177h.dismiss();
        }
    }

    @Override // q.w
    public final boolean g() {
        return false;
    }

    @Override // q.w
    public final void h(v vVar) {
        this.n = vVar;
    }

    @Override // q.s
    public final void i(k kVar) {
    }

    @Override // q.a0
    public final boolean isShowing() {
        return !this.f83183p && this.f83177h.f84883z.isShowing();
    }

    @Override // q.a0
    public final g1 k() {
        return this.f83177h.f84862c;
    }

    @Override // q.s
    public final void l(View view) {
        this.f83181l = view;
    }

    @Override // q.s
    public final void m(boolean z11) {
        this.f83173d.f83227c = z11;
    }

    @Override // q.s
    public final void n(int i5) {
        this.f83186s = i5;
    }

    @Override // q.s
    public final void o(int i5) {
        this.f83177h.f84865f = i5;
    }

    @Override // android.widget.PopupWindow.OnDismissListener
    public final void onDismiss() {
        this.f83183p = true;
        this.f83172c.c(true);
        ViewTreeObserver viewTreeObserver = this.o;
        if (viewTreeObserver != null) {
            if (!viewTreeObserver.isAlive()) {
                this.o = this.f83182m.getViewTreeObserver();
            }
            this.o.removeGlobalOnLayoutListener(this.f83178i);
            this.o = null;
        }
        this.f83182m.removeOnAttachStateChangeListener(this.f83179j);
        PopupWindow.OnDismissListener onDismissListener = this.f83180k;
        if (onDismissListener != null) {
            onDismissListener.onDismiss();
        }
    }

    @Override // android.view.View.OnKeyListener
    public final boolean onKey(View view, int i5, KeyEvent keyEvent) {
        if (keyEvent.getAction() != 1 || i5 != 82) {
            return false;
        }
        dismiss();
        return true;
    }

    @Override // q.s
    public final void p(PopupWindow.OnDismissListener onDismissListener) {
        this.f83180k = onDismissListener;
    }

    @Override // q.s
    public final void q(boolean z11) {
        this.f83187t = z11;
    }

    @Override // q.s
    public final void r(int i5) {
        this.f83177h.f(i5);
    }

    @Override // q.a0
    public final void show() {
        View view;
        if (isShowing()) {
            return;
        }
        if (this.f83183p || (view = this.f83181l) == null) {
            throw new IllegalStateException("StandardMenuPopup cannot be used without an anchor");
        }
        this.f83182m = view;
        x1 x1Var = this.f83177h;
        x1Var.f84883z.setOnDismissListener(this);
        x1Var.f84873p = this;
        x1Var.p();
        View view2 = this.f83182m;
        boolean z11 = this.o == null;
        ViewTreeObserver viewTreeObserver = view2.getViewTreeObserver();
        this.o = viewTreeObserver;
        if (z11) {
            viewTreeObserver.addOnGlobalLayoutListener(this.f83178i);
        }
        view2.addOnAttachStateChangeListener(this.f83179j);
        x1Var.o = view2;
        x1Var.f84871l = this.f83186s;
        boolean z12 = this.f83184q;
        Context context = this.f83171b;
        h hVar = this.f83173d;
        if (!z12) {
            this.f83185r = s.j(hVar, context, this.f83175f);
            this.f83184q = true;
        }
        x1Var.n(this.f83185r);
        x1Var.o();
        Rect rect = this.f83291a;
        x1Var.f84881x = rect != null ? new Rect(rect) : null;
        x1Var.show();
        g1 g1Var = x1Var.f84862c;
        g1Var.setOnKeyListener(this);
        if (this.f83187t) {
            k kVar = this.f83172c;
            if (kVar.f83244m != null) {
                FrameLayout frameLayout = (FrameLayout) LayoutInflater.from(context).inflate(2131623954, (ViewGroup) g1Var, false);
                TextView textView = (TextView) frameLayout.findViewById(16908310);
                if (textView != null) {
                    textView.setText(kVar.f83244m);
                }
                frameLayout.setEnabled(false);
                g1Var.addHeaderView(frameLayout, null, false);
            }
        }
        x1Var.j(hVar);
        x1Var.show();
    }
}
