package defpackage;

import android.view.View;
import android.view.ViewGroup;
import androidx.constraintlayout.widget.ConstraintLayout;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u52 implements ro0 {
    public final ConstraintLayout a;
    public int b;
    public int c;
    public int d;
    public int e;
    public int f;
    public int g;
    public final /* synthetic */ ConstraintLayout h;

    public u52(ConstraintLayout constraintLayout, ConstraintLayout constraintLayout2) {
        this.h = constraintLayout;
        this.a = constraintLayout2;
    }

    public static boolean c(int i, int i2, int i3) {
        if (i == i2) {
            return true;
        }
        int mode = View.MeasureSpec.getMode(i);
        int mode2 = View.MeasureSpec.getMode(i2);
        int size = View.MeasureSpec.getSize(i2);
        if (mode2 == 1073741824) {
            return (mode == Integer.MIN_VALUE || mode == 0) && i3 == size;
        }
        return false;
    }

    @Override // defpackage.ro0
    public final void a() {
        ConstraintLayout constraintLayout = this.a;
        ArrayList arrayList = constraintLayout.b;
        int childCount = constraintLayout.getChildCount();
        for (int i = 0; i < childCount; i++) {
            constraintLayout.getChildAt(i);
        }
        int size = arrayList.size();
        if (size > 0) {
            for (int i2 = 0; i2 < size; i2++) {
                ((p52) arrayList.get(i2)).getClass();
            }
        }
    }

    @Override // defpackage.ro0
    public final void b(b72 b72Var, qo0 qo0Var) {
        int iMakeMeasureSpec;
        int iMakeMeasureSpec2;
        int baseline;
        int iMax;
        int iMax2;
        boolean z;
        int i;
        int childMeasureSpec;
        if (b72Var == null) {
            return;
        }
        l52 l52Var = b72Var.L;
        l52 l52Var2 = b72Var.J;
        if (b72Var.i0 == 8) {
            qo0Var.e = 0;
            qo0Var.f = 0;
            qo0Var.g = 0;
            return;
        }
        if (b72Var.V == null) {
            return;
        }
        i7c i7cVar = ConstraintLayout.p;
        a72 a72Var = qo0Var.a;
        a72 a72Var2 = qo0Var.b;
        int i2 = qo0Var.c;
        int i3 = qo0Var.d;
        int i4 = this.b + this.c;
        int i5 = this.d;
        View view = (View) b72Var.h0;
        int[] iArr = r52.a;
        int i6 = iArr[a72Var.ordinal()];
        if (i6 != 1) {
            if (i6 == 2) {
                childMeasureSpec = ViewGroup.getChildMeasureSpec(this.f, i5, -2);
            } else if (i6 == 3) {
                int i7 = this.f;
                int i8 = l52Var2 != null ? l52Var2.g : 0;
                if (l52Var != null) {
                    i8 += l52Var.g;
                }
                childMeasureSpec = ViewGroup.getChildMeasureSpec(i7, i5 + i8, -1);
            } else if (i6 != 4) {
                iMakeMeasureSpec = 0;
            } else {
                iMakeMeasureSpec = ViewGroup.getChildMeasureSpec(this.f, i5, -2);
                boolean z2 = b72Var.s == 1;
                int i9 = qo0Var.j;
                if (i9 == 1 || i9 == 2) {
                    boolean z3 = view.getMeasuredHeight() == b72Var.l();
                    if (qo0Var.j == 2 || !z2 || ((z2 && z3) || b72Var.B())) {
                        childMeasureSpec = View.MeasureSpec.makeMeasureSpec(b72Var.r(), 1073741824);
                    }
                }
            }
            iMakeMeasureSpec = childMeasureSpec;
        } else {
            iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(i2, 1073741824);
        }
        int i10 = iArr[a72Var2.ordinal()];
        if (i10 == 1) {
            iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(i3, 1073741824);
        } else if (i10 == 2) {
            iMakeMeasureSpec2 = ViewGroup.getChildMeasureSpec(this.g, i4, -2);
        } else if (i10 == 3) {
            int i11 = this.g;
            int i12 = l52Var2 != null ? b72Var.K.g : 0;
            if (l52Var != null) {
                i12 += b72Var.M.g;
            }
            iMakeMeasureSpec2 = ViewGroup.getChildMeasureSpec(i11, i4 + i12, -1);
        } else if (i10 != 4) {
            iMakeMeasureSpec2 = 0;
        } else {
            iMakeMeasureSpec2 = ViewGroup.getChildMeasureSpec(this.g, i4, -2);
            boolean z4 = b72Var.t == 1;
            int i13 = qo0Var.j;
            if (i13 == 1 || i13 == 2) {
                boolean z5 = view.getMeasuredWidth() == b72Var.r();
                if (qo0Var.j == 2 || !z4 || ((z4 && z5) || b72Var.C())) {
                    iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(b72Var.l(), 1073741824);
                }
            }
        }
        c72 c72Var = b72Var.V;
        ConstraintLayout constraintLayout = this.h;
        if (c72Var != null && bgf.x(constraintLayout.i, 256) && view.getMeasuredWidth() == b72Var.r() && view.getMeasuredWidth() < c72Var.r() && view.getMeasuredHeight() == b72Var.l() && view.getMeasuredHeight() < c72Var.l() && view.getBaseline() == b72Var.c0 && !b72Var.A() && c(b72Var.H, iMakeMeasureSpec, b72Var.r()) && c(b72Var.I, iMakeMeasureSpec2, b72Var.l())) {
            qo0Var.e = b72Var.r();
            qo0Var.f = b72Var.l();
            qo0Var.g = b72Var.c0;
            return;
        }
        a72 a72Var3 = a72.MATCH_CONSTRAINT;
        boolean z6 = a72Var == a72Var3;
        boolean z7 = a72Var2 == a72Var3;
        a72 a72Var4 = a72.MATCH_PARENT;
        boolean z8 = a72Var2 == a72Var4 || a72Var2 == a72.FIXED;
        boolean z9 = a72Var == a72Var4 || a72Var == a72.FIXED;
        boolean z10 = z6 && b72Var.Y > 0.0f;
        boolean z11 = z7 && b72Var.Y > 0.0f;
        if (view == null) {
            return;
        }
        t52 t52Var = (t52) view.getLayoutParams();
        int i14 = qo0Var.j;
        if (i14 != 1 && i14 != 2 && z6 && b72Var.s == 0 && z7 && b72Var.t == 0) {
            i = -1;
            z = false;
            baseline = 0;
            iMax = 0;
            iMax2 = 0;
        } else {
            view.measure(iMakeMeasureSpec, iMakeMeasureSpec2);
            b72Var.H = iMakeMeasureSpec;
            b72Var.I = iMakeMeasureSpec2;
            b72Var.g = false;
            int measuredWidth = view.getMeasuredWidth();
            int measuredHeight = view.getMeasuredHeight();
            baseline = view.getBaseline();
            int i15 = b72Var.v;
            iMax = i15 > 0 ? Math.max(i15, measuredWidth) : measuredWidth;
            int i16 = b72Var.w;
            if (i16 > 0) {
                iMax = Math.min(i16, iMax);
            }
            int i17 = b72Var.y;
            iMax2 = i17 > 0 ? Math.max(i17, measuredHeight) : measuredHeight;
            int i18 = iMakeMeasureSpec2;
            int i19 = b72Var.z;
            if (i19 > 0) {
                iMax2 = Math.min(i19, iMax2);
            }
            if (!bgf.x(constraintLayout.i, 1)) {
                if (z10 && z8) {
                    iMax = (int) ((iMax2 * b72Var.Y) + 0.5f);
                } else if (z11 && z9) {
                    iMax2 = (int) ((iMax / b72Var.Y) + 0.5f);
                }
            }
            if (measuredWidth == iMax && measuredHeight == iMax2) {
                i = -1;
                z = false;
            } else {
                if (measuredWidth != iMax) {
                    iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(iMax, 1073741824);
                }
                int iMakeMeasureSpec3 = measuredHeight != iMax2 ? View.MeasureSpec.makeMeasureSpec(iMax2, 1073741824) : i18;
                view.measure(iMakeMeasureSpec, iMakeMeasureSpec3);
                b72Var.H = iMakeMeasureSpec;
                b72Var.I = iMakeMeasureSpec3;
                z = false;
                b72Var.g = false;
                iMax = view.getMeasuredWidth();
                iMax2 = view.getMeasuredHeight();
                baseline = view.getBaseline();
                i = -1;
            }
        }
        boolean z12 = baseline != i ? true : z;
        qo0Var.i = (iMax == qo0Var.c && iMax2 == qo0Var.d) ? z : true;
        if (t52Var.c0) {
            z12 = true;
        }
        if (z12 && baseline != -1 && b72Var.c0 != baseline) {
            qo0Var.i = true;
        }
        qo0Var.e = iMax;
        qo0Var.f = iMax2;
        qo0Var.h = z12;
        qo0Var.g = baseline;
    }
}
