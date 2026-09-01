package defpackage;

import android.os.Bundle;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fo0 extends l4 {
    public final /* synthetic */ int d;
    public final /* synthetic */ Object e;

    public /* synthetic */ fo0(int i, Object obj) {
        this.d = i;
        this.e = obj;
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0025  */
    @Override // defpackage.l4
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void c(android.view.View r2, android.view.accessibility.AccessibilityEvent r3) {
        /*
            r1 = this;
            int r0 = r1.d
            switch(r0) {
                case 2: goto L9;
                default: goto L5;
            }
        L5:
            super.c(r2, r3)
            return
        L9:
            java.lang.Object r0 = r1.e
            fve r0 = (defpackage.fve) r0
            super.c(r2, r3)
            java.lang.Class<fve> r1 = defpackage.fve.class
            java.lang.String r1 = r1.getName()
            r3.setClassName(r1)
            ny8 r1 = r0.e
            if (r1 == 0) goto L25
            int r1 = r1.a()
            r2 = 1
            if (r1 <= r2) goto L25
            goto L26
        L25:
            r2 = 0
        L26:
            r3.setScrollable(r2)
            int r1 = r3.getEventType()
            r2 = 4096(0x1000, float:5.74E-42)
            if (r1 != r2) goto L46
            ny8 r1 = r0.e
            if (r1 == 0) goto L46
            int r1 = r1.a()
            r3.setItemCount(r1)
            int r1 = r0.f
            r3.setFromIndex(r1)
            int r1 = r0.f
            r3.setToIndex(r1)
        L46:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fo0.c(android.view.View, android.view.accessibility.AccessibilityEvent):void");
    }

    @Override // defpackage.l4
    public final void d(View view, y4 y4Var) {
        int i = this.d;
        boolean z = false;
        Object obj = this.e;
        View.AccessibilityDelegate accessibilityDelegate = this.a;
        switch (i) {
            case 0:
                AccessibilityNodeInfo accessibilityNodeInfo = y4Var.a;
                accessibilityDelegate.onInitializeAccessibilityNodeInfo(view, accessibilityNodeInfo);
                y4Var.a(1048576);
                accessibilityNodeInfo.setDismissable(true);
                break;
            case 1:
                AccessibilityNodeInfo accessibilityNodeInfo2 = y4Var.a;
                accessibilityDelegate.onInitializeAccessibilityNodeInfo(view, accessibilityNodeInfo2);
                if (!((cw0) obj).k) {
                    accessibilityNodeInfo2.setDismissable(false);
                } else {
                    y4Var.a(1048576);
                    accessibilityNodeInfo2.setDismissable(true);
                }
                break;
            default:
                accessibilityDelegate.onInitializeAccessibilityNodeInfo(view, y4Var.a);
                y4Var.i(fve.class.getName());
                fve fveVar = (fve) obj;
                ny8 ny8Var = fveVar.e;
                if (ny8Var != null && ny8Var.a() > 1) {
                    z = true;
                }
                y4Var.p(z);
                if (fveVar.canScrollHorizontally(1)) {
                    y4Var.a(4096);
                }
                if (fveVar.canScrollHorizontally(-1)) {
                    y4Var.a(8192);
                }
                break;
        }
    }

    @Override // defpackage.l4
    public final boolean g(View view, int i, Bundle bundle) {
        int i2 = this.d;
        Object obj = this.e;
        switch (i2) {
            case 0:
                if (i == 1048576) {
                    ((ahc) ((jo0) obj)).a(3);
                }
                break;
            case 1:
                if (i == 1048576) {
                    cw0 cw0Var = (cw0) obj;
                    if (cw0Var.k) {
                        cw0Var.cancel();
                    }
                }
                break;
            default:
                fve fveVar = (fve) obj;
                if (!super.g(view, i, bundle)) {
                    if (i == 4096) {
                        if (fveVar.canScrollHorizontally(1)) {
                            fveVar.setCurrentItem(fveVar.f + 1);
                        }
                    } else if (i == 8192 && fveVar.canScrollHorizontally(-1)) {
                        fveVar.setCurrentItem(fveVar.f - 1);
                    }
                    break;
                }
                break;
        }
        return super.g(view, i, bundle);
    }
}
