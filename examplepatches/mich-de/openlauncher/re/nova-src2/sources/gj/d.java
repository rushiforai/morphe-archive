package gj;

import a5.a1;
import a5.s0;
import android.content.res.Resources;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.FrameLayout;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import cm.f;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.android.material.datepicker.l;
import com.google.android.material.datepicker.n;
import java.util.ArrayList;
import java.util.WeakHashMap;
import m.h0;
import mk.v;

/* loaded from: classes3.dex */
public final class d extends h0 {

    /* renamed from: f, reason: collision with root package name */
    public BottomSheetBehavior f57693f;

    /* renamed from: g, reason: collision with root package name */
    public FrameLayout f57694g;

    /* renamed from: h, reason: collision with root package name */
    public CoordinatorLayout f57695h;

    /* renamed from: i, reason: collision with root package name */
    public FrameLayout f57696i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f57697j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f57698k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f57699l;

    /* renamed from: m, reason: collision with root package name */
    public c f57700m;
    public boolean n;
    public mh.c o;

    /* renamed from: p, reason: collision with root package name */
    public b f57701p;

    @Override // android.app.Dialog, android.content.DialogInterface
    public final void cancel() {
        if (this.f57693f == null) {
            f();
        }
        super.cancel();
    }

    public final void f() throws Resources.NotFoundException {
        if (this.f57694g == null) {
            FrameLayout frameLayout = (FrameLayout) View.inflate(getContext(), 2131624075, null);
            this.f57694g = frameLayout;
            this.f57695h = (CoordinatorLayout) frameLayout.findViewById(2131427771);
            FrameLayout frameLayout2 = (FrameLayout) this.f57694g.findViewById(2131427851);
            this.f57696i = frameLayout2;
            BottomSheetBehavior bottomSheetBehaviorB = BottomSheetBehavior.B(frameLayout2);
            this.f57693f = bottomSheetBehaviorB;
            b bVar = this.f57701p;
            ArrayList arrayList = bottomSheetBehaviorB.W;
            if (!arrayList.contains(bVar)) {
                arrayList.add(bVar);
            }
            this.f57693f.H(this.f57697j);
            this.o = new mh.c(this.f57693f, this.f57696i);
        }
    }

    public final FrameLayout g(View view, int i5, ViewGroup.LayoutParams layoutParams) throws Resources.NotFoundException {
        f();
        CoordinatorLayout coordinatorLayout = (CoordinatorLayout) this.f57694g.findViewById(2131427771);
        if (i5 != 0 && view == null) {
            view = getLayoutInflater().inflate(i5, (ViewGroup) coordinatorLayout, false);
        }
        if (this.n) {
            FrameLayout frameLayout = this.f57696i;
            f fVar = new f(this, 29);
            WeakHashMap weakHashMap = a1.f250a;
            s0.l(frameLayout, fVar);
        }
        this.f57696i.removeAllViews();
        if (layoutParams == null) {
            this.f57696i.addView(view);
        } else {
            this.f57696i.addView(view, layoutParams);
        }
        int i11 = 2;
        coordinatorLayout.findViewById(2131429070).setOnClickListener(new n(this, i11));
        a1.k(this.f57696i, new l(this, i11));
        this.f57696i.setOnTouchListener(new dk.b(1));
        return this.f57694g;
    }

    @Override // android.app.Dialog, android.view.Window.Callback
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        Window window = getWindow();
        if (window != null) {
            boolean z11 = this.n && Color.alpha(window.getNavigationBarColor()) < 255;
            FrameLayout frameLayout = this.f57694g;
            if (frameLayout != null) {
                frameLayout.setFitsSystemWindows(!z11);
            }
            CoordinatorLayout coordinatorLayout = this.f57695h;
            if (coordinatorLayout != null) {
                coordinatorLayout.setFitsSystemWindows(!z11);
            }
            v.P(window, !z11);
            c cVar = this.f57700m;
            if (cVar != null) {
                cVar.e(window);
            }
        }
        mh.c cVar2 = this.o;
        if (cVar2 == null) {
            return;
        }
        View view = (View) cVar2.f76325d;
        vj.c cVar3 = (vj.c) cVar2.f76323b;
        if (this.f57697j) {
            if (cVar3 != null) {
                cVar3.b((vj.b) cVar2.f76324c, view, false);
            }
        } else if (cVar3 != null) {
            cVar3.c(view);
        }
    }

    @Override // m.h0, g.q, android.app.Dialog
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Window window = getWindow();
        if (window != null) {
            window.setStatusBarColor(0);
            window.addFlags(Integer.MIN_VALUE);
            window.setLayout(-1, -1);
        }
    }

    @Override // android.app.Dialog, android.view.Window.Callback
    public final void onDetachedFromWindow() {
        vj.c cVar;
        c cVar2 = this.f57700m;
        if (cVar2 != null) {
            cVar2.e(null);
        }
        mh.c cVar3 = this.o;
        if (cVar3 == null || (cVar = (vj.c) cVar3.f76323b) == null) {
            return;
        }
        cVar.c((View) cVar3.f76325d);
    }

    @Override // g.q, android.app.Dialog
    public final void onStart() {
        super.onStart();
        BottomSheetBehavior bottomSheetBehavior = this.f57693f;
        if (bottomSheetBehavior == null || bottomSheetBehavior.L != 5) {
            return;
        }
        bottomSheetBehavior.J(4);
    }

    @Override // android.app.Dialog
    public final void setCancelable(boolean z11) throws Resources.NotFoundException {
        mh.c cVar;
        super.setCancelable(z11);
        if (this.f57697j != z11) {
            this.f57697j = z11;
            BottomSheetBehavior bottomSheetBehavior = this.f57693f;
            if (bottomSheetBehavior != null) {
                bottomSheetBehavior.H(z11);
            }
            if (getWindow() == null || (cVar = this.o) == null) {
                return;
            }
            View view = (View) cVar.f76325d;
            vj.c cVar2 = (vj.c) cVar.f76323b;
            if (this.f57697j) {
                if (cVar2 != null) {
                    cVar2.b((vj.b) cVar.f76324c, view, false);
                }
            } else if (cVar2 != null) {
                cVar2.c(view);
            }
        }
    }

    @Override // android.app.Dialog
    public final void setCanceledOnTouchOutside(boolean z11) {
        super.setCanceledOnTouchOutside(z11);
        if (z11 && !this.f57697j) {
            this.f57697j = true;
        }
        this.f57698k = z11;
        this.f57699l = true;
    }

    @Override // m.h0, g.q, android.app.Dialog
    public final void setContentView(int i5) {
        super.setContentView(g(null, i5, null));
    }

    @Override // m.h0, g.q, android.app.Dialog
    public final void setContentView(View view) {
        super.setContentView(g(view, 0, null));
    }

    @Override // m.h0, g.q, android.app.Dialog
    public final void setContentView(View view, ViewGroup.LayoutParams layoutParams) {
        super.setContentView(g(view, 0, layoutParams));
    }
}
