package defpackage;

import android.view.View;
import android.view.ViewParent;
import com.google.android.material.behavior.SwipeDismissBehavior;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a5d extends no7 {
    public int f;
    public int g = -1;
    public final /* synthetic */ SwipeDismissBehavior h;

    public a5d(SwipeDismissBehavior swipeDismissBehavior) {
        this.h = swipeDismissBehavior;
    }

    @Override // defpackage.no7
    public final void A(int i) {
        md5 md5Var = this.h.b;
        if (md5Var != null) {
            go0 go0Var = ((jo0) md5Var.b).t;
            if (i == 0) {
                o2b.k().H(go0Var);
            } else if (i == 1 || i == 2) {
                o2b.k().B(go0Var);
            }
        }
    }

    @Override // defpackage.no7
    public final void B(View view, int i, int i2) {
        float width = view.getWidth();
        SwipeDismissBehavior swipeDismissBehavior = this.h;
        float f = width * swipeDismissBehavior.f;
        float width2 = view.getWidth() * swipeDismissBehavior.g;
        float fAbs = Math.abs(i - this.f);
        if (fAbs <= f) {
            view.setAlpha(1.0f);
        } else if (fAbs >= width2) {
            view.setAlpha(0.0f);
        } else {
            view.setAlpha(Math.min(Math.max(0.0f, 1.0f - ((fAbs - f) / (width2 - f))), 1.0f));
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0050  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0065  */
    @Override // defpackage.no7
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void C(android.view.View r9, float r10, float r11) {
        /*
            r8 = this;
            r11 = -1
            r8.g = r11
            int r11 = r9.getWidth()
            r0 = 0
            int r1 = (r10 > r0 ? 1 : (r10 == r0 ? 0 : -1))
            r2 = 0
            com.google.android.material.behavior.SwipeDismissBehavior r3 = r8.h
            r4 = 1
            if (r1 == 0) goto L37
            int r5 = r9.getLayoutDirection()
            if (r5 != r4) goto L18
            r5 = r4
            goto L19
        L18:
            r5 = r2
        L19:
            int r6 = r3.e
            r7 = 2
            if (r6 != r7) goto L1f
            goto L50
        L1f:
            if (r6 != 0) goto L2b
            if (r5 == 0) goto L28
            int r1 = (r10 > r0 ? 1 : (r10 == r0 ? 0 : -1))
            if (r1 >= 0) goto L65
            goto L50
        L28:
            if (r1 <= 0) goto L65
            goto L50
        L2b:
            if (r6 != r4) goto L65
            if (r5 == 0) goto L32
            if (r1 <= 0) goto L65
            goto L50
        L32:
            int r1 = (r10 > r0 ? 1 : (r10 == r0 ? 0 : -1))
            if (r1 >= 0) goto L65
            goto L50
        L37:
            int r1 = r9.getLeft()
            int r5 = r8.f
            int r1 = r1 - r5
            int r5 = r9.getWidth()
            float r5 = (float) r5
            r6 = 1056964608(0x3f000000, float:0.5)
            float r5 = r5 * r6
            int r5 = java.lang.Math.round(r5)
            int r1 = java.lang.Math.abs(r1)
            if (r1 < r5) goto L65
        L50:
            int r10 = (r10 > r0 ? 1 : (r10 == r0 ? 0 : -1))
            if (r10 < 0) goto L5f
            int r10 = r9.getLeft()
            int r0 = r8.f
            if (r10 >= r0) goto L5d
            goto L5f
        L5d:
            int r0 = r0 + r11
            goto L63
        L5f:
            int r8 = r8.f
            int r0 = r8 - r11
        L63:
            r2 = r4
            goto L67
        L65:
            int r0 = r8.f
        L67:
            cue r8 = r3.a
            int r10 = r9.getTop()
            boolean r8 = r8.n(r0, r10)
            if (r8 == 0) goto L7c
            l0c r8 = new l0c
            r8.<init>(r3, r9, r2)
            r9.postOnAnimation(r8)
            return
        L7c:
            if (r2 == 0) goto L85
            md5 r8 = r3.b
            if (r8 == 0) goto L85
            r8.t(r9)
        L85:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.a5d.C(android.view.View, float, float):void");
    }

    @Override // defpackage.no7
    public final boolean F(View view, int i) {
        int i2 = this.g;
        return (i2 == -1 || i2 == i) && this.h.v(view);
    }

    @Override // defpackage.no7
    public final int j(View view, int i) {
        int width;
        int width2;
        boolean z = view.getLayoutDirection() == 1;
        int i2 = this.h.e;
        if (i2 == 0) {
            width = this.f;
            if (z) {
                width -= view.getWidth();
                width2 = this.f;
            } else {
                width2 = view.getWidth() + width;
            }
        } else {
            int i3 = this.f;
            if (i2 != 1) {
                width = i3 - view.getWidth();
                width2 = this.f + view.getWidth();
            } else if (z) {
                width2 = view.getWidth() + i3;
                width = i3;
            } else {
                width = i3 - view.getWidth();
                width2 = this.f;
            }
        }
        return Math.min(Math.max(width, i), width2);
    }

    @Override // defpackage.no7
    public final int k(View view, int i) {
        return view.getTop();
    }

    @Override // defpackage.no7
    public final int w(View view) {
        return view.getWidth();
    }

    @Override // defpackage.no7
    public final void z(View view, int i) {
        this.g = i;
        this.f = view.getLeft();
        ViewParent parent = view.getParent();
        if (parent != null) {
            SwipeDismissBehavior swipeDismissBehavior = this.h;
            swipeDismissBehavior.d = true;
            parent.requestDisallowInterceptTouchEvent(true);
            swipeDismissBehavior.d = false;
        }
    }
}
