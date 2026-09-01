package defpackage;

import android.content.Context;
import android.graphics.PointF;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.LinearInterpolator;
import androidx.recyclerview.widget.RecyclerView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class vz6 {
    public int a = -1;
    public RecyclerView b;
    public sxa c;
    public boolean d;
    public boolean e;
    public View f;
    public final cya g;
    public boolean h;
    public final LinearInterpolator i;
    public final DecelerateInterpolator j;
    public PointF k;
    public final DisplayMetrics l;
    public boolean m;
    public float n;
    public int o;
    public int p;

    public vz6(Context context) {
        cya cyaVar = new cya();
        cyaVar.d = -1;
        cyaVar.f = false;
        cyaVar.g = 0;
        cyaVar.a = 0;
        cyaVar.b = 0;
        cyaVar.c = Integer.MIN_VALUE;
        cyaVar.e = null;
        this.g = cyaVar;
        this.i = new LinearInterpolator();
        this.j = new DecelerateInterpolator();
        this.m = false;
        this.o = 0;
        this.p = 0;
        this.l = context.getResources().getDisplayMetrics();
    }

    public int a(int i, int i2, int i3, int i4, int i5) {
        if (i5 == -1) {
            return i3 - i;
        }
        if (i5 != 0) {
            if (i5 == 1) {
                return i4 - i2;
            }
            ay0.e("snap preference should be one of the constants defined in SmoothScroller, starting with SNAP_");
            return 0;
        }
        int i6 = i3 - i;
        if (i6 > 0) {
            return i6;
        }
        int i7 = i4 - i2;
        if (i7 < 0) {
            return i7;
        }
        return 0;
    }

    public int b(View view, int i) {
        sxa sxaVar = this.c;
        if (sxaVar == null || !sxaVar.d()) {
            return 0;
        }
        txa txaVar = (txa) view.getLayoutParams();
        return a((view.getLeft() - ((txa) view.getLayoutParams()).b.left) - ((ViewGroup.MarginLayoutParams) txaVar).leftMargin, view.getRight() + ((txa) view.getLayoutParams()).b.right + ((ViewGroup.MarginLayoutParams) txaVar).rightMargin, sxaVar.E(), sxaVar.n - sxaVar.F(), i);
    }

    public int c(View view, int i) {
        sxa sxaVar = this.c;
        if (sxaVar == null || !sxaVar.e()) {
            return 0;
        }
        txa txaVar = (txa) view.getLayoutParams();
        return a(sxa.B(view) - ((ViewGroup.MarginLayoutParams) txaVar).topMargin, view.getBottom() + ((txa) view.getLayoutParams()).b.bottom + ((ViewGroup.MarginLayoutParams) txaVar).bottomMargin, sxaVar.G(), sxaVar.o - sxaVar.D(), i);
    }

    public final int d(int i) {
        float fAbs = Math.abs(i);
        if (!this.m) {
            this.n = 25.0f / this.l.densityDpi;
            this.m = true;
        }
        return (int) Math.ceil(fAbs * this.n);
    }

    public PointF e(int i) {
        Object obj = this.c;
        if (obj instanceof dya) {
            return ((dya) obj).a(i);
        }
        Log.w("RecyclerView", "You should override computeScrollVectorForPosition when the LayoutManager does not implement " + dya.class.getCanonicalName());
        return null;
    }

    public int f() {
        PointF pointF = this.k;
        if (pointF == null) {
            return 0;
        }
        float f = pointF.y;
        if (f == 0.0f) {
            return 0;
        }
        return f > 0.0f ? 1 : -1;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x013e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void g(int r13, int r14) {
        /*
            Method dump skipped, instruction units count: 347
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vz6.g(int, int):void");
    }

    public final void h() {
        if (this.e) {
            this.e = false;
            this.p = 0;
            this.o = 0;
            this.k = null;
            this.b.u0.a = -1;
            this.f = null;
            this.a = -1;
            this.d = false;
            sxa sxaVar = this.c;
            if (sxaVar.e == this) {
                sxaVar.e = null;
            }
            this.c = null;
            this.b = null;
        }
    }
}
