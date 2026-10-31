package androidx.recyclerview.widget;

import android.view.View;
import java.util.concurrent.ExecutorService;

/* loaded from: classes2.dex */
public abstract class c {

    /* renamed from: b, reason: collision with root package name */
    public static ExecutorService f14917b;

    /* renamed from: a, reason: collision with root package name */
    public static final Object f14916a = new Object();

    /* renamed from: c, reason: collision with root package name */
    public static final q f14918c = new q();

    public static int a(o2 o2Var, f1 f1Var, View view, View view2, z1 z1Var, boolean z11) {
        if (z1Var.getChildCount() == 0 || o2Var.b() == 0 || view == null || view2 == null) {
            return 0;
        }
        if (!z11) {
            return Math.abs(z1Var.getPosition(view) - z1Var.getPosition(view2)) + 1;
        }
        return Math.min(f1Var.l(), f1Var.b(view2) - f1Var.e(view));
    }

    public static int b(o2 o2Var, f1 f1Var, View view, View view2, z1 z1Var, boolean z11, boolean z12) {
        if (z1Var.getChildCount() == 0 || o2Var.b() == 0 || view == null || view2 == null) {
            return 0;
        }
        int iMax = z12 ? Math.max(0, (o2Var.b() - Math.max(z1Var.getPosition(view), z1Var.getPosition(view2))) - 1) : Math.max(0, Math.min(z1Var.getPosition(view), z1Var.getPosition(view2)));
        if (z11) {
            return Math.round((iMax * (Math.abs(f1Var.b(view2) - f1Var.e(view)) / (Math.abs(z1Var.getPosition(view) - z1Var.getPosition(view2)) + 1))) + (f1Var.k() - f1Var.e(view)));
        }
        return iMax;
    }

    public static int c(o2 o2Var, f1 f1Var, View view, View view2, z1 z1Var, boolean z11) {
        if (z1Var.getChildCount() == 0 || o2Var.b() == 0 || view == null || view2 == null) {
            return 0;
        }
        if (!z11) {
            return o2Var.b();
        }
        return (int) (((f1Var.b(view2) - f1Var.e(view)) / (Math.abs(z1Var.getPosition(view) - z1Var.getPosition(view2)) + 1)) * o2Var.b());
    }

    public static void d(RecyclerView recyclerView) {
        recyclerView.dispatchOnScrolled(0, 0);
    }
}
