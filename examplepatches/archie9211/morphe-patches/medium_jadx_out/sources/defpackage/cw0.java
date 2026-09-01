package defpackage;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Build;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.FrameLayout;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cw0 extends h20 {
    public BottomSheetBehavior g;
    public FrameLayout h;
    public CoordinatorLayout i;
    public FrameLayout j;
    public boolean k;
    public boolean l;
    public boolean m;
    public bw0 n;
    public final boolean o;
    public ku3 p;
    public final aw0 q;

    public cw0(Context context, int i) {
        if (i == 0) {
            TypedValue typedValue = new TypedValue();
            i = context.getTheme().resolveAttribute(R.attr.bottomSheetDialogTheme, typedValue, true) ? typedValue.resourceId : R.style.Theme_Design_Light_BottomSheetDialog;
        }
        super(context, i);
        this.k = true;
        this.l = true;
        this.q = new aw0(this);
        d().g(1);
        TypedArray typedArrayObtainStyledAttributes = getContext().getTheme().obtainStyledAttributes(new int[]{R.attr.enableEdgeToEdge});
        this.o = typedArrayObtainStyledAttributes.getBoolean(0, false);
        typedArrayObtainStyledAttributes.recycle();
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public final void cancel() {
        g();
        super.cancel();
    }

    public final void f() {
        if (this.h == null) {
            FrameLayout frameLayout = (FrameLayout) View.inflate(getContext(), R.layout.design_bottom_sheet_dialog, null);
            this.h = frameLayout;
            this.i = (CoordinatorLayout) this.h.findViewById(R.id.coordinator);
            FrameLayout frameLayout2 = (FrameLayout) this.h.findViewById(R.id.design_bottom_sheet);
            this.j = frameLayout2;
            BottomSheetBehavior bottomSheetBehaviorB = BottomSheetBehavior.B(frameLayout2);
            this.g = bottomSheetBehaviorB;
            ArrayList arrayList = bottomSheetBehaviorB.a0;
            aw0 aw0Var = this.q;
            if (!arrayList.contains(aw0Var)) {
                arrayList.add(aw0Var);
            }
            this.g.J(this.k);
            this.p = new ku3(this.g, this.j);
        }
    }

    public final BottomSheetBehavior g() {
        if (this.g == null) {
            f();
        }
        return this.g;
    }

    public final FrameLayout h(View view, int i, ViewGroup.LayoutParams layoutParams) {
        f();
        CoordinatorLayout coordinatorLayout = (CoordinatorLayout) this.h.findViewById(R.id.coordinator);
        if (i != 0 && view == null) {
            view = getLayoutInflater().inflate(i, (ViewGroup) coordinatorLayout, false);
        }
        if (this.o) {
            FrameLayout frameLayout = this.h;
            zg7 zg7Var = new zg7(16, this);
            WeakHashMap weakHashMap = ute.a;
            mte.c(frameLayout, zg7Var);
        }
        this.j.removeAllViews();
        FrameLayout frameLayout2 = this.j;
        if (layoutParams == null) {
            frameLayout2.addView(view);
        } else {
            frameLayout2.addView(view, layoutParams);
        }
        coordinatorLayout.findViewById(R.id.touch_outside).setOnClickListener(new u5(2, this));
        ute.o(this.j, new fo0(1, this));
        this.j.setOnTouchListener(new ho0(1));
        return this.h;
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0025  */
    /* JADX WARN: Removed duplicated region for block: B:16:0x002a  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0033  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0040  */
    @Override // android.app.Dialog, android.view.Window.Callback
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onAttachedToWindow() {
        /*
            r6 = this;
            super.onAttachedToWindow()
            android.view.Window r0 = r6.getWindow()
            r1 = 0
            if (r0 == 0) goto L43
            boolean r2 = r6.o
            r3 = 1
            if (r2 == 0) goto L25
            int r2 = android.os.Build.VERSION.SDK_INT
            r4 = 35
            if (r2 >= r4) goto L1a
            int r2 = r0.getNavigationBarColor()
            goto L1b
        L1a:
            r2 = r1
        L1b:
            int r2 = android.graphics.Color.alpha(r2)
            r4 = 255(0xff, float:3.57E-43)
            if (r2 >= r4) goto L25
            r2 = r3
            goto L26
        L25:
            r2 = r1
        L26:
            android.widget.FrameLayout r4 = r6.h
            if (r4 == 0) goto L2f
            r5 = r2 ^ 1
            r4.setFitsSystemWindows(r5)
        L2f:
            androidx.coordinatorlayout.widget.CoordinatorLayout r4 = r6.i
            if (r4 == 0) goto L38
            r5 = r2 ^ 1
            r4.setFitsSystemWindows(r5)
        L38:
            r2 = r2 ^ r3
            defpackage.gr7.B(r0, r2)
            bw0 r2 = r6.n
            if (r2 == 0) goto L43
            r2.e(r0)
        L43:
            ku3 r0 = r6.p
            if (r0 != 0) goto L48
            goto L63
        L48:
            java.lang.Object r2 = r0.d
            android.view.View r2 = (android.view.View) r2
            boolean r6 = r6.k
            java.lang.Object r3 = r0.b
            nj7 r3 = (defpackage.nj7) r3
            if (r6 == 0) goto L5e
            if (r3 == 0) goto L63
            java.lang.Object r6 = r0.c
            mj7 r6 = (defpackage.mj7) r6
            r3.b(r6, r2, r1)
            return
        L5e:
            if (r3 == 0) goto L63
            r3.c(r2)
        L63:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cw0.onAttachedToWindow():void");
    }

    @Override // defpackage.h20, defpackage.bz1, android.app.Dialog
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Window window = getWindow();
        if (window != null) {
            if (Build.VERSION.SDK_INT < 35) {
                window.setStatusBarColor(0);
            }
            window.addFlags(Integer.MIN_VALUE);
            window.setLayout(-1, -1);
        }
    }

    @Override // android.app.Dialog, android.view.Window.Callback
    public final void onDetachedFromWindow() {
        nj7 nj7Var;
        bw0 bw0Var = this.n;
        if (bw0Var != null) {
            bw0Var.e(null);
        }
        ku3 ku3Var = this.p;
        if (ku3Var == null || (nj7Var = (nj7) ku3Var.b) == null) {
            return;
        }
        nj7Var.c((View) ku3Var.d);
    }

    @Override // defpackage.bz1, android.app.Dialog
    public final void onStart() {
        super.onStart();
        BottomSheetBehavior bottomSheetBehavior = this.g;
        if (bottomSheetBehavior == null || bottomSheetBehavior.P != 5) {
            return;
        }
        bottomSheetBehavior.L(4);
    }

    @Override // android.app.Dialog
    public final void setCancelable(boolean z) {
        ku3 ku3Var;
        super.setCancelable(z);
        if (this.k != z) {
            this.k = z;
            BottomSheetBehavior bottomSheetBehavior = this.g;
            if (bottomSheetBehavior != null) {
                bottomSheetBehavior.J(z);
            }
            if (getWindow() == null || (ku3Var = this.p) == null) {
                return;
            }
            View view = (View) ku3Var.d;
            boolean z2 = this.k;
            nj7 nj7Var = (nj7) ku3Var.b;
            if (z2) {
                if (nj7Var != null) {
                    nj7Var.b((mj7) ku3Var.c, view, false);
                }
            } else if (nj7Var != null) {
                nj7Var.c(view);
            }
        }
    }

    @Override // android.app.Dialog
    public final void setCanceledOnTouchOutside(boolean z) {
        super.setCanceledOnTouchOutside(z);
        if (z && !this.k) {
            this.k = true;
        }
        this.l = z;
        this.m = true;
    }

    @Override // defpackage.h20, defpackage.bz1, android.app.Dialog
    public final void setContentView(View view) {
        super.setContentView(h(view, 0, null));
    }

    @Override // defpackage.h20, defpackage.bz1, android.app.Dialog
    public final void setContentView(int i) {
        super.setContentView(h(null, i, null));
    }

    @Override // defpackage.h20, defpackage.bz1, android.app.Dialog
    public final void setContentView(View view, ViewGroup.LayoutParams layoutParams) {
        super.setContentView(h(view, 0, layoutParams));
    }
}
