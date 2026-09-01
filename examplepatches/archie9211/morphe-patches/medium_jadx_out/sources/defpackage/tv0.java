package defpackage;

import android.view.View;
import android.view.ViewGroup;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.android.material.sidesheet.SideSheetBehavior;
import java.lang.ref.WeakReference;
import java.util.Iterator;
import java.util.LinkedHashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tv0 extends no7 {
    public final /* synthetic */ int f;
    public final /* synthetic */ da2 g;

    public /* synthetic */ tv0(da2 da2Var, int i) {
        this.f = i;
        this.g = da2Var;
    }

    @Override // defpackage.no7
    public final void A(int i) {
        int i2 = this.f;
        da2 da2Var = this.g;
        switch (i2) {
            case 0:
                if (i == 1) {
                    BottomSheetBehavior bottomSheetBehavior = (BottomSheetBehavior) da2Var;
                    if (bottomSheetBehavior.L) {
                        bottomSheetBehavior.M(1);
                    }
                }
                break;
            default:
                if (i == 1) {
                    SideSheetBehavior sideSheetBehavior = (SideSheetBehavior) da2Var;
                    if (sideSheetBehavior.g) {
                        sideSheetBehavior.w(1);
                    }
                }
                break;
        }
    }

    @Override // defpackage.no7
    public final void B(View view, int i, int i2) {
        ViewGroup.MarginLayoutParams marginLayoutParams;
        int i3 = this.f;
        da2 da2Var = this.g;
        switch (i3) {
            case 0:
                ((BottomSheetBehavior) da2Var).z(i2);
                return;
            default:
                SideSheetBehavior sideSheetBehavior = (SideSheetBehavior) da2Var;
                WeakReference weakReference = sideSheetBehavior.q;
                View view2 = weakReference != null ? (View) weakReference.get() : null;
                if (view2 != null && (marginLayoutParams = (ViewGroup.MarginLayoutParams) view2.getLayoutParams()) != null) {
                    sideSheetBehavior.a.Z(marginLayoutParams, view.getLeft(), view.getRight());
                    view2.setLayoutParams(marginLayoutParams);
                }
                LinkedHashSet linkedHashSet = sideSheetBehavior.v;
                if (linkedHashSet.isEmpty()) {
                    return;
                }
                sideSheetBehavior.a.k(i);
                Iterator it2 = linkedHashSet.iterator();
                if (it2.hasNext()) {
                    throw ev6.q(it2);
                }
                return;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x002e  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00a7  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00cc  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00e5  */
    @Override // defpackage.no7
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void C(android.view.View r7, float r8, float r9) {
        /*
            Method dump skipped, instruction units count: 320
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tv0.C(android.view.View, float, float):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x0060  */
    @Override // defpackage.no7
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean F(android.view.View r5, int r6) {
        /*
            r4 = this;
            int r0 = r4.f
            r1 = 1
            da2 r4 = r4.g
            r2 = 0
            switch(r0) {
                case 0: goto L1d;
                default: goto L9;
            }
        L9:
            com.google.android.material.sidesheet.SideSheetBehavior r4 = (com.google.android.material.sidesheet.SideSheetBehavior) r4
            int r6 = r4.h
            if (r6 != r1) goto L10
            goto L1b
        L10:
            java.lang.ref.WeakReference r4 = r4.p
            if (r4 == 0) goto L1b
            java.lang.Object r4 = r4.get()
            if (r4 != r5) goto L1b
            goto L1c
        L1b:
            r1 = r2
        L1c:
            return r1
        L1d:
            com.google.android.material.bottomsheet.BottomSheetBehavior r4 = (com.google.android.material.bottomsheet.BottomSheetBehavior) r4
            int r0 = r4.P
            if (r0 != r1) goto L24
            goto L6e
        L24:
            boolean r3 = r4.g0
            if (r3 == 0) goto L29
            goto L6e
        L29:
            r3 = 3
            if (r0 != r3) goto L60
            int r0 = r4.d0
            if (r0 != r6) goto L60
            boolean r6 = r4.e
            r0 = 0
            if (r6 == 0) goto L41
            java.lang.ref.WeakReference r6 = r4.f0
            if (r6 == 0) goto L56
            java.lang.Object r6 = r6.get()
            r0 = r6
            android.view.View r0 = (android.view.View) r0
            goto L56
        L41:
            java.util.ArrayList r6 = r4.Z
            boolean r3 = r6.isEmpty()
            if (r3 != 0) goto L56
            java.lang.Object r6 = r6.get(r2)
            java.lang.ref.WeakReference r6 = (java.lang.ref.WeakReference) r6
            java.lang.Object r6 = r6.get()
            r0 = r6
            android.view.View r0 = (android.view.View) r0
        L56:
            if (r0 == 0) goto L60
            r6 = -1
            boolean r6 = r0.canScrollVertically(r6)
            if (r6 == 0) goto L60
            goto L6e
        L60:
            android.os.SystemClock.uptimeMillis()
            java.lang.ref.WeakReference r4 = r4.Y
            if (r4 == 0) goto L6e
            java.lang.Object r4 = r4.get()
            if (r4 != r5) goto L6e
            goto L6f
        L6e:
            r1 = r2
        L6f:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tv0.F(android.view.View, int):boolean");
    }

    @Override // defpackage.no7
    public final int j(View view, int i) {
        switch (this.f) {
            case 0:
                return view.getLeft();
            default:
                SideSheetBehavior sideSheetBehavior = (SideSheetBehavior) this.g;
                return ok7.w(i, sideSheetBehavior.a.v(), sideSheetBehavior.a.u());
        }
    }

    @Override // defpackage.no7
    public final int k(View view, int i) {
        switch (this.f) {
            case 0:
                return ok7.w(i, ((BottomSheetBehavior) this.g).D(), x());
            default:
                return view.getTop();
        }
    }

    @Override // defpackage.no7
    public int w(View view) {
        switch (this.f) {
            case 1:
                SideSheetBehavior sideSheetBehavior = (SideSheetBehavior) this.g;
                return sideSheetBehavior.l + sideSheetBehavior.o;
            default:
                return super.w(view);
        }
    }

    @Override // defpackage.no7
    public int x() {
        switch (this.f) {
            case 0:
                BottomSheetBehavior bottomSheetBehavior = (BottomSheetBehavior) this.g;
                return bottomSheetBehavior.J ? bottomSheetBehavior.X : bottomSheetBehavior.H;
            default:
                return super.x();
        }
    }
}
