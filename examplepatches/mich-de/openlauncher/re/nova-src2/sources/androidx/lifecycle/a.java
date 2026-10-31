package androidx.lifecycle;

import android.app.Activity;
import android.app.FragmentManager;
import android.os.Build;
import androidx.lifecycle.ReportFragment;
import h6.a0;
import h6.c0;
import h6.s;
import h6.u;
import kotlin.jvm.internal.Intrinsics;
import n4.i;

/* loaded from: classes.dex */
public abstract class a {
    /* JADX WARN: Multi-variable type inference failed */
    public static void a(Activity activity, s event) {
        Intrinsics.g(event, "event");
        if (activity instanceof a0) {
            u lifecycle = ((a0) activity).getLifecycle();
            if (lifecycle instanceof c0) {
                ((c0) lifecycle).f(event);
            }
        }
    }

    public static void b(i iVar) {
        if (Build.VERSION.SDK_INT >= 29) {
            ReportFragment.a.Companion.getClass();
            iVar.registerActivityLifecycleCallbacks(new ReportFragment.a());
        }
        FragmentManager fragmentManager = iVar.getFragmentManager();
        if (fragmentManager.findFragmentByTag("androidx.lifecycle.LifecycleDispatcher.report_fragment_tag") == null) {
            fragmentManager.beginTransaction().add(new ReportFragment(), "androidx.lifecycle.LifecycleDispatcher.report_fragment_tag").commit();
            fragmentManager.executePendingTransactions();
        }
    }
}
