package defpackage;

import android.app.Activity;
import android.app.FragmentManager;
import android.os.Build;
import defpackage.f5b;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class d5b {
    /* JADX WARN: Multi-variable type inference failed */
    public static void a(Activity activity, ux6 ux6Var) {
        ux6Var.getClass();
        if (activity instanceof iy6) {
            wx6 lifecycle = ((iy6) activity).getLifecycle();
            if (lifecycle instanceof ky6) {
                ((ky6) lifecycle).e(ux6Var);
            }
        }
    }

    public static void b(Activity activity) {
        if (Build.VERSION.SDK_INT >= 29) {
            f5b.a.Companion.getClass();
            e5b.a(activity);
        }
        FragmentManager fragmentManager = activity.getFragmentManager();
        if (fragmentManager.findFragmentByTag("androidx.lifecycle.LifecycleDispatcher.report_fragment_tag") == null) {
            fragmentManager.beginTransaction().add(new f5b(), "androidx.lifecycle.LifecycleDispatcher.report_fragment_tag").commit();
            fragmentManager.executePendingTransactions();
        }
    }
}
