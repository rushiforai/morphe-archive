package defpackage;

import android.net.TrafficStats;
import android.view.View;
import android.widget.RelativeLayout;
import com.google.android.material.sidesheet.SideSheetBehavior;
import java.lang.ref.WeakReference;
import java.util.function.IntConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class yy implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ int b;
    public final /* synthetic */ Object c;

    public /* synthetic */ yy(int i, Runnable runnable) {
        this.a = 2;
        this.b = i;
        this.c = runnable;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        int i2 = this.b;
        Object obj = this.c;
        switch (i) {
            case 0:
                ((IntConsumer) obj).accept(i2);
                return;
            case 1:
                cw5 cw5Var = (cw5) obj;
                cw5Var.setLayoutParams(new RelativeLayout.LayoutParams(cw5Var.getLayoutParams().width, nk7.w0(i2 * cw5Var.getResources().getDisplayMetrics().density)));
                return;
            case 2:
                Runnable runnable = (Runnable) obj;
                int threadStatsTag = TrafficStats.getThreadStatsTag();
                TrafficStats.setThreadStatsTag(i2);
                try {
                    runnable.run();
                    return;
                } finally {
                    TrafficStats.setThreadStatsTag(threadStatsTag);
                }
            case 3:
                ((h30) obj).v(i2);
                return;
            default:
                SideSheetBehavior sideSheetBehavior = (SideSheetBehavior) obj;
                WeakReference weakReference = sideSheetBehavior.p;
                View view = weakReference != null ? (View) weakReference.get() : null;
                if (view != null) {
                    sideSheetBehavior.y(view, i2, false);
                    return;
                }
                return;
        }
    }

    public /* synthetic */ yy(int i, int i2, Object obj) {
        this.a = i2;
        this.c = obj;
        this.b = i;
    }
}
