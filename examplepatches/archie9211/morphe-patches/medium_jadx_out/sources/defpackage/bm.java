package defpackage;

import android.content.Context;
import android.os.Build;
import android.view.accessibility.AccessibilityManager;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bm implements s4 {
    public final AccessibilityManager a;

    public bm(Context context) {
        Object systemService = context.getSystemService("accessibility");
        systemService.getClass();
        this.a = (AccessibilityManager) systemService;
    }

    public final long a(long j, boolean z) {
        if (j < 2147483647L) {
            int i = z ? 7 : 3;
            int i2 = Build.VERSION.SDK_INT;
            AccessibilityManager accessibilityManager = this.a;
            if (i2 >= 29) {
                int iP = nm.p(accessibilityManager, (int) j, i);
                if (iP == Integer.MAX_VALUE) {
                    return Long.MAX_VALUE;
                }
                return iP;
            }
            if (z && accessibilityManager.isTouchExplorationEnabled()) {
                return Long.MAX_VALUE;
            }
        }
        return j;
    }
}
