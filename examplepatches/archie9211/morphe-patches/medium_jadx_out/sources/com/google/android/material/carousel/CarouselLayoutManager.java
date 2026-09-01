package com.google.android.material.carousel;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.PointF;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import androidx.recyclerview.widget.RecyclerView;
import com.medium.reader.R;
import defpackage.ay0;
import defpackage.b09;
import defpackage.dya;
import defpackage.eya;
import defpackage.jg9;
import defpackage.k71;
import defpackage.l71;
import defpackage.l80;
import defpackage.m71;
import defpackage.sxa;
import defpackage.txa;
import defpackage.ura;
import defpackage.ygf;
import defpackage.yxa;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class CarouselLayoutManager extends sxa implements dya {
    public final l80 p;
    public m71 q;
    public final View.OnLayoutChangeListener r;

    public CarouselLayoutManager(Context context, AttributeSet attributeSet, int i, int i2) {
        new l71();
        this.r = new jg9(2, this);
        this.p = new l80();
        p0();
        if (attributeSet != null) {
            TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, ura.b);
            typedArrayObtainStyledAttributes.getInt(0, 0);
            p0();
            H0(typedArrayObtainStyledAttributes.getInt(0, 0));
            typedArrayObtainStyledAttributes.recycle();
        }
    }

    @Override // defpackage.sxa
    public final void B0(RecyclerView recyclerView, int i) {
        k71 k71Var = new k71(this, recyclerView.getContext());
        k71Var.a = i;
        C0(k71Var);
    }

    public final float E0(float f, float f2) {
        return G0() ? f - f2 : f + f2;
    }

    public final boolean F0() {
        return this.q.a == 0;
    }

    public final boolean G0() {
        return F0() && this.b.getLayoutDirection() == 1;
    }

    public final void H0(int i) {
        m71 m71Var;
        if (i != 0 && i != 1) {
            ay0.e(b09.w(i, "invalid orientation:"));
            return;
        }
        c(null);
        m71 m71Var2 = this.q;
        if (m71Var2 == null || i != m71Var2.a) {
            if (i == 0) {
                m71Var = new m71(this, 1);
            } else {
                if (i != 1) {
                    ay0.e("invalid orientation");
                    return;
                }
                m71Var = new m71(this, 0);
            }
            this.q = m71Var;
            p0();
        }
    }

    @Override // defpackage.sxa
    public final boolean L() {
        return true;
    }

    @Override // defpackage.sxa
    public final void S(RecyclerView recyclerView) {
        Context context = recyclerView.getContext();
        l80 l80Var = this.p;
        float dimension = l80Var.a;
        if (dimension <= 0.0f) {
            dimension = context.getResources().getDimension(R.dimen.m3_carousel_small_item_size_min);
        }
        l80Var.a = dimension;
        float dimension2 = l80Var.b;
        if (dimension2 <= 0.0f) {
            dimension2 = context.getResources().getDimension(R.dimen.m3_carousel_small_item_size_max);
        }
        l80Var.b = dimension2;
        p0();
        recyclerView.addOnLayoutChangeListener(this.r);
    }

    @Override // defpackage.sxa
    public final void T(RecyclerView recyclerView) {
        recyclerView.removeOnLayoutChangeListener(this.r);
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x003d  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0047  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0058  */
    @Override // defpackage.sxa
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final android.view.View U(android.view.View r5, int r6, defpackage.yxa r7, defpackage.eya r8) {
        /*
            r4 = this;
            int r7 = r4.v()
            r8 = 0
            if (r7 != 0) goto L9
            goto L96
        L9:
            m71 r7 = r4.q
            int r7 = r7.a
            r0 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = -1
            r2 = 1
            if (r6 == r2) goto L47
            r3 = 2
            if (r6 == r3) goto L3d
            r3 = 17
            if (r6 == r3) goto L4c
            r3 = 33
            if (r6 == r3) goto L49
            r3 = 66
            if (r6 == r3) goto L3f
            r3 = 130(0x82, float:1.82E-43)
            if (r6 == r3) goto L3b
            java.lang.StringBuilder r7 = new java.lang.StringBuilder
            java.lang.String r3 = "Unknown focus request:"
            r7.<init>(r3)
            r7.append(r6)
            java.lang.String r6 = r7.toString()
            java.lang.String r7 = "CarouselLayoutManager"
            android.util.Log.d(r7, r6)
        L39:
            r6 = r0
            goto L55
        L3b:
            if (r7 != r2) goto L39
        L3d:
            r6 = r2
            goto L55
        L3f:
            if (r7 != 0) goto L39
            boolean r6 = r4.G0()
            if (r6 == 0) goto L3d
        L47:
            r6 = r1
            goto L55
        L49:
            if (r7 != r2) goto L39
            goto L47
        L4c:
            if (r7 != 0) goto L39
            boolean r6 = r4.G0()
            if (r6 == 0) goto L47
            goto L3d
        L55:
            if (r6 != r0) goto L58
            goto L96
        L58:
            r7 = 0
            if (r6 != r1) goto L8b
            int r5 = defpackage.sxa.H(r5)
            if (r5 != 0) goto L62
            goto L96
        L62:
            android.view.View r5 = r4.u(r7)
            int r5 = defpackage.sxa.H(r5)
            int r5 = r5 - r2
            if (r5 < 0) goto L7a
            int r6 = r4.C()
            if (r5 < r6) goto L74
            goto L7a
        L74:
            m71 r4 = r4.q
            r4.a()
            throw r8
        L7a:
            boolean r5 = r4.G0()
            if (r5 == 0) goto L86
            int r5 = r4.v()
            int r7 = r5 + (-1)
        L86:
            android.view.View r4 = r4.u(r7)
            return r4
        L8b:
            int r5 = defpackage.sxa.H(r5)
            int r6 = r4.C()
            int r6 = r6 - r2
            if (r5 != r6) goto L97
        L96:
            return r8
        L97:
            int r5 = r4.v()
            int r5 = r5 - r2
            android.view.View r5 = r4.u(r5)
            int r5 = defpackage.sxa.H(r5)
            int r5 = r5 + r2
            if (r5 < 0) goto Lb4
            int r6 = r4.C()
            if (r5 < r6) goto Lae
            goto Lb4
        Lae:
            m71 r4 = r4.q
            r4.a()
            throw r8
        Lb4:
            boolean r5 = r4.G0()
            if (r5 == 0) goto Lbb
            goto Lc1
        Lbb:
            int r5 = r4.v()
            int r7 = r5 + (-1)
        Lc1:
            android.view.View r4 = r4.u(r7)
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.carousel.CarouselLayoutManager.U(android.view.View, int, yxa, eya):android.view.View");
    }

    @Override // defpackage.sxa
    public final void V(AccessibilityEvent accessibilityEvent) {
        super.V(accessibilityEvent);
        if (v() > 0) {
            accessibilityEvent.setFromIndex(sxa.H(u(0)));
            accessibilityEvent.setToIndex(sxa.H(u(v() - 1)));
        }
    }

    @Override // defpackage.sxa
    public final void Z(int i, int i2) {
        C();
    }

    @Override // defpackage.dya
    public final PointF a(int i) {
        return null;
    }

    @Override // defpackage.sxa
    public final void a0() {
        C();
    }

    @Override // defpackage.sxa
    public final void c0(int i, int i2) {
        C();
    }

    @Override // defpackage.sxa
    public final boolean d() {
        return F0();
    }

    @Override // defpackage.sxa
    public final boolean e() {
        return !F0();
    }

    @Override // defpackage.sxa
    public final void e0(yxa yxaVar, eya eyaVar) {
        if (eyaVar.b() > 0) {
            if ((F0() ? this.n : this.o) > 0.0f) {
                G0();
                yxaVar.d(0);
                ygf.f("All children of a RecyclerView using CarouselLayoutManager must use MaskableFrameLayout as their root ViewGroup.");
                return;
            }
        }
        k0(yxaVar);
    }

    @Override // defpackage.sxa
    public final void f0(eya eyaVar) {
        if (v() == 0) {
            return;
        }
        sxa.H(u(0));
    }

    @Override // defpackage.sxa
    public final int j(eya eyaVar) {
        v();
        return 0;
    }

    @Override // defpackage.sxa
    public final int k(eya eyaVar) {
        return 0;
    }

    @Override // defpackage.sxa
    public final int l(eya eyaVar) {
        return 0;
    }

    @Override // defpackage.sxa
    public final int m(eya eyaVar) {
        v();
        return 0;
    }

    @Override // defpackage.sxa
    public final int n(eya eyaVar) {
        return 0;
    }

    @Override // defpackage.sxa
    public final int o(eya eyaVar) {
        return 0;
    }

    @Override // defpackage.sxa
    public final boolean o0(RecyclerView recyclerView, View view, Rect rect, boolean z, boolean z2) {
        return false;
    }

    @Override // defpackage.sxa
    public final int q0(int i, yxa yxaVar, eya eyaVar) {
        if (!F0() || v() == 0 || i == 0) {
            return 0;
        }
        yxaVar.d(0);
        ygf.f("All children of a RecyclerView using CarouselLayoutManager must use MaskableFrameLayout as their root ViewGroup.");
        return 0;
    }

    @Override // defpackage.sxa
    public final txa r() {
        return new txa(-2, -2);
    }

    @Override // defpackage.sxa
    public final int s0(int i, yxa yxaVar, eya eyaVar) {
        if (!e() || v() == 0 || i == 0) {
            return 0;
        }
        yxaVar.d(0);
        ygf.f("All children of a RecyclerView using CarouselLayoutManager must use MaskableFrameLayout as their root ViewGroup.");
        return 0;
    }

    @Override // defpackage.sxa
    public final void y(Rect rect, View view) {
        super.y(rect, view);
        rect.centerY();
        if (F0()) {
            rect.centerX();
        }
        throw null;
    }

    @Override // defpackage.sxa
    public final void r0(int i) {
    }

    public CarouselLayoutManager() {
        l80 l80Var = new l80();
        new l71();
        this.r = new jg9(2, this);
        this.p = l80Var;
        p0();
        H0(0);
    }
}
